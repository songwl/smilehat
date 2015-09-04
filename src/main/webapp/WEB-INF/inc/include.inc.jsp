<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://shiro.apache.org/tags"  prefix="shiro" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<c:set var="sysPath" value="<%=com.smilehat.business.web.sys.SysBaseController.PATH_BASE%>"/>
<c:set var="memberPath" value="<%=com.smilehat.business.web.member.MemberBaseController.PATH_BASE%>"/>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="sctx" value="${ctx}/${sysPath}"/>
<c:set var="mctx" value="${ctx}/${memberPath}"/>
<c:set var="siteName" value="<%=com.smilehat.constants.Constants.SYS_NAME %>"/>