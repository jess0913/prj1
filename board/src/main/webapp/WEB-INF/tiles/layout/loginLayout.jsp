<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <script type='text/javascript' src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
    <![endif]-->
	<title><tiles:insertAttribute name="title" ignore="true" /></title>
	
	<link href="<c:url value='/css/bootstrap.min.css' />"	 rel="stylesheet"></link>
	<link href="<c:url value='/css/font-awesome.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/ionicons.min.css' />" 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/AdminLTE.css' />" 	 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/skin-purple.min.css'/>" 	 rel="stylesheet"></link>
	<link href="<c:url value='/css/rubig.css'/>" 			 rel="stylesheet"></link>
	
	<script src="<c:url value='/js/jquery-3.2.1.min.js' />"></script>
	<script src="<c:url value='/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/js/adminlte.min.js' />"></script>
</head>

<body class="skin-purple sidebar-mini" style="height: auto; min-height: 100%;" >
	<header id="header" class="main-header">
		<tiles:insertAttribute name="header" ignore="true"/>
	</header>

	<section id="site-content" style="min-height: 70%; align-content: center;">
		<tiles:insertAttribute name="body" />
	</section>

</body>
</html>