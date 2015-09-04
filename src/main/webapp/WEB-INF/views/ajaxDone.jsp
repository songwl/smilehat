<%@page import="com.smilehat.util.CoreUtils"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
{
	"statusCode":"${statusCode}", 
	"message":"${message}", 
	"navTabId":"${param.navTabId}",
	<c:if test="${not empty callbackData}">
	"callbackData":${callbackData},
	</c:if>	
	"rel":"${param.rel}",
	"callbackType":"${param.callbackType}",
	"callbackFun":"${param.callbackFun}",
	"forwardUrl":"${param.forwardUrl}"
}

