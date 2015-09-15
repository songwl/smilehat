function showDictLabel($body,type,code){
	$.ajax({
		type : 'POST',dataType : "json",url : CTX+"/sys/dict/selectDictLabel",
		cache : false,data : {"dictType":type,"dictCode":code},async:false,
		success : function(json) {
			if (!json)return;
			$body.html(json["label"]);
		},
		error : DWZ.ajaxError
	});
}

/**
 * <span class="showDictLabel" dictType="PRICE_UNIT" dictCode="YUAN"></span>
 */
$(".showDictLabel").each(function(){
	var $this = $(this);
	var dictType = $this.attr("dictType");
	var dictCode = $this.attr("dictCode");
	showDictLabel($this,dictType,dictCode);
	$this.removeClass("showDictLabel");
});
