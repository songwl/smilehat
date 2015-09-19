<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/productDetail.css" type="text/css" />

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>



<title>微笑草帽</title>
</head>
<body>
	<header>
		<div class="goback">
			<a href="${ctx}/trading/product/center">
        		<img class="back" src="${ctx}/static/images/logo.png"  alt="返回">
        	</a>
		</div>
        <div class="cur_title">
        	<label  class="page-title-text">产品详情</label>
        </div>
	</header>
		<div class="pageContent"> 
			<div class="farmContent" >
				<div>名称：${vm.name}  </div>     
				<div>价格：${vm.price} 
					<span id="showDictLabel" class="showDictLabel" dictType="PRICE_UNIT" dictCode="${vm.priceUnit}"></span> 
				</div>
				<div class="farmImg">
					<img src="${ctx}/${vm.user.photoAttach.downloadPath }">
				</div>
				<input type="hidden" name="user.id" value="${vm.user.id}">
				<div><a href="${ctx}/farm/detail/${vm.user.id}"> 商户名称：${vm.user.name} </a></div>    
				<div>规格：${vm.branchInfo}  </div>  
				<div>认证标签：
					<img class="product_cert"  src="${ctx}/static/images/location.png">
					<img class="product_cert" src="${ctx}/static/images/location.png">
					<img class="product_cert" src="${ctx}/static/images/location.png">
				</div>
				<div>上市时间：${vm.startTime}-${vm.endTime}</div>
<%-- 				<div>地址：${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName} ${vm.address}</div> --%>
				<div>
					描述：
					<textarea rows="" cols="" class="farmDesc" name="description" style="width: 100%;" wrap="virtual"   readonly="true">${vm.description}</textarea>
				</div>
<!-- 				<div> -->
<!-- 					联系方式：： -->
<!-- 					<a >点击获取联系方式</a> -->
<!-- 				</div> -->
			</div>
		</div>
</body>

<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>
</html>

