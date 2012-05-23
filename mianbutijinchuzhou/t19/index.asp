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
<meta name="keywords" content="SMAS深度除皱术" />
<meta name="description" content="SMAS深度除皱术1、SMAS深度除皱术的发展 除皱手术技术经历了一个由简到繁，分离平面由浅到深的发展过程。按Hamra(1992)和高景恒(1994)的观点，除皱手术技术发展到今天，已有了三代成型的手术技术，即：皮下分离的第一代技术；皮下分离+SMAS(表浅肌肉腱膜系统)分离的第二代技术；深部平面除皱术和其后的复合除皱术(Hamra， 1990，1992)的第三代技术。按照分离平面的深度，也有人将骨膜下除皱术称为第三代除皱术(Ramirez，1992；宋业光，1990，1992)。手术技术的发展，是随着" />
<title>SMAS深度除皱术</title>
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
    <td><div class="content" id="artcontent"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><span style="font-size: medium">SMAS深度除皱术</span></b></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>1、SMAS深度除皱术的发展</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 除皱手术技术经历了一个由简到繁，分离平面由浅到深的发展过程。按Hamra(1992)和高景恒(1994)的观点，除皱手术技术发展到今天，已有了三代成型的手术技术，即：皮下分离的第一代技术；皮下分离+SMAS(表浅肌肉腱膜系统)分离的第二代技术；深部平面除皱术和其后的复合除皱术(Hamra， 1990，1992)的第三代技术。按照分离平面的深度，也有人将骨膜下除皱术称为第三代除皱术(Ramirez，1992；宋业光，1990，1992)。手术技术的发展，是随着人们对面颈部老化机制及面颈部解剖生理的认识逐步深入而发展的。自20世纪初就有了面部除皱外科手术的记载。但初始的手术仅是局部多余皮肤切除缝合，如1901年Hollander描述了耳前后切口的下面部除皱术。1919年Passot报道颏下切口治疗重颏。20年代后期开始出现了皮下分离的第一代除皱术。1926年，Noel和Hunt分别报道冠状切口的前额皮下分离除皱术。1927年Bames设计面部皮下平面分离，辅以缝合固定筋膜。Rees等人于30年代进行了许多例前额皮下分离除皱术。1960年Aufricht讨论了皮下分离范围。至60年代，面颈部皮下分离的全面部除皱术在西方国家已成为流行的安全美容手术。然而，多数人已开始提倡前额帽状腱膜下除皱术而不赞成前额皮下分离除皱术，如Ortiz - Monasterio等称：&ldquo;从额肌上分离皮瓣易引起血运障碍，有些作者报道过悲惨的结果。&rdquo;因此，前额除皱的皮下分离技术一段时间曾被废弃。但时至1989年，Wolfe等报道皮下层分离前额除皱的27例经验，认为有许多优点，如伤口愈合容易，能保存切口后头皮感觉，有效地消除额纹，同时可提眉，以及可在直视下从浅面修剪额肌、皱眉肌和皮下脂肪等。Wolfe指出通过帽状腱膜与额肌切口的深层分离可能产生切口区持续性的感觉缺失、严重瘙痒等后果。但90年代以来的大量报道，几乎均采用帽状腱膜下分离前额除皱术，作者单位也施行这种手术数百例，迄今未见切口区长期感觉缺失及严重瘙痒的并发症发生。 20世纪70年代，产生了SMAS下分离的第二代除皱技术，导致了面颊下颌区、颈部等外形的明显改善。1974年，Skoog首创了SMAS悬吊技术，皮肤和SMAS作为一个单位推进，产生强力持久的牵拉效果。1976年，Mitz和Peyronie首次报道了SMAS的较详细的解剖学研究结果(在Gray解剖学著作中曾被间接提及，20世纪初，法国与德国学者曾有过模糊的描述)。此后的20年，对SMAS的研究和应用成为除皱外科的焦点，导致了SMAS-颈阔肌技术成为安全流行的除皱技术而被广泛应用。</p>
