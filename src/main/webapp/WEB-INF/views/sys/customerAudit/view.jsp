<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<div class="pageContent">
<form method="POST" action="${sctx}/customerAudit/audit/${vm.id}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
	<tag:callback></tag:callback>
	<div class="pageFormContent" layoutH="56">
		<table class="viewTable">
			<tbody>
				<tr>
					<td width="15%" align="right">登录名(手机)：</td>
					<td width="30%" align="left">${vm.user.loginName}</td>
					<td width="15%" align="right">称呼：</td>
					<td align="left">${vm.user.name}</td>
				</tr>
				<tr>
					<td align="right">注册时间：</td>
					<td align="left"><fmt:formatDate value="${vm.user.registerDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					<td align="right"></td>
					<td align="left"></td>
				</tr>
				<tr>
					<td align="right" valign="top">头像：</td>
					<td align="left" colspan="3"><img src="${ctx}/${vm.user.photoAttach.downloadPath}" onerror="javascript:this.src='${ctx}/static/styles/base/images/user_default.jpg'" width="180"
						height="180" /></td>
				</tr>
				<tr>
					<td align="right">商户类型：</td>
					<td align="left"><s:message code="user.usertype.${vm.user.userType}"></s:message></td>
					<td align="right"></td>
					<td align="left"></td>
				</tr>
				<tr>
					<td align="right" valign="top">地址：</td>
					<td align="left" colspan="3">
						<c:if test="${not empty vm.region}">
							${vm.region.parent.parent.regionName}
							${vm.region.parent.regionName}
							${vm.region.regionName}
						</c:if>
						${vm.address}
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">签名：</td>
					<td align="left" colspan="3">
						${vm.signature}
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">详细说明：</td>
					<td align="left" colspan="3">
						${vm.description}
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">官网网址：</td>
					<td align="left" colspan="3">
						${vm.website}
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">审核：</td>
					<td align="left" colspan="3">
						<input type="radio" name="isAudit" value="1"  />通过
						<input type="radio" name="isAudit" value="0" checked />不通过
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="formBar">
		<ul>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="submit">提交</button>
					</div>
				</div>
			</li>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
</form>
</div>
