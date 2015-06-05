
<%@ page import="com.lj.cmp.data.ContentsInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentsInfo.label', default: 'ContentsInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contentsInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contentsInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contentsInfo">
			
				<g:if test="${contentsInfoInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="contentsInfo.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${contentsInfoInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentsInfoInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="contentsInfo.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate date="${contentsInfoInstance?.time}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentsInfoInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="contentsInfo.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${contentsInfoInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentsInfoInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="contentsInfo.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${contentsInfoInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentsInfoInstance?.contentClassInfo}">
				<li class="fieldcontain">
					<span id="contentClassInfo-label" class="property-label"><g:message code="contentsInfo.contentClassInfo.label" default="Content Class Info" /></span>
					
						<span class="property-value" aria-labelledby="contentClassInfo-label"><g:link controller="contentClassInfo" action="show" id="${contentsInfoInstance?.contentClassInfo?.id}">${contentsInfoInstance?.contentClassInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentsInfoInstance?.canRemove}">
				<li class="fieldcontain">
					<span id="canRemove-label" class="property-label"><g:message code="contentsInfo.canRemove.label" default="Can Remove" /></span>
					
						<span class="property-value" aria-labelledby="canRemove-label"><g:formatBoolean boolean="${contentsInfoInstance?.canRemove}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentsInfoInstance?.imageInfoList}">
				<li class="fieldcontain">
					<span id="imageInfoList-label" class="property-label"><g:message code="contentsInfo.imageInfoList.label" default="Image Info List" /></span>
					
						<g:each in="${contentsInfoInstance.imageInfoList}" var="i">
						<span class="property-value" aria-labelledby="imageInfoList-label"><g:link controller="imageInfo" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentsInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${contentsInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
