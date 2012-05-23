<!--#include file="config.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WebOrigin Content Management System - Version 5.0</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
</head>
<body>


<div id="top">
	<a id="logo" href="http://www.weborigin.co.nz" target="_blank"><img src="images/logo.png"/></a>
	<div id="topright">
		<div id="topmenu">
		<a href="http://www.weborigin.co.nz/" target="_blank">WebOrigin</a>
		</div>
	</div>
</div>

<div id="login">
	<form name="form1" method="post" action="login.asp">

		<%'   leask add begin   %>
		<h3><strong>WebOrigin</strong> CMS 5</h3>
		<p>New Power in your site!</p>
		<%'   end   %>

		<div>
			<table cellspacing="0">
				<tr>
					<td>
						<p style="line-height:30px;"><label>用户名:</label><input class="in2" size="14" type="text" name="adminname" maxlength="12" /></p>
						<p style="line-height:26px;"><label>密码:</label><input class="in2" size="14" type="password" name="adminpass" maxlength="30" /></p>
					</td>
					<th>
						<p class="WO_menu"><input type="submit" value="登陆" style="padding:14px 6px;margin-left:10px;" /></p>
					</th>
				</tr>	
			</table>
		</div>

		<%'   Leask add begin   %>
		<p><a href="http://www.weborigin.co.nz/" target="_blank">http://www.weborigin.co.nz</a></p>
		<p><a href="mailto:cms@weborigin.co.nz" target="_blank">E-mail:cms@weborigin.co.nz</a></p>
		<%'   end   %>
	</form>

<%

dim adminname,adminpass,adminsalt,rs,doc,ip,logcount,sql
adminname=left(form("adminname"),12)
if len(adminname)>0 and len(form("adminpass"))>0 then
	adminpass=md5(form("adminpass"),1)

	on error resume next

	set conn=server.createobject("adodb.connection")
	conn.open objconn

	if err.number<>0 then
		set doc=Server.CreateObject(WebOrigin_xmldom)
		doc.async=false
		doc.load(server.mappath(WebOrigin_system&"system/language/"&WebOrigin_language&".xml"))
		response.clear
		response.write doc.documentElement.SelectSingleNode("//WebOriginCMS/error/db").text
		response.end()
	end if
	err.clear

	ip=request.servervariables("http_x_forwarded_for")
	if ip="" then ip=request.servervariables("remote_addr")

	if WebOrigin_dbtype=1 then
		sql="select count(logid) from WebOriginlog where ip='"&safe(ip)&"' and lognum=2 and getdate()-logdate<0.25;"
	else
		sql="select count(logid) from WebOriginlog where ip='"&safe(ip)&"' and lognum=2 and now()-logdate<0.25;"
	end if
	logcount=conn.execute(sql)(0)
	if logcount>=WebOrigin_loginnum then
		response.write "<p class=""red"">您尝试登录次数过多，已被系统锁定</p>"
	else
		set rs=conn.execute("select adminid from WebOriginadmin where adminname='"&safe(adminname)&"' and adminpass='"&safe(adminpass)&"';")
			if not rs.eof and not rs.bof then
				conn.execute "update WebOriginadmin set admindate='"&tnow&"',admincount=admincount+1 where adminname='"&safe(adminname)&"';"
				conn.execute "insert into WebOriginlog (adminname,lognum,ip,logdate) values ('"&safe(adminname)&"',1,'"&safe(ip)&"','"&tnow&"')"
				response.cookies(md5(WebOrigin_salt_admin,1))("name")=adminname
				response.cookies(md5(WebOrigin_salt_admin,1))("pass")=adminpass'newpass
				response.redirect "manage.asp"
			else
				conn.execute "insert into WebOriginlog (adminname,lognum,ip,logdate) values ('"&safe(adminname)&"',2,'"&safe(ip)&"','"&tnow&"')"
				if WebOrigin_loginnum-logcount=1 then
					response.write "<p class=""red"">您尝试登录次数过多，已被系统锁定</p>"
				else
					response.write "<p class=""red"">您的帐号或密码有误 !还有"&(WebOrigin_loginnum-logcount-1)&"次登录的机会。</p>"
				end if
			end if
			rs.close
		set rs=nothing
	end if
	


end if
%>

</div>
<hr/>
<p><a href="http://www.weborigin.co.nz" target="_blank">&copy 2008 WebOrigin. All rights reserved | Design by WebOrigin</a></p>

</body>
</html>