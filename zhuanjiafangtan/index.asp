<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
if (String(Request.QueryString('id')) != 'undefined' )
{
	var id=String(Request.QueryString('id'))-1;
}else{
	var id=0;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>真美汇</title>
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
<link href="../template/images/style.css" rel="stylesheet" type="text/css" />
<script src="js/AC_RunActiveContent.js" type="text/javascript"></script>
<script src="js/PopUpWin.js" type="text/javascript"></script>
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
    <td height="18" align="center"><div onmouseover="show_menu(-2);"></div></td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="home_bg_nt_2">
            <tr>
              <td width="788" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="7"></td>
                  </tr>
                         <tr>
            <td height="37" id="page_title"><div onmouseover="show_menu(-2);">
            <%
			switch(id)
			{
				case 0:
			%>
            王世虎专访
            <%
				break;
				case 1:
			%>
            刘兴洲专访
            <%
				break;
			}
			%>
            <span style="font-size:12px; padding-left:30px;">阅读以下电子杂志，请用鼠标拖动页角使其翻页。</span></div></td>
          </tr>
                 <tr>
                  <td height="13"></td>
                  </tr>
                <tr>
                  <td><div onmouseover="show_menu(0);" style="z-index:1">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      <td width="10"></td>
                        <td width="768" height="550">
                        <script type="text/javascript">
AC_FL_RunContent( 'codebase','http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0','width','100%','height','100%','src','swf/Magazine','quality','high','pluginspage','http://www.macromedia.com/go/getflashplayer','bgcolor','#cccccc','allowFullScreen','true','allowScriptAccess','sameDomain','movie','swf/Magazine?xmlFile=xml/Pages_<%=id%>.xml' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="768" height="550">
  <param name="movie" value="swf/Magazine.swf?xmlFile=xml/Pages_<%=id%>.xml" />
  <param name="quality" value="high" />
  <param name="bgcolor" value="#cccccc" />
  <param name="allowFullScreen" value="true" />
  <param name="allowScriptAccess" value="sameDomain" />
  <param name="wmode" value="transparent" />
  <embed src="swf/Magazine.swf?xmlFile=xml/Pages_<%=id%>.xml" width="778" height="550" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" allowFullScreen="true" allowScriptAccess="sameDomain"></embed>
</object></noscript></td>
                        <td width="10"></td>
                        </tr>
                      </table>
                    </div></td>
                  </tr>
                <tr>
                  <td height="13"></td>
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
<div id="fload" style="position:absolute; left:0px; top:0px; width:141px; height:85px; z-index:700;">
<img height="85" width="141" src="/template/images/tel_ad.png" />
</div>
<script type="text/javascript">
var adTop=10;
var mpt=1;
show_menu(-1);

setInterval("adMove()",70)
</script>
</body>
</html>