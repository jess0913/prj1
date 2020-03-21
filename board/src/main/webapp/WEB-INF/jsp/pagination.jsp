<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row text-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" onclick="goPage(${pageInfo.startPageIndex-1})" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
				</a>
			</li>
			<c:forEach var="i" begin="${pageInfo.startPageIndex}" end="${pageInfo.endPageIndex}" step="1">
				<li class="page-item"><a class="page-link" onclick="goPage(${i})">${i}</a></li>
			</c:forEach>
		  
			<li class="page-item">
				<a class="page-link" onclick="goPage(
					<c:choose>
						<c:when test="${pageInfo.totalPageCnt > pageInfo.endPageIndex}">
							${pageInfo.endPageIndex+1}
						</c:when>
						<c:otherwise>
							-1
						</c:otherwise>
					</c:choose>
					)" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
		</ul>
	</nav>
</div>