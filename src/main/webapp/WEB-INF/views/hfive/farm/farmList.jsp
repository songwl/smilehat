<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/farm/detail/${varitem.id}">
				<div class="frow1">
					<span class="place_who">${varitem.region.parent.parent.regionName}</span>
				</div>
				<div class="frow2">
					<span style="position:relative;">${varitem.user.name}</span>
<%-- 						<span class="unit">￥</span> ${varitem.price} <span class="unit">/${varitem.priceUnit}</span> --%>
				</div>
				<div class="frow3">
					<div class="left">
					<c:forEach items="${varitem.user.labels}" var="label">
						<img class="product_cert"  src="${ctx}/${label.photoAttach.downloadPath}" />
					</c:forEach>
<%-- 						<img class="product_cert"  src="${ctx}/static/images/location.png"> --%>
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
					</div>
					<div class="right">
						<img class="todetail" src="${ctx}/static/images/in.png">
					</div>
				</div>
			</a>
		</li>
	</c:forEach>