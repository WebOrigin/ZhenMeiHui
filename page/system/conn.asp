<%
dim objconn,conn,WebOrigin,action,tnow,upload


'  --- 数据库连接 开始 -------------------------------------------------


Rem  数据库类型,默认是ACCESS数据库

const WebOrigin_dbtype = 0  Rem  0代表ACCESS数据库类型,1代表MSSQL数据库


Rem  以下参数只设置一种数据库即可


	Rem  ACCESS数据库路径设置

	const WebOrigin_db = "../../db/WebOrigin#CMS.mdb"



	Rem  MSSQL 链接设置

'	SQL服务器地址
	const WebOrigin_sql_server = "127.0.0.1"

'	数据库名称
	const WebOrigin_sql_db     = "WebOriginCMS"

'	数据库登录帐号
	const WebOrigin_sql_user   = "sa"

'	数据库密码
	const WebOrigin_sql_pwd    = ""


'  --- 数据库连接 结束-------------------------------------------------



if WebOrigin_dbtype=0 then
	objconn="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&server.mapPath(WebOrigin_db)
'	objconn="Driver={Microsoft Access Driver(*.mdb)};DBQ="&server.mapPath(WebOrigin_db)
else
	objconn="Provider=SQLOLEDB.1;Data Source=" & WebOrigin_sql_server & ";Initial Catalog=" & WebOrigin_sql_db & ";User ID=" & WebOrigin_sql_user & ";Password=" & WebOrigin_sql_pwd & ";"
end if

action=lcase(request("action"))
tnow=formatdate(now(),0)

%>
