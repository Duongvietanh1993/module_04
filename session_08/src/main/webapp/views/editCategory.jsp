<%--
  Created by IntelliJ IDEA.
  User: SOC XINH
  Date: 24/11/2023
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/danh-muc">
    <h1>Thêm mới</h1>
    <input type="hidden" name="categoryId" value="${list.categoryId}"><br>
    <label>Tên danh muc: </label>
    <input type="text" name="categoryName" value="${list.categoryName}"><br>
    <label >Active </label>
    <input type="radio"  name="categoryStatus" value="true">
    <label >Block </label>
    <input type="radio" name="categoryStatus" value="false"><br>
    <a href="<%=request.getContextPath()%>/danh-muc">Back</a>
    <input type="submit" name="Submit">
</form>
</body>
</html>
