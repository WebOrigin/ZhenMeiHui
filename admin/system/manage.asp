<!--#include file="config.asp" -->
<%
set WebOrigin=new WebOriginCMS
select case action
case"" WebOrigin_def
case"diymenu","diymnu" WebOrigin_diymenu
case"logout" WebOrigin_logout
case"config" WebOrigin_config
case"myaccount","myacccount" WebOrigin_myaccount
case"plugin" WebOrigin_plugin
case"pluginset" WebOrigin_pluginset
case"log" WebOrigin_log
case"logset" WebOrigin_logset
case"admin" WebOrigin_admin
case"adminedt" WebOrigin_adminedt
case"adminset" WebOrigin_adminset
case"newversion" WebOrigin_newversion
case"rss" WebOrigin_rss
case"rssset" WebOrigin_rssset
case"bot" WebOrigin_bot
case"botset" WebOrigin_botset
case"set" WebOrigin_set
case"filemanage","filemanage_createfolder","filemanage_upfile","upfile","filemanage_delete","filemanage_deletefolder" WebOrigin_filemanage
case"showimg" WebOrigin_showimg
case"update" WebOrigin_olupdate
end select
set WebOrigin=nothing


sub WebOrigin_olupdate()
	Server.ScriptTimeOut=86400
	WebOrigin.nocache
	dim I4,I1
	dim ver,xml,item,i
	dim filepath,filetext

	ver=form("ver")
	I4=WebOrigin.gethtm("http://www."&WebOrigin.systemname&".com/WebOriginCMS_Update_"&ver&".xml",5)
	if len(I4)>0 then'如果有资料
		if left(I4,5)="<?xml" then
'	out I4
			set xml=server.createobject(WebOrigin_xmldom)
			xml.async=false
			xml.loadxml(I4)
			if xml.readystate>2 then
				set item=xml.getelementsbytagname("item")
				for i=0 to (item.length-1)
					set filepath=item.item(i).getelementsbytagname("file")
					set filetext=item.item(i).getelementsbytagname("text")
					if lcase(WebOrigin.extension(filepath.item(0).text))="xml" then
						WebOrigin.savetofile replace(filepath.item(0).text,"[WebOrigin_system]",WebOrigin_system),replace(filetext.item(0).text,"]]!>","]]"&chr(62))
					else
						WebOrigin.savetofile replace(filepath.item(0).text,"[WebOrigin_system]",WebOrigin_system),filetext.item(0).text
					end if
				next
			end if
			I1=WebOrigin.lang("parameters/upok")
		else
			I1=WebOrigin.lang("parameters/notup")
		end if
	else
		I1=WebOrigin.lang("parameters/notup")
	end if
	WebOrigin.flo I1,1
end sub

