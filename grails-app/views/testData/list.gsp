
<%@ page import="com.lj.mst.data.TestData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testData.label', default: 'TestData')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-testData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-testData" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="xh" title="${message(code: 'testData.xh.label', default: 'Xh')}" />
					
						<g:sortableColumn property="xh1" title="${message(code: 'testData.xh1.label', default: 'Xh1')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${testDataInstanceList}" status="i" var="testDataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${testDataInstance.id}">${fieldValue(bean: testDataInstance, field: "xh")}</g:link></td>
					
						<td>${fieldValue(bean: testDataInstance, field: "xh1")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${testDataInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
