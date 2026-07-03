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
        <spring:message code="BzComposer.eSalesAccountManager" />
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
    <script>
        $(document).ready(function () {
            $('#custTable').DataTable({
                "iDisplayLength": 20,
                "ordering": true,
                "order": [[0, 'desc']]
            });
            $("#custTable_length").hide();
        });
    </script>
    <style>
        .main-container {
        background-color: #f8f9fa;
        }
        .section {
        padding: 15px;
        border-bottom: 1px solid #ccc;
        }
        .status-bar {
        height: 10px;
        background-color: #0d6efd;
        margin-top: 10px;
        }
        .btn-stop {
        margin-top: 15px;
        }
        .status-messages {
        height: 150px;
        background-color: white;
        overflow-y: auto;
        border-top: 1px solid #ccc;
        }
    </style>
</head>

<body>
    <!-- begin shared/header -->
    <div id="ddcolortabsline">&nbsp;</div>

    <div id="cos">
        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">
                        <div class="container border p-4 rounded  bg-white">
                            <h3 style="margin-top: 0px;padding-bottom: 50px;">eBay Online Import</h3>

                            <div class="mb-4">
                                <h6>Select Time Interval for Order Import</h6>
                                <div class="row g-3 align-items-center">
                                    <div class="col-md-2">
                                        <label for="fromDate" class="form-label">From</label>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="datetime-local" class="form-control" id="fromDate" value="${formattedFromDate}">
                                    </div>
                                </div>
                                <div class="row g-3 align-items-center mt-2">
                                    <div class="col-md-2">
                                        <label for="toDate" class="form-label">To</label>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="datetime-local" class="form-control" id="toDate" value="${formattedToDate}">
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <h6>Import Information</h6>
                                <div class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" value=""
                                        id="multiStore">
                                    <label class="form-check-label" for="multiStore">
                                        Allow import from multiple stores
                                    </label>
                                </div>
                                <div class="row g-2 align-items-center mb-2">
                                    <div class="col-md-3">
                                        <select class="form-select" id="selectedStoreId" onchange="selectStore(this)">
                                            <c:forEach items="${storeList}" var="objList" varStatus="loop">
                                            <option value="${objList.storeId}" 
                                                <c:if test="${objList.storeId == defaultStore.storeId}">selected</c:if>>
                                                ${objList.storeName}
                                            </option>
                                        </c:forEach>

                                        </select>

                                    </div>
                                    <div class="col-md-auto">
                                        <a href="eSalesBoard?tabid=eSalesAccountManager" target="_blank" class="btn btn-secondary">Set up stores</a>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <button class="btn btn-primary" onclick="startImport()">Online Import</button>
                                <button class="btn btn-success" onclick="changeSettingDialog()">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
    <input type="hidden" id="selected-store-is-default" value="0" />
    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
        <link rel="stylesheet"
            href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
        <script type="text/javascript"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>

<script>
    var storeNameChange = false;
    const now = new Date();
    const oneYearAgo = new Date();
    oneYearAgo.setFullYear(now.getFullYear() - 1);
    function formatDateTimeLocal(date) {
        console.log("date"+date);
        const pad = (n) => n.toString().padStart(2, '0');
        return date.getFullYear() + "-" + pad(date.getMonth() + 1) + "-" + pad(date.getDate()) + "T" + pad(date.getHours()) + ":" + pad(date.getMinutes());
    }
    function selectStore(val){
        debugger;
        storeNameChange = true;
        var selectElement = document.getElementById("selectedStoreId");
        var selectedStoreId = selectElement.value;
        var selectedStoreName = selectElement.options[selectElement.selectedIndex].text;
        document.getElementById("storeNameData").innerText = selectedStoreName;
    }

    function changeSettingDialog(){
        debugger;
        if(storeNameChange){
            document.getElementById("storeNameChanged").innerText = "Store Name";
        }
        $("#changeSettingDialog").dialog({
            resizable: false,
            height: 300,
            width: 500,
            modal: true,
            position: {
                my: "center center",
                at: "center center",
                of: window
            },
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                    var selectedStore = document.getElementById("selectedStoreId").value;
                    var fromDate = document.getElementById("fromDate").value;
                    var toDate = document.getElementById("toDate").value;
                    var data = {
                        "storeId" : selectedStore,
                        "fromDate":fromDate,
                        "toDate": toDate,
                        "storeNameChange":storeNameChange
                    }
                    var obj = JSON.stringify(data);
                    $.ajax({
                    type : "POST",
                    url: "eSalesAjax?tabid=SaveStoreChange",
                    data: "data=" + obj,
                    success : function(data) {
                        dataSavedDialog();
                    },
                    error : function(data) {
                        //return showerrordialog();
                    }
                    });

                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                }

            }
        });
        return false;
}

    function dataSavedDialog(){
        $("#dataSavedDialog").dialog({
            resizable: false,
            height: 200,
            width: 400,
            modal: true,
            position: {
                my: "center center",
                at: "center center",
                of: window
            },
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }

            }
        });
        return false;
    }

    function startImport() {
        var selectedStoreId = document.getElementById("selectedStoreId").value;
        $.ajax({
            type: "POST",
            url: "/importEBayImportOrder",
            data: { storeId: selectedStoreId },
            success: function (response) {
                document.getElementById("ProcessedOrders").innerText = response;
                console.log("Import successful");
                onlineAmazonImportDialog();
            },
            error: function (error) {
                console.error("Error importing orders", error);
                alert("Failed to import orders.");
            }
        });
    }
    function onlineAmazonImportDialog(){
        $("#onlineAmazonImportDialog").dialog({
            resizable: false,
            height: 470,
            width: 860,
            modal: true,
            title: "eSales Order Import",
            position: {
                my: "center",
                at: "center",
            },
            buttons: [
                {
                    text: "Ok",
                    class: "btn btn-success",
                    click: function () {

                        $(this).dialog("close");
                    }
                },
                {
                    text: "Cancel",
                    class: "btn btn-danger",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });
        return false;
    }

</script>

<div id="changeSettingDialog" style="display:none;">
	<p>You have changed the following Setting</p>
    <p id="storeNameChanged" style="margin: 0px;"></p>
    <p style="margin: 0px;">Date From</p>
    <p style="margin: 0px;">Date To</p>
    <p>Do you want to save the change?</p>
</div>
<div id="dataSavedDialog" style="display:none;">
    <p><spring:message code="BzComposer.saveData"/></p>
</div>
<div id="onlineAmazonImportDialog" style="display:none;">
   <div class="main-container">

    <div class="section">
        <p class="mb-1 text-dark fw-bold">Processing eSales records from :
        <span class="">EBay[eBay Online Import]</span>
        </p>
        <p class="mb-1 text-dark">Successfully Processed Orders: <strong><span id="ProcessedOrders">0</span></strong></p>
        <p class="mb-1 text-dark">Duplicate Orders: <strong>0</strong></p>

        <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 100%;"></div>
        </div>

        <div class="text-center btn-stop">
        <button class="btn btn-secondary">Close</button>
        </div>
    </div>

    <div class="section status-messages">
        <strong>Status Messages</strong>
        <div class="mt-2 p-2"></div>
    </div>
    </div>
</div>