sub WebOrigin_showimg()
	WebOrigin.head 0,0
	dim path
	path=form("path")
	WebOrigin.aja WebOrigin.lang("common/brow"),"<div class=""WO_form""><p><a href=""javascript:;"" onclick=""javascript:display('aja');"">["&WebOrigin.lang("common/close")&"]</a></p><p><img src="""&path&"""/></p></div>"
end sub

sub WebOrigin_filemanage()
	WebOrigin.nocache
	WebOrigin.head "brow",0

	dim path,paths,formname,ftype
	dim fs,item,filecate,back,imgsize

	formname=form("formname")
	ftype=form("type")
	path=form("path")

	if len(path)=0 or WebOrigin.isexist(path)=false then
		path=WebOrigin.inst&WebOrigin_upath&"/"
		WebOrigin.createfolder path
	end if
	paths=split(path,"/")

	WebOrigin.ol="<div class=""WO_form"">"

	select case action
	case"filemanage_createfolder"
		if len(form("fdname"))>0 then
			if right(path,1)<>"/" then path=path&"/"
			WebOrigin.createfolder path&form("fdname")
		else
			if len(form("is"))=0 then
				WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/fdname")&"</label><input type=""text"" id=""fdname"" class=""in3"" /></p>"
				WebOrigin.ol="<div class=""WO_but""><input type=""button"" value="""&WebOrigin.lang("common/submit")&""" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage_createfolder','aja','is=WebOriginCMS&formname="&formname&"&path="&server.urlencode(path)&"&type="&server.urlencode(ftype)&"&fdname='+encodeURIComponent(document.getElementById('fdname').value));display('flo');"" /></div>"
				WebOrigin.ol="</div>"
				WebOrigin.flo WebOrigin.writeol,2
			end if
		end if
	case"filemanage_delete"
		WebOrigin.deletefile path&form("fname")
	case"filemanage_deletefolder"
'		WebOrigin.ol=path&form("fname")
		WebOrigin.deletefolder path&form("fname")
	case"filemanage_upfile"
		WebOrigin.ol="<iframe src=""../system/manage.asp?action=upfile&path="&server.urlencode(path)&"&type="&ftype&"&formname="&formname&""" frameborder=""0"" scrolling=""none"" marginwidth=""0"" marginheight=""0"" width=""300"" height=""50""></iframe>"
		WebOrigin.ol="</div>"
		WebOrigin.flo WebOrigin.writeol,2
	case"upfile"
		WebOrigin.clearol
		WebOrigin.ol="<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"" />"
		WebOrigin.ol="<style type=""text/css"">*{margin:0px;padding:0px;}</style>"
		if instr(lcase(request.servervariables("content_type")),"multipart/form-data") then
			upload.FileType=ftype
			upload.SavePath=""
			if right(path,1)<>"/" then path=path&"/"
			if upload.save("upfile",path&upload.form("upfile_name")) then'成功上传
				WebOrigin.txt "<script>window.parent.posthtm('../system/manage.asp?action=filemanage','aja','path="&server.urlencode(path&upload.form("upfile_name"))&"&type="&ftype&"&formname="&formname&"');window.parent.display('flo');</script>"'WebOrigin.lang("'上传成功'")
			else
				back="../system/manage.asp?action=upfile&path="&server.urlencode(path)&"&type="&ftype&"&formname="&formname&""
				WebOrigin.txt"<p style=""font-size:12px;line-height:22px;"">"&WebOrigin.lang("error/upfile/err"&upload.error)&"<br/><a style=""color:#000;"" href="""&back&""">"&WebOrigin.lang("common/back")&"</a></p>"
			end if
		else
			WebOrigin.ol="<form name=""form1"" enctype=""multipart/form-data"" method=""post"" action=""../system/manage.asp?action=upfile"">"
			WebOrigin.ol="<p><input style=""width:250px;border:1px solid;border-color:#333 #CCC #CCC #333;"" name=""upfile"" type=""file"" /></p>"
			WebOrigin.ol="<p><input type=""submit"" value="""&WebOrigin.lang("common/upfile")&""" style=""border:1px solid;border-color:#CCC #777 #777 #CCC;padding:2px;margin:0px;font-size:12px;margin-right:4px;background-color:#D4D0C8;"" />"
			WebOrigin.ol="<input type=""hidden"" name=""type"" value="""&quest("type",0)&"""/>"
			WebOrigin.ol="<input type=""hidden"" name=""path"" value="""&quest("path",0)&"""/>"
			WebOrigin.ol="<input type=""hidden"" name=""formname"" value="""&quest("formname",0)&"""/></p>"
			WebOrigin.ol="</form>"
			WebOrigin.txt WebOrigin.writeol
		end if
	end select

	'导航
	WebOrigin.ol="<p>"
	if instr(paths(ubound(paths)),".")=0 then'如果是文件名，则需要进行判断
		WebOrigin.ol="<span class=""file"">"

		if path<>"/" then
			WebOrigin.ol="<a href=""javascript:;"" onclick=""javascript:confirm('"&WebOrigin.lang("confirm/delete")&"')?posthtm('../system/manage.asp?action=filemanage_deletefolder','aja','formname="&formname&"&path="&server.urlencode(left(path,len(path)-len(paths(ubound(paths)))))&"&type="&server.urlencode(ftype)&"&fname="&server.urlencode(paths(ubound(paths)))&"'):void(1);"">"
			WebOrigin.ol="<img src=""../system/images/os/del.gif"" alt="""&WebOrigin.lang("common/delete")&"""/></a>"
		end if

		WebOrigin.ol="<a href=""javascript:;"""
		WebOrigin.ol=" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage_createfolder','flo','formname="&formname&"&path="&server.urlencode(path)&"&type="&server.urlencode(ftype)&"');"">"
		WebOrigin.ol="<img src=""../system/images/os/file/crtdir.gif"" alt="""&WebOrigin.lang("common/createfolder")&"""/></a>"
		WebOrigin.ol="<a href=""javascript:;"""
		WebOrigin.ol=" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage_upfile','flo','formname="&formname&"&path="&server.urlencode(path)&"&type="&server.urlencode(ftype)&"');""><img src=""../system/images/os/file/up.gif"" alt="""&WebOrigin.lang("common/upfile")&"""/></a></span>"
	end if
	WebOrigin.ol="<img src=""../system/images/os/dir2.gif""/> <a href=""javascript:;"" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage','aja','formname="&formname&"&path=%2F&type="&server.urlencode(ftype)&"');"">Root</a>: "
	WebOrigin.ol=WebOrigin_filemanage_list(path,formname,server.urlencode(ftype))

	WebOrigin.ol="</p>"

	if instr(paths(ubound(paths)),".")>0 then'如果是文件名，则需要进行判断
		set fs=server.createobject(WebOrigin_fso)
		if fs.fileexists(server.mappath(path)) then
			
			WebOrigin.ol="<p><a href=""javascript:;"" onclick=""javascript:document.getElementById('"&formname&"').value='"&htm2js(path)&"';display('aja');"">["&WebOrigin.lang("common/insert")&"]</a>"
			WebOrigin.ol="<a href=""javascript:;"" onclick=""javascript:confirm('"&WebOrigin.lang("confirm/delete")&"')?posthtm('../system/manage.asp?action=filemanage_delete','aja','formname="&formname&"&path="&server.urlencode(left(path,len(path)-len(paths(ubound(paths)))))&"&type="&server.urlencode(ftype)&"&fname="&server.urlencode(paths(ubound(paths)))&"'):void(1);"">["&WebOrigin.lang("common/delete")&"]</a><a href=""javascript:;"" onclick=""javascript:display('aja');"">["&WebOrigin.lang("common/close")&"]</a></p>"
			filecate=WebOrigin.filecate(WebOrigin.extension(paths(ubound(paths))))
			if filecate="img" then'图片
				WebOrigin.ol="<p><a href="""&path&""" target=""_blank""><img style=""border:1px solid #666;padding:3px;"" src="""&path&"""/></a></p>"

			else
				WebOrigin.ol="<p><img src=""../system/images/os/file/"&filecate&".gif""/>"&path&"</p>"
			end if

			set item=fs.getfile(server.mappath(path))

			WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/name")&" : "&item.name&"</label></p>"
			WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/type")&" : "&item.type&"</label></p>"
			WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/size")&" : "&WebOrigin.formatsize(item.size)&"</label></p>"
			if filecate="img" then
				imgsize=WebOrigin.imgsize(path)
				if len(imgsize)>0 then
					WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/imgsize")&" : "&imgsize&" pixels</label></p>"
				end if
			end if
			WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/datecreated")&" : "&item.datecreated&"</label></p>"
			WebOrigin.ol="<p><label>"&WebOrigin.lang("brow/date")&" : "&item.datelastmodified&"</label></p>"
			set item=nothing
		else
			WebOrigin.ol="<p class=""WO_error"">"&WebOrigin.lang("error/brow")&"</p>"
		end if
		set fs=nothing

		WebOrigin.aja WebOrigin.lang("brow/title"),WebOrigin.writeol
	end if


	'main
	WebOrigin.ol=WebOrigin_filemanage_main(path,formname,ftype)
	WebOrigin.ol="</div>"

	WebOrigin.aja WebOrigin.lang("brow/title"),WebOrigin.writeol
end sub

function WebOrigin_filemanage_main(l1,l2,l3)
	
	dim l5,l6,l8,fs,I1,I2,paths,i,ext

	paths=split(l1,"/")

	if instr(paths(ubound(paths)),".")=0 then
		if right(l1,1)<>"/" then
			l1=l1&"/"
			paths=split(l1,"/")
		end if
	end if

	for i=1 to ubound(paths)-1
		I2=I2&"/"&paths(i)
	next
	I2=I2&"/"
	
	set fs=Server.CreateObject(WebOrigin_fso)
	l8=server.mappath(l1)
	set l5=fs.getfolder(l8)
		I1="<p class=""file"">"
		for each l6 in l5.subfolders
			I1=I1&"<a href=""javascript:;"" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage','aja','type="&l3&"&formname="&l2&"&path="&server.urlencode(I2&l6.name)&"');"">"
			I1=I1&"<img src=""../system/images/os/file/dir.gif""/>"&htmlencode(l6.name)
			I1=I1&"</a>"
		next

		I1=I1&"</p><hr/><p class=""file"">"

		for each l6 in l5.files
			if len(l3)>0 then
				ext=WebOrigin.extension(l6.name)
				if WebOrigin.instre(replace(l3,"/",","),ext) then
					I1=I1&"<a href=""javascript:;"""
					I1=I1&" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage','aja','type="&server.urlencode(l3)&"&formname="&l2&"&path="&server.urlencode(I2&l6.name)&"');"">"
					I1=I1&"<img src=""../system/images/os/file/"&WebOrigin.filecate(ext)&".gif""/>"&htmlencode(l6.name)
					I1=I1&"</a>"
				end if
			end if
		next
		I1=I1&"</p>"
	set l5=nothing
	set l6=nothing
	set fs=nothing
	if err.number<>0 then err.clear
	WebOrigin_filemanage_main=I1
end function

