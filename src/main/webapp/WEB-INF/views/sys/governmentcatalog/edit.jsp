<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/governmentcatalog/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="governmentId" value="${governmentId}">
		<tag:token tokenName="app.governmentcatalog.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
					<dl class="nowrap">
						<dt><label>子栏目名称:</label></dt>
						<dd><input type="text" id="catalogName" name="catalogName" class="required" size="30" value="${vm.catalogName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>子栏目详细说明:</label></dt>
						<dd>
							<textarea id="description" name="description" class="required" rows="5" cols="40" validate="{required:true}" >${vm.description}</textarea>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>关联农场:</label></dt>
						<dd>
							<input value='<tag:fetchElementPropertyToString propertyName="id" list="${vm.farmList}" />' name="farmIds" id="user.id" type="hidden" /> 
							<input value='<tag:fetchElementPropertyToString propertyName="name" list="${vm.farmList}" />' name="farmNames" id="user.name" readonly="readonly" type="text" />
							<a class="btnLook" rel="farm_select"  title="选择农场" href="${ctx}/sys/customer/select?rel=farm_select" lookupGroup="user">查找带回</a>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>图:</label></dt>
						<dd>
							<tag:multipleFileUpload uploadifyFileId="sys_governmentcatalog_attachs_uploadifyFileId_${id}" hiddenName="attachIds" attachs="${vm.attachList}"></tag:multipleFileUpload>
						</dd>
					</dl>
		</div>
		<div class="formBar">
			<ul> 
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
<!-- 				<li> -->
<!-- 					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div> -->
<!-- 				</li> -->
			</ul>
		</div>
	</form>
</div>