<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<fmt:setBundle basename="messages.messages_en_US" var="msg" />
	
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${pageContext.request.contextPath}/index.jsp"><fmt:message key="publica-nav.home"  bundle="${msg}"/></a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/publica?acao=novo"><fmt:message key="publica-nav.novo"  bundle="${msg}"/></a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/auth/admin?acao=listar"><fmt:message key="publica-nav.listar"  bundle="${msg}" /></a></li>
			</ul>
		</div>
	</div>
</nav>