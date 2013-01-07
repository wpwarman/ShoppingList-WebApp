<%@ page import="bDUB.ShoppingList.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="editPage">
			<g:img dir="images" file="shopping-list.jpg" />
			<g:navBar home="true" listlabel="Shopping List" newproduct="true" entity="${entityName}"/>
	
	
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${productInstance?.id}" />
				<g:hiddenField name="version" value="${productInstance?.version}" />
				<div class="formFieldArea">
					<g:render template="form"/>
				</div>
				<div class="formButtonArea">
					<g:actionSubmit action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
	</body>
</html>