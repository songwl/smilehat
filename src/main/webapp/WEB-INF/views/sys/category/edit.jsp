<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/category/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName="sys.category.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
					<dl>
						<dt><label>品类名称:</label></dt>
						<dd><input type="text" id="categoryName" name="categoryName" class="required" size="30" value="${vm.categoryName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>品类代码:</label></dt>
						<dd><input type="text" id="categoryCode" name="categoryCode"  size="30" value="${vm.categoryCode}" />						</dd>
					</dl>
					<dl>
						<dt><label>上级品类:</label></dt>
						<dd>
							<input type="hidden" class="changeValidate" name="categoryTree.id" value="${vm.parent.id}" <c:if test="${not empty id}">validate="{remoteAsync:'${sctx}/category/checkparent?id=${vm.id}',messages:{remoteAsync:'上级栏目部不能是当前栏目的子栏目'}}"</c:if>/> 
							<input name="categoryTree.name" value="${vm.parent.name}" type="text" readonly="readonly" /> 
							<a class="btnLook" href="${sctx}/category/select" lookupGroup="categoryTree">查找带回</a>
						</dd>					
					</dl>
					<dl>
						<dt><label>排序值:</label></dt>
						<dd><input type="text" id="sort" name="sort" size="30" value="${vm.sort}"/>						</dd>
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