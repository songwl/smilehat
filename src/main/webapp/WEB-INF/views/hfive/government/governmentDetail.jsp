<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/govermentCenter.css" type="text/css" />

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>



<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		<div class="back">
	        <a href="javascript:history.back(-1);">
	        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="返回">
	        </a>
        </div>
		<div class="pageContent"> 
			<img class="goverment_img" alt="" src="${ctx}/static/images/gover.jpg">
			</img>
			<div class="gover_info">
				<div class="gover_name">
					政府名称
				</div>
				<div class="gover_introduction">
					简介
				</div>
			</div>
			<div class="gover_catalog">
				<ul class="list">
					<li>
						<a href="${ctx}/government/catalogdetail/0">
							<div class="grow1">
								<img class="goverCatalog_img" alt="" src="${ctx}/static/images/gover.jpg">
							</div>
							<div class="grow2">
								子栏目名称
							</div>
						</a>
					</li>
					<li>
						<a href="${ctx}/government/catalogdetail/0">
							<div class="grow1">
								<img class="goverCatalog_img" alt="" src="${ctx}/static/images/gover.jpg">
							</div>
							<div class="grow2">
									子栏目名称
							</div>
						</a>
					</li>
					<li>
						<a href="${ctx}/government/catalogdetail/0">
							<div class="grow1">
								<img class="goverCatalog_img" alt="" src="${ctx}/static/images/gover.jpg">
							</div>
							<div class="grow2">
								子栏目名称
							</div>
						</a>
					</li>
					<li>
						<a href="${ctx}/government/catalogdetail/0">
							<div class="grow1">
								<img class="goverCatalog_img" alt="" src="${ctx}/static/images/gover.jpg">
							</div>
							<div class="grow2">
									子栏目名称
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	</div>
</body>

<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>
<script type="text/javascript">
	
</script>
</html>

