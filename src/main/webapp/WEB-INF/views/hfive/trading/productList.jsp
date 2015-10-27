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
						<c:forEach items="${varitem.certLabelList}" var="cert">
							<img class="product_cert"  src="${ctx}/${cert.photoAttach.downloadPath}" />
						</c:forEach>
<!-- 									<span class="lv"></span> -->
					</div>
					<div class="right">
						<span class="unit">￥</span> 
						<c:if test="${ varitem.price==0.0 && varitem.price2==0.0}">面议 </c:if>
						<c:if test="${ varitem.price==0.0 && varitem.price2!=0.0}">${varitem.price2}  </c:if>
						<c:if test="${ varitem.price!=0.0 && varitem.price2==0.0}">${varitem.price}  </c:if>
						<c:if test="${ varitem.price!=0.0 && varitem.price2!=0.0}">${varitem.price}- ${varitem.price2} </c:if>
						<span id="showDictLabel" class="showDictLabel" dictType="PRICE_UNIT" dictCode="${varitem.priceUnit}"></span>
<%-- 						<span class="unit">/${varitem.priceUnit}</span> --%>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
	<c:if test="${!page.hasNextPage}">
		<li id="pageEnd" style="color: #fff;">没有更多了！</li>
	</c:if>
<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>