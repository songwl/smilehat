<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/purchase/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName=".purchase.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
			<dl class="nowrap">
				<dt><label>所属商户:</label></dt>
				<dd>
					<input value="${vm.user.id}" name="userId" id="user.id" type="hidden" /> 
					<input value="${vm.user.name}" name="userName" id="user.name" readonly="readonly" type="text" />
					<a class="btnLook" rel="customer_select" title="选择商户" href="${sctx}/customer/select" lookupGroup="user">查找带回</a>						
				</dd>
			</dl>
			<dl class="nowrap">
				<dt><label>品类名称:</label></dt>
				<dd>
					<dd>
						<input type="hidden" name="categoryId" id="categoryTree.id" value="${vm.category.id}" /> 
						<input name="categoryName" id="categoryTree.name" value="${vm.category.categoryName}" type="text" readonly="readonly" /> 
						<a class="btnLook" href="${sctx}/category/select" lookupGroup="categoryTree">查找带回</a>
					</dd>	
				</dd>
			</dl>
			<dl class="nowrap">
				<dt><label>标题:</label></dt>
				<dd><input type="text" id="title" name="title" class="required" size="50" value="${vm.title}" validate="{required:true}"/>						</dd>
			</dl>
			<dl  class="nowrap">
				<dt><label>规格:</label></dt>
				<dd>
<%-- 							<input type="text" id="branchInfo" name="branchInfo" class="required" size="50" value="${vm.branchInfo}" />	 --%>
					<select  id="branchInfo" name=branchInfo  class="required combox"  selectedValue="${vm.branchInfo}"   dataUrl="${sctx}/dict/selectDictByType?dictType=BRANCH_INFO">
					</select>
				</dd>
			</dl>
			<dl class="nowrap">
				<dt><label>采购量:</label></dt>
				<dd>
					<input type="text" id="quantity" name="quantity" class="required" size="18" value="${vm.quantity}"  />	
					<select id="quantityUnit" name="quantityUnit"  class="required combox"  selectedValue="${vm.quantityUnit}" dataUrl="${sctx}/dict/selectDictByType?dictType=QUANTITY_UNIT">
					</select>
				</dd>
			</dl>
			<dl class="nowrap">
				<dt><label>价格:</label></dt>
				<dd>
					<input type="text" id="price" name="price" class="required" size="18" value="${vm.price}" validate="{required:true}"/>		
					<select  id="priceUnit" name="priceUnit"  class="required combox"  selectedValue="${vm.priceUnit}"   dataUrl="${sctx}/dict/selectDictByType?dictType=PRICE_UNIT">
					</select>						
				</dd>
			</dl>
			<dl class="nowrap">
				<dt><label>产品描述:</label></dt>
				<dd>
					<textarea rows="" cols="" id="description" name="description" style="width: 480px;">${vm.description}</textarea>
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