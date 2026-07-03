<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <title>BzPayroll - Form 941 History</title>
    <style>
        .wrap { padding: 16px; }
        table { width: 100%; border-collapse: collapse; background: #fff; }
        th, td { border: 1px solid #d8d8d8; padding: 8px; font-size: 13px; }
        th { background: #f3f7fb; text-align: left; }
        .btn { padding: 6px 12px; border: 1px solid #1a4f8f; background: #1a4f8f; color: #fff; text-decoration: none; }
    </style>
</head>
<body>
<div class="wrap">
    <h2>Form 941 History</h2>
    <p>Browse generated annual final-year Form 941 records (Q4 snapshots).</p>
    <p><a class="btn" href="${pageContext.request.contextPath}/form941">Back to Form 941</a></p>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Year</th>
            <th>Type</th>
            <th>Company</th>
            <th>Total Wages</th>
            <th>Total Tax Liability</th>
            <th>Generated At</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${historyList}" var="row">
            <tr>
                <td>${row.id}</td>
                <td>${row.formYear}</td>
                <td>Final (Q4)</td>
                <td>${row.companyName}</td>
                <td><fmt:formatNumber value="${row.totalWages}" type="currency"/></td>
                <td><fmt:formatNumber value="${row.totalTaxLiability}" type="currency"/></td>
                <td>${row.generatedAt}</td>
                <td><a href="${pageContext.request.contextPath}/form941?id=${row.id}">Open</a></td>
            </tr>
        </c:forEach>
        <c:if test="${empty historyList}">
            <tr><td colspan="8">No Form 941 history available.</td></tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>
