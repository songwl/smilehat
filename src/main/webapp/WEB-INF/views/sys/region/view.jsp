<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="30%" align="right">区域CODE:</td>
					<td align="left">
${vm.regionCode}					</td>
				</tr>
				<tr>
					<td width="30%" align="right">区域名称:</td>
					<td align="left">
${vm.regionName}					</td>
				</tr>
				<tr>
					<td width="30%" align="right">上级区域:</td>
					<td align="left">
${vm.parent.regionName}					</td>
				</tr>
				<tr>
					<td width="30%" align="right">区域等级:</td>
					<td align="left">
${vm.regionLevel}					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td width="30%" align="right">REGION_SORT:</td> -->
<!-- 					<td align="left"> -->
<%-- ${vm.regionSort}					</td> --%>
<!-- 				</tr> -->
				<tr>
					<td width="30%" align="right">区域英文名称:</td>
					<td align="left">
${vm.regionNameEn}					</td>
				</tr>
				<tr>
					<td width="30%" align="right">区域英文缩写:</td>
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