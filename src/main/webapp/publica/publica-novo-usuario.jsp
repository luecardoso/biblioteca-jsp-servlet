<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Novo Usuário</title>
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
			<h1>Novo Usuário</h1>
			
			<!-- MENSAGEM USUÁRIO SALVO-->
			<c:if test="${mensagem !=null}">
				<div class="alert alert-success alert-dismissible fade show">
					<button type="button" class="btn-close" data-bs-dismiss></button>
					<span><c:out value="${mensagem}"/></span>
				</div>
			</c:if>
			
			
			
			<div class="col-md-6">
				<label for="inputNome" class="form-label">Nome</label> <input
					name="nome" type="text" class="form-control" id="inputNome"
					placeholder="Nome Completo">
			</div>
			<div class="col-md-6">
				<label for="inputCPF" class="form-label">CPF</label> <input
					name="cpf" type="text" class="form-control" id="inputCPF"
					placeholder="xxx.xxx.xxx-xx">
			</div>
			<div class="col-md-6">
				<label for="inputNascimento" class="form-label">Nascimento</label> <input
					name="nascimento" type="date" class="form-control"
					id="inputNascimento">
			</div>
			<div class="col-md-6">
				<label for="inputEmail" class="form-label">Email</label> <input
					name="email" type="email" class="form-control" id="inputEmail">
			</div>
			<div class="col-md-6">
				<label for="inputLogin" class="form-label">Login</label> <input
					name="login" type="text" class="form-control" id="inputLogin">
			</div>
			<div class="col-md-6">
				<label for="inputSenha" class="form-label">Senha</label> <input
					name="senha" type="password" class="form-control" id="inputSenha">
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form>
	</div>
</body>
</html>