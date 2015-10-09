<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/government/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="id" value="${id}">
		<tag:token tokenName=".government.create"></tag:token>
		<tag:callback></tag:callback>
		<div class="pageFormContent" layoutH="56">
					<dl class="nowrap">
						<dt><label>政府名称:</label></dt>
						<dd><input type="text" id="name" name="name" class="required" size="30" value="${vm.name}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>政府简介:</label></dt>
						<dd><input type="text" id="introduction" name="introduction" class="required" size="30" value="${vm.introduction}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>详细信息:</label></dt>
						<dd><input type="text" id="description" name="description" class="required" size="30" value="${vm.description}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>官方网址:</label></dt>
						<dd><input type="text" id="website" name="website" class="required" size="30" value="${vm.website}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>区域:</label></dt>
						<dd>
							<select class="required combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${sctx}/region/selectJson" refUrl="${sctx}/region/selectJson?pid={value}">
								<option value="">----省----</option> 
							</select>
							<select class="required combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${sctx}/region/selectJson?pid={value}" 
									<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if>>
								<option value="">----市----</option> 
							</select>
							<select class="required combox" name="regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${sctx}/region/selectJson?pid=${vm.region.parent.id}"</c:if>>
								<option value="">----区----</option> 
							</select>
						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>详细地址:</label></dt>
						<dd><input type="text" id="regionDetail" name="regionDetail" class="required" size="30" value="${vm.regionDetail}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>联系方式:</label></dt>
						<dd><input type="text" id="contact" name="contact" class="required" size="30" value="${vm.contact}" validate="{required:true}"/>						</dd>
					</dl>
					<dl class="nowrap">
						<dt><label>图:</label></dt>
						<dd><input type="text" id="attachId" name="attachId" class="required" size="30" value="${vm.attachId}" validate="{required:true}"/>						</dd>
					</dl>
<!-- 					<dl> -->
<!-- 						<dt><label>CREATE_TIME:</label></dt> -->
<%-- 						<dd><input type="text" id="createTime" name="createTime" class="date" value="<fmt:formatDate value='${vm.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" validate="{required:true}"/> --%>
<!-- <a class="inputDateButton" href="javascript:void(0);">选择</a>						</dd> -->
<!-- 					</dl> -->
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