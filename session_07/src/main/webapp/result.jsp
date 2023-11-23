<%--
  Created by IntelliJ IDEA.
  User: SOC XINH
  Date: 22/11/2023
  Time: 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Calculator Result</h1>
<%-- Hiển thị kết quả hoặc thông báo lỗi --%>
<% int result = (Integer) request.getAttribute("result"); %>
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>

<% if (errorMessage == null) { %>
<p>Result: <%= result %></p>
<% } else { %>
<p><%= errorMessage %></p>
<% } %>
</body>
</html>
