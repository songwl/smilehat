<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>


	<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
		<li>
			<a href="${ctx}/government/catalogdetail/${varitem.id}">
				<div class="grow1">
					<img class="goverCatalog_img" alt="" src="${ctx}/${varitem.attachList[0].downloadPath}" onerror="javascript:this.src='${ctx}/static/images/gover.jpg'">
				</div>
				<div class="grow2">
					${varitem.catalogName}
				</div>
			</a>
		</li>
	</c:forEach>
	<c:if test="${!page.hasNextPage}">
		<li id="pageEnd" style="color: #fff;">没有更多了！</li>
	</c:if>
<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>