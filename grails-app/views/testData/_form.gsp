<%@ page import="com.lj.mst.data.TestData" %>



<div class="fieldcontain ${hasErrors(bean: testDataInstance, field: 'xh', 'error')} required">
	<label for="xh">
		<g:message code="testData.xh.label" default="Xh" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="xh" type="number" min="0" value="${testDataInstance.xh}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: testDataInstance, field: 'xh1', 'error')} required">
	<label for="xh1">
		<g:message code="testData.xh1.label" default="Xh1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="xh1" type="number" value="${testDataInstance.xh1}" required=""/>
</div>

