<%@ page import="bDUB.ShoppingList.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="createPage">
			<g:img dir="images" file="shopping-list.jpg" />
			<g:navBar home="true" listlabel="Shopping List" entity="${entityName}"/>
	
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="flashMessage">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${productInstance}">
				<ul>
					<g:eachError bean="${productInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="save" >
				<div class="formFieldArea">
					<g:render template="form"/>
				</div>
				<div class="formButtonArea">
					<g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
				</div>
			</g:form>
		</div>
	</body>
</html>
