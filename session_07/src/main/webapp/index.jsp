<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<%--thực hành1--%>
<%--<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
  <label>Rate: </label><br/>
  <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
  <label>USD: </label><br/>
  <input type="text" name="usd" placeholder="USD" value="0"/><br/>
  <input type = "submit" id = "submit" value = "Converter"/>
</form>--%>

<%--thực hành1--%>
<%--<h2>Vietnamese Dictionary</h2>
<form action="dictionary.jsp" method="post">
  <input type="text" name="search" placeholder="Enter your word: "/>
  <input type = "submit" id = "submit" value = "Search"/>
</form>--%>

<%--bt máy tính--%>

<h2>Simple Calculator</h2>
<form action="calculator-servlet" method="post">
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

<a href="userList">San pham</a>
</body>
</html>