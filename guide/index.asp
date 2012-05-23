<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/cms_conn_a.asp" -->
<%
var frameT=new Array();
var getListTemp=new Array();

if (String(Request.QueryString('ls')) != 'undefined' )
{
	var ls=String(Request.QueryString('ls'));
}else{
	var ls='-1';
}

if (String(Request.QueryString('chn')) != 'undefined' )
{
	var chn=String(Request.QueryString('chn'));
}else{
	var chn='1';
}

if (String(Request.QueryString('dir')) != 'undefined' )
{
	var dir=String(Request.QueryString('dir'));
}else{
	var dir='-1';
}

function getList(id)
{
	var Recordset_T__MMColParam = id;
	var Recordset_T_cmd = Server.CreateObject ("ADODB.Command");
	Recordset_T_cmd.ActiveConnection = MM_cms_conn_a_STRING;
	Recordset_T_cmd.CommandText = "SELECT * FROM WebOrigineasyart_list WHERE listid = ?";
	Recordset_T_cmd.Prepared = true;
	Recordset_T_cmd.Parameters.Append(Recordset_T_cmd.CreateParameter("param1", 5, 1, -1, Recordset_T__MMColParam)); // adDouble
	var Recordset_T = Recordset_T_cmd.Execute();
	var Recordset_T_numRows = 0;
	return [Recordset_T.Fields.Item('listname').Value,Recordset_T.Fields.Item('listpath').Value]
	Recordset_T.Close();
}

switch (chn)
{
	case '1':
		var lnum=6;
	break;
	case '2':
		var lnum=5;
	break;
}

for(var fi=0;fi<lnum;fi++) 
{
	frameT[fi]=new Array();
	frameT[fi][1]=new Array();
	frameT[fi][2]=new Array();
	frameT[fi][3]=new Array();
	frameT[fi][4]=new Array();
}

switch (chn)
{
	case '1':
		frameT[0][0]='五官整形';
		frameT[0][1]=[4,6,32,33,34];
		frameT[0][5]='/template/images/wuguanzhengxing.jpg';
		
		frameT[1][0]='面部年轻化';
		frameT[1][1]=[8,9];
		frameT[1][5]='/template/images/mianbunianqinghua.jpg';
		
		frameT[2][0]='乳房整形';
		frameT[2][1]=[10,11,12,13,14,15];
		frameT[2][5]='/template/images/rufangzhengxing.jpg';
		
		frameT[3][0]='面形修改';
		frameT[3][1]=[16,17,18,19,20];
		frameT[3][5]='/template/images/mianbuzhengxing.jpg';
		
		frameT[4][0]='吸脂瘦身';
		frameT[4][1]=[21,22,23];
		frameT[4][5]='/template/images/xizhishoushen.jpg';
		
		frameT[5][0]='私密整形';
		frameT[5][1]=[24,25,26,38];
		frameT[5][5]='/template/images/shimizhengxing.jpg';
	break;
	case '2':
		frameT[0][0]='光子美白焕肤';
		frameT[0][1]=[27];
		frameT[0][5]='/template/images/guangzimeibai.jpg';
		
		frameT[1][0]='激光脱毛';
		frameT[1][1]=[28];
		frameT[1][5]='/template/images/jiguangtuomao.jpg';
		
		frameT[2][0]='祛各种疤痕';
		frameT[2][1]=[29];
		frameT[2][5]='/template/images/qugezhongbahen.jpg';
		
		frameT[3][0]='治疗色素疾病';
		frameT[3][1]=[30];
		frameT[3][5]='/template/images/jiguangzhiliaoseshujibing.jpg';
		
		frameT[4][0]='血管病变治疗';
		frameT[4][1]=[31];
		frameT[4][5]='/template/images/xueguanbingbianzhiliao.jpg';
	break;
}

