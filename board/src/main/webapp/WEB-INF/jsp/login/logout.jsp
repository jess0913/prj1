<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--defaultTemplate를 적용할 때 템플릿의 title, body 영역은 여기에서 오버라이드한다 --%>
<tiles:insertDefinition name="base-definition">
    <tiles:putAttribute name="title">로그인</tiles:putAttribute>
    <tiles:putAttribute name="body">
    
    
    <c:url value="/logout" var="logoutUrl" />
	<!-- csrt for log out-->
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<form action="${logoutUrl}" method="post" id="logoutForm">
			<span style="color: gray;"><h5>
					${username} 님 반갑습니다. <a href="javascript:formSubmit()"> 로그아웃 </a>
				</h5></span>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>

	</tiles:putAttribute>
</tiles:insertDefinition>