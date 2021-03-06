/******************
 * 文件上传工具.
 * 引用前先引入 ajaxupload.js
 * 
 * 使用方式 <button id="uploadFile" type="button" fileTypeExts="jpg|png|jpeg|gif" serviceType="basecode">上传</button>
 * <script type="text/javascript">
 * 		$(document).ready(function(){
 * 			MaidouAjaxUpload($("#uploadFile"),callback);
 * 		});
 * 
 * 		function callback(comFile){
 * 			//callback do something...
 * 		}
 * </script>
 */
(function() {
	/**
	 * @param $ele	被绑定上传功能的元素
	 * ## fileTypeExts 在元素上定义好过滤的文件类型
	 * ## serviceType 文件对应的服务类型  默认类型 basecode
	 * @param callback 回调方法 传入comFile对象
	 */
	MyAjaxUpload = function($ele,callback){
		var serviceType ="basecode";
		if($ele.attr("serviceType")){
			serviceType = $ele.attr("serviceType");
		}
		new AjaxUpload($ele,{
			action:'/back/pub/file/upload.do',
			data: {"serviceType":serviceType},
			autoSubmit:true,
			name:'file',
			onSubmit:function(file,ext){
				var fileTypeExts = $ele.attr("fileTypeExts");
				if(fileTypeExts && $.trim(fileTypeExts)!=""){
					if(ext) {
						ext = ext.toLowerCase();
					}
					if (ext && /^(fileTypeExts)$/.test(ext)){
						/*var data={};
						var $form=$("#uploadForm");
						data["productId"]=current_product_id;
						data["type"]=$form.find("select[name=type] :selected").val();
						data["imgname"]=$form.find("input[name=imgname]").val();
						this.setData(data);
						this.disable();
						return true;
						*/
					}else{
						alert("文件格式错误");
						return false;
					}
				}
				return true;
			},
			onComplete:function(file,dt){
				var data=eval("("+dt+")");
				if(data.error==0){ //成功
					if (!$.isFunction(callback)){ 
						callback = eval('(' + callback + ')');
					}
					if($.isFunction(callback)){
						callback(data["comFile"]);
					}
				}else{
					alert(data.message);
				}
			}
		});
		
	};
	
	MyAjaxImageUpload = function($ele,callback){
		new AjaxUpload($ele,{
			action:CTX+'/upload/attach/up',
			autoSubmit:true,
			name:'vfile',
			onSubmit:function(file,ext){
				if(ext) {
					ext = ext.toLowerCase();
				}
				
				if (ext && /^(jpg|png|jpeg|gif)$/.test(ext)){
					/*var data={};
					var $form=$("#uploadForm");
					data["productId"]=current_product_id;
					data["type"]=$form.find("select[name=type] :selected").val();
					data["imgname"]=$form.find("input[name=imgname]").val();
					this.setData(data);
					this.disable();
					return true;
					*/
				}else{
					alert("文件格式错误");
					return false;
				}
				return true;
			},
			onComplete:function(file,dt){
				var data=eval("("+dt+")");
				if(data.statusCode==200){ //成功
					if (!$.isFunction(callback)){ 
						callback = eval('(' + callback + ')');
					}
					if($.isFunction(callback)){
						callback($ele,data["id"],data["downloadUrl"],file);
					}
				}else{
					alert(data.message);
				}
			}
		});
		
	};
})();