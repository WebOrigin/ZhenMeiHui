<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>八步尊贵服务流程 - 真美汇</title>
<style type="text/css">
	#center {
		position: relative;
		left: 430px;
		top: 190px;
		line-height:1.5;
	}
	#slider {
		position: absolute;
		width: 770px;
		height: 320px;
		left: -430px;
		top: -186px;
		overflow: hidden;
	}
	#slider .slide {
		position: absolute;
		top: 0px;
		height: 320px;
		width: 480px;
		background: #000;
		overflow: hidden;
		border-left: #000 solid 1px;
		cursor: default;
	}
	#slider .title   {
		color: #FFF;
		font-family:Arial, Helvetica, sans-serif;
		font-size: 35px;
		margin-right: 1.5em;
		text-decoration: none;
	}
	#slider .sub_title   {
		color: #FFF;
		font-family:Arial, Helvetica, sans-serif;
		font-size: 23px;
		margin-right: 1.5em;
		text-decoration: none;
	}
	#slider .backgroundText {
		position: absolute;
		width: 100%;
		height: 100%;
		top: 100%;
		background: #000;
		filter: alpha(opacity=40);
		opacity: 0.4;
	}
	#slider .text {
		position: absolute;
		top: 1%;
		top: 100%;
		/*Leask*/
		padding-top:230px;
		color: #FFF;
		font-family:Arial, Helvetica, sans-serif;
		font-size: 12px;
		text-align: justify;
		width: 470px;
		left: 10px;
	}
	#slider .diapo {
		position: absolute;
		filter: alpha(opacity=100);
		opacity: 1;
		visibility: hidden;
	}
