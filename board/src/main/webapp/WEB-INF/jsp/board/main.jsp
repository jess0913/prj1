<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	    	var popUrl = "pop";	//�˾�â�� ��µ� ������ URL
	    	var popOption = "width=800, height=600, resizable=yes, scrollbars=no, status=no;";    //�˾�â �ɼ�(optoin)
	        window.open(popUrl,"",popOption);
	    }
	}
</script>
</head>
<body>
	����ȭ��22
</body>
</html>