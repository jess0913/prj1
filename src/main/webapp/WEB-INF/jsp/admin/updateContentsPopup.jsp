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

	//////////////// Drag & Drop 변수 ///////////////////
	//파일 리스트 번호
	var contentsIndex = 0;
	// 파일 리스트
	var contentsFileList = new Array();
	//////////////// Drag & Drop 변수 ///////////////////

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
				if( confirm( "수정 하시겠습니까?" ) ){

				    // 등록할 파일 리스트를 formData로 데이터 입력
// 				    var form = $("#itmFrm");
				    var form = document.getElementById('frm');
				    var formData = new FormData(form);
				    
					 // 등록할 파일 리스트
				    var uploadFileList = Object.keys(contentsFileList);
				    // 파일이 있는지 체크
				    if( uploadFileList.length == 0 ){
				        // 파일등록 경고창
				        alert( "파일이 없습니다." );
				        return;
				    }
				    for( var i = 0; i < uploadFileList.length; i++ ){
			            formData.append("contentsFile", contentsFileList[uploadFileList[i]]);
			        }

				    $.ajax({
						type:"post",
						enctype: 'multipart/form-data',
						url:"/admin/updateContents",
						data: formData , 
						dataType:"json" ,
						processData:false,
			            contentType:false,
			            beforeSend: function() {
			                // Loading Open
			                loadingOpen();
			            },
						success : function ( data ) {
							if( data.isSaved ) {
								alert( data.msg );
								$(opener.location).attr("href", "javascript:goSearch( 0 );");
								windowClose();
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
						},
						complete: function(){
			                // Loading Close
			                loadingClose();
			            }
				     });
				}
		    }
			
		});
	    
	    $("#cancel").click(function(){
	    	window.close();
	    });
	    
	    // drag & drop
	    fileDropDown( '#contents', "contentsList");

	 	// 브라우저에 끌어다 놓은 파일을 로드하지 않도록함
	    window.addEventListener("dragover",function(e){
	   	  e = e || event;
	   	  e.preventDefault();
	   	},false);
	   	window.addEventListener("drop",function(e){
	   	  e = e || event;
	   	  e.preventDefault();
	   	},false);
	   	
	})
	
	function validation () {

		// 아이템명
		var itemName = $("#itemName").val();
		if ( "" == itemName ) {
			alert( "이모티콘 명을 입력 하세요." );
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
	
	/////////////////// Drag & Drop ///////////////////
	function checkDupl ( idName ) {
		var isDupl = true;
		if ( $( "#" + idName ).length > 0 ) {
			isDupl = false;
		}
		return isDupl;
		
	}

	//파일 드롭 다운
	function fileDropDown( obj, listId ) {
		
	   var dropZone = $( obj );
	   //Drag기능 
	   dropZone.on( 'dragenter', function( e ) {
	       e.stopPropagation();
	       e.preventDefault();
	       // 드롭다운 영역 css
	       $( e.target ).css({
	           "background-color": "gray",
	           "outline-offset": "-3px"
	       });
	   });
	   dropZone.on( 'dragleave', function( e ) {
	       e.stopPropagation();
	       e.preventDefault();
	       // 드롭다운 영역 css
	       $( e.target ).css({
	           "background-color": "white",
	           "outline-offset": "0px"
	       });
	   });
	   dropZone.on( 'dragover', function( e ) {
	       e.stopPropagation();
	       e.preventDefault();
	       // 드롭다운 영역 css
	       $( e.target ).css({
	           "background-color": "gray",
	           "outline-offset": "-3px"
	       });
	   });
	   dropZone.on( 'drop', function( e ){
	       e.preventDefault();
	       // 드롭다운 영역 css
	       $( e.target ).css({
	           "background-color": "white",
	           "outline-offset": "0px"
	       });
	       
	       var files = e.originalEvent.dataTransfer.files;
	       if( files != null ){
	           if( files.length < 1 ) {
	               alert( "폴더 업로드 불가" );
	               return;
	           }
	           selectFile( files, listId );
	       }
	       else{
	           alert( "ERROR" );
	       }
	   });
	}

	// 파일 선택시
	function selectFile( fileObject, listId ) {
	    var files = null;

	    if( fileObject != null ) {
	        // 파일 Drag 이용하여 등록시
	        files = fileObject;
	    }
	    
	    // 다중파일 등록
	    if( files != null ) {
	    	var cnt = files.length;
	    	if ( amountCheck( listId, cnt ) ) {
		    	var cnt = files.length;
		        for(var i = 0; i < cnt; i++){
		            // 파일 이름
		            var fileName = files[i].name;
		            var fileNameArr = fileName.split("\.");
		            // 확장자
		            var ext = fileNameArr[fileNameArr.length - 1];
		            // 파일 사이즈(단위 :MB)
		            var fileSize = files[i].size / 1024 / 1024;
		            //파일 url
		            var fileUrl = window.URL.createObjectURL(files[i]);
	            	if( listId == "contentsList" ){
		                // 업로드 파일 목록 생성
		                var bool = addFileList( contentsIndex, fileName, fileUrl, listId );
		                if(bool){
		            		// 파일 배열에 넣기	                	                
			                contentsFileList[contentsIndex] = files[i];
			                contentsIndex++;
			           	}
	            	}
		        }
	    	}
	    }
	    else {
	        alert( "ERROR" );
	    }
	}

	// 업로드 파일 목록 생성
	function addFileList(fIndex, fileName, fileUrl, listId ){
		var lastDot = fileName.lastIndexOf('.');
		var idName = fileName.substring( 0 , lastDot );
		if( checkDupl ( idName ) ){
	    	var tr = '';
		    	tr += '<tr>';
				tr += '	   <td>';
				tr += '        <span id="' + idName + '">' + fileName + '</span>';
				tr += '        <i class="fa fa-fw fa-remove" onclick="removeContents(this, \''+listId+'\' , \''+fIndex+'\')"></i>';
				tr += '    </td>';
				tr += '</tr>';
			$( "#"+listId ).append(tr);
			return true;						
		}
		else {
			alert("중복된 파일명 입니다.\n파일명을 변경 해주세요.");
			return false;
		}
	}
	

	function amountCheck( listId, cnt ){
		var retBoolean = true;
		var listSize = $( "#"+listId+" tr" ).length;
		if( listId == "contentsList" ){
			if( cnt > 1 ){
				retBoolean = false;
			}
			if( listSize > 0 ){
				retBoolean = false;				
			}
    	}
		return retBoolean;
	}

	function removeContents( obj, listId, fIndex ){
		$(obj).parent().parent().remove();

		if( listId == "contentsList" ){
			contentsFileList.splice( fIndex-1, 1 );
			contentsIndex--;
    	}
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
			자료실
			<small> - 자료 등록</small>
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
											<input type="text" id="contentsName" name="contentsName" class="form-control" value="${retMap.title}">
										</td>
									</tr>
									<tr>
										<td>설명</td>
										<td>
											<textarea class="form-control" id="description" name="description">${retMap.description }</textarea>
										</td>
									</tr>
									<tr>
										<td><span class="red">*</span>첨부파일</td>
										<td>
											<div class="col-xs-2">
												<div class="fileDrag" id="contents"></div>	
											</div>
											<div class="col-xs-10">
												<table id="contentsList">
												</table>
												<a href="${retMap.fileurl }" > ${retMap.filename }</a>
											</div>
										</td>
									</tr>								
								</tbody>
							</table>
						</div>				
						<!-- button -->
						<div class="box-footer">
							<div class="row" style="height: 34px; line-height: 34px; text-align: center;">
								<button type="button" class="btn btn-primary btn-flat" id="save"   >저장</button>
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
