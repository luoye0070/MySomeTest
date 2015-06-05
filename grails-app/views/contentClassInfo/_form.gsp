<%@ page import="com.lj.cmp.data.ContentClassInfo" %>



<div class="fieldcontain ${hasErrors(bean: contentClassInfoInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="contentClassInfo.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="64" required="" value="${contentClassInfoInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentClassInfoInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="contentClassInfo.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="512" value="${contentClassInfoInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentClassInfoInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="contentClassInfo.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${com.lj.cmp.data.ContentClassInfo.list()}" optionKey="id" value="${contentClassInfoInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentClassInfoInstance, field: 'onMenu', 'error')} ">
	<label for="onMenu">
		<g:message code="contentClassInfo.onMenu.label" default="On Menu" />
		
	</label>
	<g:checkBox name="onMenu" value="${contentClassInfoInstance?.onMenu}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contentClassInfoInstance, field: 'canRemove', 'error')} ">
	<label for="canRemove">
		<g:message code="contentClassInfo.canRemove.label" default="Can Remove" />
		
	</label>
	<g:checkBox name="canRemove" value="${contentClassInfoInstance?.canRemove}" />
</div>

