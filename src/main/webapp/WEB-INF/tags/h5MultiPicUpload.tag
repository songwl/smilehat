<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenValue" type="java.lang.Object" %>
<%@ attribute name="uploadifyFileId" type="java.lang.String" required="true"%>
<%@ attribute name="attachs" type="java.util.List" required="true"%>
<%@ attribute name="width" type="java.lang.Integer" required="true"%>
<%@ attribute name="height" type="java.lang.Integer"  required="true"%>


<div class="h5-upload-row h5PicUpload">
	<%-- <tag:uploadify multi="true" name="${uploadifyFileId}_name" id="${uploadifyFileId}" queueID="${uploadifyFileId}_queueID"
			accept="image/*;capture=camera"	fileSizeLimit="2MB" fileTypeExts="*.gif;*.jpge;*.jpg;*.png"></tag:uploadify> --%>
	<button id="${uploadifyFileId}" type="button" class="ajaxupload btn-upload">上传图片</button>
</div>

<div class="h5-upload-row" id="${uploadifyFileId}_fileId" hiddenName="${hiddenName}">
	<c:forEach items="${attachs}" var="item">
		<div class="h5-upload-item">
			<input type="hidden" name="${hiddenName}" value="${item.id}"/>
			<a href="#" class="h5-upload-thum">
		      <img src="${ctx}/${item.downloadPath}" alt="${item.name}"   width="100%">
		    </a>
		</div>
	</c:forEach>
</div>