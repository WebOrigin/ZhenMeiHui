/*--------------------------------------------------|
| ltree 3.33 | www.weborigin.com                    |
|---------------------------------------------------|
| Leask 17.04.2003                                  |
|--------------------------------------------------*/



// Node object

function Node(id, pid, name, url, title, target, icon, iconOpen, open) {

	this.id = id;

	this.pid = pid;

	this.name = name;

	this.url = url;

	this.title = title;

	this.target = target;

	this.icon = icon;

	this.iconOpen = iconOpen;

	this._io = open || false;

	this._is = false;

	this._ls = false;

	this._hc = false;

	this._ai = 0;

	this._p;

};



// Tree object

function dTree(objName) {

	this.config = {

		target					: null,

		folderLinks			: false,

		useSelection		: true,

		useCookies			: false,

		useLines				: false,

		useIcons				: true,

		useStatusText		: false,

		closeSameLevel	: true,

		inOrder					: false

	}

	this.icon = {

		root				: '/ltree_api/img/base.gif',

		folder			: '/ltree_api/img/folder.gif',

		folderOpen	: '/ltree_api/img/folderopen.gif',

		//node				: '/ltree_api/img/page.gif',
		node				: '/ltree_api/img/arrow_064.gif',

		empty				: '/ltree_api/img/empty.gif',

		line				: '/ltree_api/img/line.gif',

		join				: '/ltree_api/img/join.gif',

		joinBottom	: '/ltree_api/img/joinbottom.gif',

		plus				: '/ltree_api/img/plus.gif',

		plusBottom	: '/ltree_api/img/plusbottom.gif',

		minus				: '/ltree_api/img/minus.gif',

		minusBottom	: '/ltree_api/img/minusbottom.gif',

		nlPlus			: '/ltree_api/img/nolines_plus_2.gif',
		nlMinus			: '/ltree_api/img/nolines_minus_2.gif'
		
		//nlPlus			: '/ltree_api/img/nolines_plus.gif',
		//nlMinus			: '/ltree_api/img/nolines_minus.gif'

	};

	this.obj = objName;

	this.aNodes = [];

	this.aIndent = [];

	this.root = new Node(-1);

	this.selectedNode = null;

	this.selectedFound = false;

	this.completed = false;

};



// Adds a new node to the node array

dTree.prototype.add = function(id, pid, name, url, title, target, icon, iconOpen, open) {

	this.aNodes[this.aNodes.length] = new Node(id, pid, name, url, title, target, icon, iconOpen, open);

};



// Open/close all nodes

dTree.prototype.openAll = function() {

	this.oAll(true);

};

dTree.prototype.closeAll = function() {

	this.oAll(false);

};



// Outputs the tree to the page

dTree.prototype.toString = function() {

	var str = '<div class="dtree">\n';

	if (document.getElementById) {

		if (this.config.useCookies) this.selectedNode = this.getSelected();

		str += this.addNode(this.root);

	} else str += 'Browser not supported.';

	str += '</div>';

	if (!this.selectedFound) this.selectedNode = null;

	this.completed = true;

	return str;

};



// Creates the tree structure

dTree.prototype.addNode = function(pNode) {

	var str = '';

	var n=0;

	if (this.config.inOrder) n = pNode._ai;

	for (n; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == pNode.id) {

			var cn = this.aNodes[n];

			cn._p = pNode;

			cn._ai = n;

			this.setCS(cn);

			if (!cn.target && this.config.target) cn.target = this.config.target;

			if (cn._hc && !cn._io && this.config.useCookies) cn._io = this.isOpen(cn.id);

			if (!this.config.folderLinks && cn._hc) cn.url = null;

			if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {

					cn._is = true;

					this.selectedNode = n;

					this.selectedFound = true;

			}

			str += this.node(cn, n);

			if (cn._ls) break;

		}

	}

	return str;

};



// Creates the node icon, url and text

