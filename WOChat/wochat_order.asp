<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
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
</head>

<body class="chat_bg">
<form action="http://www.joyme.org/wochat/womail_exec.asp" method="post" name="form_order" target="_top" id="form_order" onsubmit="MM_validateForm('Name','','R','E-Mail','','RisEmail');return document.MM_returnValue">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    <td height="2">
    </td>
    </tr>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="65" align="left" class="order_fm_t">姓名*：</td>
          <td align="left"><input name="Name" type="text" class="order_fm_i" id="Name" /></td>
        </tr>
      </table></td>
    </tr>
               <tr>
                <td height="2"></td>
              </tr>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="65" align="left" class="order_fm_t">E-mail*：</td>
          <td align="left"><input name="E-Mail" type="text" class="order_fm_i" id="E-Mail" /></td>
        </tr>
      </table></td>
    </tr>
                <tr>
                <td height="2"></td>
              </tr>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="65" align="left" class="order_fm_t">约诊部门：</td>
          <td align="left"><select name="st_depart" class="order_fm_i" id="st_depart">
            <option value="请选择">请选择</option>
            <option value="整形整容">美学整容</option>
            <option value="激光美容">激光美容</option>
            </select></td>
        </tr>
      </table></td>
    </tr>
                 <tr>
                <td height="2"></td>
              </tr>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="65" align="left" class="order_fm_t">电话：</td>
          <td align="left"><input name="Telephone" type="text" class="order_fm_i" id="Telephone" /></td>
        </tr>
      </table></td>
    </tr>
                 <tr>
                <td height="2"></td>
              </tr>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="65" align="left" class="order_fm_t">预约时间：</td>
          <td align="left"><input name="Time" type="text" class="order_fm_i" id="Time" /></td>
        </tr>
      </table></td>
    </tr>
                   <tr>
                <td height="2"></td>
              </tr>
    <tr>
      <td align="center"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="65"><input type="hidden" name="exec_type" id="exec_type" value="order" /></td>
          <td align="left"><input type="submit" name="Submit" id="Submit" value="提交" /></td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
</body>
</html>