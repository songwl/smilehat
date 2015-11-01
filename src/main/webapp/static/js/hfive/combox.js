/*
 * Plugin developed by: 付翀 使用远程数据填充select 下的 option 从dataUrl属性获取数据，并且转变为option加入
 * select中 数据集合 参照 [ ["all", "所有城市"], ["sh", "上海市",true] 数值意义:["value",
 * "text",selected] ] selectedValue 设置默认选中的值
 * 
 * 
 * 
 * 
 * <select class="combox" name="province" selectedValue="sh" selectedIndex="0"
 * dataUrl="/data.json"> </select>
 */

(function($) {
	$.fn.comboxSelectRemoteData = function(options) {
		var defaults = {
			selectedValue : null,
			selectedIndex : 0,
			dataUrl : null
		};
		var options = $.extend(defaults, options);
		return this.each(function(i) {
			var $this = $(this);
			var selectedValue = $this.attr("selectedValue") || ""; 
			var dataUrl = $this.attr("dataUrl");
			if (dataUrl) {
				$.ajax({
					type : 'POST',dataType : "json",url : dataUrl,
					cache : false,data : {},async:false,
					success : function(json) {
						if (!json)return;
						var html = '';

						$.each(json, function(i) {
							if (json[i] && json[i].length > 1) {
								var _selected = json[i][2]? true: (selectedValue == json[i][0]);
								html += '<option value="'+ json[i][0]+ '" '
										+ (_selected? 'selected="selected"': '') + '>'
										+ json[i][1] + '</option>';
							}
						});
						 
						$this.append(html);  
					}
				});
			}
			
			var ref = $this.attr("ref");
			var refUrl = $this.attr("refUrl") || "";
			if (ref && refUrl) {
				function _onchange(event){
					var $ref = $("#"+ref);
					if ($ref.length == 0) return false;
					$.ajax({
						type:'POST', dataType:"json", url:refUrl.replace("{value}", $this.val()), cache: false,
						data:{},
						success: function(json){
							if (!json) return;
							var html = '';

							$.each(json, function(i){
								if (json[i] && json[i].length > 1){
									html += '<option value="'+json[i][0]+'">' + json[i][1] + '</option>';
								}
							});
							
							$ref.html(html);
							$ref.change();
						}
					});
				}
				
				$this.unbind("change", _onchange).bind("change", _onchange);
			}

		});
	}
	
	
	
})(jQuery);