﻿<!--#include file="fun.asp"-->
<%
set WebOrigin=new WebOriginCMS

dim fs,empath,I1,l1,outhtm

on error resume next

set fs=Server.CreateObject(WebOrigin_fso)
empath=server.mappath("../../"&WebOrigin_templates&"/image/em")
if fs.folderexists(empath) then
	set I1=fs.getfolder(empath)
	for each l1 in I1.files
		if len(l1.name)>4 then
'			if lcase(right(l1.name,4))=".gif" then
			if validate(l1.name,"^(\d{1,2})\.gif$") then
				outhtm=outhtm&"<a href=""javascript:;"" onclick=""javascript:ubb.EmoShow('"&left(l1.name,len(l1.name)-4)&"');""><img src="""&WebOrigin.inst&WebOrigin_templates&"/image/em/"&l1.name&"""/></a>"
			end if
		end if
	next
	set I1=nothing
	set l1=nothing
end if

WebOrigin.txt outhtm
set WebOrigin=nothing

%>