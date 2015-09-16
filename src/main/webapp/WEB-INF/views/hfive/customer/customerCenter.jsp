<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/customerCenter.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	
</head>
<body>
	<header>
		<div class="goback">
			<a href="${ctx}/trading/product/center">
        		<img class="back" src="${ctx}/static/images/logo.png"  alt="返回">
        	</a>
		</div>
        <div class="cur_title">
        	<label  class="page-title-text">商户中心</label>
        </div>
	</header>
	<div id="main_div">
		<div class="menu">  
	   		 <ul>  
                <li id="one1" class="tabtab" onclick="setTab('one',1)">充值</li>  
                <li id="one2"  class="tabtab"  onclick="setTab('one',2)">作废售水</li>  
                <li id="one3"  class="tabtab"  onclick="setTab('one',3)">退水</li>  
            </ul>  
		</div>
		<div class="menudiv">  
			<div id="con_one_1" style="display: none;">  
				用户基本信息
			</div>
				<div id="con_one_2" style="display: none;">  
				<ul class="list">
					我的产品
				</ul>
			</div>
			<div id="con_one_3" style="display: none;">  				
				<ul class="list">
					我的采购
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#tabtab").bind('click',function setTab(name, cursel) {
		    for (var i = 1; i <= links_len; i++) {
		        var menu = document.getElementById(name + i);
		        var menudiv = document.getElementById("con_" + name+"_"+i);
		        if (i == cursel) {
		            menu.className = "off";
		            menudiv.style.display = "block";
		        }
		        else {
		            menu.className = "";
		            menudiv.style.display = "none";
		        }
		        document.getElementById("hidfTagHistory").value = cursel;
		    }
		});
	});
	</script>
</body>
</html>