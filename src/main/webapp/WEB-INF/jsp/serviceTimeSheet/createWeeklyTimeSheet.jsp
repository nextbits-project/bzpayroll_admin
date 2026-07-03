<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Create Weekly Time Sheet</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
<h2>Create Weekly Time Sheet</h2>
<form:form modelAttribute="timesheet" method="post" action="${pageContext.request.contextPath}/timesheets">
    <table>
        <tr>
            <td><label for="employee">Employee:</label></td>
            <td><form:select path="employee.employeeId" id="employee">
                <form:options items="${employees}" itemValue="id" itemLabel="name"/>
            </form:select></td>
        </tr>
        <tr>
            <td><label for="weekStartDate">Week Start Date:</label></td>
            <td><form:input path="weekStartDate" id="weekStartDate" type="date"/></td>
        </tr>
        <tr>
            <td><label for="weekEndDate">Week End Date:</label></td>
            <td><form:input path="weekEndDate" id="weekEndDate" type="date"/></td>
        </tr>
        <tr>
            <td><label for="billable">Billable:</label></td>
            <td><form:checkbox path="billable" id="billable"/></td>
        </tr>
        <tr>
            <td><label for="customerName">Customer Name:</label></td>
            <td><form:input path="customerName" id="customerName"/></td>
        </tr>
        <tr>
            <td><label for="serviceItem">Service Item:</label></td>
            <td><form:input path="serviceItem" id="serviceItem"/></td>
        </tr>
        <tr>
            <td><label for="description">Description:</label></td>
            <td><form:textarea path="description" id="description"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <table>
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Hours</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="entry" items="${timesheet.timeEntries}" varStatus="status">

                    </c:forEach>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Save Timesheet"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
