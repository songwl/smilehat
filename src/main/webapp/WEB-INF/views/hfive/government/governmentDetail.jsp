<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
<link rel="stylesheet" href="${ctx}/static/styles/hfive/goverMain.css" type="text/css" />
<%-- <link rel="stylesheet" href="${ctx}/static/styles/hfive/govermentCenter.css" type="text/css" /> --%>
<link rel="stylesheet" href="${ctx}/static/styles/hfive/govermentCenter${vm.themeid}.css" type="text/css" />
<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>


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
		<div class="back">
	        <a href="javascript:history.back(-1);">
	        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="返回">
	        </a>
        </div>
		<div class="pageContent"> 
			<!-- 焦点图 S -->
			<div class="swiper-container swiper-top">
				<div class="swiper-wrapper">
					<c:if test="${not empty vm.attachList}">
						<c:forEach items="${vm.attachList}" var="image">
							<div class="swiper-slide">
								<a href="javascript:;">
									<img class="goverment_img"  alt="" src="${ctx}/${image.downloadPath}" onerror="javascript:this.src='${ctx}/static/images/gover.jpg'" >
								</a>
							</div>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty vm.attachList}">
						<div class="swiper-slide">
							<a href="javascript:;">
								<img class="goverment_img" alt="" src="${ctx}/static/images/gover.jpg" />
							</a>
						</div>
					</c:if>
				</div>
				<div class="swiper-pagination swiper-pagination-top"></div>
			</div>
			<!-- 焦点图 E -->
			
			
			<div class="gover_info">
				<div class="gover_name">
					${vm.name}
				</div>
				<div class="gover_introduction">
					${vm.introduction}
				</div>
			</div>
			<form id="productForm" action="${ctx}/government/cataloglist/${vm.id}" method="post" class="pageForm">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
			</form>
			<div id="gover_catalog">
				<ul class="list">
					
				</ul>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	</div>
</body>

<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>
<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
<script type="text/javascript">
		$(function(){
			getItemList($("#productForm"),$("#gover_catalog .list"));

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

