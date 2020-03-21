<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<script>
function openTree(obj){
	$(".treeview-menu").stop().slideUp();
	$(obj).parent().find("ul").stop().slideDown();
}
</script>
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/default-user.png" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Camp Super Admin</p>
				<!-- Status -->
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<ul class="sidebar-menu tree" data-widget="tree" id="leftMenuUl">
			<li class="header">MENU</li>
			<c:set var="cnt" value="1" />
			<c:forEach items="${leftMenuList }" var="item" varStatus="status">
				<c:choose>
					<c:when test="${item.menuLevel eq '2' && item.childCnt eq '0'}">
						<li <c:if test="${fn:indexOf(leftMenuCode, item.menuCode) != -1 }">class="active"</c:if>>
							<a href="#" onclick="javascript: menuMove('${item.menuUrl }', '${item.parentCode}', '${item.menuCode}')">
<%-- 								${item.menuUrl }?topMenu=${item.parentCode} --%>
								<i class="${item.iconName }"></i>
								<span>${item.menuName }</span>
							</a>
						</li>
					</c:when>
					
					<c:when test="${item.menuLevel eq '2' && item.childCnt ne '0'}">
						<c:set var="cnt" value="1" />
						<li class="treeview <c:if test="${fn:indexOf(leftMenuCode, item.menuCode) != -1 }">active menu-open</c:if>">
			    			<a href="#" onclick="javascript: openTree(this)"><i class="${item.iconName }"></i> <span>${item.menuName }</span>
		    					<span class="pull-right-container">
		    				    	<i class="fa fa-angle-left pull-right"></i>
		    				    </span>
		    				</a>
		    				<ul class="treeview-menu" <c:if test="${fn:indexOf(leftMenuCode, item.menuCode) != -1 }">style="display:block;"</c:if>>
					</c:when>
					<c:when test="${item.menuLevel eq '3' && item.parentChildCnt ne cnt}">
								<c:set var="cnt" value="${cnt+1 }" />
								<li <c:if test="${fn:indexOf(leftMenuCode, item.menuCode) != -1 }">class="active menu-open"</c:if>>
									<a href="#" onclick="javascript: menuMove('${item.menuUrl }', '${item.grandParentCd}', '${item.menuCode}')">
										<span>${item.menuName }</span></a>
<%-- 								${item.menuUrl }?topMenu=${item.grandParentCd} --%>
								</li>
					</c:when>
					<c:when test="${item.menuLevel eq '3' && item.parentChildCnt eq cnt }" >
								<c:set var="cnt" value="1" />
								<li <c:if test="${fn:indexOf(leftMenuCode, item.menuCode) != -1 }">class="active menu-open"</c:if>>
									<a href="#" onclick="javascript: menuMove('${item.menuUrl }', '${item.grandParentCd}', '${item.menuCode}')"> <span>${item.menuName }</span></a>
<%-- 								${item.menuUrl }?topMenu=${item.grandParentCd} --%>
								</li>
							</ul>
		            	</li>
					</c:when>					
				</c:choose>
			</c:forEach>
		</ul>
	</section>

<form id="menuMoveFrm" action="" method="post">
	<input type="hidden" name="topMenu">
	<input type="hidden" name="leftMenuCode">
</form>