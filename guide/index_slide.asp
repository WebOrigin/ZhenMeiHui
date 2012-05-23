<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/cms_conn_a.asp" -->
<%
var frameT=new Array();
var getListTemp=new Array();
var xTitle

if (String(Request.QueryString('chn')) != 'undefined' )
{
	var chn=String(Request.QueryString('chn'));
}else{
	var chn='1';
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
	case '3':
		var lnum=1;
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
		xTitle='亚太美学整形中心'
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
		xTitle='亚太激光医学美肤中心'
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
	case '3':
		xTitle='亚太抗衰老研究体验中心'
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

<title><%=xTitle%> - 真美汇</title>
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



function slide_fun(sti)
{	
	if (sID!=sti)
	{
		xSlide('dslbox_2_in', 727*(<%=lnum%>-sID), 727*(<%=lnum%>-sti), 100, Math.abs(sti-sID));
		sID=sti;
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
            <td width="187"><a href="/home/"><img src="../template/images/zmh_03.png" width="187" height="80" border="0" /></a></td>
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
    <td height="18" align="center"><div onmouseover="show_menu(-2);"></div></td>
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
              <td><div id="file_button_0" class="file_button" onmouseover="menu_five(0);">
                <div class="top_five_text" id="top_five_text_0"><a href="/guide/index.asp?ls=2&amp;chn=1">美国Dallas金标准隆胸</a></div>
              </div></td>
              <td width="3">&nbsp;</td>
              <td><div id="file_button_1" class="file_button" onmouseover="menu_five(1);">
                <div class="top_five_text" id="top_five_text_1"><a href="/guide/index.asp?ls=4&amp;chn=1">日式SHU无痕立体吸脂</a></div>
              </div></td>
              <td width="3">&nbsp;</td>
              <td><div id="file_button_2" class="file_button" onmouseover="menu_five(2);">
                <div class="top_five_text" id="top_five_text_2"><a href="/guide/index.asp?ls=0&amp;chn=1">韩式精致五官雕塑</a></div>
              </div></td>
              <td width="3">&nbsp;</td>
              <td><div id="file_button_3" class="file_button" onmouseover="menu_five(3);">
                <div class="top_five_text" id="top_five_text_3"><a href="/guide/index_slide.asp?chn=3">真美抗衰老</a></div>
              </div></td>
              <td width="3">&nbsp;</td>
              <td><div id="file_button_4" class="file_button" onmouseover="menu_five(4);">
                <div class="top_five_text" id="top_five_text_4"><a href="/guide/index.asp?ls=2&chn=2">专利刘氏激光束扫描祛疤</a></div>
              </div></td>
              <td width="8">&nbsp;</td>
            </tr>
          </table>
          <div class="five_info_bar">
            <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:10px; top:-60px;" id="five_info_0"> Augmentation Mammoplasty </div>
            <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:90px; top:-60px;" id="five_info_1"> Liposuction </div>
            <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:235px; top:-60px;" id="five_info_2"> Sculpture of  the Facial Features </div>
            <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:385px; top:-60px;" id="five_info_3"> Beauty  Anti-Aging  Center  Of  The Asia-Pacific </div>
            <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:500px; top:-60px;" id="five_info_4"> Laser  Treatment  Center  Of  The  Asia-Pacific </div>
          </div>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="977" border="0" cellpadding="0" cellspacing="0" class="home_bg_nt_2">
      <tr>
        <td width="788" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
            <td height="7"></td>
          </tr>
          <tr>
            <td height="13"></td>
          </tr>
          <tr align="left">
            <td align="center" valign="top">
            <div onmouseover="show_menu(-2);">
              <table width="727" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="49" align="center"><a href="javascript:slide_fun(0)">
                  <%
				  switch(chn)
                  {
                  	case '1':
				  %>
<img src="../template/images/zhengxingmeirong_title.png" width="192" height="22" border="0"/>
                  <%
				  	break;
					case '2':
				  %>
<img src="../template/images/yataijiguang_title.png" width="242" height="22" border="0"/>
				  <%
				  	break;
					case '3':
				  %>
<img src="../template/images/yataikuangshuailao.png" width="266" height="22"border="0"/>
                  <%
                  	break;
                    }
                  %>
                  
                  </a></td>
                </tr>
                <tr>
                  <td height="315" valign="top" class="guide_2">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="13"></td>
  </tr>
  <tr>
    <td height="27">
<%
    switch (chn)
{
	case '1':
%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td width="5%"></td>
    <td width="15%" align="center"><a href="javascript:slide_fun(1)"><img width="86" height="23" border="0" src="/template/images/zhengxingmeirong_bt_01.png" /></a></td>
    <td width="15%" align="center"><a href="javascript:slide_fun(2)"><img width="86" height="23" border="0" src="/template/images/zhengxingmeirong_bt_02.png" /></a></td>
    <td width="15%" align="center"><a href="javascript:slide_fun(3)"><img width="86" height="23" border="0" src="/template/images/zhengxingmeirong_bt_03.png" /></a></td>
    <td width="15%" align="center"><a href="javascript:slide_fun(4)"><img width="87" height="23" border="0" src="/template/images/zhengxingmeirong_bt_04.png" /></a></td>
    <td width="15%" align="center"><a href="javascript:slide_fun(5)"><img width="87" height="23" border="0" src="/template/images/zhengxingmeirong_bt_05.png" /></a></td>
    <td width="15%" align="center"><a href="javascript:slide_fun(6)"><img width="87" height="23" border="0" src="/template/images/zhengxingmeirong_bt_06.png" /></a></td>
    <td width="5%"></td>
  </tr>
</table>
<%
	break;
	case '2':
%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td width="5%"></td>
    <td width="18%" align="center"><a href="javascript:slide_fun(1)"><img width="101" height="23" border="0" src="/template/images/jiguang_bt_2_01.png" /></a></td>
    <td width="18%" align="center"><a href="javascript:slide_fun(2)"><img width="105" height="23" border="0" src="/template/images/jiguang_bt_2_02.png" /></a></td>
    <td width="18%" align="center"><a href="javascript:slide_fun(3)"><img width="101" height="23" border="0" src="/template/images/jiguang_bt_2_03.png" /></a></td>
    <td width="18%" align="center"><a href="javascript:slide_fun(4)"><img width="101" height="23" border="0" src="/template/images/jiguang_bt_2_04.png" /></a></td>
    <td width="18%" align="center"><a href="javascript:slide_fun(5)"><img width="101" height="23" border="0" src="/template/images/jiguang_bt_2_05.png" /></a></td>
    <td width="5%"></td>
  </tr>
</table>
<%
	break;
	case '3':
%>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td width="5%"></td>
    <td width="90%" align="center"><a href="javascript:slide_fun(1)"><img width="86" height="23" border="0" src="/template/images/zhengxingmeirong_bt_02.png" /></a></td>
    <td width="5%"></td>
  </tr>
</table>
<%
	}
%>
</td>
  </tr>
  <tr>
    <td height="267" align="left" valign="top">
    <div class="guide_2_box" id="guide_2_box">
    <div class="dslbox_2_in" id="dslbox_2_in">
  <%
    switch (chn)
{
	case '1':
%>  
    <table width="<%=727*(lnum+1)%>" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="727" valign="top">
	<img width="727" height="267" src="/template/images/zhengxingad.png" />
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
    <tr>
    <td height="30"><b>五官整形</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美学家用黄金切割法分析人的五官比例分布，以“三庭五眼”为修饰标准。<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三庭：指脸的长度，把脸的长度分为三个等分从前额发迹线至眉骨，从眉骨至鼻底，从鼻底至下颏，各占脸长1/3。 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五眼：指脸的宽度比例，以眼睛长度为单位，把脸的宽度分为5个等份。从左侧发迹至右侧发迹，为五只眼睛的宽度，两只眼睛之间有一只眼睛的间距，两眼外侧至两侧发迹各为一只眼睛的间距，各占比例的1/5。
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=0&chn=1"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><b>面部年轻化</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;军美全面部除皱，能使人变得年轻，再现芳容，故被誉为“返老还童术”。利用美容手术的方法，将面部或面颈部松弛的皮肤拉紧，并去除多余皮肤，从而使皱纹展平。能使人的容貌焕然一新，与术前相比会年轻许多。同时也可以通过注射的方式变得皮肤更饱满与年轻，富有弹性！谁也不会让自己拥有一张松垮垮或布满皱纹的脸……
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=1&chn=1"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
    <tr>
    <td height="30"><b>乳房整形</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乳者，奶也。妇人胸前之物，其数为二，左右称之。从来美人必争地，自古英雄温柔乡。其色若何？深冬冰雪。其质若何？初夏新棉。其味若何？三春桃李。其态若何？秋波滟滟。从古到今，无数英雄好汉拜倒在“花房”之下，甚至有前仆后继之趋势……
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=2&chn=1"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
      <tr>
    <td height="30"><b>面形修改</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;自文明社会以来，人体美作为自然界的最高形式展示出来，便成了人类永恒的追求。她吸引了众多艺术家、医学家、美学家以及社会学家的眼光。而面部五官的美尤为人们所关注。面部审美的重要理念是平衡、匀称及协调。
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=3&chn=1"><img border="0" height="25" width="120" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
        <tr>
    <td height="30"><b>吸脂瘦身</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;她们或容貌出众、秀外慧中、清纯可人、风姿绰约，千娇百媚，各具情致；或迷人风韵、娇艳若花、风情万种，集高贵、妩媚、典雅、另类美于一身。但统统的这些，都离不开一副姣好的身材……
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=4&chn=1"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
        <tr>
    <td height="30"><b>私密整形</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;做隐私部位美容的主要有两类人，大部分是隐私部位确有一定缺陷或问题存在，直接影响生活质量的，对她们来说，做整形美容不仅是为了“美”，也是为了“需要”。
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=5&chn=1"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
  </tr>
</table>
<%
	break;
	case '2':
%>
    <table width="<%=727*(lnum+1)%>" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="727" valign="top">
	<img width="727" height="267" src="/template/images/jiguangad.png" />
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
    <tr>
    <td height="30"><b>光子美白焕肤</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美白的重要性不言而喻，一白遮三丑，只要肌肤白皙，整个人的感觉就更精神、更亮丽。美丽女人的肌肤不一定白皙，但是肌肤白皙的女人一定比较美。
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="index.asp?ls=0&chn=2"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><b>激光脱毛</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“衣毛为飞鸟，脱毛为妇人。”这句话很形象道出了普通老百姓对毛发在人身上的关注程度！毛发少了、多了，都不行，怎么样能保持一个恰到好处的平衡呢？来军美找我们的激光大师王教授吧……
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="index.asp?ls=1&chn=2"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
    <tr>
    <td height="30"><b>祛各种疤痕</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“疤痕”是物理、生物、化学等因素的损害作用于人体皮肤软组织，导致皮肤软组织的严重损伤而不能完全自行正常修复，转由纤维组织替代修复留下的即影响外观又影响功能的局部症状。
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="index.asp?ls=2&chn=2"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
      <tr>
    <td height="30"><b>治疗色素疾病</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每一个人身上都会有痣，它是皮肤中的黑色素细胞或黑色素细胞所分泌的黑色素颗粒异常增多、积聚而形成的。比如常见的黑痣，是由于增多的黑色素细胞聚积成巢状或团状而形成的；而太田痣、雀斑样痣中，增多的黑色素细胞散在分布，由于其分布深浅不同可呈现不同颜色。
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="index.asp?ls=3&chn=2"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
        <tr>
    <td height="30"><b>血管病变治疗</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面部、脖子、胸部等部位异常变红的情况， 是由血管暂时扩张引起的。主要原因是交感神经的活动加强引起的。出现 这种情况的人是因为他们比正常人对体温或精神压力更加敏感，因此血管容易扩张。
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="index.asp?ls=4&chn=2"><img border="0" width="120" height="25" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
  </tr>
</table>
<%
	break;
	case '3':
%>
    <table width="<%=727*(lnum+1)%>" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="727" valign="top">
	<img width="727" height="267" src="/template/images/kangshuailaoad.png" />
    </td>
    <td width="727" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="103">&nbsp;</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="49">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><b>面部年轻化</b></td>
  </tr>
  <tr>
    <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;军美全面部除皱，能使人变得年轻，再现芳容，故被誉为“返老还童术”。利用美容手术的方法，将面部或面颈部松弛的皮肤拉紧，并去除多余皮肤，从而使皱纹展平。能使人的容貌焕然一新，与术前相比会年轻许多。同时也可以通过注射的方式变得皮肤更饱满与年轻，富有弹性！谁也不会让自己拥有一张松垮垮或布满皱纹的脸……
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="/guide/index.asp?ls=1&chn=1"><img border="0" height="25" width="120" src="/template/images/view_more.png" /></a></td>
  </tr>
</table>
</td>
  </tr>
</table>
</td>
    <td width="103">&nbsp;</td>
  </tr>
</table>
    </td>
  </tr>
</table>
<%
	break;
}
%>
    </div> 
    </div>

    </td>
  </tr>
</table> 
                  </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
              </div></td>
          </tr>
          </table></td>
        <td valign="top" bgcolor="#8fbda0"><table width="100%" border="0" cellpadding="0" cellspacing="0">
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
          <td width="21" class="NTN_Right">&nbsp;</td>
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
//Leask
document.getElementById('dslbox_2_in').style.width=727*<%=lnum%>+'px';
document.getElementById('dslbox_2_in').style.paddingLeft=727*<%=lnum%>+'px';
document.getElementById('dslbox_2_in').style.left='-'+727*<%=lnum%>+'px';

var adTop=10;
var mpt=1;
show_menu(-1);

setInterval("adMove()",70)
</script>
</body>
</html>