function WebOrigin_filemanage_list(l1,l2,l3)
	dim I1,paths,i,I2,fname
		
	paths=split(l1,"/")

	if instr(paths(ubound(paths)),".")=0 then
		if right(l1,1)<>"/" then
			l1=l1&"/"
			paths=split(l1,"/")
		end if
	else
		fname="/<strong>"&paths(ubound(paths))&"</strong>"
	end if

	for i=1 to ubound(paths)-2
		I2=I2&"/"&paths(i)
		I1=I1&"/<a href=""javascript:;"" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage','aja','type="&l3&"&formname="&l2&"&path="&server.urlencode(I2)&"')"">"&paths(i)&"</a>"
	next
	
	if len(fname)>0 then
		if ubound(paths)>1 then
			I1=I1&"/<a href=""javascript:;"" onclick=""javascript:posthtm('../system/manage.asp?action=filemanage','aja','type="&l3&"&formname="&l2&"&path="&server.urlencode(I2&"/"&paths(i))&"')"">"&paths(i)&"</a>"&fname
		else
			I1=I1&fname
		end if
	else
		I1=I1&"/<strong>"&paths(i)&"</strong>"
	end if

	if len(I2)>0 then
		WebOrigin.createfolder I2&"/"&paths(i)
	end if
	WebOrigin_filemanage_list=I1
end function

sub WebOrigin_def()

	WebOrigin.head "0",WebOrigin.lang("manage/title")
	dim rs,dp,i

	Il "<h2>"&WebOrigin.lang("manage/title")&"</h2>"

	set rs=conn.execute("select systemver,dbver,systemname,instdate from WebOriginsystem where systemname='WebOriginCMS';")
		if not rs.eof and not rs.bof then
			Il "<table class=""WO_table"" cellspacing=""0"">"
			Il "<tr><th class=""w0"">"&WebOrigin.lang("parameters/system")&"</th><th>"&WebOrigin.lang("parameters/server")&"</th></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/systemname")&" -&rsaquo; "&rs(2)&"</td><td>FSO -&rsaquo; "&WebOrigin.isobj(WebOrigin_fso)&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/systemver")&" -&rsaquo; "&WebOrigin.systemver&"</td><td>ASPJPEG/1.5 -&rsaquo; "&WebOrigin.isobj("Persits.Jpeg")&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/newversion")&" -&rsaquo; <span id=""newversion""></span></td><td>ADODB.STREAM -&rsaquo; "&WebOrigin.isobj(WebOrigin_stm)&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/dbver")&" -&rsaquo; "&rs(1)&"</td>"
				Il "<td>XMLHTTP -&rsaquo; "&WebOrigin.isobj("Microsoft.XMLHTTP")&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/dbtype/title")&" -&rsaquo; "&WebOrigin.lang("parameters/dbtype/type"&WebOrigin_dbtype)&"</td>"
				Il "<td>IIS -&rsaquo; "&Request.ServerVariables("SERVER_SOFTWARE")&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/inst")&" -&rsaquo; "&WebOrigin.inst&"</td><td>ScriptEngine -&rsaquo; "&ScriptEngineMajorVersion&"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/instdate")&" -&rsaquo; "&rs(3)&"</td><td>ScriptTimeout -&rsaquo; "&Server.ScriptTimeout&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/osite")&" -&rsaquo; <a href=""http://www.weborigin.co.nz"" target=""_blank"">www.weborigin.co.nz</a></td><td>ServerTime -&rsaquo; "&tnow&"</td></tr>"
			Il "<tr><td>"&WebOrigin.lang("parameters/mailto")&" -&rsaquo; cms@weborigin.co.nz</td><td>IP -&rsaquo; "&WebOrigin.ip&"</td></tr>"
			Il "</table>"
		else
			WebOrigin.deletefile WebOrigin_system&"system/fun.asp"
		end if
		rs.close
	set rs=nothing

	if WebOrigin.level="admin" or WebOrigin.instre(WebOrigin.level,"log") then
		Il "<h2>"&WebOrigin.lang("log/title")&"</h2>"
		set dp=new record
			dp.create"select logid,adminname,lognum,ip,logdate from WebOriginlog order by logid desc;"
			dp.purl="manage.asp?action=log&pid=$&rn="&dp.rn
			dp.action="manage.asp?action=logset"
			dp.but=dp.sect("logdelete:"&encode(WebOrigin.lang("log/delete")))&dp.prn & dp.plist
			dp.js="cklist(K[0])+K[0]+') '+K[1]"
			dp.js="K[2]"
			dp.js="K[3]"
			dp.js="K[4]"

			Il dp.open

			Il "<tr><th>"&WebOrigin.lang("log/list/id")&") "&WebOrigin.lang("log/list/name")&"</th>"
			Il "<th>"&WebOrigin.lang("log/list/num")&"</th><th>"&WebOrigin.lang("log/list/ip")&"</th><th>"&WebOrigin.lang("log/list/date")&"</th></tr>"
			Il "<script>"
			for i=0 to dp.length
				
				Il "ll("&dp.data(0,i)&",'"&htm2js(dp.data(1,i))&"','"&htm2js(WebOrigin.lang("log/l"&dp.data(2,i)))&"','"&dp.data(3,i)&"','"&dp.data(4,i)&"');"
			next
			Il "gethtm('manage.asp?action=newversion','newversion',1);</script>"
			Il dp.close
		set dp=nothing
	end if
end sub

sub WebOrigin_newversion()
	WebOrigin.head 0,0
	WebOrigin.txt WebOrigin.getversion()

	if err.number<>0 then
		WebOrigin.txt WebOrigin.lang("parameters/newversionerr")
		err.clear
	end if
end sub

sub WebOrigin_logset()
	WebOrigin.nocache
	WebOrigin.head"log",0
	dim list,sql

	list=form("list")
	if len(list)>0 then
		if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end if
	select case form("submits")
	case"delete"
		if len(list)>0 then
			conn.execute "delete from WebOriginlog where logid in ("&list&");"
			WebOrigin.flo WebOrigin.lang("log/flo/deleteok"),1
		else
			WebOrigin.flo WebOrigin.lang("log/flo/select"),0
		end if
	case"logdelete"'删除过期日志 一个月
		if WebOrigin_dbtype=1 then
			sql="delete from WebOriginlog where getdate()-logdate>30;"
		else
			sql="delete from WebOriginlog where now()-logdate>30;"
		end if
		conn.execute sql
		WebOrigin.flo WebOrigin.lang("log/flo/logdeleteok"),1
	end select

end sub

sub WebOrigin_log()
	WebOrigin.head "log",WebOrigin.lang("log/title")
	dim dp,i
	Il "<h2>"&WebOrigin.lang("log/title")&"</h2>"
	set dp=new record
		dp.create"select logid,adminname,lognum,ip,logdate from WebOriginlog order by logid desc;"
		dp.purl="manage.asp?action=log&pid=$&rn="&dp.rn
		dp.action="manage.asp?action=logset"
		dp.but=dp.sect("logdelete:"&encode(WebOrigin.lang("log/delete")))&dp.prn & dp.plist
		dp.js="cklist(K[0])+K[0]+') '+K[1]"
		dp.js="K[2]"
		dp.js="K[3]"
		dp.js="K[4]"

		Il dp.open

		Il "<tr><th>"&WebOrigin.lang("log/list/id")&") "&WebOrigin.lang("log/list/name")&"</th>"
		Il "<th>"&WebOrigin.lang("log/list/num")&"</th><th>"&WebOrigin.lang("log/list/ip")&"</th><th>"&WebOrigin.lang("log/list/date")&"</th></tr>"
		Il "<script>"
		for i=0 to dp.length
			
			Il "ll("&dp.data(0,i)&",'"&htm2js(dp.data(1,i))&"','"&htm2js(WebOrigin.lang("log/l"&dp.data(2,i)))&"','"&dp.data(3,i)&"','"&dp.data(4,i)&"');"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing
