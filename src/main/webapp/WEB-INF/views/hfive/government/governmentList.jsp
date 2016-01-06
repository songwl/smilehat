<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>


	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/government/detail/${varitem.id}">
				<div class="left">
					<img class="gover-img"  alt="" src="${ctx}/${varitem.attachList[0].downloadPath}" onerror="javascript:this.src='${ctx}/static/images/gover.jpg'">
				</div>
				<div class="right">
					<div class="r_row1">
						${varitem.name}
					</div>
					<div class="r_row2">
						${varitem.region.parent.parent.regionName} ${varitem.region.parent.regionName} ${varitem.region.regionName}  ${varitem.regionDetail} 
					</div>
					<div class="r_row3">
<!-- 						农场数量（20个） -->
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
	<c:if test="${!page.hasNextPage}">
		<li id="pageEnd" >没有更多了！</li>
	</c:if>
<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>