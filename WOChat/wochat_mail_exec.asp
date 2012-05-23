<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
Session.CodePage = 65001

Set Mail = Server.CreateObject("Persits.MailSender") 

Mail.Host = "mx.hosting.isx.net.nz" ' Required
Mail.Port = 25 
Mail.From = "webcustomer@weborigin.co.nz" ' Required
Mail.FromName = "webcustomer@weborigin.co.nz" ' Optional
Mail.Username = "webcustomer@weborigin.co.nz"
Mail.Password = "weborigin"

Mail.AddAddress "leask@weborigin.co.cn", "Leask"

Mail.CharSet = "UTF-8"
Mail.ContentTransferEncoding = "Quoted-Printable"

Mail.Subject = Mail.EncodeHeader( "Test Mail 中文邮件测试", "utf-8")

Mail.Body = "sfadsfd"
'Mail.Subject = "Sales Receipt"
'Mail.Body = "<HTML><BODY BGCOLOR=#0000FF>Dear John:....</BODY></HTML>"
'Mail.IsHTML = True
'Mail.AddAttachment "c:\dir\receipt.doc"

On Error Resume Next
Mail.Send
If Err <> 0 Then
  Response.Write "An error occurred: " & Err.Description
End If
%> 