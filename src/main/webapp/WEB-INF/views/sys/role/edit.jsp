<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">
	<form method="post" action="${sctx}/role/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName="sys.role.create"></tag:token>
		<input type="hidden" name="callbackType" value="closeCurrent">
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
			<dl>
				<dt>角色名称：</dt>
				<dd>
					<input name="name" class="required" type="text" size="30" value="${vm.name}" validate="{required:true,rangelength:[1,60]}" />
				</dd>
			</dl> 
			<dl class="nowrap">
				<dt>授权分配：</dt>
				<dd>
					<input name="authority.id" value="<tag:fetchElementPropertyToString propertyName="id" list="${vm.authorityList}"/>" type="hidden"> <a class="btnLook"
						rel="authority_select" title="选择授权" href="${sctx}/authority/select" lookupGroup="authority">查找带回</a> <span class="info">(点击选择授权)</span>
				</dd>
			</dl>
			<dl class="nowrap">
				<dt>&nbsp;</dt>
				<dd>
					<textarea class="readonly" rows="3" cols="40" readonly="readonly" name="authority.displayName"><tag:fetchElementPropertyToString propertyName="displayName" list="${vm.authorityList}" /></textarea>
				</dd>
			</dl> 
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
