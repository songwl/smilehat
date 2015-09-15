
$(document).ready(function () {
    $(".product_select").bind("click", function () {
        $(".product_select").src="";
        
    })

    $(".list-2").bind("click", function () {
        $(".list-1").css("backgroundPosition", "0px 0px");
        $(".list-2").css("backgroundPosition", "-30px 0px");
        $(".changelist").children().removeClass("list-l-o").addClass("list-2-v");
    })
}
);

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