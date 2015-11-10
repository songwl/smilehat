<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>


<div class="pageContent">
	<div class="tabs" currentIndex="0" eventType="click" >
		<div class="tabsHeader">
			<div class="tabsHeaderContent">
				<ul>
					<li><a href="javascript:;"><span>商户信息</span></a></li>
					<c:if test="${not empty vm.id }">
					<li><a href="${sctx}/customer/product/list/${vm.user.id}" class="j-ajax"><span>商户产品</span></a></li>
					<li><a href="${sctx}/customer/purchase/list/${vm.user.id}" class="j-ajax"><span>采购信息</span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="tabsContent" style="height:150px;" layoutH="28">
			<div id="customer-base">
				<form method="post" action="${sctx}/customer/${action}" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
					<input type="hidden" name="id" value="${id}">
					<tag:token tokenName="sys.customer.create"></tag:token>
					<tag:callback></tag:callback>
					<div class="pageFormContent" >
						<input type="hidden" name="user.id" value="${vm.user.id}">
						<dl class="nowrap">
							<dt>登录名(手机)：</dt>
							<dd>
								<input name="user.loginName" alt="请输入手机号" class="required ignoreKeyUp" type="text" size="30" value="${vm.user.loginName}"
									validate="{required:true,rangelength:[11,11],remote:'${ctx}/sys/user/checkloginname?oldLoginName=${vm.user.loginName}',messages:{remote:'登录名已存在'}}" />
							</dd>
						</dl>
						<br/>
						<dl class="nowrap">
							<dt>商户名称：</dt>
							<dd>
								<input name="user.name" class="required" type="text" size="30" value="${vm.user.name}" validate="{required:true}" />
							</dd>
						</dl>
						<br/>
						<c:if test="${action=='create'}">
							<dl class="nowrap">
								<dt>密码：</dt>
								<dd>
									<input id="plainPassword" class="required" name="user.plainPassword" type="password" size="30" value="" validate="{required:true,rangelength:[3,20]}" />
								</dd>
							</dl>
							<br/>
							<dl class="nowrap">
								<dt>密码确认：</dt>
								<dd>
									<input id="confirmPassword" class="required" name="user.confirmPassword" type="password" size="30" value="" alt="请再次输入密码" validate="{equalTo:'#plainPassword'}" />
								</dd>
							</dl>
						</c:if>	
						<dl class="nowrap">
							<dt>联系电话：</dt>
							<dd>
								<input name="user.phone" alt="请输入联系电话"  type="text" size="30" value="${vm.user.phone}"/>
							</dd>
						</dl>
						<br/>
						<%-- <dl class="nowrap">
							<dt>使用状态：</dt>
							<dd>
								<label><form:radiobutton path="vm.isEnabled" value="true" validate="{required:true}" /> <s:message code="customer.isenabled.true" /></label> <label><form:radiobutton
										path="vm.isEnabled" value="false" /> <s:message code="user.isenabled.false" /></label>   <span for="isEnabled" generated="true" class="error"
									style="display: none"></span>
							</dd>
						</dl>	 --%>		
						<dl class="nowrap"><hr/></dl>
						<!-- 商户信息 -->
						<dl class="nowrap">
							<dt>商户类型：</dt>
							<dd>
								<select name="user.userType" class="required">
									<option value="PERSON" <c:if test="${vm.user.userType=='PERSON'}">selected</c:if>>个人</option>
									<option value="DEALER" <c:if test="${vm.user.userType=='DEALER'}">selected</c:if>>特约经销商</option> 
									<option value="FARMER" <c:if test="${vm.user.userType=='FARMER'}">selected</c:if>>农场</option>  
								</select>
							</dd>
						</dl> 
						<dl class="nowrap">
							<dt>地址：</dt>
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
							<dt>地址详细：</dt>
							<dd>
								<input type="text" name="address" value="${vm.address}"   style="width: 480px;" />
							</dd>
						</dl>
<!-- 						<dl class="nowrap"> -->
<!-- 							<dt>签名：</dt> -->
<!-- 							<dd> -->
<%-- 								<input type="text" name="signature" value="${vm.signature}" style="width: 480px;" /> --%>
<!-- 							</dd> -->
<!-- 						</dl> -->
						<dl class="nowrap">
							<dt>详细说明：</dt>
							<dd>
								<textarea rows="" cols="" name="description" style="width: 480px;">${vm.description}</textarea>
							</dd>
						</dl>
						<dl class="nowrap">
							<dt>官网网址：</dt>
							<dd>
								<input type="text" name="website" value="${vm.website}" style="width: 480px;" />
							</dd>
						</dl>
						<dl class="nowrap">
							<dt>是否专区：</dt>
							<dd>
							<c:if test="${!empty varitem.user.backgroundColor}"> style="background-color: ${varitem.user.backgroundColor};"</c:if> 
								<input type="radio" name="isArea" value="1" <c:if test="${vm.isArea==true}"> checked="checked"</c:if> />是
								<input type="radio" name="isArea" value="0" <c:if test="${vm.isArea==false}"> checked="checked"</c:if>  />否
							</dd>
						</dl>
						<dl class="nowrap">
							<dt>备注：</dt>
							<dd>
								<input type="text" name="remarks" value="${vm.remarks}" style="width: 480px;" />
							</dd>
						</dl>
						
						<dl class="nowrap">
							<dt>认证图片：</dt>
							<dd>
								<tag:multipleFileUpload uploadifyFileId="sys_identity_attachs_uploadifyFileId" hiddenName="identityAttachIds" attachs="${vm.user.identityAttachs}"></tag:multipleFileUpload>
							</dd>
						</dl>
						<dl class="nowrap">
							<dt>商户图片：</dt>
							<dd>
								<tag:multipleFileUpload uploadifyFileId="sys_user_attachs_uploadifyFileId" hiddenName="attachIds" attachs="${vm.user.attachs}"></tag:multipleFileUpload>
							</dd>
						</dl>
						<c:if test="${not empty vm.id}">
						<dl class="nowrap">
							<dt><label>商户标签:</label></dt>
							<dd>
								<c:forEach items="${certLabelList}" var="certItem">
									<input type="checkbox" value="${certItem.id}" name="certLabels" <c:if test="${not empty vm.user.certLabelMap[certItem.id]}">checked="checked"</c:if> />${certItem.certName}  
								</c:forEach>
							</dd>
						</dl>
						</c:if>
						<dl class="nowrap">
							<dt>前台显示背景色：</dt>
							<dd class="bgcolor">
								<input type="text" id="color" name="color" <c:if test="${not empty vm.user.backgroundColor}">value="${vm.user.backgroundColor}"</c:if> <c:if test="${empty vm.user.backgroundColor}">value="none"</c:if> />
								<div class="buttonContent"><button id="clearColor" type="button">清除</button></div>
								<div id="colorpicker"></div>
							</dd>
						</dl>
					</div>
					
					<div class="formBar">
						<ul>
							<li><div class="buttonActive">
									<div class="buttonContent">
										<button type="submit">保存</button>
									</div>
								</div></li>
							<li>
								<div class="button">
									<div class="buttonContent">
										<button type="button" class="close">取消</button>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</form>
			</div>
			<div id="customer-product"></div>
			<div id="customer-purchase"></div>
		</div>
	</div>
	
	
</div>
<script type="text/javascript">

  $(document).ready(function() {

    $('#colorpicker').farbtastic('#color');
    
	$("#clearColor").click(function(){
		//$('#colorpicker').setColor("none");
		$("#color").css("background","none");
		$("#color").val(" ");
	})
  });

</script>
