<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/region/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<vsc:token tokenName="sys.region.create"></vsc:token>
		<vsc:callback></vsc:callback>
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