<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenValue" type="java.lang.Object" %>
<%@ attribute name="uploadifyFileId" type="java.lang.String" required="true"%>
<%@ attribute name="attachs" type="java.util.List" required="true"%>
<%@ attribute name="width" type="java.lang.Integer" required="true"%>
<%@ attribute name="height" type="java.lang.Integer"  required="true"%>

<%-- <div class="picUpload" style="width:${width}px;">
	<input type="hidden" id="${uploadifyFileId}_hiddenId" name="${hiddenName}" value="${hiddenValue}">
	<div class="b_bar">
		<div class="b_upload">
			<tag:uploadify name="${uploadifyFileId}_name" onUploadSuccess="uploadifyPreviewComplete" id="${uploadifyFileId}" queueID="${uploadifyFileId}_queueID"
				fileSizeLimit="2MB" fileTypeExts="*.gif;*.jpge;*.jpg;*.png"></tag:uploadify>
		</div>
	</div>
	<div class="remarks">
		<span>图片大小(${width}px*${height}px)</span>
	</div>
	<div class="b_queue" id="${uploadifyFileId}_queueID"></div>	
</div> --%>

<div class="h5-upload-row h5PicUpload">
	<tag:uploadify multi="true" name="${uploadifyFileId}_name" id="${uploadifyFileId}" queueID="${uploadifyFileId}_queueID"
			accept="image/*;capture=camera"	fileSizeLimit="2MB" fileTypeExts="*.gif;*.jpge;*.jpg;*.png"></tag:uploadify>
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