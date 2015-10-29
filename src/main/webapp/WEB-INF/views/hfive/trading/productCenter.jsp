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
	        	<!-- <a href="###" class="i" id="search_home">&nbsp;</a> -->
	        	<img class="search-img" src="${ctx}/static/images/search.png"  alt="搜索">
<!-- 		          	<input type="text" class="search-txt" placeholder="搜索" >  -->
	        </div>
		</div>
		<div id="text_search">
			<form action="${ctx}/trading/product/center" method="post">
				<input class="form-control" type="text" name="search_LIKE_name" placeholder="请输入产品名称"/>
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
	        <div class="category_search">
	        	<div class="btn-group btn-my-group">
	        	  
				  <button type="button" class="btn btn-default btn-my-select" id="categoryName">品类选择</button>
				  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle">
				    <img class="drop-down-img"  alt="" src="${ctx}/static/images/down.png">
				    <span class="sr-only">品类选择</span>
				  </button>
				  
				  <ul class="ul-my-tree ul-my-tree-right">
				  	<c:forEach items="${categoryList}" var="item">
				  		<li onclick="categoryEvent(this,'${item.id}')" id="${item.id}" name="${item.categoryName}">${item.categoryName}
					  		<c:if test="${not empty item.children}">
					  		<ul class="ul-my-tree">
						  		<c:forEach items="${item.children}" var="citem">
						  			<li onclick="categoryEvent(this,'${citem.id}')" id="${citem.id}" name="${citem.categoryName}">${citem.categoryName}</li>
						  		</c:forEach>
					  		</ul>
					  		</c:if>
				  		</li>
				  	</c:forEach>
				  </ul>
				</div>
	        </div>
		</div>
		<div id="main_list">
			<form id="productForm" action="${ctx}/trading/product/list" method="post" class="pageForm">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
				<input type="hidden" name="search_EQ_user.id" value="${param['search_EQ_user.id']}" />
				<input type="hidden" name="search_EQ_region.parent.parent.id" value="${param['search_EQ_region.parent.parent.id']}" id="regionId" />
				<input type="hidden" name="search_EQ_category.id" value="${param['search_EQ_category.id']}" id="categoryId" />
				<input type="hidden" name="search_LIKE_name" value="${param.search_LIKE_name}" />
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
// 			$("#btn_pp").bind('click',function(){
				
// 			});

			fillRegion(".region_search .btn-my-group");

			$(".btn-my-select2").click(function(){
				$(this).next().toggle();
			});

			
			$("#div_search").click(function(){
				$("#text_search").toggle();
			});
			
		});
		
		
	</script>
</body>
</html>