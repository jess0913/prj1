<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title>관리자</title>
	
	<!-- Common Jsp -->
	<%@include file="/WEB-INF/jsp/common/common.jsp" %>
	<link href="<c:url value='/css/bootstrap.min.css' />"	 rel="stylesheet"></link>
	<link href="<c:url value='/css/font-awesome.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/ionicons.min.css' />" 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/skin-purple.min.css'/>" 	 rel="stylesheet"></link>
	
	<script src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
	<script src="<c:url value='/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/js/adminlte.min.js' />"></script>
	<script type="text/javascript">
	
		$(function () {
			
			
			$( "#search" ).click( function() {
				goSearch();
			});
	
			$("#searchText").keydown(function(key) {
				if(key.keyCode == 13){
					goSearch();
				}
			});
			$( "#createNoti" ).click( function() {
				createNoti();
			});
			
			$( "#createContents" ).click( function() {
				createContents();
			});
			
			var boardType = "${boardType}";
			
			console.log();
			$("#boardType > option[value=CONTENTS").attr("selected","true");
			
			goSearch();
		})
		
		function goPage ( pageNum ) {
			goSearch( pageNum );
		}
	  
		// 검색
		function goSearch( pageNum ){
			
			if( pageNum < 0 ) {
				alert( '이후 페이지가 존재하지 않습니다.' );
				return;
			} 
			else if( pageNum < 1 ) {
				alert( '이전 페이지가 존재하지 않습니다.' );
				return;
			}
			
			if ( pageNum == undefined ) {			
				$("#pageNum").val("1");	  
			}
			else {
				$("#pageNum").val(pageNum); 			
			}
			
			$.ajax({
				type:"POST",
				url:"/board/getBoardList",
				data: $( "#frm" ).serialize(), 
				beforeSend: function() {
	                // Loading Open
	                loadingOpen();
	            },
				success : function( result ) {
					$("#result").html(result);
				},		           
				error : function( xhr, status, error ) {
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
					alert( "error code:"+xhr.status );
				},
				complete: function(){
	                // Loading Close
	                loadingClose();
	            }
			});
		}
		
		function detail(id, boardType) {
			location.href = "/board/boardDetail?id="+id+"&boardType="+boardType; 	
		}
		
		
	</script>
</head>
<body class="skin-purple sidebar-mini" style="height: auto; min-height: 100%;" >
 <div class="col-md-12">
	<form id="frm" action="" method="post">
		<input type="hidden" id="pageNum" name="pageNum" value="">
		
		<div class="row">
			<div class="col-md-7">
				<div class="form-inline form-group">
					<select id="boardType" name="boardType" class="form-control">
						<option value="NOTI" selected="selected">공지사항</option>
						<option value="CONTENTS">자료실</option>						
					</select>
					<select id="searchCondi" name="searchCondi" class="form-control">
						<option value="title" selected="selected">글제목</option>
						<option value="title">작성자</option>
						<option value="description">내용</option>						
					</select>
					<input type="text" class="form-control" id="searchText" name="searchText" value="">
					<button type="button" class="btn btn-primary btn-flat" id="search">검색</button>
				</div>
			</div>
			<div class="col-md-5">
				<div class="form-inline form-group pull-right">
					<select id="selectPageCnt" name="selectPageCnt" class="form-control">
		            	<option value="10" selected="selected">10개 보기</option>
					  	<option value="30">30개 보기</option>
						<option value="50">50개 보기</option>
						<option value="100">100개 보기</option>
		            </select>
	           	</div>
			</div>	
		</div>	
	</form>
	<!-- Search condition -->
	<form id="chkFrm" action="" method="post">
		<div class="box" id="result">
			<%@include  file="result/resultList.jsp" %>
		</div>
	</form>
</div>
</body>
</html>