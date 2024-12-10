<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Usuários</title>
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
			<h2>Lista de Usuários</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nome</th>
						<th>CPF</th>
						<th>Data Nasc.</th>
						<th>Email</th>
						<th>Status</th>
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
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>