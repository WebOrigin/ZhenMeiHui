<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<script type="text/javascript" src="/ltree_api/ltree.js"></script>
<script type="text/javascript">
<!--

function SH_fun(lid){
	var shi
	for (shi=1; shi<25; shi+=1){
		if (shi==lid){
			MM_showHideLayers('traffic_box_' + shi,'','show');
			}else{
			if (shi!=23){
				MM_showHideLayers('traffic_box_' + shi,'','hide');	
			}
			if (shi!=24){
				MM_showHideLayers('traffic_box_' + shi,'','hide');	
			}
		}
	}
	if (lid>0 & lid<15 || lid==23) {
		MM_showHideLayers('traffic_box_' + '23','','show');	
	}else{
		MM_showHideLayers('traffic_box_' + '23','','hide');	
	}
	if (lid>14 & lid<20 || lid==24) {
		MM_showHideLayers('traffic_box_' + '24','','show');	
	}else{
		MM_showHideLayers('traffic_box_' + '24','','hide');	
	}
}

function bus_fun(){
	SH_fun(document.getElementById('bus').value);
}

function drive_fun(){
	SH_fun(document.getElementById('drive').value);
}
//-->
</script>
<link href="../template/images/style.css" rel="stylesheet" type="text/css" />
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
              <td width="788"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="7"></td>
                  </tr>
                <tr>
                  <td height="13"></td>
                  </tr>
                <tr>
                  <td><div onmouseover="show_menu(-2);">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      <td width="40"></td>
                        <td class="template_a_mtext"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><input name="map_3d" type="button" id="map_3d" onclick="MM_showHideLayers('map_3d_div','','show','map_2d_div','','hide')" value="立体地图" /></td>
                                <td><input type="submit" name="map_2d" id="map_2d" onclick="MM_showHideLayers('map_3d_div','','hide','map_2d_div','','show')" value="平面地图" /></td>
                                <td width="500">&nbsp;</td>
                                </tr>
                              </table></td>
                            </tr>
                          <tr>
                            <td height="420"><div id="map_3d_div"><img src="maps/map_3d.jpg" width="700" height="400" class="map_box" /></div><div id="map_2d_div" style="visibility:hidden;"><img src="maps/map_2d.jpg" width="700" height="400" class="map_box" /></div></td>
                            </tr>
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="105" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <div>
                                    <tr>
                                      <td height="37" align="right" class="traffic_button"><div onclick="SH_fun(23);">乘坐巴士&nbsp;&nbsp;</div></td>
                                      <td width="32"><div onclick="SH_fun(23);"><img src="../template/images/bus.png" width="32" height="32" /></div></td>
                                      </tr></div>
                                  <tr>
                                    <td height="37" align="right" class="traffic_button"><div onclick="SH_fun(24);">自驾车&nbsp;&nbsp;</div></td>
                                    <td><div onclick="SH_fun(24);"><img src="../template/images/car.png" width="32" height="32" /></div></td>
                                    </tr>
                                  <tr>
                                    <td height="37" align="right" class="traffic_button"><div onclick="SH_fun(20);">火车&nbsp;&nbsp;</div></td>
                                    <td><div onclick="SH_fun(20);"><img src="../template/images/train.png" width="32" height="32" /></div></td>
                                    </tr>
                                  <tr>
                                    <td height="37" align="right" class="traffic_button"><div onclick="SH_fun(21);">地铁&nbsp;&nbsp;</div></td>
                                    <td><div onclick="SH_fun(21);"><img src="../template/images/subway.png" width="32" height="32" /></div></td>
                                    </tr>
                                  <tr>
                                    <td height="37" align="right" class="traffic_button"><div onclick="SH_fun(22);">飞机&nbsp;&nbsp;</div></td>
                                    <td><div onclick="SH_fun(22);"><img src="../template/images/plane.png" width="32" height="32" /></div></td>
                                    </tr>
                                  </table></td>
                                <td width="10">&nbsp;</td>
                                <td valign="top">
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td>           <div id="traffic_box_23" class="traffic_box_2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="100" height="25">乘坐直达快巴：</td>
                                            <td><select name="bus" id="bus" onchange="bus_fun();">
                                              <option value="1" selected="selected">天河客运站</option>
                                              <option value="2">天河大厦客运站</option>
                                              <option value="3">广州汽车客运站</option>
                                              <option value="4">省汽车客运站</option>
                                              <option value="5">流花车站</option>
                                              <option value="6">窖口客运站（广佛路口站）</option>
                                              <option value="7">芳村客运站</option>
                                              <option value="8">越秀南汽车站</option>
                                              <option value="9">海珠客运站</option>
                                              <option value="10">东圃客运站</option>
                                              <option value="11">黄埔客运站</option>
                                              <option value="12">番禺客运站</option>
                                              <option value="13">花都汽车客运站</option>
                                              <option value="14">广州火车东站客运站</option>
                                              </select></td>
                                            </tr>
                                          </table>
                                        </div>
                                        <div id="traffic_box_24" class="traffic_box_2">
                                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="100" height="25">自驾私家车：</td>
                                              <td><select name="drive" id="drive" onchange="drive_fun();">
                                                <option value="15">深圳、东莞、河源、潮州、揭阳、汕头、汕尾、惠州、梅州方向的朋友</option>
                                                <option value="16">湛江、茂名、阳江、江门、佛山、云浮、肇庆方向的朋友</option>
                                                <option value="17">清远方向的朋友</option>
                                                <option value="18">韶关、珠海、中山方向的朋友</option>
                                                <option value="19">增城、从化、花都、番禺方向的朋友</option>
                                                </select></td>
                                              </tr>
                                            </table>
                                          </div></td>
                                      </tr>
                                    <tr>
                                      <td height="25">&nbsp;</td>
                                      </tr>
                                    <tr>
                                      <td height="30">
                                        <div id="traffic_box_1" class="traffic_box">
                                          到达天河客运站后：<br/>
                                          1、首选乘坐地铁三号线，到广州火车东站下车，I或B出口出来。<br/>
                                          2、可转乘从(天河客运站2)乘884南行车，到广州火车东站下车。
                                          </div>
                                        <div id="traffic_box_2" class="traffic_box">
                                          到达天河大厦下车后：<br/>
                                          1、首选打出租车，到广州火车东站西侧的中泰国际广场门口下车。<br/>
                                          2、或到天河城负一层，体育西地铁站乘坐地铁三号接驳线，到广州火车东站下车，I或B出口出来。<br/>
                                          3、不赶时间，走路到广州火车东站（中泰国际广场楼），也只是15分钟左右。   
                                          </div>
                                        <div id="traffic_box_3" class="traffic_box">
                                          到达广州汽车客运站后：<br/>
                                          1、乘坐地铁2号线，从广州火车站到公园前，再转1号线，坐到终点站广州火车东站下车，I或B出口出来。<br/>
                                          2、也可以从市客运站（广州火车站）乘坐公交车256到终点站广州火车东站下车。   
                                          </div>
                                        <div id="traffic_box_4" class="traffic_box">
                                          到达省汽车站后：<br/>
                                          1、乘坐地铁2号线，从广州火车站到公园前，再转1号线，坐到终点站广州火车东站下车，I或B出口出来。<br/>
                                          2、也可从市客运站（火车站）乘坐公交车256到终点站广州火车东站下车。   
                                          </div>
                                        <div id="traffic_box_5" class="traffic_box">
                                          到达流花车站后：<br/>
                                          1、乘坐地铁2号线，从广州火车站到公园前，再转1号线，坐到终点站广州火车东站下车，I或B出口出来。<br/>
                                          2、也可从市客运站（火车站）乘坐公交车256到终点站广州火车东站下车。   
                                          </div>
                                        <div id="traffic_box_6" class="traffic_box">
                                          到达窖口客运站（广佛路口站）后：<br/>
                                          1、乘坐公交车233到终点站广州火车东站下车。<br/>
                                          2、这个路线似乎只有上面那条线路，别的线路都需比较麻烦的转车。   
                                          </div>
                                        <div id="traffic_box_7" class="traffic_box">
                                          到达芳村客运站后：<br/>
                                          1、首选乘坐地铁一号线，从坑口地铁站坐到终点站广州火车东站下车，即可。<br/>
                                          2、没有直达公交车到广州火车东站。    
                                          </div>
                                        <div id="traffic_box_8" class="traffic_box">
                                          到达越秀南汽车站后：<br/>
                                          1、走10分钟路，到达农讲所地铁站，坐地铁1号线到终点站广州火车东站下车。<br/>
                                          2、这个车站换乘地铁或公交车都比较麻烦，不是万不得已不建议到此汽车站换乘。   
                                          </div>
                                        <div id="traffic_box_9" class="traffic_box">
                                          到达海珠客运站后：<br/>
                                          1、从海珠客运总站乘坐公交车551，到终点站广州火车东站下车。<br/>
                                          2、本客运站转乘可选择的方式也不多。   
                                          </div>
                                        <div id="traffic_box_10" class="traffic_box">
                                          到达东圃客运站后：<br/>
                                          可乘坐公交车214、515、41长到终点站广州火车东站下车。 
                                          </div>
                                        <div id="traffic_box_11" class="traffic_box">
                                          到达黄埔客运站后：<br/>
                                          可以乘坐公交车506、214、292到终点站广州火车东站下车即可。   
                                          </div>
                                        <div id="traffic_box_12" class="traffic_box">
                                          到达番禺客运站后：<br/>
                                          从番禺客运站乘坐310、303到市桥客运站下车，转地铁三号线或汽车302到终点站广州火车东站都可以。  
                                          </div>
                                        <div id="traffic_box_13" class="traffic_box">
                                          到达花都客运站后：<br/>
                                          1、从花都客运站总站乘705南行车，到和平新村站下车，然后换乘62路，到广州火车东站下车即可。<br/>
                                          2、从花都客运站总站乘705南行车，到石路基站下车，然后换乘233路，到广州火车东站下车即可。<br/>
                                          3、从花都客运站总站乘705南行车，到富力半岛花园站2下车，然后换乘283，到广州火车东站下车即可。<br/>
                                          4、从花都客运站总站乘705南行车，到凰岗路口站下车，然后换乘280，到广州火车东站下车即可。  
                                          </div>
                                        <div id="traffic_box_14" class="traffic_box">
                                          到达广州火车东站客运站后：<br/>
                                          步行一分钟即可到达医院。    
                                          </div>
                                        <div id="traffic_box_15" class="traffic_box">
                                          深圳、东莞、河源、潮州、揭阳、汕头、汕尾、惠州、梅州方向的朋友：<br/>
                                          可以经广惠高速、广汕高速、广深高速再到北环高速，广汕出口或广从出口下来，向广州火车东站方向（中泰国际广场）开来即可。   
                                          </div>
                                        <div id="traffic_box_16" class="traffic_box">
                                          湛江、茂名、阳江、江门、佛山、云浮、肇庆方向的朋友：<br/>
                                          可以经广佛高速，到北环高速，从广汕出口或广从出口下来，向广州火车东站方向开来即可。    
                                          </div>  
                                        <div id="traffic_box_17" class="traffic_box">
                                          清远方向的朋友：<br/>
                                          可以经广清高速，到北环高速，广汕出口或广从出口下来，向广州火车东站方向（中泰国际广场）开来即可。   
                                          </div>  
                                        <div id="traffic_box_18" class="traffic_box">
                                          韶关、珠海、中山方向的朋友：<br/>
                                          可以经京珠高速，到华南干线，从黄埔大道出口，向广州火车东站方向（中泰国际广场）开来即可。   
                                          </div>  
                                        <div id="traffic_box_19" class="traffic_box">
                                          增城、从化、花都、番禺方向的朋友：<br/>
                                          分别可从广园快速、广从公路、机场高速、华南干线沿着广州火车东站方向（中泰国际广场）开来。
                                          </div>  
                                        <div id="traffic_box_20" class="traffic_box">
                                          目前全国各地有218多条的火车线路经过广州火车东站，到广州火车东站下车后，走路过来只需两分钟。  
                                          </div>  
                                        <div id="traffic_box_21" class="traffic_box">
                                          从广州任何地铁入口坐地铁到广州火车东站下车，从I或B出口出来走两分钟就到。  
                                          </div>  
                                        <div id="traffic_box_22" class="traffic_box">
                                          1、我们会专门派人免费接送。<br/>
                                          2、机场大巴坐到锦汉大厦、中信广场、总统大酒店都可以。之后打车过来都不跳表的。或坐到广州火车东站客运站，步行过来只需一分钟。<br/>
                                          3、乘坐出租车：共行驶33公里，费用56元左右。 
                                          </div></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            </tr>
  </table></td>
                        <td width="21">&nbsp;</td>
                        </tr>
                      </table>
                    </div></td>
                  </tr>
                <tr>
                  <td height="13"></td>
                  </tr>
                </table></td>
              <td width="1" bgcolor="#b1d8b1"></td>
              <td valign="top" bgcolor="#8fbda0">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
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