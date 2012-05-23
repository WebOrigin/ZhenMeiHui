<%
class easyarticle
private r_path,r_doc,r_initially


private sub class_initialize()

	r_path = "EasyArticle"

	r_initially = "t"

	if WebOrigin.checkcolumn("WebOrigineasyart")=false then install
end sub
'  *** Copyr ight &copy weborigin.co.nz All Rights Reserved ***
public property get initially :initially=r_initially:end property
'  *** Copyr ight &copy weborigin.co.nz All Rights Reserved ***
public property get path :path=r_path:end property

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

public sub createpage(l1)
	dim tmphtm,outhtm,i,j,sql,rs,data
	dim listid,datalist,contents,artfrom
	sql="artid,listid,arttitle,artcontent,artfrom,artkeywords,artdescription,artdate"'7
	
	set rs=conn.execute("select "&sql&" from WebOrigineasyart where artid in ("&l1&");")
		if not rs.eof and not rs.bof then
			data=rs.getrows()
		else
			redim data(7,-1)
		end if
		rs.close
	set rs=nothing

	for i=0 to ubound(data,2)
		if cstr(data(1,i))<>cstr(listid) then
			set rs=conn.execute("select listname,listpath,pagetemplate1,pagetemplate2 from WebOrigineasyart_list where listid="&data(1,i)&";")
				if not rs.eof and not rs.bof then
					datalist=rs.getrows()
					listid=data(1,i)
					tmphtm=WebOrigin.read(datalist(2,0),r_path&"[page]/"&datalist(3,0))
				end if
				rs.close
			set rs=nothing
		end if

		contents=split(WebOrigin.pagebreak(data(3,i)),WebOrigin_break)

		for j=0 to ubound(contents)
		
			WebOrigin.clearvalue
			WebOrigin.value "artid",data(0,i)
			WebOrigin.value "listid",data(1,i)
			WebOrigin.value "title",encode(htmlencode(data(2,i)))
			WebOrigin.value "content",encode(contents(j))
			if instr(data(4,i),"|")>0 then
				artfrom=split(data(4,i),"|")
				WebOrigin.value "from",encode("<a href="""&artfrom(1)&""">"&htmlencode(artfrom(0))&"</a>")
			else
				WebOrigin.value "from",encode(htmlencode(data(4,i)))
			end if
			WebOrigin.value "keywords",encode(htmlencode(data(5,i)))
			WebOrigin.value "description",encode(htmlencode(data(6,i)))
			WebOrigin.value "date",encode(htmlencode(data(7,i)))
			WebOrigin.value "path",encode(WebOrigin.inst&datalist(1,0)&"/"&initially&data(0,i))
			WebOrigin.value "pagelist",encode(pageslist(WebOrigin.inst&datalist(1,0)&"/"&initially&data(0,i),j+1,ubound(contents)+1))
			WebOrigin.value "guide",encode("<a href="""&WebOrigin.inst&datalist(1,0)&""">"&htmlencode(datalist(0,0))&"</a> &gt;&gt; "&htmlencode(data(2,i)))

			outhtm=WebOrigin.create(tmphtm,WebOrigin.invalue)

			if j=0 then
				WebOrigin.createfolder "../../"&datalist(1,0)&"/"&art.initially&data(0,i)
				WebOrigin.savetofile "../../"&datalist(1,0)&"/"&art.initially&data(0,i)&"/"&WebOrigin_ext,outhtm'创建文件
			else
				WebOrigin.createfolder "../../"&datalist(1,0)&"/"&art.initially&data(0,i)&"/"&(j+1)
				WebOrigin.savetofile "../../"&datalist(1,0)&"/"&art.initially&data(0,i)&"/"&(j+1)&"/"&WebOrigin_ext,outhtm'创建文件
			end if
		next
	next

end sub

public sub createlist(l1)
	dim tmphtm,outhtm
	dim tmphtmlist,tmplist
	dim jshtm,jsnumber,zebra
	dim rs,i,j,data,datalist,pid,plist,pidcount,length'pidcount 总页数
	dim sql,suij,suijpagelist
	dim artfrom
	dim jsorder

	sql="listid,listname,listpath,listtemplate1,listtemplate2"'4 datalist
	set rs=conn.execute("select "&sql&" from WebOrigineasyart_list where listid in ("&l1&");")
		if not rs.eof and not rs.bof then
			datalist=rs.getrows()
		else
			redim datalist(0,-1)
		end if
		rs.close
	set rs=nothing

	sql="artid,listid,arttitle,artfrom,artdescription,artdate"'5 data
	for j=0 to ubound(datalist,2)

		'分析模板及标签，并获得值
		tmphtm=WebOrigin.read(datalist(3,j),r_path&"[list]/"&datalist(4,j))'内外部模板结合后的htm代码
		tmphtmlist=WebOrigin.getlist(tmphtm,"easyarticle",1)'type="list"部分的tag，包括{WebOrigin:/}
		jshtm=WebOrigin.getlabel(tmphtmlist,0)
		jsorder=WebOrigin.getlabel(tmphtmlist,"order")
		if lcase(jsorder)="asc" then jsorder="asc" else jsorder="desc"
		jsnumber=fix(WebOrigin.getlabel(tmphtmlist,"number"))
		zebra=WebOrigin.getlabel(tmphtmlist,"zebra")
		suij=chr(3)&salt(20)&chr(2)'随机出来的替换参数
		suijpagelist=chr(3)&salt(16)&chr(2)

		'把tmphtm中的{WebOrigin:...type=list/}标签替换为一个随机的标签；pagelist设置为一个随机标签
		tmphtm=replace(tmphtm,tmphtmlist,suij)

		'替换模板中的标签
		WebOrigin.clearvalue
		WebOrigin.value "title",datalist(1,j)
		WebOrigin.value "path",datalist(2,j)
		WebOrigin.value "pagelist",encode(suijpagelist)
		tmphtm=WebOrigin.create(tmphtm,WebOrigin.invalue)


		set rs=conn.execute("select "&sql&" from WebOrigineasyart where listid="&datalist(0,j)&" order by artorder "&jsorder&",artid "&jsorder&";")
			if not rs.eof and not rs.bof then
				data=rs.getrows()
				
				'初始化变量值
				pid=0
				pidcount=(ubound(data,2)+1)/jsnumber:if pidcount>int(pidcount) then pidcount=int(pidcount)+1'总页数
				length=ubound(data,2)'总记录数-1

				for i=0 to length'开始循环列表
				
					WebOrigin.clearvalue
					WebOrigin.value "artid",data(0,i)
					WebOrigin.value "listid",data(1,i)
					WebOrigin.value "listname",encode(htmlencode(datalist(1,j)))
					WebOrigin.value "listpath",encode(WebOrigin.inst&datalist(2,j))
					WebOrigin.value "path",encode(WebOrigin.inst&datalist(2,j)&"/"&initially&data(0,i))
					WebOrigin.value "title",encode(htmlencode(data(2,i)))
					if instr(data(3,i),"|")>0 then
						artfrom=split(data(3,i),"|")
						WebOrigin.value "from",encode(htmlencode(artfrom(0)))
					else
						WebOrigin.value "from",encode(htmlencode(data(3,i)))
					end if
					WebOrigin.value "description",encode(htmlencode(data(4,i)))
					WebOrigin.value "date",encode(htmlencode(data(5,i)))
					if i+1 mod zebra then
						WebOrigin.value "zebra",1
					else
						WebOrigin.value "zebra",0
					end if

					tmplist=tmplist&WebOrigin.createhtm(jshtm,WebOrigin.invalue)'循环累加值到tmplist变量

					if ((i+1) mod jsnumber)=0 or i=length then '当整除于number参数或到最后一个记录的时候进入生成过程
'						if i=length then pid=pid+1
						plist=pagelist(WebOrigin.inst&datalist(2,j)&"/$",pid+1,pidcount,length+1)

						outhtm=replace(tmphtm,suij,tmplist)
						outhtm=replace(outhtm,suijpagelist,plist)

						WebOrigin.createfolder "../../"&datalist(2,j)
						if pid=0 then'列表第一页
							WebOrigin.savetofile "../../"&datalist(2,j)&"/"&WebOrigin_ext,outhtm
						else
							WebOrigin.createfolder "../../"&datalist(2,j)&"/"&(pid+1)
							WebOrigin.savetofile "../../"&datalist(2,j)&"/"&(pid+1)&"/"&WebOrigin_ext,outhtm
						end if

						'初始化循环变量
						tmplist=""
						
						pid=pid+1
					end if

				next
			else
				outhtm=replace(tmphtm,suij,WebOrigin.lang("error/rsnot"))
				outhtm=replace(outhtm,suijpagelist,"")
				WebOrigin.createfolder "../../"&datalist(2,j)
				WebOrigin.savetofile "../../"&datalist(2,j)&"/"&WebOrigin_ext,outhtm
			end if
			rs.close
		set rs=nothing
	next
end sub
'
function pageslist(l1,l2,l3)'url，当前，总页
	if l3=1 then exit function
	dim i,I1

	for i=1 to l3
		if cstr(i)=cstr(l2) then
			I1=I1&"<strong>"&i&"</strong>"
		else
			if cstr(i)="1" then
				I1=I1&"<a href="""&l1&""">1</a>"
			else
				I1=I1&"<a href="""&l1&"/"&i&""">"&i&"</a>"
			end if
		end if
	next
	pageslist="<span class=""WO_pagelist"">"&I1&"</span>"
end function

public sub list()
	dim listid,listname,rs

	listid=quest("listid",2)
	if len(listid)=0 then listid=form("listid")
	if len(form("listid"))>0 then
		if validate(listid,2)=false then WebOrigin.error WebOrigin.lang("error/invalid")
	end if

	Il "<h2>"
	Il lang("title")

	Il "<span class=""listmenu"">"
	Il "["
	if len(listid)>0 then
		set rs=conn.execute("select listname from WebOrigineasyart_list where listid="&listid&";")
			if not rs.eof and not rs.bof then
				Il "<a href=""index.asp?action=art&listid="&listid&""">"&htmlencode(rs(0))&"</a>"
			else
				WebOrigin.error WebOrigin.lang("error/invalid")
			end if
			rs.close
		set rs=nothing
	end if
	Il "<a href=""index.asp?action=edt&listid="&listid&""">"&lang("common/addart")&"</a>"
	Il "]"
	Il "[<a href=""index.asp"">"&lang("common/list")&"</a>"
	Il "<a href=""index.asp?action=edtlist"">"&lang("common/addlist")&"</a>]"
	Il "</span>"

	Il "</span>"
	Il "</h2>"

end sub

public sub createmaplist()
	if len(WebOrigin.mapname)=0 then exit sub
	dim rs,i,data,outmap

	set rs=conn.execute("select listpath,lastdate from WebOrigineasyart_list;")
		if not rs.eof and not rs.bof then
			data=rs.getrows()
			outmap="<?xml version=""1.0"" encoding=""UTF-8""?>"
			outmap=outmap&"<sitemapindex xmlns="""&WebOrigin_map_xmlns&""">"
			for i=0 to ubound(data,2)
				if len(data(1,i))>0 then
					outmap=outmap&"<sitemap>"
					outmap=outmap&"<loc>"&WebOrigin.siteurl&WebOrigin.inst&data(0,i)&"/"&WebOrigin.mapname&".xml</loc>"
					outmap=outmap&"<lastmod>"&formatdate(data(1,i),"yyyy-MM-dd hh:mm")&"</lastmod>"
					outmap=outmap&"</sitemap>"
				end if
			next
			outmap=outmap&"</sitemapindex>"
			WebOrigin.savetofile "../../"&r_path&".xml",outmap
		end if
		rs.close
	set rs=nothing
end sub

public sub createmappage(l1)
	if len(WebOrigin.mapname)=0 then exit sub

	dim rs,i,data,datalist,outmap
	set rs=conn.execute("select listpath from WebOrigineasyart_list where listid="&l1&" order by listid desc;")
		if not rs.eof and not rs.bof then
			datalist=rs.getrows()
		end if
		rs.close
	set rs=nothing

	set rs=conn.execute("select top 3000 artid,artdate from WebOrigineasyart where listid="&l1&";")
		if not rs.eof and not rs.bof then
			data=rs.getrows()
			outmap="<?xml version=""1.0"" encoding=""UTF-8""?>"
			outmap=outmap&"<urlset xmlns="""&WebOrigin_map_xmlns&""">"
			for i=0 to ubound(data,2)
				outmap=outmap&"<url>"
				outmap=outmap&"<loc>"&WebOrigin.siteurl&WebOrigin.inst&datalist(0,0)&"/"&initially&data(0,i)&"</loc>"
				outmap=outmap&"<lastmod>"&formatdate(data(1,i),"yyyy-MM-dd hh:mm")&"</lastmod>"
				outmap=outmap&"</url>"
			next
			outmap=outmap&"</urlset>"
			WebOrigin.createfolder "../../"&datalist(0,0)
			WebOrigin.savetofile "../../"&datalist(0,0)&"/"&WebOrigin.mapname&".xml",outmap

		end if
		rs.close
	set rs=nothing
end sub

public sub install()
	WebOrigin.head "admin",0
	dim sql
' WebOrigineasyart 
	sql="artid int not null identity primary key,"
	sql=sql&"listid int not null default 0,"'所属
	sql=sql&"artorder int not null default 0,"'排序
	sql=sql&"arttitle nvarchar(100),"'标题
	sql=sql&"artcontent ntext,"'文本
	sql=sql&"artfrom nvarchar(100),"'来自
	sql=sql&"artkeywords nvarchar(100),"'关键字，不给显示但需要记录
	sql=sql&"artdescription nvarchar(255),"'简述，也不给显示
	sql=sql&"artdate datetime"'添加时间
	conn.execute "create table WebOrigineasyart ("&sql&")"
' WebOrigineasyart_list
	sql="listid int not null identity primary key,"
	sql=sql&"listname nvarchar(30),"
	sql=sql&"listorder int not null default 0,"'排序
	sql=sql&"listpath nvarchar(100),"'路径
	sql=sql&"artfrom nvarchar(100),"'自动存储的来源
	sql=sql&"lastdate datetime,"'最后一次添加时间
	sql=sql&"listtemplate1 nvarchar(50),"
	sql=sql&"listtemplate2 nvarchar(50),"
	sql=sql&"pagetemplate1 nvarchar(50),"
	sql=sql&"pagetemplate2 nvarchar(50)"
	conn.execute "create table WebOrigineasyart_list ("&sql&")"
	'插入sitemap
	conn.execute "insert into WebOriginsitemap (maploc,maplastmod) values ('"&r_path&"','"&tnow&"')"
	WebOrigin.createmap
end sub


end class


function WebOrigin_tag_easyarticle(tag,invalue)
'	on error resume next
	dim ttype,tnumber,tkey,tlikey,jshtm,zebra
	dim rs,i,data,sql,insql,tmplist,listid
	dim t_art,datalist,artfrom,artid
	dim jslistid,jslistname,insql_id

	ttype=WebOrigin.getlabel(tag,"type")
	tnumber=WebOrigin.getlabel(tag,"number")
	zebra=WebOrigin.getlabel(tag,"zebra")
	jshtm=WebOrigin.getlabel(tag,0)
	jslistid=WebOrigin.getlabel(tag,"listid")
	if validate(jslistid,6) then
		insql_id=" listid in ("&jslistid&")"
	else
		jslistname=WebOrigin.getlabel(tag,"listname")
		if len(jslistname)>0 then
			set rs=conn.execute("select listid from WebOrigineasyart_list where "&WebOrigin.likey("listname",jslistname)&";")
				if not rs.eof and not rs.bof then
					data=rs.getrows()
					for i=0 to ubound(data,2)
						if len(insql_id)>0 then
							insql_id=data(0,i)
						else
							insql_id=insql_id&","&data(0,i)
						end if
						if len(insql_id)>0 then
							insql_id=" listid in ("&insql_id&")"
						end if
					next
				end if
				rs.close
			set rs=nothing
		end if
	end if
	sql=" artid,listid,arttitle,artfrom,artdescription,artdate,artcontent"'不要删除前面的空格

	set t_art=new easyarticle

	select case lcase(ttype)
	case"related"'相关文章
		tkey=WebOrigin.getvalue(invalue,"keywords")
		artid=WebOrigin.getvalue(invalue,"artid")
		tlikey=WebOrigin.likey("artkeywords",tkey)
		if len(insql_id)>0 then isnql_id=" and "&insql_id
		if len(tlikey)>0 then
			if validate(artid,2) then
				insql="select top "&tnumber&sql&" from WebOrigineasyart where artid <>"&artid&" and ("&tlikey&") "&insql_id&" order by artorder desc,artid desc;"
			else
				insql="select top "&tnumber&sql&" from WebOrigineasyart where "&tlikey&" "&insql_id&" order by artorder desc,artid desc;"
			end if
		else
			exit function
		end if
	case else '最新文章
		if len(insql_id)>0 then insql_id=" where "&insql_id
		insql="select top "&tnumber&sql&" from WebOrigineasyart "&insql_id&" order by artorder desc,artid desc;"
	end select
	
	set rs=conn.execute(insql)
		if not rs.eof and not rs.bof then
			data=rs.getrows()
		else
			exit function
		end if
		rs.close
	set rs=nothing

	for i=0 to ubound(data,2)

		if cstr(listid)<>cstr(data(1,i)) then
			listid=data(1,i)
			set rs=conn.execute("select listname,listpath from WebOrigineasyart_list where listid="&listid&";")
				if not rs.eof and not rs.bof then
					datalist=rs.getrows()
				else
					exit function
				end if
				rs.close
			set rs=nothing
		end if
		
		WebOrigin.clearvalue

		WebOrigin.value "artid",data(0,i)
		WebOrigin.value "listid",data(1,i)
		WebOrigin.value "listname",encode(htmlencode(datalist(0,0)))
		WebOrigin.value "listpath",encode(WebOrigin.inst&datalist(1,0))
		WebOrigin.value "path",encode(WebOrigin.inst&datalist(1,0)&"/"&t_art.initially&data(0,i))
		WebOrigin.value "title",encode(htmlencode(data(2,i)))
		if instr(data(3,i),"|")>0 then
			artfrom=split(data(3,i),"|")
			WebOrigin.value "from",encode(htmlencode(artfrom(0)))
		else
			WebOrigin.value "from",encode(htmlencode(data(3,i)))
		end if
		WebOrigin.value "description",encode(htmlencode(data(4,i)))
		WebOrigin.value "date",encode(htmlencode(data(5,i)))
		if instr(WebOrigin.pagebreak(data(6,i)),WebOrigin_break)>0 then
			WebOrigin.value "content",encode(split(WebOrigin.pagebreak(data(6,i)),WebOrigin_break)(0))
		else
			WebOrigin.value "content",encode(data(6,i))
		end if
		if i+1 mod zebra then
			WebOrigin.value "zebra",1
		else
			WebOrigin.value "zebra",0
		end if

		tmplist=tmplist&WebOrigin.createhtm(jshtm,WebOrigin.invalue)'循环累加值到tmplist变量
	next

	set t_art=nothing

	WebOrigin_tag_easyarticle=tmplist
end function

%>