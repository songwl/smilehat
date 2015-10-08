<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ attribute name="content" type="java.lang.String"%> 
<%
if(content != null){
    String str = content;
    str = str.replaceAll("\r\n", "<br/>");
    str = str.replaceAll("\r", "<br/>");
    str = str.replaceAll("\n", "<br/>");
    str = str.replaceAll(" ", "&nbsp;");
    out.print(str);
}
%> 
  