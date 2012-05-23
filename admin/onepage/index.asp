<!--#include file="../system/plugin.asp"-->
<%
dim one
set WebOrigin=new WebOriginCMS
WebOrigin.checkplugin WebOrigin.path '检查插件安装状态
set one=new onepage
	select case action
	case"" WebOrigin_def
	case"edt" WebOrigin_edt
	case"err" WebOrigin_edt
	'case"err" WebOrigin_err
	case"set" WebOrigin_set
	case"create" WebOrigin_create
	case"up","down" WebOrigin_updown
	case"insearch" WebOrigin_insearch
	end select
set one=nothing
set WebOrigin=nothing

sub WebOrigin_err()
	response.write("<script>alert('This function is under development.');parent.location='index.asp';</script>")
end sub

sub WebOrigin_insearch()
	WebOrigin.nocache
	WebOrigin.head WebOrigin.path,0
	WebOrigin.txt "<input type=""text"" onkeydown=""if(event.keyCode==13) {window.location='index.asp?query='+encodeURI(this.value); return false;}"" />"
end sub

sub WebOrigin_def()
	WebOrigin.head WebOrigin.path,one.lang("title")
	dim rs,data,i,dp,fpath,lpath,paths,ispath'lpath:linkpath
	dim but,sql,query,inbut

	one.list

	query=quest("query",0)
	if len(query)>0 then
		sql="select oneid,onename,onepath from WebOriginonepage where onename like '%"&safe(query)&"%' order by oneorder desc,oneid desc;"
	else
		sql="select oneid,onename,onepath from WebOriginonepage order by oneorder desc,oneid desc;"
	end if

	if len(WebOrigin.mapname)>0 then inbut="|createmap:"&encode(one.lang("common/createmap"))
	
	set dp=new record
		dp.create sql
		dp.but=dp.sect("create:"&encode(WebOrigin.lang("common/create"))&inbut)&dp.prn & dp.plist
		dp.js="cklist(K[0])+'<a href=""index.asp?action=edt&oneid='+K[0]+'"">'+K[0]+') '+K[1]+'</a>'"
		dp.js="isexist(K[3],K[4],K[0])+K[2]"
		dp.js="edit('index.asp?action=edt&oneid='+K[0])+updown('index.asp?oneid='+K[0])"'+updown('index.asp?oneid='+l1)

		Il dp.open

		Il "<tr><th>"&one.lang("list/id")&") "&one.lang("list/name")&"</th><th>"&one.lang("list/path")&"</th><th class=""w2"">"&one.lang("list/manage")&"</th></tr>"
		Il "<script>"
		for i=0 to dp.length

			if len(dp.data(2,i))>0 then
				fpath=dp.data(2,i)
			else
				fpath="["&WebOrigin_ext&"]"
			end if

			if len(dp.data(2,i))>0 then
				paths=split(dp.data(2,i),"/")
				if instr(paths(ubound(paths)),".")>0 then'文件
					ispath=WebOrigin.isexist("../../"&dp.data(2,i))
				else
					ispath=WebOrigin.isexist("../../"&dp.data(2,i)&"/"&WebOrigin_ext)
				end if
			else
				ispath=WebOrigin.isexist("../../"&WebOrigin_ext)
			end if

			if ispath then
				lpath=WebOrigin_system&"system/link.asp?url="&server.urlencode(WebOrigin.inst&dp.data(2,i))
			else
				lpath="index.asp?action=create&oneid="&dp.data(0,i)
			end if
			
			Il "ll("&dp.data(0,i)&",'"&htm2js(dp.data(1,i))&"','"&fpath&"','"&ispath&"','"&lpath&"');"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing

end sub

