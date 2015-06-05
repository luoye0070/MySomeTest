<%@ page import="com.lj.cmp.data.ImageInfo" %>



<div class="fieldcontain ${hasErrors(bean: imageInfoInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="imageInfo.name.label" default="Name" />
		
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="1024" value="${imageInfoInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInfoInstance, field: 'imgUrl', 'error')} required">
	<label for="imgUrl">
		<g:message code="imageInfo.imgUrl.label" default="Img Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="imgUrl" cols="40" rows="5" maxlength="256" required="" value="${imageInfoInstance?.imgUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInfoInstance, field: 'decription', 'error')} ">
	<label for="decription">
		<g:message code="imageInfo.decription.label" default="Decription" />
		
	</label>
	<g:textArea name="decription" cols="40" rows="5" maxlength="10240" value="${imageInfoInstance?.decription}"/>
</div>

