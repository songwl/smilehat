
//获取列表数据
function getItemList($form,$div,callback){
	$.post($form.attr("action"), $form.serialize(),
	   function(html){
			$div.append(html);
			if(callback){
				callback();
			}
	   }, "html");
}

//发布信息
function publish(){
	
}

var $form = $("form.pageForm");
var $body = $(".list");
var nload = false;
$(window).scroll(function() {
	if(nload || $("#pageEnd").length==1) return;
	var scrollTop = $(window).scrollTop();
	var scrollBodyHeight = $("body").height();
	var height = $(window).height();
	if(scrollTop>=scrollBodyHeight-height){
		nload = true;
		var pageNum = $form.find("input[name='pageNum']").val();
		pageNum = parseInt(pageNum)+1;
		$form.find("input[name='pageNum']").val(pageNum);
		getItemList($form,$body,function(){
			nload = false;
		});
	}
});