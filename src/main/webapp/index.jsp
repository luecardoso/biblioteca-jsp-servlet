<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<fmt:setBundle basename="messages.messages_en_US" var="msg" />	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="index.titulo"  bundle="${msg}"/></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap-5.0.2-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-3.7.1-dist/jquery-3.7.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/publica/publica-nav.jsp"/>

	<div class="container">
		<div class="row">
			<div class="column">
				<h2 class="h1"><fmt:message key="index.header"  bundle="${msg}"/></h2>
			</div>
		</div>

	</div>
</body>
</html>