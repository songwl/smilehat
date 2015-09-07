<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/certlabel/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName=".certlabel.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
					<dl class="nowrap">
						<dt><label>认证标签名称:</label></dt>
						<dd><input type="text" id="certName" name="certName" class="required" size="30" value="${vm.certName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt>认证标图标：</dt>
						<dd>
							<tag:picUpload height="180" uploadifyFileId="sys_certlabel_photo_uploadifyFileId" hiddenName="photoAttachId" width="180"
								defaultPicPath="${ctx}/static/styles/base/images/product_default.jpg" hiddenValue="${vm.photoAttach.id }" picPath="${ctx}/${vm.photoAttach.downloadPath }"></tag:picUpload>
						</dd>
					</dl> 
					<dl class="nowrap">
						<dt><label>是否可选择:</label></dt>
						<dd><input type="text" id="isAllowCheck" name="isAllowCheck" class="required" size="30" value="${vm.isAllowCheck}" validate="{required:true}"/>						</dd>
					</dl>
					
					<dl class="nowrap">
						<dt><label>认证分类:</label></dt>
						<dd><input type="text" id="certType" name="certType" class="required" size="30" value="${vm.certType}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>认证二级分类:</label></dt>
						<dd><input type="text" id="certType2" name="certType2" class="required" size="30" value="${vm.certType2}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>认证描述:</label></dt>
						<dd><input type="text" id="certDesc" name="certDesc" class="required" size="30" value="${vm.certDesc}" validate="{required:true}"/>						</dd>
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