<p style="text-align: center"><img alt="" width="213" height="114" src="/up_files/image/mianbunianqing/SMAS.jpg" /></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>2、与第一代拉皮除皱术比较，多数人认为SMAS技术有如下主要优点</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 可以较大张力向上、向后牵拉组织瓣；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 提紧SMAS-颈阔肌层能在颌与颏下形成一个平滑的吊带，矫正重颏及颊部的畸形，减少该部位切、吸脂肪的必需性；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) 继上提平滑的SMAS-颈阔肌瓣后，再向后推进颊部皮肤，获得双向提紧，恢复颊、颌、颈区年轻的轮廓；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (d) 自然而无牵拉的外貌形象；<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (e) 效果持久，并发症少。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>3、SMAS深度除皱术常用于以下部位</b><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (a) 全面部悬吊术,俗称大拉皮，在头部上方，沿两边耳际做环形切口，不间断表皮、肌肉、筋膜，去掉很宽的多余组织。适合40～65岁的人士，提升效果明显，使面部的皱纹老化松弛现象消失，&ldquo;赘肉&rdquo;现象得以解决。手术操作时间一般在2～3小时之间，手术剥离面积大，是一项面部青春的整体恢复工程。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (b) 面部除皱术，在国外多被称为&ldquo;面部提紧术&rdquo;，是将面颈部皮肤及其深面的组织、结构分离后，向后主要是向上方提紧固定，借以展平或消除表面的皱纹皱襞，使某些部位的老化性松垂得以改变。接受除皱术后，可使面颈部变得年轻，获得心理上的满足和欣慰，鼓起生活的自信活力。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (c) SMAS深度除皱术，为国际最新代除皱手术技术，该技术效果是双向提紧面部皮肤，既提紧了表面皮肤，又提紧了深面松垂的筋膜、肌肉。迄今，SMAS&mdash;颈阔肌除皱术已成为最安全、流行的面部除皱术式。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (d) 额部悬吊术,是解决前额皱纹与松弛现象的悬吊术。手术时按设计线切开额部正中皮肤达帽状腱膜下，用特制的平板分离器于此层向前分离，直达眉上部及鼻根部，再用特制的小尖拉钩刀切额肌、皱眉肌、降眉肌、边剥边激光止血，沿SMAS筋膜下向前用特制器械锐性分离，直至鼻根部，解决鼻根部皱纹（川字纹）问题。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (e) 颞部悬吊术,在太阳穴两边的头发里隐蔽操作，用以解决眼角放射状的鱼尾纹，提升眼角下垂，眉角下垂，面颊下垂。改善鼻唇沟现象，解决嘴角下垂现象，一举多得。该手术是最常规的悬吊术，约占筋膜悬吊术中的90%以上，其手术疼痛小，不影响正常的工作和学习，面部上提效果好，手术者看似普遍年轻6～20岁。临床10年观察，手术效果能保持6～10年。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (f) 额、颞部悬吊术,一般针对除了面部下垂以外，前额也需要大面积提升者。多适宜35～45岁的中年人。术后整体感觉似年轻10岁左右。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (g) 下脸部悬吊术,主要用于解决下半张脸的衰老，松弛现象。其中以解决嘴角下垂、下颌多肉下垂现象伴有面颊下方&ldquo;肉赘&rdquo;等为主要解决现象。因操作是绕耳环形法,.操作过程是先行耳前皮下剥离,超过腮腺前缘,用筋膜悬吊器械钝性向上剥离约5mm,鉴于传统解剖概念上的SMAS和面神经的关系,面神经超过腮腺前缘直接走行于SMAS深层.若SMAS剥离超过腮腺前缘,极易损伤面神经,因此,面中部SMAS不要做广泛彻底游离,而主要在耳后沿发际线做O形切口悬吊、剥离。面部深层血管分支必须穿过SMAS层，才能支配表面皮肤及皮下组织，尽管有自身血液供应网，但在广泛剥离后，皮瓣及SMAS瓣的血液供应会明显减少。因此，在缝合时，应注意皮瓣和SMAS瓣的张力，以免形成血运障碍，导致皮瓣坏死及切口延期愈合。</p></div></td>
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
