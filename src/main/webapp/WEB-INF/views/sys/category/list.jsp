  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<c:set var="noteTemplet" value="<a  target=\"ajax\" rel=\"viewCatalog\" onclick=\"{onclick}\" href=\"${ctx}/sys/category/view/{id}\">{name}</a>"></c:set>
<c:set var="onClickTemplet" value="setSelectedNote('{id}')"></c:set>
<div class="pageContent" style="padding: 5px">
	<div class="tabs">
		<div class="panelBar" style="border-width: 1px;">
			<ul class="toolBar"> 
				<li><a class="add" title="添加品类" href="${ctx}/sys/category/new?navTabId=app_category" target="dialog" rel="catalog_new"><span>添加</span></a></li>
				<li><a class="edit" title="编辑品类" href="${ctx}/sys/category/update/{sid}?navTabId=sys_category" target="dialog" rel="catalog_edit" warn="请选择一个栏目"><span>编辑</span></a></li>
				<li><a title="确实要删除栏目吗?" target="ajaxTodo"  href="${ctx}/sys/category/delete/{sid}?navTabId=sys_category" class="delete"  rel="ids" ><span>删除</span></a></li>		 
			</ul>
		</div>
		<div class="tabsContent" style="border-width: 0px 1px 1px 1px;">
			<div>
			    <input type="hidden" id="sid" value="${vm.id}">
			    <input type="hidden" id="pid" value="${empty vm?0:vm.id}">
				<div id="viewCatalogTree" layoutH="45" style="float: left; display: block; overflow: auto; width: 240px; border: solid 1px #CCC; line-height: 21px; background: #fff">
					<tag:tree root="${categorylist}" isRoot="true" childFieldName="children" idFieldName="id" nameFieldName="categoryName" pidFieldName="parent" noteTemplet="${noteTemplet}"
					curSelectid="${vm.id}" onClickTemplet="${onClickTemplet}" className="tree treeFolder expand"></tag:tree>
				</div>
				<div id="viewCatalog" style="margin-left: 246px;">
				 <c:if test="${not empty vm}">
				  <%@ include file="view.jsp"%>
				  </c:if>
				</div>
			</div>
			<div class="tabsFooter">
				<div class="tabsFooterContent"></div>
			</div>
		</div>
	</div>
</div> 

<script type="text/javascript">
	function setSelectedNote(id) {
		if(id){
			$("#sid").val(id);
			$("#pid").val(id);
		} 
	}	
</script>