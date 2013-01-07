package bDUB.ShoppingList

class Product {
	
	String productName
	int quantity
	
    static constraints = {
		productName (blank:false)
		quantity (blank:false)
    }
}