<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">

	<div class="pageFormContent" layoutH="56"> 
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="10%" align="right">CERT_NAME:</td>
					<td align="left">
${vm.certName}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">IS_ALLOW_CHECK:</td>
					<td align="left">
${vm.isAllowCheck}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CERT_DESC:</td>
					<td align="left">
${vm.certDesc}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CERT_TYPE:</td>
					<td align="left">
${vm.certType}					</td>
				</tr>
				<tr>
					<td width="10%" align="right">CERT_TYPE2:</td>
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