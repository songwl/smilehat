<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/farm/detail/${varitem.id}">
				<div class="row1">
					<div class="left">
						<img class="product_cert" src="${ctx}/static/images/location.png">
						<span class="place_who">${varitem.region.regionName}</span>
						
<%-- 						<div class="customeresc">${varitem.description}</div> --%>
					</div>
					
				</div>
				<div class="row2">
					<div class="right">
						<div class="name">
							<span style="position:relative;color:black">${varitem.user.name}</span>
							
						</div>
<%-- 						<span class="unit">￥</span> ${varitem.price} <span class="unit">/${varitem.priceUnit}</span> --%>
						
					</div>
				</div>
				<div class="row3">
					<div class="left">
						<img class="product_cert"  src="${ctx}/static/images/location.png">
						<img class="product_cert" src="${ctx}/static/images/location.png">
						<img class="product_cert" src="${ctx}/static/images/location.png">
<!-- 									<span class="lv"></span> -->
					</div>
					<div class="right">
						<img class="todetail" src="${ctx}/static/images/right.png">
					</div>
				</div>
			</a>
		</li>
	</c:forEach>