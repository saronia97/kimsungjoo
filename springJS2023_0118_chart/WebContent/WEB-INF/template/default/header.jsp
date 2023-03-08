<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div class="d-flex flex-row-reverse mybgColor">
	<div class="p-2 bg-info">
		<a href="#" class="nav-link text-white" id="item1">Flex item 1</a>
	</div>
	<c:choose>
		<%-- 로그인 안했을 때 --%>
		<c:when test="${sessionScope.sessionID == null}">
			<div class="p-2 bg-warning">
				<a href="${pageContext.request.contextPath}/web/login/loginForm"
					class="nav-link text-white" id="item2">로그인</a>
			</div>
			<div class="p-2 bg-primary">
				<a href="${pageContext.request.contextPath}/web/member/memberForm"
					class="nav-link text-white" id="item3">회원가입</a>
			</div>
		</c:when>
		<%-- 로그인 했을 때 --%>
		<c:when test="${sessionScope.sessionID != null}">
			<div class="p-2 bg-info">
				<a href="#" class="nav-link text-white" id="item1">${sessionScope.id}</a>
			</div>
			<div class="p-2 bg-warning">
				<a href="${pageContext.request.contextPath}/web/login/logout"
					class="nav-link text-white" id="item2">로그아웃</a>
			</div>
			<div class="p-2 bg-warning">
				<a href="${pageContext.request.contextPath}/web/login/mypage"
					class="nav-link text-white" id="item3">MyPage</a>
			</div>
			<%-- 로그인 했는데 id가 admin일 때
                    <c:if test="${sessionScope.sessionID == 'admin'}">
                        <div class="p-2 bg-primary">
                            <a href="${pageContext.request.contextPath}/web/member/memberList" class="nav-link text-white">회원리스트</a>
                        </div>
                    </c:if>
                     --%>
		</c:when>
	</c:choose>
</div>