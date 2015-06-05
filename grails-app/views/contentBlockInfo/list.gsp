
<%@ page import="com.lj.cmp.data.ContentBlockInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentBlockInfo.label', default: 'ContentBlockInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contentBlockInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contentBlockInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="contentBlockInfo.contentsInfo.label" default="Contents Info" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'contentBlockInfo.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'contentBlockInfo.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="logoUrl" title="${message(code: 'contentBlockInfo.logoUrl.label', default: 'Logo Url')}" />
					
						<g:sortableColumn property="inMenu" title="${message(code: 'contentBlockInfo.inMenu.label', default: 'In Menu')}" />
					
						<g:sortableColumn property="inNav" title="${message(code: 'contentBlockInfo.inNav.label', default: 'In Nav')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentBlockInfoInstanceList}" status="i" var="contentBlockInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentBlockInfoInstance.id}">${fieldValue(bean: contentBlockInfoInstance, field: "contentsInfo")}</g:link></td>
					
						<td>${fieldValue(bean: contentBlockInfoInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: contentBlockInfoInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: contentBlockInfoInstance, field: "logoUrl")}</td>
					
						<td><g:formatBoolean boolean="${contentBlockInfoInstance.inMenu}" /></td>
					
						<td><g:formatBoolean boolean="${contentBlockInfoInstance.inNav}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentBlockInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
