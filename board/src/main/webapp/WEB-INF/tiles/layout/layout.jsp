<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<!-- Common Jsp -->
<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<link href="<c:url value='/css/bootstrap.min.css' />"		rel="stylesheet"></link>
<link href="<c:url value='/css/font-awesome.min.css' />"	rel="stylesheet"></link>
<link href="<c:url value='/css/ionicons.min.css' />" 		rel="stylesheet"></link>
<link href="<c:url value='/css/skin-purple.min.css'/>" 		rel="stylesheet"></link>
<link href="<c:url value='/css/AdminLTE.css' />" 			rel="stylesheet"></link>
<link href="<c:url value='/css/rubig.css'/>" 				rel="stylesheet"></link>
<link href="<c:url value='/css/common.css'/>" 				rel="stylesheet"></link>
<link href="<c:url value='/css/bootstrap-datepicker.min.css'/>" rel="stylesheet"></link>
<link href="<c:url value='/css/bootstrap-datetimepicker.css'/>" rel="stylesheet"></link>

<script src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/js/adminlte.min.js' />"></script>

<!-- common js -->
<script src="<c:url value='/js/common.js' />"></script>
<style type="text/css">
.top-buffer { margin-top:20px; }
</style>
<script>
</script>

</head>

<body class="sidebar-mini skin-purple-light fixed">
	<!-- Loading Div Layer Start-->
    <div id="loading_pop" class="layer_pop" style="display: none;">
        <div class="load_popup" style="position:absolute;top:50%;left:50%;">
        <p><svg xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0" width="64px" height="64px" viewBox="0 0 128 128" xml:space="preserve"><g><path d="M75.4 126.63a11.43 11.43 0 0 1-2.1-22.65 40.9 40.9 0 0 0 30.5-30.6 11.4 11.4 0 1 1 22.27 4.87h.02a63.77 63.77 0 0 1-47.8 48.05v-.02a11.38 11.38 0 0 1-2.93.37z" fill="#ffffff" fill-opacity="1"/><animateTransform attributeName="transform" type="rotate" from="0 64 64" to="360 64 64" dur="1200ms" repeatCount="indefinite"></animateTransform></g></svg></p>
        <p>잠시만 기다려 주십시오</p>
        </div>
    </div>
    <!-- Loading Div Layer End-->
	<div class="wrapper">
		<header id="header" class="main-header bg-plum-plate">
			<tiles:insertAttribute name="header" />
		</header>
		<aside class="main-sidebar" id="sidemenu">
			<tiles:insertAttribute name="menu"/>
		</aside>
		
		<div id="site-content" class="content-wrapper">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
<script>

</script>
</html>