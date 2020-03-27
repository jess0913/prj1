<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script>
	//window.open(popUrl,"",popOption);
	pevent();
	function pevent(){
	    function getCookie(name){
	        var nameOfCookie = name + "=";
	        var x = 0;
	        while (x <= document.cookie.length){
	            var y = (x + nameOfCookie.length);
	            if (document.cookie.substring(x, y) == nameOfCookie){
	            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
	            endOfCookie = document.cookie.length;
	            }
	            return unescape (document.cookie.substring(y, endOfCookie));
	            }
	            x = document.cookie.indexOf (" ", x) + 1;
	            if (x == 0) break;
	        }
	        return "";
	    }
	    if (getCookie("popname") != "done"){
	    	var popUrl = "pop";	//팝업창에 출력될 페이지 URL
	    	var popOption = "width=800, height=600, resizable=yes, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	        window.open(popUrl,"",popOption);
	    }
	}
</script>
