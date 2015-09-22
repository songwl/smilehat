<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	
</head>
<body>
<div class="pageContent">
	<form method="post" action="${ctx}/trading/detail/1" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<div class="pageFormContent" layoutH="56">
        <dl class="nowrap">
			<dt>登录名：${vm.loginName}</dt>
		</dl>
		<dl class="nowrap">
			<dt>商户名称：</dt>
			<dd>
				<input name="user.name" class="required" type="text" size="30" value="${vm.user.name}" validate="{required:true}" />
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>商户类型：</dt>
			<dd>
				<select name="user.userType" class="required">
					<option value="PERSON">个人</option>
					<option value="DEALER">特约经销商</option> 
					<option value="FARMER">农场</option>  
				</select>
			</dd>
		</dl> 
		<dl class="nowrap">
			<dt>头像：</dt>
			<dd>
				<tag:picUpload uploadifyFileId="sys_user_photo_uploadifyFileId" hiddenName="photoAttachId" width="180" height="180"
					defaultPicPath="${ctx}/static/styles/base/images/user_default.jpg" hiddenValue="${vm.user.photoAttach.id }" picPath="${ctx}/${vm.user.photoAttach.downloadPath }"></tag:picUpload>
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>地址：</dt>
			<dd>
				<select class="required combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${sctx}/region/selectJson" refUrl="${sctx}/region/selectJson?pid={value}">
					<option value="">----省----</option> 
				</select>
				<select class="required combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${sctx}/region/selectJson?pid={value}" 
						<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if>>
					<option value="">----市----</option> 
				</select>
				<select class="required combox" name="regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.id}"</c:if>>
					<option value="">----区----</option> 
				</select>
			</dd>
		</dl> 
		<dl class="nowrap">
			<dt>地址详细：</dt>
			<dd>
				<input type="text" name="address" value="${vm.address}" class="required" style="width: 100%;" />
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>签名：</dt>
			<dd>
				<input type="text" name="signature" value="${vm.signature}" style="width: 480px;" />
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>详细说明：</dt>
			<dd>
				<textarea rows="" cols="" name="description" style="width: 100%;">${vm.description}</textarea>
			</dd>
		</dl>
		<dl class="nowrap">
			<dt>官网网址：</dt>
			<dd>
				<input type="text" name="website" value="${vm.website}" style="width: 100%;" />
			</dd>
		</dl>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">注册</button>
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
    </div>
    </div>
	</form>
</div>

<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
</body>
</html>