for (var fia=0;fia<lnum;fia++)
{
	for (var fib=0;fib<frameT[fia][1].length;fib++)
	{
		getListTemp=getList(frameT[fia][1][fib])
		frameT[fia][2][fib]=getListTemp[0];
		frameT[fia][3][fib]=getListTemp[1];
		frameT[fia][4][fib]=new Array();
		frameT[fia][4][fib][0]=new Array();
		frameT[fia][4][fib][1]=new Array();
		var Recordset_GD__MMColParam = frameT[fia][1][fib];
		var Recordset_GD_cmd = Server.CreateObject ("ADODB.Command");
		Recordset_GD_cmd.ActiveConnection = MM_cms_conn_a_STRING;
		Recordset_GD_cmd.CommandText = "SELECT * FROM WebOrigineasyart WHERE listid = ? ORDER BY artorder ASC";
		Recordset_GD_cmd.Prepared = true;
		Recordset_GD_cmd.Parameters.Append(Recordset_GD_cmd.CreateParameter("param1", 5, 1, -1, Recordset_GD__MMColParam)); // adDouble
		var Recordset_GD = Recordset_GD_cmd.Execute();
		var Recordset_GD_numRows = 0;
		var Repeat1__numRows = -1;
		var Repeat1__index = 0;
		Recordset_GD_numRows += Repeat1__numRows;
		while ((Repeat1__numRows-- != 0) && (!Recordset_GD.EOF)) {
			frameT[fia][4][fib][0][Repeat1__index]=Recordset_GD.Fields.Item("arttitle").Value
			frameT[fia][4][fib][1][Repeat1__index]=Recordset_GD.Fields.Item("artid").Value
			Repeat1__index++;
			Recordset_GD.MoveNext();
		}
		Recordset_GD.Close();
	}
}
%>          
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="美学整容;五官整形;眼部整形;鼻部整形;眉部整形;耳部整形;唇部整形;面部年轻化;面部提紧除皱;注射除皱;乳房整形;丰胸概述;假体隆乳术;自体脂肪丰乳;乳房下垂上提;巨乳缩小;乳头乳晕整形;面形修改;下颌角缩窄;颧弓降低;颊脂垫摘除;咬肌注射;面部充填;吸脂瘦身;360度立体无暇塑身;腹壁整形;其它部位抽脂;妇科整形;性别重塑;整形修复;私密整形;阴茎延长增粗;激光美容;光子美白焕肤;激光脱毛;祛各种疤痕;色素疾病治疗;血管病变治疗" />

<title><%=frameT[ls][0]%> - 真美汇</title>
<link href="/template/images/style.css" rel="stylesheet" type="text/css" />
<link rel="StyleSheet" href="/ltree_api/ltree.css" type="text/css" />
<script type="text/javascript" src="/ltree_api/ltree.js"></script>
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
<script type="text/javascript">

var xMcl= new Array();

var sID=0;
var sAll=0;
var sIntX=165;
var sIntY=130;
var chn='<%=chn%>';
var tiLeft=11;

function move_title(xid)
{
	var tiTger = Math.round(621/<%=frameT[ls][1].length%>*xid)
	xMove('rabg', tiLeft, tiTger, 100);
	tiLeft=tiTger
}

function url_exec(xid)
{
	var url_base='/guide/index.asp?ls=';
	writeCookie('ltree_'+chn, xid, 24);
	for (var si=0; si<=xMcl.length; si++)
	{
		if (xid==xMcl[si])
		{
			location.href=url_base+si+'&chn='+chn;
			break;
		}
	}
}
</script>
<style type="text/css">
img {
	behavior: url(../template/images/iepngfix.htc);
}
.top_info_cell{
	behavior: url(../template/images/iepngfix.htc);
}
.five_info_cell{
	behavior: url(../template/images/iepngfix.htc);
}
</style>
</head>

