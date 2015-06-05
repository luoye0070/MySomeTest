<%@ page import="com.lj.cmp.data.ContentBlockInfo" %>



<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'contentsInfo', 'error')} ">
	<label for="contentsInfo">
		<g:message code="contentBlockInfo.contentsInfo.label" default="Contents Info" />
		
	</label>
	<g:select id="contentsInfo" name="contentsInfo.id" from="${com.lj.cmp.data.ContentsInfo.list()}" optionKey="id" value="${contentBlockInfoInstance?.contentsInfo?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="contentBlockInfo.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${contentBlockInfoInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="contentBlockInfo.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="code" type="number" value="${contentBlockInfoInstance.code}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'logoUrl', 'error')} ">
	<label for="logoUrl">
		<g:message code="contentBlockInfo.logoUrl.label" default="Logo Url" />
		
	</label>
	<g:textField name="logoUrl" value="${contentBlockInfoInstance?.logoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'inMenu', 'error')} ">
	<label for="inMenu">
		<g:message code="contentBlockInfo.inMenu.label" default="In Menu" />
		
	</label>
	<g:checkBox name="inMenu" value="${contentBlockInfoInstance?.inMenu}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'inNav', 'error')} ">
	<label for="inNav">
		<g:message code="contentBlockInfo.inNav.label" default="In Nav" />
		
	</label>
	<g:checkBox name="inNav" value="${contentBlockInfoInstance?.inNav}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'maxCount', 'error')} required">
	<label for="maxCount">
		<g:message code="contentBlockInfo.maxCount.label" default="Max Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxCount" type="number" value="${contentBlockInfoInstance.maxCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'contentClassInfoList', 'error')} ">
	<label for="contentClassInfoList">
		<g:message code="contentBlockInfo.contentClassInfoList.label" default="Content Class Info List" />
		
	</label>
	<g:select name="contentClassInfoList" from="${com.lj.cmp.data.ContentClassInfo.list()}" multiple="multiple" optionKey="id" size="5" value="${contentBlockInfoInstance?.contentClassInfoList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentBlockInfoInstance, field: 'contentsInfoList', 'error')} ">
	<label for="contentsInfoList">
		<g:message code="contentBlockInfo.contentsInfoList.label" default="Contents Info List" />
		
	</label>
	<g:select name="contentsInfoList" from="${com.lj.cmp.data.ContentsInfo.list()}" multiple="multiple" optionKey="id" size="5" value="${contentBlockInfoInstance?.contentsInfoList*.id}" class="many-to-many"/>
</div>