end sub

sub WebOrigin_bot()
	WebOrigin.head "bot",WebOrigin.lang("bot/title")
	dim dp,i
	Il "<h2>"&WebOrigin.lang("bot/title")&"</h2>"
	set dp=new record
		dp.create"select botid,botname,botnumber,botdate,botlastdate from WebOriginbot order by botnumber desc,botid;"
		dp.purl="manage.asp?action=bot&pid=$&rn="&dp.rn
		dp.action="manage.asp?action=botset"
		dp.but=dp.sect("")&dp.prn & dp.plist
		dp.js="cklist(K[0])+K[0]+') '+K[1]"
		dp.js="K[2]"
		dp.js="K[3]"
		dp.js="K[4]"

		Il dp.open

		Il "<tr><th>"&WebOrigin.lang("bot/list/id")&") "&WebOrigin.lang("bot/list/name")&"</th>"
		Il "<th>"&WebOrigin.lang("bot/list/number")&"</th><th>"&WebOrigin.lang("bot/list/date")&"</th><th>"&WebOrigin.lang("bot/list/lastdate")&"</th></tr>"
		Il "<script>"
		for i=0 to dp.length
			
			Il "ll("&dp.data(0,i)&",'"&htm2js(dp.data(1,i))&"','"&dp.data(2,i)&"','"&dp.data(3,i)&"','"&dp.data(4,i)&"');"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing
end sub

sub WebOrigin_botset()
	WebOrigin.nocache
	WebOrigin.head"bot",0
	dim list,sql

	list=form("list")
	if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	select case form("submits")
	case"delete"
		conn.execute "delete from WebOriginbot where botid in ("&list&");"
		WebOrigin.flo WebOrigin.lang("bot/flo/delete"),1
	end select

end sub

sub WebOrigin_rss()
	WebOrigin.head "rss",WebOrigin.lang("rss/title")
	dim dp,i
	Il "<h2>"&WebOrigin.lang("rss/title")&"</h2>"
	set dp=new record
		dp.create"select rssid,rsstitle,rsslink,rsspubDate from WebOriginrss where rsstitle<>'' order by rssorder desc;"
		dp.purl="manage.asp?action=rss&pid=$&rn="&dp.rn
		dp.action="manage.asp?action=rssset"
		dp.but=dp.sect("create:"&encode(WebOrigin.lang("common/create")))&dp.prn & dp.plist
		dp.js="cklist(K[0])+K[4]+') '+K[1]"
		dp.js="'<a href="""&WebOrigin_system&"system/link.asp?url='+K[2]+'"" target=""_blank"">'+K[2]+'</a>'"
		dp.js="K[3]"

		Il dp.open

		Il "<tr><th>"&WebOrigin.lang("rss/list/order")&") "&WebOrigin.lang("rss/list/title")&"</th>"
		Il "<th>"&WebOrigin.lang("rss/list/link")&"</th><th>"&WebOrigin.lang("rss/list/date")&"</th></tr>"
		Il "<script>"
		for i=0 to dp.length
			
			Il "ll("&dp.data(0,i)&",'"&htm2js(dp.data(1,i))&"','"&htm2js(dp.data(2,i))&"','"&dp.data(3,i)&"',"&((dp.pid-1)*dp.rn)+i+1&");"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing
end sub

