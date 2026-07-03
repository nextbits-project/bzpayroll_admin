<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@ include file="/include/header.jsp" %>
    <link rel="stylesheet" href="time_styles.css">
    <title>Create new Single Time Activity</title>
</head>
<body>
<div id="ddcolortabsline"></div>
<div class="container">
    <div class="page-title">
        Single Time Activity
    </div>
    <iframe src="${pageContext.request.contextPath}/primefaces/CreateSingeTimeSheet.xhtml" width="100%" height="600px" frameborder="0"></iframe>

</div>
<script>
    document.getElementById('billable').addEventListener('change', function () {
        var customerRow = document.getElementById('customerRow');
        customerRow.style.display = this.checked ? 'table-row' : 'none';
    });
</script>
</body>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</html>
