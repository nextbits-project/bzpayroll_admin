<%--
  Created by IntelliJ IDEA.
  User: benza
  Date: 8/31/2024
  Time: 12:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense Categories</title>
</head>
<body>
<h1>Expense Categories</h1>
<a href="${pageContext.request.contextPath}/expenseCategories/create">Create New Category</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${categories}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/expenseCategories/edit/${category.id}">Edit</a>
                <form action="${pageContext.request.contextPath}/expenseCategories/delete/${category.id}" method="post" style="display:inline;">
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
