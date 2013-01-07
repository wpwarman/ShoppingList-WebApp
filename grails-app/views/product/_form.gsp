<%@ page import="bDUB.ShoppingList.Product" %>

<div class="${hasErrors(bean: productInstance, field: 'productName', 'error')}">
	<label for="productName" class="fieldlabel">
		<g:message code="product.productName.label" default="Product Name" />
		*
	</label>
	<g:textField name="productName" required="" value="${productInstance?.productName}"/>
</div>
<div class="${hasErrors(bean: productInstance, field: 'quantity', 'error')}">
	<label for="quantity" class="fieldlabel">
		<g:message code="product.quantity.label" default="Quantity" />
		*
	</label>
	<g:field type="number" name="quantity" required="" value="${fieldValue(bean: productInstance, field: 'quantity')}"/>
</div>

