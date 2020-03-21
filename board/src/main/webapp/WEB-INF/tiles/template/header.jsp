<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
 
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <script type='text/javascript' src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
<![endif]-->
	
<!-- Logo -->
    <a href="/home" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>C</b>amp</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Camp</b>admin</span>
    </a>

	<!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
	
	<!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>
	
	<!-- header 메뉴 -->
	<div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <!-- 메뉴 로딩 -->
			<c:forEach items="${headerMenuList }" var="item">
			<li class="dropdown user user-menu">
				<a  href="#" onclick="javascript: menuMove('${item.menuUrl }', '${item.menuCode}', '')"> 
<%-- 				href="${item.menuUrl }?topMenu=${item.menuCode}" --%>
					<i class="${item.iconName }"></i>
					<span class="hidden-xs"><c:out value="${item.menuName}" /></span>
			    </a>
			</li>	
			</c:forEach>
			<!-- 메뉴 로딩 -->	
		</ul>
          
            <form action="/logout" method="post" id="logoutForm">
			<a class="btn navbar-btn btn-primary pull-right" href="javascript:formSubmit()" style="margin-right:10px;"><span >logout</span></a>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
      </div>
      
      
	
	
	
</nav>
