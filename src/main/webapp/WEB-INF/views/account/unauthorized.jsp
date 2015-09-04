<%@page import="com.smilehat.util.CoreUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<% 
  if(CoreUtils.isAjax(request)){
%> 
{
	"statusCode":"301",
	"message":"您的会话超时或没有该资源的访问授权",
	"navTabId":"",
	"callbackType":"",
	"forwardUrl":""
}

<%}else{ 
	//response.sendRedirect(request.getContextPath());
	out.print("您的会话超时或没有该资源的访问授权");
} %>

