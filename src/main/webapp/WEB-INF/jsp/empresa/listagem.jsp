<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="iso-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta charset="iso-8859-1" />
	<link href="/assets/css/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/assets/css/main.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="/assets/js/listagem.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/includes/cabecalho.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3">
				<div class="panel panel-default margin-35-0">
	    			
					<div class="panel-heading">
						<h1>Lista de Empresas Cadastradas</h1>
						<select id="caixaDeSelecaoDecampo">
  							<option value="">Ordenar Por</option>
  							<option value="nomeFantasia">Nome Fantasia</option>
  							<option value="cnpj">CNPJ</option>
  							<option value="recentes">Mais Recentes</option>
						</select>
						<select id="caixaDeSelecaoCresc">
  							<option value="crescente">Crescente</option>
  							<option value="decrescente">Decrescente</option>
						</select>
					</div>

					<div class="list-group">
						<c:forEach items="${empresaList}" var="empresa">
							<div class="list-group-item">
								<h4 class="list-group-item-heading" title="Nome fantasia">
									<a class="a-color-black" href="/visualizacao/${empresa.id}">
										${empresa.nomeFantasia}
									</a>
								</h4>
								
								<p class="list-group-item-text">Endere�o: ${empresa.endereco.logradouro}</p>
								<p class="list-group-item-text">Emiss�o do Documento: <fmt:formatDate value="${empresa.dataEmissaoDocumento.time}" pattern="dd/MM/yyyy"  />
									
								</p>
							</div>
						</c:forEach>
					</div>

					<div class="panel-footer">
						<h4>Total de Registros: ${totalDeRegistros}</h4>
						<a href="/">
							<button class="btn btn-md btn-primary pull-right">Voltar
							</button>
						</a>
						<div style="clear: both"></div>
				
					</div>
				</div>	
			
				<div class="centralize">
					<ul class="pagination" style="margin:-25px 0 10px 0;">
						<li><a href="#">Primeira</a></li>
						<li><a href="#"> &laquo;</a></li>
						<li class="active"><a href="/listagem/1">1</a></li>
						<li><a href="2">2</a></li>
						<li><a href="3">3</a></li>
						<li><a href="4">4</a></li>
						<li><a href="5">5</a></li>
						<li><a href="6">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li><a href="#"> &raquo; </a></li>
						<li><a href="#">�ltima</a></li>
					</ul>
				</div>			
			</div> <!-- cow -->
		</div> <!-- row -->
	</div><!-- container -->
</body>
</html>