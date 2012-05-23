<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="wochat_func.asp"-->

<%
Option Explicit

dim Sentext
dim Select_U
dim cna
dim ti_a
dim ti_ts, ti_t1, ti_t2
dim rd_st
dim clog
dim wmode
dim jmail
dim myemail
dim myname
dim smtpserver
dim smtpuser
dim smtppwd
dim smtpemail
dim isgo

Sentext=request("Sentext")
Select_U=request("Select_U")
cna=request("cna")
wmode=request("wmode")

if len(Sentext)>0 and len(Select_U)=0 and len(cna)=0 then
	select case Sentext
		case "wosh>login root:123456"
			Session("user_id")="root"
			application.lock()
				application("user_admin")=True
			application.UnLock()
			if application("user_num")>1 then
					Session("dis_action")="select"
				else
					Session("dis_action")="nouser"
			end if
		case "wosh>logout"
			Session("user_id")=Session.SessionID
			application.lock()
				application("user_admin")=False
			application.UnLock()
		case "wosh>cls"
			application.lock()
				application("Chatext")=""
			application.UnLock()
		case else
			'if len(application("Chatext"))>4900 then
			'	application("Chatext")=right(application("Chatext"),4900)
			'end if
			if Session("user_id")="root" then
				if application("user_num")>1 then
						application.Lock()
							application("Chatext")=application("Chatext") & "{WOC:root" & ":" & Session("user_msg") & "&_}" &  Sentext & "{WOBR/}"
						application.UnLock()
					else
						Session("dis_action")="nouser"
				end if
			else
				if application("user_admin")=True then
						application.Lock()
							application("Chatext")=application("Chatext") & "{WOC:" & Session("user_id") & ":root" & "&_}" &  Sentext & "{WOBR/}"
						application.UnLock()
						New_Add Session("user_id")
					else
						Session("dis_action")="noadmin"
				end if
			end if
	end select
end if

rd_st=0
clog=""

if len(Select_U)>0 then rd_st=1
if len(cna)>0 then rd_st=2

select case rd_st
	case 0
		select case wmode
			case "yes"
				response.Redirect("wochat_input.asp?wdm=w")
			case "lon"
				response.Redirect("wochat_input.asp?wdm=l")
			case else
				'response.Write("no")
				response.Redirect("wochat_input.asp")
		end select
	case 1
		Session("user_msg")=Select_U
		application.Lock()
			application("Chatext")=application("Chatext") & "{WOC:root:root&_}" &  Select_U & "{WOBR/}"
		application.UnLock()
		response.Redirect("wochat_display.asp")
	case 2
		ti_ts=split(application("Chatext"),"{WOBR/}")
		for ti_a=0 to ubound(ti_ts)
			if left(ti_ts(ti_a),5)= "{WOC:" then
				ti_t1=split(ti_ts(ti_a),"&_}")
				ti_t2=split(ti_t1(0),":")
				if ti_t2(1)=cna or ti_t2(2)=cna then
					clog=clog & ti_t2(1) & ":" & ti_t1(1) & vbcrlf
				end if
			end if
		next
		application.Lock()
			application("Chatext")=""
			for ti_a=0 to ubound(ti_ts)
				if left(ti_ts(ti_a),5)= "{WOC:" then
					ti_t1=split(ti_ts(ti_a),"&_}")
					ti_t2=split(ti_t1(0),":")
					if ti_t2(1)<>cna and ti_t2(2)<>cna then
						application("Chatext")=application("Chatext") & ti_ts(ti_a) & "{WOBR/}"
					end if
				end if
			next
		application.UnLock()
		set jmail = server.CreateObject ("jmail.message")
		myemail = "joyme.chat@gmail.com"
		myname = "Joyme"
		smtpserver = "mail.zhenmeihui.com"
		smtpuser = "guest@zhenmeihui.com"
		smtppwd = "000000"
		smtpemail = "guest@zhenmeihui.com"
		Jmail.Charset="GB2312"
		jmail.From = "guest@zhenmeihui.com"
		jmail.FromName = myname
		jmail.ReplyTo = myemail
		jmail.Subject = "[真美汇][在线咨询记录]"
		jmail.Body = clog
		jmail.AddRecipient myemail,myname
		jmail.MailServerUserName = smtpuser
		jmail.MailServerPassWord = smtppwd

		isgo=jmail.Send(smtpserver)
		response.Redirect("wochat_display.asp")
end select

%>