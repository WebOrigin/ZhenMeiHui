<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="wochat_func.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Refresh" content="3">
<title>WebOrigin Chat - by Leask Huang</title>
<link href="../template/images/style.css" rel="stylesheet" type="text/css" />
</head>

<body class="chat_bg">
<div class="chatext">
<%
dim act_cmd, act_flag
dim ti_a
dim ti_ts, ti_t1, ti_t2
dim ictxt
dim ce_nrg


act_cmd=lcase(Session("dis_action"))
act_flag=0

select case lcase(act_cmd)
	case "nouser"
		response.Write("没有用户在线。")
		act_flag=1
	case "noadmin"
		response.Write("管理员目前不在线。<br /><a href=""mailto:cms@weborigin.co.nz"">cms@weborigin.co.nz</a>")
		act_flag=2
	case "select"
		act_flag=3
end select

Session("dis_action")=""

Group_Cls

if act_flag=0 or act_flag=3  then
	ti_ts=split(application("Chatext"),"{WOBR/}")
	for ti_a=0 to ubound(ti_ts)
		if left(ti_ts(ti_a),5)= "{WOC:" then
			ti_t1=split(ti_ts(ti_a),"&_}")
			ti_t2=split(ti_t1(0),":")
			if Session("user_id")="root" then
					Group_Add ti_t2(1)
					Group_Add ti_t2(2)
					if act_flag=0 then
						if ti_t2(1)=Session("user_msg") then
							response.Write(Get_Guest(ti_t2(1)) & ": " & ti_t1(1) & "<br />")
							New_Rmv Session("user_msg")
						end if
						if ti_t2(2)=Session("user_msg") then
							response.Write("我: " & ti_t1(1) & "<br />")
						end if
					end if
				else
					if ti_t2(1)=Session("user_id") then
						response.Write("我: " & ti_t1(1) & "<br />")
					end if
					if ti_t2(2)=Session("user_id") then
						response.Write("医生: " & ti_t1(1) & "<br />")
					end if
			end if
		end if
	next
	
	if Session("user_id")="root" then
		response.Write("<hr />")
		str_grp=split(application("user_group"),"|")
		for fi_a = 0 to ubound(str_grp)
			if str_grp(fi_a)<>"xshan" then
				ictxt=""
				if Session("user_msg")=str_grp(fi_a) then
						ictxt="<img style=""margin-bottom:-5px;"" src=""/template/images/now.gif"" />"
					else
						ce_nrg=split(application("new_msg"),"|")
						for fi_n = 0 to ubound(ce_nrg)
							if ce_nrg(fi_n)=str_grp(fi_a) then
								ictxt="<img style=""margin-bottom:-5px;"" src=""/template/images/new.gif"" />"
							end if
						next
				end if
				response.Write(ictxt & "<a href=""wochat_exec.asp?select_u=" & str_grp(fi_a) & """>" & Get_Guest(str_grp(fi_a)) & "</a>&nbsp;<a href=""wochat_exec.asp?cna=" & str_grp(fi_a) & """>[X]</a>&nbsp;&nbsp;&nbsp;")
			end if
		next
	end if
end if
%>
</div>

<script language="javascript">
this.scroll(0, 65000);
</script>

</body>
</html>
