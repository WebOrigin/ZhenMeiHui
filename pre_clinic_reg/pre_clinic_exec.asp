<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
if (String(Request.Form('tid')) != 'undefined' )
{
	var tid=String(Request.Form('tid'));
}else{
	var tid='0';
}

if (String(Request.Form('act')) != 'undefined' )
{
	var act=String(Request.Form('act'));
}else{
	var act='-1';
}

function getVal(keyn,tpn){
	var reVal;
	switch(tpn){
		case 1:
			reVal=Request.Form(keyn);
			if (reVal=='on'){
					reVal="[*]"
				}else{
					reVal="[ ]"
			}
		break;
		default:
			reVal=Request.Form(keyn);
			if(reVal=='其他在此填写' || reVal==''){
				reVal='_____________'
				}
			if(reVal=='请选择'){
				reVal="无"
			}
		break;
		}
	return reVal;
}
	
var mTxt=getVal('hidContent')

if (act=='1')
{
	var myemail = "admin@zhenmeihui.com";
	var myname = "Joyme";
	var smtpserver = "mail.zhenmeihui.com";
	var smtpuser = "guest@zhenmeihui.com";
	var smtppwd = "000000";
	var smtpemail = "guest@zhenmeihui.com";
	
	var jmail = Server.CreateObject ('jmail.message');
	
	jmail.Charset="GB2312";
	jmail.From = "guest@zhenmeihui.com";
	jmail.FromName = '真美会';
	jmail.ReplyTo = 'guest@zhenmeihui.com';
	switch(tid)
	{
		case '0':
			jmail.Subject="[真美会]预诊登记表";
		break;
		case '1':
			jmail.Subject="[真美会]调查表";
		break;
	}
	jmail.HTMLBody=mTxt;
	jmail.Body ='请确认你的邮件客户端支持HTML邮件。';
	
	jmail.AddRecipient(myemail,myname);
	jmail.MailServerUserName = smtpuser;
	jmail.MailServerPassWord = smtppwd;
	
	var isgo=jmail.Send(smtpserver);
	
	//jmail.Close;
	//jmail=nothing;
	
}
%>
<script type="text/javascript">
if (<%=act%>==1)
{
	switch(<%=tid%>)
	{
		case 0:
			if (confirm('是否继续填写真美会无记名调查表？'))
			{
				location.href='/pre_clinic_reg/index.asp?tid=1';
			}else{
				location.href='/send_success/';
			}
		break;
		case 1:
			location.href='/send_success/';
		break;
	}
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http：//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http：//www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>真美汇</title>
<link href="/template/images/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div>
<div id="divTable">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="http://www.joyme.org/template/images/tb_<%=tid%>.png" style="background-repeat:repeat-x;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" background="http://www.joyme.org/template/images/logo_big_<%=tid%>.png" style="background-repeat:no-repeat;">
              <tr>
                <td width="14"></td>
                <td valign="top" style="text-decoration: none; font-size: 12px;	color: #333333;	line-height:2;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
switch (tid)
{
	case '0':
%>
  <tr>
    <td><table width="700" border="0" cellpadding="0" cellspacing="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px;">
  <tr>
    <td align="center"><img src="http://www.joyme.org/template/images/table_title.png" width="158" height="28" /></td>
  </tr>
    <tr>
  <td height="30"></td>
  </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="25%">姓名：<%=getVal("Name")%></td>
          <td width="25%">年龄：<%=getVal("Age")%></td>
          <td width="25%">性别：<%getVal("Gender")%></td>
          <td width="25%">联系电话：<%=getVal("Tel")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="70">家庭住址：</td>
          <td width="150"><%=getVal("Sheng")%>省</td>
          <td width="170"><%=getVal("XianShi")%>县（市）</td>
          <td><%=getVal("Jiedao")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%">最佳联系时间：<%=getVal("Zuijia")%></td>
          <td width="50%">联系电邮：<%=getVal("E-mail2")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="220">已确定的预约问诊日期和时间：</td>
          <td>____________________________</td>
          <td width="120">（本行医院填写）</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%">身高：<%=getVal("Shengao")%>cm</td>
          <td width="30%">体重：<%=getVal("Tizhong")%>kg</td>
          <td>血压：<%=getVal("Xueya")%>mmHg</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>拟就诊部门：<%=getVal("bumen")%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">拟就诊目的：</td>
          <td width="70"><%=getVal("Yanjing",1)%>眼睛</td>
          <td width="70"><%=getVal("Bizi",1)%>鼻子</td>
          <td width="70"><%=getVal("Lianxing",1)%>脸型</td>
          <td width="70"><%=getVal("Xiongbu",1)%>胸部</td>
          <td width="70"><%=getVal("Ebu",1)%>额部</td>
          <td width="70"><%=getVal("Jing",1)%>颞部</td>
          <td width="70"><%=getVal("Quangu",1)%>颧骨</td>
          <td><%=getVal("Taiyangxue",1)%>太阳穴</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80"></td>
          <td width="70"><%=getVal("Zuiba",1)%>嘴巴</td>
          <td width="70"><%=getVal("EDuo",1)%>耳朵</td>
          <td width="70"><%=getVal("Meimao",1)%>眉毛</td>
          <td width="70"><%=getVal("Shencai",1)%>身材</td>
          <td width="70"><%=getVal("Pifu",1)%>皮肤</td>
          <td width="70"><%=getVal("Rufang",1)%>乳房</td>
          <td width="70"><%=getVal("Couzhi",1)%>抽脂</td>
          <td><%=getVal("Bahen",1)%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80"></td>
          <td width="70"><%=getVal("Zouwen",1)%>皱纹</td>
          <td>其他：<%=getVal("Mudi_Other")%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>拟行手术：<%=getVal("Shoushu")%></td>
          <td>预约时间：<%=getVal("YYShijian")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>整形术史：<%=getVal("Zengxinshoushu")%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%">部位：<%=getVal("Buwei")%></td>
          <td width="30%">医院：<%=getVal("Yiyuan")%></td>
          <td>时间：<%=getVal("Shijian")%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80">既往病史：</td>
          <td width="100"><%=getVal("Xinzhangbing",1)%>心脏病</td>
          <td width="100"><%=getVal("Ganyan",1)%>肝炎</td>
          <td width="100"><%=getVal("Shenbing",1)%>肾病</td>
          <td width="100"><%=getVal("Feibing",1)%>肺病</td>
          <td width="100"><%=getVal("Jiazhuangxian",1)%>甲状腺病</td>
          <td><%=getVal("Gaoxueya",1)%>高血压</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="80"></td>
          <td width="100"><%=getVal("Pinxue",1)%>出血性疾病</td>
          <td width="100"><%=getVal("Jiehe",1)%>结核</td>
          <td>其他：<%=getVal("BS_Other")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="110">正在服用的药物：</td>
          <td width="100"><%=getVal("Jiangya",1)%>降压药</td>
          <td width="100"><%=getVal("asplin",1)%>阿司匹林</td>
          <td width="100"><%=getVal("biyun",1)%>避孕药</td>
          <td width="100"><%=getVal("anding",1)%>安定类药</td>
          <td><%=getVal("pizhixian",1)%>皮质腺素</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="110"></td>
          <td>其他：<%=getVal("yaowu_Other")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>外伤、手术、麻醉史：<%=getVal("wsssmjs")%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>药物过敏：<%=getVal("yaowuguomin")%></td>
          <td>药物名称：<%=getVal("yaowu_mingcheng")%></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="30%">妊娠史：<%=getVal("yunchenshi")%></td>
          <td width="30%">处在月经期：<%=getVal("chuzaiyujing")%></td>
          <td>末次月经：<%=getVal("mociyuejing")%></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="70">生育史：</td>
          <td>孕：<%=getVal("shengyu_yun")%></td>
          <td>产：<%=getVal("shengyu_chan")%></td>
        </tr>
      </table></td>
    </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80">健康状态：</td>
        <td>食欲：<%=getVal("Shiyu")%></td>
        <td>睡眠：<%=getVal("Suimian")%></td>
        <td>烟酒酗好：<%=getVal("Xujiu")%></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"></td>
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
    <td align="center"><img src="http://www.joyme.org/template/images/table_title_2.png" alt="" width="230" height="32" /></td>
  </tr>
      <tr>
  <td height="30"></td>
  </tr>
  <tr>
    <td height="30">1、您的性别：</td>
  </tr>
  <tr>
    <td height="30"><%=getVal("Gender2")%></td>
  </tr>
  <tr>
    <td height="30">2、您的年龄：</td>
  </tr>
  <tr>
    <td height="30"><%=getVal("age_2")%></td>
  </tr>
  <tr>
    <td height="30">3、您的婚姻状况：</td>
  </tr>
  <tr>
    <td height="30"><%=getVal("hunyin")%></td>
  </tr>
  <tr>
    <td height="30">4、您的学历：</td>
  </tr>
  <tr>
    <td height="30"><%=getVal("xueli")%></td>
  </tr>
  <tr>
    <td height="30">5、您的职业：</td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="130"><%=getVal("zhiye")%></td>
        <td>其他：<%=getVal("zhiye_2")%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30">6、您的整容经历：</td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="130"><%=getVal("zhengrongjingli_2")%></td>
          <td>项目：<%=getVal("zhengxingjl_xm_2")%></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="30">7、您对整形了解途径：（可多选）</td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="11%"><%=getVal("dianshi",1)%>电视</td>
        <td width="11%"><%=getVal("baozhi",1)%>报纸</td>
        <td width="11%"><%=getVal("wangluo",1)%>网络</td>
        <td width="11%"><%=getVal("zhazhi",1)%>杂志</td>
        <td width="11%"><%=getVal("guangbo",1)%>广播</td>
        <td width="11%"><%=getVal("duanxin",1)%>短信</td>
        <td width="11%"><%=getVal("huwai",1)%>户外</td>
        <td width="11%"><%=getVal("pengyoujieshao",1)%>朋友介绍</td>
        <td><%=getVal("qitatujing",1)%>其他</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30">8、您对整形机构的选择：</td>
  </tr>
  <tr>
    <td height="30"><%=getVal("jigouxuanze",1)%></td>
  </tr>
  <tr>
    <td height="30">9、您对整形担心的问题：（可多选）</td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="20%"><%=getVal("shoushuanquanxing",1)%>手术安全性
          </td>
        <td width="20%"><%=getVal("shoushuguochengtengtong",1)%>手术过程疼痛</td>
        <td width="20%"><%=getVal("huifuqiguochang",1)%>恢复期过长</td>
        <td><%=getVal("xiaoguokenengdabudayuqibiaozun",1)%>效果可能达不到预期标准</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%"><%=getVal("xiaoguobuchijiu",1)%>效果可能并不会持久</td>
        <td width="35%"><%=getVal("xiaoguobuziranjia",1)%>效果不自然，给人假的感觉</td>
        <td><%=getVal("pabeirenzhidaoyilun",1)%>怕被别人知道或议论</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%"><%=getVal("feiyongtaigao",1)%>费用太高</td>
        <td width="35%"><%=getVal("liuxiazhengronghenji",1)%>怕手术后留下整容的痕迹</td>
        <td>其他：<%=getVal("qitadanxinwenti")%></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30">10、您愿意参加的美丽活动：（可多选）</td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15%"><%=getVal("xiaoguobuchijiu2",1)%>整容讲座</td>
        <td width="25%"><%=getVal("xiaoguobuchijiu3",1)%>时尚酒会、美丽沙龙</td>
        <td width="20%"><%=getVal("xiaoguobuchijiu4",1)%>发布秀</td>
        <td width="15%"><%=getVal("xiaoguobuchijiu5",1)%>选美活动</td>
        <td><%=getVal("xiaoguobuchijiu6",1)%>体验优惠活动</td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"></td>
  </tr>
</table>
</td>
  </tr>
<%
	break;
}
%>
  <tr>
    <td height="30"></td>
  </tr>
    <tr>
    <td height="30"></td>
  </tr>
</table>
</td>
              <td width="21"></td>
              </tr>
            </table>
    </td>
  </tr>
</table>
</div>
<div>
<form action="pre_clinic_exec.asp" method="post" name="form_bl" id="form_bl">
<input type="hidden" name="hidContent">
<input name="act" type="hidden" value="1" />
<input name="tid" type="hidden" value="<%=tid%>" />
</form>
</div>
</div>
</body>
<script type="text/javascript">   
document.all.hidContent.value = document.all.divTable.innerHTML;
if (<%=act%>==-1)
{
	document.all.form_bl.submit();
}
</script>
</html>