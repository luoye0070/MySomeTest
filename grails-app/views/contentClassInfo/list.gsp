
<%@ page import="com.lj.cmp.data.ContentClassInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentClassInfo.label', default: 'ContentClassInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contentClassInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contentClassInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'contentClassInfo.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'contentClassInfo.description.label', default: 'Description')}" />
					
						<th><g:message code="contentClassInfo.parent.label" default="Parent" /></th>
					
						<g:sortableColumn property="onMenu" title="${message(code: 'contentClassInfo.onMenu.label', default: 'On Menu')}" />
					
						<g:sortableColumn property="canRemove" title="${message(code: 'contentClassInfo.canRemove.label', default: 'Can Remove')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentClassInfoInstanceList}" status="i" var="contentClassInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentClassInfoInstance.id}">${fieldValue(bean: contentClassInfoInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: contentClassInfoInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: contentClassInfoInstance, field: "parent")}</td>
					
						<td><g:formatBoolean boolean="${contentClassInfoInstance.onMenu}" /></td>
					
						<td><g:formatBoolean boolean="${contentClassInfoInstance.canRemove}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentClassInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
