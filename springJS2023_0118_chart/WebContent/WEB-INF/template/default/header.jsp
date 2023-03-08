<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div class="d-flex flex-row-reverse mybgColor">
	<div class="p-2 bg-info">
		<a href="#" class="nav-link text-white" id="item1">Flex item 1</a>
	</div>
	<c:choose>
		<%-- �α��� ������ �� --%>
		<c:when test="${sessionScope.sessionID == null}">
			<div class="p-2 bg-warning">
				<a href="${pageContext.request.contextPath}/web/login/loginForm"
					class="nav-link text-white" id="item2">�α���</a>
			</div>
			<div class="p-2 bg-primary">
				<a href="${pageContext.request.contextPath}/web/member/memberForm"
					class="nav-link text-white" id="item3">ȸ������</a>
			</div>
		</c:when>
		<%-- �α��� ���� �� --%>
		<c:when test="${sessionScope.sessionID != null}">
			<div class="p-2 bg-info">
				<a href="#" class="nav-link text-white" id="item1">${sessionScope.id}</a>
			</div>
			<div class="p-2 bg-warning">
				<a href="${pageContext.request.contextPath}/web/login/logout"
					class="nav-link text-white" id="item2">�α׾ƿ�</a>
			</div>
			<div class="p-2 bg-warning">
				<a href="${pageContext.request.contextPath}/web/login/mypage"
					class="nav-link text-white" id="item3">MyPage</a>
			</div>
			<%-- �α��� �ߴµ� id�� admin�� ��
                    <c:if test="${sessionScope.sessionID == 'admin'}">
                        <div class="p-2 bg-primary">
                            <a href="${pageContext.request.contextPath}/web/member/memberList" class="nav-link text-white">ȸ������Ʈ</a>
                        </div>
                    </c:if>
                     --%>
		</c:when>
	</c:choose>
</div>