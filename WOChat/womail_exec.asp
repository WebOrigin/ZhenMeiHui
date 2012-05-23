<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Server.ScriptTimeOut=5000 %>

<% 


dim exec_type
dim st_name
dim st_mail
dim st_msg
dim st_tel
dim st_depart
dim st_time
dim st_sub

dim myemail
dim myname
dim smtpserver
dim smtpuser
dim smtppwd
dim smtpemail

dim news_w


exec_type=Request.Form("exec_type")
st_name=Request.Form("Name")
st_mail=Request.Form("E-mail")
st_msg=Request.Form("Message")
st_tel=Request.Form("Telephone")
st_depart=Request.Form("st_depart")
st_time=Request.Form("Time")
st_sub=Request.Form("st_sub")

myemail = "admin@zhenmeihui.com"
myname = "Joyme"
smtpserver = "mail.zhenmeihui.com"
smtpuser = "guest@zhenmeihui.com"
smtppwd = "000000"
smtpemail = "guest@zhenmeihui.com"

set jmail = server.CreateObject ("jmail.message")

Jmail.Charset="GB2312"
jmail.From = "guest@zhenmeihui.com"
jmail.FromName = st_mail
jmail.ReplyTo = st_mail
select case lcase(exec_type)
	case "sub"
		jmail.Subject = "[真美会][订阅电子期刊]"
		if st_sub="true" then
				news_w="订阅"
			else
				news_w="取消订阅"
		end if
		jmail.Body ="E-mail: " & st_mail & vbcrlf & vbcrlf & "Newsletter: " & news_w
	case "order"
		jmail.Subject = "[真美会][在线预约]"
		jmail.Body ="Name:" & st_name & vbcrlf & vbcrlf & "E-mail: " & st_mail & vbcrlf & vbcrlf & "约诊部门: " & st_depart & vbcrlf & vbcrlf & "Telephone: " & st_tel  & vbcrlf & vbcrlf & "Time: " & st_time 
	case "msg"
		jmail.Subject = "[真美会][在线留言]"
		jmail.Body ="E-mail: " & st_mail & vbcrlf & vbcrlf & "Message: " & st_msg
	case "cont"
		jmail.Subject = "[真美会][联系我们]"
		jmail.Body ="Name:" & st_name & vbcrlf & vbcrlf & "Telephone: " & st_tel  & vbcrlf & vbcrlf & "E-mail: " & st_mail & vbcrlf & vbcrlf & "Message: " & st_msg
end select

jmail.AddRecipient myemail,myname
jmail.MailServerUserName = smtpuser
jmail.MailServerPassWord = smtppwd

isgo=jmail.Send(smtpserver)

'select case exec_type
'	case "sub"
'	case "order"
'	case "msg"
'end select

Response.Redirect("/send_success/")

jmail.Close
set jmail=nothing
%>