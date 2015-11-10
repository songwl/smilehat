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
							<a class="btnLook" rel="customer_select"  title="选择商户" href="${ctx}/sys/customer/select?single=true" lookupGroup="user">查找带回</a>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>产品名称:</label></dt>
						<dd><input type="text" id="name" name="name" class="required" size="30" value="${vm.name}" validate="{required:true}"/>						</dd>
					</dl>
<!-- 					<dl class="nowrap"> -->
<!-- 						<dt><label>产品标题:</label></dt> -->
<%-- 						<dd><input type="text" id="title" name="title" class="required" size="30" value="${vm.title}" validate="{required:true}"/>						</dd> --%>
<!-- 					</dl> -->
					<dl class="nowrap">
						<dt><label>品牌:</label></dt>
						<dd>
							<input type="text" id="trademark" name="trademark" style="width: 140px;" size="18" value="${vm.trademark}"  />	
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
					<dl  class="nowrap">
						<dt><label>规格:</label></dt>
						<dd>
							<input type="text" id="branch" name="branch" style="width: 140px;" size="18" value="${vm.branch}" />	
<%-- 							<select  id="branchInfo" name=branchInfo  class="combox"  selectedValue="${vm.branchInfo}"   dataUrl="${sctx}/dict/selectDictByType?dictType=BRANCH_INFO"> --%>
<!-- 								<option value=""></option> -->
<!-- 							</select> -->
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>包装方式:</label></dt>
						<dd>
							<input type="text" id="packing" name="packing" style="width: 140px;" size="18" value="${vm.packing}"  />	
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>贮藏方式:</label></dt>
						<dd>
							<input type="text" id="depot" name="depot" style="width: 140px;" size="18" value="${vm.depot}"  />	
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>保质期:</label></dt>
						<dd>
							<input type="text" id="expiratinDate" name="expiratinDate" style="width: 140px;" size="18" value="${vm.expiratinDate}" />(天)	
						</dd>
					</dl>
					<dl class="nowrap">
					<dt>产地：</dt>
						<dd>
							<select class="combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${sctx}/region/selectJson" refUrl="${sctx}/region/selectJson?pid={value}">
								<option value="">----省----</option> 
							</select>
							<select class="combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${sctx}/region/selectJson?pid={value}" 
									<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if>>
								<option value="">----市----</option> 
							</select>
							<select class="combox" name="regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.id}"</c:if>>
								<option value="">----区----</option> 
							</select>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>详细地址:</label></dt>
						<dd><input type="text" id="regionDetail" name="regionDetail" class="" size="30" value="${vm.regionDetail}" style="width: 480px;"/>						</dd>
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
						<dt><label>供应量:</label></dt>
						<dd>
							<input type="text" id="quantity" name="quantity" style="width: 140px;" size="18" value="${vm.quantity}"  />	
<%-- 							<select id="quantityUnit" name="quantityUnit"  class="required combox"  selectedValue="${vm.quantityUnit}" dataUrl="${sctx}/dict/selectDictByType?dictType=QUANTITY_UNIT"> --%>
<!-- 							</select> -->
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>起订量:</label></dt>
						<dd>
							<input type="text" id="minOrder" name="minOrder" style="width: 140px;" size="18" value="${vm.minOrder}"  />	
						</dd>
					</dl>
					<dl  class="nowrap" >
						<dt><label>供应期1:</label></dt>
						<dd>
							<input type="text" id="startTime" name="startTime" class="date" value="${vm.startTime}" dateFmt="M月d日" readonly="true" />
							<span style="float:left;">&nbsp;至&nbsp;</span>
							<input type="text" id="endTime" name="endTime" class="date" value="${vm.endTime}" dateFmt="M月d日" readonly="true" />
							
						</dd>
					</dl>
					<dl  class="nowrap" >
						<dt><label>供应期2:</label></dt>
						<dd>
							<input type="text" id="startTime2" name="startTime2" class="date" value="${vm.startTime2}" dateFmt="M月d日" readonly="true" />
							<span style="float:left;">&nbsp;至&nbsp;</span>
							<input type="text" id="endTime2" name="endTime2" class="date" value="${vm.endTime2}" dateFmt="M月d日" readonly="true" />
							
						</dd>
					</dl>
					<dl  class="nowrap" >
						<dt><label>供应期3:</label></dt>
						<dd>
							<input type="text" id="startTime3" name="startTime3" class="date" value="${vm.startTime3}" dateFmt="M月d日" readonly="true" />
							<span style="float:left;">&nbsp;至&nbsp;</span>
							<input type="text" id="endTime3" name="endTime3" class="date" value="${vm.endTime3}" dateFmt="M月d日" readonly="true" />
							
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>产品特色:</label></dt>
						<dd>
							<textarea rows="" cols="" id="description" name="description" style="width: 480px;">${vm.description}</textarea>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>产品图片：</dt>
						<dd>
							<tag:multipleFileUpload uploadifyFileId="sys_product_attachs_uploadifyFileId" hiddenName="attachIds" attachs="${vm.attachs}"></tag:multipleFileUpload>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>产品标签:</label></dt>
						<dd>
							<c:if test="${empty vm}">
								<c:forEach items="${certLabelList}" var="certItem">
									<input type="checkbox" value="${certItem.id}" name="certLabels" />${certItem.certName}  
								</c:forEach>
							</c:if>
							<c:if test="${not empty vm}">
								<c:forEach items="${certLabelList}" var="certItem">
									<input type="checkbox" value="${certItem.id}" name="certLabels" <c:if test="${not empty vm.certLabelMap[certItem.id]}">checked="checked"</c:if> />${certItem.certName}  
								</c:forEach>
							</c:if>
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