<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>
	<script src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>

	<script>
		function setCookie(name, value, expiredays){
		    var todayDate = new Date();
		        todayDate.setDate (todayDate.getDate() + expiredays);
		        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
		    }
		function closePop(){
		        if (document.frm.pop.checked){
		        setCookie("popname", "done", 1);
		    }
		    self.close();
		}
	
		function detailNotice( id ){
			$.ajax({
				type:"POST",
				url:"/board/getNoti",
				data: {
						"id" : id
					}, 
				success : function( data ) {
					$("#result").html(data);
				},		           
				error : function( xhr, status, error ) {
					// alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
	//					alert( "error code:"+xhr.status );
				}
			});
			
		}
		function detailContent( id ){
			$.ajax({
				type:"POST",
				url:"/contents/getContents",
				data: {
						"id" : id
					}, 
				success : function( data ) {
					$("#result").html(data);
				},		           
				error : function( xhr, status, error ) {
				}
			});
			
		}
	</script>
	<style type="text/css">
	body {
	  margin:0;
	}
	.parent {
	  align-items: left;
		width: 100%;
		height: 99vh;
	  display: inline-block;
	}
	.child {
	  float:left;
	  width: 100%;
	  height: 69vh;
	  text-align: left;
	  //background-color: #fcba03;
	  display: inline-block;
	}
	.child2 {
	  float:left;
	  margin: 0;
	  width: 50%;
	  height: 30vh;
	  text-align: left;
	  //background-color: #7d7d7d;
	  display: inline-block;
	  
	}
	.child3 {
	  float:left;
	  width: 100%;
	  height: 5vh;
	  text-align: left;
	  //background-color: #fcba03;
	  display: inline-block;
	}
	</style>
</head>
<body>
	
	<div class="parent">
		<div class="child" id="result">
			<%@include  file="include/detailNoti.jsp" %>
		</div>			
		<div class="child2">
			<%@include  file="include/notiList.jsp" %>
		</div>
		<div class="child2">
			<%@include  file="include/contentsList.jsp" %>
		</div>
	</div>
</body>
</html>