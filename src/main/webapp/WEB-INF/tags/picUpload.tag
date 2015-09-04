<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenValue" type="java.lang.Object" %>
<%@ attribute name="uploadifyFileId" type="java.lang.String" required="true"%>
<%@ attribute name="picPath" type="java.lang.String" %>
<%@ attribute name="defaultPicPath" type="java.lang.String" %>
<%@ attribute name="width" type="java.lang.Integer" required="true"%>
<%@ attribute name="height" type="java.lang.Integer"  required="true"%>

<div class="picUpload" style="width:${width}px;">
	<input type="hidden" id="${uploadifyFileId}_hiddenId" name="${hiddenName}" value="${hiddenValue}">
	<div class="pic">
		<img width="${width}" height="${height}" id="${uploadifyFileId}_picId" src="${picPath}" onerror="javascript:this.src='${defaultPicPath}'" />
	</div>
	<div class="b_bar">
		<div class="b_upload">
			<tag:uploadify name="${uploadifyFileId}_name" onUploadSuccess="uploadifyPreviewComplete" id="${uploadifyFileId}" queueID="${uploadifyFileId}_queueID"
				fileSizeLimit="2MB" fileTypeExts="*.gif;*.jpge;*.jpg;*.png"></tag:uploadify>
		</div>
		<div class="b_del">
			<div class="button">
				<div class="buttonContent">
					<button type="button" onclick="javascript:uploadifyPreviewCompleteDelete('${uploadifyFileId}_hiddenId','${uploadifyFileId}_picId','${defaultPicPath}')">删除</button>
				</div>
			</div>
		</div>
	</div>
	<div class="remarks">
		<span>图片大小(${width}px*${height}px)</span>
	</div>
	<div class="b_queue" id="${uploadifyFileId}_queueID"></div>	
</div>