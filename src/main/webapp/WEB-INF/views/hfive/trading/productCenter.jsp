<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
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
	<header>
		<div class="logo">
<!-- 			<h1> -->
				<a href="" class="head_title">
					<label  class="page-title-text"> &lt;交易服务</label>
				</a>
<!-- 			</h1> -->
		</div>
		<div class="search">
	        	<!-- <a href="###" class="i" id="search_home">&nbsp;</a> -->
	          	<input type="text" class="form-control" placeholder="搜索">
            
        </div>
        <div class="userCenter">
        	<a href="">
        		<img class="user_info" src="${ctx}/static/images/orange_user.png"  alt="商户中心">
        	</a>
        </div>
	</header>
	<div id="main_div">
<%-- 		<img class="mian_line" id="mian_line" src="${ctx}/static/images/xuline.png" > --%>
		<div id="main_list">
			<form id="productForm" action="${ctx}/trading/product/list" method="post">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
				<div id="purchase_search">
					<div class="_search">
						<!-- Split button -->
						<div class="btn-group btn-my-group">
						  <button type="button" class="btn btn-default btn-my-select">地区选择</button>
						  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle" data-toggle="dropdown" id="dropdownMenu1"  aria-haspopup="true" aria-expanded="false">
						    <span class="caret"></span>
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
					
			            <%-- <input type="text" placeholder="区域选择" class="search_purchase">
			            <img class="search_down" src="${ctx}/static/images/search_down.png"> --%>
			        </div>
			        <div class="category_search">
			        	<div class="btn-group btn-my-group">
						  <button type="button" class="btn btn-default btn-my-select">品类选择</button>
						  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    <span class="caret"></span>
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
			        
			            <%-- <input type="text" placeholder="品类选择" class="search_purchase">
			            <img class="search_down" src="${ctx}/static/images/search_down.png"> --%>
			        </div>
				</div>
			</form>
			
			<div id="product_list">
				<ul class="list">
					
				</ul>
			</div>
		</div>
	</div>
	<div id="product_purchase_select">
       <div>
       		<a href="${ctx}/trading/product/center"><img class="product_select" id="product_select" src="${ctx}/static/images/product_selected.png"  alt="供应"></a>
       </div>
       <div>
       		<a href="${ctx}/trading/purchase/center"><img class="purchase_select" id="purchase_select" src="${ctx}/static/images/purchase_notselectd.png"  alt="采购"></a>
       </div>
	</div>
	<div id="product_purchase_publish">
		<img class="btn_pp" id="btn_pp" src="${ctx}/static/images/btn_pp_not.png"  alt="发布">
	</div>
	
	<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			getItemList($("#productForm"),$("#product_list .list"));
			
			$("#btn_pp").bind('click',function(){
				
			});
		});
		
	</script>
</body>
</html>