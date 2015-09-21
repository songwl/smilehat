<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/customerCenter.css" type="text/css" />

<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
	</div>
	<div class="background-zhezhao">
	</div>
	<div id="main_div">
		<div id="header">
			产品发布
		</div>
		<div id="menu">
		    <form class="login-form m-login-form" action="${ctx}/register" method="post">
		        <div class="form-group">
					产品名称：
					<div class="input-icon" style="height: 35px;">
						<input name="user.name" class="form-control" type="text" size="30" style="width: 100%;" validate="{required:true}" />
					</div>
				 </div>
				<div class="form-group">
					产品标题：
					<div class="input-icon" style="height: 35px;">
						<input name="user.name" class="form-control" type="text"  style="width: 100%;" validate="{required:true}"/>
					</div>
				 </div>
				 <div class="form-group">
					品类名称：
					<div class="input-icon" style="height: 35px;">
						<input type="hidden" name="categoryId" id="categoryTree.id" value="${vm.category.id}" /> 
						<input  class="form-control" name="categoryName" id="categoryTree.name" value="${vm.category.categoryName}" type="text" readonly="readonly" /> 
						<a class="btnLook" href="${sctx}/category/select" lookupGroup="categoryTree">查找带回</a>
					</div>
				 </div>
				 <div class="form-group">
					上市时间：
					<div class="input-icon" style="height: 35px;">
						<input class="form-control" type="text" id="startTime" name="startTime" class="date" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
						<span style="float:left;">&nbsp;至&nbsp;</span>
						<input class="form-control" type="text" id="endTime" name="endTime" class="date" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss'/>" dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true" />
					</div>
				 </div>
				 <div class="form-group">
					规格：
					<div class="input-icon" style="height: 35px;">
						<select  id="branchInfo" name=branchInfo  class="form-control combox"  selectedValue="${vm.branchInfo}"   dataUrl="${sctx}/dict/selectDictByType?dictType=BRANCH_INFO">
						</select>
					</div>
				 </div>
				 <div class="form-group">
					价格：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="price" name="price" class="form-control" size="18"  validate="{required:true}"/>		
						<select  id="priceUnit" name="priceUnit"  class="form-control combox"  dataUrl="${sctx}/dict/selectDictByType?dictType=PRICE_UNIT">
						</select>	
					</div>
				 </div>
				 <div class="form-group">
					供应量：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="quantity" name="quantity" class="form-control" size="18"  />	
						<select id="quantityUnit" name="quantityUnit"  class="form-control combox" dataUrl="${sctx}/dict/selectDictByType?dictType=QUANTITY_UNIT">
						</select>	
					</div>
				 </div>
				<div class="form-group">
					交易地址：
					<div class="input-icon" style="height: 35px;">
						<select class="form-control combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${ctx}/sys/region/selectJson" refUrl="${ctx}/sys/region/selectJson?pid={value}" style="width: 27%;float: left;">
							<option value="">----省----</option> 
						</select>
						<select class="form-control combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${ctx}/sys/region/selectJson?pid={value}" 
								<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if> style="width: 27%;float: left;">
							<option value="">----市----</option> 
						</select>
						<select class="form-control combox" name="customer.regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.id}"</c:if> style="width: 27%;float: left;">
							<option value="">----区----</option> 
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="input-icon" style="height: 35px;">
						<input type="text" name="address" value="${vm.address}" class="form-control" style="width: 100%;" placeholder="请输入您的详细地址" autocomplete="off"/>
					 </div>
				 </div>
				 <div class="form-group">
				 	产品描述:
					<div class="input-icon" style="height: 35px;">
						<textarea rows="" cols="" id="description" name="description" style="width: 100%;">${vm.description}</textarea>
					 </div>
				 </div>
				
				<div class="form-actions">
					<a class="btn-submit">保存</a>
				</div>
			</form>
		</div> 
	</div>
		
 <script src="${ctx}/static/js/hfive/custom.js"></script>
 <script src="${ctx}/static/js/hfive/combox.js"></script>
 <script>
	$(function(){
		    $("select.combox").comboxSelectRemoteData();
	});

</script>
</body>
</html>