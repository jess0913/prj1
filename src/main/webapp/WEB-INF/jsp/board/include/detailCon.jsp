<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.badge {
   animation: blink-animation 1s steps(5, start) 10 alternate;
   -webkit-animation: blink-animation 1s steps(5, start) 10 alternate;
}
@keyframes blink-animation {
   from {
       visibility: visibility;
   }
   to {
       visibility: hidden;
   }
}
@-webkit-keyframes blink-animation {
   from {
       visibility: visibility;
   }
   to {
       visibility: hidden;
   }
}
</style>
<div class="box" style="margin: 1%">
	<div class="box-header">
	  	<h3 class="box-title">자료실</h3>
	</div>
	<hr>
	<div class="badge">
		<h4>${detailMap.title} </h4>
		<div style="text-align: left;">
			${detailMap.description}
		</div>
		<div style="text-align: left;">
			<i class="fa fa-floppy-o"></i><a href="${detailMap.fileurl}">${detailMap.filename}</a>
		</div>
	</div>
</div>