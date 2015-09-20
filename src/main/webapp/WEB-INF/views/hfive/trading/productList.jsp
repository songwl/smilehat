<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/trading/product/detail/${varitem.id}">
				<div class="row1">
					<div class="left">
						${varitem.name}
					</div>
					<div class="right">
						<fmt:formatDate value="${varitem.publishTime}" pattern="yyyy-MM-dd HH:mm" /> 
					</div>
				</div>
<!-- 				<div class="row2"></div> -->
				<div class="row3">
					<div class="left">
						<div class="category">品类：${varitem.category.categoryName}</div>
						<span class="place_who">${varitem.user.name}</span>
<%-- 						<img class="product_cert"  src="${ctx}/static/images/location.png"> --%>
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
<!-- 									<span class="lv"></span> -->
					</div>
					<div class="right">
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
						<!-- <span class="unit">￥</span> --> ${varitem.price} 
						<span id="showDictLabel" class="showDictLabel" dictType="PRICE_UNIT" dictCode="${varitem.priceUnit}"></span>
<%-- 						<span class="unit">/${varitem.priceUnit}</span> --%>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
	
<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>