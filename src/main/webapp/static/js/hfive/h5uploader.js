	$(".ajaxupload").each(function(){
		var $this = $(this);
		MyAjaxImageUpload($this,onUploadSuccess);
	});

/**
 * 上传后预览图片
 */
function onUploadSuccess($ele,fid,url,file){
	var eleID = $ele.attr("id");
	var $fiewViewObj = $('#'+eleID+'_fileId');
	var hiddenName = $fiewViewObj.attr("hiddenName");
	var html = '<div class="h5-upload-item"><input type="hidden" name="' + hiddenName + '" value="' + fid + '"/><a href="#" class="h5-upload-thum"><img src="'+CTX + "/" + url+'" alt="'+file+'" width="100%"></a></div>';
	$fiewViewObj.append(html);
}

function uploadifyError() {
	alert("服务器上传失败");
} 