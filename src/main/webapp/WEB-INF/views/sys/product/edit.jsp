<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/product/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<vsc:token tokenName=".product.create"></vsc:token>
		<vsc:callback></vsc:callback>
		<div class="pageFormContent" layoutH="56">
					<dl>
						<dt><label>产品名称:</label></dt>
						<dd><input type="text" id="name" name="name" class="required" size="30" value="${vm.name}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>产品标题:</label></dt>
						<dd><input type="text" id="title" name="title" class="required" size="30" value="${vm.title}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>产品描述:</label></dt>
						<dd><input type="text" id="description" name="description" class="required" size="30" value="${vm.description}" validate="{required:true}"/>						</dd>
					</dl>
<!-- 					<dl> -->
<!-- 						<dt><label>CREATE_TIME:</label></dt> -->
<%-- 						<dd><input type="text" id="createTime" name="createTime" class="date" value="<fmt:formatDate value='${vm.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/> --%>
<!-- <a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd> -->
<!-- 					</dl> -->
<!-- 					<dl> -->
<!-- 						<dt><label>UPDATE_TIME:</label></dt> -->
<%-- 						<dd><input type="text" id="updateTime" name="updateTime" class="date" value="<fmt:formatDate value='${vm.updateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/> --%>
<!-- <a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd> -->
<!-- 					</dl> -->
<!-- 					<dl> -->
<!-- 						<dt><label>PUBLISH_TIME:</label></dt> -->
<%-- 						<dd><input type="text" id="publishTime" name="publishTime" class="date" value="<fmt:formatDate value='${vm.publishTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/> --%>
<!-- <a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd> -->
<!-- 					</dl> -->
					<dl>
						<dt><label>上市开始时间:</label></dt>
						<dd><input type="text" id="startTime" name="startTime" class="date" value="<fmt:formatDate value='${vm.startTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/>
<a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd>
					</dl>
					<dl>
						<dt><label>上市结束时间:</label></dt>
						<dd><input type="text" id="endTime" name="endTime" class="date" value="<fmt:formatDate value='${vm.endTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/>
<a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd>
					</dl>
					<dl>
						<dt><label>规格:</label></dt>
						<dd><input type="text" id="branchInfo" name="branchInfo" class="required" size="30" value="${vm.branchInfo}" validate="{required:true}"/>						</dd>
					</dl>
					
					<dl>
						<dt><label>价格:</label></dt>
						<dd><input type="text" id="price" name="price" class="required" size="30" value="${vm.price}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>价格单位:</label></dt>
						<dd><input type="text" id="priceUnit" name="priceUnit" class="required" size="30" value="${vm.priceUnit}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>供应量:</label></dt>
						<dd><input type="text" id="quantity" name="quantity" class="required" size="30" value="${vm.quantity}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>供应量单位:</label></dt>
						<dd><input type="text" id="quantityUnit" name="quantityUnit" class="required" size="30" value="${vm.quantityUnit}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>区域:</label></dt>
						<dd><input type="text" id="region" name="region.regionName" class="required" size="30" value="${vm.region.regionName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>详细地址:</label></dt>
						<dd><input type="text" id="regionDetail" name="regionDetail" class="required" size="30" value="${vm.regionDetail}" validate="{required:true}"/>						</dd>
					</dl>
<!-- 					<dl> -->
<!-- 						<dt><label>USER_ID:</label></dt> -->
<%-- 						<dd><input type="text" id="userId" name="userId" class="required" size="30" value="${vm.userId}" validate="{required:true}"/>						</dd> --%>
<!-- 					</dl> -->
					<dl>
						<dt><label>品类名称:</label></dt>
						<dd><input type="text" id="category" name="category.categoryName" class="required" size="30" value="${vm.category.categoryName}" validate="{required:true}"/>						</dd>
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