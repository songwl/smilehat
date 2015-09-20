<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/customerCenter.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	<script src="${ctx}/static/js/hfive/customerCenter.js"></script>
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
            	商户中心
        </div>
        <div class="search">
	        <a href="${ctx}/trading/product/center">
	        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="搜索">
	        </a>
        </div>
	</div>
	<div id="menu">
	    <ul id="nav">
	        <li><a href="${ctx}/customer/center" class="selected">基本信息</a></li>
	        <li><a href="#" class="">我的产品</a></li>
	        <li><a href="#" class="">我的采购</a></li>
	    </ul>
	    <div id="menu_con">
	        <div class="tag" style="display:block" id="customer-detail">
	            	这里基本信息
	         </div> 
	        <div class="tag" style="display:none" id="customer-productList">
	           	 这里我的产品   
	         </div> 
	        <div class="tag"  style="display:none" id="customer-purchaseList">
	           	 这里是我的采购
	        </div> 
		</div>
	</div>
	</div>
	<script  type="text/javascript">
		var tabs=function(){
		    function tag(name,elem){
		        return (elem||document).getElementsByTagName(name);
		    }
		    //获得相应ID的元素
		    function id(name){
		        return document.getElementById(name);
		    }
		    function first(elem){
		        elem=elem.firstChild;
		        return elem&&elem.nodeType==1? elem:next(elem);
		    }
		    function next(elem){
		        do{
		            elem=elem.nextSibling;  
		        }while(
		            elem&&elem.nodeType!=1  
		        )
		        return elem;
		    }
		    return {
		        set:function(elemId,tabId){
		            var elem=tag("li",id(elemId));
		            var tabs=tag("div",id(tabId));
		            var listNum=elem.length;
		            var tabNum=tabs.length;
		            for(var i=0;i<listNum;i++){
		                    elem[i].onclick=(function(i){
		                        return function(){
		                            for(var j=0;j<tabNum;j++){
		                                if(i==j){
		                                    tabs[j].style.display="block";
		                                    elem[j].firstChild.className="selected";
		                                }
		                                else{
		                                    tabs[j].style.display="none";
		                                    elem[j].firstChild.className="";
		                                }
		                            }
		                        }
		                    })(i)
		            }
		        }
		    }
		}();
		tabs.set("nav","menu_con");//执行
	</script>
</body>
</html>