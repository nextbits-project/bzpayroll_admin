<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Internal Server Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            text-align: center;
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 500px;
        }
        .error-code {
            font-size: 72px;
            color: #e67e22;
            margin: 0;
        }
        .error-message {
            font-size: 24px;
            color: #2c3e50;
            margin: 1rem 0;
        }
        .error-description {
            color: #7f8c8d;
            margin-bottom: 2rem;
        }
        .error-details {
            font-size: 14px;
            color: #95a5a6;
            margin-bottom: 1rem;
        }
        .home-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .home-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1 class="error-code">500</h1>
    <h2 class="error-message">Internal Server Error</h2>
    <p class="error-description">
        Something went wrong on our end. Our team has been notified and is working to fix the issue.
    </p>
    <c:if test="${pageContext.errorData.throwable != null && pageContext.request.isUserInRole('ADMIN')}">
        <div class="error-details">
            Error: ${pageContext.errorData.throwable.message}
        </div>
    </c:if>
    <a href="${pageContext.request.contextPath}/" class="home-link">Return to Home</a>
</div>
</body>
</html>