<body class="home_bg_body">
<table width="1019" border="0" align="center" cellpadding="0" cellspacing="0" class="home_bg_2">
  <tr>
    <td height="100" align="center" valign="top"><table width="977" border="0" cellspacing="0" cellpadding="0" class="new_top">
      <tr>
        <td height="23">&nbsp;</td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="187"><img src="../template/images/zmh_03.png" width="187" height="80" /></td>
            <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><div class="top_info_bar">
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    style="left:0px;" id="top_info_0"> Home </div>
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_1"> About Us </div>
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_2"> Our Team </div>
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_3"> Plastics Surgery </div>
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_4"> Laser Treatment </div>
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_5"> Contact Us </div>
                  <div class="top_info_cell"  onmouseover="show_menu(-2);"    style="left:653px;" id="top_info_6"> Joyme Club </div>
                </div></td>
              </tr>
              <tr>
                <td><div class="menu_ex">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="113" height="27"><div class="new_top_button" id="new_menu_0" onmouseover="show_menu(0);">
                        <div class="t_menu_font"><a href="/home/">首页</a></div>
                      </div></td>
                      <td width="113"><div class="new_top_button" id="new_menu_1" onmouseover="show_menu(1);">
                        <div class="t_menu_font"><a href="/about/">关于真美</a></div>
                      </div></td>
                      <td width="113"><div class="new_top_button" id="new_menu_2" onmouseover="show_menu(2);">
                        <div class="t_menu_font">专家团队</div>
                      </div></td>
                      <td width="113"><div class="new_top_button" id="new_menu_3" onmouseover="show_menu(3);">
                        <div class="t_menu_font"><a href="/guide/index_slide.asp?chn=1">美学整容</a></div>
                      </div></td>
                      <td width="113"><div class="new_top_button" id="new_menu_4" onmouseover="show_menu(4);">
                        <div class="t_menu_font"><a href="/guide/index_slide.asp?chn=2">激光美容</a></div>
                      </div></td>
                      <td width="113"><div class="new_top_button" id="new_menu_5" onmouseover="show_menu(5);">
                        <div class="t_menu_font">联系我们</div>
                      </div></td>
                      <td><div class="new_top_button" id="new_menu_6" onmouseover="show_menu(6)">
                        <div class="t_menu_font"><a href="/joyme_club/">真美俱乐部</a></div>
                      </div></td>
                    </tr>
                  </table>
                  <div id="menu_1" class="menu_x">
                    <table width="110" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="3" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/about/">组织简介</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/service_flow/">服务流程</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/five_hearts/">贴心服务</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/environment/">医院环境</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/meiligushi/">美丽资讯</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/zhenmeigushi/">真美故事</a></td>
                      </tr>
                    </table>
                  </div>
                  <div id="menu_2" class="menu_x">
                    <table width="110" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="3" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/wangshihu/">王世虎简历</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/zhuanjiafangtan/index.asp?id=1">王世虎专访</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/liuxingzhou/">刘兴洲简历</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/zhuanjiafangtan/index.asp?id=2">刘兴洲专访</a></td>
                      </tr>
                    </table>
                  </div>
                  <div id="menu_3" class="menu_x">
                    <table width="110" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="3" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=0&amp;chn=1">五官整形</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=1&amp;chn=1">面部年轻化</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=2&amp;chn=1">乳房整形</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=3&amp;chn=1">面形修改</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=4&amp;chn=1">吸脂瘦身</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=5&amp;chn=1">私密整形</a></td>
                      </tr>
                    </table>
                  </div>
                  <div id="menu_4" class="menu_x">
                    <table width="110" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="3" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=0&amp;chn=2">光子美白焕肤</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=1&amp;chn=2">激光脱毛</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=2&amp;chn=2">祛各种疤痕</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=3&amp;chn=2">色素疾病治疗</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/guide/index.asp?ls=4&amp;chn=2">血管病变治疗</a></td>
                      </tr>
                    </table>
                  </div>
                  <div id="menu_5" class="menu_x">
                    <table width="110" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="3" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/traffic/">交通路线</a></td>
                      </tr>
                      <tr>
                        <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
                      </tr>
                      <tr>
                        <td height="25" class="main_text"><a href="/Contact_Us/">联系方式</a></td>
                      </tr>
                    </table>
                  </div>
                </div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="201"><img src="../template/images/junmei_text.png" width="195" height="13" /></td>
            <td><div class="dot_hline">&nbsp;</div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="18" align="center">
    <div onmouseover="show_menu(-2);"></div>
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="21" class="NTN_Left"></td>
          <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="200" align="center" valign="middle" class="five_hp_all"><img width="145" height="21" src="../template/images/five_logo_nbg.png" /></td>
    <td><div class="five_menu_base_2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="five_hp_all">
              <tr>
              	<td width="8">&nbsp;</td>
                <td><div id="file_button_0" class="file_button" onmouseover="menu_five(0);"><div class="top_five_text" id="top_five_text_0"><a href="/guide/index.asp?ls=2&amp;chn=1">美国Dallas金标准隆胸</a></div></div></td>
                <td width="3">&nbsp;</td>
                <td><div id="file_button_1" class="file_button" onmouseover="menu_five(1);"><div class="top_five_text" id="top_five_text_1"><a href="/guide/index.asp?ls=4&amp;chn=1">日式SHU无痕立体吸脂</a></div></div></td>
                <td width="3">&nbsp;</td>
                <td><div id="file_button_2" class="file_button" onmouseover="menu_five(2);"><div class="top_five_text" id="top_five_text_2"><a href="/guide/index.asp?ls=0&amp;chn=1">韩式精致五官雕塑</a></div></div></td>
                <td width="3">&nbsp;</td>
                <td><div id="file_button_3" class="file_button" onmouseover="menu_five(3);"><div class="top_five_text" id="top_five_text_3"><a href="/guide/index_slide.asp?chn=3">真美抗衰老</a></div></div></td>
                <td width="3">&nbsp;</td>
                <td><div id="file_button_4" class="file_button" onmouseover="menu_five(4);"><div class="top_five_text" id="top_five_text_4"><a href="/guide/index.asp?ls=2&chn=2">专利刘氏激光束扫描祛疤</a></div></div></td>
                <td width="8">&nbsp;</td>
              </tr>
            </table>
           		<div class="five_info_bar">
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:10px; top:-60px;" id="five_info_0">
                Augmentation Mammoplasty
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:90px; top:-60px;" id="five_info_1">
                Liposuction
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:235px; top:-60px;" id="five_info_2">
                Sculpture of  the Facial Features
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:385px; top:-60px;" id="five_info_3">
                Beauty  Anti-Aging  Center  Of  The Asia-Pacific
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:500px; top:-60px;" id="five_info_4">
                Laser  Treatment  Center  Of  The  Asia-Pacific
                </div>
                </div>
            </div></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td><table width="977" border="0" cellpadding="0" cellspacing="0" class="home_bg_nt_2">
      <tr>
        <td width="788" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top">
            <div onmouseover="show_menu(-2);">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="155" valign="top">
                        <div class="tree_bg"> <div class="dtree">
    <script type="text/javascript">
		<!--

		d = new dTree('d');
