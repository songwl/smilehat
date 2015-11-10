<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<link href="${ctx}/static/js/mtime/css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/custom.css">
<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/customerCenter.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/productPublish.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/h5upload.css" type="text/css" />

<script type="text/javascript" src="${ctx}/static/js/mtime/date.js" ></script>
<script type="text/javascript" src="${ctx}/static/js/mtime/iscroll.js" ></script>

<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
	</div>
	<div class="background-zhezhao">
	</div>
	<div id="main_div">
		
		<div id="header">
			<div id="help">
				<a href="${ctx}/trading/help">
		        	<img class="help-img" src="/smilehat/static/images/help.png" alt="帮助">
		        </a>
			</div>
			产品发布
			<div class="back">
	       	<a href="javascript:history.back(-1);">
	        	<img class="search-img" src="/smilehat/static/images/back2.png" alt="返回">
	        </a>
        </div>
		</div>
		
		<div id="menu">
		    <form class="login-form m-login-form" action="${ctx}/trading/product/publish/save" method="post" id="productPublishForm">
		   
		    <div class="main-form">
		        <div class="form-group">
		        	产品名称：
					<div class="input-icon" style="height: 35px;">
						<input name="name" class="form-control" type="text" size="30" style="width: 100%;" />
					</div>
				 </div>
				 <div class="form-group">
		        	品牌：
					<div class="input-icon" style="height: 35px;">
						<input name="trademark" class="form-control" type="text" size="30" style="width: 100%;" />
					</div>
				 </div>
<!-- 				<div class="form-group"> -->
<!-- 					产品标题： -->
<!-- 					<div class="input-icon" style="height: 35px;"> -->
<!-- 						<input name="title" class="form-control" type="text"  style="width: 100%;" /> -->
<!-- 					</div> -->
<!-- 				 </div> -->
				 <div class="form-group">
					品类名称：
					<div class="input-icon" style="height: 35px;">
						<select class="form-control" name="categoryId" value="${vm.category.id}">
							<option value="">------------请选择------------</option>
						  	<c:forEach items="${categorylist}" var="category">
						  		<optgroup label="${category.categoryName}">
							  		<c:if test="${not empty category.children}">
							  			<c:forEach items="${category.children}" var="child">
							  				<option value="${child.id}">${child.categoryName}</option>
							  			</c:forEach>
							  		</c:if>
						  		</optgroup>
						  	</c:forEach>
						</select>
					</div>
				 </div>
				 <div class="form-group">
					规格：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="branch" name="branch" placeholder="规格" class="form-control"  size="30" style="width: 100%;"/>
