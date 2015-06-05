<%@ page import="com.lj.cmp.data.WebSiteInfo" %>



<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'siteName', 'error')} ">
	<label for="siteName">
		<g:message code="webSiteInfo.siteName.label" default="Site Name" />
		
	</label>
	<g:textField name="siteName" maxlength="128" value="${webSiteInfoInstance?.siteName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'logoUrl', 'error')} ">
	<label for="logoUrl">
		<g:message code="webSiteInfo.logoUrl.label" default="Logo Url" />
		
	</label>
	<g:textArea name="logoUrl" cols="40" rows="5" maxlength="256" value="${webSiteInfoInstance?.logoUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'flashUrl', 'error')} ">
	<label for="flashUrl">
		<g:message code="webSiteInfo.flashUrl.label" default="Flash Url" />
		
	</label>
	<g:textArea name="flashUrl" cols="40" rows="5" maxlength="256" value="${webSiteInfoInstance?.flashUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'imageUrl', 'error')} ">
	<label for="imageUrl">
		<g:message code="webSiteInfo.imageUrl.label" default="Image Url" />
		
	</label>
	<g:textArea name="imageUrl" cols="40" rows="5" maxlength="256" value="${webSiteInfoInstance?.imageUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'maxSizeOfFile', 'error')} required">
	<label for="maxSizeOfFile">
		<g:message code="webSiteInfo.maxSizeOfFile.label" default="Max Size Of File" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxSizeOfFile" type="number" value="${webSiteInfoInstance.maxSizeOfFile}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'rightInfo', 'error')} ">
	<label for="rightInfo">
		<g:message code="webSiteInfo.rightInfo.label" default="Right Info" />
		
	</label>
	<g:textArea name="rightInfo" cols="40" rows="5" maxlength="256" value="${webSiteInfoInstance?.rightInfo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'mailAddr', 'error')} ">
	<label for="mailAddr">
		<g:message code="webSiteInfo.mailAddr.label" default="Mail Addr" />
		
	</label>
	<g:textField name="mailAddr" maxlength="128" value="${webSiteInfoInstance?.mailAddr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: webSiteInfoInstance, field: 'linkInfoList', 'error')} ">
	<label for="linkInfoList">
		<g:message code="webSiteInfo.linkInfoList.label" default="Link Info List" />
		
	</label>
	<g:select name="linkInfoList" from="${com.lj.cmp.data.LinkInfo.list()}" multiple="multiple" optionKey="id" size="5" value="${webSiteInfoInstance?.linkInfoList*.id}" class="many-to-many"/>
</div>

