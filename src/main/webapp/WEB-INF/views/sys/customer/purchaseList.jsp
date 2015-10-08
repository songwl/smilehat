  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>
<form rel="pagerForm" method="post" action="${sctx}/customer/purchase/list/${userId}" onsubmit="return dwzSearch(this, 'dialog');">
</form>

<div class="pageContent">
	<table class="table" width="100%" layoutH="88">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="user.name"/>>商户名称</th>   
				<th <tag:orderField name="category.categoryName"/>>品类名称</th>   
				<th <tag:orderField name="title"/>>标题</th>   
				<th <tag:orderField name="quantity"/>>采购量(单位)</th>   
<!-- 				<th <tag:orderField name="price"/>>采购价格(单位)</th>    -->
				<th <tag:orderField name="publishTime"/>>发布时间</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> ${varitem.user.name} 
					</td>   
					<td> ${varitem.category.categoryName} 
					</td>   
					<td> <a href="${ctx}/sys/purchase/update/${varitem.id}?navTabId=app_purchase" target="dialog" title="查看"> ${varitem.title} </a> 
					</td>   
					<td>  ${varitem.quantity} ( ${varitem.quantityUnit})
					</td>   
<%-- 					<td> ${varitem.price} (${varitem.priceUnit} ) --%>
<!-- 					</td>    -->
					<td> <fmt:formatDate value='${ varitem.publishTime}' pattern='yyyy-MM-dd'/> 
					</td>  
					<td><a title="编辑" target="dialog" ref="purchase_update" href="${ctx}/sys/purchase/update/${varitem.id}?navTabId=app_purchase" class="btnEdit">编辑</a> 
						<a title="删除" target="ajaxTodo" href="${ctx}/sys/purchase/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="dialogPageBreak({numPerPage:this.value},'customer-purchase')"></tag:pagination>
	</div>
</div>
