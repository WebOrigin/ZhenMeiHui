<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/cms_conn_a.asp" -->
<%
var Recordset_Art__MMColParam = "37";
if (String(Request("MM_EmptyValue")) != "undefined" && 
    String(Request("MM_EmptyValue")) != "") { 
  Recordset_Art__MMColParam = String(Request("MM_EmptyValue"));
}
%>
<%
var Recordset_Art_cmd = Server.CreateObject ("ADODB.Command");
Recordset_Art_cmd.ActiveConnection = MM_cms_conn_a_STRING;
Recordset_Art_cmd.CommandText = "SELECT * FROM WebOrigineasyart WHERE listid = ? ORDER BY artid DESC";
Recordset_Art_cmd.Prepared = true;
Recordset_Art_cmd.Parameters.Append(Recordset_Art_cmd.CreateParameter("param1", 5, 1, -1, Recordset_Art__MMColParam)); // adDouble

var Recordset_Art = Recordset_Art_cmd.Execute();
var Recordset_Art_numRows = 0;
%>
<%
var Repeat1__numRows = 9;
var Repeat1__index = 0;
Recordset_Art_numRows += Repeat1__numRows;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页 - 真美汇 - 军美整形与抗衰老医学美容中心</title>
<link href="../template/images/style.css" rel="stylesheet" type="text/css" />
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
<table width="977" border="0" align="center" cellpadding="0" cellspacing="0" class="home_bg">
  <tr>
    <td height="100" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="new_top_2">
      <tr>
        <td height="23">&nbsp;</td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="187"><a href="/home/"><img src="../template/images/zmh_03.png" width="187" height="80" border="0" /></a></td>
            <td align="left" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                <div class="top_info_bar">
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    style="left:0px;" id="top_info_0">
                Home
                </div>
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_1">
                About Us
                </div>
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_2">
                Our Team
                </div>
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_3">
                Plastics Surgery
                </div>
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_4">
                Laser Treatment
                </div>
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    id="top_info_5">
                Contact Us
                </div>
                <div class="top_info_cell"  onmouseover="show_menu(-2);"    style="left:653px;" id="top_info_6">
                Joyme Club
                </div>
                </div>
                </td>
              </tr>
              <tr>
                <td>
                <div class="menu_ex">
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
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=0&chn=1">五官整形</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=1&chn=1">面部年轻化</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=2&chn=1">乳房整形</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=3&chn=1">面形修改</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=4&chn=1">吸脂瘦身</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=5&chn=1">私密整形</a></td>
            </tr>
          </table>
            </div>
            <div id="menu_4" class="menu_x">
<table width="110" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="3" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=0&chn=2">光子美白焕肤</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=1&chn=2">激光脱毛</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=2&chn=2">祛各种疤痕</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=3&chn=2">色素疾病治疗</a></td>
            </tr>
            <tr>
              <td height="1" background="/template/images/web_orgin_dosh.png" class="main_text"></td>
            </tr>
            <tr>
              <td height="25" class="main_text"><a href="/guide/index.asp?ls=4&chn=2">血管病变治疗</a></td>
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
                </div>
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
      <td height="5">
      </td>
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
    <td height="16" valign="bottom"><div onmouseover="show_menu(-2);"></div></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="777">
        <div onmouseover="show_menu(-2);">
          <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="777" height="282">
            <param name="movie" value="../template/images/home_ad_1.swf" />
            <param name="quality" value="high" />
            <param name="wmode" value="opaque" />
            <embed src="../template/images/home_ad_1.swf" width="777" height="282" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash"></embed>
          </object>
        </div>
        </td>
        <td width="1" bgcolor="#003300"></td>
        <td valign="top" class="right_top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="7"></td>
  </tr>
  <tr>
  <td class="title_a"><a href="/qiyedongtai/">
 <div id="type_div">真美动态</div></a></td>
