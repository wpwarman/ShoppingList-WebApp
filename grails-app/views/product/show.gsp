
<%@ page import="bDUB.ShoppingList.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="showPage">
			<g:img dir="images" file="shopping-list.jpg" />
			<g:navBar home="true" listlabel="Shopping List" newproduct="true" entity="${entityName}"/>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="flashMessage">${flash.message}</div>
			</g:if>
			<ul class="showProductList">
				<g:if test="${productInstance?.productName}">
					<li>
						<span class="fieldlabel"><g:message code="product.productName.label" default="Product Name" /></span>
						<g:fieldValue bean="${productInstance}" field="productName"/>
					</li>
				</g:if>
				<g:if test="${productInstance?.quantity}">
					<li>
						<span class="fieldlabel"><g:message code="product.quantity.label" default="Quantity" /></span>
						<g:fieldValue bean="${productInstance}" field="quantity"/>
					</li>
				</g:if>		
			</ul>
			<g:form>
				<g:hiddenField name="id" value="${productInstance?.id}" />
				<div class="formButtonArea">
					<g:actionSubmit action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
					<g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
	</body>
</html>