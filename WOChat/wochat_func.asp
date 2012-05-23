<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT> 
sub Group_Cls
	application.Lock()
		application("user_group")="xshan"
	application.UnLock()
end sub


sub Group_Add(str_add)
	dim fi_a
	dim bol_find
	dim str_grp
	if lcase(str_add)="root" or str_add=Session.SessionID or str_add="0" then exit sub
	str_grp=split(application("user_group"),"|")
	bol_find=false
	for fi_a = 0 to ubound(str_grp)
		if lcase(str_grp(fi_a))=lcase(str_add) then
			bol_find=true
			exit for
		end if
	next
	if bol_find=false then
		application.Lock()
			application("user_group")=application("user_group") & "|" & str_add
		application.UnLock()
	end if
end sub

sub New_Add(str_add)
	dim fi_a
	dim bol_find
	dim str_grp
	if lcase(str_add)="root" or str_add="0" then exit sub
	str_grp=split(application("new_msg"),"|")
	bol_find=false
	for fi_a = 0 to ubound(str_grp)
		if lcase(str_grp(fi_a))=lcase(str_add) then
			bol_find=true
			exit for
		end if
	next
	if bol_find=false then
		application.Lock()
			application("new_msg")=application("new_msg") & "|" & str_add
		application.UnLock()
	end if
end sub


sub New_Rmv(str_add)
	dim fi_a
	dim str_grp
	if lcase(str_add)="root" or str_add="0" then exit sub
	str_grp=split(application("new_msg"),"|")
	application.Lock()
		application("new_msg")=""
		for fi_a = 0 to ubound(str_grp)
			if lcase(str_grp(fi_a))<>lcase(str_add) then
				application("new_msg")=application("new_msg") & "|" & str_grp(fi_a)
			end if
		next
	application.UnLock()
end sub


function Get_Guest(guest_id)
	Get_Guest="咨询" & right(guest_id,3)
end function


</SCRIPT>