<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%> 
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm> 
<div class="pageHeader">
	<form rel="pagerForm" method="post" action="${sctx}/resource/select" onsubmit="return dwzSearch(this, 'dialog');">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>资源标识：</label> <input class="textInput" name="search_LIKE_value" value="${param.search_LIKE_value}" type="text"></li>
			</ul>
			<div class="subBar">
				<ul>
					<li>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">查询</button>
							</div>
						</div>
					</li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" multLookup="ids" warn="请选择资源">选择</button>
							</div>
						</div>
					</li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" onclick="javascript:$.bringBack({id:'', value:'',position:''})">清空</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th width="30"><input type="checkbox" class="checkboxCtrl" group="ids" /></th>
				<th <tag:orderField name="value"/>>资源标志</th>
				<th <tag:orderField name="position"/>>排序</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr>
					<td><input type="checkbox" name="ids" value="{id:'${item.id}', value:'${item.value}',position:'${item.position}'}" /></td>
					<td>${item.value}</td>
					<td>${item.position}</td> 
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	<div class="panelBar">
	<tag:pagination page="${page}" targetType="dialog" numPerPageOnchange="dwzPageBreak({targetType:'dialog', data:{numPerPage:this.value}})"></tag:pagination>	 
	</div>
</div>
