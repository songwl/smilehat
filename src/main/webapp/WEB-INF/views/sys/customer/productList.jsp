  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>
<form rel="pagerForm" method="post" action="${sctx}/customer/product/list/${userId}" onsubmit="return dwzSearch(this, 'dialog');">
</form>
<div class="pageContent">
	<table class="table" width="100%" layoutH="88">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="name"/>>产品名称</th>   
<!-- 				<th <tag:orderField name="title"/>>产品标题</th>    -->
				<th <tag:orderField name="publishTime"/>>发布时间</th>   
				<th >上市时间</th>	
				<th <tag:orderField name="branchInfo"/>>规格</th>   
				<th <tag:orderField name="price"/>>价格(单位)</th>   
				<th <tag:orderField name="quantity"/>>供应量(单位)</th>   
				<th <tag:orderField name="region.regionName"/>>区域名称</th>   
				<th <tag:orderField name="user.name"/>>所属商户</th>   
				<th <tag:orderField name="category.categoryName"/>>品类名称</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}/sys/product/update/${varitem.id}?navTabId=app_product" target="dialog" title="查看"> ${varitem.name} </a> 
					</td>   
<%-- 					<td> <a href="${ctx}/sys/product/update/${varitem.id}?navTabId=app_product" target="dialog" title="查看"> ${varitem.title} </a>  --%>
<!-- 					</td>    -->
					<td> <fmt:formatDate value='${varitem.publishTime}' pattern='yyyy-MM-dd'/> 
					</td>   
					<td> <fmt:formatDate value='${varitem.startTime}' pattern='yyyy-MM-dd'/>- 
						<fmt:formatDate value='${varitem.endTime}' pattern='yyyy-MM-dd'/> 
					
					</td>   
					<td> <a href="${ctx}/sys/product/update/${varitem.id}?navTabId=app_product" target="dialog" title="查看"> ${varitem.branchInfo} </a> 
					</td>   
					<td>${varitem.price} (${varitem.priceUnit}) 
					</td>  
					<td> ${varitem.quantity}(${varitem.quantityUnit})
					</td>   
					<td> ${varitem.region.regionName}
					</td>   
					<td>${varitem.user.name}
					</td>   
					<td>${varitem.category.categoryName} 
					</td>  
					<td><a title="删除" target="ajaxTodo" href="${ctx}/sys/product/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="dialogPageBreak({numPerPage:this.value},'customer-product')"></tag:pagination>
	</div>
</div>
