<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta HTTP-EQUIV="pragma" CONTENT="no-cache" />
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
<meta HTTP-EQUIV="expires" CONTENT="0"/>
<title>微信草帽-SmileHat 管理平台</title>
<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" />
<link href="${ctx}/static/styles/themes/blue/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${ctx}/static/styles/themes/css/core.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${ctx}/static/styles/themes/css/print.css" rel="stylesheet" type="text/css" media="print" />
<link href="${ctx}/static/js/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${ctx}/static/js/jquery-autocomplete/css/thickbox.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${ctx}/static/js/jquery-autocomplete/css/jquery.autocomplete.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-yellow/tip-yellow.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-violet/tip-violet.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-darkgray/tip-darkgray.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-skyblue/tip-skyblue.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-yellowsimple/tip-yellowsimple.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-twitter/tip-twitter.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/js/jquery-validation/poshytip/tip-green/tip-green.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/base/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/base/upload.css" type="text/css" />

<!--[if IE]>
<link href="${ctx}/static/styles/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<%@ include file="/WEB-INF/inc/sys/include.js.jsp"%>

<script type="text/javascript">
	$(function() {
	DWZ.init(
		"${ctx}/static/js/dwz/dwz.frag.xml",
		{
			loginUrl : "${ctx}/login/dialog",
			loginTitle : "登录",
			statusCode : { ok : 200, error : 300,
				timeout : 301 },
			pageInfo : { pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection" },
			debug : false,
			callback : function() {
				initEnv();
				$("#themeList")
						.theme(
								{ themeBase : "${ctx}/static/styles/themes" });
			}, sysPara : { ctx : "${ctx}" } });
	});
</script>
</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<!--<a class="logo" href="#">标志</a>-->
				<ul class="nav">
					<li><a href="javascript:void(0)">欢迎您:<shiro:principal property="name" /></a></li>
					<li><a title="重置密码" href="${ctx}/sys/user/reset/<shiro:principal property="id" />" target="dialog" rel="sys_user_reset">重置密码</a></li>
					<li><a href="${ctx}/logout/manage">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="blue" ><div class="selected">绿色</div></li>
					<!--<li theme="default"><div >蓝色</div></li>--> 
				</ul>
			</div>

		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>

				<div class="accordion" fillSpace="sidebar"> 
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>网站管理
						</h2>
					</div>
					<shiro:hasAnyRoles name="role_admin,role_sys">
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a>商户管理</a>
								<ul>
									<li><a href="${sctx}/customer" target="navTab" rel="app_customer">商户管理</a></li>
									<li><a href="${sctx}/customerAudit" target="navTab" rel="app_customer_audit">待审核商户</a></li>
								</ul>
							</li> 
							<li><a>发布管理</a>
								<ul>
									<li><a href="${sctx}/product" target="navTab" rel="app_product">产品管理</a></li>
									<li><a href="${sctx}/purchase" target="navTab" rel="app_purchase">采购管理</a></li>
								</ul></li>
							<li><a>政府管理</a>
								<ul>
									<li><a href="${sctx}/government" target="navTab" rel="app_government">政府管理</a></li>
								</ul></li>
							<li><a>配置管理</a>
								<ul>
									<li><a href="${sctx}/certlabel" target="navTab" rel="app_certlabel">认证标签管理</a></li>
									<li><a href="${sctx}/category" target="navTab" rel="app_category">品类管理</a></li>
									<li><a href="${sctx}/region" target="navTab" rel="app_region">区域信息</a></li>
								</ul></li>
							
						</ul>
					</div> 
					</shiro:hasAnyRoles>
					
					<shiro:hasAnyRoles name="role_admin,role_sys">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>系统管理
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder"> 
							<shiro:hasRole name="role_sys">
							<li><a>权限管理</a>
								<ul>
									<li><a href="${sctx}/user" target="navTab" rel="sys_user">用户管理</a></li>
									<li><a href="${sctx}/role" target="navTab" rel="sys_role">角色管理</a></li>
									<li><a href="${sctx}/authority" target="navTab" rel="sys_authority">授权管理</a></li>
									<li><a href="${sctx}/resource" target="navTab" rel="sys_resource">资源管理</a></li>
								</ul></li>
							</shiro:hasRole>
							<li><a>基础设置</a>
								<ul>
									<li><a href="${sctx}/dict" target="navTab" rel="sys_dict">字典管理</a></li>
								</ul></li>
							<li><a>日志管理</a>
								<ul>
									<li><a href="${sctx}/loginlog" target="navTab" rel="sys_loginlog">登录日志</a></li>
									<li><a href="${sctx}/syslog" target="navTab" rel="sys_syslog">系统日志</a></li>
								</ul></li> 
						</ul>
					</div> 
					</shiro:hasAnyRoles>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="index-portal-body panelContent">
							<div class="index-portal-left">
								<div class="sortDragVar">
									<div class="panel">
										<h1>待办通知</h1>
										<div layoutH="60" layoutH="1"></div>
									</div>
								</div>
							</div>
							<div class="index-portal-center">
								<div class="sortDragVar">
									<div class="panel" defH="225">
										<h1> </h1>
										<div>
											<!-- 
											<ul id="cygn_logo_list">											
												<li><img src="${ctx}/static/styles/moon/images/main/logo0.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo1.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo2.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo3.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo4.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo1.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo2.png" /></li>
												<li><img src="${ctx}/static/styles/moon/images/main/logo3.png" /></li>
											</ul> -->
										</div>
									</div>
								</div>
								<div class="sortDragVar sortDragVar-left">
									<div class="panel">
										<h1> </h1>
										<div layoutH="335"></div>
									</div>
								</div>
								<div class="sortDragVar sortDragVar-right">
									<div class="panel">
										<h1> </h1>
										<div layoutH="335"></div>
									</div>
								</div>
							</div>
							<div class="index-portal-right">
								<div class="sortDragVar">
									<div class="panel" defH="200">
										<h1>系统公告</h1>
										<div></div>
									</div>
									<div class="panel">
										<h1> </h1>
										<div layoutH="305"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		Copyright &copy; 2015 <a href="#" target="dialog">版权所有</a>
	</div>
</body>
</html>
