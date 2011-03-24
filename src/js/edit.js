function checkblank(id, errid, errmsg) {
	G(id).value = trimrn(id);
	var len = bytes(G(id).value);
	if (len == 0) {
		showErr(errid, errmsg);
		return false;
	} else {
		return true;
	}
}
function G() {
    var elements = new Array();
    for (var i = 0; i < arguments.length; i++) {
        var element = arguments[i];
        if (typeof element == 'string') element = document.getElementById(element);
        if (arguments.length == 1) return element;
        elements.push(element)
    };
    return elements
};

function checklength(id, smax, errid, errmsg) {
	ele = G(id);
	len = bytes(ele.value);
	if (len > smax) {
		showErr(errid, errmsg);
		return false;
	} else {
		return true;
	}
}
function showErr(id, str) {
	G(id).style.display = "";
	G(id + "_con").innerHTML = str;
}
function hidErr(id) {
	G(id).style.display = "none";
	G(id + "_con").innerHTML = "";
}
function bytes(str) {
	if (typeof (str) != 'string') {
		str = str.value
	}
	var len = 0;
	for ( var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {
			len++
		}
		len++
	}
	return len
};
function trimlr(id) {// 去掉一行首尾的空格
	var str = document.getElementById(id).value;
	for (i = 0; str.charAt(i) == " " || str.charAt(i) == "　"; i++) {
	}
	str = str.substring(i, str.length);
	for (i = str.length - 1; str.charAt(i) == " " || str.charAt(i) == "　"; i--) {
	}
	str = str.substring(0, i + 1);
	return str
};
function trimrn(id) {
	var el = document.getElementById(id);
	var s = el.value;
	var len = s.length;
	i = 0;
	flag = 0;
	flagn = 0;
	var result = "";
	while (i < len) {
		ch = s.charAt(i);
		if (ch == "\n" || ch == "\r") {
			if ((flagn == 1) && (ch == "\n")) {
				flag++;
				flagn = 0
			} else if (ch == "\r") {
				flagn = 1
			}
			i++;
			if (flag == 1) {
				result = result + ch
			}
		} else {
			flag = 0;
			flagn = 0;
			result = result + ch;
			i++
		}
	}
	return result
};

function setvalue(id) {
	document.getElementById(id).value = trimrn(id);
};
function cutSpace(id) {
	el = document.getElementById(id);
	s = el.value;
	var len = s.length;
	var i;
	var ch;
	var result = "";
	i = 0;
	while (i < len) {
		ch = s.charAt(i++);
		result += ch;
		if (ch != ' ' && ch != '　') {
			continue
		}
		while (i < len && (ch = s.charAt(i)) == ' ') {
			i++
		}
	}
	return result
};
function getselect(id, selectname) {
	var ele = document.getElementById(id);
	ele.selectedIndex = selectname
};

function HTMLEnCode(str) {

	var s = "";
	if (str.length == 0) {
		return "";
	}
	s = str.replace(/&/g, "&amp;");
	s = s.replace(/</g, "&lt;");
	s = s.replace(/>/g, "&gt;");
	s = s.replace(/ /g, " ");
	s = s.replace(/\'/g, "&#39;");
	s = s.replace(/\"/g, "&quot;");
	s = s.replace(/\n/g, "<br>");

	return s;
};
function HTMLDeCode(str) {

	var s = "";
	if (str.length == 0)
		return "";
	s = str.replace(/&amp;/g, "&");
	s = s.replace(/&lt;/g, "<");
	s = s.replace(/&gt;/g, ">");
	s = s.replace(/&nbsp;/g, " ");
	s = s.replace(/&#39;/g, "\'");
	s = s.replace(/&quot;/g, "\"");
	s = s.replace(/<br>/g, "\n");
	return s;

};
 
function encode_utf8(rawtext) {
    rawtext = rawtext.replace(/\r\n/g,"\n");
    var utftext = "";
    for(var n=0; n<rawtext.length; n++)
        {
        //
        var c=rawtext.charCodeAt(n);
        // 0-127 => 1byte
        if (c<128)
            utftext += String.fromCharCode(c);
        // 127 - 2047 => 2byte
        else if((c>127) && (c<2048)) {
            utftext += String.fromCharCode((c>>6)|192);
            utftext += String.fromCharCode((c&63)|128);}
        // 2048 - 66536 => 3byte
        else {
            utftext += String.fromCharCode((c>>12)|224);
            utftext += String.fromCharCode(((c>>6)&63)|128);
            utftext += String.fromCharCode((c&63)|128);}
        }
    return utftext;
}

function decode_utf8(utftext) {
    var plaintext = ""; var i=0; var c=c1=c2=0;
    while(i<utftext.length)
        {
        c = utftext.charCodeAt(i);
        if (c<128) {
            plaintext += String.fromCharCode(c);
            i++;}
        else if((c>191) && (c<224)) {
            c2 = utftext.charCodeAt(i+1);
            plaintext += String.fromCharCode(((c&31)<<6) | (c2&63));
            i+=2;}
        else {
            c2 = utftext.charCodeAt(i+1); c3 = utftext.charCodeAt(i+2);
            plaintext += String.fromCharCode(((c&15)<<12) | ((c2&63)<<6) | (c3&63));
            i+=3;}
        }
    return plaintext;
}
 