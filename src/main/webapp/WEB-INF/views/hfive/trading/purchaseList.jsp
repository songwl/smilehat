<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/trading/purchase/detail/${varitem.id}">
				<div class="row1">
					<div class="left">
						<div class="name">
							${varitem.title}
						</div>
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
<%-- 						<c:forEach items="${varitem.certLabelList}" var="cert"> --%>
<%-- 							<img class="product_cert"  src="${ctx}/${cert.photoAttach.downloadPath}" /> --%>
<%-- 						</c:forEach> --%>
<!-- 									<span class="lv"></span> -->
					</div>
					<div class="right">
<%-- 						<img class="product_cert" src="${ctx}/static/images/location.png"> --%>
<%-- 						<span class="place_who">${varitem.user.name}</span> --%>
						<span class="unit">采购量</span> ${varitem.quantity} 
<%-- 						<span class="unit">/${varitem.quantityUnit}</span> --%>
						<span id="showDictLabel" class="showDictLabel" dictType="QUANTITY_UNIT" dictCode="${varitem.quantityUnit}"></span>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
	<c:if test="${!page.hasNextPage}">
		<li id="pageEnd" style="color: #fff;">没有更多了！</li>
	</c:if>
	
<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>