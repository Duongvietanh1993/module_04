<%--
  Created by IntelliJ IDEA.
  User: SOC XINH
  Date: 22/11/2023
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Simple Calculator</h2>
<form action="calculator" method="post">
    <label for="firstOperand">First operand:</label>
    <input type="number" id="firstOperand" name="firstOperand" required><br>
    <label>Operator:</label>
    <select name="operator">
        <option value="add">Addition (+)</option>
        <option value="subtract">Subtraction (-)</option>
        <option value="multiply">Multiplication (*)</option>
        <option value="divide">Division (/)</option>
    </select><br>
    <label for="secondOperand">Second operand:</label>
    <input type="number" id="secondOperand" name="secondOperand" required><br>

    <input type="submit" value="Calculate">
</form>
</body>
</html>
