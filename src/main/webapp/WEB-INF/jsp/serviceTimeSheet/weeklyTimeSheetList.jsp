<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page isELIgnored="false" %>
<%@ page errorPage="/WEB-INF/jsp/include/sessionExpired.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <script src="${pageContext.request.contextPath}/scripts/serviceTimeSheet/weeklyTimeSheet.js"></script>
    <title>Title</title>
</head>
<body>
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
    <div class="statusquo ok">
        <div id="hoja">
            <div id="blanquito">
                <div id="padding">
                    <iframe src="/primefaces/timeSheet/WeeklyTimeSheet.xhtml"
                            width="100%" height="100%" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
