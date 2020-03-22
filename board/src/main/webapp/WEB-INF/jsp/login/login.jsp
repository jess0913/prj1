<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title></title>
	
	<link href="<c:url value='/css/bootstrap.min.css' />"	 rel="stylesheet"></link>
	<link href="<c:url value='/css/font-awesome.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/ionicons.min.css' />" 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/login.css' />" 	 	 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/skin-purple.min.css'/>" 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/rubig.css'/>" 			 rel="stylesheet"></link>
	
	<script src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
	<script src="<c:url value='/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/js/adminlte.min.js' />"></script>
	<!-- common js -->
	<script src="<c:url value='/js/common.js' />"></script>
	<script type="text/javascript"> 
		$(function(){
			$("#username,#password").keydown(function(key) {
				if(key.keyCode == 13){
					doLogin();
				}
			});
		
			var code = "${param.error}"
			if(code == "fail"){
				alert("등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			}
		})
	
		function doLogin() {
			var userId = $("#username").val();
			var pwd = $("#password").val();
			
			if ( userId == "" ) {
				alert("아이디를 입력해 주세요");
				return;
			}
			if (pwd == "" ) {
				alert("패스워드를 입력해주세요.");
				return;
			}
			
			loginForm.submit();
		}
		
	</script>
</head>

<body class="skin-purple sidebar-mini" style="height: auto; min-height: 100%;" >
<c:set var="errorMessage" value="${sessionScope[\"SPRING_SECURITY_LAST_EXCEPTION\"].message}" /> 
	<main id="content" role="main">
	    <!-- Form -->
	    <div class="d-flex align-items-center position-relative height-lg-100vh">
	      <div class="col-lg-5 col-xl-4 d-none d-lg-flex align-items-center gradient-half-primary-v1 height-lg-100vh px-0">
	        <div class="w-100 p-5">
				<div class="Big-logo">admin</div>
	        </div>
	      </div>
	    
	      <div class="container">
	        <div class="row no-gutters">
	          <div class="col-md-8 col-lg-7 col-xl-6 offset-md-2 offset-lg-2 offset-xl-3 space-3 space-lg-0">
	            <!-- Form -->
	            <form class="js-validate mt-5" novalidate="novalidate" name="loginForm" action="/login" method="POST" class="my-login-validation">
	              <!-- Title -->
	              <div class="mb-7">
	                <h2 class="h3 text-primary font-weight-normal mb-0">Welcome to</h2>
	                <p>관리자페이지</p>
	              </div>
	              <!-- End Title -->
	
	              <!-- Form Group -->
	              <div class="js-form-message form-group">
	                <label class="form-label" for="signinSrEmail">USER ID</label>
	                <input type="text" name="username" id="username"  class="form-control" name="ID" id="signinSrEmail" placeholder="User ID" data-msg="Please enter a valid User ID.">
	              </div>
	              <!-- End Form Group -->
	
	              <!-- Form Group -->
	              <div class="js-form-message form-group">
	                <label class="form-label" for="signinSrPassword">
	                  <span class="d-flex justify-content-between align-items-center">
	                    Password
	                    <!--  <a class="link-muted text-capitalize font-weight-normal" href="recover-account.html">비밀번호를 잊으셨나요?</a> -->
	                  </span>
	                </label>
	                <input type="password" type="password" name="password" id="password"  class="form-control" placeholder="********" aria-label="********"  data-msg="Your password is invalid. Please try again." data-error-class="u-has-error" data-success-class="u-has-success">
	              </div>
	              <!-- End Form Group -->
	
	              <!-- Button -->
	              <div class="row align-items-center mb-5">
	                <div class="col-6">
	                </div>
	
	                <div class="col-6 text-right">
	                  <button type="button" class="btn btn-primary transition-3d-hover" onclick="javascript:doLogin();">관리자로그인</button>
	                </div>
	              </div>
	              <!-- End Button -->
	            </form>
	            <!-- End Form -->
	          </div>
	        </div>
	      </div>
	    </div>
	    <!-- End Form -->
	  </main>
<c:if test="${not empty error}">
	<div class="error">${error}</div>
</c:if>
<c:if test="${not empty msg}">
	<div class="msg">${msg}</div>
</c:if>
</body>
</html>