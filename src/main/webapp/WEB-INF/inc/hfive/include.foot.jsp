<%@ page contentType="text/html;charset=UTF-8"%>

<div id="product_purchase_select">
      <div>
      		<a class="main-menu" href="${ctx}/trading/product/center">
      			<img class="product_select" id="product_select" src="${ctx}/static/images/sell.png"  alt="供应">
      			供应
      		</a>
      </div>
      <div>
      		<a  class="main-menu" href="javascript:;" id="publish">
      			<img class="product_select" id="" src="${ctx}/static/images/publish.png"  alt="发布">
      			发布
      		</a>
      </div>
      <div>
      		<a class="main-menu" href="${ctx}/trading/purchase/center">
      			<img class="purchase_select" id="purchase_select" src="${ctx}/static/images/buy.png"  alt="采购">
      			采购
      		</a>
      </div>
</div>

 <div id="publish_select">
 	<div class="publish_select_item"><a href="${ctx}/trading/product/publish/new">我来供应</a></div>
 	<div class="publish_select_item"><a href="${ctx}/trading/purchase/publish/new">我要采购</a></div>
 </div>
 
 <script type="text/javascript">
	$(function(){
		$("#publish").click(function(){
			$("#publish_select").toggle();
		});
	});
 </script>
