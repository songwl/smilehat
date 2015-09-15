<%@ page contentType="text/html;charset=UTF-8"%>
<div id="top_user">
	<div class="layout">
		<span>欢迎您！</span>
		<shiro:hasPermission name="auth_teacher">
			<span>
				<a href="${tctx}/account/view"><shiro:principal property="name"></shiro:principal></a>
				<a href="${ctx}/member/account/reset">[修改密码]</a>
			</span>
		</shiro:hasPermission>
		<shiro:hasPermission name="auth_student">
			<span>
				<a href="${ctx}/student/account/view"><shiro:principal property="name"></shiro:principal></a>
				<a href="${ctx}/member/account/reset">[修改密码]</a>
			</span>
		</shiro:hasPermission>
		<span><a href="${ctx}/">[返回首页]</a></span>
		<span><a href="${ctx}/logout">[退出系统]</a></span>　
	</div>
</div>
<!--TOP START-->
<div id="top">
	<div class="layout">
		<a href="${ctx }/index" class="logo"></a>

		<ul id="top-nav">
		<shiro:hasPermission name="auth_teacher">
			<li class="nav1"><a href="${tctx}" class="active">首页</a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="auth_student">
			<li class="nav1"><a href="${stctx}" class="active">首页</a></li>
		</shiro:hasPermission>
			<li class="nav2"><a href="${ctx}/member/message/recive">我的消息</a></li>
		</ul>
	</div>
</div>
<!--TOP END-->
