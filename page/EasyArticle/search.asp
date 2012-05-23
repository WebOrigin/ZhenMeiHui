<!--#include file="../system/plugin.asp"-->
<%
dim art
set WebOrigin=new WebOriginCMS
WebOrigin.checkplugin WebOrigin.path '检查插件安装状态
set art=new easyarticle
	select case action
	case"" WebOrigin_def
	end select
set art=nothing
set WebOrigin=nothing

sub WebOrigin_def()

	dim query,i,space,rn,dp,sql,qcount,selected,tt,rs,listname,listpath,tquery
	tt=timer
	
	tquery=quest("query",4)

	space=quest("space",2)
	if cstr(space)="1" then'内容
		query=WebOrigin.likey("artdescription",tquery)
	else'标题搜索
		query=WebOrigin.likey("arttitle",tquery)
	end if

	rn=quest("rn",2)
	if int(rn)>100 then rn=100
	if int(rn)<10 then rn=10

	WebOrigin.ol="<div id=""WO_select"">"


	'有提交搜索值的时候，显示搜索结果
	if len(query)>0 then
		sql="select top 1000 artid,listid,arttitle,artdescription,artdate from WebOrigineasyart where "&query&" order by artdate desc;"
		qcount=conn.execute("select count(artid) from WebOrigineasyart where "&query&";")(0)

		WebOrigin.ol="<form name=""form1"" method=""get"" action=""search.asp"" class=""WO_form"">"
		WebOrigin.ol="<p><input type=""text"" name=""query"" value="""&quest("query",0)&""" maxlength=""100"" class=""WO_in3"" /> "

		WebOrigin.ol="<select name=""space"">"
		if cstr(space)<>"1" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""0"""&selected&">"&art.lang("label/sel/title")&"</option>"
		if cstr(space)="1" then selected=" selected=""selected""" else selected=""
		WebOrigin.ol="<option value=""1"""&selected&">"&art.lang("label/sel/content")&"</option>"
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

		WebOrigin.ol="<input type=""submit"" value="""&WebOrigin.lang("common/search")&""" class=""WO_submit""/>"
		WebOrigin.ol="</p>"
		WebOrigin.ol="</form>"

		WebOrigin.ol="<div class=""WO_search"">"

		set dp=new record
			dp.create sql
			dp.purl="search.asp?rn="&rn&"&pid=$&query="&server.urlencode(quest("query",0))&"&space="&space
			'有符合搜索项目的时候显示
			if dp.length>=0 then
				WebOrigin.ol="<p>"&replace(art.lang("tip/search"),"[***number***]",formatnumber(qcount,0,true))&"</p>"
				WebOrigin.ol=dp.plist
				'循环显示搜索结果列表
				for i=0 to dp.length
					set rs=conn.execute("select listname,listpath from WebOrigineasyart_list where listid="&dp.data(1,i)&";")
						if not rs.eof and not rs.bof then
							listname=rs(0)
							listpath=rs(1)
						end if
						rs.close
					set rs=nothing
					WebOrigin.ol="<div>"
					WebOrigin.ol="<h3><a target=""_blank"" href="""&WebOrigin.inst&listpath&"/"&art.initially&dp.data(0,i)&""">"&keylight(htmlencode(dp.data(2,i)),tquery)&"</a></h3>"
					WebOrigin.ol="<p>"&keylight(htmlencode(WebOrigin.lefte(dp.data(3,i),200)),tquery)&"</p>"
					WebOrigin.ol="<p><span>"&dp.data(4,i)&"</span> - <a target=""_blank"" href="""&WebOrigin.inst&listpath&""">"&htmlencode(listname)&"</a></p>"
					WebOrigin.ol="</div>"
				next
				WebOrigin.ol=dp.plist
			
			'没有项目符合搜索结果的时候显示
			else
				WebOrigin.ol="<div><p>"&art.lang("tip/noart")&"</p></div>"
			end if
		set dp=nothing

		WebOrigin.ol="</div>"

		WebOrigin.value "guide",encode("<a href=""search.asp"">"&WebOrigin.lang("common/search")&"</a> &gt;&gt; "&htmlencode(quest("query",0)))



	'没有提交搜索值，显示搜索框
	else
		WebOrigin.ol="<form name=""form1"" method=""get"" action=""search.asp"" class=""WO_form"">"
		WebOrigin.ol="<p><label>"&art.lang("label/key")&"</label><input type=""text"" name=""query"" maxlength=""100"" class=""WO_in4""/></p>"

		WebOrigin.ol="<p><label>"&art.lang("label/space")&"</label>"
		WebOrigin.ol="<select name=""space"">"
		WebOrigin.ol="<option value=""0"">"&art.lang("label/sel/title")&"</option>"
		WebOrigin.ol="<option value=""1"">"&art.lang("label/sel/content")&"</option>"
		WebOrigin.ol="</select></p>"

		WebOrigin.ol="<p><label>"&art.lang("label/rn")&"</label>"
		WebOrigin.ol="<select name=""rn"">"
		WebOrigin.ol="<option value=""10"">10</option>"
		WebOrigin.ol="<option value=""20"">20</option>"
		WebOrigin.ol="<option value=""50"">50</option>"
		WebOrigin.ol="<option value=""100"">100</option>"
		WebOrigin.ol="</select></p>"

		WebOrigin.ol="<div><input type=""submit"" value="""&WebOrigin.lang("common/search")&""" /></div>"
		WebOrigin.ol="</form>"

		WebOrigin.value "guide",encode(WebOrigin.lang("common/search"))
	end if
	WebOrigin.ol="</div>"



	
	WebOrigin.value "title",encode(tquery)
	WebOrigin.value "inside",encode(replace(WebOrigin.writeol,"[**timer**]",formatnumber(timer-tt,2,true)))
	WebOrigin.outhtm WebOrigin.stemplate,"",WebOrigin.invalue

end sub

%>