<%
		switch(chn)
		{
			case '1':
%>
				d.add(0,-1,'美学整容','/guide/index_slide.asp?chn=1');
<%
			break;
			case '2':
%>
				d.add(0,-1,'激光美容','/guide/index_slide.asp?chn=2');
<%
			break;
		}
		
var ei=1;
var ef_a;
var ef_b;

for (var fia=0;fia<lnum;fia++)
{
	ef_a=ei;
	if (frameT[fia][1].length>1)
	{
%>
		d.add(<%=ei%>,0,'<%=frameT[fia][0]%>');
		xMcl[xMcl.length]=<%=ei%>;
<%
		ei++;
	}else{
		ef_a=0;
		//Leask
	}
	for (var fib=0;fib<frameT[fia][1].length;fib++)
	{
		ef_b=ei;
		if(frameT[fia][4][fib][0].length>1)
		{
			if (ef_a==0)
			{
%>
				xMcl[xMcl.length]=<%=ei%>;
<%
			}
%>
		d.add(<%=ei%>,<%=ef_a%>,'<%=frameT[fia][2][fib]%>');
<%
		ei++;
		}else{
			ef_b=ef_a;
			//Leask
		}
		for (var fic=0;fic<frameT[fia][4][fib][0].length;fic++)
		{
%>
			d.add(<%=ei%>,<%=ef_b%>,'<%=frameT[fia][4][fib][0][fic]%>','/<%=frameT[fia][3][fib]%>/t<%=frameT[fia][4][fib][1][fic]%>/');
<%
			ei++;
		}
	}
}
	
