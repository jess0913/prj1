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
<style type="text/css">
.parent {
  align-items: center;
	width: 100%;
	height: 100vh;
}
.child {
  margin: auto;
  width: 100%;
  height: 46vh;
  text-align: center;
}
.child2 {
  margin: auto;
  width: 50%;
  height: 46vh;
  text-align: center;
}
</style>
</head>

<body class="sidebar-mini skin-purple-light fixed">
<div class="parent">
<div class="child">
a
</div>
<div class="child2">
b
</div>
<div class="child2">
c
</div>
</div>
</body>
<script>

</script>
</html>