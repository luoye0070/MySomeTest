
<%@ page import="com.lj.cmp.data.ContentsInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contentsInfo.label', default: 'ContentsInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contentsInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contentsInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'contentsInfo.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="time" title="${message(code: 'contentsInfo.time.label', default: 'Time')}" />
					
						<g:sortableColumn property="author" title="${message(code: 'contentsInfo.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'contentsInfo.content.label', default: 'Content')}" />
					
						<th><g:message code="contentsInfo.contentClassInfo.label" default="Content Class Info" /></th>
					
						<g:sortableColumn property="canRemove" title="${message(code: 'contentsInfo.canRemove.label', default: 'Can Remove')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentsInfoInstanceList}" status="i" var="contentsInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contentsInfoInstance.id}">${fieldValue(bean: contentsInfoInstance, field: "title")}</g:link></td>
					
						<td><g:formatDate date="${contentsInfoInstance.time}" /></td>
					
						<td>${fieldValue(bean: contentsInfoInstance, field: "author")}</td>
					
						<td>${fieldValue(bean: contentsInfoInstance, field: "content")}</td>
					
						<td>${fieldValue(bean: contentsInfoInstance, field: "contentClassInfo")}</td>
					
						<td><g:formatBoolean boolean="${contentsInfoInstance.canRemove}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentsInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
