<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <title>
        <spring:message code="BzComposer.eSalesBatchImport" />
    </title>
    <style type="text/css">
        body {
            min-width: 1366px;
        }

        .fht-tbody {
            height: 180px !important;
            /*  change table height*/
            border-bottom: 1px solid rgb(207, 207, 207);
        }

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

        table.tabla-listados {
            width: 100%;
            border: 1px solid rgb(207, 207, 207);
            margin: 0px 0px 0px 0px;
        }

        table.tabla-listados tbody tr.odd td {
            background: #e1e5e9;
        }

        .errorMsg {
            color: #D8000C;
            background-color: #FFD2D2;
        }

        table.tabla-listados thead tr th {
            font-size: 14px;
        }

        table.tabla-listados tbody tr td {
            font-size: 12px;
        }
    </style>
    <style>
        .panel {
            display: flex;
            flex-direction: column;
            border: 1px solid #ccc;
            height: 300px;
            padding: 7px;
        }

        .panel-title {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .panel-body {
            flex: 1 1 auto;
            overflow-y: auto;
        }

        .panel-footer {
            padding: 10px;
            border-top: 1px solid #ccc;
            background-color: #f9f9f9;
        }

        .formbutton {
            padding: 5px 10px;
            margin-right: 5px;
        }

        .status-box {
            height: 100px;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #fff;
        }
        .form-check{
            padding-left: 2em !important;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <!-- begin shared/header -->
    <div id="ddcolortabsline">&nbsp;</div>
    <div id="cos">
        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">
                        
                        <div class="">
                            <div class="row">
                                <div class="col-md-6">
                                    <span
                                        style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                                        <spring:message code="menu.eSales.eSales_Batch_Import" />
                                    </span>
                                    <br>
                                </div>
                                <div class="col-md-6">
                                    <table>
                                        <tr align="right">
                                            <td align="right" style="position: absolute; right: 25px;">
                                                
                                                <input type="button" class="formbutton" id="update-btn"
                                                    style="padding: 7 15px;"
                                                    value="<spring:message code='BzComposer.eSales_Batch_Import.button.StartImport'/>" />
                                                <input type="button" class="formbutton" id="save-btn"
                                                    style="padding: 7 15px;"
                                                    value="<spring:message code='BzComposer.eSales_Batch_Import.button.StopImport'/>" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="row mb-3 mt-4">
                                <div class="col-md-3">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="" style="padding: 0px;padding-bottom: 10px;">
                                                <label style="font-size: 15px;"><spring:message code="BzComposer.eSalesBatchImport.eSalesStores"/></label></br>
                                                <label class="form-check-label"><strong><spring:message code="BzComposer.eSalesAccountManager.StoreType.Magento"/> </strong></label>
                                            </div>
                                            <input type="hidden" name="listSize" id="lSize" value='${storeList.size()}' />
                                            <c:forEach items="${storeList}" var="objList" varStatus="loop">
                                                <div class="form-check" id='${loop.index}$$'>
                                                    <input class="form-check-input" type="checkbox" id="${objList.storeId}store" onclick="selectStore('${objList.storeId}')"> <label for="s1">${objList.storeName}</label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        
                                        <div class="panel-footer d-flex justify-content-between">
                                            <button class="formbutton"><spring:message code='BzComposer.eSales_Batch_Import.button.Configure'/></button>
                                            <button class="formbutton" onclick="toggleSelectAll()" id="selectAll"><spring:message code='BzComposer.eSales_Batch_Import.button.SelectAll'/></button>
                                            <button class="formbutton" onclick="toggleUnSelectAll()" id="unSelectAll" style="display: none;"><spring:message code='BzComposer.eSales_Batch_Import.button.UnselectAll'/></button>
                                            <button class="formbutton"><spring:message code='BzComposer.eSales_Batch_Import.button.Save'/></button>
                                        </div>
                                        </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="panel">
                                        <div class="panel-title">Last Imported Date:
                                            <input type="date"
                                                class="form-control form-control-sm d-inline w-auto"
                                                value="2020-08-26">
                                            &nbsp;&nbsp;Current Date:
                                            <span class="ms-1">
                                                2020-08-26
                                            </span>
                                        </div>
                                        <div class="mt-2">Import History</div>
                                        <!-- Add import history table or text here -->
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="panel">
                                        <div class="panel-title">Order History</div>
                                        <table class="table table-sm table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Order Date</th>
                                                    <th>Type–Store Name</th>
                                                    <th>Order #</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Dynamic rows -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <div class="panel-title">Status Messages</div>
                                <div class="status-box"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <input type="hidden" id="ord_value" />
    <input type="hidden" id="invoice_id" />
    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
        <link rel="stylesheet"
            href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
        <script type="text/javascript"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>

</html>
<script>
    var selectedStoreId = "";
    var storeIds = [];
    <c:forEach items="${storeList}" var="objList">
        storeIds.push('${objList.storeId}');
    </c:forEach>
    function selectStore(storeId){
        var isChecked = document.getElementById(storeId + "store").checked;
        if (isChecked) {
            selectedStoreId = storeId;
        } else {
            selectedStoreId = "";
        }
    }
    function selectAllStore(){
        var lSize = document.getElementById("lSize").value;
    }
    function toggleSelectAll() {
        storeIds.forEach(function(storeId) {
            var checkbox = document.getElementById(storeId + "store");
            if (checkbox) {
                checkbox.checked = true;
            }
        });
        document.getElementById("selectAll").style.display = "none";
        document.getElementById("unSelectAll").style.display = "block";
    }
    function toggleUnSelectAll() {
        storeIds.forEach(function(storeId) {
            var checkbox = document.getElementById(storeId + "store");
            if (checkbox) {
                checkbox.checked = false;
            }
        });
        document.getElementById("selectAll").style.display =  "block";
        document.getElementById("unSelectAll").style.display = "none";
    }

</script>