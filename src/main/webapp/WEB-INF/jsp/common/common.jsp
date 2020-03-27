<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>
/*loading_layer*/
.load_popup{ width:230px;height:127px;padding:5px;text-align:center }
.load_popup p{color:#12468f;font-weight:bold;margin-bottom:10px;margin-top:3px}
.layer_pop {height: 100%;width: 100%;background:url(/img/bg_modal.png) repeat;position: absolute;top: 0;-moz-opacity:0.75;-khtml-opacity: 0.75;z-index:999}
</style>
<script type="text/javascript">

// loding bar
//Loading Open
function loadingOpen() {
    $("#loading_pop").css("display","block");
    var tx = ($(window).width()-$("#loading_pop .load_popup").width())/2;
    var ty = ($(window).height()-$("#loading_pop .load_popup").height())/2;
    $("#loading_pop .load_popup").css({left:tx+"px",top:ty+"px"});
    $("body").css("overflow","hidden");
}

// Loading Close
function loadingClose() {
    $("#loading_pop").css("display","none");
    $("body").css("overflow","auto");
}

// 팝업 창 닫기
function windowClose() {
    if ( /MSIE/.test(navigator.userAgent) ) {
        //Explorer 8이상일때
        if ( navigator.appVersion.indexOf("MSIE 8.0") >= 0 ) {
            window.opener='Self';
            window.open('','_parent','');
            window.close();
        }
        //Explorer 7이상일때
        else if ( navigator.appVersion.indexOf("MSIE 7.0") >=0 ) {
            window.open('about:blank','_self').close();
        }
        //Explorer 7미만일때
        else {
            window.opener = self;
            self.close();
        }
    }
    else {
        window.opener='Self';
        window.open('','_parent','');
        window.close();
    }

    if ( $("#popupType", parent.document) != "undefined" ) {
        if ( $("#popupType", parent.document).val() == "projectInfo" ) {
            parent.windowCloseIframe();
        }
    }
}

function currentPopupClose() {
    // ProjectInfo Popup 이 아니면
    if ( window.opener.parent.opener == null ) {
        // HOME 화면
        if ( window.opener.searchTodo ) {
            window.opener.searchTodo();
        }
        else {
            window.opener.search();
        }
    }
    else {

    }

    windowClose();
}

/*
 * 주어진 문자열의 왼쪽을 padding 문자로 채운다
 * str: 문자, n: 길이, padding: 채울문자
 */
function lpad(str, n, padding) {
    str = str + "";
    if ( str.length >= n ) {
        return str;
    }
    else {
        var len = n - str.length;
        var pad_str = str;
        for ( var i=0; i<len; i++ ) {
            pad_str = padding + pad_str;
        }
        return pad_str;
    }
}

/*
 * 주어진 문자열의 오른쪽을 padding 문자로 채운다
 * str: 문자, n: 길이, padding: 채울문자
 */
function rpad(str, n, padding) {
    str = str + "";
    if ( str.length >= n ) {
        return str;
    }
    else {
        var len = n - str.length;
        var pad_str = str;
        for ( var i=0; i<len; i++ ) {
            pad_str = pad_str + padding;
        }
        return pad_str;
    }
}

/**
 * Array Merge 및 중복 제거 후 오름차순 정렬
 */
function concatArraysUniqueWithSort (thisArray, otherArray) {
    var newArray = thisArray.concat(otherArray).sort(function (a, b) {
        return a > b ? 1 : a < b ? -1 : 0;
    });

    return $.unique(newArray);
};

// 밀리세컨드 단위로 시간 받아오기 grid 그릴때 id 또는 name값을 지정 할 때 사용 하거나
// 같은 이름을 사용 하는 내용을 여러개 그릴때 해당 시간을 넣어 구분함
// controller나 service 단에서 해당 list중 특정 라인을 가져올때 시간을 구해 그 라인의 값들을 가져올 수 있다
var getTime = function() {
    $today = new Date();
    $currentHour = $today.getHours();
    $currentMin  = $today.getMinutes();
    $currentSec  = $today.getSeconds();
    $currentMsec = $today.getMilliseconds();

   return "T" + lpad($currentHour, 2, "0") + "" + lpad($currentMin, 2, "0") + ""  + lpad($currentSec, 2, "0") + "" + lpad($currentMsec, 3, "0");
}

// url 		 : 경로
// title 	 : 팝업창 명
// w 		 : 창 넓이
// h 		 : 창 높이
// resizable : 사이즈 변경 가능 여부 ( yes or no ) 
// popupCenter(url, title, w, h, resizable)				// 팝업
// popupCenterModel(url, title, w, h, resizable)		// modal

// Popup Open 시 중앙에 표시
function popupCenter(url, title, w, h, resizable) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

    var width  = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top  = ((height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, title, 'help=no, resizable=' + resizable + ', status=no, scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    if (newWindow == null || typeof(newWindow) == "undefined" || (newWindow == null && newWindow.outerWidth == 0) || (newWindow != null && newWindow.outerHeight == 0) || newWindow.test == "undefined") {
        alert("팝업 차단 기능이 설정되어있습니다\n\n차단 기능을 해제(팝업허용) 한 후 다시 이용해 주십시오.\n\n만약 팝업 차단 기능을 해제하지 않으면\n정상적인 동작이 이루어지지 않습니다.");
        if ( newWindow ) {
            newWindow.close();
        }
        return;
    }
    else {
        newWindow.focus();
    }
    return newWindow;
}

function popupCenterModel(url, title, w, h, resizable) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

    var width  = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top  = ((height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, null, 'help=no, resizable=' + resizable + ', status=no, scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left + ', modal=yes,alwaysRaised=yes', null);

    // Puts focus on the newWindow
    if (newWindow == null || typeof(newWindow) == "undefined" || (newWindow == null && newWindow.outerWidth == 0) || (newWindow != null && newWindow.outerHeight == 0) || newWindow.test == "undefined") {
        alert("팝업 차단 기능이 설정되어있습니다\n\n차단 기능을 해제(팝업허용) 한 후 다시 이용해 주십시오.\n\n만약 팝업 차단 기능을 해제하지 않으면\n정상적인 동작이 이루어지지 않습니다.");
        if ( newWindow ) {
            newWindow.close();
        }
        return;
    }
    else {
        newWindow.focus();
    }
    return newWindow;
}

//Form 으로 Popup Open 시 중앙에 표시
function popupCenterByForm(url, formId, title, w, h, resizable) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

    var width  = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top  = ((height / 2) - (h / 2)) + dualScreenTop;
    
	$("#"+formId).one("submit",function(){
		var newWindow = window.open("", title, 'help=no, resizable=' + resizable + ', status=no, scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		this.action = url;
		this.method = "POST";
		this.target = title;

		if (newWindow == null || typeof(newWindow) == "undefined" || (newWindow == null && newWindow.outerWidth == 0) || (newWindow != null && newWindow.outerHeight == 0) || newWindow.test == "undefined") {
	        alert("팝업 차단 기능이 설정되어있습니다\n\n차단 기능을 해제(팝업허용) 한 후 다시 이용해 주십시오.\n\n만약 팝업 차단 기능을 해제하지 않으면\n정상적인 동작이 이루어지지 않습니다.");
	        if ( newWindow ) {
	            newWindow.close();
	        }
	        return;
	    }
	    else {
	        newWindow.focus();
	    }
	    
	}).trigger("submit");

    return newWindow;
}



function drawChart( arrayData, title, xTitle ) {    
	
	var data = new google.visualization.DataTable( arrayData );
	
	var options = {     
		title: title, 
		fontSize: '12',
		fontName: '맑은고딕',
		hAxis: {
			title: xTitle,
			gridlines: { count:0}, 
			titleTextStyle: {color: 'black', fontName: '맑은고딕'}
		} ,      
		vAxis: {
			title: '',
			minValue: 0, 
		    gridlines: {color:'#cfd8dc', count:4},
			titleTextStyle: {color: 'blue', fontName: '맑은고딕'}
		},
		
		areaOpacity: 0.24,
		lineWidth: 1,
		colors: ["#03a9f4","#00bcd4"],
		bar: {groupWidth: "40%"},
		datalessRegionColor: '#37474f',
	    displayMode: 'regions',
	    seriesType: 'bars',
        series: {5: {type: 'line'}}
	};        

	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	
	chart.draw(data, options);   
	data = null;
	chart = null;

}

function getChart( target, data ) {
	var arrayData = $.ajax({
				url : target
			  , data: data
	          , dataType : "json"	
	          , async : false
	}).responseText;
	return arrayData;		
}

</script>
