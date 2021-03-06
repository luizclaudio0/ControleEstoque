<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="produto" class="br.com.ifpe.estoque.model.Produto" />
<jsp:useBean id="dao" class="br.com.ifpe.estoque.model.ProdutoDao" />
</head>
<body style="margin-left: 5%; margin-right: 5%;">
	<hr>
	<c:import url="index.jsp" />
	<hr>
	<h3>Filtro Produtos</h3>
	<hr>
	<div>
		<form action="filter">
			<div class="form-group">
				<label for="inputCodigo">C�digo</label> <input type="text"
					id="inputCodigo" class="form-control" name="codigo"
					style="width: 100px;" maxlength="5" />
			</div>
			<div class="form-group">
				<label for="inputDescricao">Descri��o</label> <input type="text"
					id="inputDescricao" class="form-control" name="descricao"
					style="width: 500px;" maxlength="100" />
			</div>
			<div class="form-group">
				<button type="reset" class="btn btn-default">&nbsp; Limpar
					&nbsp;</button>
				&nbsp;
				<button type="submit" class="btn btn-primary">&nbsp;
					Filtrar &nbsp;</button>
			</div>
		</form>
	</div>
	<h3>Listar Produtos</h3>

	<table id="tabelaListaProduto"
		class="table table-striped table-bordered" border="1">

		<thead>
			<tr>
				<th style="width: 5%; vertical-align: middle; text-align: center;">C�digo</th>
				<th style="width: 25%; vertical-align: middle;">Descri��o</th>
				
				<th style="width: 25%; vertical-align: middle;">Pre�o Custo</th>
				<th style="width: 25%; vertical-align: middle;">Pre�o Venda</th>
				<th style="width: 25%; vertical-align: middle;">Garantia</th>
				<th style="width: 25%; vertical-align: middle;">Imagem</th>
				
				<th style="width: 25%; vertical-align: middle;">A��es</th>
			</tr>
		</thead>
		<c:forEach var="produto" items="${listaProduto}">
			<tr>
				<td style="vertical-align: middle; text-align: center;">${produto.codigo}</td>

				<td style="vertical-align: middle; text-align: center;"><c:choose>
						<c:when test="${not empty produto.descricao}">
							${produto.descricao}
						</c:when>
						<c:otherwise>
							Descri��o n�o informada.
						</c:otherwise>
					</c:choose></td>
					
				<td style="vertical-align: middle; text-align: center;">${produto.precoCusto}</td>
				<td style="vertical-align: middle; text-align: center;">${produto.precoVenda}</td>
				<td><fmt:formatDate value="${produto.garantia}"
						pattern="dd/MM/yyyy" /></td>
				<td style="width: 25%; vertical-align: middle;">${produto.imagem}</td>

				<td style="vertical-align: middle; text-align: center;"><a
					href="edit?id=${produto.id}">Alterar</a> &nbsp; &nbsp;<br>
					<a href="delete?id=${produto.id}">Remover</a> &nbsp; &nbsp;
					</td>
			</tr>
		</c:forEach>
		<c:forEach var="CategoriaProduto" items="${listarCategoriaProduto}">
						<td style="vertical-align: middle; text-align: center;">${CategoriaProduto.descricao}</td>
					</c:forEach>
		</tr>
	</table>
</body>
</html>