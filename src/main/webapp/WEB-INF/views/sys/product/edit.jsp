<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/product/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName=".product.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
					<dl >
						<dt><label>商户选择:</label> </dt>
						<dd>
							<input value="${vm.user.id}" name="userId" id="user.id" type="hidden" /> 
							<input value="${vm.user.name}" name="userName" id="user.name" readonly="readonly" type="text" />
							<a class="btnLook" rel="customer_select"  title="选择商户" href="${ctx}/sys/customer/select" lookupGroup="user">查找带回</a>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>产品名称:</label></dt>
						<dd><input type="text" id="name" name="name" class="required" size="30" value="${vm.name}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>产品标题:</label></dt>
						<dd><input type="text" id="title" name="title" class="required" size="30" value="${vm.title}" validate="{required:true}"/>						</dd>
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
					<dl  class="nowrap" >
						<dt><label>上市时间:</label></dt>
						<dd>
							<input type="text" id="startTime" name="startTime" class="date" value="<fmt:formatDate value='${vm.startTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
							<span style="float:left;">&nbsp;至&nbsp;</span>
							<input type="text" id="endTime" name="endTime" class="date" value="<fmt:formatDate value='${vm.endTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
							
						</dd>
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
						<dt><label>价格:</label></dt>
						<dd>
							<input type="text" id="price" name="price" class="required" size="18" value="${vm.price}" validate="{required:true}"/>		
							<select  id="priceUnit" name="priceUnit"  class="required combox"  selectedValue="${vm.priceUnit}"   dataUrl="${sctx}/dict/selectDictByType?dictType=PRICE_UNIT">
							</select>				
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>供应量:</label></dt>
						<dd>
							<input type="text" id="quantity" name="quantity" class="required" size="18" value="${vm.quantity}"  />	
							<select id="quantityUnit" name="quantityUnit"  class="required combox"  selectedValue="${vm.quantityUnit}" dataUrl="${sctx}/dict/selectDictByType?dictType=QUANTITY_UNIT">
							</select>
						</dd>
					</dl>
					<dl class="nowrap">
					<dt>区域：</dt>
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
						<dt><label>详细地址:</label></dt>
						<dd><input type="text" id="regionDetail" name="regionDetail" class="required" size="30" value="${vm.regionDetail}" validate="{required:true}" style="width: 480px;"/>						</dd>
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