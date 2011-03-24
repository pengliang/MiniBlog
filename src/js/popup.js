if (!Array.prototype.push) {
    Array.prototype.push = function () {
        var startLength = this.length;
        for (var j = 0; j < arguments.length; j++) {
            this[startLength + j] = arguments[j];
        }
        return this.length;
    }
};

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

Function.prototype.bind = function (object) {
    var __method = this;
    return function () {
        __method.apply(object, arguments)
    }
};

Function.prototype.bindAsEventListener = function (object) {
    var __method = this;
    return function (event) {
        __method.call(object, event || window.event)
    }
};
Object.extend = function (destination, source) {
    for (property in source) {
        destination[property] = source[property]
    };
    return destination
};

if (!window.Event) {
    var Event = new Object();
};

Object.extend(Event,

{
    observers: false,
    element: function (event) {
        return event.target || event.srcElement;
    },

    isLeftClick: function (event) {
        return (((event.which) && (event.which == 1)) || ((event.button) && (event.button == 1)));
    },

    pointerX: function (event) {
        return event.pageX || (event.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
    },

    pointerY: function (event) {
        return event.pageY || (event.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
    },

    stop: function (event) {
        if (event.preventDefault) {
            event.preventDefault();
            event.stopPropagation();
        } else {
            event.returnValue = false;
            event.cancelBubble = true;
        };
    },

    findElement: function (event, tagName) {
        var element = Event.element(event);
        while (element.parentNode && (!element.tagName || (element.tagName.toUpperCase() != tagName.toUpperCase()))) element = element.parentNode;
        return element;
    },

    _observeAndCache: function (element, name, observer, useCapture) {
        if (!this.observers) this.observers = [];
        if (element.addEventListener) {
            this.observers.push([element, name, observer, useCapture]);
            element.addEventListener(name, observer, useCapture);
        } else if (element.attachEvent) {
            this.observers.push([element, name, observer, useCapture]);
            element.attachEvent('on' + name, observer);
        };
    },

    unloadCache: function () {
        if (!Event.observers) return;
        for (var j = 0; j < Event.observers.length; j++) {
            Event.stopObserving.apply(this, Event.observers[j]);
            Event.observers[j][0] = null;
        };
        Event.observers = false;
    },

    observe: function (element, name, observer, useCapture) {
        var element = G(element);
        useCapture = useCapture || false;
        if (name == 'keypress' && (navigator.appVersion.match(/Konqueror|Safari|KHTML/) || element.attachEvent)) name = 'keydown';
        this._observeAndCache(element, name, observer, useCapture);
    },

    stopObserving: function (element, name, observer, useCapture) {
        var element = G(element);
        useCapture = useCapture || false;
        if (name == 'keypress' && (navigator.appVersion.match(/Konqueror|Safari|KHTML/) || element.detachEvent)) name = 'keydown';
        if (element.removeEventListener) {
            element.removeEventListener(name, observer, useCapture);
        } else if (element.detachEvent) {
            element.detachEvent('on' + name, observer);
        };
    }
});

Event.observe(window, 'unload', Event.unloadCache, false);
var Class = function () {
    var _class = function () {
        this.initialize.apply(this, arguments);
    };
    for (j = 0; j < arguments.length; j++) {
        superClass = arguments[j];
        for (member in superClass.prototype) {
            _class.prototype[member] = superClass.prototype[member];
        };
    };
    _class.child = function () {
        return new Class(this);
    };
    _class.extend = function (f) {
        for (property in f) {
            _class.prototype[property] = f[property];
        };
    };
    return _class;
};

// 改变百度空间的最顶端和最低端的div的id值
// 如果flag为begin，则为弹出状态的id值
// 如果flag为end，则为非弹出状态的id值，即原本的id值
function space(flag) {
    if (flag == "begin") {
        var ele = document.getElementById("ft");
        if (typeof(ele) != "undefined" && ele != null) ele.id = "ft_popup";
        ele = document.getElementById("usrbar");
        if (typeof(ele) != "undefined" && ele != null) ele.id = "usrbar_popup";
    } else if (flag == "end") {
        var ele = document.getElementById("ft_popup");
        if (typeof(ele) != "undefined" && ele != null) ele.id = "ft";
        ele = document.getElementById("usrbar_popup");
        if (typeof(ele) != "undefined" && ele != null) ele.id = "usrbar";
    };
};

// *****Popup类弹出窗口******
var Popup = new Class();

Popup.prototype = {

    iframeIdName: 'ifr_popup',

    getValue: function (str) {
        var nResult = 0;
        switch (str) {
        case "scrollTop":
            if (typeof(window.pageYOffset) != 'undefined') {
                nResult = window.pageYOffset;
            } else if (typeof(document.compatMode) != 'undefined' && document.compatMode != 'BackCompat') {
                nResult = document.documentElement.scrollTop;
            } else if (typeof(document.body) != 'undefined') {
                nResult = document.body.scrollTop;
            }
            break;

        case "clientWidth":
            if (typeof(document.compatMode) != 'undefined' && document.compatMode != 'BackCompat') {
                nResult = document.documentElement.clientWidth;
            } else if (typeof(document.body) != 'undefined') {
                nResult = document.body.clientWidth;
            }
            break;

        case "clientHeight":
            if (typeof(document.compatMode) != 'undefined' && document.compatMode != 'BackCompat') {
                nResult = document.documentElement.clientHeight;
            } else if (typeof(document.body) != 'undefined') {
                nResult = document.body.clientHeight;
            }
            break;

        case "clientHeight":
            if (typeof(document.compatMode) != 'undefined' && document.compatMode != 'BackCompat') {
                nResult = document.documentElement.clientHeight;
            } else if (typeof(document.body) != 'undefined') {
                nResult = document.body.clientHeight;
            }
            break;

        case "scrollWidth":
            if (typeof(document.compatMode) != 'undefined' && document.compatMode != 'BackCompat') {
                nResult = document.documentElement.scrollWidth;
             } else if (typeof(document.body) != 'undefined') {
                nResult = document.body.scrollWidth;
            }
            break;

        case "scrollHeight":
            if (typeof(document.compatMode) != 'undefined' && document.compatMode != 'BackCompat') {
                nResult = document.documentElement.scrollHeight;
            } else if (typeof(document.body) != 'undefined') {
                nResult = document.body.scrollHeight;
            }
            break;

        default:
            break;
        }

        return nResult;
    },

    initialize: function (config) {
        // ---------------弹出对话框的配置信息------------------
        // contentType:设置内容区域为什么类型：1为另外一个html文件 | 2为自定义html字符串 | 3为confirm对话框 |
        // 4为alert警告对话框
        // isHaveTitle:是否显示标题栏
        // scrollType：设置或获取对话框中的框架是否可被滚动
        // isBackgroundCanClick：弹出对话框后，是否允许蒙布后的所有元素被点击。也就是如果为false的话，就会有全屏蒙布，如果为true的话，就会去掉全屏蒙布
        // isSupportDraging：是否支持拖拽
        // isShowShadow：是否现实阴影
        // isReloadOnClose：是否刷新页面，并关闭对话框
        // width：宽度
        // height：高度
        this.config = Object.extend({
            contentType: 1,
            isHaveTitle: true,
            scrollType: 'no',
            isBackgroundCanClick: false,
            isSupportDraging: true,
            isShowShadow: true,
            isReloadOnClose: true,
            width: 400,
            height: 300
        },
        config || {});

        // ----------------对话框的参数值信息------------------------
        // shadowWidth ：阴影的宽度
        // contentUrl ：html链接页面
        // contentHtml ：html内容
        // callBack ：回调的函数名
        // parameter ：回调的函数名中传的参数
        // confirmCon ：对话框内容
        // alertCon ：警告框内容
        // someHiddenTag：页面中需要隐藏的元素列表，以逗号分割
        // someHiddenEle：需要隐藏的元素的ID列表(和someToHidden的区别是：someHiddenEle是通过getElementById，而someToHidden是通过getElementByTagName，里面放的是对象)
        // overlay ：
        // coverOpacity ：蒙布的透明值
        this.info = {
            shadowWidth: 4,
            title: "",
            contentUrl: "",
            contentHtml: "",
            callBack: null,
            parameter: null,
            confirmCon: "",
            alertCon: "",
            someHiddenTag: "select,object,embed",
            someHiddenEle: "",
            overlay: 0,
            coverOpacity: 40
        };

        // 设置颜色cColor:蒙布的背景, bColor:内容区域的背景, tColor:标题栏和边框的颜色,wColor:字体的背景色
        this.color = {
            cColor: "#EEEEEE",
            bColor: "#FFFFFF",
            tColor: "#709CD2",
            wColor: "#FFFFFF"
        };

        this.dropClass = null;

        // 用来放置隐藏了的对象列表，在hiddenTag方法中第一次调用
        this.someToHidden = [];

        // 如果没有标题栏则不支持拖拽
        if (!this.config.isHaveTitle) {
            this.config.isSupportDraging = false;
        }
        // 初始化
        this.iniBuild();
    },

    // 设置配置信息和参数内容
    setContent: function (arrt, val) {
        if (val != '') {
            switch (arrt) {
            case 'width':
                this.config.width = val;
                break;
            case 'height':
                this.config.height = val;
                break;
            case 'title':
                this.info.title = val;
                break;
            case 'contentUrl':
                this.info.contentUrl = val;
                break;
            case 'contentHtml':
                this.info.contentHtml = val;
                break;
            case 'callBack':
                this.info.callBack = val;
                break;
            case 'parameter':
                this.info.parameter = val;
                break;
            case 'confirmCon':
                this.info.confirmCon = val;
                break;
            case 'alertCon':
                this.info.alertCon = val;
                break;
            case 'someHiddenTag':
                this.info.someHiddenTag = val;
                break;
            case 'someHiddenEle':
                this.info.someHiddenEle = val;
                break;
            case 'overlay':
                this.info.overlay = val;
            };
        };
    },

    iniBuild: function () {
        G('dialogCase') ? G('dialogCase').parentNode.removeChild(G('dialogCase')) : function () {};
        var oDiv = document.createElement('span');
        oDiv.id = 'dialogCase';
        document.body.appendChild(oDiv);
    },

    build: function () {

        // 设置全屏蒙布的z-index
        var baseZIndex = 10001 + this.info.overlay * 10;

        // 设置蒙布上的弹出窗口的z-index(比蒙布的z-index高2个值)
        var showZIndex = baseZIndex + 2;

        // 定义框架名称
        this.iframeIdName = 'ifr_popup' + this.info.overlay;

        // 设置图片的主路径
        var path = "http://img.baidu.com/hi/img/";
        // 关闭按钮
        var close = '<input type="image" id="dialogBoxClose" src="' + path + 'dialogclose.gif" border="0" width="16" height="16" align="absmiddle" title="关闭"/>';

        // 使用滤镜设置对象的透明度
        var cB = 'filter: alpha(opacity=' + this.info.coverOpacity + ');opacity:' + this.info.coverOpacity / 100 + ';';

        // 设置全屏的蒙布
        var cover = '<div id="dialogBoxBG" style="position:absolute;top:0px;left:0px;width:100%;height:100%;z-index:' + baseZIndex + ';' + cB + 'background-color:' + this.color.cColor + ';display:none;"></div>';

        // 设置弹出的主窗口设置
        var mainBox = '<div id="dialogBox" style="border:1px solid ' + this.color.tColor + ';display:none;z-index:' + showZIndex + ';position:relative;width:' + this.config.width + 'px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="' + this.color.bColor + '">';

        // 设置窗口标题栏
        if (this.config.isHaveTitle) {
            mainBox += '<tr height="24" bgcolor="' + this.color.tColor + '"><td><table style="-moz-user-select:none;height:24px;" width="100%" border="0" cellpadding="0" cellspacing="0" ><tr>' + '<td width="6" height="24"></td><td id="dialogBoxTitle" style="color:' + this.color.wColor + ';font-size:14px;font-weight:bold;">' + this.info.title + '&nbsp;</td>' + '<td id="dialogClose" width="20" align="right" valign="middle">' + close + '</td><td width="6"></td></tr></table></td></tr>'
        } else {
            mainBox += '<tr height="10"><td align="right">' + close + '</td></tr>'
        };
        mainBox += '<tr style="height:80px" valign="top"><td id="dialogBody" style="position:relative;"></td></tr></table></div>' + '<div id="dialogBoxShadow" style="display:none;z-index:' + baseZIndex + ';"></div>';
        // 如果有蒙布
        if (!this.config.isBackgroundCanClick) {
            G('dialogCase').innerHTML = cover + mainBox;
            G('dialogBoxBG').style.width = this.getValue("scrollWidth");
            G('dialogBoxBG').style.height = this.getValue("scrollHeight");
        } else {
            G('dialogCase').innerHTML = mainBox;
        }

        Event.observe(G('dialogBoxClose'), "click", this.reset.bindAsEventListener(this), false);
        // 如果支持拖动,则设置拖动处理
        if (this.config.isSupportDraging) {
            dropClass = new Dragdrop(this.config.width, this.config.height, this.info.shadowWidth, this.config.isSupportDraging, this.config.contentType);
            G("dialogBoxTitle").style.cursor = "move"
        };
        this.lastBuild()

    },

    lastBuild: function () {
        // 设置confim对话框的具体内容
        var confirm = '<div style="width:100%;height:100%;text-align:center;"><div style="margin:20px 20px 0 20px;font-size:14px;line-height:16px;color:#000000;">' + this.info.confirmCon + '</div><div style="margin:20px;"><input id="dialogOk" type="button" value=" 确定 "/>&nbsp;<input id="dialogCancel" type="button" value=" 取消 "/></div></div>';
        // 设置alert对话框的具体内容
        var alert = '<div style="width:100%;height:100%;text-align:center;"><div style="margin:20px 20px 0 20px;font-size:14px;line-height:16px;color:#000000;">' + this.info.alertCon + '</div><div style="margin:20px;"><input id="dialogYES" type="button" value=" 确定 "/></div></div>';

        var baseZIndex = 10001 + this.info.overlay * 10;
        var coverIfZIndex = baseZIndex + 4;

        // 判断内容类型决定窗口的主内容区域应该显示什么
        if (this.config.contentType == 1) {
            var openIframe = "<iframe width='100%' style='height:" + this.config.height + "px' name='" + this.iframeIdName + "' id='" + this.iframeIdName + "' src='" + this.info.contentUrl + "' frameborder='0' scrolling='" + this.config.scrollType + "'></iframe>";
            var coverIframe = "<div id='iframeBG' style='position:absolute;top:0px;left:0px;width:1px;height:1px;z-index:" + coverIfZIndex + ";filter: alpha(opacity=00);opacity:0.00;background-color:#ffffff;'><div>";
            G("dialogBody").innerHTML = openIframe + coverIframe;
        } else if (this.config.contentType == 2) {
            G("dialogBody").innerHTML = this.info.contentHtml;
        } else if (this.config.contentType == 3) {
            G("dialogBody").innerHTML = confirm;
            Event.observe(G('dialogOk'), "click", this.forCallback.bindAsEventListener(this), false);
            Event.observe(G('dialogCancel'), "click", this.close.bindAsEventListener(this), false);
        } else if (this.config.contentType == 4) {
            G("dialogBody").innerHTML = alert;
            Event.observe(G('dialogYES'), "click", this.close.bindAsEventListener(this), false);
        };
    },

    reBuild: function () {
        G('dialogBox').style.height = this.config.height + "px";
        G('dialogBody').style.height = this.config.height + "px";
        this.middle();
        this.lastBuild()
    },

    show: function () {
        this.hiddenSome();
        this.middle();
        if (this.config.isShowShadow) this.shadow()
    },

    forCallback: function () {
        return this.info.callBack(this.info.parameter)
    },

    // 为弹出窗口设置阴影
    shadow: function () {
        var oShadow = G('dialogBoxShadow');
        var oDialog = G('dialogBox');
        oShadow['style']['position'] = "absolute";
        oShadow['style']['background'] = "#000";
        oShadow['style']['display'] = "";
        oShadow['style']['opacity'] = "0.2";
        oShadow['style']['filter'] = "alpha(opacity=20)";
        oShadow['style']['top'] = oDialog.offsetTop + this.info.shadowWidth;
        oShadow['style']['left'] = oDialog.offsetLeft + this.info.shadowWidth;
        oShadow['style']['width'] = oDialog.offsetWidth;
        oShadow['style']['height'] = oDialog.offsetHeight;
    },

    middle: function () {
        if (!this.config.isBackgroundCanClick) {
            G('dialogBoxBG').style.display = '';
        }
        var oDialog = G('dialogBox');
        oDialog['style']['position'] = "absolute";
        oDialog['style']['display'] = "";
 
        var sClientWidth = document.body.clientWidth;
        var sClientHeight = document.body.clientHeight;
        var sScrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
        var sleft = (sClientWidth / 2) - (oDialog.offsetWidth / 2);
        var iTop = (sClientHeight - sScrollTop) / 2 - (oDialog.offsetHeight / 2) + sScrollTop - 100;
        var sTop = iTop > 0 ? iTop : 0;

        if (sTop < 1) {
            sTop = "20";
        }
        if (sleft < 1) {
            sleft = "20";
        }
        oDialog['style']['left'] = sleft + "px";
        oDialog['style']['top'] = sTop + "px";
    },
    // 刷新页面，并关闭当前弹出窗口
    reset: function () {
        if (this.config.isReloadOnClose) {
            top.location.reload();
        };
        this.close();
    },

    // 关闭当前弹出窗口
    close: function () {
        G('dialogBox').style.display = 'none';
        if (!this.config.isBackgroundCanClick) G('dialogBoxBG').style.display = 'none';
        if (this.config.isShowShadow) G('dialogBoxShadow').style.display = 'none';
        G('dialogBody').innerHTML = '';

        this.showSome();
    },

    // 隐藏someHiddenTag和someHiddenEle中的所有元素
    hiddenSome: function () {
        // 隐藏someHiddenTag中的所有元素
        var tag = this.info.someHiddenTag.split(",");
        if (tag.length == 1 && tag[0] == "") {
            tag.length = 0;
        }
        for (var j = 0; j < tag.length; j++) {
            this.hiddenTag(tag[j]);
        };
        // 隐藏someHiddenEle中的所有逗号分割的ID的元素
        var ids = this.info.someHiddenEle.split(",");
        if (ids.length == 1 && ids[0] == "") ids.length = 0;
        for (var j = 0; j < ids.length; j++) {
            this.hiddenEle(ids[j]);
        };
        // 改变顶部和底部的div的id值为弹出状态的id值,祥见space的实现
        space("begin");
    },

    // 隐藏一组元素
    hiddenTag: function (tagName) {
        var ele = document.getElementsByTagName(tagName);
        if (ele != null) {
            for (var j = 0; j < ele.length; j++) {
                if (ele[j].style.display != "none" && ele[j].style.visibility != 'hidden') {
                    ele[j].style.visibility = 'hidden';
                    this.someToHidden.push(ele[j]);
                };
            };
        };
    },

    // 隐藏单个元素
    hiddenEle: function (id) {
        var ele = document.getElementById(id);
        if (typeof(ele) != "undefined" && ele != null) {
            ele.style.visibility = 'hidden';
            this.someToHidden.push(ele);
        }
    },

    // 将someToHidden中保存的隐藏元素全部显示
    // 并恢复顶部和底部的div为原来的id值
    showSome: function () {
        for (var j = 0; j < this.someToHidden.length; j++) {
            this.someToHidden[j].style.visibility = 'visible';
        };
        space("end");
    }
};

// ********************************************************Dragdrop类(拖拽动作)************************************************************
var Dragdrop = new Class();

Dragdrop.prototype = {
    initialize: function (width, height, shadowWidth, showShadow, contentType) {
        this.dragData = null;
        this.dragDataIn = null;
        this.backData = null;
        this.width = width;
        this.height = height;
        this.shadowWidth = shadowWidth;
        this.showShadow = showShadow;
        this.contentType = contentType;
        this.IsDraging = false;
        this.oObj = G('dialogBox');
        Event.observe(G('dialogBoxTitle'), "mousedown", this.moveStart.bindAsEventListener(this), false);
    },

    moveStart: function (event) {
        this.IsDraging = true;
        if (this.contentType == 1) {
            G("iframeBG").style.display = "";
            G("iframeBG").style.width = this.width;
            G("iframeBG").style.height = this.height;
        };
        Event.observe(document, "mousemove", this.mousemove.bindAsEventListener(this), false);
        Event.observe(document, "mouseup", this.mouseup.bindAsEventListener(this), false);
        Event.observe(document, "selectstart", this.returnFalse, false);
        this.dragData = {
            x: Event.pointerX(event),
            y: Event.pointerY(event)
        };
        this.backData = {
            x: parseInt(this.oObj.style.left),
            y: parseInt(this.oObj.style.top)
        };
    },

    mousemove: function (event) {
        if (!this.IsDraging) return;
        var iLeft = Event.pointerX(event) - this.dragData["x"] + parseInt(this.oObj.style.left);
        var iTop = Event.pointerY(event) - this.dragData["y"] + parseInt(this.oObj.style.top);
        if (this.dragData["y"] < parseInt(this.oObj.style.top)) iTop = iTop - 12;
        else if (this.dragData["y"] > parseInt(this.oObj.style.top) + 25) iTop = iTop + 12;
        this.oObj.style.left = iLeft;
        this.oObj.style.top = iTop;
        if (this.showShadow) {
            G('dialogBoxShadow').style.left = iLeft + this.shadowWidth;
            G('dialogBoxShadow').style.top = iTop + this.shadowWidth;
        };
        this.dragData = {
            x: Event.pointerX(event),
            y: Event.pointerY(event)
        };
        document.body.style.cursor = "move";
    },

    mouseup: function (event) {
        if (!this.IsDraging) return;
        if (this.contentType == 1) G("iframeBG").style.display = "none";
        document.onmousemove = null;
        document.onmouseup = null;
        var mousX = Event.pointerX(event) - (document.documentElement.scrollLeft || document.body.scrollLeft);
        var mousY = Event.pointerY(event) - (document.documentElement.scrollTop || document.body.scrollTop);
        if (mousX < 1 || mousY < 1 || mousX > document.body.clientWidth || mousY > document.body.clientHeight) {
            this.oObj.style.left = this.backData["x"];
            this.oObj.style.top = this.backData["y"];
            if (this.showShadow) {
                G('dialogBoxShadow').style.left = this.backData.x + this.shadowWidth;
                G('dialogBoxShadow').style.top = this.backData.y + this.shadowWidth;
            };
        };
        this.IsDraging = false;
        document.body.style.cursor = "";
        Event.stopObserving(document, "selectstart", this.returnFalse, false);
    },

    returnFalse: function () {
        return false;
    }
};

// begin popwin
function openshow(url, title, w, h, stype) {
    g_pop = new Popup({
        contentType: stype,
        isReloadOnClose: false,
        width: w,
        height: h
    });

    g_pop.setContent("title", title);

    g_pop.setContent("contentUrl", url);
    g_pop.build();
    g_pop.show();
}

function g_close_pop_re() {
    g_pop.close();
    location.reload();
}

function Comment(url, w, h) {
    g_pop = new Popup({
        contentType: 1,
        isReloadOnClose: false,
        width: w,
        height: h
    });
    g_pop.setContent("title", "登陆");
    g_pop.setContent("scrollType", "no");
    g_pop.setContent("contentUrl", url);
    g_pop.build();
    g_pop.show();
}

function g_close_pop() {
    g_pop.close();
    g_pop = null;
}

function ShowAlert(title, content, w, h) {
    var pop = new Popup({
        contentType: 4,
        isReloadOnClose: false,
        width: w,
        height: h
    });
    pop.setContent("title", title);
    pop.setContent("alertCon", content);
    pop.build();
    pop.show();
}

function Wclose() {
    g_pop.close();
    g_pop = null;
}
// end popwin