sub WebOrigin_create()
	WebOrigin.nocache
	WebOrigin.head WebOrigin.path,0
	dim I1,oneid,rs
	oneid=quest("oneid",2)
	set rs=conn.execute("select onepath from WebOriginonepage where oneid="&oneid)
		if not rs.eof and not rs.bof then
			I1="<a href="""&WebOrigin_system&"system/link.asp?url="&server.urlencode("../../"&rs(0))&""" target=""_blank""><img src=""../system/images/os/brow.gif"" class=""os"" /></a>"
		else
			I1="<img src=""../system/images/os/error.gif"" class=""os""/>"
		end if
		rs.close
	set rs=nothing
	one.create oneid
	WebOrigin.txt I1
end sub

sub WebOrigin_set()
	WebOrigin.nocache
	WebOrigin.head WebOrigin.path,0
	dim list,rs,data,i
	list=form("list")
	if len(list)>0 then
		if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end if

	select case form("submits")
	case"create" 
		if len(list)>0 then
			one.create list
			WebOrigin.flo one.lang("flo/createok"),1
		else
			WebOrigin.flo one.lang("flo/select"),0
		end if
	case"delete"
		if len(list)>0 then
			set rs=conn.execute("select onepath from WebOriginonepage where oneid in ("&list&");")
				if not rs.eof and not rs.bof then
					data=rs.getrows()
					for i=0 to ubound(data,2)
						if len(data(0,i))>0 then
							WebOrigin.deletefolder "../../"&data(0,i)
						else
							WebOrigin.deletefile "../../"&WebOrigin_ext
						end if
					next
					conn.execute "delete from WebOriginonepage where oneid in ("&list&");"
				else
					WebOrigin.flo one.lang("flo/invalid"),1
				end if
				rs.close
			set rs=nothing
			WebOrigin.flo one.lang("flo/deleteok"),1
		else
			WebOrigin.flo one.lang("flo/select"),0
		end if
	case"createmap"
		one.createmap
		WebOrigin.flo one.lang("flo/createmapok"),0
	end select
end sub

sub WebOrigin_edt()
	WebOrigin.head WebOrigin.path,one.lang("title")

	dim rs,data,dataform,sql,i,oneid,checkpath
	sql="onename,onetitle,onepath,onekeyword,onedescription,onecontent,onetemplate1,onetemplate2"'7
	oneid=quest("oneid",2)
	if len(oneid)=0 then:oneid=form("oneid")
	if len(oneid)>0 then'若有值的情况下
		if validate(oneid,2)=false then WebOrigin.error WebOrigin.lang("error/invalid")
	end if
	
	if WebOrigin.ismethod or len(oneid)=0 then
		dataform=split(sql,",")
		redim data(ubound(dataform),0)
		for i=0 to ubound(dataform)
			data(i,0)=form(dataform(i))
		next
	else
		set rs=conn.execute("select "&sql&" from WebOriginonepage where oneid="&oneid&";")
			if not rs.eof and not rs.bof then
				data=rs.getrows()
			else
				WebOrigin.error WebOrigin.lang("error/invalid")
			end if
			rs.close
		set rs=nothing
	end if

	one.list
	Il "<form name=""form1"" method=""post"" action=""index.asp?action=edt"">"
	WebOrigin.form_input "onename",one.lang("label/name"),data(0,0),"onename|6|"&encode(one.lang("check/name"))&"|1-50"'name
	WebOrigin.form_input "onetitle",one.lang("label/title"),data(1,0),"onetitle|6|"&encode(one.lang("check/title"))&"|1-100"'title
	'
	if len(oneid)>0 then'更新
		checkpath="onepath|6|"&encode(one.lang("check/path"))&"|0-100;onepath|15|"&encode(one.lang("check/path1"))&";onepath|9|"&encode(one.lang("check/path2"))&"|select count(oneid) from WebOriginonepage where onepath='$pro$' and oneid<>"&oneid
	else
		checkpath="onepath|6|"&encode(one.lang("check/path"))&"|0-100;onepath|15|"&encode(one.lang("check/path1"))&";onepath|9|"&encode(one.lang("check/path2"))&"|select count(oneid) from WebOriginonepage where onepath='$pro$'"
	end if
	WebOrigin.form_input "onepath",one.lang("label/path"),data(2,0),checkpath'path

	WebOrigin.form_editor "onecontent",one.lang("label/content"),data(5,0),"onecontent|0|"&encode(one.lang("check/content"))'content

	WebOrigin.form_input "onekeyword",one.lang("label/keyword"),data(3,0),"onekeyword|6|"&encode(one.lang("check/keyword"))&"|0-50"'keyword
	WebOrigin.form_area "onedescription",one.lang("label/description"),data(4,0),"onedescription|6|"&encode(one.lang("check/description"))&"|0-250"'description
	
	WebOrigin.form_tmp "onetemplate1",one.lang("label/template1"),data(6,0),0

	WebOrigin.form_tmp "onetemplate2",one.lang("label/template2"),data(7,0),WebOrigin.path
	
	WebOrigin.form_but "save"
	WebOrigin.form_hidden "oneid",oneid

	Il "</form>"

	if WebOrigin.ischeck and WebOrigin.ismethod then
		if len(oneid)>0 then
			conn.execute "update WebOriginonepage set onename='"&safe(data(0,0))&"',onetitle='"&safe(data(1,0))&"',onepath='"&safe(data(2,0))&"',onekeyword='"&safe(data(3,0))&"',onedescription='"&safe(left(data(4,0),250))&"',onecontent='"&safe(data(5,0))&"',onetemplate1='"&safe(data(6,0))&"',onetemplate2='"&safe(data(7,0))&"' where oneid="&oneid&";"
		else
			conn.execute "insert into WebOriginonepage ("&sql&",oneorder) values ('"&safe(data(0,0))&"','"&safe(data(1,0))&"','"&safe(data(2,0))&"','"&safe(data(3,0))&"','"&safe(left(data(4,0),250))&"','"&safe(data(5,0))&"','"&safe(data(6,0))&"','"&safe(data(7,0))&"',"&WebOrigin.neworder("WebOriginonepage","oneorder")&")"
			oneid=WebOrigin.newid("WebOriginonepage","oneid")
		end if
		Il "<script>alert('"&htm2js(one.lang("alert/saveok"))&"');parent.location='index.asp';</script>"
		one.createmap
		one.create oneid
	end if
end sub

sub WebOrigin_updown()
	WebOrigin.head WebOrigin.path,0

	dim oneid
	oneid=quest("oneid",2)
	WebOrigin.updown "WebOriginonepage,oneid,oneorder",oneid,0
end sub

%>