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
					<a class="btnLook" rel="customer_select" title="选择商户" href="${sctx}/customer/select?single=true" lookupGroup="user">查找带回</a>						
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
					<input type="text" id="branch" name="branch" style="width: 140px;" size="18" value="${vm.branch}" />	
					<select  id="branchInfo" name=branchInfo  class="required combox"  selectedValue="${vm.branchInfo}"   dataUrl="${sctx}/dict/selectDictByType?dictType=BRANCH_INFO">
						<option value="">--</option>
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
					<input type="text" id="price" name="price" size="18" style="width: 80px;" value="${vm.price}" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" />		
					<input type="text" id="price2" name="price2"  size="18" style="width: 80px;" value="${vm.price2}" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" />	
					<select  id="priceUnit" name="priceUnit"  class="required combox"  selectedValue="${vm.priceUnit}"   dataUrl="${sctx}/dict/selectDictByType?dictType=PRICE_UNIT">
					</select>				
				</dd>
			</dl>
			<dl class="nowrap">
				<dt>产地要求：</dt>
				<dd>
					<select class=" combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${sctx}/region/selectJson" refUrl="${sctx}/region/selectJson?pid={value}">
						<option value="">----省----</option> 
					</select>
					<select class=" combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${sctx}/region/selectJson?pid={value}" 
							<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if>>
						<option value="">----市----</option> 
					</select>
					<select class=" combox" name="regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.id}"</c:if>>
						<option value="">----区----</option> 
					</select>
				</dd>
			</dl>
			<dl class="nowrap">
				<dt><label>详细地址:</label></dt>
				<dd>
					<input type="text" id="regionDetail" name="regionDetail" class="" size="30" value="${vm.regionDetail}"  style="width: 480px;"/>						
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