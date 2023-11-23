<%--
  Created by IntelliJ IDEA.
  User: SOC XINH
  Date: 22/11/2023
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/student">
    <input type="hidden" value="edit" name="action">
    <label>Mã học sinh: </label>
    <input type="text" name="studentCode" value="${student.studentCode}" readonly><br>
    <label>Họ và tên: </label>
    <input type="text" name="studentName"value="${student.studentName}"><br>
    <label>Tuổi: </label>
    <input type="number" name="age"value="${student.age}"><br>
    <label>Địa chỉ: </label>
    <input type="text" name="address"value="${student.address}"><br>
    <label>Giới tinh: </label>
    <select name="sex" >
        <option value="true" ${student.sex ? 'selected' : ''}>Nam</option>
        <option value="false" ${student.sex ? 'selected' : ''}>Nữ</option>
    </select><br>
    <label>Lớp học</label>
    <input type="text" name="classRoom"value="${student.classRoom}"><br>
    <input type="submit" name="Submit">
</form>
</body>
</html>
