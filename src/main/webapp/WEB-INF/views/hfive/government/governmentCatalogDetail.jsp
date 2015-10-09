<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/unionfarm.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/govermentCenter.css" type="text/css" />

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>



<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		<div class="back">
	        <a href="javascript:history.back(-1);">
	        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="返回">
	        </a>
        </div>
		<div class="pageContent"> 
			<img class="goverment_img" alt="" src="${ctx}/static/images/gover.jpg">
			</img>
			<div class="gover_info">
				<div class="gover_name">
					子栏目名称
				</div>
				<div class="gover_introduction">
					简介描述
				</div>
			</div>
			<form id="productForm" action="${ctx}/farm/list" method="post">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
				
			</form>
			<div id="gover_catalog">
				<ul class="list">
				</ul>
			</div>
		</div>
		
<%-- 		<%@ include file="/WEB-INF/inc/hfive/include.foot.jsp"%> --%>
		<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	</div>
</body>

<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$(function(){
		getItemList($("#productForm"),$("#gover_catalog .list"));
	});
});
	
</script>
</html>

