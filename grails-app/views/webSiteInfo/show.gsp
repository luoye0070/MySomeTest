
<%@ page import="com.lj.cmp.data.WebSiteInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'webSiteInfo.label', default: 'WebSiteInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-webSiteInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-webSiteInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list webSiteInfo">
			
				<g:if test="${webSiteInfoInstance?.siteName}">
				<li class="fieldcontain">
					<span id="siteName-label" class="property-label"><g:message code="webSiteInfo.siteName.label" default="Site Name" /></span>
					
						<span class="property-value" aria-labelledby="siteName-label"><g:fieldValue bean="${webSiteInfoInstance}" field="siteName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.logoUrl}">
				<li class="fieldcontain">
					<span id="logoUrl-label" class="property-label"><g:message code="webSiteInfo.logoUrl.label" default="Logo Url" /></span>
					
						<span class="property-value" aria-labelledby="logoUrl-label"><g:fieldValue bean="${webSiteInfoInstance}" field="logoUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.flashUrl}">
				<li class="fieldcontain">
					<span id="flashUrl-label" class="property-label"><g:message code="webSiteInfo.flashUrl.label" default="Flash Url" /></span>
					
						<span class="property-value" aria-labelledby="flashUrl-label"><g:fieldValue bean="${webSiteInfoInstance}" field="flashUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.imageUrl}">
				<li class="fieldcontain">
					<span id="imageUrl-label" class="property-label"><g:message code="webSiteInfo.imageUrl.label" default="Image Url" /></span>
					
						<span class="property-value" aria-labelledby="imageUrl-label"><g:fieldValue bean="${webSiteInfoInstance}" field="imageUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.maxSizeOfFile}">
				<li class="fieldcontain">
					<span id="maxSizeOfFile-label" class="property-label"><g:message code="webSiteInfo.maxSizeOfFile.label" default="Max Size Of File" /></span>
					
						<span class="property-value" aria-labelledby="maxSizeOfFile-label"><g:fieldValue bean="${webSiteInfoInstance}" field="maxSizeOfFile"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.rightInfo}">
				<li class="fieldcontain">
					<span id="rightInfo-label" class="property-label"><g:message code="webSiteInfo.rightInfo.label" default="Right Info" /></span>
					
						<span class="property-value" aria-labelledby="rightInfo-label"><g:fieldValue bean="${webSiteInfoInstance}" field="rightInfo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.mailAddr}">
				<li class="fieldcontain">
					<span id="mailAddr-label" class="property-label"><g:message code="webSiteInfo.mailAddr.label" default="Mail Addr" /></span>
					
						<span class="property-value" aria-labelledby="mailAddr-label"><g:fieldValue bean="${webSiteInfoInstance}" field="mailAddr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${webSiteInfoInstance?.linkInfoList}">
				<li class="fieldcontain">
					<span id="linkInfoList-label" class="property-label"><g:message code="webSiteInfo.linkInfoList.label" default="Link Info List" /></span>
					
						<g:each in="${webSiteInfoInstance.linkInfoList}" var="l">
						<span class="property-value" aria-labelledby="linkInfoList-label"><g:link controller="linkInfo" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${webSiteInfoInstance?.id}" />
					<g:link class="edit" action="edit" id="${webSiteInfoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