dTree.prototype.node = function(node, nodeId) {

	var str = '<div class="dTreeNode">' + this.indent(node, nodeId);

	if (this.config.useIcons) {

		if (!node.icon) node.icon = (this.root.id == node.pid) ? this.icon.root : ((node._hc) ? this.icon.folder : this.icon.node);

		if (!node.iconOpen) node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;

		if (this.root.id == node.pid) {

			node.icon = this.icon.root;

			node.iconOpen = this.icon.root;

		}

		str += '<img id="i' + this.obj + nodeId + '" src="' + ((node._io) ? node.iconOpen : node.icon) + '" alt="" />';

	}

	if (node.url) {

		str += '<a id="s' + this.obj + nodeId + '" class="' + ((this.config.useSelection) ? ((node._is ? 'nodeSel' : 'node')) : 'node') + '" href="' + node.url + '"';

		if (node.title) str += ' title="' + node.title + '"';

		if (node.target) str += ' target="' + node.target + '"';

		if (this.config.useStatusText) str += ' onmouseover="window.status=\'' + node.name + '\';return true;" onmouseout="window.status=\'\';return true;" ';

		if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc))

			str += ' onclick="javascript: ' + this.obj + '.s(' + nodeId + ');"';

		str += '>';

	}

	else if ((!this.config.folderLinks || !node.url) && node._hc && node.pid != this.root.id)

		str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');" class="node">';

	str += node.name;

	if (node.url || ((!this.config.folderLinks || !node.url) && node._hc)) str += '</a>';

	str += '</div>';

	if (node._hc) {

		str += '<div id="d' + this.obj + nodeId + '" class="clip" style="display:' + ((this.root.id == node.pid || node._io) ? 'block' : 'none') + ';">';

		str += this.addNode(node);

		str += '</div>';

	}

	this.aIndent.pop();

	return str;

};



// Adds the empty and line icons

dTree.prototype.indent = function(node, nodeId) {

	var str = '';

	if (this.root.id != node.pid) {

		for (var n=0; n<this.aIndent.length; n++)

			//leask str += '<img src="' + ( (this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty ) + '" alt="" />';

			str+='<img width="10" src="' + ( (this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty ) + '" alt="" />';
			
		(node._ls) ? this.aIndent.push(0) : this.aIndent.push(1);

		if (node._hc) {

			str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');"><img id="j' + this.obj + nodeId + '" src="';

			if (!this.config.useLines) str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;

			else str += ( (node._io) ? ((node._ls && this.config.useLines) ? this.icon.minusBottom : this.icon.minus) : ((node._ls && this.config.useLines) ? this.icon.plusBottom : this.icon.plus ) );

			str += '" alt="" /></a>';

		} //Leask//else str += '<img src="' + ( (this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join ) : this.icon.empty) + '" alt="" />';

	}

	return str;

};



// Checks if a node has any children and if it is the last sibling

dTree.prototype.setCS = function(node) {

	var lastId;

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.id) node._hc = true;

		if (this.aNodes[n].pid == node.pid) lastId = this.aNodes[n].id;

	}

	if (lastId==node.id) node._ls = true;

};



// Returns the selected node

dTree.prototype.getSelected = function() {

	var sn = this.getCookie('cs' + this.obj);

	return (sn) ? sn : null;

};



// Highlights the selected node

dTree.prototype.s = function(id) {

	if (!this.config.useSelection) return;

	var cn = this.aNodes[id];

	if (cn._hc && !this.config.folderLinks) return;

	if (this.selectedNode != id) {

		if (this.selectedNode || this.selectedNode==0) {

			eOld = document.getElementById("s" + this.obj + this.selectedNode);

			eOld.className = "node";

		}

		eNew = document.getElementById("s" + this.obj + id);

		eNew.className = "nodeSel";

		this.selectedNode = id;

		if (this.config.useCookies) this.setCookie('cs' + this.obj, cn.id);

	}

};



// Toggle Open or close

dTree.prototype.o = function(id) {
	
	//leask
	url_exec(id);
	//leask

	var cn = this.aNodes[id];

	this.nodeStatus(!cn._io, id, cn._ls);

	cn._io = !cn._io;

	if (this.config.closeSameLevel) this.closeLevel(cn);

	if (this.config.useCookies) this.updateCookie();

};



// Open or close all nodes

dTree.prototype.oAll = function(status) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n]._hc && this.aNodes[n].pid != this.root.id) {

			this.nodeStatus(status, n, this.aNodes[n]._ls)

			this.aNodes[n]._io = status;

		}

	}

	if (this.config.useCookies) this.updateCookie();

};



// Opens the tree to a specific node

