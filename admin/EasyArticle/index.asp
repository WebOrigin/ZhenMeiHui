<!--#include file="../system/plugin.asp"-->
<%
dim art
set WebOrigin=new WebOriginCMS
WebOrigin.checkplugin WebOrigin.path '检查插件安装状态
set art=new easyarticle
	select case action
	case"" WebOrigin_def
	case"art" WebOrigin_art
	case"edt" WebOrigin_edt
	case"edtlist" WebOrigin_edtlist
	case"set","setlist" WebOrigin_set
	case"create" WebOrigin_create
	case"up","down" WebOrigin_updown
	end select
set art=nothing
set WebOrigin=nothing


sub WebOrigin_def()
	WebOrigin.head WebOrigin.path,art.lang("title")

	dim rs,data,i,dp'lpath:linkpath
	dim but,sql,listcount,inbut

	art.list

	sql="select listid,listname,listpath from WebOrigineasyart_list order by listorder desc,listid desc;"

	if len(WebOrigin.mapname)>0 then inbut="|-|createmaplist:"&encode(art.lang("common/createmaplist"))&"|createmappage:"&encode(art.lang("common/createmappage"))

	set dp=new record
		dp.action="index.asp?action=setlist"
		dp.create sql
		dp.but=dp.sect("createlist:"&encode(art.lang("common/createlist"))&"|createpage:"&encode(art.lang("common/createall"))&inbut&"|-|union:"&encode(art.lang("common/union")))&dp.prn & dp.plist
		dp.js="cklist(K[0])+'<a href=""index.asp?action=art&listid='+K[0]+'"" >'+K[0]+') '+K[1]+'</a>'"
		dp.js="K[3]"
		dp.js="'<a href="""&WebOrigin_system&"/system/link.asp?url='+K[2]+'"" target=""_blank"">'+K[2]+'</a>'"
		dp.js="edit('index.asp?action=edtlist&listid='+K[0])+updown('index.asp?listid='+K[0])"

		Il dp.open

		Il "<tr><th>"&art.lang("list/id")&") "&art.lang("list/listname")&"</th><th>"&art.lang("list/count")&"</th><th>"&art.lang("list/path")&"</th><th class=""w2"">"&art.lang("list/manage")&"</th></tr>"
		Il "<script>"
		for i=0 to dp.length
			listcount=conn.execute("select count(artid) from WebOrigineasyart where listid="&dp.data(0,i)&";")(0)
			Il "ll("&dp.data(0,i)&",'"&htm2js(htmlencode(dp.data(1,i)))&"','"&htm2js(WebOrigin.inst&dp.data(2,i))&"','"&listcount&"');"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing

	
end sub

sub WebOrigin_art()
	WebOrigin.head WebOrigin.path,art.lang("title")
	dim rs,data,i,dp,listid'lpath:linkpath
	dim but,sql,ispath,lpath,listpath
	listid=quest("listid",2)
	if len(listid)=0 then WebOrigin.error art("error/listid")

	set rs=conn.execute("select listpath from WebOrigineasyart_list where listid="&listid&";")
		if not rs.eof and not rs.bof then
			listpath=rs(0)
		else
			WebOrigin.error WebOrigin.lang("error/invalid")
		end if
		rs.close
	set rs=nothing

	art.list

	sql="select artid,arttitle from WebOrigineasyart where listid="&listid&" order by artorder desc,artid desc;"

	set dp=new record
		dp.create sql
		dp.purl="index.asp?action=art&pid=$&rn="&dp.rn&"&listid="&listid
		dp.but=dp.sect("create:"&encode(WebOrigin.lang("common/create"))&"|-|moveto:"&art.lang("common/moveto"))&dp.prn & dp.plist
		dp.js="cklist(K[0])+'<a href=""index.asp?action=edt&listid="&listid&"&artid='+K[0]+'"" >'+K[0]+') '+K[1]+'</a>'"
		dp.js="isexist(K[2],K[3],K[0])"
		dp.js="edit('index.asp?action=edt&listid="&listid&"&artid='+K[0])+updown('index.asp?listid="&listid&"&artid='+K[0],'art')"

		Il dp.open

		Il "<tr><th>"&art.lang("list/id")&") "&art.lang("list/title")&"</th><th>"&art.lang("list/file")&"</th><th class=""w2"">"&art.lang("list/manage")&"</th></tr>"
		Il "<script>"
		for i=0 to dp.length
			ispath=WebOrigin.isexist("../../"&listpath&"/"&art.initially&dp.data(0,i)&"/"&WebOrigin_ext)
			if ispath then
				lpath=WebOrigin_system&"system/link.asp?url="&server.urlencode(WebOrigin.inst&listpath&"/"&art.initially&dp.data(0,i))
			else
				lpath="index.asp?action=create&artid="&dp.data(0,i)
			end if
			Il "ll("&dp.data(0,i)&",'"&htm2js(htmlencode(dp.data(1,i)))&"','"&ispath&"','"&lpath&"');"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing

