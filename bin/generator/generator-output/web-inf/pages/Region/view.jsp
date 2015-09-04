<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">REGION_CODE:</td>
					<td align="left">
${vm.regionCode}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_NAME:</td>
					<td align="left">
${vm.regionName}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">PARENT_ID:</td>
					<td align="left">
${vm.parentId}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_LEVEL:</td>
					<td align="left">
${vm.regionLevel}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_SORT:</td>
					<td align="left">
${vm.regionSort}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_NAME_EN:</td>
					<td align="left">
${vm.regionNameEn}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">REGION_SHORTNAME_EN:</td>
					<td align="left">
${vm.regionShortnameEn}					</td>
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