</style>
<script type="text/javascript" src="/ltree_api/ltree.js"></script>
<script type="text/javascript">
/* ==== slider nameSpace ==== */
var slider = function() {
	/* ==== private methods ==== */
	function getElementsByClass(object, tag, className) {
		var o = object.getElementsByTagName(tag);
		for ( var i = 0, n = o.length, ret = []; i < n; i++) {
			if (o[i].className == className) ret.push(o[i]);
		}
		if (ret.length == 1) ret = ret[0];
		return ret;
	}
	function setOpacity (obj,o) {
		if (obj.filters) obj.filters.alpha.opacity = Math.round(o);
		else obj.style.opacity = o / 100;
	}
	/* ==== Slider Constructor ==== */
	function Slider(oCont, speed, iW, iH, oP) {
		this.slides = [];
		this.over   = false;
		this.S      = this.S0 = speed;
		this.iW     = iW;
		this.iH     = iH;
		this.oP     = oP;
		this.oc     = document.getElementById(oCont);
		this.frm    = getElementsByClass(this.oc, 'div', 'slide');
		this.NF     = this.frm.length;
		this.resize();
		for (var i = 0; i < this.NF; i++) {
			this.slides[i] = new Slide(this, i);
		}
		this.oc.parent = this;
		this.view      = this.slides[0];
		this.Z         = this.mx;
		/* ==== on mouse out event ==== */
		this.oc.onmouseout = function () {
			this.parent.mouseout();
			return false;
		}
	}
	Slider.prototype = {
		/* ==== animation loop ==== */
		run : function () {
			this.Z += this.over ? (this.mn - this.Z) * .5 : (this.mx - this.Z) * .5;
			this.view.calc();
			var i = this.NF;
			while (i--) this.slides[i].move();
		},
		/* ==== resize  ==== */
		resize : function () {
			this.wh = this.oc.clientWidth;
			this.ht = this.oc.clientHeight;
			this.wr = this.wh * this.iW;
			this.r  = this.ht / this.wr;
			this.mx = this.wh / this.NF;
			this.mn = (this.wh * (1 - this.iW)) / (this.NF - 1);
		},
		/* ==== rest  ==== */
		mouseout : function () {
			this.over      = false;
			setOpacity(this.view.img, this.oP);
		}
	}
	/* ==== Slide Constructor ==== */
	Slide = function (parent, N) {
		this.parent = parent;
		this.N      = N;
		this.x0     = this.x1 = N * parent.mx;
		this.v      = 0;
		this.loaded = false;
		this.cpt    = 0;
		this.start  = new Date();
		this.obj    = parent.frm[N];
		this.txt    = getElementsByClass(this.obj, 'div', 'text');
		this.img    = getElementsByClass(this.obj, 'img', 'diapo');
		this.bkg    = document.createElement('div');
		this.bkg.className = 'backgroundText';
		this.obj.insertBefore(this.bkg, this.txt);
		if (N == 0) this.obj.style.borderLeft = 'none';
		this.obj.style.left = Math.floor(this.x0) + 'px';
		setOpacity(this.img, parent.oP);
		/* ==== mouse events ==== */
		this.obj.parent = this;
		this.obj.onmouseover = function() {
			this.parent.over();
			return false;
		}
	}
	Slide.prototype = {
		/* ==== target positions ==== */
		calc : function() {
			var that = this.parent;
			// left slides
			for (var i = 0; i <= this.N; i++) {
				that.slides[i].x1 = i * that.Z;
			}
			// right slides
			for (var i = this.N + 1; i < that.NF; i++) {
				that.slides[i].x1 = that.wh - (that.NF - i) * that.Z;
			}
		},
		/* ==== HTML animation : move slides ==== */
		move : function() {
			var that = this.parent;
			var s = (this.x1 - this.x0) / that.S;
			/* ==== lateral slide ==== */
			if (this.N && Math.abs(s) > .5) {
				this.obj.style.left = Math.floor(this.x0 += s) + 'px';
			}
			/* ==== vertical text ==== */
			var v = (this.N < that.NF - 1) ? that.slides[this.N + 1].x0 - this.x0 : that.wh - this.x0;
			if (Math.abs(v - this.v) > .5) {
				this.bkg.style.top = this.txt.style.top = Math.floor(- 3 - that.ht + (v - that.Z) * that.iH * that.r) + 'px'; //Leask：文本透明背景高度
				this.v = v;
				this.cpt++;
			} else {
				if (!this.pro) {
					/* ==== adjust speed ==== */
					this.pro = true;
					var tps = new Date() - this.start;
					if(this.cpt > 1) {
						that.S = Math.max(2, (28 / (tps / this.cpt)) * that.S0);
					}
				}
			}
			if (!this.loaded) {
				if (this.img.complete) {
					this.img.style.visibility = 'visible';
					this.loaded = true;
				}
			}
		},
		/* ==== light ==== */
		over : function () {
			this.parent.resize();
			this.parent.over = true;
			setOpacity(this.parent.view.img, this.parent.oP);
			this.parent.view = this;
			this.start = new Date();
			this.cpt = 0;
			this.pro = false;
			this.calc();
			setOpacity(this.img, 100);
		}
	}
	/* ==== public method - script initialization ==== */
	return {
		init : function() {
			// create instances of sliders here
			// parameters : HTMLcontainer name, speed (2 fast - 20 slow), Horizontal ratio, vertical text ratio, opacity
			this.s1 = new Slider("slider", 12, 48/77, 1/3.2, 70);
			setInterval("slider.s1.run();", 16);
		}
	}
}();

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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="home_bg_nt_2">
      <tr>
        <td width="788" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
            <td height="7"></td>
          </tr>
          <tr>
            <td height="37" id="page_title"><div onmouseover="show_menu(-2);">八步尊贵服务流程</div></td>
          </tr>
          <tr>
            <td><div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                <td width="5"></td>
                  <td class="template_a_mtext"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top" height="330"><div id="center" onmouseover="show_menu(-2);">
                        <div id="slider">
                          <div class="slide">
                            <img class="diapo" src="flow_images/01.jpg" alt="">
                            <div class="text">
                              <span class="title">了解军美</span><br>
                              通过网站（www.joyme.org）或宣传资料，初步了解“军美”。<br/><br/><br/>
                              <span class="sub_title">①<br/>了<br/>解<br/>军<br/>美</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/02.jpg" alt="">
                            <div class="text">
                              <span class="title">预约就诊</span><br>
                              进行电话咨询，并可预约会诊时间。（咨询电话：020-61130789）<br />进行在线咨询，并可预约会诊时间。<br/><br/>
                              <span class="sub_title">②<br/>预<br/>约<br/>就<br/>诊</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/03.jpg" alt="">
                            <div class="text">
                              <span class="title">微笑导诊</span><br />
                              军美的导医首先以微笑欢迎您，为您提供帮助，亲切接待您，并跟您介绍相关流程、<br/>协助您轻松完成美丽变身，而且严格尊重您的隐私，让您的感觉就像家一样温馨。<br/><br/>
                              <span class="sub_title">③<br/>微<br/>笑<br/>导<br/>诊</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/04.jpg" alt="">
                            <div class="text">
                              <span class="title">专业面谈</span><br>
                              军美的咨询医生会跟你面对面沟通，用心体贴的解答你所关心的各种问题，<br />让您更了解自己，更了解美丽。<br/><br/>
                              <span class="sub_title">④<br/>专<br/>业<br/>面<br/>谈</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/05.jpg" alt="">
                            <div class="text">
                              <span class="title">形象设计</span><br>
                              军美的形象顾问会同主诊专家，以美学和医学的原则，同时考虑您的个性需求，<br />为您提供个性化的美丽解决方案，实现您的美丽梦想。<br/><br/>
                              <span class="sub_title">⑤<br/>形<br/>象<br/>设<br/>计</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/06.jpg" alt="">
                            <div class="text">
                              <span class="title">美丽变身</span><br>
                              军美的诊断专家，严格按照医德操守和手术流程，根据与您共同确定的美丽方案<br />亲自为您精心施术。<br/><br/>
                              <span class="sub_title">⑥<br/>美<br/>丽<br/>变<br/>身</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/07.jpg" alt="">
                            <div class="text">
                              <span class="title">精心复诊</span><br>
                              手术后，专家均定期亲自检查和复诊，排除各种隐患，保证您的健康和手术效果。<br/><br/><br/>
                              <span class="sub_title">⑦<br/>精<br/>心<br/>复<br/>诊</span>
                              </div>
                            </div>
                          <div class="slide">
                            <img class="diapo" src="flow_images/08.jpg" alt="">
                            <div class="text">
                              <span class="title">终身关怀</span><br>
                              出院后，军美的专家随时欢迎您的联系，对您也进行终身定期的回访，<br />了解您的术后效果，为您的手术排难解忧。<br/><br/>
                              <span class="sub_title">⑧<br/>终<br/>身<br/>关<br/>怀</span>
                              </div>
                            </div>
                          </div>
                        </div></td>
                      </tr>
                    <tr>
                      <td height="10">
                        </td>
                      </tr>
                    <tr>
                      <td>尊贵服务流程：军美注重高品质的服务，率先导入尊贵服务体系，全体医护人员均接受铂金服务标准和八步尊贵服务流程培训，为您提供全程尊贵服务，用心成就您的美丽。</td>
                      </tr>
                    </table>
</td>
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
/* ==== start script ==== */
slider.init();
var adTop=10;
var mpt=1;
show_menu(-1);

setInterval("adMove()",70)
</script>
</body>
</html>