end sub

sub WebOrigin_create()
	WebOrigin.nocache
	WebOrigin.head WebOrigin.path,0
	dim I1,artid,rs,listpath
	artid=quest("artid",2)
	set rs=conn.execute("select artid,listid from WebOrigineasyart where artid="&artid)
		if not rs.eof and not rs.bof then
			art.createpage artid
			listpath=conn.execute("select listpath from WebOrigineasyart_list where listid="&rs(1))(0)
			I1="<a href="""&WebOrigin_system&"system/link.asp?url="&server.urlencode(WebOrigin.inst&listpath&"/"&art.initially&rs(0))&""" target=""_blank""><img src=""../system/images/os/brow.gif"" class=""os"" /></a>"
		else
			I1="<img src=""../system/images/os/error.gif"" class=""os""/>"
		end if
		rs.close
	set rs=nothing
	WebOrigin.txt I1
end sub

sub WebOrigin_set()
	WebOrigin.nocache
	WebOrigin.head WebOrigin.path,0
	dim list,rs,data,i,lists
	dim listpath,listid,ol,listids,artids
	dim newlist
	list=form("list")
	if len(list)>0 then
		if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end if

	'action=set 文章操作，action=setlist 列表操作

	select case form("submits")
	case"create" 
		if len(list)>0 then
			art.createpage list
			WebOrigin.flo art.lang("flo/createok"),1
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if
	case"createlist"
		if len(list)>0 then
			art.createlist list
			WebOrigin.flo art.lang("flo/createlistok"),0
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if
	case"createpage"
		if len(list)>0 then
			set rs=conn.execute("select artid from WebOrigineasyart where listid in ("&list&");")
				if not rs.eof and not rs.bof then
					data=rs.getrows()
					for i=0 to ubound(data,2)
						if len(artids)>0 then
							artids=artids&","&data(0,i)
						else
							artids=data(0,i)
						end if
					next
				end if
				rs.close
			set rs=nothing
			art.createlist list
			if len(artids)>0 then art.createpage artids
			WebOrigin.flo art.lang("flo/createpageok"),0
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if
	case"createmaplist"
		art.createmaplist
		WebOrigin.flo art.lang("flo/createmaplist")&" <a href=""../../"&art.path&".xml"" target=""_blank"">["&WebOrigin.lang("common/brow")&"]</a>",0
	case"createmappage"
		if len(list)>0 then
			lists=split(list,",")
			for i=0 to ubound(lists)
				art.createmappage lists(i)
			next
			WebOrigin.flo art.lang("flo/createmappage"),0
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if
	case"union"
		if len(list)>0 then
			newlist=form("newlist")
			if len(newlist)=0 then
				ol="<div id=""main"">"
				ol=ol&"<p><label>"&art.lang("label/newlist")&"</label>"
				ol=ol&"<select name=""newlist"" id=""WebOrigin_newlist"">"
				set rs=conn.execute("select listid,listname from WebOrigineasyart_list where listid in ("&list&") order by listorder desc")
					if not rs.eof and not rs.bof then
						data=rs.getrows()
						for i=0 to ubound(data,2)
							ol=ol&"<option value="""&data(0,i)&""">"&formencode(data(1,i))&"</option>"
						next
					end if
					rs.close
				set rs=nothing
				ol=ol&"</select>"
				ol=ol&"</p>"

				ol=ol&"<div class=""WO_menu""><input type=""button"" value="""&art.lang("list/move")&""" "
				ol=ol&"onclick=""javascript:posthtm('index.asp?action=set','flo','submits=union&newlist='+encodeURIComponent(document.getElementById('WebOrigin_newlist').value)+'&list="&list&"');"" />"
				ol=ol&"<input type=""button"" value="""&WebOrigin.lang("common/close")&""" onclick=""javascript:display('flo');""/>"
				ol=ol&"</div>"'end WO_but

				ol=ol&"</div>"'end WO_form
				WebOrigin.flo ol,2
				
			else
				conn.execute "update WebOrigineasyart set listid="&newlist&" where listid in ("&list&");"
				WebOrigin.flo art.lang("flo/unionok"),0
			end if
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if
	case"moveto"
		if len(list)>0 then
			newlist=form("newlist")
			if len(newlist)=0 then
				ol="<div id=""main"">"
				ol=ol&"<p><label>"&art.lang("label/newlist")&"</label>"
				ol=ol&"<select name=""newlist"" id=""WebOrigin_newlist"">"
				set rs=conn.execute("select listid,listname from WebOrigineasyart_list order by listorder desc")
					if not rs.eof and not rs.bof then
						data=rs.getrows()
						for i=0 to ubound(data,2)
							ol=ol&"<option value="""&data(0,i)&""">"&formencode(data(1,i))&"</option>"
						next
					end if
					rs.close
				set rs=nothing
				ol=ol&"</select>"
				ol=ol&"</p>"

				ol=ol&"<div class=""WO_menu""><input type=""button"" value="""&art.lang("list/move")&""" "
				ol=ol&"onclick=""javascript:posthtm('index.asp?action=set','flo','submits=moveto&newlist='+encodeURIComponent(document.getElementById('WebOrigin_newlist').value)+'&list="&list&"');"" />"
				ol=ol&"<input type=""button"" value="""&WebOrigin.lang("common/close")&""" onclick=""javascript:display('flo');""/>"
				ol=ol&"</div>"'end WO_but

				ol=ol&"</div>"'end WO_form
				WebOrigin.flo ol,2
			else
				'读取删除目录
				set rs=conn.execute("select listid,artid from WebOrigineasyart where artid in ("&list&")")
					if not rs.eof and not rs.bof then
						data=rs.getrows()
						for i=0 to ubound(data,2)
							WebOrigin.deletefolder "../../"&data(0,i)&"/"&data(1,i)
							if len(listids)>0 then
								if WebOrigin.instre(listids,data(0,i))=false then
									listids=listids&","&data(0,i)
								end if
							else
								listids=data(0,i)
							end if
						next
					end if
					rs.close
				set rs=nothing
				'数据移动
				conn.execute "update WebOrigineasyart set listid="&newlist&" where artid in ("&list&");"
				'重新生成文章
				art.createpage list
				'生成列表
				art.createlist listids
				WebOrigin.flo art.lang("flo/moveok"),1
			end if
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if
	case"delete"
		if len(list)>0 then
			if action="set" then
				set rs=conn.execute("select artid,listid from WebOrigineasyart where artid in ("&list&");")
					if not rs.eof and not rs.bof then
						data=rs.getrows()
						for i=0 to ubound(data,2)
							if cstr(listid)<>cstr(data(1,i)) then
								listpath=conn.execute("select listpath from WebOrigineasyart_list where listid="&data(1,i)&";")(0)
							end if
							listid=data(1,i)
							WebOrigin.deletefolder "../../"&listpath&"/"&art.initially&data(0,i)
						next
						conn.execute "delete from WebOrigineasyart where artid in ("&list&");"
					else
						WebOrigin.flo art.lang("flo/invalid"),1
					end if
					rs.close
				set rs=nothing
			else'删除list及list下面的文章
				set rs=conn.execute("select listid,listpath from WebOrigineasyart_list where listid in ("&list&");")
					if not rs.eof and not rs.bof then
						data=rs.getrows()
						for i=0 to ubound(data,2)
							WebOrigin.deletefolder "../../"&data(1,i)
						next
						conn.execute "delete from WebOrigineasyart_list where listid in ("&list&");"
						conn.execute "delete from WebOrigineasyart where listid in ("&list&");"
					else
						WebOrigin.flo art.lang("flo/invalid"),1
					end if
					rs.close
				set rs=nothing
			end if
			WebOrigin.flo art.lang("flo/deleteok"),1
		else
			WebOrigin.flo art.lang("flo/select"),0
		end if

	end select
end sub

sub WebOrigin_edt()
	WebOrigin.head WebOrigin.path,art.lang("title")

	dim rs,data,dataform,datalist,sql,i,artid,listid,artfrom,listids
	dim artdescription,artkeywords
	sql="arttitle,artcontent,artfrom"
	artid=quest("artid",2)
	if len(artid)=0 then artid=form("artid")
	if len(form("artid"))>0 then'若表单有值的情况下
		if validate(artid,2)=false then WebOrigin.error WebOrigin.lang("error/invalid")
	end if

	listid=quest("listid",2)
	if len(listid)=0 then listid=form("listid")
	if len(form("listid"))>0 then
		if validate(listid,2)=false then WebOrigin.error WebOrigin.lang("error/invalid")
	end if


	if len(listid)>0 then
		set rs=conn.execute("select artfrom from WebOrigineasyart_list where listid="&listid)
			if not rs.eof and not rs.bof then
				artfrom=rs(0)
			end if
			rs.close
		set rs=nothing
	end if

	if WebOrigin.ismethod or len(artid)=0 then
		dataform=split(sql,",")
		redim data(ubound(dataform),0)
		for i=0 to ubound(dataform)
			data(i,0)=form(dataform(i))
		next
	else
		set rs=conn.execute("select "&sql&" from WebOrigineasyart where artid="&artid&";")
			if not rs.eof and not rs.bof then
				data=rs.getrows()
			else
				WebOrigin.error WebOrigin.lang("error/invalid")
			end if
			rs.close
		set rs=nothing
	end if

	art.list
	Il "<form name=""form1"" method=""post"" action=""index.asp?action=edt"">"

	set rs=conn.execute("select listid,listname from WebOrigineasyart_list;")
		if not rs.eof and not rs.bof then
			datalist=rs.getrows()
		else
			WebOrigin.error  art.lang("error/notlist")
		end if
		rs.close
	set rs=nothing
	for i=0 to ubound(datalist,2)
		listids=listids&encode(datalist(0,i))&":"&encode(datalist(1,i))&"|"
	next
	WebOrigin.form_select "listid",art.lang("label/list"),listids,listid

	WebOrigin.form_input "arttitle",art.lang("label/title"),data(0,0),"arttitle|6|"&encode(art.lang("check/title"))&"|1-100"'article

	Il "<p><label>"&art.lang("label/from")&"</label><input type=""text"" name=""artfrom"" value="""&formencode(data(2,0))&""" class=""in3"" />"
	Il WebOrigin.form_eval("artfrom",art.lang("label/from1/originality"))
	Il WebOrigin.form_eval("artfrom",art.lang("label/from1/net"))
	if len(artfrom)>0 then
		Il WebOrigin.form_eval("artfrom",artfrom)
	end if
	Il WebOrigin.check("artfrom|6|"&encode(art.lang("check/from"))&"|1-100")&"</p>"

	Il WebOrigin.form_editor("artcontent",art.lang("label/content"),data(1,0),"artcontent|0|"&encode(art.lang("check/content")))
	
	WebOrigin.form_but "save"
	WebOrigin.form_hidden "artid",artid

	Il "</form>"

	if WebOrigin.ischeck and WebOrigin.ismethod then
		artdescription=left(WebOrigin.clshtml(data(1,0)),255)
		artkeywords=WebOrigin.key(data(0,0)&","&artdescription,"")
		if len(artid)>0 then
			conn.execute "update WebOrigineasyart set arttitle='"&safe(data(0,0))&"',artcontent='"&safe(data(1,0))&"',artfrom='"&safe(data(2,0))&"',listid="&listid&",artdescription='"&safe(artdescription)&"',artkeywords='"&safe(artkeywords)&"' where artid="&artid&";"
		else
			conn.execute "insert into WebOrigineasyart ("&sql&",artdate,artorder,listid,artdescription,artkeywords) values ('"&safe(data(0,0))&"','"&safe(data(1,0))&"','"&safe(data(2,0))&"','"&tnow&"',"&WebOrigin.neworder("WebOrigineasyart","artorder")&","&listid&",'"&safe(artdescription)&"','"&safe(artkeywords)&"')"
			artid=WebOrigin.newid("WebOrigineasyart","artid")
			conn.execute "update WebOrigineasyart_list set lastdate='"&tnow&"' where listid="&listid&";"
			if WebOrigin.instre(art.lang("label/form/net")&","&art.lang("label/form/originality"),data(2,0))=false then
				conn.execute "update WebOrigineasyart_list set artfrom='"&safe(data(2,0))&"' where listid="&listid&";"
			end if
			set rs=conn.execute("select listname,listpath from WebOrigineasyart_list where listid="&listid&";")
				if not rs.eof and not rs.bof then
					datalist=rs.getrows()
				end if
				rs.close
			set rs=nothing
			WebOrigin.letrss data(0,0),WebOrigin.inst&datalist(1,0)&"/"&art.initially&artid,0,data(1,0),0,0,datalist(0,0),0,data(2,0),tnow
			WebOrigin.createrss
			art.createmaplist
			art.createmappage listid
		end if
		'neworder：WebOrigin.neworder("WebOrigineasyart","artorder")
		art.createpage artid
		art.createlist listid
		
		Il "<script>confirm('"&htm2js(art.lang("alert/saveokart"))&"')?eval(""parent.location='index.asp?action=edt&listid="&listid&"'""):eval(""parent.location='index.asp?action=art&listid="&listid&"'"");</script>"
	end if
end sub

sub WebOrigin_edtlist()
	WebOrigin.head WebOrigin.path,art.lang("title")

	dim rs,data,dataform,sql,i,listid,checkpath
	sql="listname,listpath,listtemplate1,listtemplate2,pagetemplate1,pagetemplate2"'5
	listid=quest("listid",2)
	if len(listid)=0 then:listid=form("listid")
	if len(listid)>0 then'若有值的情况下
		if validate(listid,2)=false then WebOrigin.error WebOrigin.lang("error/invalid")
	end if
	
	if WebOrigin.ismethod or len(listid)=0 then
		dataform=split(sql,",")
		redim data(ubound(dataform),0)
		for i=0 to ubound(dataform)
			data(i,0)=form(dataform(i))
		next
	else
		set rs=conn.execute("select "&sql&" from WebOrigineasyart_list where listid="&listid&";")
			if not rs.eof and not rs.bof then
				data=rs.getrows()
			else
				WebOrigin.error WebOrigin.lang("error/invalid")
			end if
			rs.close
		set rs=nothing
	end if

	art.list
	Il "<form name=""form1"" method=""post"" action=""index.asp?action=edtlist"">"

	WebOrigin.form_input "listname",art.lang("list/listname"),data(0,0),"listname|6|"&encode(art.lang("check/listname"))&"|1-30"'article

	if len(listid)>0 then'更新
		checkpath="listpath|6|"&encode(art.lang("check/path"))&"|1-100;listpath|15|"&encode(art.lang("check/path1"))&";listpath|9|"&encode(art.lang("check/path2"))&"|select count(listid) from WebOrigineasyart_list where listpath='$pro$' and listid<>"&listid
	else
		checkpath="listpath|6|"&encode(art.lang("check/path"))&"|1-100;listpath|15|"&encode(art.lang("check/path1"))&";listpath|9|"&encode(art.lang("check/path2"))&"|select count(listid) from WebOrigineasyart_list where listpath='$pro$'"
	end if
	WebOrigin.form_input "listpath",art.lang("label/path"),data(1,0),checkpath

	WebOrigin.form_tmp "listtemplate1",art.lang("label/listtemplate1"),data(2,0),0
	WebOrigin.form_tmp "listtemplate2",art.lang("label/listtemplate2"),data(3,0),"easyarticle[list]"
	WebOrigin.form_tmp "pagetemplate1",art.lang("label/pagetemplate1"),data(4,0),0
	WebOrigin.form_tmp "pagetemplate2",art.lang("label/pagetemplate2"),data(5,0),"easyarticle[page]"

	WebOrigin.form_but "save"
	WebOrigin.form_hidden "listid",listid

	Il "</form>"

	if WebOrigin.ischeck and WebOrigin.ismethod then
		if len(listid)>0 then
			conn.execute "update WebOrigineasyart_list set listname='"&safe(data(0,0))&"',listpath='"&safe(data(1,0))&"',listtemplate1='"&safe(data(2,0))&"',listtemplate2='"&safe(data(3,0))&"',pagetemplate1='"&safe(data(4,0))&"',pagetemplate2='"&safe(data(5,0))&"' where listid="&listid&";"
		else
			conn.execute "insert into WebOrigineasyart_list ("&sql&",listorder) values ('"&safe(data(0,0))&"','"&safe(data(1,0))&"','"&safe(data(2,0))&"','"&safe(data(3,0))&"','"&safe(data(4,0))&"','"&safe(data(5,0))&"',"&WebOrigin.neworder("WebOrigineasyart_list","listorder")&")"
		end if
		art.createmaplist
		Il "<script>confirm('"&htm2js(art.lang("alert/saveok"))&"')?eval(""parent.location='index.asp?action=edtlist'""):eval(""parent.location='index.asp'"");</script>"
	end if
end sub

sub WebOrigin_updown()
	WebOrigin.head WebOrigin.path,0
	dim artid,listid
	artid=quest("artid",2)
	listid=quest("listid",2)

	if len(artid)>0 then
		WebOrigin.updown "WebOrigineasyart,artid,artorder",artid,"listid="&listid
	else
		WebOrigin.updown "WebOrigineasyart_list,listid,listorder",listid,0
	end if
end sub

%>