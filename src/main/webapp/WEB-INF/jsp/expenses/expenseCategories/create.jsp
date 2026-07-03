<%--
  Created by IntelliJ IDEA.
  User: benza
  Date: 8/31/2024
  Time: 12:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Expense Category</title>
</head>
<body>
<h1>Create Expense Category</h1>
<form action="${pageContext.request.contextPath}/expenseCategories/create" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" />
    <input type="submit" value="Create" />
</form>
<a href="${pageContext.request.contextPath}/expenseCategories">Back to List</a>
</body>
</html>
