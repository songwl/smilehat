<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
	
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/govermentCenter.css" type="text/css" />
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
	        <div class="search" id="div_search">
	        	<img class="search-img" src="${ctx}/static/images/search.png"  alt="搜索">
	        </div>
		</div>
		<div id="text_search">
			<input class="form-control" type="text" size="30"  placeholder="请输入政府名称和简介关键字"/>
		</div>
		<div id="main_list">
			<form id="productForm" action="${ctx}/government/list" method="post" class="pageForm">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
<%-- 				<input type="hidden" name="search_EQ_user.id" value="${param.search_EQ_user.id}" /> --%>
<%-- 				<input type="hidden" name="search_EQ_region.id" value="${param.search_EQ_region.id}" id="regionId" /> --%>
<%-- 				<input type="hidden" name="search_EQ_category.id" value="${param.search_EQ_category.id}" id="categoryId" /> --%>
				
			</form>
			
			<div id="product_list">
				<ul class="list_gover">
					
				</ul>
			</div>
		</div>
<%-- 			<%@ include file="/WEB-INF/inc/hfive/include.foot.jsp"%> --%>
			<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	</div>
	<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			getItemList($("#productForm"),$("#product_list .list_gover"));

		});
		
		$("#div_search").click(function(){
			$("#text_search").toggle();
		});
		
	</script>
</body>
</html>