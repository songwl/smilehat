<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">政府名称:</td>
					<td align="left">
${vm.name}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">政府简介:</td>
					<td align="left">
${vm.introduction}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">详细信息:</td>
					<td align="left">
${vm.description}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">官方网址:</td>
					<td align="left">
${vm.website}					</td>
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
					<td width="10%" align="right">联系方式:</td>
					<td align="left">
${vm.contact}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">缩略图:</td>
					<td align="left">
${vm.attachId}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">创建时间:</td>
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