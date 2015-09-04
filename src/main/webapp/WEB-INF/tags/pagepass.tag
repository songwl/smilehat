<%@tag import="org.apache.commons.lang3.ArrayUtils"%>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="cacheName" type="java.lang.String" required="true"%>
 
<% String[] cacheValues=request.getParameterValues(cacheName); 
   if(ArrayUtils.isNotEmpty(cacheValues)){
	   for(int i=0;i<cacheValues.length;i++){
		 %>
		<%="<input type=\"checkbox\" checked=\"checked\" name=\""+cacheName+"\" class=\"cachebox\" value=\""+cacheValues[i]+"\"/>" %>
		 <%  
	   } 
   }
%>
 

 
  
