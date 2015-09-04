<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">CATEGORY_NAME:</td>
					<td align="left">
${vm.categoryName}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CATEGORY_CODE:</td>
					<td align="left">
${vm.categoryCode}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">PARENT_ID:</td>
					<td align="left">
${vm.parentId}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">SORT:</td>
					<td align="left">
${vm.sort}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CREATE_TIME:</td>
					<td align="left">
<fmt:formatDate value='${vm.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>					</td>
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