<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Shopping List Builder</title>
	</head>
	<body>
		<div class="indexPage">
			<h1>Welcome to Shopping List Builder</h1>
			<p>An easy way to create and maintain a shopping list from your PC or phone.</p>
			<g:img dir="images" file="shopping-list.jpg" />
			<h2><g:link controller="product" action="list">View my shopping list</g:link></h2>
				
			<br />
			<br />
			<br />
			<br />
			<hr />
			<hr />
			<br />
			<h1>Controllers</h1>	
			<ul>
				<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
					<li><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
				</g:each>
			</ul>
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
	</body>
</html>
