<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 11/26/2023
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<p>
    <a href="/danh-muc">Back to customer list</a>
</p>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <h1 class="text-center text-danger">Sửa danh muc </h1>
            <form action="<%=request.getContextPath()%>/danh-muc" method="POST">
                <div class="form-group">
                    <input type="hidden" name="id" value="${category.getCategoryId()}">
                    <label for="categoryName">Ten danh muc</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName"
                           value="${category.getCategoryName()}">
                </div>
                <div class="form-group">
                    <label for="Active">Status </label>
                    <input type="radio" id="Active" name="fav_language" ${category.getCategoryStatus() ? "checked" : ""}
                           value="1">
                    <label for="Active">Active</label>
                    <input type="radio" id="IsActive"
                           name="fav_language" ${!category.getCategoryStatus() ? "checked" : ""} value="0">
                    <label for="IsActive">InActive</label><br>
                </div>
                <button type="submit" class="btn btn-primary" value="edit" name="action">Edit</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
