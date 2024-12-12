<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<fmt:setBundle basename="messages.messages_en_US" var="msg" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="auth.admin.titulo"  bundle="${msg}"/></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap-5.0.2-dist/css/bootstrap.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-3.7.1-dist/jquery-3.7.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/publica/publica-nav.jsp" />

	<div class="container">
		<div class="row">
			<h2><fmt:message key="auth.admin.header"  bundle="${msg}"/></h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th><fmt:message key="auth.admin.id"  bundle="${msg}"/></th>
						<th><fmt:message key="auth.admin.nome"  bundle="${msg}"/></th>
						<th><fmt:message key="auth.admin.cpf"  bundle="${msg}"/></th>
						<th><fmt:message key="auth.admin.nascimento"  bundle="${msg}"/></th>
						<th><fmt:message key="auth.admin.email"  bundle="${msg}"/></th>
						<th><fmt:message key="auth.admin.status"  bundle="${msg}"/></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="usuario" items="${listaUsuarios}">
						<tr>
							<td><c:out value="${usuario.id}" /></td>
							<td><c:out value="${usuario.nome}" /></td>
							<td><c:out value="${usuario.cpf}" /></td>
							<td>
								<fmt:formatDate value='${usuario.nascimento}'
									type='date' pattern='dd/MM/yyyy' />
							</td>
							<td><c:out value="${usuario.email}" /></td>
							<td>
								<span><c:out value="${usuario.ativo=='true' ? 'ATIVO' : 'INATIVO' }" /> </span>
							</td>
							
							
							<!-- BOTÃO APAGAR-->
							<td>
								<a class="btn btn-outline-danger btn-sm"
									onclick="return confirm('Você deseja apagar?');"
									href="${pageContext.request.contextPath}/auth/admin?acao=apagar&id=<c:out value="${usuario.id}" />"
									>
									<fmt:message key="auth.admin.apagar"  bundle="${msg}"/>
								</a>
							
							</td>
							
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>