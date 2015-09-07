<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/region/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName="sys.region.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
					<dl>
						<dt><label>区域CODE:</label></dt>
						<dd><input type="text" id="regionCode" name="regionCode" class="required" size="30" value="${vm.regionCode}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>区域名称:</label></dt>
						<dd><input type="text" id="regionName" name="regionName" class="required" size="30" value="${vm.regionName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>上级区域:</label></dt>
<!-- 						<dd> -->
<%-- 							<input type="hidden" class="changeValidate" name="regionTree.id" value="${vm.parent.id}" <c:if test="${not empty id}">validate="{remoteAsync:'${sctx}/region/checkparent?id=${vm.id}',messages:{remoteAsync:'上级栏目部不能是当前栏目的子栏目'}}"</c:if>/>  --%>
<%-- 							<input name="regionTree.name" value="${vm.parent.regionName}" type="text" readonly="readonly" />  --%>
<%-- 							<a class="btnLook" href="${sctx}/region/select" lookupGroup="regionTree">查找带回</a> --%>
<!-- 						</dd> -->
						<dd><input type="text" id="parent" name="parent.regionName" class="required" size="30" value="${vm.parent.regionName}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>区域等级:</label></dt>
						<dd><input type="text" id="regionLevel" name="regionLevel" class="required" size="30" value="${vm.regionLevel}" validate="{required:true}"/>						</dd>
					</dl>
<!-- 					<dl> -->
<!-- 						<dt><label>REGION_SORT:</label></dt> -->
<%-- 						<dd><input type="text" id="regionSort" name="regionSort" class="required" size="30" value="${vm.regionSort}" validate="{required:true}"/>						</dd> --%>
<!-- 					</dl> -->
					<dl>
						<dt><label>区域英文名称:</label></dt>
						<dd><input type="text" id="regionNameEn" name="regionNameEn" class="required" size="30" value="${vm.regionNameEn}" validate="{required:true}"/>						</dd>
					</dl>
					<dl>
						<dt><label>区域英文缩写:</label></dt>
						<dd><input type="text" id="regionShortnameEn" name="regionShortnameEn" class="required" size="30" value="${vm.regionShortnameEn}" validate="{required:true}"/>						</dd>
					</dl>
		</div>
		<div class="formBar">
			<ul> 
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>