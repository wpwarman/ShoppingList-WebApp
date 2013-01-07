package shoppinglist

class NavigationBarTagLib {
	def navBar = { attr, body ->
		String outputHtml = "<table class=\"navigationLinks\"><tr>"
		if (attr.home == "true" || attr.homelabel != null)
		{
			String homeLabel= attr.homelabel ?: "${message(code: 'default.home.label', args: [attr.entity], default:'')}"
			outputHtml += "<td><a href=\"${createLink(uri: '/')}\">" + homeLabel + "</a></td>"
		}
		if (attr.listproducts == "true" || attr.listlabel != null)
		{
			String listLabel= attr.listlabel ?: "${message(code: 'default.list.label', args: [attr.entity], default:'')}"
			outputHtml += "<td><a href=\"${createLink(controller: 'Product', action: 'list')}\">" + listLabel + "</a></td>"
		}
		if (attr.newproduct == "true" || attr.newlabel != null)
		{
			String newLabel= attr.newlabel ?: "${message(code: 'default.new.label', args: [attr.entity], default:'')}"
			outputHtml += "<td><a href=\"${createLink(controller: 'Product', action: 'create')}\">" + newLabel + "</a></td>"
		}
		outputHtml += "</tr></table>"		
		out << outputHtml
	}
}