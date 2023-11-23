<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SOC XINH
  Date: 22/11/2023
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <caption>Danh sách khách hàng</caption>
<tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>ảnh</th>
</tr>
  <c:forEach items="${userList}" var="a">
      <tr>
          <td>${a.name}</td>
          <td>${a.birthday}</td>
          <td>${a.address}</td>
          <td>${a.image}</td>
      </tr>
  </c:forEach>
</table>
</body>
</html>