dTree.prototype.openTo = function(nId, bSelect, bFirst) {

	if (!bFirst) {

		for (var n=0; n<this.aNodes.length; n++) {

			if (this.aNodes[n].id == nId) {

				nId=n;

				break;

			}

		}

	}

	var cn=this.aNodes[nId];

	if (cn.pid==this.root.id || !cn._p) return;

	cn._io = true;

	cn._is = bSelect;

	if (this.completed && cn._hc) this.nodeStatus(true, cn._ai, cn._ls);

	if (this.completed && bSelect) this.s(cn._ai);

	else if (bSelect) this._sn=cn._ai;

	this.openTo(cn._p._ai, false, true);

};



// Closes all nodes on the same level as certain node

dTree.prototype.closeLevel = function(node) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {

			this.nodeStatus(false, n, this.aNodes[n]._ls);

			this.aNodes[n]._io = false;

			this.closeAllChildren(this.aNodes[n]);

		}

	}

}



// Closes all children of a node

dTree.prototype.closeAllChildren = function(node) {

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {

			if (this.aNodes[n]._io) this.nodeStatus(false, n, this.aNodes[n]._ls);

			this.aNodes[n]._io = false;

			this.closeAllChildren(this.aNodes[n]);		

		}

	}

}



// Change the status of a node(open or closed)

dTree.prototype.nodeStatus = function(status, id, bottom) {

	eDiv	= document.getElementById('d' + this.obj + id);

	eJoin	= document.getElementById('j' + this.obj + id);

	if (this.config.useIcons) {

		eIcon	= document.getElementById('i' + this.obj + id);

		eIcon.src = (status) ? this.aNodes[id].iconOpen : this.aNodes[id].icon;

	}

	eJoin.src = (this.config.useLines)?

	((status)?((bottom)?this.icon.minusBottom:this.icon.minus):((bottom)?this.icon.plusBottom:this.icon.plus)):

	((status)?this.icon.nlMinus:this.icon.nlPlus);

	//leask
	switch (status)
	{
		case true:
			changeOpac(0,'d' + this.obj + id);
		break;
		case false:
			opacity('d' + this.obj + id, 100, 0, 500);
		break;
	}
	//leask
	
	eDiv.style.display = (status) ? 'block': 'none';
	
	//leask
	if (status==true)
	{
		opacity('d' + this.obj + id, 0, 100, 500);	
	}
	//leask
};



// [Cookie] Clears a cookie

dTree.prototype.clearCookie = function() {

	var now = new Date();

	var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);

	this.setCookie('co'+this.obj, 'cookieValue', yesterday);

	this.setCookie('cs'+this.obj, 'cookieValue', yesterday);

};



// [Cookie] Sets value in a cookie

dTree.prototype.setCookie = function(cookieName, cookieValue, expires, path, domain, secure) {

	document.cookie =

		escape(cookieName) + '=' + escape(cookieValue)

		+ (expires ? '; expires=' + expires.toGMTString() : '')

		+ (path ? '; path=' + path : '')

		+ (domain ? '; domain=' + domain : '')

		+ (secure ? '; secure' : '');

};



// [Cookie] Gets a value from a cookie

dTree.prototype.getCookie = function(cookieName) {

	var cookieValue = '';

	var posName = document.cookie.indexOf(escape(cookieName) + '=');

	if (posName != -1) {

		var posValue = posName + (escape(cookieName) + '=').length;

		var endPos = document.cookie.indexOf(';', posValue);

		if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));

		else cookieValue = unescape(document.cookie.substring(posValue));

	}

	return (cookieValue);

};



// [Cookie] Returns ids of open nodes as a string

dTree.prototype.updateCookie = function() {

	var str = '';

	for (var n=0; n<this.aNodes.length; n++) {

		if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {

			if (str) str += '.';

			str += this.aNodes[n].id;

		}

	}

	this.setCookie('co' + this.obj, str);

};



// [Cookie] Checks if a node id is in a cookie

dTree.prototype.isOpen = function(id) {

	var aOpen = this.getCookie('co' + this.obj).split('.');

	for (var n=0; n<aOpen.length; n++)

		if (aOpen[n] == id) return true;

	return false;

};



// If Push and pop is not implemented by the browser

if (!Array.prototype.push) {

	Array.prototype.push = function array_push() {

		for(var i=0;i<arguments.length;i++)

			this[this.length]=arguments[i];

		return this.length;

	}

};

