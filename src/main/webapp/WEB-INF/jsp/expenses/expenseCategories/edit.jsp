<%--
  Created by IntelliJ IDEA.
  User: benza
  Date: 8/31/2024
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Expense Category</title>
</head>
<body>
<h1>Edit Expense Category</h1>
<form action="${pageContext.request.contextPath}/expenseCategories/update/${category.id}" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${category.name}" />
    <input type="submit" value="Update" />
</form>
<a href="${pageContext.request.contextPath}/expenseCategories">Back to List</a>
</body>
</html>
