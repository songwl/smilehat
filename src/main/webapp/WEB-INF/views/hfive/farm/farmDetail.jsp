<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/farmDetail.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/swiper/swiper.min.css" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/swiper/swiper.min.js"></script>

<title>微笑草帽</title>
</head>
<body>
	<div id="header-img">
		<!-- 焦点图 S -->
		<div class="swiper-container swiper-top">
			<div class="swiper-wrapper">
				<c:if test="${not empty vm.user.attachs}">
					<c:forEach items="${vm.user.attachs}" var="image">
						<div class="swiper-slide">
							<a href="javascript:;">
								<img class="farm-img"  alt="" src="${ctx}/${image.downloadPath}" onerror="javascript:this.src='${ctx}/static/images/farmDBg.png'" >
							</a>
						</div>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty vm.user.attachs}">
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
	<div class="pageContent"> 
		<input type="hidden" name="user.id" value="${vm.user.id}">
		
			<div class="row1">
				<div class="left">
					${vm.user.name}
				</div>
				<div class="right">
					<div class="up">
						认证标签
					</div>
					<div class="down" >
						<c:forEach items="${vm.user.labels}" var="label">
							<img class="product_cert"  src="${ctx}/${label.photoAttach.downloadPath}" />
						</c:forEach>
<%-- 						<img class="product_cert"  src="${ctx}/static/images/location.png"> --%>
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
					</div>
				</div>
			</div>
			<div class="rowline">
			</div>
			<div class="row2">
				${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName} 
			</div>
			<div class="row3">
				<tag:htmlparse content="${vm.description}" />
			</div>
			<div class="rowline"></div>
			<div class="row4">
				<a href="${ctx}/trading/product/center?search_EQ_user.id=${vm.user.id}" class="farmProductList">农场产品</a>
				<div>
					<c:if test="${empty userCategorys}">
						暂无
					</c:if>
					<c:if test="${not empty userCategorys}">
					<ul>
						<c:forEach items="${userCategorys}" var="c">
							<li><a href="${ctx}/trading/product/center?search_EQ_user.id=${vm.user.id}&search_EQ_category.id=${c.id}">${c.categoryName}</a></li>
						</c:forEach>
					</ul>
					</c:if>
				</div>
			</div>
			<div class="rowline"></div>
			<div class="d_info">
				<c:if test="${!empty vm.user.phone}">
					<div class="d_info_item">
						<a href="javascript:void(0);"  <shiro:user>info="${vm.user.phone}"</shiro:user> <shiro:guest>info="nologin"</shiro:guest> >点击获取联系方式</a>
					</div>
				</c:if>
				<c:if test="${not empty vm.website}">
					<div class="d_info_item2">
						<a href="javascript:void(0);"  <shiro:user>info="${vm.website}"</shiro:user> <shiro:guest>info="nologin"</shiro:guest> >查看官方网站</a>
					</div>
				</c:if>
			<div>
				
			</div>
	</div>
	<div class="div-back">
		<a  class="a-back"  href="javascript:history.back(-1);">
   			<img class="img-back" id="" src="${ctx}/static/images/back1.png"  alt="返回">
   		</a>
	</div>
	</div>
	<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
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
		$(".d_info_item2 a").click(function(){
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
	</script >
</body>
</html>