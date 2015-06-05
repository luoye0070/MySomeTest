
<%@ page import="com.lj.cmp.data.ContentBlockInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contentBlockInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contentBlockInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contentBlockInfo">
			
				<g:if test="${contentBlockInfoInstance?.contentsInfo}">
				<li class="fieldcontain">
					<span id="contentsInfo-label" class="property-label"><g:message code="contentBlockInfo.contentsInfo.label" default="Contents Info" /></span>
					
						<span class="property-value" aria-labelledby="contentsInfo-label"><g:link controller="contentsInfo" action="show" id="${contentBlockInfoInstance?.contentsInfo?.id}">${contentBlockInfoInstance?.contentsInfo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="contentBlockInfo.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${contentBlockInfoInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="contentBlockInfo.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${contentBlockInfoInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.logoUrl}">
				<li class="fieldcontain">
					<span id="logoUrl-label" class="property-label"><g:message code="contentBlockInfo.logoUrl.label" default="Logo Url" /></span>
					
						<span class="property-value" aria-labelledby="logoUrl-label"><g:fieldValue bean="${contentBlockInfoInstance}" field="logoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.inMenu}">
				<li class="fieldcontain">
					<span id="inMenu-label" class="property-label"><g:message code="contentBlockInfo.inMenu.label" default="In Menu" /></span>
					
						<span class="property-value" aria-labelledby="inMenu-label"><g:formatBoolean boolean="${contentBlockInfoInstance?.inMenu}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.inNav}">
				<li class="fieldcontain">
					<span id="inNav-label" class="property-label"><g:message code="contentBlockInfo.inNav.label" default="In Nav" /></span>
					
						<span class="property-value" aria-labelledby="inNav-label"><g:formatBoolean boolean="${contentBlockInfoInstance?.inNav}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.maxCount}">
				<li class="fieldcontain">
					<span id="maxCount-label" class="property-label"><g:message code="contentBlockInfo.maxCount.label" default="Max Count" /></span>
					
						<span class="property-value" aria-labelledby="maxCount-label"><g:fieldValue bean="${contentBlockInfoInstance}" field="maxCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.contentClassInfoList}">
				<li class="fieldcontain">
					<span id="contentClassInfoList-label" class="property-label"><g:message code="contentBlockInfo.contentClassInfoList.label" default="Content Class Info List" /></span>
					
						<g:each in="${contentBlockInfoInstance.contentClassInfoList}" var="c">
						<span class="property-value" aria-labelledby="contentClassInfoList-label"><g:link controller="contentClassInfo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${contentBlockInfoInstance?.contentsInfoList}">
				<li class="fieldcontain">
					<span id="contentsInfoList-label" class="property-label"><g:message code="contentBlockInfo.contentsInfoList.label" default="Contents Info List" /></span>
					
						<g:each in="${contentBlockInfoInstance.contentsInfoList}" var="c">
						<span class="property-value" aria-labelledby="contentsInfoList-label"><g:link controller="contentsInfo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentBlockInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${contentBlockInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
