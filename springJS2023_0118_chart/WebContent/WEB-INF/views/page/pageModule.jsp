<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Start! --%>
<c:set var="pageurl" value="?cPage" />
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
	<c:choose>
		<c:when test="${startPage <= pagePerBlock}">
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1" aria-disabled="true">Previous</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link"
				href="${pageurl}=${startPage - 1}">Previous</a></li>
		</c:otherwise>
	</c:choose>

	<c:forEach varStatus="i" begin="${startPage}" end="${endPage}" step="1">
		<c:choose>
			<c:when test="${i.index == nowPage}">
				<li class="page-item active" aria-current="page"><a
					class="page-link" href="${pageurl}=${i.index}">${i.index}</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="${pageurl}=${i.index}">${i.index}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${endPage >= totalPage}">
			<li class="page-item disabled"><a class="page-link"
				aria-disabled="true" href="#">Next</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link"
				href="${pageurl}=${endPage + 1}">Next</a></li>
		</c:otherwise>
	</c:choose>
<%-- End ! --%>
	</ul>
</nav>