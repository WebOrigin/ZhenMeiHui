<!--#include file="../system/plugin.asp"-->
<%
'***  ***  ***  ***  ***
'     用户中心首页
'***  ***  ***  ***  ***

dim one
set WebOrigin=new WebOriginCMS
WebOrigin.checkplugin WebOrigin.path'检查插件安装状态
set one=new onepage
	select case action
	case"" WebOrigin_def
	end select
set one=nothing
set WebOrigin=nothing
'def
sub WebOrigin_def()
	WebOrigin.nocache
	dim rs,listid,sql,jstime
	listid=quest("listid",0)
	jstime=quest("time",0)

	if validate(listid,6) then
		sql="select oneid from WebOriginonepage where oneid in ("&listid&");"
	else
		sql="select oneid from WebOriginonepage where onepath=''"
	end if

	set rs=conn.execute(sql)
		if not rs.eof and not rs.bof then
			one.create rs(0)
		end if
		rs.close
	set rs=nothing
	WebOrigin.savetofile "update.js",one.updatejs(listid,jstime)'创建日期文件
end sub
%>