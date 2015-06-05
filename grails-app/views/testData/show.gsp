
<%@ page import="com.lj.mst.data.TestData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testData.label', default: 'TestData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-testData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-testData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list testData">
			
				<g:if test="${testDataInstance?.xh}">
				<li class="fieldcontain">
					<span id="xh-label" class="property-label"><g:message code="testData.xh.label" default="Xh" /></span>
					
						<span class="property-value" aria-labelledby="xh-label"><g:fieldValue bean="${testDataInstance}" field="xh"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testDataInstance?.xh1}">
				<li class="fieldcontain">
					<span id="xh1-label" class="property-label"><g:message code="testData.xh1.label" default="Xh1" /></span>
					
						<span class="property-value" aria-labelledby="xh1-label"><g:fieldValue bean="${testDataInstance}" field="xh1"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${testDataInstance?.id}" />
					<g:link class="edit" action="edit" id="${testDataInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
