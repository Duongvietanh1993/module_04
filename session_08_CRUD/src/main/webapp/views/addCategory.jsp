<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 11/26/2023
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form {
            width: 400px;
            margin: 0 auto;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="radio"] {
            margin-bottom: 10px;
        }

        a {
            display: inline-block;
            margin-right: 10px;
        }

        input[type="submit"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            margin: 5px;
            text-decoration: none;
            display: inline-block;
            padding: 6px 12px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/danh-muc">
    <h1>Thêm mới</h1>
    <label>Tên danh muc: </label>
    <input type="text" name="categoryName"><br>
    <label >Active </label>
    <input type="radio"  name="categoryStatus" value="true" checked>
    <label >Block </label>
    <input type="radio" name="categoryStatus" value="false"><br>
    <a href="<%=request.getContextPath()%>/danh-muc">Back</a>
    <input type="submit" name="Submit">
</form>
</body>
</html>
