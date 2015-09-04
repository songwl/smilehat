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
					<td width="10%" align="right">INTRODUCTION:</td>
					<td align="left">
${vm.introduction}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">DESCRIPTION:</td>
					<td align="left">
${vm.description}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">WEBSITE:</td>
					<td align="left">
${vm.website}					</td>
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
					<td width="10%" align="right">CONTACT:</td>
					<td align="left">
${vm.contact}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">ATTACH_ID:</td>
					<td align="left">
${vm.attachId}					</td>
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