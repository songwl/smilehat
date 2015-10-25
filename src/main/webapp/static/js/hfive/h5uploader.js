//使用3.2版本插件的代码
if ($.fn.uploadify) {
	$(":file[uploaderOption]").each(function(){
		var $this = $(this);
		var options = {
			fileObjName: $this.attr("name") || "file",
			auto: true,
			multi: false,
			buttonText:'<div class="button"><div class="buttonContent"><button type="button" class="btn-upload">上传图片</button></div></div>',
			removeTimeout:0,
			width:60,
			height:25,
			onUploadError: uploadifyError,
			onUploadSuccess:onUploadSuccess 
		};
		
		var uploaderOption = eval('(' + $this.attr("uploaderOption") + ')');
		$.extend(options, uploaderOption);

		$this.uploadify(options);
	});
}

/**
 * 上传后预览图片
 */
function onUploadSuccess(file, data, response){
	var json = eval('(' + data + ')'); 
	if (json.statusCode == 200) {
		var $fiewViewObj = $('#'+this.settings.id+'_fileId');
		var hiddenName = $fiewViewObj.attr("hiddenName");
		
		var html = '<div class="h5-upload-item"><input type="hidden" name="' + hiddenName + '" value="' + json.id + '"/><a href="#" class="h5-upload-thum"><img src="'+CTX + "/" + json.downloadUrl+'" alt="'+json.name+'" width="100%"></a></div>';
		$fiewViewObj.append(html);
	}
}

function uploadifyError() {
	alert("服务器上传失败");
} 