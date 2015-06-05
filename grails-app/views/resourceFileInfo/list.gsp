
<%@ page import="com.lj.cmp.data.ResourceFileInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resourceFileInfo.label', default: 'ResourceFileInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-resourceFileInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-resourceFileInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fileName" title="${message(code: 'resourceFileInfo.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'resourceFileInfo.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="dirName" title="${message(code: 'resourceFileInfo.dirName.label', default: 'Dir Name')}" />
					
						<g:sortableColumn property="uploadTime" title="${message(code: 'resourceFileInfo.uploadTime.label', default: 'Upload Time')}" />
					
						<g:sortableColumn property="size" title="${message(code: 'resourceFileInfo.size.label', default: 'Size')}" />
					
						<g:sortableColumn property="fileFullName" title="${message(code: 'resourceFileInfo.fileFullName.label', default: 'File Full Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resourceFileInfoInstanceList}" status="i" var="resourceFileInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resourceFileInfoInstance.id}">${fieldValue(bean: resourceFileInfoInstance, field: "fileName")}</g:link></td>
					
						<td>${fieldValue(bean: resourceFileInfoInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: resourceFileInfoInstance, field: "dirName")}</td>
					
						<td><g:formatDate date="${resourceFileInfoInstance.uploadTime}" /></td>
					
						<td>${fieldValue(bean: resourceFileInfoInstance, field: "size")}</td>
					
						<td>${fieldValue(bean: resourceFileInfoInstance, field: "fileFullName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resourceFileInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
