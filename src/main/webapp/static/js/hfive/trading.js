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

/*window.addEventListener('scroll', scrollPage, false);
function scrollPage() {
	alert(1);
    if(nload || $("#pageEnd").length==1) return false;
    window.webkitRequestAnimationFrame(scrollPageAction)
    || window.webkitAnimationFrame(scrollPageAction)
    || window.mozRequestAnimationFrame(scrollPageAction)
    || window.requestAnimationFrame(scrollPageAction);
}
function scrollPageAction() {
    var $win = $(window),
        curScrollTop = $win.scrollTop(),
        winH = $win.height(),
        docH = $(document).height();
    if(docH - curScrollTop < winH + 50) {
    	nload = true;
		var pageNum = $form.find("input[name='pageNum']").val();
		pageNum = parseInt(pageNum)+1;
		$form.find("input[name='pageNum']").val(pageNum);
		getItemList($form,$body,function(){
			nload = false;
		});
    }
}*/

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



//地区选择事件
function regionEvent(item,pid){
	if($(item).parents("ul").parents("ul").parents("ul").length>0){ //第三级
		$("#regionId").val($(item).attr("id"));
		$("#regionName").text($(item).attr("name"));
		$("#regionName").next().next().hide();
		
		$body.html("");
		$form.find("input[name='pageNum']").val("1");
		getItemList($form,$body);
		return ;
	}
	
	if($(item).find("ul").length>0){
		$(item).siblings().find("ul").hide();
		$(item).find("ul").show();
		return ;
	}
	
	$.ajax({
	   type: "GET",
	   url: CTX+"/sys/region/selectJson?pid="+pid,
	   success: function(jsonArray){
	     if(jsonArray){
	    	 var body = "<ul class='ul-my-tree'>";
	    	 for(var i in jsonArray){
	    		 body += "<li onclick='regionEvent(this,"+jsonArray[i][0]+")' id='"+jsonArray[i][0]+"' name='"+jsonArray[i][1]+"'>"+jsonArray[i][1]+"</li>";	 
	    	 }
	    	 body += "</ul>";
	    	 $(item).append(body);
	    	 $(item).siblings().find("ul").hide();
	    	 if(pid>1){
	    		 $(item).find("ul").show();	 
	    	 }
	     }
	   }
	});
	
}

//品类选择事件
function categoryEvent(item,pid){
	if($(item).parents("ul").parents("ul").length>0){ //第二级
		$("#categoryId").val($(item).attr("id"));
		$("#categoryName").text($(item).attr("name"));
		$("#categoryName").next().next().hide();
		
		$body.html("");
		$form.find("input[name='pageNum']").val("1");
		getItemList($form,$body);
		return ;
	}
	
	if($(item).find("ul").length>0){
		$(item).siblings().find("ul").hide();
		$(item).find("ul").show();
		return ;
	}
}