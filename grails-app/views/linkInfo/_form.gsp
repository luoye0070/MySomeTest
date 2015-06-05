<%@ page import="com.lj.cmp.data.LinkInfo" %>



<div class="fieldcontain ${hasErrors(bean: linkInfoInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="linkInfo.name.label" default="Name" />
		
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="256" value="${linkInfoInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: linkInfoInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="linkInfo.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="url" cols="40" rows="5" maxlength="256" required="" value="${linkInfoInstance?.url}"/>
</div>

