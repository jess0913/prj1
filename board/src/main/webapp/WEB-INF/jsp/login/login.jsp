<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="errorMessage" value="${sessionScope[\"SPRING_SECURITY_LAST_EXCEPTION\"].message}" /> 
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
		
		// id가 이메일이기 때문에 이메일 형식 체크
// 		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
// 		if ( userId == "" || ! exptext.test(userId)) {
// 			alert("아이디가 입력되지 않았거나 이메일 형식이 아닙니다.");
// 			return;
// 		}

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
<link href="<c:url value='/css/login.css'/>" rel="stylesheet"></link>
<main id="content" role="main">
    <!-- Form -->
    <div class="d-flex align-items-center position-relative height-lg-100vh">
      <div class="col-lg-5 col-xl-4 d-none d-lg-flex align-items-center gradient-half-primary-v1 height-lg-100vh px-0">
        <div class="w-100 p-5">
			<div class="Big-logo">CAMP<small>admin</small></div>
        </div>
      </div>
    
      <div class="container">
        <div class="row no-gutters">
          <div class="col-md-8 col-lg-7 col-xl-6 offset-md-2 offset-lg-2 offset-xl-3 space-3 space-lg-0">
            <!-- Form -->
            <form class="js-validate mt-5" novalidate="novalidate" name="loginForm" action="/login" method="POST" class="my-login-validation">
              <!-- Title -->
              <div class="mb-7">
                <h2 class="h3 text-primary font-weight-normal mb-0">Welcome to <span class="font-weight-semi-bold">Camp</span></h2>
                <p>캠프어드민 관리자페이지</p>
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
                  <span class="small text-muted">최고 관리자를 위한 캠프어드민 </span>
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