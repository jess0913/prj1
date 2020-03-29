<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="box">
	<div class="box-header">
	  	<h3 class="box-title"><a href="list?boardType='CONTENTS'">자료실</a></h3>
	</div>
	<div class="box-body">
		<ul>
			<c:forEach items="${contentsList }" var="item" >
				<li><a style="cursor: pointer;" onclick="detailContent('${item.id }')">${item.title }</a></li>
			</c:forEach>
		</ul>
	</div>
</div>