if (!Array.prototype.pop) {

	Array.prototype.pop = function array_pop() {

		lastElement = this[this.length-1];

		this.length = Math.max(this.length-1,0);

		return lastElement;

	}

};





//change the opacity for different browsers 
//Leask
function changeOpac(opacity, id) {
    var object = document.getElementById(id).style; 
	//var object = id.style;
    object.opacity = (opacity / 100); 
    object.MozOpacity = (opacity / 100); 
    object.KhtmlOpacity = (opacity / 100); 
    object.filter = 'alpha(opacity=' + opacity + ')'; 
}

//Leask
function shiftOpacity(id, millisec) { 
    //if an element is invisible, make it visible, else make it ivisible 
    if(document.getElementById(id).style.opacity == 0) { 
        opacity(id, 0, 100, millisec); 
    } else { 
        opacity(id, 100, 0, millisec); 
    } 
}

//Leask
function opacity(id, opacStart, opacEnd, millisec) { 
    //speed for each frame 
    var speed = Math.round(millisec / 100); 
    var timer = 0; 

    //determine the direction for the blending, if start and end are the same nothing happens 
    if(opacStart > opacEnd) { 
        for(i = opacStart; i >= opacEnd; i--) { 
            setTimeout("changeOpac(" + i + ",'" + id + "')",(timer * speed)); 
            timer++;
        } 
    } else if(opacStart < opacEnd) { 
        for(i = opacStart; i <= opacEnd; i++) 
            { 
            setTimeout("changeOpac(" + i + ",'" + id + "')",(timer * speed)); 
            timer++; 
        } 
    } 
} 


//Leask
function xMove(id, pStart, pEnd, millisec) { 
    //speed for each frame 
    var speed = Math.round(millisec / 100); 
    var timer = 0; 
    //determine the direction for the blending, if start and end are the same nothing happens 
    if(pStart > pEnd) { 
        for(i = pStart; i >= pEnd; i--) { 
            setTimeout("xMove_Ext(" + i + ",'" + id + "')",(timer * speed)); 
            timer++;
        } 
    } else if(pStart < pEnd) { 
        for(i = pStart; i <= pEnd; i++) 
            { 
            setTimeout("xMove_Ext(" + i + ",'" + id + "')",(timer * speed)); 
            timer++; 
        } 
    } 
}

function yMove(id, pStart, pEnd, millisec) { 
    //speed for each frame 
    var speed = Math.round(millisec / 100); 
    var timer = 0; 
    //determine the direction for the blending, if start and end are the same nothing happens 
    if(pStart > pEnd) { 
        for(i = pStart; i >= pEnd; i--) { 
            setTimeout("yMove_Ext(" + i + ",'" + id + "')",(timer * speed)); 
            timer++;
        } 
    } else if(pStart < pEnd) { 
        for(i = pStart; i <= pEnd; i++) 
            { 
            setTimeout("yMove_Ext(" + i + ",'" + id + "')",(timer * speed)); 
            timer++; 
        } 
    } 
}

function xMove_Ext(mvx,mid)
{
	document.getElementById(mid).style.paddingLeft=mvx+'px';
	document.getElementById(mid).style.paddingTop=0+'px';
}

function yMove_Ext(mvx,mid)
{
	document.getElementById(mid).style.paddingTop=mvx+'px';
}


//Leask
function xSlide(id, pStart, pEnd, millisec,sxp) { 
    //speed for each frame 
    var speed = Math.round(millisec / 100); 
    var timer = 0; 
    //determine the direction for the blending, if start and end are the same nothing happens 
    if(pStart > pEnd) { 
        for(i = pStart; i >= pEnd; i-=sxp) { 
            setTimeout("xSlide_Ext(" + i + ",'" + id + "')",(timer * speed)); 
            timer++;
        } 
    } else if(pStart < pEnd) { 
        for(i = pStart; i <= pEnd; i+=sxp) 
            { 
            setTimeout("xSlide_Ext(" + i + ",'" + id + "')",(timer * speed)); 
            timer++; 
        } 
    } 
}


function xSlide_Ext(mvx,mid)
{
	document.getElementById(mid).style.paddingLeft=mvx+'px';
}