</tr>
    <% while ((Repeat1__numRows-- != 0) && (!Recordset_Art.EOF)) { %>
 <tr>
  <td class="template_a_mtext"><a href="/qiyedongtai/t<%=(Recordset_Art.Fields.Item("artid").Value)%>/"><img src="../template/images/arrow_133.gif" width="9" height="9" border="0" />&nbsp;&nbsp;<%=(Recordset_Art.Fields.Item("arttitle").Value)%></a></td>
  </tr>
  <%
  Repeat1__index++;
  Recordset_Art.MoveNext();
}
%>
</table>
</td>
<td width="10">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="777" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
          <tr>
            <td>
            <div class="five_menu_base">
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
                 <div style="width:216px; height:28px; position:absolute; top:-66px;" onmouseover="show_menu(-2);">
      		<img src="/template/images/wangpailogo.png" height="28" width="216" />
            </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:190px; top:-63px;" id="five_info_0">
                Augmentation Mammoplasty
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:190px; top:-63px;" id="five_info_1">
                Liposuction
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:235px; top:-63px;" id="five_info_2">
                Sculpture of  the Facial Features
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:385px; top:-63px;" id="five_info_3">
                Beauty  Anti-Aging  Center  Of  The Asia-Pacific
                </div>
                <div class="five_info_cell"  onmouseover="show_menu(-2);"   style="left:500px; top:-63px;" id="five_info_4">
                Laser  Treatment  Center  Of  The  Asia-Pacific
                </div>
                </div>
            </div>
            </td>
          </tr>
          <tr>
            <td>
            <div onmouseover="show_menu(-2);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="190"><a href="/wangshihu/"><img src="/template/images/home_bot_ad_01.jpg" width="190" height="126" border="0" /></a></td>
                <td>&nbsp;</td>
                <td width="190"><a href="/guide/index_slide.asp?chn=1"><img src="/template/images/home_bot_ad_02.jpg" width="190" height="126" border="0" /></a></td>
                <td>&nbsp;</td>
                <td width="190"><a href="/guide/index_slide.asp?chn=2"><img src="/template/images/home_bot_ad_03.jpg" width="190" height="126" border="0" /></a></td>
                <td>&nbsp;</td>
                <td width="190"><a href="/guide/index_slide.asp?chn=3"><img src="/template/images/home_bot_ad_04.jpg" width="190" height="126" border="0" /></a></td>
                <td>&nbsp;</td>
                </tr>
            </table>
            </div></td>
          </tr>
        </table></td>
        <td width="1" bgcolor="#003300"></td>
        <td valign="top" class="right_bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td height="140"><iframe name="wochat_mail" frameborder="0" scrolling="no" src="/WOChat/wochat_mail.asp" class="wo_chat_if" ></iframe></td>
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
                <td height="105"><iframe name="wochat_display" frameborder="0" src="/WOChat/wochat_display.asp" class="wo_chat_if" ></iframe></td>
              </tr>
              <tr>
                <td height="35"><iframe name="wochat_input" frameborder="0" scrolling="no" src="/WOChat/wochat_input.asp" class="wo_chat_if" ></iframe></td>
              </tr>
              <%
			  }
			  %>
           
             <tr>
                <td height="7"></td>
              </tr>
              </table></td>
              <td width="7">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
    </table></td>
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
    <td class="home_bg_inner"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="1" height="1">
      <param name="movie" value="../template/images/music.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="opaque" />
      <embed src="../template/images/music.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="1" height="1"></embed>
    </object></td>
  </tr>
</table>

<div id="fload" style="position:absolute; left:0px; top:0px; width:141px; height:85px; z-index:700;">
<a href="javascript:Open_Ad();"><img height="85" width="141" border="0" src="/template/images/tel_ad.png" /></a>
</div>
<script type="text/javascript">
var adTop=10;
var mpt=1;
show_menu(-1);

var ttid=0;
var text_all='位於广州火车东站西侧的军体医院整形美容科-原军美整形美容中心，为向爱美人士提供专业医学整形服务，於09年5月1日起，正式升级为“军美整形与抗衰老医学美容中心”。为庆祝这次升级，“军美整形及抗衰老医学美容中心”将於5至6月期间，推出美学整形医疗免费诊断及指导服务，前100名有七折起优惠，采取电话预约方式进行……'

function text_type()
{
	document.getElementById('type_div').innerHTML='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + text_all.substr(0,ttid) + '_'
	if (ttid<text_all.length+13)
	{
		ttid++;
	}else{
		ttid=0;
	}
}

setInterval("adMove()",70)

//setInterval("text_type()",100)
</script>
</body>
</html>
<%
Recordset_Art.Close();
%>
