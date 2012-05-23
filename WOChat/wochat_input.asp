<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include FILE="wochat_func.asp"-->
<%
dim wmode
dim wmodex
select case request("wdm")
	case "l"
		wmode="lon"
		wmodex="100%"
		wmodey="class=""chat_input_3"""
	case "w"
		wmode="yes"
		wmodex="100%"
		wmodey="class=""chat_input_2"""
	case else
		wmode="no"
		wmodex="170"
		wmodey="class=""chat_input"""
end select
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>WebOrigin Chat - by Leask Huang</title>
<link href="../template/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function MM_validateForm() { //v4.0
  if (document.getElementById){
    var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
    for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=document.getElementById(args[i]);
      if (val) { nm=val.name; if ((val=val.value)!="") {
        if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
          if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
        } else if (test!='R') { num = parseFloat(val);
          if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
          if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
            min=test.substring(8,p); max=test.substring(p+1);
            if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
      } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
    } if (errors) alert('The following error(s) occurred:\n'+errors);
    document.MM_returnValue = (errors == '');
} }
//-->
</script>
<script language="javascript">
<!--
　　function KeyDown()
　　{
　　 if (event.keyCode == 13)
　　 {
　　 event.returnValue=false;
　　 event.cancel = true;
　　 form_send.submit.click();
　　 }
　　}
//-->
</script>
</head>
<body class="chat_bg">
<form action="/wochat/wochat_exec.asp" method="post" name="form_send" id="form_send">
<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="div_input">
  <tr>
    <td align="center">
    <table width="<%=wmodex%>" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left"><textarea name="Sentext" rows="2" <%=wmodey%> id="Sentext" onKeyDown="KeyDown()"></textarea><input name="wmode" type="hidden" value="<%=wmode%>" /></td>
        <td align="right"><input name="submit" type="submit" id="submit" onClick="MM_validateForm('Sentext','','R');return document.MM_returnValue" value="发送" /></td>
        </tr>
</table></td>
  </tr>
</table>
</form>
<script language="javascript">
	<!--
	document.getElementById('Sentext').focus();
	-->
	</script>
</body>
</html>