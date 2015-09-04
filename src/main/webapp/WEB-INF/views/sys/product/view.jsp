<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">产品名称:</td>
					<td align="left">
${vm.name}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">产品标题:</td>
					<td align="left">
${vm.title}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">产品描述:</td>
					<td align="left">
${vm.description}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">创建时间:</td>
					<td align="left">
<fmt:formatDate value='${vm.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">更新时间:</td>
					<td align="left">
<fmt:formatDate value='${vm.updateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">发布时间:</td>
					<td align="left">
<fmt:formatDate value='${vm.publishTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">上市开始时间:</td>
					<td align="left">
<fmt:formatDate value='${vm.startTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">上市结束时间:</td>
					<td align="left">
<fmt:formatDate value='${vm.endTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">规格:</td>
					<td align="left">
${vm.branchInfo}					</td>
				</tr>
				
				<tr>
					<td width="10%" align="right">价格:</td>
					<td align="left">
${vm.price}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">价格单位:</td>
					<td align="left">
${vm.priceUnit}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">供应量:</td>
					<td align="left">
${vm.quantity}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">供应量单位:</td>
					<td align="left">
${vm.quantityUnit}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">区域:</td>
					<td align="left">
${vm.region.regionName}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">详细地址:</td>
					<td align="left">
${vm.regionDetail}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">USER_ID:</td>
					<td align="left">
${vm.userId}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">品类名称:</td>
					<td align="left">
${vm.category.categoryName}					</td>
				</tr>
			</tbody>
		</table> 
	</div>
	<div class="formBar">
		<ul>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div>
			</li>
		</ul>
	</div>

</div>