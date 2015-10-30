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
								defaultPicPath="${ctx}/static/styles/base/images/product_default.jpg" hiddenValue="${vm.photoAttach.id}" picPath="${ctx}/${vm.photoAttach.downloadPath}"></tag:picUpload>
						</dd>
					</dl> 
					<dl class="nowrap">
						<dt><label>是否可选择:</label></dt>
						<dd>
<%-- 							<input type="text" id="isAllowCheck" name="isAllowCheck" class="required" size="30" value="${vm.isAllowCheck}" validate="{required:true}"/> --%>
							<input name="isAllowCheck" type="radio" value="1" checked="checked"/>是</label>
							<input name="isAllowCheck" type="radio" value="0" />否</label>  						
						</dd>
					</dl>
					
					<dl class="nowrap">
						<dt><label>认证分类:</label></dt>
						<dd>
							<select name="certType" class="combox" onchange="changeCertType(this);">
								<option value="CUSTOMER" <c:if test="${vm.certType!='PRODUCT'}">selected="selected"</c:if> >商户标签</option>
								<option value="PRODUCT" <c:if test="${vm.certType=='PRODUCT'}">selected="selected"</c:if> >产品标签</option>
							</select>
						</dd>
					</dl>
					<dl class="nowrap" style="display:none;" for="CUSTOMER">
						<dt><label>认证二级分类:</label></dt>
						<dd>
							<select name="certType2" class="combox">
								<option value="">--请选择--</option>
								<option value="PERSON" <c:if test="${vm.certType2=='PERSON'}">selected="selected"</c:if> >个人</option>
								<option value="DEALER" <c:if test="${vm.certType2=='DEALER'}">selected="selected"</c:if> >特约经销商</option>
								<option value="FARMER" <c:if test="${vm.certType2=='FARMER'}">selected="selected"</c:if> >农场</option>
							</select>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>认证描述:</label></dt>
						<dd>
							<textarea rows="" cols="" id="certDesc" name="certDesc" style="width: 480px;">${vm.certDesc}</textarea>
						</dd>
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

<script type="text/javascript">
	function changeCertType(sel){
		var val = $(sel).val();
		if(val=='CUSTOMER'){
			$("dl[for='CUSTOMER']").show();
		}else{
			$("dl[for='CUSTOMER']").hide();
		}
	}
</script>