<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
if (String(Request.QueryString('tid')) != 'undefined' )
{
	var tid=String(Request.QueryString('tid'));
}else{
	var tid='0';
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="美学整容;五官整形;眼部整形;鼻部整形;眉部整形;耳部整形;唇部整形;面部年轻化;面部提紧除皱;注射除皱;乳房整形;丰胸概述;假体隆乳术;自体脂肪丰乳;乳房下垂上提;巨乳缩小;乳头乳晕整形;面形修改;下颌角缩窄;颧弓降低;颊脂垫摘除;咬肌注射;面部充填;吸脂瘦身;360度立体无暇塑身;腹壁整形;其它部位抽脂;妇科整形;性别重塑;整形修复;私密整形;阴茎延长增粗;激光美容;光子美白焕肤;激光脱毛;祛各种疤痕;色素疾病治疗;血管病变治疗" />

<title>真美汇</title>
<link href="/template/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ltree_api/ltree.js"></script>
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
.mv_tran{
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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="home_bg_nt_2">
      <tr>
        <td width="788" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
            <td height="7"></td>
          </tr>
          <tr>
            <td height="13"></td>
          </tr>
          <tr>
		<td valign="top" background="/template/images/tb_<%=tid%>.png" style="background-repeat:repeat-x;">
            <div onmouseover="show_menu(-2);">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" background="/template/images/logo_big_<%=tid%>.png" class="mv_tran" style="background-repeat:no-repeat;">
              <tr>
                <td width="14"></td>
                <td valign="top" class="template_a_mtext">
<form action="pre_clinic_exec.asp" method="post" name="form_bl" id="form_bl">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
switch (tid)
{
	case '0':
%>
  <tr>
    <td><table width="700" border="0" cellpadding="0" cellspacing="0" class="BL_Text_C">
  <tr>
    <td align="center"><img src="/template/images/table_title.png" width="158" height="28" /></td>
  </tr>
    <tr>
  <td class="tb_line_height">&nbsp;</td>
  </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25%">姓名：<input name="Name" type="text" class="BL_Box_C" id="Name" /></td>
          <td width="25%">年龄：<input name="Age" type="text" class="BL_Box_C" id="Age" /></td>
          <td width="25%">性别：<select name="Gender" class="BL_Box_D" id="Gender">
              <option value="未知">请选择</option>
              <option value="男">男</option>
              <option value="女">女</option>
            </select></td>
          <td width="25%">联系电话：<input name="Tel" type="text" class="BL_Box_C" id="Tel" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="70">家庭住址：</td>
          <td width="150"><input name="Sheng" type="text" class="BL_Box_C" id="Sheng" />省</td>
          <td width="170"><input name="XianShi" type="text" class="BL_Box_C" id="XianShi" />县（市）</td>
          <td><input name="Jiedao" type="text" class="BL_Box_B" id="Jiedao" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%">最佳联系时间：<input name="Zuijia" type="text" class="BL_Box_C" id="Zuijia" /></td>
          <td width="50%">联系电邮：<input name="E-mail2" type="text" class="BL_Box_C" id="E-mail2" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%">身高：<input name="Shengao" type="text" class="BL_Box_C" id="Shengao" />cm</td>
          <td width="30%">体重：<input name="Tizhong" type="text" class="BL_Box_C" id="Tizhong" />kg</td>
          <td>血压：<input name="Xueya" type="text" class="BL_Box_C" id="Xueya" />mmHg</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>拟就诊部门：<select name="bumen" class="BL_Box_D" id="bumen">
              <option value="请选择">请选择</option>
              <option value="整形中心">整形中心</option>
              <option value="激光美容中心">激光美容中心</option>
            </select></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">拟就诊目的：</td>
          <td width="70"><input name="Yanjing" type="checkbox" value="on" id="Yanjing" />眼睛</td>
          <td width="70"><input type="checkbox" value="on" name="Bizi" id="Bizi" />鼻子</td>
          <td width="70"><input type="checkbox" value="on" name="Lianxing" id="Lianxing" />脸型</td>
          <td width="70"><input type="checkbox" value="on" name="Xiongbu" id="Xiongbu" />胸部</td>
          <td width="70"><input type="checkbox" value="on" name="Ebu" id="Ebu" />额部</td>
          <td width="70"><input type="checkbox" value="on" name="Jing" id="Jing" />颞部</td>
          <td width="70"><input type="checkbox" value="on" name="Quangu" id="Quangu" />颧骨</td>
          <td><input type="checkbox" value="on" name="Taiyangxue" id="Taiyangxue" />太阳穴</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">&nbsp;</td>
          <td width="70"><input type="checkbox" value="on" name="Zuiba" id="Zuiba" />嘴巴</td>
          <td width="70"><input type="checkbox" value="on" name="EDuo" id="EDuo" />耳朵</td>
          <td width="70"><input type="checkbox" value="on" name="Meimao" id="Meimao" />眉毛</td>
          <td width="70"><input type="checkbox" value="on" name="Shencai" id="Shencai" />身材</td>
          <td width="70"><input type="checkbox" value="on" name="Pifu" id="Pifu" />皮肤</td>
          <td width="70"><input type="checkbox" value="on" name="Rufang" id="Rufang" />乳房</td>
          <td width="70"><input type="checkbox" value="on" name="Couzhi" id="Couzhi" />抽脂</td>
          <td><input type="checkbox" value="on" name="Bahen" id="Bahen" />疤痕</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">&nbsp;</td>
          <td width="70"><input type="checkbox" value="on" name="Zouwen" id="Zouwen" />皱纹</td>
          <td>其他：<input name="Mudi_Other" type="text" class="BL_Box_C" id="Mudi_Other" /></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>拟行手术：<input name="Shoushu" type="text" class="BL_Box_C" id="Shoushu" /></td>
          <td>预约时间：<input name="YYShijian" type="text" class="BL_Box_C" id="YYShijian" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>整形术史：<select name="Zengxinshoushu" class="BL_Box_D" id="Zengxinshoushu">
              <option value="请选择">请选择</option>
              <option value="以前做过">以前做过</option>
              <option value="以前没做过">以前没做过</option>
            </select></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%">部位：<input name="Buwei" type="text" class="BL_Box_C" id="Buwei" /></td>
          <td width="30%">医院：<input name="Yiyuan" type="text" class="BL_Box_C" id="Yiyuan" /></td>
          <td>时间：<input name="Shijian" type="text" class="BL_Box_C" id="Shijian" /></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">既往病史：</td>
          <td width="100"><input type="checkbox" value="on" name="Xinzhangbing" id="Xinzhangbing" />心脏病</td>
          <td width="100"><input type="checkbox" value="on" name="Ganyan" id="Ganyan" />肝炎</td>
          <td width="100"><input type="checkbox" value="on" name="Shenbing" id="Shenbing" />肾病</td>
          <td width="100"><input type="checkbox" value="on" name="Feibing" id="Feibing" />肺病</td>
          <td width="100"><input type="checkbox" value="on" name="Jiazhuangxian" id="Jiazhuangxian" />甲状腺病</td>
          <td><input type="checkbox" value="on" name="Gaoxueya" id="Gaoxueya" />高血压</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">&nbsp;</td>
          <td width="100"><input type="checkbox" value="on" name="Pinxue" id="Pinxue" />出血性疾病</td>
          <td width="100"><input type="checkbox" value="on" name="Jiehe" id="Jiehe" />结核</td>
          <td>其他：<input name="BS_Other" type="text" class="BL_Box_C" id="BS_Other" /></td>
        </tr>
      </table></td>
    </tr>
  <!--
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>已确定的预约问诊日期和时间：<input type="text" name="Yuyue" id="Yuyue" />（本行医院填写）</td>
        </tr>
      </table></td>
  </tr>
  -->
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="110">正在服用的药物：</td>
          <td width="100"><input type="checkbox" value="on" name="Jiangya" id="Jiangya" />降压药</td>
          <td width="100"><input type="checkbox" value="on" name="asplin" id="asplin" />阿司匹林</td>
          <td width="100"><input type="checkbox" value="on" name="biyun" id="biyun" />避孕药</td>
          <td width="100"><input type="checkbox" value="on" name="anding" id="anding" />安定类药</td>
          <td><input type="checkbox" value="on" name="pizhixian" id="pizhixian" />皮质腺素</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="110">&nbsp;</td>
          <td>其他：<input name="yaowu_Other" type="text" class="BL_Box_C" id="yaowu_Other" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>外伤、手术、麻醉史：<select name="wsssmjs" id="wsssmjs" class="BL_Box_D" >
              <option value="请选择">请选择</option>
              <option value="有">有</option>
              <option value="无">无</option>
            </select></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>药物过敏：<select name="yaowuguomin" class="BL_Box_D" id="yaowuguomin">
              <option value="请选择">请选择</option>
              <option value="有">有</option>
              <option value="无">无</option>
            </select></td>
          <td>药物名称：<input name="yaowu_mingcheng" type="text" class="BL_Box_C" id="yaowu_mingcheng" /></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%">妊娠史：<select name="yunchenshi" class="BL_Box_D" id="yunchenshi">
              <option value="请选择">请选择</option>
              <option value="有">有</option>
              <option value="无">无</option>
            </select></td>
          <td width="30%">处在月经期：<select name="chuzaiyujing" class="BL_Box_D" id="chuzaiyujing">
              <option value="请选择">请选择</option>
              <option value="是">是</option>
              <option value="否">否</option>
            </select></td>
          <td>末次月经：<input name="mociyuejing" type="text" class="BL_Box_C" id="mociyuejing" /></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="70">生育史：</td>
          <td>孕：<input name="shengyu_yun" type="text" class="BL_Box_C" id="shengyu_yun" /></td>
          <td>产：<input name="shengyu_chan" type="text" class="BL_Box_C" id="shengyu_chan" /></td>
        </tr>
      </table></td>
    </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80">健康状态：</td>
        <td>食欲：<select name="Shiyu" class="BL_Box_D" id="Shiyu">
            <option value="请选择">请选择</option>
            <option value="良">良</option>
            <option value="不良">不良</option>
          </select></td>
        <td>睡眠：<select name="Suimian" class="BL_Box_D" id="Suimian">
            <option value="请选择">请选择</option>
            <option value="良">良</option>
            <option value="不良">不良</option>
          </select></td>
        <td>烟酒酗好：<select name="Xujiu" class="BL_Box_D" id="Xujiu">
            <option value="请选择">请选择</option>
            <option value="有">有</option>
            <option value="无">无</option>
          </select></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height">&nbsp;</td>
  </tr>
</table></td>
  </tr>
<%
	break;
	case '1':
%>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><img src="/template/images/table_title_2.png" alt="" width="230" height="32" /></td>
  </tr>
      <tr>
  <td class="tb_line_height">&nbsp;</td>
  </tr>
  <tr>
    <td class="tb_line_height">1、您的性别：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><select name="Gender2" class="BL_Box_D" id="Gender2">
      <option value="未知">请选择</option>
      <option value="男">男</option>
      <option value="女">女</option>
    </select></td>
  </tr>
  <tr>
    <td class="tb_line_height">2、您的年龄：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><select name="age_2" class="BL_Box_D" id="age_2">
		<option value="未知">请选择</option>
      <option value="不满18岁">不满18岁</option>
      <option value="18~25岁">18~25岁</option>
      <option value="25~30岁">25~30岁</option>
      <option value="30~38岁">30~38岁</option>
      <option value="38~45岁">38~45岁</option>
      <option value="45~55岁">45~55岁</option>
      <option value="55岁及以上">55岁及以上</option>
    </select></td>
  </tr>
  <tr>
    <td class="tb_line_height">3、您的婚姻状况：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><select name="hunyin" class="BL_Box_D" id="hunyin">
      <option value="未知">请选择</option>
      <option value="未婚">未婚</option>
      <option value="已婚">已婚</option>
    </select></td>
  </tr>
  <tr>
    <td class="tb_line_height">4、您的学历：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><select name="xueli" class="BL_Box_D" id="xueli">
      <option value="未知">请选择</option>
      <option value="初中">初中</option>
      <option value="高中/中专">高中/中专</option>
      <option value="大学">大学</option>
      <option value="研究生及以上">研究生及以上</option>
    </select></td>
  </tr>
  <tr>
    <td class="tb_line_height">5、您的职业：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="130"><select name="zhiye" class="BL_Box_D" id="zhiye">
      <option value="未知">请选择</option>
      <option value="私营企业主">私营企业主</option>
      <option value="上班族">上班族</option>
      <option value="娱乐时尚人士">娱乐时尚人士</option>
      <option value="自由职业">自由职业</option>
      <option value="待业/失业人员">待业/失业人员</option>
      <option value="军人">军人</option>
      <option value="在校学生">在校学生</option>
      <option value="家庭主妇（男）">家庭主妇（男）</option>
      <option value="退休职工">退休职工</option>
    </select></td>
        <td>其他：<input name="zhiye_2" type="text" class="BL_Box_C" id="zhiye_2" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height">6、您的整容经历：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="130"><select name="zhengrongjingli_2" class="BL_Box_D" id="zhengrongjingli_2">
      <option value="未知">请选择</option>
      <option value="做过">做过</option>
      <option value="未做过">未做过</option>
    </select></td>
          <td>项目：<input name="zhengxingjl_xm_2" type="text" class="BL_Box_C" id="zhengxingjl_xm_2" /></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td class="tb_line_height">7、您对整形了解途径：（可多选）</td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="11%"><input type="checkbox" value="on" name="dianshi" id="dianshi" />电视</td>
        <td width="11%"><input type="checkbox" value="on" name="baozhi" id="baozhi" />报纸</td>
        <td width="11%"><input type="checkbox" value="on" name="wangluo" id="wangluo" />网络</td>
        <td width="11%"><input type="checkbox" value="on" name="zhazhi" id="zhazhi" />杂志</td>
        <td width="11%"><input type="checkbox" value="on" name="guangbo" id="guangbo" />广播</td>
        <td width="11%"><input type="checkbox" value="on" name="duanxin" id="duanxin" />短信</td>
        <td width="11%"><input type="checkbox" value="on" name="huwai" id="huwai" />户外</td>
        <td width="11%"><input type="checkbox" value="on" name="pengyoujieshao" id="pengyoujieshao" />朋友介绍</td>
        <td><input type="checkbox" value="on" name="qitatujing" id="qitatujing" />其他</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height">8、您对整形机构的选择：</td>
  </tr>
  <tr>
    <td class="tb_line_height"><select name="jigouxuanze" class="BL_Box_D" id="jigouxuanze">
    <option value="未知">请选择</option>
      <option value="国外医院">国外医院</option>
      <option value="国营医院">国营医院</option>
      <option value="军队医院">军队医院</option>
      <option value="私营医院">私营医院</option>
      <option value="私家医院">私家医院</option>
    </select></td>
  </tr>
  <tr>
    <td class="tb_line_height">9、您对整形担心的问题：（可多选）</td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%"><input type="checkbox" value="on" name="shoushuanquanxing" id="shoushuanquanxing" />手术安全性
          </td>
        <td width="20%"><input type="checkbox" value="on" name="shoushuguochengtengtong" id="shoushuguochengtengtong" />
          手术过程疼痛</td>
        <td width="20%"><input type="checkbox" value="on" name="huifuqiguochang" id="huifuqiguochang" />
          恢复期过长</td>
        <td><input type="checkbox" value="on" name="xiaoguokenengdabudayuqibiaozun" id="xiaoguokenengdabudayuqibiaozun" />
          效果可能达不到预期标准</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%"><input type="checkbox" value="on" name="xiaoguobuchijiu" id="xiaoguobuchijiu" />
          效果可能并不会持久</td>
        <td width="35%"><input type="checkbox" value="on" name="xiaoguobuziranjia" id="xiaoguobuziranjia" />
          效果不自然，给人假的感觉</td>
        <td><input type="checkbox" value="on" name="pabeirenzhidaoyilun" id="pabeirenzhidaoyilun" />
          怕被别人知道或议论</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%"><input type="checkbox" value="on" name="feiyongtaigao" id="feiyongtaigao" />
          费用太高</td>
        <td width="35%"><input type="checkbox" value="on" name="liuxiazhengronghenji" id="liuxiazhengronghenji" />
          怕手术后留下整容的痕迹</td>
        <td>其他：<input name="qitadanxinwenti" type="text" class="BL_Box_C" id="qitadanxinwenti" /></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height">10、您愿意参加的美丽活动：（可多选）</td>
  </tr>
  <tr>
    <td class="tb_line_height"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15%"><input type="checkbox" value="on" name="xiaoguobuchijiu2" id="xiaoguobuchijiu2" />整容讲座</td>
        <td width="25%"><input type="checkbox" value="on" name="xiaoguobuchijiu3" id="xiaoguobuchijiu3" />时尚酒会、美丽沙龙</td>
        <td width="20%"><input type="checkbox" value="on" name="xiaoguobuchijiu4" id="xiaoguobuchijiu4" />发布秀</td>
        <td width="15%"><input type="checkbox" value="on" name="xiaoguobuchijiu5" id="xiaoguobuchijiu5" />选美活动</td>
        <td><input type="checkbox" value="on" name="xiaoguobuchijiu6" id="xiaoguobuchijiu6" />体验优惠活动</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td class="tb_line_height">&nbsp;</td>
  </tr>
</table>
</td>
  </tr>
<%
	break;
}
%>
  <tr>
    <td class="tb_line_height"><input type="submit" name="Submit2" id="Submit" value="提交" /></td>
  </tr>
    <tr>
    <td class="tb_line_height"><input type="hidden" name="tid" id="tid" value="<%=tid%>"/></td>
  </tr>
</table>
</form></td>
              <td width="21"></td>
              </tr>
            </table>
            </div>
            </td>
          </tr>
          </table></td>
        <td width="1" bgcolor="#b1d8b1"></td>
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
                   <form id="form_sub" name="form_sub" method="post" action="/WOChat/womail_exec.asp"> <tr>
                      <td><input name="E-mail" type="text" class="mail_sub" id="E-mail" /><input name="exec_type" type="hidden" value="sub" /><input name="st_sub" type="hidden" value="true" /><br/><span style="font-size:12px; color:#FFF;">请填入联系电邮地址</span></td>
                      <td width="50" valign="top"><input type="submit" name="button" id="button" value="订阅" onclick="MM_validateForm('E-mail','','RisEmail');return document.MM_returnValue;this.form.submit();return document.MM_returnValue" /></td>
                      </tr>
                      <tr>
                        <td height="7"></td>
                        </tr>
                      </form></table>
                </td>
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