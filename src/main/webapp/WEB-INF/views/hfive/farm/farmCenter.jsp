<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/unionfarm.css" type="text/css" />

	<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		<div id="header">
			<div class="logo">
				<a href="${ctx}/introduce">
					<img id="curlogo" alt="" src="${ctx}/static/images/logo.png">
				</a>
			</div>
			<div class="userCenter">
				<img class="user_info" src="${ctx}/static/images/center.png"  alt="商户中心">
				<a href="${ctx}/customer/center">
	        		<span><shiro:principal property="name"></shiro:principal>
	        				<shiro:guest><a  href="${ctx}/login">请登录！</a></shiro:guest>
	        		</span>
	        	</a>
	        </div>
	        <div class="search" id="div_search">
	        	<img class="search-img" src="${ctx}/static/images/search.png"  alt="搜索">
	        </div>
		</div>
		<div id="text_search">
			<form action="${ctx}/farm/center" method="post">
				<input class="form-control" type="text" name="search_LIKE_user.name" placeholder="请输入农场名称"/>
			</form>
		</div>
		<div id="purchase_search">
			<div class="region_search">
				<!-- Split button -->
				<div class="btn-group btn-my-group">
				  <button type="button" class="btn btn-default btn-my-select" id="regionName">地区选择</button>
				  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle">
					<img class="drop-down-img"  alt="" src="${ctx}/static/images/down.png">
				    <span class="sr-only">地区选择</span>
				  </button>
				</div>
	        </div>
	        <div class="category_search" style="display:none">
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
		<div id="main_list_purchase">
			<form id="productForm" action="${ctx}/farm/list" method="post" class="pageForm">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
				<input type="hidden" name="search_EQ_region.id" value="${param.search_EQ_region.id}" id="regionId" />
				<input type="hidden" name="search_LIKE_user.name" value="${param['search_LIKE_user.name']}" />
			</form>
			<div id="product_list">
				<ul class="list">
					
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	
	<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			getItemList($("#productForm"),$("#product_list .list"));
		});
		
		$(".btn-my-select2").click(function(){
			$(this).next().toggle();
		});

		$(".region_search .btn-my-group").each(function(i,item){
			regionEvent(item,1);
		});
		
		$("#div_search").click(function(){
			$("#text_search").toggle();
		});
	</script>
</body>
</html>