<%-- 						<select  id="branchInfo" name=branchInfo  class="form-control combox"  selectedValue="${vm.branchInfo}"   dataUrl="${sctx}/dict/selectDictByType?dictType=BRANCH_INFO"> --%>
<!-- 						</select> -->
					</div>
				 </div>
				 <div class="form-group">
		        	包装方式：
					<div class="input-icon" style="height: 35px;">
						<input type="text"  name="packing" class="form-control" type="text" size="30" style="width: 100%;" />
					</div>
				 </div>
				 <div class="form-group">
		        	贮藏方式：
					<div class="input-icon" style="height: 35px;">
						<input name="depot" class="form-control" type="text" size="30" style="width: 100%;" />
					</div>
				 </div>
				 <div class="form-group">
		        	保质期：
					<div class="input-icon" style="height: 35px;">
						<input name="expiratinDate" class="form-control" type="text" size="30" style="width: 85%;" />(天)
					</div>
				 </div>
				 <div class="form-group">
					产地：
					<div class="input-icon" style="height: 35px;">
						<select class="form-control combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${ctx}/sys/region/selectJson" refUrl="${ctx}/sys/region/selectJson?pid={value}" style="width: 27%;float: left;">
							<option value="">----省----</option> 
						</select>
						<select class="form-control combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${ctx}/sys/region/selectJson?pid={value}" 
								<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if> style="width: 27%;float: left;">
							<option value="">----市----</option> 
						</select>
						<select class="form-control combox" name="regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.id}"</c:if> style="width: 27%;float: left;">
							<option value="">----区----</option> 
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="input-icon" style="height: 35px;">
						<input type="text" name="address" value="${vm.address}" class="form-control" style="width: 100%;" placeholder="请输入您的详细地址" autocomplete="off"/>
					 </div>
				 </div>
				  <div class="form-group">
					价格：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="price" name="price" placeholder="数字" class="form-control more-price"  style="width: 25%;" size="18" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" />		
						<span style="float:left;line-height: 35px;">&nbsp;至&nbsp;</span>
						<input type="text" id="price2" name="price2" placeholder="数字"   class="form-control more-price" style="width: 25%;" size="18" onkeyup="this.value=this.value.replace(/[^0-9.]+/,'');" />		
						<select  id="priceUnit" name="priceUnit"  class="form-control combox" style="width: 30%;" dataUrl="${sctx}/dict/selectDictByType?dictType=PRICE_UNIT">
						</select>	
					</div>
				 </div>
				 <div class="form-group">
					起订量：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="minOrder" name="minOrder"  class="form-control" size="30"  style="width: 100%;" />	
					</div>
				 </div>
				 <div class="form-group">
					供应量：
					<div class="input-icon" style="height: 35px;">
						<input type="text" id="quantity" name="quantity"  class="form-control" size="30"  style="width: 100%;" />	
					</div>
				 </div>
				
				 <div class="form-group">
					供应期1：
					<div class="input-icon" style="height: 35px;">
						<select name="smonth1" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/month.json">
							<option value="">选择</option>
						</select>	
						<select name="sday1" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/day.json">
							<option value="">选择</option>
						</select>
						
						<span style="float:left;line-height: 35px;">&nbsp;至&nbsp;</span>
						<select name="emonth1" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/month.json">
							<option value="">选择</option>
						</select>	
						<select name="eday1" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/day.json">
							<option value="">选择</option>
						</select>
					</div>
					<div id="datePlugin"></div>
				 </div>
				 
				 <div class="form-group">
					供应期2：
					<div class="input-icon" style="height: 35px;">
						<select name="smonth2" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/month.json">
							<option value="">选择</option>
						</select>	
						<select name="sday2" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/day.json">
							<option value="">选择</option>
						</select>
						
						<span style="float:left;line-height: 35px;">&nbsp;至&nbsp;</span>
						<select name="emonth2" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/month.json">
							<option value="">选择</option>
						</select>	
						<select name="eday2" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/day.json">
							<option value="">选择</option>
						</select>
					</div>
					<div id="datePlugin"></div>
				 </div>
				  <div class="form-group">
					供应期3：
					<div class="input-icon" style="height: 35px;">
						<select name="smonth3" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/month.json">
							<option value="">选择</option>
						</select>	
						<select name="sday3" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/day.json">
							<option value="">选择</option>
						</select>
						
						<span style="float:left;line-height: 35px;">&nbsp;至&nbsp;</span>
						<select name="emonth3" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/month.json">
							<option value="">选择</option>
						</select>	
						<select name="eday3" class="form-control combox" style="width: auto;" dataUrl="${ctx}/static/js/hfive/day.json">
							<option value="">选择</option>
						</select>
					</div>
					<div id="datePlugin"></div>
				 </div>
				 <div class="form-group">
				 	产品特色:
					<div class="input-icon" style="height: 80px;">
						<textarea rows="" cols="" id="description" name="description" style="width: 100%;"  placeholder="请输入50字以内" >${vm.description}</textarea>
					 </div>
				 </div>
				<div class="form-group" >
					<label style="color:#fff;width:25%;display: block;float: left;">产品图片：</label>
					<div style="float: left;width:75%;position: relative;">
						<tag:h5MultiPicUpload width="100" height="80" uploadifyFileId="productAttach" hiddenName="attachIds"  attachs="${vm.attachs}"></tag:h5MultiPicUpload>
					</div>
				</div>
				<div class="form-actions">
					<a class="btn-submit">发布</a>
				</div>
				</div>
			 </form>
		</div> 
	</div>
		<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
		
 <script src="${ctx}/static/js/hfive/custom.js"></script>
 <script src="${ctx}/static/js/hfive/combox.js"></script>
 <script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>
 
 <script type="text/javascript" src="${ctx}/static/js/ajaxupload/ajaxupload.js"></script>
 <script type="text/javascript" src="${ctx}/static/js/ajaxupload/extend.ajaxupload.js"></script>
 <script src="${ctx}/static/js/hfive/h5uploader.js"></script>
 <script>
	$(function(){
		    $("select.combox").comboxSelectRemoteData();
		    
		    /* $('#startTime').date();
			$('#endTime').date({theme:"datetime"}); */
			$('.mtime').each(function(){
				$(this).date();
			});
		    
		    $(".btn-submit").click(function(){
		    	var $form = $("#productPublishForm");
		    	$.post($form.attr("action"), $form.serialize(),
    			   function(json){
		    		if(json){
		    			C.localAlert({
							type: '',
							msg: json.message
						});
		    			if(json.message=='创建成功'){
			    			location.href='${ctx}/trading/product/center';
		    			}else{
		    				location.href='${ctx}/login';
		    			}
		    		}else{
		    			C.localAlert({
							type: '',
							msg: '系统繁忙！'
						});
		    		}
		    		
    			   }, "json");
		    });
	});

</script>
</body>
</html>