%>

		document.write(d);

		//-->
	</script>
	</div>
    </div>   
                
                
                </td>
                <td width="7">
                </td>
                <td width="621" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="14"></td>
  </tr>
  <tr>
    <td><table class="lsbg"  height="435"  width="100%" border="0" cellspacing="0" cellpadding="0" background="<%=frameT[ls][5]%>">
                  <tr>
    <td height="277" valign="top">
<div onmouseover="move_title(sID)" style="height:277px; width:621px;">
</div>
    </td>
  </tr>
                  <tr>
                    <td class="ntbg_g" align="center" height="30">
                    <div class="ntbg_g_inner" align="left">
                    <div class="ntbg_g_in2">
                  <table width="621" height="30" style="table-layout:fixed;" border="0" cellspacing="0" cellpadding="0">
                    <tr>
<%
	for (var fib=0;fib<frameT[ls][1].length;fib++)
	{
%>
		<td width="<%=(621/frameT[ls][1].length)%>" height="30">
        	<table height="30" width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
                	<td align="center" height="30">
            <div class="ls_maintitle" onmouseover="move_title(<%=fib%>);">
<%
	if(frameT[ls][4][fib][0].length>1)
	{
%>
        <a href="javascript:show_fun(<%=fib%>)">
<%
	}else{
%>
		<a href="/<%=frameT[ls][3][fib]%>/t<%=frameT[ls][4][fib][1][0]%>/">
<%
	}
%>	
		<%=frameT[ls][2][fib]%></a>
        </div>
        			</td>
        	</table>
        </td>
<%
	}
%>
					</tr>
                  </table>
                  </div>
 <div class="rabg" id="rabg" style="width:<%=(Math.round(621/frameT[ls][1].length))%>px">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
  <tr>
    <td height="30">&nbsp;</td>
  </tr>
</table>
</div>
                  </div>
                  </td>
                  </tr>
                  <tr>
                    <td valign="top">
                    <div class="dslbox" id="dslbox" onmouseover="move_title(sID)">
<%
	for (var fib=0;fib<frameT[ls][1].length;fib++)
	{
	var sAll=fib;
%>
    <div class="dslbox_in" id="dslbox_in_<%=fib%>">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td height="30">&nbsp;</td>
  </tr>
  <tr>
    <td>
      <table style="table-layout:fixed;" width="100%" border="0" cellspacing="0" cellpadding="0">
 <%
	ei=0;
	for (var fic=0;fic<frameT[ls][4][fib][0].length;fic++)
	{
		if (ei==0)
		{
			Response.Write('<tr>');
		}
%>
		<td width="167"><div class="guide_cell"><a href="/<%=frameT[ls][3][fib]%>/t<%=frameT[ls][4][fib][1][fic]%>/"><%=(fic+1)+'.'%><%=frameT[ls][4][fib][0][fic]%></a></div></td>
<%
		ei++
		if (ei==3)
		{
			Response.Write('</tr>');
			ei=0;
		}
	}
	switch (ei)
	{
		case 1:
			Response.Write('<td width="167" align="center">&nbsp;</td><td width="167" align="center">&nbsp;</td></tr>');
		break;
		case 2:
			Response.Write('<td width="167" align="center">&nbsp;</td></tr>');
		break;
	}
%>
      </table></td>
  </tr>
</table>
</div>
<%
	}
