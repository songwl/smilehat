<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>手机号注册</title>
	
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css">
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/normalize.css">
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/custom.css">
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/login.css">
	<link href="${ctx}/static/js/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen" />
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/h5upload.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
</head>
<body class="user-page" onselectstart="return!1">
<div class="zhezhao">
</div>

<div class="wrap clearfix">

<!-- 页面主体 S -->
<div class="content">


	<!-- begin login form -->
	<form class="login-form m-login-form" action="${ctx}/register" method="post">
		<div class="form-title clearfix">
			<a class="btn-back" href="javascript:history.back();"></a>
			<a href="${ctx}/login">登录</a>
		</div>
		<!-- <div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>
				 用户名或密码错误！
			</span>
		</div> -->
		
		<input type="hidden" name="userType" value="${userType}" />
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<!-- <span class="country-num">+86</span> -->
				<input class="form-control" type="text" name="loginName" placeholder="请输入您的手机号" autocomplete="off">
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control" type="text" name="name" placeholder="请输入您的用户名称" autocomplete="off">
			</div>
		</div>
		<div class="form-group pr">
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control" id="user_password" type="password" name="plainPassword" placeholder="请输入您的密码" autocomplete="off">
			</div>
		</div>
		<div class="form-group pr">
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control" id="user_password1" type="password" name="repassword" placeholder="请再次输入您的密码" autocomplete="off">
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon" style="height: 35px;">
				<i class="fa fa-user"></i>
				<select class="form-control combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${ctx}/sys/region/selectJson" refUrl="${ctx}/sys/region/selectJson?pid={value}" style="width: 27%;float: left;">
					<option value="">----省----</option> 
				</select>
				<select class="form-control combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${ctx}/sys/region/selectJson?pid={value}" 
						<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if> style="width: 27%;float: left;">
<!-- 					<option value="">----市----</option>  -->
				</select>
				<select class="form-control combox" name="customer.region.id" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.id}"</c:if> style="width: 27%;float: left;">
<!-- 					<option value="">----区----</option>  -->
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control" type="text" name="customer.address" placeholder="请输入您的详细地址" autocomplete="off">
			</div>
		</div>
		<div class="form-group">
			<label style="color:#fff;width:25%;display: block;float: left;">认证图片：</label>
			<div style="float: left;width:75%; position: relative;">
				<tag:h5MultiPicUpload width="100" height="80" uploadifyFileId="identityAttach" hiddenName="identityAttachIds"  attachs="${vm.identityAttachs}"></tag:h5MultiPicUpload>
			</div>
		</div>
		<div class="form-group">
			<label style="color:#fff;width:25%;display: block;float: left;">商户图片：</label>
			<div style="float: left;width:75%;position: relative;">
				<%-- <tag:multipleFileUpload uploadifyFileId="userAttach" hiddenName="userAttachs" attachs="${vm.attachs}"></tag:multipleFileUpload> --%>
				<tag:h5MultiPicUpload width="100" height="80" uploadifyFileId="userAttach" hiddenName="userAttachIds"  attachs="${vm.attachs}"></tag:h5MultiPicUpload>
				<!-- <a class="uploadButton">
					<input id="uploadInput" type="file" accept="image/*"  style="display:block;height:40px;width:45px;opacity:0;"></input>
				</a> -->
			</div>
		</div>
		<div class="form-actions">
			<a class="btn-submit">手机号注册</a>
		</div>
	</form>
</div>
<!-- 页面主体 E -->

</div>

<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
 <script src="${ctx}/static/js/hfive/custom.js"></script>
 <script src="${ctx}/static/js/hfive/combox.js"></script>
 <script type="text/javascript" src="${ctx}/static/js/ajaxupload/ajaxupload.js"></script>
 <script type="text/javascript" src="${ctx}/static/js/ajaxupload/extend.ajaxupload.js"></script>
 <script src="${ctx}/static/js/hfive/h5uploader.js"></script>
<script>
	$(function(){
		
		 $(".btn-submit").click(function() {
		    	var regex = /^0?(13|15|18|14|17)[0-9]{9}$/; //手机正则
		    	var phone = $.trim($('input[name="loginName"]').val());
		    	var name = $.trim($('input[name="name"]').val());
		    	var password = $.trim($('input[name="plainPassword"]').val());
		    	var repassword = $.trim($('input[name="repassword"]').val());
		    	var region = $.trim($('select[name="customer.regionId"]').val());
		    	var address = $.trim($('input[name="address"]').val());
		    	
			    if(phone == "") {
			    	C.localAlert({
						type: '',
						msg: '请输入手机号!'
					});
			    	return false;
			    } else if(phone.match(regex) == null) {
			    	C.localAlert({
						type: '',
						msg: '手机号格式错误!'
					});
					return false;
			    } else if(name ==''){
					C.localAlert({
						type: '',
						msg: '用户名称不可以为空!'
					});
					return false;
				}else if (password == ''){
					C.localAlert({
						type: '',
						msg: '密码不可以为空!'
					});
					return false;
				}else if (password != repassword){
					C.localAlert({
						type: '',
						msg: '确认密码不正确!'
					});
					return false;
				}
// 				else if (region == ''){
// 					C.localAlert({
// 						type: '',
// 						msg: '请选择地区!'
// 					});
// 					return false;
// 				}else if (address == ''){
// 					C.localAlert({
// 						type: '',
// 						msg: '请填写详细地址!'
// 					});
// 					return false;
// 				}
				else{
					$.ajax({
				        type: "GET",
				        url: "${ctx}/register/checkLoginName?loginName="+phone+"&random="+Math.random(),
				        dataType: "json",
				        success: function(rs) {
				        	if (rs=="false") {
						    	C.localAlert({
									type: '',
									msg: '手机号已注册!'
								});
				        	}
				        	$(".login-form").submit();
				        }
				   	});
				}
		    	
		    });

		    $("select.combox").comboxSelectRemoteData();
		  
	});
	
	

</script>
</body>
</html>
