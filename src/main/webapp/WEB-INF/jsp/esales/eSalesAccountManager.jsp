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
        $(document).ready(function() {
            $('#custTable').DataTable({
                "iDisplayLength": 20,
                "ordering": true,
                "order": [[0, 'desc']]
            });
            $("#custTable_length").hide();
        });
    </script>
</head>

<body>
    <!-- begin shared/header -->
    <div id="ddcolortabsline">&nbsp;</div>
    
        <div id="cos">
            <div class="statusquo ok">
                <div id="hoja">
                    <div id="blanquito">
                        <div id="padding">
                            <div style="float: left;">
                                <span
                                    style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                                    <spring:message code="BzComposer.eSalesAccountManager" />
                                </span>
                                <br>
                                <table>
                                    <tr>
                                        <td>
                                            <spring:message
                                                code="BzComposer.eSalesAccountManager.StoreType" />
                                        </td>
                                        <td>
                                            <select id="storeType" name="storeType" onchange="selectStoreType()">
                                                <option value=""></option>
                                                <c:forEach var="store" items="${storeTypeList}">
                                                    <option value="${store.storeTypeId}">${store.storeTypeName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="float: right;">
                                <table>
                                    <tr align="right">
                                        <td align="right" style="position: absolute; right: 25px;">
                                            
                                            <input type="button" class="formbutton" id="update-btn"
                                                style="padding: 7 15px;display: none;" onclick="saveStoreDetails()"
                                                value="<spring:message code='BzComposer.global.update'/>" />
                                            <input type="button" class="formbutton" id="save-btn"
                                                style="padding: 7 15px;" onclick="saveStoreDetails()"
                                                value="<spring:message code='BzComposer.eSalesAccountManager.button.Save'/>" />
                                            <input type="button" class="formbutton"
                                                style="padding: 7 15px;" onclick="deleteStore()"
                                                value="<spring:message code='BzComposer.global.delete'/>" />
                                            <input type="button" class="formbutton"
                                                style="padding: 7 15px;" onclick="clearData()"
                                                value="<spring:message code='BzComposer.eSalesAccountManager.button.Clear'/>" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <table style="width: 100%; apdding: 0;">
                                <tr>
                                    <td>
                                        <table style="padding: 0;width: 100%; margin-top: 10px;"
                                            align="center">
                                            <td valign="top" colspan="1"
                                                style="width: 350px; padding: 0; height: 75vh; border: 1px solid #ccc;">
                                                <input type="hidden" name="listSize" id="lSize"
                                                    value='${storeList.size()}' />
                                                <table id="custTable" class="tabla-listados "
                                                    cellspacing="0"
                                                    style=" border: 0; padding: 0;margin: 0; height: auto;">
                                                    <thead>
                                                        <tr valign="top">
                                                            <th class="emblem" style="font-size:12px;">
                                                                <div align="center">
                                                                    <spring:message
                                                                        code="BzComposer.eSalesAccountManager.Stores" />
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="custTableBody">
                                                        <c:forEach items="${storeList}"
                                                            var="objList" varStatus="loop">
                                                            <tr id='${loop.index}$$'
                                                            data-store-id="${objList.storeId}"
                                                            data-store-name="${objList.storeName}"
                                                            data-store-type-id="${objList.storeTypeId}"
                                                            data-abbreviation="${objList.abbreviation}"
                                                            data-storeTypeName="${objList.storeTypeName}"
                                                            data-nickName="${objList.nickName}"
                                                            data-currentStore="${objList.currentStore}"
                                                            data-isDefault="${objList.isDefault}"
                                                            data-isActive="${objList.isActive}"
                                                            data-fromDate="${objList.fromDate}"
                                                            data-toDate="${objList.toDate}"
                                                            data-packingReturnPolicy="${objList.packingReturnPolicy}"
                                                            data-magentoLoginId="${objList.magentoLoginId}"
                                                            data-magentoPassword="${objList.magentoPassword}"
                                                            data-dbUrl="${objList.dbUrl}"
                                                            data-companyName="${objList.companyName}"
                                                            data-firstName="${objList.firstName}"
                                                            data-lastName="${objList.lastName}"
                                                            data-address1="${objList.address1}"
                                                            data-address2="${objList.address2}"
                                                            data-city="${objList.city}"
                                                            data-state="${objList.state}"
                                                            data-country="${objList.country}"
                                                            data-zipcode="${objList.zipcode}"
                                                            data-phoneNumber="${objList.phoneNumber}"
                                                            data-email="${objList.email}"

                                                            style="cursor:pointer;">
                                                                <td colspan="2" style="font-size:12px;"
                                                                    class="">
                                                                    ${objList.storeName}
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td colspan="10" style="vertical-align: 0;">
                                                <div id="table-negotiations" style="height:auto;">
                                                    <table class="table table-borderless"
                                                        cellspacing="0"
                                                        style="margin-top: 0; margin-left: 20px;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="width: 120px; ">
                                                                    <spring:message
                                                                        code="BzComposer.eSalesAccountManager.StoreName" />
                                                                    <span class="inputHighlighted">
                                                                        <spring:message
                                                                            code="BzComposer.CompulsoryField.Validation" />
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="store-name" />
                                                                </td>
                                                                <td style="width: 120px; ">
                                                                    <spring:message
                                                                        code="BzComposer.eSalesAccountManager.Abbreviation" />
                                                                    <span class="inputHighlighted">
                                                                        <spring:message
                                                                            code="BzComposer.CompulsoryField.Validation" />
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <input type="text" id="abbreviation" />
                                                                </td>
                                                                <td>
                                                                    <input type="checkbox" id="default-store" />
                                                                    <spring:message
                                                                        code="BzComposer.eSalesAccountManager.DefaultStore" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <spring:message
                                                                        code="BzComposer.sales.FromDate" />
                                                                    <span class="inputHighlighted">
                                                                        <spring:message
                                                                            code="BzComposer.CompulsoryField.Validation" />
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <input type="datetime-local" id="fromDate" />
                                                                </td>
                                                                <td>
                                                                    <spring:message
                                                                        code="BzComposer.sales.to" />
                                                                    <span class="inputHighlighted">
                                                                        <spring:message
                                                                            code="BzComposer.CompulsoryField.Validation" />
                                                                    </span>
                                                                </td>
                                                                <td>
                                                                    <input type="datetime-local" id="toDate" />
                                                                </td>
                                                                <td>
                                                                    <input type="checkbox" id="active" checked/>
                                                                    <spring:message
                                                                        code="BzComposer.eSalesAccountManager.Active" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <div class="d-flex flex-column">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.StoreInformation" />
                                                                        <textarea cols="5" rows="5"
                                                                            style="margin-top: 19px;" id="store-information" readonly></textarea>
                                                                        <div>
                                                                            <button onclick="editAddressDialog()"
                                                                                class="formbutton btn-sm float-right mt-4">
                                                                                <spring:message
                                                                                    code="BzComposer.eSalesAccountManager.button.EditAddress" />
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td colspan="2">
                                                                    <div class="d-flex flex-column">
                                                                        <spring:message code="BzComposer.eSalesAccountManager.StoreLogoImage" />
                                                                        
                                                                        <!-- This div looks like a textarea and will show the image -->
                                                                        <div id="logoDisplay"
                                                                            style="margin-top: 18px; width: 321px; height: 99px; border: 1px solid #ced4da; border-radius: 4px; padding: 4px; background-color: #ffffff; resize: none;">
                                                                            <img id="logoImage" src="" alt="Logo Preview" style="max-height: 100%; max-width: 100%; display: none;" />
                                                                        </div>
                                                                
                                                                        <div>
                                                                            <input type="file" id="logoFileInput" accept="image/*" style="display: none;" />
                                                                            <button type="button" class="formbutton btn-sm float-right mt-4" onclick="removeLogo()">
                                                                                <spring:message code="BzComposer.eSalesAccountManager.button.RemoveLogo" />
                                                                            </button>
                                                                            <button type="button" class="formbutton btn-sm float-right mt-4 me-2" onclick="document.getElementById('logoFileInput').click();">
                                                                                <spring:message code="BzComposer.eSalesAccountManager.button.AddLogo" />
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td colspan="2">
                                                                    <div class="d-flex flex-column">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.ScheduleTimesForItemUploading" />
                                                                            <select id="ScheduleTimes" name="ScheduleTimes" size="5">
                                                                            </select>
                                                                        <div>
                                                                            <button onclick="removeSelectedTime()"
                                                                                class="formbutton btn-sm float-right mt-4">
                                                                                <spring:message
                                                                                    code="BzComposer.eSalesAccountManager.button.Remove" />
                                                                            </button>
                                                                            <button onclick="addNewTimeDialog()"
                                                                                class="formbutton btn-sm float-right mt-4 me-2">
                                                                                <spring:message
                                                                                    code="BzComposer.eSalesAccountManager.button.Add" />
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div id="magentoData" style="display: none;">
                                                        <table class="table table-borderless"
                                                            cellspacing="0"
                                                            style="margin-top: 0; margin-left: 20px;">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.StoreEmail" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="store-email-md"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.ReturnPolicy" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <textarea name="" id="return-policy-md" cols="5"
                                                                            rows="5"
                                                                            style="width: 500px;"></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.APIUser" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="APIUser"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.APIKey" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="APIKey"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.SOAPURL" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="SOAPURL"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div id="AmazonSallerOnline" style="display: none;">
                                                        <table class="table table-borderless"
                                                            cellspacing="0"
                                                            style="margin-top: 0; margin-left: 20px;">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.StoreEmail" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="store-email-asa"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.ReturnPolicy" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <textarea name="" id="return-policy-asa" cols="5"
                                                                            rows="5"
                                                                            style="width: 500px;"></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message code="BzComposer.eSalesAccountManager.AccessKey" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="AccessKey"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message code="BzComposer.eSalesAccountManager.SecretKey" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="SecretKey"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message code="BzComposer.eSalesAccountManager.MerchantId" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="MerchantId"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message code="BzComposer.eSalesAccountManager.MarketPlaceId" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="MarketPlaceId"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div id="Woocommerce" style="display: none;">
                                                        <table class="table table-borderless"
                                                            cellspacing="0"
                                                            style="margin-top: 0; margin-left: 20px;">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.StoreEmail" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="store-email-w"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.ReturnPolicy" />
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <textarea name="" id="return-policy-w" cols="5"
                                                                            rows="5"
                                                                            style="width: 500px;"></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="5">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.BaseUrl" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="BaseUrl"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.ConsumerKey" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="text" id="ConsumerKey"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 120px; ">
                                                                        <spring:message
                                                                            code="BzComposer.eSalesAccountManager.ConsumerSecret" />
                                                                    </td>
                                                                    <td colspan="4">
                                                                        <input type="password" id="ConsumerSecret"
                                                                            style="width: 500px;" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div id="eBayOnline" style="display: none;">
                                                        <div class="row">
                                                            <table class="table table-borderless"
                                                                cellspacing="0"
                                                                style="margin-top: 0; margin-left: 20px;">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="width: 120px; ">
                                                                            <spring:message
                                                                                code="BzComposer.eSalesAccountManager.StoreEmail" />
                                                                            </span>
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <input type="text" id="store-email-ebay"
                                                                                style="width: 500px;" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 120px; ">
                                                                            <spring:message
                                                                                code="BzComposer.eSalesAccountManager.ReturnPolicy" />
                                                                            </span>
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <textarea name="" id="return-policy-ebay" cols="5"
                                                                                rows="5"
                                                                                style="width: 500px;"></textarea>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <table class="table table-borderless"
                                                                    cellspacing="0"
                                                                    style="margin-top: 0; margin-left: 20px;">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="width: 120px; ">
                                                                                <spring:message
                                                                                    code="BzComposer.eSalesAccountManager.DeveloperId" />
                                                                            </td>
                                                                            <td colspan="4">
                                                                                <input type="text" id="DeveloperId"
                                                                                    style="width: 500px;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 120px; ">
                                                                                <spring:message code="BzComposer.eSalesAccountManager.ApplicationId" />
                                                                            </td>
                                                                            <td colspan="4">
                                                                                <input type="text" id="ApplicationId"
                                                                                    style="width: 500px;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 120px; ">
                                                                                <spring:message code="BzComposer.eSalesAccountManager.Certificate" />
                                                                            </td>
                                                                            <td colspan="4">
                                                                                <input type="text" id="Certificate"
                                                                                    style="width: 500px;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 120px; ">
                                                                                <spring:message code="BzComposer.eSalesAccountManager.EPSServerURL" />
                                                                            </td>
                                                                            <td colspan="4">
                                                                                <input type="text" id="EPSServerURL"
                                                                                    style="width: 500px;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 120px; ">
                                                                                <spring:message code="BzComposer.eSalesAccountManager.APIServerURL" />
                                                                            </td>
                                                                            <td colspan="4">
                                                                                <input type="text" id="APIServerURL"
                                                                                    style="width: 500px;" />
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                <table class="table table-borderless"
                                                                    cellspacing="0"
                                                                    style="margin-top: 0;">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <spring:message
                                                                                    code="BzComposer.eSalesAccountManager.PasteYourTokenText" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="4">
                                                                                <textarea cols="32" rows="9" id="PasteYourTokenText"></textarea>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <input type="hidden" id="store-type-id" value="0"/>
    <input type="hidden" id="store-id" value="0"/>
    <input type="hidden" id="selected-store-is-default" value="0"/>
    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
        <link rel="stylesheet"
            href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
        <script type="text/javascript"
            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
<script>
   
</script>
<script>
    var scheduleTimesArray = [];
     $(document).ready(function() {
        $("#custTableBody").on("click", "tr", function() {
            $("#update-btn").show();
            $("#save-btn").hide();
            var storeId = $(this).data("store-id");
            var storeName = $(this).data("store-name");
            var storeTypeId = $(this).data("store-type-id");
            var abbreviation = $(this).data("abbreviation");
            var storeTypeName = $(this).data("storetypename");
            var nickName = $(this).data("nickname");
            var currentStore = $(this).data("currentstore");
            var isDefault = $(this).data("isdefault");
            var isActive = $(this).data("isactive");
            var fromDate = $(this).data("fromdate");
            var toDate = $(this).data("todate");
            var packingReturnPolicy = $(this).data("packingreturnpolicy");
            var magentoLoginId = $(this).data("magentologinid");
            var magentoPassword = $(this).data("magentopassword");
            var dbUrl = $(this).data("dburl");
            
            var companyName = $(this).data("companyname");
            var firstName = $(this).data("firstname");
            var lastName = $(this).data("lastname");
            var address1 = $(this).data("address1");
            var address2 = $(this).data("address2");
            var cityName = $(this).data("city");
            var stateName = $(this).data("state");
            var countryName = $(this).data("country");
            var zipcode = $(this).data("zipcode");
            var phoneNumber = $(this).data("phonenumber");
            var email = $(this).data("email");

            
            var BaseUrl = $(this).data("woocommercebaseurl");
            var WoocommerceConsumerKey = $(this).data("woocommerceconsumerkey");
            var WoocommerceConsumerSecret = $(this).data("woocommerceconsumersecret");
            
            var amazonAccesKey = $(this).data("amazonacceskey");
            var amazonSecretKey = $(this).data("amazonsecretkey");
            var amazonMarketPlaceId = $(this).data("amazonmarketplaceid");
            var amazonMerchantId = $(this).data("amazonmerchantid");

            var DeveloperId = $(this).data("developerid");
            var ApplicationId = $(this).data("applicationid");
            var Certificate = $(this).data("certificate");
            var EPSServerURL = $(this).data("epsserverurl");
            var APIServerURL = $(this).data("apiserverurl");
            var PasteYourTokenText = $(this).data("pasteyourtokentext");

            // Example: Set the store name into an input box
            $("#store-name").val(storeName);
            $("#abbreviation").val(abbreviation);
            if(isDefault == 1){
                $("#default-store").prop("checked", true);
            }else{
                $("#default-store").prop("checked", false);
            }
            $("#selected-store-is-default").val(isDefault);
            if(isActive == 1){
                $("#active").prop("checked", true);
            }else{
                $("#active").prop("checked", false);
            }
            $("#fromDate").val(formatDateTimeLocalFromString(fromDate));
            $("#toDate").val(formatDateTimeLocalFromString(toDate));

            var formattedAddress = 
                (companyName ? companyName + "\n" : "") +
                (firstName || lastName ? (firstName + " " + lastName).trim() + "\n" : "") +
                (address1 ? address1 + "\n" : "") +
                (address2 ? address2 + "\n" : "") +
                (cityName || stateName || zipcode ? (cityName + (cityName && stateName ? ", " : "") + stateName + (zipcode ? " " + zipcode : "")).trim() + "\n" : "") +
                (countryName ? countryName + "\n" : "") +
                (phoneNumber ? "Tel: " + phoneNumber : "");

            $("#store-information").val(formattedAddress);
            $("#store-id").val(storeId);
            $("#store-type-id").val(storeTypeId);

            if(storeTypeId  == 14){
                // Magento fields
                $("#store-email-md").val(email);
                $("#return-policy-md").val(packingReturnPolicy);
                $("#APIUser").val(magentoLoginId);
                $("#APIKey").val(magentoPassword);
                $("#SOAPURL").val(dbUrl);

            } else if(storeTypeId  == 11){
                // Other E-Sales field

            } else if(storeTypeId  == 15){
                // Woocommerce
                $("#store-email-w").val(email);
                $("#return-policy-w").val(packingReturnPolicy);
                $("#BaseUrl").val(BaseUrl);
                $("#ConsumerKey").val(WoocommerceConsumerKey);
                $("#ConsumerSecret").val(WoocommerceConsumerSecret);

            } else if(storeTypeId  == 4){
                // Amazon Seller online
                $("#store-email-asa").val(email);
                $("#return-policy-asa").val(packingReturnPolicy);
                $("#AccessKey").val(amazonAccesKey);
                $("#SecretKey").val(amazonSecretKey);
                $("#MerchantId").val(amazonMerchantId);
                $("#MarketPlaceId").val(amazonMarketPlaceId);
                
            } else if(storeTypeId  == 3){
                // eBay online
                $("#store-email-ebay").val(email);
                $("#return-policy-ebay").val(packingReturnPolicy);
                $("#DeveloperId").val(DeveloperId);
                $("#ApplicationId").val(ApplicationId);
                $("#Certificate").val(Certificate);
                $("#EPSServerURL").val(EPSServerURL);
                $("#APIServerURL").val(APIServerURL);
                $("#PasteYourTokenText").val(PasteYourTokenText);
            }
            getStoreScheduleTimes(storeId);
            // Highlight the selected row
            $(this).addClass('draft').siblings().removeClass('draft');
        });
    });

    function getStoreScheduleTimes(storeId){
        $.ajax({
            type: "POST",
            url: "eSalesAjax?tabid=getStoreScheduleTimes",
            data: { storeId: storeId },
            dataType: "json"
        }).done(function (data) {
            console.log(data);
            
            const ScheduleTimes = document.getElementById("ScheduleTimes");
            ScheduleTimes.innerHTML = ""; // Clear existing options
            scheduleTimesArray = []; // Clear existing array

            data.forEach(function(time) {
                const option = document.createElement("option");
                var hour = time.scheduleTime.toString().padStart(2, '0');
                var minute = time.scheduleMinute.toString().padStart(2, '0');
                var ampm = time.scheduleAmPm;
                var timeData = hour + ":" + minute +" "+ampm;
                var sId = time.scheduleId;
                option.text = timeData;
                option.value = sId;
                ScheduleTimes.add(option);
                scheduleTimesArray.push(timeData);
            });
        });
    }   
    function formatDateTimeLocalFromString(dateString) {
            const date = new Date(dateString); // convert the string into Date object
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, "0");
            const day = String(date.getDate()).padStart(2, "0");
            const hours = String(date.getHours()).padStart(2, "0");
            const minutes = String(date.getMinutes()).padStart(2, "0");
            return year+"-"+month+"-"+day+"T"+hours+":"+minutes;
        }
    function clearData(){
        $("#update-btn").hide();
        $("#save-btn").show();

        $("#store-name").val("");
        $("#abbreviation").val("");
        $("#default-store").prop("checked", false);
        $("#active").checked;

        const now = new Date();
        const oneMonthLater = new Date();
        oneMonthLater.setMonth(now.getMonth() + 1);

        $("#fromDate").val(formatDateTimeLocal(now));
        $("#toDate").val(formatDateTimeLocal(oneMonthLater));
        $("#store-information").val("");
        $("#store-email-md").val("");
        $("#return-policy-md").val("");
        $("#APIUser").val("");
        $("#APIKey").val("");
        $("#SOAPURL").val("");
        $("#store-id").val(0);
        $("#store-type-id").val(0);

        $("#store-email-w").val("");
        $("#return-policy-w").val("");
        $("#BaseUrl").val("");
        $("#ConsumerKey").val("");
        $("#ConsumerSecret").val("");

        $("#store-email-asa").val("");
        $("#return-policy-asa").val("");
        $("#AccessKey").val("");
        $("#SecretKey").val("");
        $("#MerchantId").val("");
        $("#MarketPlaceId").val("");
        
        $("#store-email-ebay").val("");
        $("#return-policy-ebay").val("");
        $("#DeveloperId").val("");
        $("#ApplicationId").val("");
        $("#Certificate").val("");
        $("#EPSServerURL").val("");
        $("#APIServerURL").val("");
        $("#PasteYourTokenText").val("");

        $("#custTableBody tr").removeClass("draft");
    }
    function formatDateTimeLocal(date) {
        console.log("date"+date);
        const pad = (n) => n.toString().padStart(2, '0');
        return date.getFullYear() + "-" + pad(date.getMonth() + 1) + "-" + pad(date.getDate()) + "T" + pad(date.getHours()) + ":" + pad(date.getMinutes());
    }

    const now = new Date();
    const oneMonthLater = new Date();
    oneMonthLater.setMonth(now.getMonth() + 1);

    document.getElementById("fromDate").value = formatDateTimeLocal(now);
    document.getElementById("toDate").value = formatDateTimeLocal(oneMonthLater);

    function selectStoreType(){
        var selectedStoreType = document.getElementById("storeType").value;
        getStoreListByStoreTypeId(selectedStoreType);
        debugger;
        if(selectedStoreType == 14){
            document.getElementById("magentoData").style.display = "block";
            document.getElementById("AmazonSallerOnline").style.display = "none";
            document.getElementById("Woocommerce").style.display = "none";
            document.getElementById("eBayOnline").style.display = "none";
        }else if(selectedStoreType == 11){
            document.getElementById("magentoData").style.display = "none";
            document.getElementById("AmazonSallerOnline").style.display = "none";
            document.getElementById("Woocommerce").style.display = "none";
            document.getElementById("eBayOnline").style.display = "none";
        }else if(selectedStoreType == 4){
            document.getElementById("AmazonSallerOnline").style.display = "block";
            document.getElementById("magentoData").style.display = "none";
            document.getElementById("Woocommerce").style.display = "none";
            document.getElementById("eBayOnline").style.display = "none";
            
        }else if(selectedStoreType == 15){
            document.getElementById("Woocommerce").style.display = "block";
            document.getElementById("AmazonSallerOnline").style.display = "none";
            document.getElementById("magentoData").style.display = "none";
            document.getElementById("eBayOnline").style.display = "none";
        }else if(selectedStoreType == 3){
            document.getElementById("eBayOnline").style.display = "block";
            document.getElementById("Woocommerce").style.display = "none";
            document.getElementById("AmazonSallerOnline").style.display = "none";
            document.getElementById("magentoData").style.display = "none";
        }else{
            document.getElementById("magentoData").style.display = "none";
            document.getElementById("AmazonSallerOnline").style.display = "none";
            document.getElementById("Woocommerce").style.display = "none";
            document.getElementById("eBayOnline").style.display = "none";
        }
    }
    function getStoreListByStoreTypeId(storeTypeId) {
        
    $.ajax({
        type: "POST",
        url: "eSalesAjax?tabid=StoreListByStoreTypeID",
        data: { StoreTypeId: storeTypeId },
        dataType: "json"
    }).done(function (data) {
        console.log(data);
        $('#custTableBody').html('');
        var details = "<input type='hidden' name='listSize' id='lSize' value='" + data.length + "'>";

        for (var i = 0; i < data.length; i++) {
            var objList = data[i];
            details += "<tr id='" + i + "$$' " +
                "data-store-id='" + objList.storeId + "' " +
                "data-store-name='" + objList.storeName + "' " +
                "data-store-type-id='" + objList.storeTypeId + "' " +
                "data-abbreviation='" + objList.abbreviation + "' " +
                "data-storeTypeName='" + objList.storeTypeName + "' " +
                "data-nickName='" + objList.nickName + "' " +
                "data-currentStore='" + objList.currentStore + "' " +
                "data-isDefault='" + objList.isDefault + "' " +
                "data-isActive='" + objList.isActive + "' " +
                "data-fromDate='" + objList.fromDate + "' " +
                "data-toDate='" + objList.toDate + "' " +
                "data-packingReturnPolicy='" + objList.packingReturnPolicy + "' " +
                "data-magentoLoginId='" + objList.magentoLoginId + "' " +
                "data-magentoPassword='" + objList.magentoPassword + "' " +
                "data-dbUrl='" + objList.dbUrl + "' " +
                "data-companyName='" + objList.companyName + "' " +
                "data-firstName='" + objList.firstName + "' " +
                "data-lastName='" + objList.lastName + "' " +
                "data-address1='" + objList.address1 + "' " +
                "data-address2='" + objList.address2 + "' " +
                "data-city='" + objList.city + "' " +
                "data-state='" + objList.state + "' " +
                "data-country='" + objList.country + "' " +
                "data-zipcode='" + objList.zipcode + "' " +
                "data-phoneNumber='" + objList.phoneNumber + "' " +
                "data-email='" + objList.email + "' " +
                
                "data-WoocommerceBaseUrl='" + objList.woocommerceBaseUrl + "' " +
                "data-WoocommerceConsumerKey='" + objList.woocommerceConsumerKey + "' " +
                "data-WoocommerceConsumerSecret='" + objList.woocommerceConsumerSecret + "' " +
                
                "data-amazonAccesKey='" + objList.amazonAccesKey + "' " +
                "data-amazonSecretKey='" + objList.amazonSecretKey + "' " +
                "data-amazonMarketPlaceId='" + objList.amazonMarketPlaceId + "' " +
                "data-amazonMerchantId='" + objList.amazonMerchantId + "' " +

                "data-DeveloperId='" + objList.eBayDeveloperId + "' " +
                "data-ApplicationId='" + objList.eBayApplicationId + "' " +
                "data-Certificate='" + objList.eBayCertificate + "' " +
                "data-EPSServerURL='" + objList.eBayEpsserverUrl + "' " +
                "data-APIServerURL='" + objList.eBayApiserverUrl + "' " +
                "data-PasteYourTokenText='" + objList.eBayToken + "' " +
                "style='cursor:pointer;'>" +
                "<td colspan='2' style='font-size:12px;'>" + objList.storeName + "</td>" +
                "</tr>";
        }

        $('#custTableBody').html(details);
    });
}
</script>
<script>
    const logoFileInput = document.getElementById('logoFileInput');
    const logoImage = document.getElementById('logoImage');
    
    logoFileInput.addEventListener('change', function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                logoImage.src = e.target.result;
                logoImage.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });

    function removeLogo() {
        logoImage.src = '';
        logoImage.style.display = 'none';
        logoFileInput.value = '';
    }
    function addNewTimeDialog(){
        var storeId = document.getElementById("store-id").value;
        if(storeId == 0){
            alert("Please create store first!");
            return;
        }
        $("#addNewTimeDialog").dialog({
            resizable: false,
            height: 250,
            width: 350,
            modal: true,
            position: {
                my: "center",
                at: "center",
            },
            buttons: {
                "Ok": function () {
                    const hour = document.getElementById("hour").value.padStart(2, '0');
                    const min = document.getElementById("min").value.padStart(2, '0');
                    const ampm = document.querySelector("#addNewTimeDialog select").value;
                    const time = hour + ":" + min + " " + ampm;
                    // Check for duplicate
                    const ScheduleTimes = document.getElementById("ScheduleTimes");
                    for (let i = 0; i < ScheduleTimes.options.length; i++) {
                        if (ScheduleTimes.options[i].text === time) {
                            $(this).dialog("close");
                            duplicateTimeDialog();
                            return;
                        }
                    }
                    storeNewTime(hour, min, ampm);
                    $(this).dialog("close");
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }
    function storeNewTime(hour, min, ampm){
        var storeId = document.getElementById("store-id").value;
        if(storeId == 0){
            alert("Please create store first!");
            return;
        }
        var data = {
            "storeId" : storeId,
            "hour":hour,
            "min":min,
            "ampm":ampm,

        }
        var obj = JSON.stringify(data);
        console.log(obj);
        $.ajax({
			type: "POST",
			url: "eSalesAjax?tabid=addNewTimes",
			data: "data=" + obj,
			success: function (data) {
                alert("Success");
                getStoreScheduleTimes(storeId);
			}
			,
			error: function (data) {
				//return ();
			}
		});

    }
    function editAddressDialog(){
        $("#editAddressDialog").dialog({
            resizable: false,
            height: 650,
            width: 560,
            modal: true,
            title: "Edit Address",
            position: {
                my: "center",
                at: "center",
            },
            buttons: [
                {
                    text: "Ok",
                    class: "btn btn-success",
                    click: function () {
                        // Store Address
                        var companyName = document.getElementById("companyName").value;
                        var firstName = document.getElementById("firstName").value;
                        var lastName = document.getElementById("lastName").value;
                        var address1 = document.getElementById("address1").value;
                        var address2 = document.getElementById("address2").value;
                        var zipcode = document.getElementById("zipcode").value;
                        
                        var selectElementCity = document.getElementById("cityID");
                        var selectedOptionCity = selectElementCity.options[selectElementCity.selectedIndex];
                        var cityID = selectElementCity.value;
                        var cityName = selectedOptionCity.getAttribute('data-cityname');


                        var selectElementState = document.getElementById("stateID");
                        var selectedOptionState = selectElementState.options[selectElementState.selectedIndex];
                        var stateID = selectElementState.value;
                        var stateName = selectedOptionState.getAttribute('data-statename');


                        var selectElementCountry = document.getElementById("countryID");
                        var selectedOptionCountry = selectElementCountry.options[selectElementCountry.selectedIndex];
                        var countryID = selectElementCountry.value;
                        var countryName = selectedOptionCountry.getAttribute('data-countryname');

                        var telephone = document.getElementById("telephone").value;

                        var companyName = companyName || "";
                        var firstName = firstName || "";
                        var lastName = lastName || "";
                        var address1 = address1 || "";
                        var address2 = address2 || "";
                        var cityName = cityName || "";
                        var stateName = stateName || "";
                        var zipcode = zipcode || "";
                        var countryName = countryName || "";
                        var telephone = telephone || "";

                        var formattedAddress = 
                            (companyName ? companyName + "\n" : "") +
                            (firstName || lastName ? (firstName + " " + lastName).trim() + "\n" : "") +
                            (address1 ? address1 + "\n" : "") +
                            (address2 ? address2 + "\n" : "") +
                            (cityName || stateName || zipcode ? (cityName + (cityName && stateName ? ", " : "") + stateName + (zipcode ? " " + zipcode : "")).trim() + "\n" : "") +
                            (countryName ? countryName + "\n" : "") +
                            (telephone ? "Tel: " + telephone : "");

                        document.getElementById("store-information").value = formattedAddress;
                        console.log(formattedAddress);

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
    function removeSelectedTime() {
        const ScheduleTimes = document.getElementById("ScheduleTimes");
        const selectedValue = ScheduleTimes.value;
        if (selectedValue) {
            deleteScheduleTime(selectedValue);
            for (let i = 0; i < ScheduleTimes.options.length; i++) {
                if (ScheduleTimes.options[i].value === selectedValue) {
                    ScheduleTimes.remove(i);
                    // Optionally remove from scheduleTimesArray too:
                    const indexInArray = scheduleTimesArray.indexOf(selectedValue);
                    if (indexInArray !== -1) {
                        scheduleTimesArray.splice(indexInArray, 1);
                    }
                    return;
                }
            }
        } else {
            alert("Please select a time to remove.");
        }
    }

    function deleteScheduleTime(id){
        $.ajax({
			type: "POST",
			url: "eSalesAjax?tabid=deleteScheduleTimes",
			data: {scheduleId: id},
			success: function (data) {
				// alert("Deleted")
			}
			,
			error: function (data) {
				//return ();
			}
		});
    }
    function duplicateTimeDialog(){
        $("#duplicateTimeDialog").dialog({
            resizable: false,
            height: 200,
            width: 400,
            modal: true,
            position: {
                my: "center",
                at: "center",
            },
            buttons: {
                "Ok": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;  
    }
    function saveStoreDetails() {
        var storeId = document.getElementById("store-id").value;
        var selectedStoreType = document.getElementById("storeType").value;
        if(selectedStoreType == ""){
            alert("Store can not be inserted in selected store type");
            return;
            // alert("Store can not be inserted in selected store type");
        }
        // Store Address
        var companyName = document.getElementById("companyName").value;
        var firstName = document.getElementById("firstName").value;
        var lastName = document.getElementById("lastName").value;
        var address1 = document.getElementById("address1").value;
        var address2 = document.getElementById("address2").value;
        var zipcode = document.getElementById("zipcode").value;
        
        var selectElementCity = document.getElementById("cityID");
        var selectedOptionCity = selectElementCity.options[selectElementCity.selectedIndex];
        var cityID = selectElementCity.value;
        var cityName = selectedOptionCity.getAttribute('data-cityname');


        var selectElementState = document.getElementById("stateID");
        var selectedOptionState = selectElementState.options[selectElementState.selectedIndex];
        var stateID = selectElementState.value;
        var stateName = selectedOptionState.getAttribute('data-statename');


        var selectElementCountry = document.getElementById("countryID");
        var selectedOptionCountry = selectElementCountry.options[selectElementCountry.selectedIndex];
        var countryID = selectElementCountry.value;
        var countryName = selectedOptionCountry.getAttribute('data-countryname');

        var telephone = document.getElementById("telephone").value;

        var storeName = document.getElementById("store-name").value;
		var abbreviation = document.getElementById("abbreviation").value;
		var defaultStore = document.getElementById("default-store").checked;
		var fromDate = document.getElementById("fromDate").value;
		var toDate = document.getElementById("toDate").value;
		var active = document.getElementById("active").checked;
		var storeInformation = document.getElementById("store-information").value;
		var logoImage = document.getElementById("logoImage").value;

        if(defaultStore){
            if(!active){
                alert("Default store must be active");
                return;
            }
        }
        if(storeName == ""){
            alert("Please enter store name");
            return;
        }
        if(toDate == ""){
            alert("Please select a valid to date range");
            return;
        }
        var data = {
            "storeId" : storeId,
            "storeTypeId":selectedStoreType,
            "storeName": storeName,
            "abbreviation": abbreviation,
            "defaultStore": defaultStore,
            "fromDate": fromDate,
            "toDate": toDate,
            "active": active,
            "storeInformation": storeInformation,
            "logoImage": logoImage,
            "ScheduleTimes": scheduleTimesArray,
            "companyName": companyName || "",
            "firstName": firstName || "",
            "lastName": lastName || "",
            "address1": address1 || "",
            "address2": address2 || "",
            "zipcode": zipcode || "",
            "cityID": cityName || "",
            "stateID": stateName || "",
            "countryID": countryName || "",
            "telephone": telephone || "",
        };

        if (selectedStoreType == 14) {
            // Magento fields
            data.storeEmail = document.getElementById("store-email-md").value;
            data.returnPolicy = document.getElementById("return-policy-md").value;
            data.APIUser = document.getElementById("APIUser").value;
            data.APIKey = document.getElementById("APIKey").value;
            data.SOAPURL = document.getElementById("SOAPURL").value;

        } else if (selectedStoreType == 11) {
            // Other E-Sales field
            data.importTemplate = document.getElementById("importTemplate").value;
        } else if (selectedStoreType == 15) {
            // Woocommerce
            data.storeEmail = document.getElementById("store-email-w").value;
            data.returnPolicy = document.getElementById("return-policy-w").value;

            data.BaseUrl = document.getElementById("BaseUrl").value;
            data.ConsumerKey = document.getElementById("ConsumerKey").value;
            data.ConsumerSecret = document.getElementById("ConsumerSecret").value;
        } else if (selectedStoreType == 4) {
            // Amazon Seller online
            data.storeEmail = document.getElementById("store-email-asa").value;
            data.returnPolicy = document.getElementById("return-policy-asa").value;

            data.AccessKey = document.getElementById("AccessKey").value;
            data.SecretKey = document.getElementById("SecretKey").value;
            data.MerchantId = document.getElementById("MerchantId").value;
            data.MarketPlaceId = document.getElementById("MarketPlaceId").value;
        } else if (selectedStoreType == 3) {
            // eBay online
            data.storeEmail = document.getElementById("store-email-ebay").value;
            data.returnPolicy = document.getElementById("return-policy-ebay").value;

            data.DeveloperId = document.getElementById("DeveloperId").value;
            data.ApplicationId = document.getElementById("ApplicationId").value;
            data.Certificate = document.getElementById("Certificate").value;
            data.EPSServerURL = document.getElementById("EPSServerURL").value;
            data.APIServerURL = document.getElementById("APIServerURL").value;
            data.PasteYourTokenText = document.getElementById("PasteYourTokenText").value;
        } 


        var obj = JSON.stringify(data);
        console.log(obj);
        $.ajax({
			type: "POST",
			url: "eSalesAjax?tabid=addNewStore",
			data: "data=" + obj,
			success: function (data) {
				showSuccessDialog();
			}
			,
			error: function (data) {
				//return ();
			}
		});
    }
	function showSuccessDialog() {
		event.preventDefault();
		$("#showSuccessDialog").dialog({
			resizable: false,
			height: 200,
			width: 350,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
					window.location.reload();
				}
			}
		});
		return false;
	}
    function deleteStore(){
        var isDefault = document.getElementById("selected-store-is-default").value;
        if(isDefault == "1"){
            alert("You can't delete default store");
        }else{
            deleteStoreDialog();
        }
    }
    function deleteStoreDialog(){
        $("#deleteStoreDialog").dialog({
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
                    var storeId = document.getElementById("store-id").value;
                    $.ajax({
                    type : "POST",
                    url: "eSalesAjax?tabid=deleteStore",
                    data :"storeId=" + storeId,
                    success : function(data) {
                        window.location.reload();
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

</script>
<div id="deleteStoreDialog" style="display:none;">
	<p><spring:message code="BzComposer.eSalesAccountManager.button.deleteSelectedStore"/></p>
</div>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.saveData"/></p>
</div>
<div id="duplicateTimeDialog" style="display:none;text-align: center;">
    <p>This time is already scheduled for inventory upload feature.</p>
</div>
<div id="addNewTimeDialog" style="display:none;text-align: center;">
	<div>
        <span>Select time</span>
    </div>
    <div style="padding-top: 20px;">
        <span>Time: </span>
        <input type="number" id="hour" value="1" max="12" min="1" style="width: 50px;"/>
        <input type="number" id="min" value="0" max="60" style="width: 50px;"/>
        <select>
            <option>AM</option>
            <option>PM</option>
        </select>

    </div>
</div>
<div id="editAddressDialog" style="display:none;text-align: center;">
    <div class="row pt-4">
        <div class="col-sm-4 text-start">
            <label>Company Name</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="companyName"/>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>First Name</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="firstName"/>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>Last Name</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="lastName"/>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>Address1</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="address1"/>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>Address2</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="address2"/>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>Zipcode</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="zipcode" 
            onfocusout="loadAddressDetailsByZipcode(this.value, 1)" 
            onkeypress="return numbersonly(event,this.value)"/>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>City</label>
        </div>
        <div class="col-sm-8">
            <select path="city" id="cityID" style="width:200px;">
                <option value="0">
                    <spring:message code="BzComposer.register.selectcity"/></option>
                <c:forEach items="${cityList}" var="currObject">
                    <option value="${currObject.cityId}" data-cityname="${currObject.cityName}">${currObject.cityName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>State</label>
        </div>
        <div class="col-sm-8">
            <select path="state" id="stateID" onchange="loadCitiesByStateID(this.value, 1);" style="width:200px;">
                <option value="0"><spring:message code="BzComposer.register.selectstate"/></option>
                <c:forEach items="${stateList}" var="currObject">
                    <option value="${currObject.stateId}" data-statename="${currObject.state}">${currObject.state}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>Country</label>
        </div>
        <div class="col-sm-8">
            <select path="country" id="countryID"
                            onchange="loadStatesByCountryID(this.value, 1);"
                            style="width:200px">
                <option value="0"><spring:message
                        code="BzComposer.register.selectcounry"/></option>
                <c:forEach items="${countryList}" var="currObject">
                    <option data-code="${currObject.phoneCode}"
                                    value="${currObject.countryId}" data-countryname="${currObject.countryName}">${currObject.countryName}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="row pt-3">
        <div class="col-sm-4 text-start">
            <label>Telephone</label>
        </div>
        <div class="col-sm-8">
            <input type="text" id="telephone"/>
        </div>
    </div>
</div>
</html>