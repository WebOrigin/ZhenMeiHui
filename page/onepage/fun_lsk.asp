<%
class onepage
private r_doc,r_path,r_uptime


private sub class_initialize()

	r_path="onepage"

	r_uptime=3'更新首页的时间

	if WebOrigin.checkcolumn("WebOriginonepage")=false then install
end sub

public function lang(l1)
	on error resume next
	if isobject(r_doc)=false then
		set r_doc=Server.CreateObject(WebOrigin_xmldom)
		r_doc.async=false
		'判断是否存在所设置的语言包,如果没有就调用默认设置的语言包
		if WebOrigin.isexist(WebOrigin_system&r_path&"/language/"&WebOrigin.language&".xml") then
			r_doc.load(server.mappath(WebOrigin_system&r_path&"/language/"&WebOrigin.language&".xml"))
		else
			r_doc.load(server.mappath(WebOrigin_system&r_path&"/language/"&WebOrigin_language&".xml"))
		end if
	end if
	lang=r_doc.documentElement.SelectSingleNode("//WebOriginCMS/"&l1).text
	if err.number<>0 then
		lang="["&l1&"]"
		err.clear
	end if
end function

public sub list()
	dim query:query=quest("query",0)
	Il "<h2>"&one.lang("title")
	Il "<span class=""listmenu"">"
	Il "<a href=""index.asp"">["&WebOrigin.lang("common/list")&"]</a>"
	Il "<a href=""index.asp?action=edt"">["&one.lang("common/add")&"]</a>"
	if len(query)>0 then
		Il "<kbd id=""search"">"
		Il "<input type=""text"" value="""&formencode(query)&""" onkeydown=""if(event.keyCode==13) {window.location='index.asp?query='+encodeURI(this.value); return false;}"" />"
		Il "</kbd>"
	else
		Il "<kbd id=""search""><a href=""javascript:;"" onclick=""gethtm('index.asp?action=insearch','search')"">["&WebOrigin.lang("common/search")&"]</a></kbd>"
	end if
	Il "</span>"
	Il "</h2>"


end sub

public sub createmap()
	if len(WebOrigin.mapname)=0 then exit sub

	dim rs,i,data,outmap
	set rs=conn.execute("select onepath from WebOriginonepage order by oneid desc;")
		if not rs.eof and not rs.bof then
			data=rs.getrows()
			outmap="<?xml version=""1.0"" encoding=""UTF-8""?>"
			outmap=outmap&"<urlset xmlns="""&WebOrigin_map_xmlns&""">"
			for i=0 to ubound(data,2)
				outmap=outmap&"<url>"
				outmap=outmap&"<loc>"&WebOrigin.siteurl&WebOrigin.inst&data(0,i)&"</loc>"
				outmap=outmap&"<priority>0.5</priority>"
				outmap=outmap&"</url>"
			next
			outmap=outmap&"</urlset>"
			WebOrigin.savetofile "../../"&r_path&".xml",outmap
		end if
		rs.close
	set rs=nothing
end sub

public sub create(l1)
	dim tmphtm,outhtm,i,sql,menupath,metainfo,rs,data,paths,path
	sql="onename,onetitle,onepath,onekeyword,onedescription,onecontent,onetemplate1,onetemplate2,oneid"'8

	set rs=conn.execute("select "&sql&" from WebOriginonepage where oneid in ("&l1&");")
		if not rs.eof and not rs.bof then
			data=rs.getrows()
		else
			redim data(7,-1)
		end if
		rs.close
	set rs=nothing

	for i=0 to ubound(data,2)
		tmphtm=WebOrigin.read(data(6,i),r_path&"/"&data(7,i))

		WebOrigin.clearvalue
		WebOrigin.value "id",data(8,i)
		WebOrigin.value "title",encode(htmlencode(data(1,i)))
		WebOrigin.value "name",encode(htmlencode(data(0,i)))
		WebOrigin.value "keywords",encode(htmlencode(data(3,i)))
		WebOrigin.value "description",encode(htmlencode(data(4,i)))
		WebOrigin.value "content",encode(data(5,i))
		WebOrigin.value "path",encode(data(2,i))
		WebOrigin.value "guide",encode(htmlencode(data(0,i)))
		WebOrigin.value "commentid",encode(r_path&"|"&data(8,i))'传递评论参数
		outhtm=WebOrigin.create(tmphtm,WebOrigin.invalue)


		if len(data(2,i))>0 then
			'判断是否为文件名，如果是文件名，则建立目录到上一级
			paths=split(data(2,i),"/")
			if instr(paths(ubound(paths)),".")>0 then'文件
				if instr(data(2,i),"/")>0 then
					path=left(data(2,i),(len(data(2,i))-len(paths(ubound(paths))))-1)
					WebOrigin.createfolder "../../"&path
				end if
				WebOrigin.savetofile "../../"&data(2,i),outhtm'创建文件
			else'目录
				WebOrigin.createfolder "../../"&data(2,i)
				WebOrigin.savetofile "../../"&data(2,i)&"/"&WebOrigin_ext,outhtm'创建文件
			end if
		else'写首页
			WebOrigin.savetofile "../../"&WebOrigin_ext,outhtm
		end if
	next
	
end sub

private sub install()
	WebOrigin.head "admin",0
	dim sql
	'WebOriginonepage 
	sql="oneid int not null identity primary key,"'id
	sql=sql&"oneorder int not null default 0,"'排序
	sql=sql&"onetitle nvarchar(100),"'标题
	sql=sql&"onepath nvarchar(100),"'路径
	sql=sql&"onename nvarchar(50),"'名称
	sql=sql&"onekeyword nvarchar(50),"'关键字
	sql=sql&"onedescription nvarchar(250),"'介绍
	sql=sql&"onecontent ntext,"'内容
	sql=sql&"onetemplate1 nvarchar(50),"'外部模板
	sql=sql&"onetemplate2 nvarchar(50)"'内部模板
	conn.execute "create table WebOriginonepage ("&sql&")"
	'插入sitemap
	conn.execute "insert into WebOriginsitemap (maploc,maplastmod) values ('"&r_path&"','"&tnow&"')"
	WebOrigin.createmap
end sub

public function updatejs(l1,l2)
	dim I1
	I1="var datediff=getdom('"&WebOrigin.page&"system/now.asp?datetime="&server.urlencode(tnow)&"');"
	if validate(l2,2) then
		I1=I1&"if(datediff>"&l2&"){getdom('"&WebOrigin.page&"onepage/create.asp?listid="&server.urlencode(l1)&"&time="&l2&"');};"
	else
		I1=I1&"if(datediff>"&r_uptime&"){getdom('"&WebOrigin.page&"onepage/create.asp?listid="&server.urlencode(l1)&"');};"
	end if
	updatejs=I1
end function

end class


function WebOrigin_tag_onepage_update(tag)
	dim t_class,listid,jstime
	listid=WebOrigin.getlabel(tag,"listid")
	jstime=WebOrigin.getlabel(tag,"time")
	WebOrigin_tag_onepage_update="<script src="""&WebOrigin.page&"onepage/update.js""></script>"
	set t_class=new onepage
		WebOrigin.savetofile WebOrigin.page&"onepage/update.js",t_class.updatejs(listid,jstime)'创建日期文件
	set t_class=nothing
end function

%>