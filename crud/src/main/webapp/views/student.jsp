<%--
  Created by IntelliJ IDEA.
  User: SOC XINH
  Date: 22/11/2023
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            padding: 6px 12px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>Danh Sách Sinh Viên</h1>
<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>MSV</th>
        <th>Họ và Tên</th>
        <th>Tuổi</th>
        <th>Địa Chỉ</th>
        <th>Giới tính</th>
        <th>Lớp Học</th>
        <th>Tính năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${students}" var="s">
        <tr>
            <td>${s.studentCode}</td>
            <td>${s.studentName}</td>
            <td>${s.age}</td>
            <td>${s.address}</td>
            <td>${s.sex?"Nam":"Nữ"}</td>
            <td>${s.classRoom}</td>
            <td>
                <a href="student?action=edit&id=${s.studentCode}">Sửa</a>
                <a onclick="return confirm('muốn xóa không!')" href="student?action=delete&id=${s.studentCode}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a style=" text-decoration: none;border: 1px solid black" href="student?action=add">Thêm mới sinh viên</a>
</body>
</html>
