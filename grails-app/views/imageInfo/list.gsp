
<%@ page import="com.lj.cmp.data.ImageInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imageInfo.label', default: 'ImageInfo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-imageInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-imageInfo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'imageInfo.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="imgUrl" title="${message(code: 'imageInfo.imgUrl.label', default: 'Img Url')}" />
					
						<g:sortableColumn property="decription" title="${message(code: 'imageInfo.decription.label', default: 'Decription')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imageInfoInstanceList}" status="i" var="imageInfoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${imageInfoInstance.id}">${fieldValue(bean: imageInfoInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: imageInfoInstance, field: "imgUrl")}</td>
					
						<td>${fieldValue(bean: imageInfoInstance, field: "decription")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imageInfoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
