<%@ page import="com.lj.cmp.data.ContentsInfo" %>



<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="contentsInfo.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="1024" required="" value="${contentsInfoInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'time', 'error')} required">
	<label for="time">
		<g:message code="contentsInfo.time.label" default="Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="time" precision="day"  value="${contentsInfoInstance?.time}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="contentsInfo.author.label" default="Author" />
		
	</label>
	<g:textField name="author" maxlength="216" value="${contentsInfoInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="contentsInfo.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" cols="40" rows="5" maxlength="102400" value="${contentsInfoInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'contentClassInfo', 'error')} ">
	<label for="contentClassInfo">
		<g:message code="contentsInfo.contentClassInfo.label" default="Content Class Info" />
		
	</label>
	<g:select id="contentClassInfo" name="contentClassInfo.id" from="${com.lj.cmp.data.ContentClassInfo.list()}" optionKey="id" value="${contentsInfoInstance?.contentClassInfo?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'canRemove', 'error')} ">
	<label for="canRemove">
		<g:message code="contentsInfo.canRemove.label" default="Can Remove" />
		
	</label>
	<g:checkBox name="canRemove" value="${contentsInfoInstance?.canRemove}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contentsInfoInstance, field: 'imageInfoList', 'error')} ">
	<label for="imageInfoList">
		<g:message code="contentsInfo.imageInfoList.label" default="Image Info List" />
		
	</label>
	<g:select name="imageInfoList" from="${com.lj.cmp.data.ImageInfo.list()}" multiple="multiple" optionKey="id" size="5" value="${contentsInfoInstance?.imageInfoList*.id}" class="many-to-many"/>
</div>

