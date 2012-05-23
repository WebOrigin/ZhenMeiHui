<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Server.ScriptTimeOut=5000 %>
<!--#include FILE="upload.inc"--> 
<%
myemail = "info@exoticspray.co.nz"
myname = "Exotic"
smtpserver = "mail.weborigin.co.nz"
smtpuser = "exotic@weborigin.co.nz"
smtppwd = "qwertyuiop"
smtpemail = "exotic@weborigin.co.nz"

dim upload,file,formName,formPath 
set upload=new upload_5xSoft

CName = upload.form("Name")
CMail = upload.form("Email")
CPhone = upload.form("Phone")
CMesg = upload.form("Message")
CNews = upload.form("newsL")
Country= upload.form("Country")

set jmail=server.CreateObject ("jmail.message")

jmail.From = "exotic@weborigin.co.nz"
jmail.FromName = CName
jmail.ReplyTo = CMail
jmail.Subject = "Web Customer: " & CName 

jmail.Body = "Name: " & CName & vbcrlf & vbcrlf & "E-mail: " & CMail & vbcrlf & vbcrlf & "Phone: " & CPhone & vbcrlf & vbcrlf & "Message:" & vbcrlf & CMesg & vbcrlf & vbcrlf & "Newsletter:" & vbcrlf & CNews

jmail.AddRecipient myemail,myname
jmail.MailServerUserName = smtpuser
jmail.MailServerPassWord = smtppwd

isgo=jmail.Send(smtpserver)

select case lcase(Country)
	case "nz"
		Response.Redirect("http://www.exoticspray.co.nz/Respond/index.asp?mail=" & CMail & "&news=" & CNews)
	case "usa"
		Response.Redirect("http://www.exoticspray.com/Respond/index.asp?mail=" & CMail & "&news=" & CNews)
	case "uk"
		Response.Redirect("http://www.exoticspray.co.uk/Respond/index.asp?mail=" & CMail & "&news=" & CNews)
	case "sk"
		Response.Redirect("http://www.exoticspray.sk/Respond/index.asp?mail=" & CMail & "&news=" & CNews)
	case "za"
		Response.Redirect("http://www.exoticspray.co.za/Respond/index.asp?mail=" & CMail & "&news=" & CNews)
	case "au"
		Response.Redirect("http://www.exoticspray.com.au/Respond/index.asp?mail=" & CMail & "&news=" & CNews)
end select

jmail.Close
set jmail=nothing
%>