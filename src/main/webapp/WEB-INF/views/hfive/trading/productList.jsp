<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="#">
				<div class="row1">
					<div class="left">
						<div class="name">
							${varitem.name}
						</div>
						<div class="category">品类：${varitem.category.categoryName}</div>
					</div>
					<div class="right"><span class="unit">￥</span> ${varitem.price} <span class="unit">/${varitem.priceUnit}</span></div>
				</div>
				<div class="row2"></div>
				<div class="row3">
					<div class="left">
						<img class="product_cert"  src="${ctx}/static/images/location.png">
						<img class="product_cert" src="${ctx}/static/images/location.png">
						<img class="product_cert" src="${ctx}/static/images/location.png">
<!-- 									<span class="lv"></span> -->
					</div>
					<div class="right">
						<img class="product_cert" src="${ctx}/static/images/location.png">
						<span class="place_who">${varitem.user.name}</span>
					</div>
				</div>
			</a>
		</li>
					
					
	</c:forEach>