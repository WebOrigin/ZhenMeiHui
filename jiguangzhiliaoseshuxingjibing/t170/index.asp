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

switch (30)
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
<meta name="keywords" content="除纹身" />
<meta name="description" content="文身（Tattoo）又称人工色素斑或艺术文身，是外来不溶性的色素机械性地引入真皮而使皮肤产生一种永久性的色素斑。出于装饰、处罚或治疗等原因，人工地将各种图案事先画好在人体上，再用一些不溶的颜料，如墨汁、蓝靛或朱红等刺入皮内，使其成为永久性的色素斑。 普通文身多无症状，皮肤除颜色变化外完全正常。 文身部位以前臂为最多见，亦见于躯干或全身，花样各异。 文身的颜色表现多种多样，与所用色料相关，见表6.3。 某些皮肤病可好发于文身部位，如瘢痕疙瘩、扁平苔藓。某些疾病可由于文身传播，如结核病、麻风、梅毒和脓皮病。" />
<title>除纹身</title>
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
    <td><img border="0" src="/template/images/title_img/30.png"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div class="content" id="artcontent"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: medium"><b>除纹身</b></span></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><b>1、文身的特点？</b></span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 文身（Tattoo）又称人工色素斑或艺术文身，是外来不溶性的色素机械性地引入真皮而使皮肤产生一种永久性的色素斑。出于装饰、处罚或治疗等原因，人工地将各种图案事先画好在人体上，再用一些不溶的颜料，如墨汁、蓝靛或朱红等刺入皮内，使其成为永久性的色素斑。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 普通文身多无症状，皮肤除颜色变化外完全正常。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 文身部位以前臂为最多见，亦见于躯干或全身，花样各异。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 文身的颜色表现多种多样，与所用色料相关，见表6.3。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 某些皮肤病可好发于文身部位，如瘢痕疙瘩、扁平苔藓。某些疾病可由于文身传播，如结核病、麻风、梅毒和脓皮病。对文身色料的异物反应、光敏反应、变态反应偶可发生，最常见于含汞、珞及钴的色料。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 激光治疗文身的靶物质是存在于巨噬细胞或散布于真皮细胞外的小颗粒状的文刺染料。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 文身可分为专业性、业余性、美容性、外伤性和医源性。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size: small"><b>2、文身怎么治疗？</b></span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 以往临床上常采用手术切除或手术切除后植皮、皮肤磨削、化学剥脱、冷冻、电灼、CO2激光等方法治疗文身，但疗效不理想，常常会留下不同程度的瘢痕，严重时甚至会造成毁容。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 文身的治疗原则务必彻底去除文身色素，且不留任何痕迹。&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Q开关激光祛除文身是目前最有效且安全的方法，临床应选择文身颜色互补色的激光进行治疗，因为色素对互补色激光能量的吸收率最高。Q开关激光参数及适应症见表6.4。&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 此外，还有脉冲染料激光（510nm）、超脉冲CO2激光等。&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 陈旧的文身的治疗反应往往较好，因巨噬细胞长时间存在于皮肤组织中并吞噬文身颗粒，试图把它们清除出去，所以陈旧性文身往往边界模糊，难以辨认。&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 多数文身经过3至10余次治疗可以清除，有些文身即使经过多次治疗亦难以完全清除，即使清除了也会遗留与文身图案一致的不同程度的色素改变。深蓝色和黑色文身对激光的反应最好，而黄、红和绿色反应稍差或仅能部分去除，肉色或白色文身难以去除，有时在经激光作用后会转变为永久性不能清除的深黑色或灰色。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 激光治疗后立即用冷敷局部皮肤，治疗区可出现轻度的皮肤充血水肿、结痂和痂皮脱落，个别患者可能出现程度不同的水疱。这些反应通常在一周内消退，消退后一般不留痕迹，无需特殊治疗。</p></div></td>
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
