<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<title>微笑草帽</title>
</head>
<body>
 	<h1>H5 file upload demo</h1>
    <div style="position: relative;">
    	<button id="uploadFile" type="button" class="btn btn-xs btn-success">&nbsp;&nbsp;上&nbsp;&nbsp;&nbsp;&nbsp;传&nbsp;&nbsp;</button>
    </div>
    <div id="showImage">
    </div>
    <script type="text/javascript" src="${ctx}/static/js/ajaxupload/ajaxupload.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/ajaxupload/extend.ajaxupload.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	MyAjaxImageUpload($("#uploadFile"),success);
	});
	
	
	function success($ele,id,url,file){
		alert(url);
		var img = '<img src="${ctx}/'+url+'" style="max-width:360px;max-height:120px" class="img-thumbnail" />'
		$("#showImage").append(img);
	}
    </script>
		
</body>
</html>