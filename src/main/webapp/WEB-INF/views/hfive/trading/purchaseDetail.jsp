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
<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		<div class="back">
<%-- 	        <a href="${ctx}/trading/product/center"> --%>
			<a href="javascript:history.back(-1);">
	        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="返回">
	        </a>
        </div>
		<div class="pageContent"> 
			<div class="farmContent" >
				<div class="d_item" id="d_main">
					<h2>${vm.title} </h2>
					<div class="d_main_left">
						<div>${vm.category.categoryName}</div>
						<div>${vm.user.name}</div>
					</div>
					<div class="d_main_right">
						<span class="unit">￥</span> 
						<c:if test="${ vm.price==0.0 && vm.price2==0.0}">面议 </c:if>
						<c:if test="${ vm.price==0.0 && vm.price2!=0.0}">${vm.price2}  </c:if>
						<c:if test="${ vm.price!=0.0 && vm.price2==0.0}">${vm.price}  </c:if>
						<c:if test="${ vm.price!=0.0 && vm.price2!=0.0}">${vm.price}- ${vm.price2} </c:if>
						<span id="showDictLabel" class="unit showDictLabel" dictType="PRICE_UNIT" dictCode="${vm.priceUnit}"></span>
					</div>
				</div>
				<div class="d_item" id="d_unit">
					<h5 class="d_item_title">规格 / 采购量</h5>
					<div class="d_item_content">
						<div class="d_item_branch">
							${vm.branch}
							<span id="showDictLabel" class="unit showDictLabel" dictType="BRANCH_INFO" dictCode="${vm.branchInfo}"></span>
						</div>
						<div class="d_item_quantity">${vm.quantity}&nbsp;<span id="showDictLabel" class="unit showDictLabel" dictType="QUANTITY_UNIT" dictCode="${vm.quantityUnit}"></span></div>
					</div>
				</div>
				<div class="d_item" id="d_region">
					<h5 class="d_item_title">交付地址</h5>
					<div class="d_item_content">${vm.user.customer.region.parent.parent.regionName} ${vm.user.customer.region.parent.regionName} ${vm.user.customer.region.regionName}</div>
				</div>
				<div class="d_item" id="d_region">
					<h5 class="d_item_title">产地要求</h5>
					<div class="d_item_content">${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName}</div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">详细说明</h5>
					<div class="d_item_content"><tag:htmlparse content="${vm.description}" /></div>
				</div>
				<c:if test="${!empty vm.user.phone}">
					<div class="d_info">
						<div class="d_info_item">
							<a href="javascript:void(0);"  <shiro:user>info="${vm.user.phone}"</shiro:user> <shiro:guest>info="nologin"</shiro:guest> >
								点击获取联系方式
							</a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/inc/hfive/include.foot.jsp"%>
		<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	</div>
</body>

<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>
<script type="text/javascript">
	$(function(){
		$(".d_info_item a").click(function(){
			var info = $(this).attr("info");
			if(info == 'nologin'){
				$(this).text("请先登录或注册！");
				$(this).attr("href","${ctx}/login");
			}else{
				$(this).text(info);
			}
		});
	});
</script>
</html>

