<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	
</head>
<body>
	<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		<div id="header">
			<div class="logo">
				<img id="curlogo" alt="" src="${ctx}/static/images/logo.png">
			</div>
			<div class="userCenter">
				<img class="user_info" src="${ctx}/static/images/center.png"  alt="商户中心">
	            <a href="${ctx}/customer/center">
	        		<span><shiro:principal property="name"></shiro:principal>
	        				<shiro:guest><a  href="${ctx}/login">请登录！</a></shiro:guest>
	        		</span>
	        	</a>
	        </div>
	        <div class="search">
	        	<!-- <a href="###" class="i" id="search_home">&nbsp;</a> -->
	        	<img class="search-img" src="${ctx}/static/images/search.png"  alt="搜索">
	        </div>
		</div>
			<div id="main_list">
				<form id="productForm" action="${ctx}/trading/purchase/list" method="post" class="pageForm">
					<input type="hidden" name="pageNum" value="1" />
					<input type="hidden" name="numPerPage" value="10" />
					<div id="purchase_search">
						<div class="_search">
							<!-- Split button -->
							<div class="btn-group btn-my-group">
							  <button type="button" class="btn btn-default btn-my-select">地区选择</button>
							  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle" data-toggle="dropdown" id="dropdownMenu1"  aria-haspopup="true" aria-expanded="false">
								<img class="drop-down-img"  alt="" src="${ctx}/static/images/down.png">
							    <span class="sr-only">Toggle Dropdown</span>
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							    <li><a href="#">Action</a></li>
							    <li><a href="#">Another action</a></li>
							    <li><a href="#">Something else here</a></li>
							    <li role="separator" class="divider"></li>
							    <li><a href="#">Separated link</a></li>
							  </ul>
							</div>
				        </div>
				        <div class="category_search">
				        	<div class="btn-group btn-my-group">
							  <button type="button" class="btn btn-default btn-my-select">品类选择</button>
							  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <img class="drop-down-img"  alt="" src="${ctx}/static/images/down.png">
							    <span class="sr-only">Toggle Dropdown</span>
							  </button>
							  <ul class="dropdown-menu dropdown-menu-right">
							    <li><a href="#">Action</a></li>
							    <li><a href="#">Another action</a></li>
							    <li><a href="#">Something else here</a></li>
							    <li role="separator" class="divider"></li>
							    <li><a href="#">Separated link</a></li>
							  </ul>
							</div>
				        </div>
					</div>
				</form>
				
				<div id="product_list">
					<ul class="list">
						
					</ul>
				</div>
			</div>
			
			<%@ include file="/WEB-INF/inc/hfive/include.foot.jsp"%>
			
			<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	</div>
	
	<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			getItemList($("#productForm"),$("#product_list .list"));
			
		});
		
	</script>
</body>
</html>