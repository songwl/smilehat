<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%> 
<c:set var="onClickTemplet" value="selectCategory('{id}','{name}','{pname}')"></c:set>
<div class="pageContent">
	 <div class="pageFormContent" layoutH="56">
	 	<tag:tree root="${categorylist}" isRoot="true" childFieldName="children" 
	 	idFieldName="id" nameFieldName="categoryName" pidFieldName="parent" className="tree treeFolder collapse"
	    onClickTemplet="${onClickTemplet}"></tag:tree> 
	</div>
	<div class="formBar">
		<ul>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="button" onclick="javascript:$.bringBack({id:'', name:'',pname:''})">清空</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>

<script type="text/javascript">
	function selectCategory(id,name,pname){
		if(pname==''){
			alertMsg.error("请选择末级品类！");
			return;
		}
		$.bringBack({id:id, name:name, pname:pname});
	}
</script>