%>
                      </div>
                    </td>
                  </tr>
                </table></td>
  </tr>
  <tr>
  <td height="10">
  </td>
  </tr>
</table>
                </td>
              </tr>
            </table>
            </div>
            </td>
            <td width="5">
            </td>
          </tr>
          </table></td>
        
        <td valign="top" bgcolor="#8fbda0"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="7"></td>
              </tr>
              <%
			  if (Application("user_admin")==false){
			  %>
              <tr>
                <td class="title_a">在线留言</td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
              <tr>
                <td height="150"><iframe src="/WOChat/wochat_mail.asp" name="wochat_mail" scrolling="No" frameborder="0" class="wo_chat_if" id="wochat_mail" ></iframe></td>
              </tr>
              <%
              } else {
              %>
              <tr>
                <td class="title_a">在线咨询</td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
              <tr>
                <td height="123"><iframe src="/WOChat/wochat_display.asp" name="wochat_display" frameborder="0" class="wo_chat_if" id="wochat_display" ></iframe></td>
              </tr>
              <tr>
                <td height="27"><iframe src="/WOChat/wochat_input.asp" name="wochat_input" scrolling="No" frameborder="0" class="wo_chat_if" id="wochat_input" ></iframe></td>
              </tr>
              <%
			  }
			  %>
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td class="title_a">在线预约</td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
              <tr>
                <td height="156"><iframe src="/WOChat/wochat_order.asp" name="wochat_order" scrolling="No" frameborder="0" class="wo_chat_if" id="wochat_order" ></iframe></td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td class="title_a">订阅电子期刊</td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
              <tr>
                <td height="27"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <form id="form_sub" name="form_sub" method="post" action="/WOChat/womail_exec.asp"> <tr>
                      <td><input name="E-mail" type="text" class="mail_sub" id="E-mail" /><input name="exec_type" type="hidden" value="sub" /><input name="st_sub" type="hidden" value="true" /><br/><span style="font-size:12px; color:#FFF;">请填入联系电邮地址</span></td>
                      <td width="50" valign="top"><input type="submit" name="button" id="button" value="订阅" onclick="MM_validateForm('E-mail','','RisEmail');return document.MM_returnValue;this.form.submit();return document.MM_returnValue" /></td>
                      </tr>
                      <tr>
                        <td height="7"></td>
                        </tr>
                      </form>
                </table></td>
              </tr>
            </table></td>
            <td width="5">
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
          
    		
            </td>
          <td width="21" class="NTN_Right"></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#b1d8b1" height="1"></td>
  </tr>
  <tr>
    <td height="7"></td>
  </tr>
  <tr>
    <td height="7" class="home_bg_inner"></td>
  </tr>
  <tr>
    <td align="center" class="home_bg_inner"><div class="copy_text">真美热线：020-61130789； 真美网址：www.joyme.org； 真美地址：广州市天河区火车东站西侧军体医院门诊部二楼； 邮编：510500</div></td>
  </tr>
  <tr>
    <td class="home_bg_inner">&nbsp;</td>
  </tr>
</table>

<div id="fload" style="position:absolute; left:0px; top:0px; width:141px; height:85px; z-index:700;">
<img height="85" width="141" src="/template/images/tel_ad.png" />
</div>

<script type="text/javascript">
sAll=<%=sAll%>
for (var fi=1;fi<=sAll;fi++)
{
	changeOpac(0, 'dslbox_in_' + fi );
	document.getElementById('dslbox_in_' + fi).style.paddingLeft= sIntX + 'px';
}
document.getElementById('dslbox_in_' + 0).style.zIndex=110;
changeOpac(20,'rabg');
if (<%=ls%>!=-1)
{
	d.openTo(xMcl[<%=ls%>]);
}else{
	d.openTo(readCookie('ltree_'+chn));
}
if (<%=dir%>!=-1)
{
	show_fun(<%=dir%>);
}
</script>


<script type="text/javascript">
var adTop=10;
var mpt=1;
show_menu(-1);

setInterval("adMove()",70)
</script>

</body>
</html>