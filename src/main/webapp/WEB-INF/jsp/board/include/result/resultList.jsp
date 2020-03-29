<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="box-header">
  	<h3 class="box-title">리스트</h3>
</div>
<div class="box-body">
	<table id="memberTable" class="table table-hover">
		<thead>
	 		<tr role="row">
			 	<th class="sorting text-center" width="5%"	>ID</th>
			 	<th class="sorting text-center" width="*"	>제목</th>
			 	<th class="sorting text-center" width="10%" >작성자</th>
			 	<th class="sorting text-center" width="15%" >작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test = "${boardList.size() > 0}">
					<c:forEach items="${boardList }" var="item" varStatus="idx" >
						<tr role="row">
						    <td class="sorting text-center">${idx.index + 1}</td>
						    <td class="sorting text-center" onclick="detail('${item.id}','${item.boardtype}')" style="cursor: pointer;">${item.title }</td>
						    <td class="sorting text-center">${item.createuser} </td>
						    <td class="sorting text-center">${item.createdate} </td>
						</tr>
					</c:forEach>
	         	</c:when>
	         	<c:otherwise>
	           		<tr role="row">
	           			<td colspan="9" class="sorting text-center">데이터가 없습니다.</td>
	           		</tr>
	         	</c:otherwise>
	      	</c:choose>
		</tbody>
	</table>
</div>

<!-- pagination -->
<div id="pagination">		
	<%@include  file="../../../pagination.jsp" %>
</div>