function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function menu_five(xid)
{
	for(var lsi=0;lsi<5;lsi++)
	{
		if (lsi==xid)
		{
			document.getElementById('file_button_'+lsi).style.backgroundPosition='bottom';
			document.getElementById('five_info_'+lsi).style.display='block';
			show_menu(-3);
		}else{
			document.getElementById('file_button_'+lsi).style.backgroundPosition='top';
			document.getElementById('five_info_'+lsi).style.display='none';
		}
	}
}


function show_menu(xid)
{
	if (xid==-1)
	{
		menu_five(-2);
		for (var li=1;li<6;li++)
		{
			changeOpac(90,'menu_' + li);
			MM_showHideLayers('menu_' + li,'','hide');
			document.getElementById('menu_'+li).style.left=li*113 +'px';
			document.getElementById('top_info_'+li).style.left=li*113-14 +'px';
		}
		for (var li=0;li<7;li++)
		{
			MM_showHideLayers('top_info_' + li,'','hide');
		}
		document.getElementById('fload').style.left=document.documentElement.clientWidth-170+'px';
		document.getElementById('fload').style.backgroundColor='transparent';
	}
	if (xid==-2){menu_five(-2);}
	for (var li=0;li<7;li++)
	{
		if (li==xid)
		{
			document.getElementById('new_menu_'+li).style.backgroundPosition='bottom';
			MM_showHideLayers('top_info_' + li,'','show');
			if(li!=0 || li!=6)
			{
				MM_showHideLayers('menu_' + li,'','show');
			}
			menu_five(-2);
		}else{
			document.getElementById('new_menu_'+li).style.backgroundPosition='top';						
			MM_showHideLayers('top_info_' + li,'','hide');
			if(li!=0 || li!=6)
			{
				MM_showHideLayers('menu_' + li,'','hide');
			}
		}
	}
}

function show_fun(sti)
{
	if (sID!=sti)
	{
		sHide(sID);
		sShow(sti);
	}
}

function sHide(xid)
{
	opacity('dslbox_in_' + xid, 100, 0, 500);
	yMove('dslbox_in_' + xid, 0, sIntY, 500);
	document.getElementById('dslbox_in_' + xid).style.zIndex=100;
}

function sShow(xid)
{
	document.getElementById('dslbox_in_' + xid).style.paddingTop='0px';
	document.getElementById('dslbox_in_' + xid).style.zIndex=110;
	opacity('dslbox_in_' + xid, 0, 100, 500);
	xMove('dslbox_in_' + xid, sIntX, 60, 500);
	sID=xid;
}


// Example:
// alert( readCookie("myCookie") );
function readCookie(name)
{
  var cookieValue = "";
  var search = name + "=";
  if(document.cookie.length > 0)
  { 
    offset = document.cookie.indexOf(search);
    if (offset != -1)
    { 
      offset += search.length;
      end = document.cookie.indexOf(";", offset);
      if (end == -1) end = document.cookie.length;
      cookieValue = unescape(document.cookie.substring(offset, end))
    }
  }
  return cookieValue;
}


// Example:
// writeCookie("myCookie", "my name", 24);
// Stores the string "my name" in the cookie "myCookie" which expires after 24 hours.
function writeCookie(name, value, hours)
{
  var expire = "";
  if(hours != null)
  {
    expire = new Date((new Date()).getTime() + hours * 3600000);
    expire = "; path=/; expires=" + expire.toGMTString();
  }
  document.cookie = name + "=" + escape(value) + expire;
}


function adMove() {
	var isIE = !+'\v1';
	switch(mpt){
		case 1:
			adTop++;
			if (isIE==true)
			{		
				document.getElementById('fload').style.paddingTop=adTop+'px'; 
			}else{
				document.getElementById('fload').style.Top=adTop+'px';
			}
			if (adTop>=document.documentElement.clientHeight-100){
				mpt=2;
			}
		break;
		case 2:
			adTop--;
			if (isIE==true)
			{		
				document.getElementById('fload').style.paddingTop=adTop+'px'; 
			}else{
				document.getElementById('fload').style.Top=adTop+'px';
			}
			if(adTop<=10){
				mpt=1;
			}
		break;
	}
}

function Open_Ad()
{
	window.open ('/wochat/popup.asp', 'newwindow', 'height=477, width=656, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no,status=no')
}



