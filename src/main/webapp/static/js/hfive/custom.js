window.addEventListener('load', function(){
  setTimeout(function(){ window.scrollTo(0, 1); }, 100);
});

// 禁用uc手势、长按菜单
try {
   navigator.control.gesture(false);
   navigator.control.longpressMenu(false);
} catch (e) {
  // ...
}


var C = {
		getDefaultData: function() {
			return {
				bodyContainer: '#bodyContainer',
				overlay: '.overlay',
				pageOverlayBody: '#pageOverlayBody',
				overlayBtnClose: '.btn-close'
			}
		},
		// 焦点图左右滑动切换
		slideFn: function(direction, settings) {
			var defaultData = this.getDefaultData();
			var settings = $.extend({}, defaultData, settings || {});
			if(direction === 'LEFT') {
				++settings.curIndex;
				if(settings.curIndex >= settings.len) {
					--settings.curIndex;
					return false;
				}
			}
			if(direction === 'RIGHT') {
				--settings.curIndex;
				if(settings.curIndex < 0) {
					++settings.curIndex;
					return false;
				}
			}
			var $obj = settings.obj,
					$serialObj = settings.serialObj,
					serialTransX = settings.serialStepVal * settings.curIndex,
					transX = settings.stepVal * settings.curIndex;
			/*$serialObj.css({
				'webkitTransform': 'translateX(-'+ serialTransX +'px)',
				'transform': 'translateX(-'+ serialTransX +'px)'
			});*/
			$serialObj.find('li').eq(settings.curIndex).addClass('on').siblings('li').removeClass('on');
			$obj.css({
				'webkitTransform': 'translateX(-'+ transX +'px)',
				'transform': 'translateX(-'+ transX +'px)'
			});
			if(typeof settings.afterSlide === 'function') settings.afterSlide(settings.curIndex);
		},
		// ajax请求内容并渲染到弹出层 - 半透明黑背景
		ajaxInPopup: function(obj) {
			// var defaultData = this.getDefaultData();
			// var _this = this;
			var obj = obj || {},
					url = obj.url || null,
					type = obj.type || null,
					successFunc = obj.successFn || null,
					afterCloseFunc = obj.afterCloseFn || null,
					style = obj.style || {};
			if(!url) return false;
			var overlayClass = type === 'page' ? 'page-overlay' : '';

			var curScrollTop,overlayHtml;
			if(!$('#overlay')[0] && !$('#overlay').find('#pageOverlayBody')[0] && !$('#overlay').find('.btn-close')[0]) {
				overlayHtml = '<div class="overlay" id="overlay"><div class="page-overlay-body" id="pageOverlayBody"></div><span class="css-icons btn-close"></span></div>';
				$('body').append(overlayHtml);
			}
			var $pageOverlay = $('#overlay'),
					$pageOverlayBody = $pageOverlay.find('#pageOverlayBody'),
					$overlayBtnClose = $pageOverlay.find('.btn-close');
			$pageOverlay.addClass(overlayClass);
			$.ajax({
				// type: 'POST',
				url: url,
		    timeout: 3000,
				beforeSend: function(xhr, settings) {
					// loading icon animation
					curScrollTop = $(window).scrollTop();
					$('html, body').height('100%');
					C.loading();
		    	$pageOverlayBody.html('');
					// $pageOverlay.addClass(overlayClass);
				},
				complete: function(xhr, status) {
					// remove loading animation
					C.loading('close');
				},
		    error: function(xhr, errorType, error) {
		        // alert('网络出错，请重试');
		        var refreshHtml = '<a href="'+ window.top.location.href +'" class="refresh">网络出错，<br>请点击这里重试</a>';
		        $('.load-container').html(refreshHtml).css({'display':'block!important'});
		        // C.loading('close');
		        // $pageOverlay.hide();
		        console.log(errorType + ': ' + error);
		    },
		    success: function(data, status, xhr) {
		    	$(window).scrollTop(0);
		    	$pageOverlayBody.html(data);
		      $pageOverlay.css(style).show();
					C.loading('close');
					// var curScrollTop = $(window).scrollTop();
					$('#bodyContainer').hide();
		      // console.log(typeof callbackObj);
		    	if(successFunc && typeof successFunc === 'function') successFunc();

		    	// 关闭弹层
					$overlayBtnClose.on('touchend click', function(e) {
						e.preventDefault();
						e.stopPropagation();
						$('#bodyContainer').show();
						$(window).scrollTop(curScrollTop);
						$('html, body').height('auto');
						$(this).closest('.overlay').hide().removeClass().addClass('overlay');
		    		$pageOverlayBody.html('');
		    		if(!window.popNow) window.popNow = 1;
		    		if(afterCloseFunc && typeof afterCloseFunc === 'function') afterCloseFunc();
						if(e.type === 'click') return false;
					});
		    }
			});
		},
		// ajax请求内容并渲染到页面的指定容器里
		ajaxInPage: function(url, objId, callback) {
			// var _this = this;
			if(!url || !objId) return false;
			$.ajax({
				url: url,
				beforeSend: function(xhr, settings) {
					// loading icon animation
		    	$(objId).html('');
				},
				complete: function(xhr, status) {
					// remove loading animation
				},
		    error: function(xhr, errorType, error) {
		        alert('网络出错，请重试');
		        console.log(errorType + ': ' + error);
		    },
		    success: function(data, status, xhr) {
		    	$(objId).html(data);
		    	if(typeof callback === 'function') callback();
		    }
			});
		},
		gotoTop: function() {
			var defaultData = this.getDefaultData();
			var $bodyContainer = $(defaultData.bodyContainer),
					$gotoTop = $('.gotop');
			$bodyContainer.scroll(function() {
				var scrollTopVal = $bodyContainer.scrollTop();
				scrollTopVal > 100 ? $gotoTop.show() : $gotoTop.hide();
			});
			$gotoTop.on('touchend', function() {
				$bodyContainer.scrollTop(0);
			});
		},

		// 页面定位到y轴指定位置
		gotoPosition: function(number) {
			var defaultData = this.getDefaultData();
			$(defaultData.bodyContainer).scrollTop(number);
		},
		// 产品详情页的费用包含更多
		showMore: function(objId) {
			var defaultData = this.getDefaultData();
			var _this = this;
			var $obj = $(objId),
					$moreLink = $obj.find('.more-list');
			var MORELINKTEXT = $moreLink.text();
			$moreLink.on('tap', function() {
				var hasClass = $obj.hasClass('show-more');
				if(!hasClass) {
					$obj.addClass('show-more');
					$moreLink.addClass('up').html('<span class="more-list-content">收起<i></i></span>');
				} else {
					$obj.removeClass('show-more');
					$moreLink.removeClass('up').html('<span class="more-list-content">' + MORELINKTEXT + '<i></i></span>');
					var scrollNumber = $(defaultData.bodyContainer).scrollTop() + $obj.offset().top - $('.main-header').height();
					_this.gotoPosition(scrollNumber);
				}
			});
		},
		// loading
		loading: function(status, callback) {
			var $loadContainer = $('.load-container');
			if(status === 'close' && $loadContainer[0]) {
				$loadContainer.hide();
				return false;
			}
			if($loadContainer[0]) {
				$loadContainer.show();
			} else {
				var loadingHtml = '<div class="load-container"><div class="loader">Loading...</div></div>';
				$('body').append(loadingHtml).show();
				$loadContainer = $('.load-container');
			}
			$loadContainer[0].addEventListener('touchstart', preventDefaultEvent);
			$loadContainer[0].addEventListener('touchend', preventDefaultEvent);
			$loadContainer[0].addEventListener('touchmove', preventDefaultEvent);

			if(callback && typeof callback === 'function') callback();

			function preventDefaultEvent(e) {
				// console.log('e');
				e.preventDefault();
				e.stopPropagation();
			}
		},
		// 提示框
		localAlert: function(alertObj) {
			var cancelBtnHtml = '';
			var alertType = (typeof alertObj.type === 'undefined') ? 'alert' : alertObj.type;
			var msg = (typeof alertObj.msg === 'undefined') ? '' : alertObj.msg;
			var textAlign = (typeof alertObj.textAlign === 'undefined') ? 'center' : alertObj.msg;
			if(document.getElementById('localAlert')) {
				var $localAlert = $('#localAlert');
				$localAlert.find('.alert-msg').text(msg).css('textAlign', textAlign);
				$localAlert.show();
			} else {
				switch(alertType) {
					case 'confirm':
						cancelBtnHtml = '<a href="javascript://" class="alert-btn-confirm">确定</a><a href="javascript://" class="alert-btn-cancel">取消</a>';
						break;
					case 'alert':
					default:
						cancelBtnHtml = '<a href="javascript://" class="alert-btn-confirm btn-full-confirm">确定</a>';
						break;
				}

				var alertHtml = '<div id="localAlert" class="local-alert"><div class="alert-content"><p class="alert-msg">'+ msg +'</p><div class="action-area">'+ cancelBtnHtml +'</div></div></div>';
				$('body').append(alertHtml);
				$('#localAlert').find('.alert-msg').css('textAlign', textAlign);
			}
			$('#localAlert').off().on('touchend', '.alert-btn-confirm, .alert-btn-cancel', function(e) {
				e.stopPropagation();
				if(e.target.className.split(' ')[0] === 'alert-btn-confirm') {
					if(alertObj.confirm && typeof alertObj.confirm === 'function') {
						alertObj.confirm();
					}
				}
				if(e.target.className === 'alert-btn-cancel') {
					if(alertObj.cancel && typeof alertObj.cancel === 'function') {
						alertObj.cancel();
					}
				}
				$('#localAlert').find('.alert-msg').text('').closest('#localAlert').hide();
				return false;
			});
		}
};
