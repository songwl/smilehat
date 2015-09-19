
//获取列表数据
function getItemList($form,$div){
	$.post($form.attr("action"), $form.serialize(),
	   function(html){
			$div.append(html);
	   }, "html");
}

//发布信息
function publish(){
	
}