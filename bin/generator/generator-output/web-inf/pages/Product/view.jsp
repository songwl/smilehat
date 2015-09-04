<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">NAME:</td>
					<td align="left">
${vm.name}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">TITLE:</td>
					<td align="left">
${vm.title}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">DESCRIPTION:</td>
					<td align="left">
${vm.description}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CREATE_TIME:</td>
					<td align="left">
<fmt:formatDate value='${vm.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">UPDATE_TIME:</td>
					<td align="left">
<fmt:formatDate value='${vm.updateTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">PUBLISH_TIME:</td>
					<td align="left">
<fmt:formatDate value='${vm.publishTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">START_TIME:</td>
					<td align="left">
<fmt:formatDate value='${vm.startTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">END_TIME:</td>
					<td align="left">
<fmt:formatDate value='${vm.endTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
				</tr>
				<tr>
					<td width="10%" align="right">BRANCH_INFO:</td>
					<td align="left">
${vm.branchInfo}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">PRICE_UNIT:</td>
					<td align="left">
${vm.priceUnit}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">PRICE:</td>
					<td align="left">
${vm.price}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">QUANTITY:</td>
					<td align="left">
${vm.quantity}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">QUANTITY_UNIT:</td>
					<td align="left">
${vm.quantityUnit}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_ID:</td>
					<td align="left">
${vm.regionId}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_DETAIL:</td>
					<td align="left">
${vm.regionDetail}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">USER_ID:</td>
					<td align="left">
${vm.userId}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CATEGORY_ID:</td>
					<td align="left">
${vm.categoryId}					</td>
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