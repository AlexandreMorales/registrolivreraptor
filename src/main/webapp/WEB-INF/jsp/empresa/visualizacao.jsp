<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="iso-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta charset="iso-8859-1" />
<link href="../assets/css/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/main.css" rel="stylesheet">
<link href="../assets/css/botao-pdf.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="../assets/js/jquery.mask.min.js"></script>	
<script src="../assets/js/visualizacao.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/includes/cabecalho.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-8 col-lg-offset-3 col-md-offset-2">
				<c:if test="${mensagem != null}">
	    			<div class="alert alert-success alert-dismissible" role="alert">
					  	<button type="button" class="close" id="close" data-dismiss="alert">
				  			<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				  		</button>
					  	<strong>${mensagem}</strong> 
					</div>
	    		</c:if>
				<div class="panel panel-default margin-35-0">
					<div class="panel-heading centralize">
						<h4>Visualiza��o de Empresa</h4>
					</div>
					<div class="panel-body">

						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-9 col-xs-9">
								<dl>
									<dt>CNPJ:</dt>
									<span id="cnpj" >${empresa.cnpj}</span>
								</dl>
								<dl>
									<dt>Nome fantasia:</dt> 
									<dd>${empresa.nomeFantasia}</dd>
								</dl>
								<dl>
									<dt>Raz�o Social:</dt> 
									<dd>${empresa.razaoSocial}</dd>
								</dl>
							</div>

							  
							<div class="col-lg-4 col-md-4 col-sm-2 col-xs-3">
								<a href="${empresa.url}" download>
									<img style="float:right; margin-right:12%; width:50%;" src="../assets/img/PDF_icon.png" />
									<label style="float: right; font-size:95%;">Download de PDF</label>
								</a>
							</div>

						</div>

						<dl>
							<dt>Endere�o:</dt> 
							<dd>${empresa.endereco.logradouro}</dd>
						</dl>
						<dl>
							<dt>N�mero:</dt>
							<dd>${empresa.endereco.numero}</dd>
						</dl>
						<dl>
							<dt>Complemento:</dt>
							<dd>${empresa.endereco.complemento}</dd>
						</dl>

						<dl>
							<dt>Cidade:</dt>
							<dd>${empresa.endereco.cidade}</dd>
						</dl>
						<dl>
							<dt>Estado:</dt> 
							<dd>${empresa.endereco.uf}</dd>
						</dl>

						<dl>
							<dt>CEP:</dt>
							<dd>${empresa.endereco.cep}</dd>
						</dl>

						<dl>
							<dt>Data de abertura:</dt>
							<dd>
								<fmt:formatDate value="${empresa.dataCriacao.time}" pattern="dd/MM/yyyy"  />
							</dd>							
						</dl>

						<dl>
							<dt>Emiss�o de documento:</dt>						
							<dd>
								<fmt:formatDate value="${empresa.dataEmissaoDocumento.time}" pattern="dd/MM/yyyy"  />
							</dd>
						</dl>					
					
						<h4 class="centralize panel-divider padding-6-0 margin-30-0">Estrutura Societ�ria</h4>
					

						<c:choose>
						
							<c:when test="${empresa.socios.size() == 0}">
								<div class="centralize">Sem s�cios cadastrados.</div>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${empresa.socios}" var="socio">
									<dl>
										<dd>Nome: </dd>
										<dd>${socio.nome}</dd>
										<dd>CPF:</dd>
										<span id="cpf" >${socio.cpf}</span>
										<dd>
											<c:if test="${socio.ativo == true}">
												<span class="label label-success">Ativo</span>
											</c:if>
											<c:if test="${socio.ativo == false}">
												<span class="label label-danger">Inativo</span>
											</c:if>
										</dd>
									</dl>
								</c:forEach>
							</c:otherwise>
							
						</c:choose>

					</div>

					<div class="panel-footer">
						<a class="btn btn-default" href="/listagem">Voltar</a>
						<a href="/atualizar/${empresa.id}" id="btn-submit" class="btn btn-primary pull-right margin-0-6" >Editar</a>
						<div style="clear: both"></div>
					</div>
					<!-- panel -->
				</div>
				<!-- col -->
			</div>
			<!-- row -->
		</div>
		</div>
		<!-- container -->
</body>
</html>