<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/custom.css">
<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/customerCenter.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/productPublish.css" type="text/css" />
<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
	</div>
	<div class="background-zhezhao">
	</div>
	<div id="main_div">
		<div id="header">
			<div id="help">
				<a href="${ctx}/trading/help">
		        	<img class="help-img" src="/smilehat/static/images/help.png" alt="帮助">
		        </a>
			</div>
			采购发布
			<div class="back">
	        <a href="javascript:history.back(-1);">
	        	<img class="search-img" src="/smilehat/static/images/back2.png" alt="返回">
	        </a>
        </div>
		</div>
		
		<div id="menu">
		    <form class="login-form m-login-form" action="${ctx}/trading/purchase/publish/save" method="post"  id="purchasePublishForm">
		    <div class="main-form">
				<div class="form-group">
					采购标题：
					<div class="input-icon" style="height: 35px;">
						<input name="title" class="form-control" type="text"  style="width: 100%;"/>
					</div>
				 </div>
				 <div class="form-group">
					品类名称：
					<div class="input-icon" style="height: 35px;">
						<select class="form-control" name="categoryId" value="${vm.category.id}">
							<option value="">------------请选择------------</option>
						  	<c:forEach items="${categorylist}" var="category">
						  		<optgroup label="${category.categoryName}">
							  		<c:if test="${not empty category.children}">
							  			<c:forEach items="${category.children}" var="child">
							  				<option value="${child.id}">${child.categoryName}</option>
							  			</c:forEach>
							  		</c:if>
						  		</optgroup>
						  	</c:forEach>
						</select>
					</div>
				 </div>
				 <div class="form-group">
					规格：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="branch" name="branch" placeholder="规格" class="form-control"  size="18" style="width: 40%;"/>
						<select  id="branchInfo" name=branchInfo  class="form-control combox"  selectedValue="${vm.branchInfo}"   dataUrl="${sctx}/dict/selectDictByType?dictType=BRANCH_INFO">
							<option value="">请选择</option>
						</select>
					</div>
				 </div>
				 <div class="form-group">
					价格：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="price" name="price" placeholder="数字" class="form-control more-price"  style="width: 25%;" size="18" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" />		
						<span style="float:left;line-height: 35px;">&nbsp;至&nbsp;</span>
						<input type="text" id="price2" name="price2" placeholder="数字"   class="form-control more-price" style="width: 25%;" size="18" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" />		
						<select  id="priceUnit" name="priceUnit"  class="form-control combox" style="width: 30%;" dataUrl="${sctx}/dict/selectDictByType?dictType=PRICE_UNIT">
						</select>	
					</div>
				 </div>
				 <div class="form-group">
					采购量：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="quantity" name="quantity" placeholder="请输入数字" class="form-control" size="18"  onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');"/>	
						<select id="quantityUnit" name="quantityUnit"  class="form-control combox" dataUrl="${sctx}/dict/selectDictByType?dictType=QUANTITY_UNIT">
							<option value="">请选择</option>
						</select>	
					</div>
				 </div>
				<div class="form-group">
					产地：
					<div class="input-icon" style="height: 35px;">
						<select class="form-control combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${ctx}/sys/region/selectJson" refUrl="${ctx}/sys/region/selectJson?pid={value}" style="width: 27%;float: left;">
							<option value="">----省----</option> 
						</select>
						<select class="form-control combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${ctx}/sys/region/selectJson?pid={value}" 
								<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if> style="width: 27%;float: left;">
							<option value="">----市----</option> 
						</select>
						<select class="form-control combox" name="regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.id}"</c:if> style="width: 27%;float: left;">
							<option value="">----区----</option> 
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="input-icon" style="height: 35px;">
						<input type="text" name="address" value="${vm.regionDetail}" class="form-control" style="width: 100%;" placeholder="请输入产地要求" autocomplete="off"/>
					 </div>
				 </div>
				 <div class="form-group">
				 	产品描述:
					<div class="input-icon" style="height: 80px;">
						<textarea rows="" cols="" id="description" name="description" style="width: 100%;">${vm.description}</textarea>
					 </div>
				 </div>
				
				<div class="form-actions">
					<a class="btn-submit">发布</a>
				</div>
				</div>
			</form>
		</div> 
	</div>
		<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
 <script src="${ctx}/static/js/hfive/custom.js"></script>
 <script src="${ctx}/static/js/hfive/combox.js"></script>
 <script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>
 <script>
	$(function(){
		    $("select.combox").comboxSelectRemoteData();

		    $(".btn-submit").click(function(){
		    	var $form = $("#purchasePublishForm");
		    	$.post($form.attr("action"), $form.serialize(),
    			   function(json){
		    		if(json){
		    			C.localAlert({
							type: '',
							msg: json.message
						});
		    			
		    			if(json.message=='创建成功'){
		    				location.href='${ctx}/trading/purchase/center';
		    			}else{
		    				location.href='${ctx}/login';
		    			}
		    		}else{
		    			C.localAlert({
							type: '',
							msg: '系统繁忙！'
						});
		    		}
		    		
    			   }, "json");
		    });
	});

</script>
</body>
</html>