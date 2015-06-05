<%@ page import="com.lj.cmp.data.ResourceFileInfo" %>



<div class="fieldcontain ${hasErrors(bean: resourceFileInfoInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="resourceFileInfo.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileName" maxlength="64" required="" value="${resourceFileInfoInstance?.fileName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceFileInfoInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="resourceFileInfo.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${resourceFileInfoInstance.constraints.type.inList}" required="" value="${fieldValue(bean: resourceFileInfoInstance, field: 'type')}" valueMessagePrefix="resourceFileInfo.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceFileInfoInstance, field: 'dirName', 'error')} required">
	<label for="dirName">
		<g:message code="resourceFileInfo.dirName.label" default="Dir Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dirName" maxlength="128" required="" value="${resourceFileInfoInstance?.dirName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceFileInfoInstance, field: 'uploadTime', 'error')} required">
	<label for="uploadTime">
		<g:message code="resourceFileInfo.uploadTime.label" default="Upload Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="uploadTime" precision="day"  value="${resourceFileInfoInstance?.uploadTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: resourceFileInfoInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="resourceFileInfo.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="size" type="number" min="0" value="${resourceFileInfoInstance.size}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceFileInfoInstance, field: 'fileFullName', 'error')} required">
	<label for="fileFullName">
		<g:message code="resourceFileInfo.fileFullName.label" default="File Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileFullName" maxlength="218" required="" value="${resourceFileInfoInstance?.fileFullName}"/>
</div>

