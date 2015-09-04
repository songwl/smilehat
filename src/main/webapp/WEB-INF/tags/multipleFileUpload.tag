<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenValue" type="java.lang.Object" %>
<%@ attribute name="uploadifyFileId" type="java.lang.String" required="true"%>
<%@ attribute name="attachs" type="java.util.List" required="true"%>
<%@ attribute name="fileTypeExts" type="java.lang.String" %> 
<%@ attribute name="remarkText" type="java.lang.String" %>
<%@ attribute name="onUploadSuccess" type="java.lang.String" %> 

<c:set var="v_fileTypeExts" value="*.*"></c:set>
<c:if test="${not empty fileTypeExts}">
 <c:set var="v_fileTypeExts" value="${fileTypeExts}"></c:set>
</c:if>
<div class="fileUpload">
	<input type="hidden" id="${uploadifyFileId}_hiddenId" name="${hiddenName}" value="<tag:fetchElementPropertyToString propertyName="id" list="${attachs}"/>">
	<div class="fileView" id="${uploadifyFileId}_fileId">
	     <c:forEach items="${attachs}" var="item">
	     	<c:if test="${empty onUploadSuccess}">
	     		<a  target="_blank" href="${ctx}/${item.downloadPath}">${item.name}</a>
	     	</c:if>
	     	<c:if test="${onUploadSuccess == 'uploadifyMultipleFileComplete1'}" >
	     		<a  target="_blank" href="${ctx}/${item.downloadPath}" >${ctx}/${item.downloadPath}</a><br/>
	     	</c:if>
	    </c:forEach> 
	</div>
	<div class="b_bar">
		<div class="b_upload">
			<tag:uploadify name="${uploadifyFileId}_name" onUploadSuccess='${(empty onUploadSuccess) ?"uploadifyMultipleFileComplete" : onUploadSuccess}' id="${uploadifyFileId}" queueID="${uploadifyFileId}_queueID"
				fileSizeLimit="30MB" fileTypeExts="${v_fileTypeExts}" multi="true"></tag:uploadify>
		</div>
		<div class="b_del">
			<div class="button">
				<div class="buttonContent">
					<button type="button" onclick="javascript:uploadifyMultipleFileCompleteDelete('${uploadifyFileId}_hiddenId','${uploadifyFileId}_fileId')" >删除所有</button>
				</div>
			</div>
		</div>
	</div>
	<div class="remarks">
		<span><c:if test="${empty remarkText}">请选择${v_fileTypeExts}类型文件</c:if>
		${remarkText}
		</span>
	</div>
	<div class="b_queue" id="${uploadifyFileId}_queueID"></div>	
</div>