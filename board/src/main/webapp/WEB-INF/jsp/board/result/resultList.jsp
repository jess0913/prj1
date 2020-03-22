<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="box-header">
  	<h3 class="box-title">리스트</h3>
</div>
<div class="box-body table-responsive">
	<table id="memberTable" class="table table-hover">
		<colgroup>
			<col width="5%">
			<col width="10%">
			<col width="*">
			<col width="10%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
	 		<tr role="row">
			 	<th class="sorting text-center">ID</th>
			 	<th class="sorting text-center">타입</th>
			 	<th class="sorting text-center">제목</th>
			 	<th class="sorting text-center">작성자</th>
			 	<th class="sorting text-center">작성일</th>
			 	<th class="sorting text-center">관리</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test = "${boardList.size() > 0}">
					<c:forEach items="${boardList }" var="item" varStatus="idx" >
						<tr role="row">
						    <td class="sorting text-center">${idx.index + 1}</td>
						    <td class="sorting text-center">
						    	<c:if test="${item.boardType eq 'NOTI' }">공지사항</c:if>
						    	<c:if test="${item.boardType eq 'CONTENTS'}">자료실</c:if>
						    </td>
						    <td class="sorting text-center">${item.title }</td>
						    <td class="sorting text-center" onclick="detail('${item.id}','${item.boardType}')" style="cursor: pointer;">${item.title }</td>
						    <td class="sorting text-center">${item.createUser} </td>
						    <td class="sorting text-center">${item.createDate} </td>
						    <td class="sorting text-center">
					    		<button type="button" class="btn btn-primary" onclick="update('${item.id}','${item.boardType}')">수정</button>
					        	<button type="button" class="btn btn-danger" onclick="delete('${item.id}','${item.boardType}')">삭제</button>
							</td>
						</tr>
						<c:set var="rowIdx" value="${rowIdx-1 }"></c:set>
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
	<%@include  file="../../pagination.jsp" %>
</div>
