
<%@ page import="com.lj.cmp.data.ContentClassInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentClassInfo.label', default: 'ContentClassInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contentClassInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contentClassInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contentClassInfo">
			
				<g:if test="${contentClassInfoInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="contentClassInfo.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${contentClassInfoInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentClassInfoInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="contentClassInfo.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${contentClassInfoInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentClassInfoInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="contentClassInfo.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="contentClassInfo" action="show" id="${contentClassInfoInstance?.parent?.id}">${contentClassInfoInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentClassInfoInstance?.onMenu}">
				<li class="fieldcontain">
					<span id="onMenu-label" class="property-label"><g:message code="contentClassInfo.onMenu.label" default="On Menu" /></span>
					
						<span class="property-value" aria-labelledby="onMenu-label"><g:formatBoolean boolean="${contentClassInfoInstance?.onMenu}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentClassInfoInstance?.canRemove}">
				<li class="fieldcontain">
					<span id="canRemove-label" class="property-label"><g:message code="contentClassInfo.canRemove.label" default="Can Remove" /></span>
					
						<span class="property-value" aria-labelledby="canRemove-label"><g:formatBoolean boolean="${contentClassInfoInstance?.canRemove}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentClassInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${contentClassInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
