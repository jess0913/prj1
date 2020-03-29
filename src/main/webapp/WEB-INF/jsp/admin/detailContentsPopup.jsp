<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title></title>

<!-- Common Jsp -->
<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<link href="<c:url value='/css/bootstrap.min.css' />"	 rel="stylesheet"></link>
<link href="<c:url value='/css/font-awesome.min.css' />" rel="stylesheet"></link>
<link href="<c:url value='/css/ionicons.min.css' />" 	 rel="stylesheet"></link>
<link href="<c:url value='/css/AdminLTE.css' />" 	 	 rel="stylesheet"></link>
<link href="<c:url value='/css/skin-purple.min.css'/>" 	 rel="stylesheet"></link>

<script src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/adminlte.min.js' />"></script>
<!-- bootstrap datepicker -->
<script src="<c:url value='/js/bootstrap-datepicker.min.js' />"></script>

<!-- CK Editor -->
<script src="<c:url value='/js/ckeditor/ckeditor.js' />" ></script>

<style type="text/css">
.fileDrag {
    outline: 2px dashed #92b0b3 ;
    text-align: center;
    transition: all .15s ease-in-out;
    width: 50px;
    height: 50px;
    background-image: url('../../img/dragAndDrop.png');
    background-position: center;
    background-size: 50px;
    background-repeat: no-repeat;
}
 i {
 	cursor: pointer;
 }
</style>
<script>

	$(function () {			
		// 필수값
		$(".red").css("color", "red");
	    
	    $("#cancel").click(function(){
	    	window.close();
	    });
	    
	})

</script>
</head>
<body style="height:auto;min-height: 100%;">
	<!-- Loading Div Layer Start-->
    <div id="loading_pop" class="layer_pop" style="display: none;">
        <div class="load_popup" style="position:absolute;top:40%;left:40%;">
        <p><img src="/img/loading.gif"></p>
        <p>잠시만 기다려 주십시오</p>
        </div>
    </div>
    <!-- Loading Div Layer End-->

	<section class="content">
		<h1>
			자료실
			<small> - 자료 상세</small>
		</h1>
		<form id="frm" name="frm" enctype="multipart/form-data">
			
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-body">
							<table class="table table-bordered table-striped dataTable">
								<thead>
									<tr>
										<th class="col-xs-3" style="text-align: center;">항목</th>
										<th class="col-xs-9" style="text-align: center;">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><span class="red">*</span>제목</td>
										<td>
											${contentsMap.title }
										</td>
									</tr>
									<tr>
										<td>설명</td>
										<td>
											${contentsMap.description }
										</td>
									</tr>
									<tr>
										<td><span class="red">*</span>첨부파일</td>
										<td>
											<i class="fa fa-floppy-o"></i>
											<a href="<c:url value="${contentsMap.fileurl }"/>">${contentsMap.filename }</a>
										</td>
									</tr>								
								</tbody>
							</table>
						</div>				
						<!-- button -->
						<div class="box-footer">
							<div class="row" style="height: 34px; line-height: 34px; text-align: center;">
								<button type="button" class="btn btn-default btn-flat" id="cancel" >닫기</button>
							</div>
						</div>
						<!-- button -->
					</div>
				</div>
			</div>
			
		</form>
	</section>
	
</body>
</html>	 
