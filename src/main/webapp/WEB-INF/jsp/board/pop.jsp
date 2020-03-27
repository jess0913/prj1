<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>공지사항</title>
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
  background-color: #fcba03;
  display: inline-block;
}
.child2 {
  float:left;
  margin: 0;
  width: 50%;
  height: 25vh;
  text-align: left;
  background-color: #7d7d7d;
  display: inline-block;
  
}
.child3 {
  float:left;
  width: 100%;
  height: 5vh;
  text-align: left;
  background-color: #fcba03;
  display: inline-block;
}
</style>
<script type="text/javascript">
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

</script>
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
		<div id="div_laypopup" align="center" class="child3">  
		    <input type="checkbox" onClick="closePop();">오늘 하루 동안 열지 않음
		    <a href="javascript:self.close();" onfocus="this.blur()">[닫기]</a>
		 </div> 
	</div>
</body>
</html>