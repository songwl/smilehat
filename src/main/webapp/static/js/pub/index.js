 $(function(){
	 //首页部分企业会员图片效果
                var imgHeight = 142;
                $('.company_l').on('mouseenter', function(){
                    $(this).animate({scrollTop:imgHeight}, 'slow');
                }).on('mouseleave', function(){
                    $(this).animate({scrollTop:0}, 'slow');
                });
       //首页幻灯片         
                var default_options = {height:250};
        		$("#kinMaxShow").kinMaxShow(default_options);
            });
