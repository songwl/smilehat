<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">认证标签名称:</td>
					<td align="left">
${vm.certName}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">是否可选择:</td>
					<td align="left">
${vm.isAllowCheck}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">认证描述:</td>
					<td align="left">
${vm.certDesc}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">认证分类:</td>
					<td align="left">
${vm.certType}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">认证二级分类:</td>
					<td align="left">
${vm.certType2}					</td>
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