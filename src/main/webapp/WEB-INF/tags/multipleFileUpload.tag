<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenValue" type="java.lang.Object" %>
<%@ attribute name="uploadifyFileId" type="java.lang.String" required="true"%>
<%@ attribute name="attachs" type="java.util.List" required="true"%>
<%@ attribute name="fileTypeExts" type="java.lang.String" %> 
<%@ attribute name="remarkText" type="java.lang.String" %>
<%@ attribute name="onUploadSuccess" type="java.lang.String" %> 
<%@ attribute name="uploadSuccessShow" type="java.lang.String" description="上传后显示附件名还是路径 path为路径"%>

<c:set var="v_fileTypeExts" value="*.*"></c:set>
<c:if test="${not empty fileTypeExts}">
 <c:set var="v_fileTypeExts" value="${fileTypeExts}"></c:set>
</c:if>
<div class="fileUpload">
	<div class="fileView" id="${uploadifyFileId}_fileId" uploadSuccessShow="${uploadSuccessShow }" hiddenName="${hiddenName }">
		<ul>
         <c:forEach items="${attachs}" var="item">
            <li>
            <input type="hidden" name="${hiddenName}" value="${item.id}"/>
            <a  target="_blank" href="${ctx}/${item.downloadPath}">
            <c:if test="${empty uploadSuccessShow || uploadSuccessShow != 'path'}">${item.name}</c:if>
            <c:if test="${uploadSuccessShow == 'path'}" >${ctx}/${item.downloadPath}</c:if>
            </a>
            [<a style="color:red;cursor: pointer;" title="删除" onclick="javascript:uploadifyMultipleFileDelete(this);">X</a>]
            </li>
        </c:forEach>
        </ul> 
	</div>
	<div class="b_bar">
		<div class="b_upload">
			<tag:uploadify name="${uploadifyFileId}_name" onUploadSuccess='${(empty onUploadSuccess) ?"uploadifyMultipleFileSuccess" : onUploadSuccess}' id="${uploadifyFileId}" queueID="${uploadifyFileId}_queueID"
				fileSizeLimit="30MB" fileTypeExts="${v_fileTypeExts}" multi="true"></tag:uploadify>
		</div>
		<div class="b_del">
			<div class="button">
				<div class="buttonContent">
					<button type="button" onclick="javascript:uploadifyMultipleFileDelete('${uploadifyFileId}_hiddenId','${uploadifyFileId}_fileId')" >删除所有</button>
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