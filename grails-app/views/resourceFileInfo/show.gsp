
<%@ page import="com.lj.cmp.data.ResourceFileInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-resourceFileInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-resourceFileInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list resourceFileInfo">
			
				<g:if test="${resourceFileInfoInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="resourceFileInfo.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${resourceFileInfoInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceFileInfoInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="resourceFileInfo.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${resourceFileInfoInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceFileInfoInstance?.dirName}">
				<li class="fieldcontain">
					<span id="dirName-label" class="property-label"><g:message code="resourceFileInfo.dirName.label" default="Dir Name" /></span>
					
						<span class="property-value" aria-labelledby="dirName-label"><g:fieldValue bean="${resourceFileInfoInstance}" field="dirName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceFileInfoInstance?.uploadTime}">
				<li class="fieldcontain">
					<span id="uploadTime-label" class="property-label"><g:message code="resourceFileInfo.uploadTime.label" default="Upload Time" /></span>
					
						<span class="property-value" aria-labelledby="uploadTime-label"><g:formatDate date="${resourceFileInfoInstance?.uploadTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceFileInfoInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="resourceFileInfo.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${resourceFileInfoInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceFileInfoInstance?.fileFullName}">
				<li class="fieldcontain">
					<span id="fileFullName-label" class="property-label"><g:message code="resourceFileInfo.fileFullName.label" default="File Full Name" /></span>
					
						<span class="property-value" aria-labelledby="fileFullName-label"><g:fieldValue bean="${resourceFileInfoInstance}" field="fileFullName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${resourceFileInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${resourceFileInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
