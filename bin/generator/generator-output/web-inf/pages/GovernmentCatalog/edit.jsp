<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}//governmentcatalog/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<vsc:token tokenName=".governmentcatalog.create"></vsc:token>
		<vsc:callback></vsc:callback>
		<div class="pageFormContent" layoutH="56">
					<dl>
						<dt><label>GOVERNMENT_ID:</label></dt>
						<dd><input type="text" id="governmentId" name="governmentId" class="required" size="30" value="${vm.governmentId}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>CATALOG_NAME:</label></dt>
						<dd><input type="text" id="catalogName" name="catalogName" class="required" size="30" value="${vm.catalogName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>DESCRIPTION:</label></dt>
						<dd><input type="text" id="description" name="description" class="required" size="30" value="${vm.description}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>ATTACH_ID:</label></dt>
						<dd><input type="text" id="attachId" name="attachId" class="required" size="30" value="${vm.attachId}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>CREATE_TIME:</label></dt>
						<dd><input type="text" id="createTime" name="createTime" class="date" value="<fmt:formatDate value='${vm.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/>
<a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd>
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