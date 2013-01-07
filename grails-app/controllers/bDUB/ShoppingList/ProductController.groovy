package bDUB.ShoppingList

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.XML

class ProductController {
	
	def scaffold = true;

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }
	
	def listREST() {
		def productInstance = Product.get(params.id)
		if(!productInstance)
		{		
			def productInstanceList = Product.list(params)
			render productInstanceList as XML
		}
		else
		{
			render productInstance as XML
		}
    }

    def create() {
        [productInstance: new Product(params)]
    }

    def save() {
        def productInstance = new Product(params)
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [productInstance.productName])
        redirect(action: "show", id: productInstance.id)
    }
	
	def saveREST() {
		def productInstance = new Product(params)
		if (!productInstance.save(flush: true)) {
			redirect(url: "http://localhost/notsaved.html")
			return
		}
		redirect(url: "http://localhost/saved.html")
	}

    def show() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }
		
        [productInstance: productInstance]
    }

    def edit() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def update() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			redirect(url: "http://localhost/notfound.html")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [productInstance.productName])
        redirect(action: "show", id: productInstance.id)
    }
	
	def updateREST() {
		def productInstance = Product.get(params.id)
		if (!productInstance) {
			redirect(url: "http://localhost/notfound.html")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (productInstance.version > version) {
				redirect(url: "http://localhost/versionoutdated.html")
				return
			}
		}

		productInstance.properties = params

		if (!productInstance.save(flush: true)) {
			redirect(url: "http://localhost/error.html")
			return
		}
		
		redirect(url: "http://localhost/updated.html")
	}

    def delete() {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "list")
            return
        }

        try {
			def productNameHolder = productInstance.productName
            productInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [productNameHolder])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
		
	def deleteREST() {
		def productInstance = Product.get(params.id)
		if (!productInstance) {
			redirect(url: "http://localhost/noProductToDelete.html")
			return
		}

		try {
			productInstance.delete(flush: true)
			redirect(url: "http://localhost/productDeleted.html")
		}
		catch (DataIntegrityViolationException e) {
			redirect(url: "http://localhost/productDeleted.html")
		}
    }
}
