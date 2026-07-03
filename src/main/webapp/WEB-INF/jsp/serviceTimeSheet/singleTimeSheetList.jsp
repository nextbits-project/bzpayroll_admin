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
    <script src="${pageContext.request.contextPath}/scripts/serviceTimeSheet/singleTimeSheet.js"></script>
    <title>Title</title>
    <style type="text/css">
        .dataTables_length {
            font-size: 14px;
        }

        .dataTables_filter {
            font-size: 14px;
        }

        .dataTables_info {
            font-size: 14px;
        }

        .dataTables_paginate {
            font-size: 14px;
        }

        table.sortable thead {
            background-color: #eee;
            color: #666666;
            font-weight: bold;
            cursor: default;
        }

        table.tabla-listados {
            width: 100%;
            border: 1px solid rgb(207, 207, 207);
            margin: 0px 0px 0px 0px;
        }

        table.tabla-listados tbody tr.odd td {
            background: #e1e5e9;
        }

        table.tabla-listados thead tr th {
            font-size: 14px;
        }

        table.tabla-listados tbody tr td {
            font-size: 12px;
        }
    </style>
</head>
<body onload="initialize();">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
    <div class="statusquo ok">
        <div id="hoja">
            <div id="blanquito">
                <div id="padding">
                    <iframe src="/primefaces/timeSheet/SingeTimeSheetList.xhtml"
                            width="100%" height="100%" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet"
      href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"/>
<script type="text/javascript"
        src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
<%--<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>--%>
</html>