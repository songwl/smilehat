<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

	<c:forEach items="${page}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/farm/detail/${varitem.customer.id}">
				<div class="frow1">
					<span class="place_who">${varitem.customer.region.parent.parent.regionName}</span>
				</div>
				<div class="frow2">
					<span style="position:relative;">${varitem.name}</span>
				</div>
				<div class="frow3">
					<div class="left">
					</div>
					<div class="right">
						<img class="todetail" src="${ctx}/static/images/in.png">
					</div>
				</div>
			</a>
		</li>
	</c:forEach>