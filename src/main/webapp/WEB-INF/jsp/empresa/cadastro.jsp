<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="iso-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<meta charset="iso-8859-1" />
	<title>Cadastro de Empresa</title>
	<link href="/assets/css/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/assets/css/main.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="/assets/js/adiciona-socios.js" charset="utf-8"></script>
</head>
	<body>
	<jsp:include page="/WEB-INF/jsp/includes/cabecalho.jsp" />
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3">
				
				<c:forEach items="${errors}" var="error">
	    			<div class="alert alert-danger alert-dismissible" role="alert">
  						${error.message}
					</div>
				</c:forEach>
				
				<c:if test="${erro} != null">
					<div class="alert alert-danger alert-dismissible" role="alert">
						${erro}
					</div>
				</c:if>
				
				<div class="panel panel-default margin-35-0">
						
						<div class="panel-heading centralize">
							<c:choose>
								<c:when test="${editar != null}">
									<h2>Editar Empresa</h2>
								</c:when>
								<c:otherwise>
									<h2>Cadastrar Empresa</h2>
								</c:otherwise>
							</c:choose>										
						</div>
						

						<form class="form" name="formulario" action="/empresa/cadastrar/${empresa.id}" method="POST" onsubmit="return validarCadastro('${editar}');" enctype="multipart/form-data">

							<div class="panel-body">
								
								<div class="list-group-item-heading centralize">
									<h4>Dados da empresa</h4>
								</div>
										
								<div class="form-group has-feedback" id="cnpj-group">
									<label class="control-label">CNPJ <abbr title="Preenchimento obrigat�rio">*</abbr></label>
									<input class="form-control" type="text" name="empresa.cnpj" id="cnpj" value="${empresa.cnpj}" placeholder="ex: 00.000.000/0000-00" required/>
									<span class="glyphicon form-control-feedback"></span>
								</div>
							
								<div class="form-group has-feedback" id="nomeFantasia-group">
									<label class="control-label">Nome fantasia  <abbr title="Preenchimento obrigat�rio">*</abbr> </label>
									<input class="form-control" type="text" name="empresa.nomeFantasia" id="nomeFantasia" value="${empresa.nomeFantasia}" placeholder="ex: Larah Instrumentos Musicais" required/>
									<span class="glyphicon form-control-feedback"></span>
								</div>
							
								<div class="form-group">
									<label class="control-label">Raz�o Social</label>
									<input class="form-control" type="text" name="empresa.razaoSocial"placeholder="ex: Cia Larah Instrumentos Musicais LTDA" value="${empresa.razaoSocial}"/>
								</div>
							
								<div class="row">
									<div class="col-lg-9">
										<div class="form-group">
											<label class="control-label">Endere�o</label>
											<input class="form-control" type="text" name="empresa.endereco.logradouro" placeholder="ex: Av. Ipiranga" value="${empresa.endereco.logradouro}"/>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label class="control-label">N�mero</label>
											<input id="numero" class="form-control" type="text" name="empresa.endereco.numero" value="${empresa.endereco.numero}"/>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label">Complemento</label>
									<input class="form-control" type="text" name="empresa.endereco.complemento" value="${empresa.endereco.complemento}" placeholder="ex: Bloco A - apartamento 720"/>
								</div>
								
								<div class="row">
									<div class="col-lg-9">
										<div class="form-group">
											<label class="control-label">Cidade</label>
											<input class="form-control" type="text" name="empresa.endereco.cidade" value="${empresa.endereco.cidade}"/>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label class="control-label">Estado</label>			
											<select name="empresa.endereco.uf" class="form-control">
												<option value="RS">RS</option>
												<option value="SP">SP</option>
											</select>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label">CEP</label>
									<input id="cep" class="form-control" name="empresa.endereco.cep" type="text" value="${empresa.endereco.cep}" placeholder="000000-000"/>
								</div>
								
								<div class="row">
									<div class="col-lg-6 col-md-6">											
										<div class="form-group">
											<label class="control-label">Data de abertura</label>
											
											<fmt:formatDate value="${empresa.dataCriacao.time}" pattern="dd/MM/yyyy" var="dataCriacaoFormatada" />
											<input class="form-control date" name="empresa.dataCriacao" type="text" value="${dataCriacaoFormatada}" />
										</div>										
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label class="control-label">Emiss�o de documento</label>
											
											<fmt:formatDate value="${empresa.dataEmissaoDocumento.time}" pattern="dd/MM/yyyy" var="dataEmissaoDocumentoFormatada" />
											<input class="form-control date" name="empresa.dataEmissaoDocumento" id="dataEmissao" type="text" value="${dataEmissaoDocumentoFormatada}"/>
										</div>
									</div>

																
								</div>
									
								<div class="form-group">
									<label class="control-label">Upload de arquivo <abbr title="Preenchimento obrigatório">*</abbr></label>
									<c:choose>
										<c:when test="${editar != null}">
											<input name="empresa.url" type="text" value="${empresa.url}" hidden/>
											<br />
											<a class="form-group" href="${empresa.url}">Antigo Arquivo</a>
											<input id="file" class="form-group" type="file" name="arquivo"/>
										</c:when>
										<c:otherwise>
											<input id="file" class="form-group" type="file" name="arquivo" required/>
										</c:otherwise>
									</c:choose>										
									<span class="msg-alert color-red" id="file-alert">Tamanho m�ximo do arquivo: 5MB.</span>
								</div>		
								

								<div id="divSocios">
									<c:forEach items="${empresa.socios}" var="socio">
										<script> document.onLoad(adicionaSociosCadastrados("${socio.nome}", "${socio.cpf}", "${socio.ativo}")); </script>
									</c:forEach>								
								</div>
								
								
								<div class="form-group">
									
									<button type="button" class="btn btn-success pull-right margin-0-6" onclick="adicionaSocio()"><span class="glyphicon glyphicon-plus-sign"></span> Adicionar S�cio</button>
									<br>
								</div>								
								

							
							</div> <!-- panel-body -->
							
							<div class="panel-footer">									
								<span class="pull-left msg-alert color-red margin-15-0" id="form-alert">Preencha os campos corretamente para enviar.</span>
								<input type="submit" id="btn-submit" class="btn btn-lg btn-primary pull-right margin-0-6" value="Enviar"/>
								<input type="reset" value="Limpar" class="btn btn-default btn-lg pull-right margin-0-6"/>
								<div style="clear:both"></div>
							</div>	
									
						</form>
							
						
					</div> <!-- panel -->
				</div> <!-- col -->
			</div> <!-- row -->
		</div> <!-- container -->
		
	<script src="/assets/js/jquery.mask.min.js"></script>		
	<script src="/assets/js/validacao-logica-cadastro.js"></script>		
	<script src="/assets/js/validacao-visual-cadastro.js"></script>
		
	</body>
</html>