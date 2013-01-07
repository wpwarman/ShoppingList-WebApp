
<%@ page import="bDUB.ShoppingList.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="listPage">
			<g:img dir="images" file="shopping-list.jpg" />
			<g:navBar home="true" newproduct="true" entity="${entityName}"/>
			
			<h1>My Shopping List</h1>
			<g:if test="${flash.message}">
				<div class="flashMessage">${flash.message}</div>
			</g:if>
			<table class="productList">
				<thead>
					<tr>					
						<g:sortableColumn property="productName" title="${message(code: 'product.productName.label', default: 'Product Name')}" />					
						<g:sortableColumn property="quantity" title="${message(code: 'product.quantity.label', default: 'Quantity')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "productName")}</g:link></td>					
						<td>${fieldValue(bean: productInstance, field: "quantity")}</td>					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