sub WebOrigin_rssset()
	WebOrigin.nocache
	WebOrigin.head"rss",0
	dim list,sql,rsspath,rsspathbaidu

	list=form("list")
	if len(list)>0 then
		if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end if
	select case form("submits")
	case"delete"
		if len(list)>0 then
			conn.execute "update WebOriginrss set rsstitle='' where rssid in ("&list&");"
			WebOrigin.createrss
			WebOrigin.flo WebOrigin.lang("rss/flo/delete"),1
		else
			WebOrigin.flo WebOrigin.lang("rss/flo/select"),0
		end if
	case"create"
		WebOrigin.createrss
		rsspath=conn.execute("select rsspath from WebOriginsystem")(0)
		rsspathbaidu=WebOrigin.inst&"baidu_"&rsspath&".xml"
		rsspath=WebOrigin.inst&rsspath&".xml"

		WebOrigin.flo WebOrigin.lang("rss/flo/createok")&"<br/><a href="""&rsspath&""" target=""_blank"">"&WebOrigin.siteurl&rsspath&"</a><br/><a href="""&rsspathbaidu&""" target=""_blank"">"&WebOrigin.siteurl&rsspathbaidu&"</a>",1
	end select

end sub

sub WebOrigin_set()
	WebOrigin.nocache
	WebOrigin.head 0,0
	dim list,sql,map

	list=form("list")
	if len(list)>0 then
		if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end if
	select case form("submits")
	case"createmap"
		WebOrigin.createmap
		map=conn.execute("select sitemap from WebOriginsystem")(0)
		map=WebOrigin.siteurl&WebOrigin.inst&map&".xml"
		WebOrigin.flo "<a href="""&map&""" target=""_blank"">"&map&"</a>",0
	end select

end sub

sub WebOrigin_adminset()
	WebOrigin.nocache
	WebOrigin.head "admin",0
	dim list,rs,data,i
	list=form("list")
	if len(list)>0 then
		if validate(list,6)=false then WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end if

	select case form("submits")
	case"delete"
		if len(list)>0 then
			if cstr(trim(list))=cstr(WebOrigin.id) then
				WebOrigin.flo WebOrigin.lang("admin/flo/deletefail"),0
			else
				conn.execute "delete from WebOriginadmin where adminid in ("&list&") and adminname<>'"&WebOrigin.name&"';"
				WebOrigin.flo WebOrigin.lang("admin/flo/deleteok"),1
			end if
		else
			WebOrigin.flo WebOrigin.lang("admin/flo/select"),0
		end if
	end select
end sub

sub WebOrigin_admin()
	WebOrigin.head "admin",WebOrigin.lang("admin/title")
	dim i,dp,adminlevel

	Il "<h2>"&WebOrigin.lang("admin/title")
	Il "<span class=""listmenu"">"
	Il "<a href=""manage.asp?action=admin"">["&WebOrigin.lang("common/list")&"]</a>"
	Il "<a href=""manage.asp?action=adminedt"">["&WebOrigin.lang("admin/add")&"]</a>"
	Il "</span>"
	Il "</h2>"

	set dp=new record
		dp.create "select adminid,adminname,adminlevel,admindate,admincount from WebOriginadmin;"
		dp.action="manage.asp?action=adminset"
		dp.purl="manage.asp?action=admin&pid=$&rn="&dp.rn

		dp.but=dp.sect("")&dp.prn & dp.plist

		dp.js="cklist(K[0])+'<a href=""manage.asp?action=adminedt&adminid='+K[0]+'"">'+K[0]+') '+K[1]+'</a>'"
		dp.js="K[2]"
		dp.js="K[4]"
		dp.js="K[3]"'+updown('index.asp?oneid='+l1)

		Il dp.open

		Il "<tr><th>"&WebOrigin.lang("admin/list/name")&"</th><th>"&WebOrigin.lang("admin/list/level")&"</th><th>"&WebOrigin.lang("admin/list/count")&"</th><th class=""w4"">"&WebOrigin.lang("admin/list/date")&"</th></tr>"

		Il "<script>"
		for i=0 to dp.length
			if dp.data(2,i)="admin" then
				adminlevel=WebOrigin.lang("admin/level/super")
			else
				adminlevel=WebOrigin.lang("admin/level/editor")
			end if
			Il "ll("&dp.data(0,i)&",'"&dp.data(1,i)&"','"&adminlevel&"','"&dp.data(3,i)&"','"&dp.data(4,i)&"');"
		next
		Il "</script>"
		Il dp.close
	set dp=nothing
end sub

sub WebOrigin_adminedt()
	WebOrigin.head "admin",WebOrigin.lang("admin/title")
	dim sql,adminid,i,data,dataform
	dim rs,plugin,checked,levels
	dim adminpass

	adminid=quest("adminid",2):if len(adminid)=0 then adminid=form("adminid")
	if len(adminid)>0 then'若有值的情况下
		if validate(adminid,2)=false then WebOrigin.error WebOrigin.lang("error/invalid")
	end if
	sql="adminname,adminlevel,adminlanguage,admineditor,diymenu"

	if WebOrigin.ismethod or len(adminid)=0 then
		dataform=split(sql,",")
		redim data(ubound(dataform),0)
		for i=0 to ubound(dataform)
			data(i,0)=form(dataform(i))
		next
	else
		set rs=conn.execute("select "&sql&" from WebOriginadmin where adminid="&adminid&";")
			if not rs.eof and not rs.bof then
				data=rs.getrows()
				'外部表单提交也就是只有超级管理员能操作，仅限制一下打开过程即可
				if data(0,0)=WebOrigin.name then response.redirect "manage.asp?action=myaccount"
			else
				WebOrigin.error WebOrigin.lang("error/invalid")
			end if
			rs.close
		set rs=nothing
	end if

	Il "<h2>"&WebOrigin.lang("admin/title")
	Il "<span class=""listmenu"">"
	Il "<a href=""manage.asp?action=admin"">["&WebOrigin.lang("common/list")&"]</a>"
	Il "<a href=""manage.asp?action=adminedt"">["&WebOrigin.lang("admin/add")&"]</a>"
	Il "</span>"
	Il "</h2>"

	Il "<form name=""form1"" class=""WO_form"" method=""post"" action=""manage.asp?action=adminedt"">"
	if len(adminid)=0 then'新添加管理员的时候才显示
		Il "<p><label>"&WebOrigin.lang("admin/label/name")&"</label><input type=""text"" id=""adminname"" name=""adminname"" value="""&data(0,0)&""" class=""in3"" maxlength=""12"" />"
		Il WebOrigin.check("adminname|6|"&encode(WebOrigin.lang("admin/check/name"))&"|2-12;adminname|9|"&encode(WebOrigin.lang("admin/check/name1"))&"|select count(adminid) from WebOriginadmin where adminname='$pro$'")
		Il "</p>"
	end if

	Il "<p><label>"&WebOrigin.lang("admin/label/pass") &"</label><input type=""password"" name=""adminpass"" value="""" class=""in3"" maxlength=""30"" />"
	if len(form("adminpass"))>0 or len(form("adminpass1"))>0 or len(adminid)=0 then'密码为空的时候不用验证，也不更新密码
		Il WebOrigin.check("adminpass|7|"&encode(WebOrigin.lang("admin/check/contrast"))&"|adminpass1;adminpass|6|"&encode(WebOrigin.lang("account/check/pwdsize"))&"|6-30")&"</p>"
	end if

	Il "<p><label>"&WebOrigin.lang("admin/label/pass1")&"</label><input type=""password"" name=""adminpass1"" value="""" class=""in3"" maxlength=""30"" /></p>"

	Il "<p><label>"&WebOrigin.lang("admin/label/language")&"</label>"
	Il "<select name=""adminlanguage"">"
	Il WebOrigin.getfolder (WebOrigin_system&"system/language","xml","<option value=""$name$"" $selected$>$langname$</option>",data(2,0))
	Il "</select></p>"

	Il "<p><label>"&WebOrigin.lang("admin/label/editor")&"</label>"
	Il "<select name=""admineditor"">"
	Il WebOrigin.getfolder ("editor","dir","<option value=""$name$"" $selected$>$name$</option>",data(3,0))
	Il "</select></p>"


	'读取plugin
	set rs=conn.execute("select plugin from WebOriginsystem where systemname='WebOriginCMS';")
		if not rs.eof and not rs.bof then
			if len(rs(0))>0 then
				plugin=split(rs(0),",")
			else
				redim plugin(0)
			end if
		else
			WebOrigin.error WebOrigin.lang("error/invalid")
		end if
		rs.close
	set rs=nothing
	Il "<div class=""WO_checkbox""><label>"&WebOrigin.lang("admin/label/level")&"</label>"'管理员设置
		if cstr(data(1,0))="admin" then checked=" checked=""checked""" else checked=""
		Il "<span><input type=""checkbox"" id=""adminlevel"" name=""adminlevel"" value=""1"" onclick=""javascript:selevel()"""&checked&" />"'超级管理员
		Il "<label for=""adminlevel"">"&WebOrigin.lang("admin/level/super")&"</label></span>"

		Il "<span id=""levels"">"'普通管理员设置
		levels=array("plugin","diymenu","config","log","rss","bot","brow")
		for i=0 to ubound(levels)
			if WebOrigin.instre(data(1,0),levels(i)) then checked=" checked=""checked""" else checked=""
			Il "<input type=""checkbox"" name=""level"" id=""p_"&levels(i)&""" value="""&levels(i)&""""&checked&" /><label for=""p_"&levels(i)&""">"&WebOrigin.lang(levels(i)&"/title")&"</label> "
		next
		Il "<br/><script>selevel();</script>"
		for i=0 to ubound(plugin)
			if len(plugin(i))>0 then
				if WebOrigin.instre(data(1,0),plugin(i)) then checked=" checked=""checked""" else checked=""
				Il "<input type=""checkbox"" name=""level"" id=""p_"&plugin(i)&""" value="""&plugin(i)&""""&checked&" /><label for=""p_"&plugin(i)&""">"&WebOrigin.xmlang(plugin(i),"title")&"</label> "
			end if
		next
		Il "</span>"
	Il "</div>"

	Il "<p><label>"&WebOrigin.lang("account/diymenu")&"</label>"
	Il "<textarea name=""diymenu"" class=""in5"" rows=""15"" cols=""70"">"&formencode(data(4,0))&"</textarea>"
	Il "</p>"
	
	WebOrigin.form_hidden "adminid",adminid
	WebOrigin.form_but"save"
	Il "</form>"

	if WebOrigin.ischeck and WebOrigin.ismethod then
		if data(1,0)="1" then
			data(1,0)="admin"
		else
			if len(form("level"))>0 then
				data(1,0)="0,"&form("level")'这里存在安全隐患？因前面有管理员验证过程，所以不用担心外部表单形式来提交，就算提交也只有超级管理员才有权限到这里执行
			else
				data(1,0)="0"
			end if
		end if
		if len(form("adminpass"))>0 then
			adminpass=md5(form("adminpass"),1)
		end if
		if len(adminid)>0 then'update
			conn.execute "update WebOriginadmin set adminlevel='"&safe(data(1,0))&"',adminlanguage='"&safe(data(2,0))&"',admineditor='"&safe(data(3,0))&"',diymenu='"&safe(data(4,0))&"' where adminid="&adminid
			if len(form("adminpass"))>0 then
				conn.execute "update WebOriginadmin set adminpass='"&adminpass&"' where adminid="&adminid
			end if
		else'insert
			conn.execute "insert into WebOriginadmin ("&sql&",adminpass,admindate) values ('"&safe(data(0,0))&"','"&safe(data(1,0))&"','"&safe(data(2,0))&"','"&safe(data(3,0))&"','"&safe(data(4,0))&"','"&adminpass&"','"&tnow&"')"
		end if
		response.redirect "manage.asp?action=admin"
	end if
