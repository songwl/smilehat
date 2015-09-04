<%@tag import="java.util.Iterator"%>
<%@tag import="java.util.Set"%>
<%@tag import="java.util.Map"%>
<%@tag import="com.smilehat.business.core.web.BaseController"%>
<%@tag import="com.smilehat.util.CoreUtils"%>
<%@tag import="org.apache.commons.lang3.StringUtils"%>
<%@tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="url" type="java.lang.String" required="false"%>
<% 
  if(StringUtils.isNotBlank(url)){
	  Map<String, Object> searchParams =CoreUtils.getParametersStartingWith(request, BaseController.SEARCH_PARAMETERS_STARTING_WITH_PARAM);
	  String pageUrl=url+"?"+BaseController.PAGE_NUM_PARAM+"={pageNum}";
	  if(!searchParams.isEmpty()){
		  Set<String> keys=searchParams.keySet();
		  for (Iterator<String> iterator = keys.iterator(); iterator.hasNext();) {
				String key = iterator.next();
				pageUrl=pageUrl+"&"+BaseController.SEARCH_PARAMETERS_STARTING_WITH_PARAM+key+"="+searchParams.get(key).toString();
	
			}
		 
	  }
	  request.setAttribute("pageUrl", pageUrl);
  }else{
	  
	  request.setAttribute("pageUrl", "javascript:jumpPage({pageNum});");
  }
  
%>
<div class="pagination">
    
	<span class="total"><!-- 共${page.totalPages}页,合计${page.totalElements}条--></span> 
	<c:if test="${page.totalPages>1}">
		<ul> 
			<c:if test="${page.hasPreviousPage}">
				<li><a href="${fn:replace(pageUrl,'{pageNum}', '1')}">首 页</a></li>
				<li><a href="${fn:replace(pageUrl,'{pageNum}', page.previousPageNum+1)}">« 上一页</a></li>
			</c:if>
			<c:forEach var="varnum" begin="${ (page.number+1-3) < 1? 1 : (page.number+1-3)}" end="${ (page.number+1+3) < page.totalPages? (page.number+1+3) : page.totalPages}">
				<li <c:if test="${page.number+1 == varnum}">class="active"</c:if>><a href="${fn:replace(pageUrl,'{pageNum}', varnum)}">${varnum}</a></li>
			</c:forEach>
			<c:if test="${page.hasNextPage}">
				<li><a href="${fn:replace(pageUrl,'{pageNum}', page.nextPageNum+1)}">下一页 »</a></li>
				<li><a href="${fn:replace(pageUrl,'{pageNum}', page.totalPages)}">尾 页</a></li>
			</c:if>
		</ul>
	</c:if>
</div>
