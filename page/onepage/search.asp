<!--#include file="../system/plugin.asp"-->
<%
dim one
set WebOrigin=new WebOriginCMS
WebOrigin.checkplugin WebOrigin.path '检查插件安装状态
set one=new onepage
	select case action
	case"" WebOrigin_def
	end select
set one=nothing
set WebOrigin=nothing

sub WebOrigin_def()

	dim query,i,space,rn,dp,sql,qcount,selected,tt,tquery
	tt=timer
	
	tquery=quest("query",4)

	space=quest("space",2)
	if cstr(space)="1" then'内容
		query=WebOrigin.likey("onedescription",tquery)
	else'标题搜索
		query=WebOrigin.likey("onetitle",tquery)
	end if

	rn=quest("rn",2)
	if int(rn)>100 then rn=100
	if int(rn)<10 then rn=10

	WebOrigin.ol="<div id=""WO_select"">"


	'有提交搜索值的时候，显示搜索结果
	if len(query)>0 then
		sql="select top 1000 oneid,onetitle,onedescription,onepath,onename from WebOriginonepage where "&query&" order by oneid desc;"
		qcount=conn.execute("select count(oneid) from WebOriginonepage where "&query&";")(0)

		WebOrigin.ol="<form name=""form1"" method=""get"" action=""search.asp"" class=""WO_form"">"
		WebOrigin.ol="<p><input type=""text"" name=""query"" value="""&quest("query",0)&""" maxlength=""100"" /> "

		WebOrigin.ol="<select name=""space"">"
		if cstr(space)<>"1" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""0"""&selected&">标题</option>"
		if cstr(space)="1" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""1"""&selected&">内容</option>"
		WebOrigin.ol="</select> "

		WebOrigin.ol="<select name=""rn"">"
		if cstr(rn)="10" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""10"""&selected&">10</option>"
		if cstr(rn)="20" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""20"""&selected&">20</option>"
		if cstr(rn)="50" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""50"""&selected&">50</option>"
		if cstr(rn)="100" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""100"""&selected&">100</option>"
		WebOrigin.ol="</select> "

		WebOrigin.ol="<input type=""submit"" value=""搜索"" class=""WO_submit"" />"
		WebOrigin.ol="</form>"

		WebOrigin.ol="<div class=""WO_search"">"
		WebOrigin.ol="<p>约有"&qcount&"项符合 "&htmlencode(quest("query",0))&" 的查询结果，以下是第1-"&rn&"项。 （搜索用时 [**timer**] 秒）</p>"

		set dp=new record
			dp.create sql
			dp.purl="search.asp?rn="&rn&"&pid=$&query="&server.urlencode(quest("query",0))&"&space="&space
			'有符合搜索项目的时候显示
			if dp.length>=0 then
				WebOrigin.ol=dp.plist
				'循环显示搜索结果列表
				for i=0 to dp.length
					WebOrigin.ol="<div>"
					WebOrigin.ol="<h3><a target=""_blank"" href="""&WebOrigin.inst&dp.data(3,i)&""">"&keylight(htmlencode(dp.data(1,i)),tquery)&"</a></h3>"
					WebOrigin.ol="<p>"&keylight(htmlencode(WebOrigin.lefte(dp.data(2,i),200)),tquery)&"</p>"
					WebOrigin.ol="<p><span>"&dp.data(4,i)&"</span> - <a target=""_blank"" href="""&WebOrigin.inst&dp.data(3,i)&"/"">"&WebOrigin.inst&dp.data(3,i)&"</a></p>"
					WebOrigin.ol="</div>"
				next
				WebOrigin.ol=dp.plist
			
			'没有项目符合搜索结果的时候显示
			else
				WebOrigin.ol="<div><p>没有符合要求的内容，请重新搜索！</p></div>"
			end if
		set dp=nothing

		WebOrigin.value "guide",encode("<a href=""search.asp"">搜索</a> &gt;&gt; "&htmlencode(quest("query",0)))

	'没有提交搜索值，显示搜索框
	else
		WebOrigin.ol="<form name=""form1"" method=""get"" action=""search.asp"" class=""WO_form"">"
		WebOrigin.ol="<p><label>关键字：</label><input type=""text"" name=""query"" maxlength=""100"" /></p>"

		WebOrigin.ol="<p><label>搜索范围：</label>"
		WebOrigin.ol="<select name=""space"">"
		WebOrigin.ol="<option value=""0"">标题</option>"
		WebOrigin.ol="<option value=""1"">内容</option>"
		WebOrigin.ol="</select></p>"

		WebOrigin.ol="<p><label>每页显示：</label>"
		WebOrigin.ol="<select name=""rn"">"
		WebOrigin.ol="<option value=""10"">10</option>"
		WebOrigin.ol="<option value=""20"">20</option>"
		WebOrigin.ol="<option value=""50"">50</option>"
		WebOrigin.ol="<option value=""100"">100</option>"
		WebOrigin.ol="</select></p>"

		WebOrigin.ol="<p><input type=""submit"" value=""搜索"" /></p>"
		WebOrigin.ol="</form>"

		WebOrigin.value "guide",encode("搜索")
	end if
	WebOrigin.ol="</div>"

	WebOrigin.value "title",encode("页面搜索")
	WebOrigin.value "inside",encode(replace(WebOrigin.writeol,"[**timer**]",formatnumber(timer-tt,2,true)))
	WebOrigin.outhtm WebOrigin.stemplate,"",WebOrigin.invalue

end sub
%>