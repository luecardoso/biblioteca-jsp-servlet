<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<fmt:setBundle basename="messages.messages_en_US" var="msg" />
<fmt:setLocale value="en_US" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="publica-novo-usuario.titulo"  bundle="${msg}"/></title>
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
		<form class="row g-3" 
			action="${pageContext.request.contextPath}/publica?acao=salvar" 
			method="post">
			<h1><fmt:message key="publica-novo-usuario.cadastro"  bundle="${msg}"/></h1>
			
			<!-- MENSAGEM USUÁRIO SALVO-->
			<c:if test="${mensagem !=null}">
				<div class="alert alert-success alert-dismissible fade show">
					<button type="button" class="btn-close" data-bs-dismiss aria-label="close"></button>
					<span><c:out value="${mensagem}"/></span>
				</div>
			</c:if>
			
			
			
			<div class="col-md-6">
				<label for="inputNome" class="form-label"><fmt:message key="publica-novo-usuario.nome"  bundle="${msg}"/></label> <input
					name="nome" type="text" class="form-control" id="inputNome"
					placeholder="Nome Completo">
			</div>
			<div class="col-md-6">
				<label for="inputCPF" class="form-label"><fmt:message key="publica-novo-usuario.cpf"  bundle="${msg}"/></label> <input
					name="cpf" type="text" class="form-control" id="inputCPF"
					placeholder="xxx.xxx.xxx-xx">
			</div>
			<div class="col-md-6">
				<label for="inputNascimento" class="form-label"><fmt:message key="publica-novo-usuario.nascimento"  bundle="${msg}"/></label> <input
					name="nascimento" type="date" class="form-control"
					id="inputNascimento">
			</div>
			<div class="col-md-6">
				<label for="inputEmail" class="form-label"><fmt:message key="publica-novo-usuario.email"  bundle="${msg}"/></label> <input
					name="email" type="email" class="form-control" id="inputEmail">
			</div>
			<div class="col-md-6">
				<label for="inputLogin" class="form-label"><fmt:message key="publica-novo-usuario.login"  bundle="${msg}"/></label> <input
					name="login" type="text" class="form-control" id="inputLogin">
			</div>
			<div class="col-md-6">
				<label for="inputSenha" class="form-label"><fmt:message key="publica-novo-usuario.senha"  bundle="${msg}"/></label> <input
					name="senha" type="password" class="form-control" id="inputSenha">
			</div>
			<button type="submit" class="btn btn-primary"><fmt:message key="publica-novo-usuario.botao.registrar"  bundle="${msg}"/></button>
		</form>
	</div>
</body>
</html>