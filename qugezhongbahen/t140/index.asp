<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../../Connections/cms_conn_a.asp" -->
<%
var frameT=new Array();
var getListTemp=new Array();

if (String(Request.QueryString('ls')) != 'undefined' )
{
	var ls=String(Request.QueryString('ls'));
}else{
	var ls='0';
}

if (String(Request.QueryString('chn')) != 'undefined' )
{
	var chn=String(Request.QueryString('chn'));
}else{
	var chn='1';
}

switch (29)
{
	case 4,6,32,33,34:
		ls='0';
		chn='1';
	break;
	case 8,9:
		ls='1';
		chn='1';
	break;
	case 10,11,12,13,14,15:
		ls='2';
		chn='1';
	break;
	case 16,17,18,19,20:
		ls='3';
		chn='1';
	break;
	case 21,22,23:
		ls='4';
		chn='1';
	break;
	case 24,25,26:
		ls='5';
		chn='1';
	break;
	case 27:
		ls='0';
		chn='2';
	break;
	case 28:
		ls='1';
		chn='2';
	break;
	case 29:
		ls='2';
		chn='2';
	break;
	case 30:
		ls='3';
		chn='2';
	break;
	case 31:
		ls='4';
		chn='2';
	break;
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
		frameT[5][1]=[24,25,26];
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
<meta name="keywords" content="瘢痕" />
<meta name="description" content="1、什么是瘢痕？瘢痕的基本组成成分是什么? 瘢痕主要有细胞和基质两大类成分，分别包括： (a) 细胞成分：纤维母细胞、成纤维细胞、成肌纤维细胞、肥大细胞、中性粒细胞、巨噬细胞。 (b) 基质成分：大量的胶原纤维和沉积于这些错综复杂排列的纤维间的黏多糖成分。瘢痕形成的原因是什么? 瘢痕形成的机制目前尚未完全清楚，一般认为瘢痕的形成是由于机体炎症反应，胶原的合成与降解不平衡、异常黏多糖的出现以及肌成纤维细胞的增生所造成。增生性瘢痕中淋巴回流减少，局部水肿，可导致瘢痕的肥厚。瘢痕形成的自然过程是怎样的？ (a)" />
<title>瘢痕</title>
<link href="/template/images/style.css" rel="stylesheet" type="text/css" />
<link rel="StyleSheet" href="/ltree_api/ltree.css" type="text/css" />
<script type="text/javascript" src="/ltree_api/ltree.js"></script>
<script type="text/javascript">

var xMcl= new Array();

var sID=0;
var sAll=0;
var chn='<%=chn%>';
var tiLeft=11;


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
<script type="text/javascript">var WebOrigin_page='/page/';</script>
<script src="/page/system/inc/fun.js" type="text/javascript"></script>
</head>

<body class="home_bg_body">
<table width="977" border="0" align="center" cellpadding="0" cellspacing="0" class="home_bg_2">
  <tr>
    <td height="100" valign="top"><table width="1019" border="0" align="center" cellpadding="0" cellspacing="0" class="home_bg_2">
      <tr>
        <td height="100" align="center" valign="top"><table width="977" border="0" cellpadding="0" cellspacing="0" class="home_bg_nt">
          <tr>
            <td height="100" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30%" height="10">&nbsp;</td>
                <td width="30%">&nbsp;</td>
                <td width="30%">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td width="192" align="center"><a href="/home/"><img src="/template/images/zmh_03.png" width="192" height="80" border="0" /></a></td>
                <td valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="137">&nbsp;</td>
                    <td><img src="/template/images/tel.png" width="130" height="76" /></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="160"><img src="/template/images/zmh_07.png" width="156" height="33" /></td>
                <td width="130" align="center" valign="bottom" class="button_b"><a href="/guide/index.asp?ls=2&amp;chn=1">Dallas金标准隆胸</a></td>
                <td width="7" align="center" valign="bottom" class="button_b">|</td>
                <td width="130" align="center" valign="bottom" class="button_b"><a href="/guide/index.asp?ls=4&amp;chn=1">SHU无痕立体吸脂</a></td>
                <td width="7" align="center" valign="bottom" class="button_b">|</td>
                <td width="110" align="center" valign="bottom" class="button_b"><a href="/guide/index.asp?ls=0&amp;chn=1">精致五官雕塑</a></td>
                <td width="7" align="center" valign="bottom" class="button_b">|</td>
                <td width="70" align="center" valign="bottom" class="button_b"><a href="/guide/index_slide.asp?chn=3">抗衰老</a></td>
                <td width="7" align="center" valign="bottom" class="button_b">|</td>
                <td width="80" align="center" valign="bottom" class="button_b"><a href="/guide/index_slide.asp?chn=2">激光美肤</a></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center"><div onmouseover="show_menu(-2);"> <img src="/template/images/zmh_10.png" alt="" width="977" height="13" /></div></td>
  </tr>
  <tr>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="21" class="NTN_Left"></td>
          <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="home_bg_nt_2">
      <tr>
        <td width="730" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
            <td height="7"></td>
          </tr>
          <tr>
            <td><div class="menu_ex">
              <div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="5"></td>
                    <td width="115" height="28" class="button_a"><div onmouseover="show_menu(1);"><a href="/about/">关于.真美</a></div></td>
                    <td width="6"></td>
                    <td width="115" class="button_a"><div onmouseover="show_menu(2);">专家团队</div></td>
                    <td width="6"></td>
                    <td width="115" class="button_a"><div onmouseover="show_menu(3);"><a href="/guide/index_slide.asp?chn=1">整形整容</a></div></td>
                    <td width="6"></td>
                    <td width="115" class="button_a"><div onmouseover="show_menu(4);"><a href="/guide/index_slide.asp?chn=2">激光美容</a></div></td>
                    <td width="6"></td>
                    <td width="115" class="button_a"><div onmouseover="show_menu(5);">联系我们</div></td>
                    <td width="6"></td>
                    <td width="115" class="button_a"><div onmouseover="show_menu(6);">真美资讯</div></td>
                    <td width="5"></td>
                  </tr>
                </table>
              </div>
              <div id="menu_1" class="menu_x" style="left:5px;">
                <table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="3" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/about/">组织简介</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/service_flow/">服务流程</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/five_hearts/">贴心服务</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/environment/">医院环境</a></td>
                  </tr>
                </table>
              </div>
              <div id="menu_2" class="menu_x" style="left:126px;">
                <table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="3" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/wangshihu/">王世虎简历</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/zhuanjiafangtan/index.asp?id=1">王世虎专访</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/liuxingzhou/">刘兴洲简历</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/zhuanjiafangtan/index.asp?id=2">刘兴洲专访</a></td>
                  </tr>
                </table>
              </div>
              <div id="menu_3" class="menu_x" style="left:247px;">
                <table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="3" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=0&amp;chn=1">五官整形</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=1&amp;chn=1">面部年轻化</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=2&amp;chn=1">乳房整形</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=3&amp;chn=1">面形修改</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=4&amp;chn=1">吸脂瘦身</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=5&amp;chn=1">私密整形</a></td>
                  </tr>
                </table>
              </div>
              <div id="menu_4" class="menu_x" style="left:368px;">
                <table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="3" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=0&amp;chn=2">光子美白焕肤</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=1&amp;chn=2">激光脱毛</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=2&amp;chn=2">祛各种疤痕</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=3&amp;chn=2">色素疾病治疗</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/guide/index.asp?ls=4&amp;chn=2">血管病变治疗</a></td>
                  </tr>
                </table>
              </div>
              <div id="menu_5" class="menu_x" style="left:489px;">
                <table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="3" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/traffic/">交通路线</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/Contact_Us/">联系方式</a></td>
                  </tr>
                </table>
              </div>
              <div id="menu_6" class="menu_x" style="left:610px;">
                <table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="3" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/meiligushi/">美丽资讯</a></td>
                  </tr>
                  <tr>
                    <td height="1" background="/template//template/images/web_orgin_dosh.png" class="main_text"></td>
                  </tr>
                  <tr>
                    <td height="25" class="main_text"><a href="/zhenmeigushi/">真美故事</a></td>
                  </tr>
                </table>
              </div>
            </div></td>
          </tr>
          <tr>
            <td height="13"></td>
          </tr>
          <tr>
		<td valign="top">
            <div onmouseover="show_menu(-2);">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="157" valign="top">
                         <div class="dtree">
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
		//lt.add(8,2,'Node 1.2','example01.html');
		//lt.add(9,0,'My Pictures','example01.html','Pictures I\'ve taken over the years','','','img/imgfolder.gif');
		//lt.add(10,9,'The trip to Iceland','example01.html','Pictures of Gullfoss and Geysir');
		//lt.add(11,9,'Mom\'s birthday','example01.html');
		//lt.add(12,0,'Recycle Bin','example01.html','','','img/trash.gif');

		document.write(d);

		//-->
	</script>
	</div>   
                
                
                </td>
                <td width="1" bgcolor="#CCCCCC"></td>
                <td width="5"></td>
                <td valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                
                  <td valign="top" class="template_a_mtext">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img border="0" src="/template/images/title_img/29.png"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div class="content" id="artcontent"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium"><b>瘢痕</b></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><strong>1、什么是瘢痕？</strong></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 瘢痕是一个很笼统的概念，它是各种创伤后所引起的正常皮肤组织的外观形态和组织病理学的改变的统称。它是人体创伤(即使是轻微的损伤)后，在伤口或创面自然愈合过程中的一种正常的、必然的生理反应，也是创伤愈合过程的必然结果。瘢痕的本质是一种不具备正常皮肤组织结构及生理功能的，失去正常组织活力的、异常的、不健全的组织。瘢痕不仅破坏了体表美，还可妨碍相关组织或器官的生理功能，甚至导致畸形。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>瘢痕的基本组成成分是什么?</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 瘢痕主要有细胞和基质两大类成分，分别包括：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 细胞成分：纤维母细胞、成纤维细胞、成肌纤维细胞、肥大细胞、中性粒细胞、巨噬细胞。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 基质成分：大量的胶原纤维和沉积于这些错综复杂排列的纤维间的黏多糖成分。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>瘢痕形成的原因是什么?</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 瘢痕形成的机制目前尚未完全清楚，一般认为瘢痕的形成是由于机体炎症反应，胶原的合成与降解不平衡、异常黏多糖的出现以及肌成纤维细胞的增生所造成。增生性瘢痕中淋巴回流减少，局部水肿，可导致瘢痕的肥厚。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>瘢痕形成的自然过程是怎样的？</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 瘢痕（scar) 是创伤修复的必然产物。凡涉及真皮层的伤口几乎都以瘢痕愈合而告终。伤口的自然愈合过程有3种机制在起作用：一是伤口收缩；二是肉芽组织充填伤口；三是表皮生长覆盖创面。肉芽组织主要是由小血管和成纤维细胞等成分构成，如无异常，胶原蛋白逐渐转变为结缔组织-这实际上就是&quot;瘢痕&quot;。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 瘢痕的自然过程分为三个时期：瘢痕增生期、瘢痕塑形期和瘢痕稳定期。增生期是指伤口愈合后早期的6个月，表现为瘢痕红肿，有的高突出皮肤，质硬，局部有痛痒感，此期不易进行手术，但药物治疗和压力治疗在此期可有效地防止瘢痕增生。6个月后进入塑形期，表现为红肿消退，质地变软，无明显压痛，此期多维持关年至一年时间。最后进入稳定期，此期瘢痕不再变化，形态已固定，此期瘢痕可行手术治疗。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 一般正常愈合后瘢痕不会高出皮面，所以把这种瘢痕称之为&quot;正常瘢痕&quot;（normal scar)。如果伤口在愈合过程中出现异常，肉芽组织中的成纤维细胞不仅不停止增殖，反而数量增多，并且分泌胶原及其它细胞外基质的量也增加，伤口增生高出皮面、发红，并出现各种症状甚至造成外形与功能的障碍，这就是&quot;病理性瘢痕&quot;或异常瘢痕（abnormal scar）。</p>
<p>&nbsp;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><strong>2、瘢痕是怎样分类的？</strong></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 关于瘢痕的分类，许多书刊上有着不同的描述，如：增生性瘢痕、瘢痕疙瘩、萎缩性瘢痕、挛缩性瘢痕、表浅性瘢痕、蹼状瘢痕、桥状瘢痕等等。从病理学上讲，瘢痕(scar)只分为正常瘢痕(normal scar)、病理性瘢痕（abnormal scar）两大类；而病理性瘢痕主要包括增生性瘢痕(hypertrophic scar,HS)和瘢痕疙瘩(keloid, K)两类。但从临床角度，为便于描述和治疗方法的选择，可以记述为前面提到的各类瘢痕的名称。病理性瘢痕其本质是真皮纤维化疾病中的一类，是创伤修复过程中包括I、III型胶原在内的细胞外基质成分在组织中过度沉积、且难以被机体吸收或重塑的病理状态。临床上根据瘢痕组织学和形态学的区别，可以将其分为以下几种类型。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>浅表性瘢痕：</strong>浅表性瘢痕因皮肤受轻度擦伤，或由于浅2度灼伤，或皮肤受浅表的感染后所形成，一般累及表皮或真皮浅层。表面粗糙，有时有色素改变。局部平坦、柔软，有时与周边正常皮肤界限不清。一般无功能障碍，不需特殊处理。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>增生性瘢痕：</b>凡损伤累及真皮深层，如深2度以上灼伤、切割伤、感染、切取中厚皮片后的供皮区等，均可能形成增生性瘢痕。增生性瘢痕明显高于周围正常皮肤，局部增厚变硬。增生性瘢痕的收缩性较挛缩性瘢痕为小。因此发生于非功能部位的增生性变化一般不会引起严重的功能障碍，但关节部位的大片瘢痕增生，由于其厚硬的夹板作用，防碍了关节活动，可引致功能障碍。位于关节屈面的增生性瘢痕，在晚期可发生较明显的收缩，从而产生如颌颈粘连等明显的功能障碍。</p>
<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 萎缩性瘢痕：</b>其损伤累及皮肤全层及皮下脂肪组织，可发生于大面积三度灼伤、长期慢性溃疡愈合后，以及皮下组织较少部位如头皮、胫前区等受电击伤后。萎缩性瘢痕，其瘢痕坚硬、平坦或略高于皮肤表面，与深部组织如肌肉、肌腱、神经等紧密粘连。瘢痕局部容易破溃而形成经久不愈的慢性溃疡，晚期有发生恶变的可能。萎缩性瘢痕具有很大的收缩性，可牵动邻近的组织、器官，而造成严重的功能障碍。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>瘢痕疙瘩：</b>瘢痕疙瘩的发生具有明显的个体差异。大部分瘢痕疙瘩通常发生在局部损伤一年内，包括外科手术、撕裂伤、纹身、灼伤、注射、动物咬伤、接种、粉刺及异物反应等，许多患者的原发病史可能被忘记。其形态呈多样性，可以是较平坦的、有规则边缘的对称性突起，也可以是不平坦的、具有不规则突起的高低不平的团块，有时像象蟹足样向周围组织浸润生长。瘢痕疙瘩一般不发生挛缩，除少数关节部位病变引起轻度活动受限外，一般不引起功能障碍。瘢痕疙瘩一般不能自行退化。瘢痕疙瘩的恶变曾有报道，但发生率很低。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><strong>3、什么部位好长瘢痕？</strong></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 瘢痕增生易发生于张力高的部位。临床上常可见垂直皮肤松弛线切口的张力是平行于皮肤松弛线切口张力的三倍，张力大，可刺激纤维组织形成，造成瘢痕增生。手术时应按皮纹或皮肤张力松弛线作切口，以减少瘢痕的形成。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 瘢痕还易出现在活动部位，因为该部位皮肤张力大，活动多，强力的牵拉，使瘢痕反复破裂，刺激纤维细胞增殖，使胶原纤维增多，出现瘢痕增生。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 瘢痕疙瘩可以发生于身体的任何部位，但最常见于上背部、肩部、胸前部、上臂三角肌区，较少发生于下肢、面部和颈部，皮肤厚的部位较皮肤薄的部位更易发生；在眼睑、生殖器、手掌、足底、角膜和粘膜则极为罕见。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>国外作者Crockett根据大量文献作出统计，提出一个瘢痕疙瘩发生部位的敏感顺序：</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 第一顺序：胸骨前、上背部和上臂三角肌区。这些部位的所有瘢痕几乎都可能发展为瘢痕疙瘩；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 第二顺序：有胡须的部位、耳朵、上肢前侧、胸前、头皮和前额。这些部位形成瘢痕疙瘩的倾向，与损伤的性质有关；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 第三顺序：下背部、腹部、下肢、面中部、生殖器。这些部位的瘢痕疙瘩不常见。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><strong>4、怎样预防瘢痕增生？</strong></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 预防瘢痕的根本点在于尽可能小地减少创口的第二次创伤，促使创口早期一期愈合。这包括创面的处理、择期手术患者的病例选择、精细的手术操作技术和妥善的术后护理。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>创面处理<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>对早期的新鲜创口，应彻底地清除血块、异物和碎片，对确定已失去活力的组织，也应彻底清除。尽可能早地闭合创口。对晚期污染创口，如存在感染的可能性，应彻底清创，闭合创口时放置引流。如已确定存在感染，则应局部或全身应用抗生素，待感染控制后，再二期闭合创口。对存在较大组织缺损的创口，应尽早采取组织移植的方法来覆盖创面，尽可能避免作不必要的附加切口，特别是对有瘢痕疙瘩倾向的患者。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>病例选择<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>对于一个病变或有恶性病变倾向的患者，或者存在严重功能障碍或溃疡的患者，除手术外别无选择。但对于有些病例，特别是要求美容或一般瘢痕治疗的患者，整形外科医师应慎重选择手术适应症，在手术前应确定手术治疗能否对原有瘢痕有较大程度的改善。对儿童、年轻人、肤色较黑的患者尤应慎重，特别是当患者瘢痕部明显或位于隐蔽部位或无功能障碍时。因为如果手术不当，可能会使原有的瘢痕更加明显。对于瘢痕增生和瘢痕疙瘩的好发部位，如胸部、肩前等处，存在张力和运动的部位，如胸前上部、肩胛部、四肢屈侧等处，存在乳房重力和胸部呼吸运动的部位，如胸骨部等，术后瘢痕容易增生，这些部位的较小病损，如囊肿、痣等的手术切除应格外慎重。<br />
婴儿和儿童因代谢旺盛，术后瘢痕也易增生，同时婴儿皮肤较薄，缝合时创缘难以准确对合，因而可影响术后效果。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对于严重油性皮肤、汗毛孔粗大和存在粉刺的患者，应该考虑到术后有瘢痕增生的可能性。对此类患者，尤应注意术前手术部位的局部清洁。如粉刺发作，应使用抗生素。闭和创口时，应避免皮脂腺对创口的污染。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>手术操作</strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>A</b> 设计切口时，在满足手术需要的前提下，应尽量遵循下述原则。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a 选择在隐蔽部位，如乳房下、毛发区等。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b 沿轮廓线切口，如鼻唇沟、腋前线等。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c 顺皮纹切口，如在额部、眼睑等处。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d 在自然结合部，如耳颈结合部等。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e 四肢切口选择在屈曲皱褶线或平行于皮肤张力线处，避免作环状圆形切口或跨越关节面切口。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f 颞部或颈侧手术可选择在发际区。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g 面部避免作弧形、半圆形或大的&ldquo;Z&rdquo;形、&ldquo;S&rdquo;形切口。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h 体腔外口周围避免作环形切口。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i 如切口必须横过轮廓线、皮纹时，应设计&ldquo;Z&rdquo;改形切口。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>B</b> 行无菌操作。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>C</b> 刀片垂直于皮肤切开，动作要轻柔，器械要锐利，避免不必要的创伤。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>D</b> 彻底止血。无死腔形成。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>E</b> 无张力缝合，创缘对合准确；缝合时以创缘对拢为准，不可过紧，以避免造成缝线周围组织坏死。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><strong>5、瘢痕的非手术疗法有哪些？</strong></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;</strong>瘢痕形成后非手术治疗方法有很多，归纳起来有局部药物注射、压力疗法、药物离子透入、放射线照射、中西药物外涂等；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>局部药物疗法：</b>局部使用类固醇，能使局部真皮变薄，并可使趋向愈合的创面停止生长肉芽组织。类固醇素瘢痕内注射适用于中小形增生性瘢痕及手术后条形增生，注射时将药液与0.5%利多卡因1:1混合后在瘢痕内与基底部注射，可使增生的瘢痕变平，痛痒感减轻或消失。一般每10-15天注射1次，三次一疗程，但如注射过多可能会产生一些副作用；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>压迫疗法：</b>适用于瘢痕面积大、形成瘢痕的时间短、不适用作放疗和局部药物治疗的部位。压力造成组织相对缺血，使螺旋状胶原纤维重新排列，组织二氧化碳分压升高，氧分压降低，血管数量减少，水肿也减少，还能使胶原酶活性增强，胶原分解加速，使瘢痕软化。加压治疗的原则应该开始的时间要早（伤口愈合就可以开始），压力要合适，时间要半年左右。具体可采用弹力绷带或弹力网罩压迫，对预防和治疗增生性瘢痕效果较好；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>放射疗法：</b>可采用X线或镭或钴60局部照射，对新出现的增生性瘢痕及瘢痕疙瘩疗效好，能使之变平新增生的血管消失。&nbsp;但由于放射线多全身的危害和对局部发育的不良影响，年幼者或大面积瘢痕者，不适用放射疗法；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 局部药物治疗是采用含硅酮的各种疤瘢软化贴膏进行外涂或贴敷。&nbsp;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><strong>6、瘢痕的手术疗法有哪些？</strong></span></p>
<p style="text-align: center"><img alt="" width="439" height="69" src="/up_files/image/jiguang/jiguangquban.jpg" /></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 手术疗法应根据瘢痕的类型和特点进行不同的治疗。但手术治疗以前注意以下几个方面：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 一般增生性瘢痕不宜过早手术，除非严重的上下睑外翻、小口畸形和手部严重瘢痕挛缩，一般等瘢痕增生消退后再手术；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 在创伤愈合瘢痕早期，往往开始发生挛缩，可考虑在挛缩畸形明显处切开，作局部的处理；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 瘢痕切除的范围应是影响功能最严重之处和外观部位，否则出现皮源不足。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手术方法，对于表浅性瘢痕，一般不用治疗，如果影响外观可以考虑治疗，面积小则切除缝合，如面积大可选用游离植皮或皮肤软组织扩张术等；增生性瘢痕，只限于功能障碍或形态改变部位，手术彻底切除瘢痕，松解挛缩，应用游离植皮、皮瓣转移等方法治疗；对于大面积挛缩性瘢痕，应将瘢痕部分或全部切除，行中厚或全厚皮片移植，必要时可用皮瓣修复；对于深部瘢痕挛缩，须在术中探查清楚，设法利用组织充填瘢痕切除后所产生的空腔，一般用带蒂组织移植填充，疗效较好；对于瘢痕疙瘩，手术切除易复发，单纯切除意义不大，应需要结合其他方法，作综合治疗；对于浅表瘢痕和蹼状瘢痕，可行Z成形术。</p></div></td>
  </tr>
</table>
                  </td>
                  </tr>
              </table>
              </td>
              <td width="5"></td>
              </tr>
            </table>
            </div>
            </td>
          </tr>
          <tr>
            <td height="13"></td>
          </tr>
          </table></td>
        <td width="1" bgcolor="#b1d8b1"></td>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="7">&nbsp;</td>
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
                <td height="150"><iframe name="wochat_mail" frameborder="0" scrolling="no" src="/WOChat/wochat_mail.asp" class="wo_chat_if" ></iframe></td>
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
                <td height="123"><iframe name="wochat_display" frameborder="0" src="/WOChat/wochat_display.asp" class="wo_chat_if" ></iframe></td>
              </tr>
              <tr>
                <td height="27"><iframe name="wochat_input" frameborder="0" scrolling="no" src="/WOChat/wochat_input.asp" class="wo_chat_if" ></iframe></td>
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
                <td height="156"><iframe name="wochat_order" frameborder="0" scrolling="no" src="/WOChat/wochat_order.asp" class="wo_chat_if" ></iframe></td>
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
                <td height="27">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <form id="form_sub" name="form_sub" method="post" action=""> <tr>
                      <td><input name="E-mail" type="text" class="mail_sub" id="E-mail" /></td>
                      <td width="50" valign="top"><input type="submit" name="button" id="button" value="订阅" onclick="MM_validateForm('E-mail','','RisEmail');return document.MM_returnValue;this.form.submit();return document.MM_returnValue" /></td>
                    </tr>
                <tr>
                <td height="7"></td>
              </tr>
                  </form></table>
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
      </table>
    </td>
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
<script type="text/javascript">
show_menu(-1);
d.openTo(readCookie('ltree_'+chn));
</script>
</body>
</html>
