<!--#include file="../../page/system/fun.asp"-->
<!--#include file="../../page/onepage/fun.asp"-->
<!--#include file="../../page/EasyArticle/fun.asp"-->
<%const WebOrigin_system = "../../page/"%>
<%
function lIll(l1,invalue)
dim str,tagname,tag,l2

tag=htmldecode(l1)

tagname=lcase(WebOrigin.sect(tag,"(WebOrigin\:)","( |\/|\}|\))",""))
select case tagname
case"sitename" str=WebOrigin.sitename
case"url","siteurl" str=WebOrigin.siteurl
case"cms","WebOriginCMS" str="<p id=""WebOriginCMS"">Powered by: <a href=""http://www."&WebOrigin.systemname&".com/"" style=""font-weight:bold"" target=""_blank"">"&WebOrigin.systemname&"</a> <span>"&WebOrigin.systemver&"</span></p>"
case"now" str=I1I1I(tag,"now:"&encode(tnow),"now")'str=tnow
case"keywords","keyword"'但开发的时候必须用keywords
	str=I1I1I(tag,invalue,"keywords"):if len(str)=0 then str=I1I1I(tag,invalue,"title")
case"description"
	str=I1I1I(tag,invalue,"description"):if len(str)=0 then str=I1I1I(tag,invalue,"title")
case"inst"
	str=WebOrigin.inst
case"page"
	str=WebOrigin.page
case"rnd" str=salt(16)
case"rnd4" str=salt(4)
case"rnd8" str=salt(8)
case"guide"
	str=I1I1I(tag,invalue,"guide")
	l2=WebOrigin.getlabel(tag,"name")
	if len(l2)>0 then
		if len(str)=0 then
			str="<a href=""/"" class=""WO_guidename"">"&l2&"</a>"&I1I1I(tag,invalue,"title")
		else
			str="<a href=""/"" class=""WO_guidename"">"&l2&"</a>"&str
		end if
	else
		if len(str)=0 then
			str="<a href=""/"" class=""WO_guidename"">"&WebOrigin.sitename&"</a> &gt;&gt; "&I1I1I(tag,invalue,"title")
		else
			str="<a href=""/"" class=""WO_guidename"">"&WebOrigin.sitename&"</a> &gt;&gt; "&str
		end if
	end if
case"sql"
	str=WebOrigin.ensql(tag)
case"onepage#update" str=WebOrigin_tag_onepage_update(tag)
case"easyarticle" str=WebOrigin_tag_easyarticle(tag,invalue)

case else
	str=I1I1I(tag,invalue,tagname)
end select
lIll=str
end function
%>