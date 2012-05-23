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

switch (8)
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
<meta name="keywords" content="小切口额部除皱术" />
<meta name="description" content="小切口额部除皱术1、原理 额部皱纹主要同以下因素有关： (a) 地心引力---引起皮肤向下的松垂，尤其是眉外侧及上眼睑下垂明显； (b) 额肌、皱眉肌及降眉肌过多的收缩---额纹、眉间皱纹的出现。2、手术方法 (a) 额部顶部剥离范围肿胀麻醉； (b) 额部发际内分别于正中际两侧做3个1厘米长的纵行小切口； (c) 使用特殊器械于帽状腱膜下剥离； (d) 使用特殊器械割断部分额肌、皱眉肌及降眉肌； (e) 把多余的皮肤向后缝合固定。3、优点 (a) 以往的额部除皱 通常需要纵行的冠状切口，切口贯穿整个头顶" />
<title>小切口额部除皱术</title>
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
    <td><img border="0" src="/template/images/title_img/8.png"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div class="content" id="artcontent"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><span style="font-size: medium">小切口额部除皱术</span></b></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>1、原理</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 额部皱纹主要同以下因素有关：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 地心引力---引起皮肤向下的松垂，尤其是眉外侧及上眼睑下垂明显；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 额肌、皱眉肌及降眉肌过多的收缩---额纹、眉间皱纹的出现。</p>
<p style="text-align: center"><img alt="" width="470" height="150" src="/up_files/image/mianbunianqing/weiqie.jpg" /></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>2、手术方法</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 额部顶部剥离范围肿胀麻醉；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 额部发际内分别于正中际两侧做3个1厘米长的纵行小切口；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 使用特殊器械于帽状腱膜下剥离；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (d) 使用特殊器械割断部分额肌、皱眉肌及降眉肌；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (e) 把多余的皮肤向后缝合固定。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>3、优点</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 以往的额部除皱 通常需要纵行的冠状切口，切口贯穿整个头顶部，因切除部分头皮，伤口张力较大，术后瘢痕非常明显。对患者的发型由很大影响。而我们的手术采用的是纵行的小切口，伤口没有张力，术后瘢痕非常小且隐蔽。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 以往手术常需去除头皮，术后会遗留很宽的脱发区。我们的术式不用去除皮肤，仅把提上来的多余头皮向后固定，依靠组织的自身调节作用，多余松弛的皮肤会逐渐消融于顶及枕后的头皮中去。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 手术安全、出血不多，恢复时间短，是创伤小、效果好的额部除皱手术方法。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>4、除皱术前后注意事项</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 术前做好心理准备，并与医生充分沟通，正确理解除皱术只能帮你延缓衰老，而无法令你永远年轻。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 术前2周戒烟、酒，停服含阿司匹林药物。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 术前不要化妆，注意面部及头皮卫生，术前1日将头发洗净，降低术后感染机率。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (d) 凡有心脏病、糖尿病、血友病、肝肾功能不全等任何疾病，或正在接受任何药物治疗（无论有无处方），术前务必如实告诉医生。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (e) 选择手术日期，应避开女性生理期，月经、妊娠和哺乳6个月内，不宜手术。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (f) 注射除皱术后24小时内，应保持局部干燥清洁，不要使用刺激性化妆品，并避免日光暴晒，勿随意按压注射部位，3日内尽量减少面部运动。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (g) 术后恢复期，经常做面部按摩，以利减轻水肿，恢复面部的自然表情。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (h) 术后1周内，不要做皮肤护理、桑拿，不要食用刺激性食物。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>5、除皱术年龄有什么要求？</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 随着社会进步，人们对自身颜面形象要求的增高，过去通常认为要到40岁以后才行面部除皱术的观念被摒弃。通常只要患者老化表现明显，即使未到40岁也可手术，最早可到二十多岁。当然这些人尽可能采用较小范围的除皱术，如上下睑整形，颞部上提除皱术及采用减少创伤的小切口及内窥镜除皱术。最大年龄通常可达65岁，当然年龄大者，必须身体状况良好，能耐受手术。由于手术效果一般能维持5~20年，而且一般人一生可行3~4次手术，因此不必对于过早手术而产生各种担忧。</p></div></td>
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
