<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="box" style="margin: 1%">
	<div class="box-header">
	  	<h3 class="box-title">공지사항</h3>
	</div>
	<div class="box-body">
		<span>제목 : ${detailMap.title} </span>
		<div style="text-align: left;">
			${detailMap.description}
		</div>
	</div>
</div>