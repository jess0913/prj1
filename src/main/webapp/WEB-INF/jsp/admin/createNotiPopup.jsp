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

<!-- CK Editor -->
<script src="<c:url value='/js/ckeditor/ckeditor.js' />" ></script>
<script>

	$(function () {			
		// 필수값
		$(".red").css("color", "red");
		
		// Replace the <textarea id="editor1"> with a CKEditor
	    // instance, using default configuration.
	    CKEDITOR.replace('description');
	    CKEDITOR.config.removePlugins = "resize";
		
		$("#save").click(function(){
			var vaild = validation();
			if ( vaild ) {
				if( confirm( "등록 하시겠습니까?" ) ){
					$("#description").val(CKEDITOR.instances.description.getData());
					$.ajax({
						type:"post",
						url:"/admin/insertNoti",
						data: $("#frm").serialize() , 
						dataType:"json" ,
						async : false ,	
						success : function ( data ) {
							if( data.isSaved ) {
								alert( data.msg );								
								$(opener.location).attr("href", "javascript:goSearch();");
								window.close();
							}
							else {
								alert( data.msg );
							}
						},
						error : function(xhr, status, error) {
							var errorCd = xhr.status;							
							if ( errorCd != 200 ) {
								alert("오류가 발생 하였습니다.\n 관리자에게 문의 하십시오");	
							}							
						}
				     });
				}
		    }
			
		});
	    
	    $("#cancel").click(function(){
	    	window.close();
	    });
	})
	
	function validation () {

		// 제목
		var title = $("#title").val().trim();
		if ( "" == title ) {
			alert( "제목을 입력 하세요." );
			$("#title").focus();
			return false;
		}

		// 설명
		$("#description").val(CKEDITOR.instances.description.getData());
		var description = $("#description").val().trim();
		if ( "" == description ) {
			alert( "설명을 입력 하세요." );
			$("#description").focus();
			return false;
		}

		return true;
	}

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
			공지사항
			<small> - 공지사항 등록</small>
		</h1>
		<form id="frm" name="frm">
			
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
											<input type="text" id="title" name="title" class="form-control" value="">
										</td>
									</tr>
									<tr>
										<td><span class="red">*</span>설명</td>
										<td>
											<textarea class="form-control" id="description" name="description" style="resize: none;"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>				
						<!-- button -->
						<div class="box-footer">
							<div class="row" style="height: 34px; line-height: 34px; text-align: center;">
								<button type="button" class="btn btn-primary btn-flat" id="save"   >등록</button>
								<button type="button" class="btn btn-default btn-flat" id="cancel" >취소</button>
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
