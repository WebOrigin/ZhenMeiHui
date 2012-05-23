<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>WebOrigin Chat - by Leask Huang</title>
<link href="../template/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function clean_fm(fmi){
	switch(fmi){
		case 1:
			if (document.getElementById('Message').value=='我们的专家目前不在线，如有疑问请在这里填写您的问题，我们的专家将尽快给您回复。'){
				document.getElementById('Message').value=''
			}
		break;
		case 2:
			if (document.getElementById('E-mail').value=='请填入联系电邮地址'){
				document.getElementById('E-mail').value=''
			}
		break;		
	}
}
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
</head>

<body class="chat_bg">
<form action="http://www.joyme.org/wochat/womail_exec.asp" method="post" name="form_mail" target="_top" id="form_mail">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    <td height="3">
    </td>
    </tr>
    <tr>
      <td align="center"><textarea name="Message" class="chat_mail" id="Message" onfocus="clean_fm(1);" >我们的专家目前不在线，如有疑问请在这里填写您的问题，我们的专家将尽快给您回复。</textarea>
      <input type="hidden" name="exec_type" id="exec_type" value="msg" /></td>
    </tr>
      	<tr>
    <td height="3">
    </td>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td align="left"><input name="E-mail" type="text" class="chat_input" id="E-mail" value="请填入联系电邮地址" onfocus="clean_fm(2);" /></td>
            <td align="right"><input name="Submit" type="submit" class="chat_button" id="Submit" onclick="MM_validateForm('E-mail','','RisEmail','Message','','R');return document.MM_returnValue" value="提交" /></td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>
