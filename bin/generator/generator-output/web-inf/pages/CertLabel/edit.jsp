<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}//certlabel/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<vsc:token tokenName=".certlabel.create"></vsc:token>
		<vsc:callback></vsc:callback>
		<div class="pageFormContent" layoutH="56">
					<dl>
						<dt><label>CERT_NAME:</label></dt>
						<dd><input type="text" id="certName" name="certName" class="required" size="30" value="${vm.certName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>IS_ALLOW_CHECK:</label></dt>
						<dd><input type="text" id="isAllowCheck" name="isAllowCheck" class="required" size="30" value="${vm.isAllowCheck}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>CERT_DESC:</label></dt>
						<dd><input type="text" id="certDesc" name="certDesc" class="required" size="30" value="${vm.certDesc}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>CERT_TYPE:</label></dt>
						<dd><input type="text" id="certType" name="certType" class="required" size="30" value="${vm.certType}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>CERT_TYPE2:</label></dt>
						<dd><input type="text" id="certType2" name="certType2" class="required" size="30" value="${vm.certType2}" validate="{required:true}"/>						</dd>
					</dl>
		</div>
		<div class="formBar">
			<ul> 
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>