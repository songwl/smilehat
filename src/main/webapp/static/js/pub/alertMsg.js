/**
 * @author 前台弹出消息窗体
 */
 
var alertMsg = {
	_boxId: "#alertMsgBox", 
	_msg: {
		title:{error:"Error", info:"Information", warn:"Warning", correct:"Successful", confirm:"Confirmation"},
		butMsg:{ok:"OK", yes:"Yes", no:"No", cancel:"Cancel"}
	},
	_types: {error:"error", info:"info", warn:"warn", correct:"correct", confirm:"confirm"},

	_getTitle: function(key){
		return _msg.title[key];
	},   
	error: function(options) { 		
		var op = $.extend({ 
			type: 'alert', 
			className:'error',
			anim:3
		}, options);	
		
		new $.msgbox(op).show(); 
	},
	info: function(msg, options) {
		 
	},
	warn: function(options) {
		var op = $.extend({type: 'alert',content:VSC.msg("alertSelectMsg"),className:'warn',anim:3,autoClose: 10 }, options);	
		new $.msgbox(op).show(); 
	},
	correct: function(msg, options) {
	 
	},
	_alert: function(type, msg, options) {
		 
	},
	/**
	 * 
	 * @param {Object} msg
	 * @param {Object} options {okName, okCal, cancelName, cancelCall}
	 */
	confirm: function(options) {
		var op = $.extend(
       			 { 
				  type: "confirm",
				  title:VSC.msg("confirmTitle"), 
				  anim:3
				 }
        , options);
		
		new $.msgbox(op).show();
	}
};

