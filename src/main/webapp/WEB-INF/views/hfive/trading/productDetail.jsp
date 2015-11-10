<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/productDetail.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/swiper/swiper.min.css" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/swiper/swiper.min.js"></script>

<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		
        <div id="header-img">
		<!-- 焦点图 S -->
			<div class="swiper-container swiper-top">
				<div class="swiper-wrapper">
					<c:if test="${not empty vm.attachs}">
						<c:forEach items="${vm.attachs}" var="image">
							<div class="swiper-slide">
								<a href="javascript:;">
									<img class="farm-img"  alt="" src="${ctx}/${image.downloadPath}" onerror="javascript:this.src='${ctx}/static/images/farmDBg.png'" >
								</a>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty vm.attachs}">
						<div class="swiper-slide">
							<a href="javascript:;">
								<img class="farm-img" alt="" src="${ctx}/static/images/farmDBg.png" />
							</a>
						</div>
					</c:if>
				</div>
				<div class="swiper-pagination swiper-pagination-top"></div>
			</div>
		<!-- 焦点图 E -->
		</div>
		<div class="back">
	        <a href="javascript:history.back(-1);">
	        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="返回">
	        </a>
        </div>
		<div class="pageContent"> 
			<div class="farmContent" >
				<div class="d_item" id="d_main">
					<h2>${vm.name} </h2>
					<div class="veiwCert">
						<c:forEach items="${vm.certLabelList}" var="cert">
							<img class="product_cert"  src="${ctx}/${cert.photoAttach.downloadPath}" />
						</c:forEach>
					</div>
					<div class="d_main_left">
						<div>${vm.category.categoryName}</div>
						<a href="${ctx}/farm/detail/${vm.user.customer.id}"><div>${vm.user.name}</div></a>
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
				
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">起订量</h5>
					<div class="d_item_content">
					<c:if test="${not empty vm.minOrder}">
					 ${vm.minOrder} 起订
					 </c:if>
					</div>
				</div>
				
				<div class="d_item" id="d_unit">
					<h5 class="d_item_title">规格 / 供应量</h5>
					<div class="d_item_content">
						<div class="d_item_branch">
							${vm.branch}
<%-- 							<span id="showDictLabel" class="unit showDictLabel" dictType="BRANCH_INFO" dictCode="${vm.branchInfo}"></span> --%>
						</div>
						<div class="d_item_quantity">
							${vm.quantity}
<%-- 						&nbsp;
							<span id="showDictLabel" class="unit showDictLabel" dictType="QUANTITY_UNIT" dictCode="${vm.quantityUnit}"> --%>
<!-- 							</span> -->
						</div>
					</div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">品牌</h5>
					<div class="d_item_content">${vm.trademark} </div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">包装方式</h5>
					<div class="d_item_content">${vm.packing} </div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">贮藏方式</h5>
					<div class="d_item_content">${vm.depot} </div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">保质期</h5>
					<div class="d_item_content">${vm.expiratinDate} </div>
				</div>
				<div class="d_item" id="d_region">
					<h5 class="d_item_title">产地</h5>
					<div class="d_item_content">${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName} </div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">供应期</h5>
					<div class="d_item_content">${vm.startTime}-${vm.endTime} </div>
					<div class="d_item_content">${vm.startTime2}-${vm.endTime2} </div>
					<div class="d_item_content">${vm.startTime3}-${vm.endTime3} </div>
				</div>
				<div class="d_item" id="d_memo">
					<h5 class="d_item_title">产品特色</h5>
					<div class="d_item_content"><tag:htmlparse content="${vm.description}" /> </div>
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
	
	var topSliderSwiper = new Swiper('.swiper-top', {
		pagination: '.swiper-pagination-top',
		autoplay: 3000,
		autoplayDisableOnInteraction: false,
		loop: true,
		effect: 'fade',
		observe: true,
		observeParents: true,
		paginationClickable: false,
		runCallbacksOnInit: true,
		paginationBulletRender: function (index, className) {
				return '<span class="' + className + '"></span>';
		},
		onSlideChangeEnd: function(swiper) {
		}
});
});
	
</script>
</html>

