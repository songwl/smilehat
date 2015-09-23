<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/farmDetail.css" type="text/css" />

<title>微笑草帽</title>
</head>
<body>
	<div id="header-img">
		
	</div>
	<div class="pageContent"> 
		<input type="hidden" name="user.id" value="${vm.user.id}">
		
			<div class="row1">
				<div class="left">
					${vm.user.name}
				</div>
				<div class="right">
					<div class="up">
						认证标签
					</div>
					<div class="down" >
						<img class="product_cert"  src="${ctx}/static/images/location.png">
						<img class="product_cert" src="${ctx}/static/images/location.png">
						<img class="product_cert" src="${ctx}/static/images/location.png">
					</div>
				</div>
			</div>
			<div class="rowline">
			</div>
			<div class="row2">
				${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName} ${vm.address}
			</div>
			<div class="row3">
				${vm.description}
			</div>
			<div class="rowline"></div>
			<div class="row4">
				<a href="${ctx}/trading/product/center?search_EQ_user.id=${vm.user.id}">农场产品</a>
			</div>
			<div class="rowline"></div>
			<div class="d_info">
				<div class="d_info_item">
					<a href="javascript:void(0);"  <shiro:user>info="${vm.user.loginName}"</shiro:user> <shiro:guest>info="nologin"</shiro:guest> >点击获取联系方式</a>
				</div>
				<div class="d_info_item2">
					<a href="javascript:void(0);"  <shiro:user>info="${vm.website}"</shiro:user> <shiro:guest>info="nologin"</shiro:guest> >查看官方网站</a>
				</div>
			<div>
				
			</div>
	</div>
	<div class="div-back">
		<a  class="a-back"  href="${ctx}/farm/center">
   			<img class="img-back" id="" src="${ctx}/static/images/back1.png"  alt="返回">
   		</a>
	</div>
	</div>
	<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	<script type="text/javascript">
	$(function(){
		$(".d_info_item a").click(function(){
			var info = $(this).attr("info");
			if(info == 'nologin'){
				$(this).text("请先登录或注册！");
				$(this).attr("href","${ctx}/login");
			}else{
				$(this).text(info);
			}
		});
		$(".d_info_item2 a").click(function(){
			var info = $(this).attr("info");
			if(info == 'nologin'){
				$(this).text("请先登录或注册！");
				$(this).attr("href","${ctx}/login");
			}else{
				$(this).text(info);
			}
		});
	});
	</script >
</body>
</html>