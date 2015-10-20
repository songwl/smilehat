<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click" >
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>政府信息</span></a></li>
					<c:if test="${not empty vm.id }">
					<c:forEach items="${vm.catalogList}" var="catalog" varStatus="c_inx">
						<li><a href="${sctx}/governmentcatalog/update/${vm.id}/${catalog.id}" class="j-ajax"><span>子栏目${c_inx.count}</span></a></li>
					</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height:150px;" layoutH="28">
			<div id="government-base">
				<form method="post" action="${ctx}/sys/government/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
					<input type="hidden" name="id" value="${id}">
					<tag:token tokenName=".government.create"></tag:token>
					<tag:callback></tag:callback>
					<div class="pageFormContent">
								<dl class="nowrap">
									<dt><label>政府名称:</label></dt>
									<dd><input type="text" id="name" name="name" class="required" size="30" value="${vm.name}" validate="{required:true}"/>						</dd>
								</dl>
								<dl class="nowrap">
									<dt><label>政府简介:</label></dt>
									<dd>
										<textarea id="introduction" name="introduction" class="required" rows="3" cols="40" validate="{required:true}" >${vm.introduction}</textarea>
									</dd>
								</dl>
								<dl class="nowrap">
									<dt><label>政府详细说明:</label></dt>
									<dd>
										<textarea id="description" name="description" class="required" rows="5" cols="40" validate="{required:true}" >${vm.description}</textarea>
									</dd>
								</dl>
								<dl class="nowrap">
									<dt><label>官方网址:</label></dt>
									<dd><input type="text" id="website" name="website" size="30" value="${vm.website}" />						</dd>
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
									<dd><input type="text" id="regionDetail" name="regionDetail" class="required" size="50" value="${vm.regionDetail}" validate="{required:true}"/></dd>
								</dl>
								<dl class="nowrap">
									<dt><label>联系方式:</label></dt>
									<dd><input type="text" id="contact" name="contact" class="required" size="30" value="${vm.contact}" validate="{required:true}"/></dd>
								</dl>
								<dl class="nowrap">
									<dt><label>图:</label></dt>
									<dd>
										<tag:multipleFileUpload uploadifyFileId="sys_government_attachs_uploadifyFileId" hiddenName="attachIds" attachs="${vm.attachList}"></tag:multipleFileUpload>
									</dd>
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
			<c:if test="${not empty vm.id }">
			<c:forEach items="${vm.catalogList}" var="catalog" varStatus="c_inx">
				<div id="government-catalog-${c_inx.count}"></div>
			</c:forEach>
			</c:if>
			
		</div>
	</div>

	
</div>