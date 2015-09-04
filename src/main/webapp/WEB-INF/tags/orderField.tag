<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setAttribute("tagOrderField", name);%>
orderField="${tagOrderField}" <c:if test="${tagOrderField eq param.orderField}">class="${param.orderDirection}"</c:if>