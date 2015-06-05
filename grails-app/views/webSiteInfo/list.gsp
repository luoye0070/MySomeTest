
<%@ page import="com.lj.cmp.data.WebSiteInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'webSiteInfo.label', default: 'WebSiteInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-webSiteInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-webSiteInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="siteName" title="${message(code: 'webSiteInfo.siteName.label', default: 'Site Name')}" />
					
						<g:sortableColumn property="logoUrl" title="${message(code: 'webSiteInfo.logoUrl.label', default: 'Logo Url')}" />
					
						<g:sortableColumn property="flashUrl" title="${message(code: 'webSiteInfo.flashUrl.label', default: 'Flash Url')}" />
					
						<g:sortableColumn property="imageUrl" title="${message(code: 'webSiteInfo.imageUrl.label', default: 'Image Url')}" />
					
						<g:sortableColumn property="maxSizeOfFile" title="${message(code: 'webSiteInfo.maxSizeOfFile.label', default: 'Max Size Of File')}" />
					
						<g:sortableColumn property="rightInfo" title="${message(code: 'webSiteInfo.rightInfo.label', default: 'Right Info')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${webSiteInfoInstanceList}" status="i" var="webSiteInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${webSiteInfoInstance.id}">${fieldValue(bean: webSiteInfoInstance, field: "siteName")}</g:link></td>
					
						<td>${fieldValue(bean: webSiteInfoInstance, field: "logoUrl")}</td>
					
						<td>${fieldValue(bean: webSiteInfoInstance, field: "flashUrl")}</td>
					
						<td>${fieldValue(bean: webSiteInfoInstance, field: "imageUrl")}</td>
					
						<td>${fieldValue(bean: webSiteInfoInstance, field: "maxSizeOfFile")}</td>
					
						<td>${fieldValue(bean: webSiteInfoInstance, field: "rightInfo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${webSiteInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