end sub

sub WebOrigin_config()
	dim rs,sql,data,dataform,i
	sql="sitename,siteurl,sitekeywords,lockip,sitemap,rssnumber,rsspath,robot,sitemail,rssupdate,dirty,searchtemplate,sitemapnumber"'12
	WebOrigin.head "config",WebOrigin.lang("config/title")

	if WebOrigin.ismethod then
		dataform=split(sql,",")
		redim data(ubound(dataform),0)
		for i=0 to ubound(dataform)
			data(i,0)=form(dataform(i))
		next
	else
		set rs=conn.execute("select "&sql&" from WebOriginsystem where systemname='WebOriginCMS';")
			if not rs.eof and not rs.bof then
				data=rs.getrows()
			else
				WebOrigin.deletefolder WebOrigin_system
			end if
			rs.close
		set rs=nothing
	end if

	Il "<form name=""form1"" class=""WO_form"" method=""post"" action=""manage.asp?action=config"">"
	Il "<h2>"&WebOrigin.lang("config/title")&"</h2>"
	Il "<p><label>"&WebOrigin.lang("manage/sitename")&"</label><input class=""in4"" type=""text"" name=""sitename"" value="""&formencode(data(0,0))&""" maxlength=""50"" /></p>"
	Il "<p><label>"&WebOrigin.lang("manage/siteurl")&"</label><input class=""in4"" type=""text"" name=""siteurl"" value="""&formencode(data(1,0))&""" maxlength=""50"" /></p>"
	Il "<p><label>"&WebOrigin.lang("manage/sitemail")&"</label><input class=""in4"" type=""text"" name=""sitemail"" value="""&formencode(data(8,0))&""" maxlength=""100"" /></p>"

	Il "<p><label>"&WebOrigin.lang("manage/keywords")&"</label><textarea name=""sitekeywords"" rows=""15"" cols=""70"">"&formencode(data(2,0))&"</textarea></p>"

	Il "<h2>"&WebOrigin.lang("config/setxml")&"</h2>"
	Il "<p><label>"&WebOrigin.lang("manage/sitemap")&"</label><input class=""in3"" type=""text"" name=""sitemap"" value="""&formencode(data(4,0))&""" maxlength=""30"" />.xml "
	if len(WebOrigin.mapname)>0 then
		Il "<a onclick=""javascript:posthtm('manage.asp?action=set','flo','submits=createmap');"" href=""javascript:;"">["&WebOrigin.lang("common/create")&"]</a>"
	end if
	Il "</p>"
	Il "<p><label>"&WebOrigin.lang("manage/mapnumber")&"</label><input class=""in1"" type=""text"" name=""sitemapnumber"" value="""&formencode(data(12,0))&""" maxlength=""5"" />"
	Il WebOrigin.check("sitemapnumber|16|"&encode(WebOrigin.lang("config/check/sitemapnumber"))&"|1-50000")
	Il "</p>"

	Il "<p><label>"&WebOrigin.lang("manage/rsspath")&"</label><input class=""in3"" type=""text"" name=""rsspath"" value="""&formencode(data(6,0))&""" maxlength=""30"" />.xml <a href=""manage.asp?action=rss"">["&WebOrigin.lang("common/manage")&"]</a></p>"
	Il "<p><label>"&WebOrigin.lang("manage/rssnumber")&"</label><input class=""in1"" type=""text"" name=""rssnumber"" value="""&formencode(data(5,0))&""" maxlength=""3"" />"
	Il WebOrigin.check("rssnumber|2|"&encode(WebOrigin.lang("config/check/rssnumber")))
	Il "</p>"
	Il "<p><label>"&WebOrigin.lang("manage/rssupdate")&"</label><input class=""in1"" type=""text"" name=""rssupdate"" value="""&formencode(data(9,0))&""" maxlength=""5"" />"
	Il WebOrigin.check("rssupdate|2|"&encode(WebOrigin.lang("config/check/rssupdate")))
	Il "</p>"

	Il "<h2>"&WebOrigin.lang("config/rest")&"</h2>"
	Il "<p><label>"&WebOrigin.lang("manage/robot")&" <a href=""manage.asp?action=bot"">["&WebOrigin.lang("common/manage")&"]</a></label><textarea name=""robot"" rows=""10"" cols=""70"">"&formencode(data(7,0))&"</textarea></p>"
	Il "<p><label>"&WebOrigin.lang("manage/lockip")&"</label><textarea name=""lockip"" rows=""10"" cols=""70"">"&formencode(data(3,0))&"</textarea></p>"
	Il "<p><label>"&WebOrigin.lang("manage/dirty")&"</label><textarea name=""dirty"" rows=""10"" cols=""70"">"&formencode(data(10,0))&"</textarea></p>"
	'搜索页模版
	WebOrigin.form_tmp "searchtemplate",WebOrigin.lang("template/searchtemplate"),data(11,0),0

	WebOrigin.form_but "save"
	Il "</form>"

	if WebOrigin.ismethod and WebOrigin.ischeck then
		conn.execute "update WebOriginsystem set sitename='"&safe(form("sitename"))&"',siteurl='"&safe(form("siteurl"))&"',sitekeywords='"&safe(form("sitekeywords"))&"',lockip='"&safe(form("lockip"))&"',sitemap='"&safe(form("sitemap"))&"',rssnumber="&safe(form("rssnumber"))&",rsspath='"&safe(form("rsspath"))&"',robot='"&safe(form("robot"))&"',sitemail='"&safe(form("sitemail"))&"',rssupdate="&form("rssupdate")&",dirty='"&safe(form("dirty"))&"',searchtemplate='"&safe(form("searchtemplate"))&"',sitemapnumber="&safe(data(12,0))&" where systemname='WebOriginCMS';"
		Il "<script>alert('"&htm2js(WebOrigin.lang("common/upok"))&"');</script>"
	end if
end sub

sub WebOrigin_diymenu()
	dim rs,diymenu
	WebOrigin.head "diymenu",WebOrigin.lang("diymenu/title")

	Il "<h2>"&WebOrigin.lang("diymenu/title")&"</h2>"

	if  WebOrigin.ismethod then
		diymenu=form("diymenu")
		set rs=conn.execute("select diymenuid from WebOrigindiymenu where diymenulang='"&safe(WebOrigin.language)&"';")
			if not rs.eof and not rs.bof then
				conn.execute "update WebOrigindiymenu set diymenu='"&safe(diymenu)&"' where diymenuid="&rs(0)&";"
			else
				conn.execute "insert into WebOrigindiymenu (diymenulang,diymenu) values ('"&safe(WebOrigin.language)&"','"&safe(diymenu)&"')"
			end if
			rs.close
		set rs=nothing
		response.redirect "manage.asp?action=diymnu"
	else
		set rs=conn.execute("select diymenu from WebOrigindiymenu where diymenulang='"&safe(WebOrigin.language)&"';")
			if not rs.eof and not rs.bof then
				diymenu=rs(0)
			else
				diymenu=WebOrigin.lang("diymenu/title")&"|../system/manage.asp?action=diymenu"&vbcrlf
				diymenu=diymenu&WebOrigin.lang("parameters/love")&"|javascript:;"&vbcrlf
				diymenu=diymenu&"  weborigin.co.nz|http://www.weborigin.co.nz/"&vbcrlf
				diymenu=diymenu&"  WebOriginCMS Forums|http://club.adsenser.org/forum-38-1.html"&vbcrlf
				diymenu=diymenu&"  Adsenser.org|http://www.adsenser.org/"&vbcrlf
			end if
			rs.close
		set rs=nothing
	end if
	if action="diymnu" then
		Il "<p class=""red"">"&WebOrigin.lang("common/upok")&"</p>"
	end if


	Il "<form name=""form1"" class=""WO_form"" method=""post"" action=""manage.asp?action=diymenu"">"
	Il "<p><label>"&WebOrigin.lang("diymenu/title")&"</label><textarea name=""diymenu"" class=""in5"" rows=""25"" cols=""70"">"&formencode(diymenu)&"</textarea>"
	Il "<pre>"&WebOrigin.lang("diymenu/memo")&"</pre>"
	Il "</p>"
	WebOrigin.form_but "save"
	Il "</form>"

end sub

sub WebOrigin_myaccount()
	dim rs,adminpass,adminlanguage,admineditor,diymenu
	WebOrigin.head 0,WebOrigin.lang("account/my")
	Il "<h2>"&WebOrigin.lang("account/my")&"</h2>"
	if action="myacccount" then
		Il "<p class=""red"">"&WebOrigin.lang("common/upok")&"</p>"
	end if
	set rs=conn.execute("select adminpass,adminlanguage,admineditor,diymenu from WebOriginadmin where adminname='"&WebOrigin.name&"';")
		if not rs.eof and not rs.bof then
			adminpass=rs(0)
			adminlanguage=rs(1)
			admineditor=rs(2)
			diymenu=rs(3)
			if WebOrigin.ismethod then
				adminlanguage=form("adminlanguage")
				admineditor=form("admineditor")
				diymenu=form("diymenu")
			end if
		else
			response.redirect "login.asp"
		end if
		rs.close
	set rs=nothing

	Il "<form name=""form1"" class=""WO_form"" method=""post"" action=""manage.asp?action=myaccount"">"

	Il "<p><label>"&WebOrigin.lang("account/oldpass")&" (6-30)</label><input class=""in3"" type=""password"" name=""oldpass"" maxlength=""30"" />"
	Il WebOrigin.check("oldpass|6|"&WebOrigin.lang("account/check/pwdsize")&"|6-30;oldpass|10|"&WebOrigin.lang("account/check/pwderror")&"|"&adminpass)&"</p>"

	Il "<p><label>"&WebOrigin.lang("account/newpass")&" (6-30)</label><input class=""in3"" type=""password"" name=""newpass"" maxlength=""30"" />"
	if len(form("newass"))>0 or len(form("confirmedpass"))>0 then
		Il WebOrigin.check("newpass|7|"&WebOrigin.lang("account/check/contrast")&"|confirmedpass;newpass|6|"&WebOrigin.lang("account/check/pwdsize")&"|6-30")&"</p>"
	end if

	Il "<p><label>"&WebOrigin.lang("account/confirmedpass")&"</label><input class=""in3"" type=""password"" name=""confirmedpass"" maxlength=""30"" /></p>"

	Il "<p><label>"&WebOrigin.lang("language")&"</label>"
	Il "<select name=""adminlanguage"">"
	Il WebOrigin.getfolder (WebOrigin_system&"system/language","xml","<option value=""$name$"" $selected$>$langname$</option>",adminlanguage)
	Il "</select></p>"

	Il "<p><label>"&WebOrigin.lang("editor")&"</label>"
	Il "<select name=""admineditor"">"
	Il WebOrigin.getfolder ("editor","dir","<option value=""$name$"" $selected$>$name$</option>",admineditor)
	Il "</select></p>"

	Il "<p><label>"&WebOrigin.lang("account/diymenu")&"</label>"
	Il "<textarea name=""diymenu"" class=""in5"" rows=""15"" cols=""70"">"&formencode(diymenu)&"</textarea>"
	Il "</p>"

	WebOrigin.form_but "up"
	Il "</form>"
	
	if WebOrigin.ischeck and WebOrigin.ismethod then
		if len(form("newpass"))>0 then
			adminpass=md5(form("newpass"),1)
			conn.execute "update WebOriginadmin set adminpass='"&safe(adminpass)&"',adminlanguage='"&safe(adminlanguage)&"',admineditor='"&safe(admineditor)&"',diymenu='"&safe(diymenu)&"' where adminname='"&WebOrigin.name&"';"
			response.cookies(md5(WebOrigin_salt_admin,1))("name")=WebOrigin.name
			response.cookies(md5(WebOrigin_salt_admin,1))("pass")=adminpass
		else
			conn.execute "update WebOriginadmin set adminlanguage='"&safe(adminlanguage)&"',admineditor='"&safe(admineditor)&"',diymenu='"&safe(diymenu)&"' where adminname='"&WebOrigin.name&"';"
		end if
		response.redirect "manage.asp?action=myacccount"
	end if

end sub

sub WebOrigin_plugin()
	dim rs,dp,plugin,plugins,i,errortext,errorsystem,errorrepeat,plugintext
	dim incfun,inctag,inctagtext,scriptname,arrayscriptname',systempath
	errortext=true:errorsystem=true:errorrepeat=true

	WebOrigin.head "plugin",WebOrigin.lang("plugin/title")
	Il "<h2>"&WebOrigin.lang("plugin/title")&"</h2>"

	set dp=new record
		dp.action="manage.asp?action=pluginset"
		dp.but=dp.sect("install:"&encode(WebOrigin.lang("common/install"))&"|-|dict:"&encode(WebOrigin.lang("common/dict")))
		dp.js="'<input name=""list"" id=""list_'+K[0]+'"" type=""checkbox"" value=""'+K[1]+'""/>'+isplugin(K[2],K[1],K[7])"
		dp.js="K[1]"
		dp.js="K[3]"
		dp.js="K[4]"
		dp.js="K[5]"
		dp.js="K[6]"
		dp.js="isAbout(K[8],K[9],K[10],K[1])"
		Il dp.open

'		Il "<div class=""WO_form"">"
'		
'		Il WebOrigin_table_s'table
		Il "<tr><th>"&WebOrigin.lang("plugin/list/name")&"</th><th>"&WebOrigin.lang("plugin/list/folder")&"</th><th>"&WebOrigin.lang("plugin/list/version")&"</th><th>"&WebOrigin.lang("plugin/list/author")&"</th><th>"&WebOrigin.lang("plugin/list/source")&"</th><th>"&WebOrigin.lang("plugin/list/mail")&"</th><th>"&WebOrigin.lang("plugin/list/about")&"</th></tr>"
'
		Il "<script>"
		Il "WO_clear='"&htm2js(WebOrigin.lang("plugin/clear"))&"';"
		Il "function isplugin(l1,l2,l3){if(l3!='True'){return ('<span class=""red"">'+l1+'</span>');}else{return ('<a href=""../'+l2+'"">'+l1+'</a>');}};"&vbcrlf
		Il "function isAbout(k1,l2,l3,l4){var I1='';if(k1=='True'){I1+='<a href=""javascript:;"" onclick=""javascript:posthtm(\'manage.asp?action=pluginset\',\'aja\',\'submits=help&path='+l4+'\')"">["&WebOrigin.lang("common/help")&"]</a>'};if(l2=='True'){I1+='<a href=""javascript:;"" onclick=""javascript:posthtm(\'manage.asp?action=pluginset\',\'aja\',\'submits=tag&path='+l4+'\')"">["&WebOrigin.lang("common/tag")&"]</a>'};if(l3=='True'){I1+='<a href=""javascript:;"" onclick=""javascript:posthtm(\'manage.asp?action=pluginset\',\'flo\',\'submits=about&path='+l4+'\')"">["&WebOrigin.lang("common/about")&"]</a>'};if(I1.length>0){return I1}else{return '&nbsp;'};};"
		WebOrigin_plugin_list
		Il "</script>"

		Il dp.close

	set dp=nothing

	Il "</table>"

	Il "</div>"
	
end sub

sub WebOrigin_pluginset()
	WebOrigin.nocache

	dim rs,pname,i,incfun,inctagtext,inctag
	dim readfile
	dim list,lists
	dim plugins,newp

	list=form("list")


	select case form("submits")
	case"delete","dict"
		if len(list)>0 then

			if len(WebOrigin.plugin)>0 then
				plugins=split(WebOrigin.plugin,",")
				for i=0 to ubound(plugins)
					if WebOrigin.instre(list,plugins(i))=false then'没有在
						if len(newp)>0 then
							newp=newp&","&plugins(i)
						else
							newp=plugins(i)
						end if
					end if
				next

				conn.execute "update WebOriginsystem set plugin='"&safe(newp)&"';"
			end if

			if form("submits")="delete" then'删除目录
				lists=split(list,",")
				for i=0 to ubound(lists)
					WebOrigin.deletefolder "../"&trim(lists(i))
					WebOrigin.deletefolder WebOrigin_system&trim(lists(i))
				next
			end if

			'重新生成plugin.asp文件
			WebOrigin.createplugin
			WebOrigin.flo WebOrigin.lang("plugin/flo/"&form("submits")),1
		else
			WebOrigin.flo WebOrigin.lang("plugin/flo/select"),0
		end if
	case"install"
		if len(list)>0 then
			newp=WebOrigin.plugin
			lists=split(list,",")
			for i=0 to ubound(lists)
				if WebOrigin.instre(newp,lists(i))=false then
					if len(newp)>0 then
						newp=newp&","&lists(i)
					else
						newp=lists(i)
					end if
				end if
			next
			conn.execute "update WebOriginsystem set plugin='"&safe(newp)&"';"
			WebOrigin.createplugin
			WebOrigin.flo WebOrigin.lang("plugin/flo/install"),1
		else
			WebOrigin.flo WebOrigin.lang("plugin/flo/select"),0
		end if
	case"help","tag"
		readfile="<div class=""WO_form"">"&WebOrigin.ubbencode(WebOrigin.readfile(WebOrigin_system&form("path")&"/help/"&form("submits")&".htm"))&"</div>"
		WebOrigin.aja WebOrigin.lang("common/"&form("submits"))&" - "&WebOrigin.xmlang(form("path"),"title"),readfile
	case"about"
		readfile=WebOrigin.ubbencode(WebOrigin.readfile(WebOrigin_system&form("path")&"/help/"&form("submits")&".htm"))
		WebOrigin.flo readfile,2

	case else WebOrigin.flo WebOrigin.lang("error/invalid"),0
	end select
	
end sub

sub WebOrigin_plugin_list()
	WebOrigin.nocache
	dim fs,l8,l5,l6,l3,rs,j:j=1
	dim I1,ver

	set rs=conn.execute("select plugin from WebOriginsystem where systemname='WebOriginCMS';")
		if not rs.eof and not rs.bof then
			I1=rs(0)
		else
			WebOrigin.error WebOrigin.lang("error/invalid")
		end if
		rs.close
	set rs=nothing

	set fs=Server.CreateObject(WebOrigin_fso)
	l8=server.mappath(WebOrigin_system)
	if fs.folderexists(l8)=false then error lang("error/foldernone")&"<br/>"&WebOrigin_system'判断文件夹是否存在
	set l5=fs.getfolder(l8)
	for each l6 in l5.subfolders

		if WebOrigin.instre("system,[MODEL]",l6.name)=false then

'			Il "<tr>"
			ver=WebOrigin.xmlang(l6.name,"version")
			if ver="--" then ver="1.0"
			Il "ll("&j&",'"&htm2js(l6.name)&"','"&WebOrigin.xmlang(l6.name,"title")&"','"&ver&"','"&htm2js(WebOrigin.xmlang(l6.name,"author"))&"','"&htm2js(WebOrigin.xmlang(l6.name,"source"))&"','"&htm2js(WebOrigin.xmlang(l6.name,"mail"))&"','"&WebOrigin.instre(I1,l6.name)&"','"&WebOrigin.isexist(WebOrigin_system&l6.name&"/help/help.htm")&"','"&WebOrigin.isexist(WebOrigin_system&l6.name&"/help/tag.htm")&"','"&WebOrigin.isexist(WebOrigin_system&l6.name&"/help/about.htm")&"');"
			j=j+1
		end if
	next
end sub

sub WebOrigin_logout()
	dim cookiesname:cookiesname=request.cookies(md5(WebOrigin_salt_admin,1))("name")
	response.cookies(md5(WebOrigin_salt_admin,1))("name")=""
	response.cookies(md5(WebOrigin_salt_admin,1))("pass")=""
	response.cookies(md5(WebOrigin_salt_admin,1)).expires=date-100
	if len(cookiesname)>0 then
		conn.execute "insert into WebOriginlog (adminname,lognum,ip,logdate) values ('"&safe(cookiesname)&"',3,'"&safe(WebOrigin.ip)&"','"&tnow&"')"
	end if
	response.redirect "../system/login.asp"
end sub

%>