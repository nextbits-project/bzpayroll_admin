<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <jsp:include page="/WEB-INF/jsp/include/headlogo.jsp" />
    <jsp:include page="/WEB-INF/jsp/include/header.jsp" />
    <jsp:include page="/WEB-INF/jsp/include/menu.jsp" />
    <title>
        <spring:message code="BzComposer.generaltitle" />
    </title>
    <script type="text/javascript"
        src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
    <link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
        rel="stylesheet" media="screen" />
    <script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
        rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <style>
        .custom-sidebar {
            width: 150px;
            background: #f1f6fb;
            padding: 10px;
        }

        .custom-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .custom-menu li {
            margin-bottom: 8px;
            text-align: center;
        }

        .custom-menu li a {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            background: #eaf4fd;
            padding: 12px 5px;
            border-radius: 8px;
            color: #333;
            transition: background 0.3s;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
        }

        .custom-menu li a i {
            font-size: 30px;
            color: #06abc4;
            margin-bottom: 6px;
        }

        .custom-menu li a span {
            font-size: 14px;
            font-weight: 500;
        }

        .custom-menu li a:hover {
            background: #d7ecfc;
        }

        .custom-menu li.active a {
            background: #ffedb4;
            font-weight: bold;
            color: #333;
        }
    </style>
    <style>
        /* Data Manager Select Box Custom Styles */
        select[id^="dm-list-"]:focus,
        select[id^="dm-list-"]:active {
            background-color: #A0A0A0 !important;
            border-color: #66AFE9 !important;
            outline: none !important;
            box-shadow: 0 0 5px rgba(102, 175, 233, 1) !important;
        }

        select[id^="dm-list-"] option:checked {
            /* linear-gradient overrides some native OS dropdown drawing logic to force background color on options */
            background: linear-gradient(#DBC0DB, #DBC0DB) !important;
            background-color: #DBC0DB !important;
            color: #000 !important;
        }

        table th,
        table td {
            font-size: 14px !important;
        }

        .settings-page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            margin: 30px 0px 4px 0px;
            padding: 0;
        }

        .settings-page-title {
            font-size: 1.1em;
            font-weight: normal;
            color: #838383;
        }

        .settings-page-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 8px;
        }

        .settings-page-actions .formbutton[disabled] {
            opacity: 0.5;
            cursor: not-allowed;
        }
    </style>
    <style>
        .sms-template-wrapper {
            background: #f5f5f5;
            padding: 15px;
            border-radius: 4px;
        }
        .sms-template-sidebar {
            background: #fff;
            border: 1px solid #cfcfcf;
            border-radius: 4px;
            padding: 15px;
            width: 280px;
            min-height: 500px;
        }
        .sms-template-sidebar h4 {
            margin: 0 0 15px 0;
            font-size: 14px;
            font-weight: 600;
            color: #333;
        }
        .sms-action-links {
            margin-bottom: 15px;
        }
        .sms-action-links a {
            display: block;
            font-size: 12px;
            color: #2196F3;
            text-decoration: none;
            margin-bottom: 8px;
            padding: 5px 0;
        }
        .sms-action-links a:hover {
            text-decoration: underline;
        }
        .sms-template-list-group {
            list-style: none;
            padding: 0;
            margin: 0;
            max-height: 400px;
            overflow-y: auto;
        }
        .sms-template-list-item {
            padding: 10px 12px;
            border: 1px solid #e0e0e0;
            border-bottom: none;
            cursor: pointer;
            background: #fff;
            font-size: 12px;
            color: #333;
        }
        .sms-template-list-item:first-child {
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }
        .sms-template-list-item:last-child {
            border-bottom: 1px solid #e0e0e0;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
        }
        .sms-template-list-item:hover {
            background: #e9ecef;
        }
        .sms-template-list-item.active {
            background: #fff !important;
            color: #000 !important;
            font-weight: 500;
            border-left: 3px solid #2196F3;
        }
        .sms-template-form-card {
            background: #fff;
            border: 1px solid #cfcfcf;
            border-radius: 4px;
            overflow: hidden;
        }
        .sms-card-header {
            background: #2196F3;
            color: #fff;
            padding: 12px 15px;
            font-size: 14px;
            font-weight: 600;
        }
        .sms-template-form-group {
            padding: 20px;
        }
        .sms-form-label {
            display: block;
            font-size: 12px;
            font-weight: 500;
            color: #333;
            margin-bottom: 6px;
        }
        .sms-form-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 12px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }
        .sms-form-textarea {
            width: 100%;
            min-height: 200px;
            padding: 8px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 12px;
            font-family: Arial, sans-serif;
            resize: vertical;
            box-sizing: border-box;
        }
        .sms-placeholder-input-group {
            margin-bottom: 15px;
        }
        .sms-placeholder-label {
            display: block;
            font-size: 12px;
            font-weight: 500;
            color: #555;
            margin-bottom: 5px;
        }
        .sms-placeholder-input {
            width: 100%;
            padding: 6px;
            border: 1px solid #d0d0d0;
            border-radius: 4px;
            font-size: 12px;
        }
    </style>
    <!-- Email Template Styles -->
    <style>
    .email-template-wrapper {
        background: #f8f8f8;
        padding: 15px;
        border-radius: 4px;
    }
    .template-sidebar {
        background: #fff;
        border: 1px solid #cfcfcf;
        border-radius: 4px;
        padding: 15px;
        max-height: 70vh;
        overflow-y: auto;
        width: 280px;
    }
    .template-sidebar h4 {
        margin: 0 0 12px 0;
        font-size: 14px;
        font-weight: 600;
        color: #333;
        border-bottom: 1px solid #cfcfcf;
        padding-bottom: 8px;
    }
    .template-sidebar .action-links {
        margin-bottom: 15px;
    }
    .template-sidebar .action-links a {
        font-size: 12px;
        color: #2196F3;
        text-decoration: none;
        margin-right: 12px;
        display: inline-block;
    }
    .template-sidebar .action-links a:hover {
        text-decoration: underline;
    }
    .template-list-group {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .template-list-item {
        padding: 10px 12px;
        border: 1px solid #e0e0e0;
        border-bottom: none;
        background: #f8f9fa;
        cursor: pointer;
        font-size: 12px;
        color: #333;
    }
    .template-list-item:first-child {
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
    }
    .template-list-item:last-child {
        border-bottom: 1px solid #e0e0e0;
        border-bottom-left-radius: 4px;
        border-bottom-right-radius: 4px;
    }
    .template-list-item:hover {
        background: #e9ecef;
    }
    .template-list-item.active {
        background: #fff !important;
        color: #000 !important;
        font-weight: 500;
        border-left: 3px solid #2196F3;
    }
    .template-form-card {
        background: #fff;
        border: 1px solid #cfcfcf;
        border-radius: 4px;
        padding: 20px;
    }
    .template-form-card .card-header {
        font-size: 14px;
        font-weight: 600;
        color: #333;
        border-bottom: 1px solid #cfcfcf;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    .template-form-group {
        margin-bottom: 15px;
    }
    .template-form-group label {
        display: block;
        font-size: 12px;
        font-weight: normal;
        color: #333;
        margin-bottom: 5px;
    }
    .template-form-group input[type="text"],
    .template-form-group input[type="email"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #cfcfcf;
        border-radius: 3px;
        font-size: 12px;
        box-sizing: border-box;
    }
    .template-form-group input:focus {
        outline: none;
        border-color: #2196F3;
    }
    .template-body-editor {
        min-height: 200px;
        max-height: 40vh;
        white-space: pre-wrap;
        background: #fff;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        overflow-y: auto;
        font-size: 12px;
        font-family: Arial, sans-serif;
    }
    .template-body-editor:focus {
        outline: none;
        border-color: #2196F3;
    }
    .placeholder-input-group {
        margin-bottom: 10px;
    }
    .placeholder-input-group label {
        font-size: 12px;
        margin-bottom: 5px;
    }
    .placeholder-input-group input {
        width: 100%;
        padding: 6px;
        border: 1px solid #cfcfcf;
        border-radius: 3px;
        font-size: 12px;
    }
    .template-action-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 20px;
        padding-top: 15px;
        border-top: 1px solid #e0e0e0;
    }
    </style>
    <style>
        .usersTblNew {
            vertical-align: top;
            width: 100%;
            border: 1px solid rgb(207, 207, 207);
        }

        .usersTblNew thead tr td {
            padding: 5px 0px 5px 5px;
            font-size: 12px;
        }

        .usersTblNew tbody tr td {
            padding: 5px 0px 5px 5px;
            font-size: 12px;
        }
        .draft td {
            color: #ffffff;
            background: rgba(50, 58, 60, 0.63);
        }
    </style>
</head>
<script type="text/javascript">
    function showLocale() {
        var lang = document.getElementById("locale").value;
        var locale = "<%= request.getAttribute("selectedLocale")%>";

        if (lang == "" && locale != "") {
            $('select[id="locale"]').find('option[value="' + locale + '"]').attr("selected", true);
            return showLanguageDialog();
        } else {
            window.location = "./changeLocale?lang=" + lang;
        }
    }
    function showLanguageDialog() {
        event.preventDefault();
        $("#showLanguageDialog").dialog({
            resizable: false,
            height: 200,
            width: 400,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }

    $(document).ready(function () {

        // Top-level sections now controlled by sidebar ?tab= URL param
        // $("#tabs").tabs(); -- removed, sections shown by JSP scriptlet

        var isSOBChecked = "<%= request.getAttribute("isSOBChecked")%>";
        var isISBChecked = "<%= request.getAttribute("isISBChecked")%>";
        var isIRBChecked = "<%= request.getAttribute("isIRBChecked")%>";
        var isPOBChecked = "<%= request.getAttribute("isPOBChecked")%>";
        var isSelectedWeightID = "<%= request.getAttribute("isSelectedWeightID")%>";

        $('select[id="weightID"]').find('option[value="' + isSelectedWeightID + '"]').attr("selected", true);

        $('#salesOrderBoard').change(function () {
            var isChecked = isSOBChecked;
            if ($(this).prop("checked") == true) {
                $("#salesOrderBoard").attr('checked', true);
                isChecked = "on";
            } else if ($(this).prop("checked") == false) {
                $("#salesOrderBoard").attr('checked', false);
                isChecked = "off";
            } else {
                $("#salesOrderBoard").attr('checked', isChecked);
            }
            document.configurationForm.salesOrderBoard.value = isChecked;
            $("#salesOrderBoard").val(isChecked);
        });
        $('#itemReceivedBoard').change(function () {

            var isChecked = isIRBChecked;
            if ($(this).prop("checked") == true) {
                $("#itemReceivedBoard").attr('checked', true);
                isChecked = "on";
            } else if ($(this).prop("checked") == false) {
                $("#itemReceivedBoard").attr('checked', false);
                isChecked = "off";
            } else {
                $("#itemReceivedBoard").attr('checked', isChecked);
            }
            document.configurationForm.itemReceivedBoard.value = isChecked;
            $("#itemReceivedBoard").val(isChecked);
        });
        $('#poboard').change(function () {
            var isChecked = isPOBChecked;
            if ($(this).prop("checked") == true) {
                $("#poboard").attr('checked', true);
                isChecked = "on";
            } else if ($(this).prop("checked") == false) {
                $("#poboard").attr('checked', false);
                isChecked = "off";
            } else {
                $("#poboard").attr('checked', isChecked);
            }
            document.configurationForm.poboard.value = isChecked;
            $("#poboard").val(isChecked);
        });
        $('#itemShippedBoard').change(function () {
            var isChecked = isISBChecked;

            if ($(this).prop("checked") == true) {
                $("#itemShippedBoard").attr('checked', true);
                isChecked = "on";
            } else if ($(this).prop("checked") == false) {
                $("#itemShippedBoard").attr('checked', false);
                isChecked = "off";
            } else {
                $("#itemShippedBoard").attr('checked', isChecked);
            }
            document.configurationForm.itemShippedBoard.value = isChecked;
            $("#itemShippedBoard").val(isChecked);
        });

        getECustomFieldList();
    });
    function TestConnection() {
        var authType = 'false';
        var host = document.configurationForm.mailServer.value;
        var userEmail = document.configurationForm.mailUserName.value;
        var password = document.configurationForm.mailPassword.value;
        if (document.configurationForm.mailAuth.checked) {
            if (userEmail.length < 5 || !userEmail.includes('@')) {
                alert("<spring:message code='BzComposer.configuration.invalidEmail' />");
                return;
            } else if (password.length < 3) {
                alert("<spring:message code='BzComposer.configuration.invalidPassword' />");
                return;
            }
            authType = 'true';
        }
        oEmail = c(CheckEmailConnection);
        oGET(oEmail, 'include/testMailServerConnection.jsp?HostName=' + host + '&authType=' + authType + '&userEmail=' + userEmail + '&password=' + password);
    }

    var funsequence = 0;
    var _1 = navigator.userAgent.toLowerCase();
    var ___ = (_1.indexOf("msie") != -1);
    var ___5 = (_1.indexOf("msie 5") != -1);
    var _io = (_1.indexOf("opera") != -1);
    var _im = (_1.indexOf("mac") != -1);
    var ____gi = (_1.indexOf("gecko") != -1);
    var i____s = (_1.indexOf("safari") != -1);
    var o = null;
    var o22 = null;
    var o33 = null;
    var oEmail = null;
    var oT = null;
    var nm = "";
    var r = null;

    function c(r) {

        if (___) {
            var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
            try {
                o = new ActiveXObject(t);
                o.onreadystatechange = r;
            } catch (ex) {
                alert("You need to enable active scripting and activeX ts.." + ex);
            }
        } else {
            o = new XMLHttpRequest();
            o.onload = r;
            o.onerror = r;
        }
        return o;
    }
    function oGET(oo, url) {
        try {
            pleaseWaitDialog();
            oo.open("GET", url, true);
            oo.send(null);
        } catch (ex) {
        }
    }
    function CheckEmailConnection() {
        $('#pleaseWaitDialog').dialog("close");
        if (oEmail.readyState != 4 || oEmail.status != 200) {
            return;
        }
        response = parseInt(trim(oEmail.responseText));
        if (response == 1) {
            return serverConnectedSeccessDialog();
            document.configurationForm.mailAuth.disabled = false;
            EnableDisableFields2();
        } else {
            return serverConnectedErrorDialog();
            document.configurationForm.mailAuth.disabled = true;
            EnableDisableFields2();
        }
    }

    function EnableDisableFields2() {
        if (document.configurationForm.mailAuth.checked == true) {
            document.configurationForm.mailUserName.disabled = false;
            document.configurationForm.mailPassword.disabled = false;
        } else {
            document.configurationForm.mailUserName.disabled = true;
            document.configurationForm.mailPassword.disabled = true;
        }
    }
    function trim(inputString) {
        // Removes the spaces  return from the passed string.
        var retValue = inputString;
        var ch = retValue.substring(0, 1);
        while (ch == "\n" || ch == "\r" || ch == " " || ch == "\t") {
            retValue = retValue.substring(1, retValue.length);
            ch = retValue.substring(0, 1);
        }
        return retValue;
    }
    function serverConnectedErrorDialog() {
        event.preventDefault();
        $("#serverConnectedErrorDialog").dialog({
            resizable: false,
            height: 200,
            width: 350,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }
    function serverConnectedSeccessDialog() {
        event.preventDefault();
        $("#serverConnectedSeccessDialog").dialog({
            resizable: false,
            height: 200,
            width: 350,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }
    function pleaseWaitDialog() {
        event.preventDefault();
        $("#pleaseWaitDialog").dialog({
            resizable: false,
            height: 200,
            width: 350,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }
</script>

<body onload="init();">
    <form:form name="configurationForm" enctype="MULTIPART/FORM-DATA" method="post"
        modelAttribute="configDto">
        <div id="ddcolortabsline">&nbsp;</div>
        <div id="cos">
            <div class="statusquo ok">
                <div id="hoja">
                    <div id="blanquito">
                        <div id="padding">
                            <div class="settings-page-header">
                                <span class="settings-page-title">SETTINGS</span>
                                <div class="settings-page-actions">
                                    <input class="formbutton" type="button"
                                        value="<spring:message code='BzComposer.global.save'/>"
                                        onclick="saveData()">
                                    <input class="formbutton" type="button"
                                        value="<spring:message code='BzComposer.global.cancel'/>"
                                        onclick="handleGeneralTopCancel()">
                                </div>
                            </div>
                            <div>
                                <div>
                                    <c:if test="${not empty Labels}">
                                        <input type="hidden" name="lsize" id="lblsize"
                                            value='${Labels.size()}' />
                                        <c:forEach items="${Labels}" var="lbl" varStatus="loop">
                                            <input type="hidden" id='${loop.index}lid'
                                                name='${loop.index}lidname' value='${lbl.value}' />
                                            <input type="hidden" id='${loop.index}lname'
                                                name='${loop.index}lnm' value='${lbl.label}' />
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div id="table-negotiations"
                                    style="padding: 0; border: 1px solid #ccc; margin-top: 15px;">
                                    <table cellspacing="0"
                                        style="border: 0; padding: 0; width: 100%;overflow-y:scroll;"
                                        class="">
                                        <tr>
                                            <td id="leftMenu"
                                                style="position: relative; width: 165px; vertical-align: top;">
                                                <div
                                                    style="display: flex; justify-content: flex-start; align-items: flex-start; width: 165px;">
                                                    <table>
                                                        <tr>
                                                            <td style="vertical-align: top;">
                                                                <div>
                                                                    <jsp:include
                                                                        page="menuPage.jsp" />
                                                                </div>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td valign="top">
                                                <!-- general page content starts -->
                                                <div id="general"
                                                    style="padding: 0; position: relative; left: 0;">
                                                    <div id="tabs" style="height: auto; border: none; padding: 0;">
                                                        <ul>
															<li style="font-size: 12px;">
                                                                <a href="#companyInformation">Company information</a>
                                                            </li>

															<li style="font-size: 12px;">
                                                                <a href="#GeneralSetting">General Settings</a>
															</li>

															<li style="font-size: 12px;">
                                                                <a href="#security">Security</a>
                                                            </li>
															<li style="font-size: 12px;">
                                                                <a href="#reminder">Reminders</a>
                                                            </li>
															<li style="font-size: 12px;">
                                                                <a href="#emailSetup">eMail Setup</a>
                                                            </li>
															<li style="font-size: 12px;">
                                                                <a href="#smsSetup">SMS Setup</a>
                                                            </li>
															<li style="font-size: 12px;">
                                                                <a href="#customization">Customization</a>
                                                            </li>
															<li style="font-size: 12px;">
                                                                <a href="#customfields">Custom Fields</a>
                                                            </li>

														</ul>
                                                        <div id="companyInformation">
                                                            <div id="content1" class="tabPage">
                                                                <form id="companyInformationId">
                                                                    <table
                                                                        class="table-notifications"
                                                                        width="80%" cellspacing="10"
                                                                        cellpadding="5"
                                                                        style="border-collapse: collapse; font-family: Arial, sans-serif;">
                                                                        <!-- Company Information -->
                                                                        <tr>
                                                                            <th colspan="2"
                                                                                style="background-color: #c9d0d4; text-align: left; padding: 8px;">
                                                                                Company Information
                                                                            </th>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Membership Level:
                                                                                <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <select
                                                                                    id="membershipLevel"
                                                                                    name="membershipLevel"
                                                                                    style="width:45%;">
                                                                                    <option
                                                                                        value="">--
                                                                                        Select
                                                                                        Membership
                                                                                        --</option>
                                                                                    <c:if
                                                                                        test="${not empty membershipPlans}">
                                                                                        <c:forEach
                                                                                            items="${membershipPlans}"
                                                                                            var="objList1">
                                                                                            <option
                                                                                                value="${objList1.planCode}">
                                                                                                ${objList1.planName}
                                                                                                ($${objList1.amount}/month)
                                                                                            </option>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </select>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Email Address: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td><input type="text"
                                                                                    name="emailAddress"
                                                                                    value="${companyInfo.emailAddress}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>First Name: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td><input type="text"
                                                                                    name="firstName"
                                                                                    value="${companyInfo.firstName}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Last Name: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td><input type="text"
                                                                                    name="lastName"
                                                                                    value="${companyInfo.lastName}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Job Position: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <select
                                                                                    name="jobPosition"
                                                                                    style="width:45%;">
                                                                                    <option
                                                                                        selected>
                                                                                        President
                                                                                    </option>
                                                                                    <option>Manager
                                                                                    </option>
                                                                                    <option>
                                                                                        Programmer
                                                                                    </option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td
                                                                                style="font-size: 12px;">
                                                                                <spring:message
                                                                                    code="BzComposer.language" />
                                                                            </td>
                                                                            <td><select
                                                                                    name="locale"
                                                                                    id="locale"
                                                                                    onchange="showLocale(this.value);"
                                                                                    style="width:45%;">
                                                                                    <option
                                                                                        value="en"
                                                                                        ${sessionScope.currentLocale=='en'
                                                                                        ?'selected':''}>
                                                                                        <spring:message
                                                                                            code="BzComposer.selectlanguage.english" />
                                                                                    </option>
                                                                                    <option
                                                                                        value="zh"
                                                                                        ${sessionScope.currentLocale=='zh'
                                                                                        ?'selected':''}>
                                                                                        <spring:message
                                                                                            code="BzComposer.selectlanguage.chinese" />
                                                                                    </option>
                                                                                    <option
                                                                                        value="es"
                                                                                        ${sessionScope.currentLocale=='es'
                                                                                        ?'selected':''}>
                                                                                        <spring:message
                                                                                            code="BzComposer.selectlanguage.spanish" />
                                                                                    </option>
                                                                                </select></td>
                                                                        </tr>

                                                                        <!-- About Company -->
                                                                        <tr>
                                                                            <th colspan="2"
                                                                                style="background-color: #c9d0d4; text-align: left; padding: 8px;">
                                                                                About Your Company
                                                                            </th>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Company Name: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td><input type="text"
                                                                                    name="companyName"
                                                                                    value="${companyInfo.companyName}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>DBA Name:</td>
                                                                            <td><input type="text"
                                                                                    name="dbaName"
                                                                                    value="${companyInfo.dbaName}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Business Type: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <select
                                                                                    name="businessType"
                                                                                    style="width:45%;">
                                                                                    <option
                                                                                        selected>
                                                                                        eSales
                                                                                    </option>
                                                                                    <option>
                                                                                        Contractor
                                                                                    </option>
                                                                                    <option>
                                                                                        Nonprofit
                                                                                    </option>
                                                                                    <option>Retail
                                                                                    </option>
                                                                                    <option>Service
                                                                                    </option>
                                                                                    <option>
                                                                                        Wholesale
                                                                                    </option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Address 1: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td><input type="text"
                                                                                    name="address1"
                                                                                    value="${companyInfo.address1}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Address 2:</td>
                                                                            <td><input type="text"
                                                                                    name="address2"
                                                                                    value="${companyInfo.address2}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Zip Code: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td><input type="text"
                                                                                    name="zipCode"
                                                                                    value="${companyInfo.zipCode}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>City: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <select
                                                                                    style="width:40%;"
                                                                                    name="city"
                                                                                    id="sellectDistrict"
                                                                                    class="form-select"
                                                                                    required>
                                                                                    <option
                                                                                        value="42865">
                                                                                        California
                                                                                        City
                                                                                    </option>

                                                                                </select>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>State: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <select name="state"
                                                                                    id="sellectState"
                                                                                    required>
                                                                                    <option
                                                                                        value="3924">
                                                                                        California
                                                                                    </option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Country: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <select
                                                                                    style="width:40%;"
                                                                                    id="sellectCountry"
                                                                                    name="country"
                                                                                    class="form-select"
                                                                                    required>
                                                                                    <option
                                                                                        value="231">
                                                                                        United
                                                                                        States
                                                                                    </option>
                                                                                    <c:forEach
                                                                                        var="bcpcountries"
                                                                                        items="${countries}">
                                                                                        <option
                                                                                            value="${bcpcountries.id}">
                                                                                            ${bcpcountries.name}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Phone: <span
                                                                                    style="color:red;">*</span>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text"
                                                                                    id="phone"
                                                                                    name="phone"
                                                                                    value="${companyInfo.phone}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Mobile Number:</td>
                                                                            <td>
                                                                                <input type="text"
                                                                                    id="mobileNumber"
                                                                                    name="mobileNumber"
                                                                                    value="${companyInfo.mobileNumber}"
                                                                                    style="width:45%;">
                                                                                <label>
                                                                                    <input
                                                                                        type="checkbox"
                                                                                        id="sameAsPhone"
                                                                                        checked>
                                                                                    Same as the
                                                                                    Phone Number
                                                                                </label>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td>Fax:</td>
                                                                            <td><input type="text"
                                                                                    name="fax"
                                                                                    value="${companyInfo.fax}"
                                                                                    style="width:45%;">
                                                                            </td>
                                                                        </tr>



                                                                    </table>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div id="GeneralSetting">
															<div id="content1" class="tabPage">
																<table class="table-notifications" width="80%">
																	<tr>
																		<th colspan="2" align="left"
																			style="font-size: 12px; padding: 5px;">
                                                                            <spring:message code="BzComposer.configuration.generaltitle" /></th>
																	</tr>
																	<tr>
																		<td style="font-size: 12px;">
                                                                            <spring:message
																				code="BzComposer.configuration.currency" />
                                                                        </td>
																		<td style="font-size: 12px;">
                                                                            <form:select
																				path="currencyID" id="currencyID">
																				<form:option value="0">
																					<spring:message
																						code="BzComposer.configuration.select" />
																				</form:option>
																				<form:option value="1">
																					<spring:message
																						code="BzComposer.configuration.currency.baht" />
																				</form:option>
																				<form:option value="2">
																					<spring:message
																						code="BzComposer.configuration.currency.bolivar" />
																				</form:option>
																				<form:option value="3">
																					<spring:message
																						code="BzComposer.configuration.currency.boliviano" />
																				</form:option>
																				<form:option value="4">
																					<spring:message
																						code="BzComposer.configuration.currency.cedi" />
																				</form:option>
																				<form:option value="5">
																					<spring:message
																						code="BzComposer.configuration.currency.dirham" />
																				</form:option>
																				<form:option value="6">
																					<spring:message
																						code="BzComposer.configuration.currency.dinar" />
																				</form:option>
																				<form:option value="7" selected="selected">
																					<spring:message
																						code="BzComposer.configuration.currency.dollar" />
																				</form:option>
																				<form:option value="8">
																					<spring:message
																						code="BzComposer.configuration.currency.dong" />
																				</form:option>
																				<form:option value="9">
																					<spring:message
																						code="BzComposer.configuration.currency.euro" />
																				</form:option>
																				<form:option value="10">
																					<spring:message
																						code="BzComposer.configuration.currency.forint" />
																				</form:option>
																				<form:option value="11">
																					<spring:message
																						code="BzComposer.configuration.currency.franc" />
																				</form:option>
																				<form:option value="12">
																					<spring:message
																						code="BzComposer.configuration.currency.koruna" />
																				</form:option>
																				<form:option value="13">
																					<spring:message
																						code="BzComposer.configuration.currency.krona" />
																				</form:option>
																				<form:option value="14">
																					<spring:message
																						code="BzComposer.configuration.currency.krone" />
																				</form:option>
																				<form:option value="15">
																					<spring:message
																						code="BzComposer.configuration.currency.newshekel" />
																				</form:option>
																				<form:option value="16">
																					<spring:message
																						code="BzComposer.configuration.currency.nuevosol" />
																				</form:option>
																				<form:option value="17">
																					<spring:message
																						code="BzComposer.configuration.currency.peso" />
																				</form:option>
																				<form:option value="18">
																					<spring:message
																						code="BzComposer.configuration.currency.pound" />
																				</form:option>
																				<form:option value="19">
																					<spring:message
																						code="BzComposer.configuration.currency.pula" />
																				</form:option>
																				<form:option value="20">
																					<spring:message
																						code="BzComposer.configuration.currency.quetzal" />
																				</form:option>
																				<form:option value="21">
																					<spring:message
																						code="BzComposer.configuration.currency.rand" />
																				</form:option>
																				<form:option value="22">
																					<spring:message
																						code="BzComposer.configuration.currency.real" />
																				</form:option>
																				<form:option value="23">
																					<spring:message
																						code="BzComposer.configuration.currency.ringgit" />
																				</form:option>
																				<form:option value="24">
																					<spring:message
																						code="BzComposer.configuration.currency.riyal" />
																				</form:option>
																				<form:option value="25">
																					<spring:message
																						code="BzComposer.configuration.currency.riyali" />
																				</form:option>
																				<form:option value="26">
																					<spring:message
																						code="BzComposer.configuration.currency.rouble" />
																				</form:option>
																				<form:option value="27">
																					<spring:message
																						code="BzComposer.configuration.currency.rupee" />
																				</form:option>
																				<form:option value="28">
																					<spring:message
																						code="BzComposer.configuration.currency.rupiah" />
																				</form:option>
																				<form:option value="29">
																					<spring:message
																						code="BzComposer.configuration.currency.schilling" />
																				</form:option>
																				<form:option value="30">
																					<spring:message
																						code="BzComposer.configuration.currency.sucre" />
																				</form:option>
																				<form:option value="31">
																					<spring:message
																						code="BzComposer.configuration.currency.won" />
																				</form:option>
																				<form:option value="32">
																					<spring:message
																						code="BzComposer.configuration.currency.yen" />
																				</form:option>
																				<form:option value="33">
																					<spring:message
																						code="BzComposer.configuration.currency.yuan" />
																				</form:option>
																			</form:select>
                                                                        </td>
																	</tr>
																	<tr>
																		<td style="font-size: 12px;"><spring:message
																				code="BzComposer.configuration.weight" />
                                                                        </td>
																		<td style="font-size: 12px;">
                                                                            <select
																				name="weightID" style="font-size: 12px;"
																				id="weightID">
																				<c:if
																					test="${not empty configDto.listOfExistingWeights}">
																					<c:forEach
																						items="${configDto.listOfExistingWeights}"
																						var="objList1">
																						<option value="${objList1.weightID}">${objList1.weightName}</option>
																					</c:forEach>
																				</c:if>
																			</select>
                                                                        </td>
																	</tr>
																	<tr>
																		<td style="font-size: 12px;"><spring:message
																				code="BzComposer.language" />
                                                                        </td>
																		<td>
                                                                            <select name="locale" id="locale" onchange="showLocale(this.value);">
																				<option value="en"
																					${sessionScope.currentLocale=='en'?'selected':''}><spring:message
																						code="BzComposer.selectlanguage.english" /></option>
																				<option value="zh"
																					${sessionScope.currentLocale=='zh'?'selected':''}><spring:message
																						code="BzComposer.selectlanguage.chinese" /></option>
																				<option value="es"
																					${sessionScope.currentLocale=='es'?'selected':''}><spring:message
																						code="BzComposer.selectlanguage.spanish" /></option>
																		    </select>
                                                                        </td>
																	</tr>
																	<tr>
																		<th colspan="2" align="left"
																			style="font-size: 12px; padding: 5px;"><spring:message
																				code="BzComposer.configuration.addresslabel" />
                                                                        </th>
																	</tr>
																	<tr colspan="2">
																		<td style="font-size: 12px;"><spring:message
																				code="BzComposer.configuration.defaultlabel" /></td>
																		<td style="font-size: 12px;"><c:if
																				test="${not empty Labels}">
																				<select name="defaultLabelID"
																					onchange="SetLabelName(this.value);"
																					style="width:200" id="defaultLabelID">
																					<options items="${Labels}" itemValue="value"
																						itemLabel="label" />
																				</select>
																			</c:if>
                                                                        </td>
																	</tr>
																	<tr>
																		<td colspan="2" align="center"
																			style="font-size: 14px;">
																			<button type="button" class="formButton"
																				title='<spring:message code="BzComposer.configuration.setuplabeltooltip"/>'>
																				<spring:message
																					code="BzComposer.configuration.setuplabelbtn" />
																			</button>
																		</td>
																	</tr>
																	<tr>
																		<th colspan="2" align="left"
																			style="font-size: 12px; padding: 5px;"><spring:message
																				code="BzComposer.configuration.defaultdashboardsetting" />
																		</th>
																	</tr>
																	<tr>
																		<td style="font-size: 12px;"><spring:message
																				code="BzComposer.configuration.defaultcustomdashboard" />:
																		</td>
																		<td align="left" style="font-size: 12px;">
                                                                            <input type="checkbox" name="salesOrderBoard" id="salesOrderBoard" value="${configDto.salesOrderBoard}" ${configDto.salesOrderBoard=='on'?'checked':''} /> 
                                                                            <label>
                                                                                <spring:message
																					code="BzComposer.configuration.defaultdashboard.opensalesorders" />
                                                                            </label>
                                                                            &nbsp;&nbsp;&nbsp;
																			<input type="checkbox" name="itemReceivedBoard"
																			    id="itemReceivedBoard"
																			    value="${configDto.itemReceivedBoard}"
																			    ${configDto.itemReceivedBoard=='on'?'checked':''} />
																			<label>
                                                                                <spring:message code="BzComposer.configuration.defaultdashboard.itemreceived" />
                                                                            </label>&nbsp;&nbsp;&nbsp;
																			<input type="checkbox" name="showUSAInBillShipAddress"
																				id="showUSAInBillShipAddress" /> 
                                                                            <label>
                                                                                <spring:message
																					code="BzComposer.configuration.defaultdashboard.showUSAInBillShipAddress" />
                                                                            </label>
																			<br />
                                                                            <input type="checkbox" name="poboard"
																			    id="poboard" value='${configDto.poboard}'
																			    ${configDto.poboard=='on'?'checked':''} />
                                                                            <label>
                                                                                <spring:message code="BzComposer.configuration.defaultdashboard.poboard" />
                                                                            </label>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			<input type="checkbox" name="itemShippedBoard"
																			    id="itemShippedBoard"
																			    value='${configDto.itemShippedBoard}'
																			    ${configDto.itemShippedBoard=='on'?'checked':''} />
																			<label>
                                                                                <spring:message code="BzComposer.configuration.defaultdashboard.itemshiped" />
                                                                            </label>
																		</td>
																	</tr>
																</table>
															</div>

														</div>
                                                        <div id="security">
                                                            <div id="content1" class="tabPage">
                                                                <!-- ------------------- Company-Security Start here ----------------- -->
																<form:form name="SecurityForm" method="post">
																	<table id="companyInfoTable"
																		class="table-notifications">
																		<tr>
																			<th colspan="3"
																				style="padding: 5px; font-size: 12px;"><spring:message
																					code="BzComposer.register.security" />
                                                                            </th>
																		</tr>
																		<tr>
																			<td colspan="3" align="center"><div
																					id="errorsPWD" style="color: red;"></div>
                                                                            </td>
																		</tr>
																		<tr>
																			<td style="width: 30%; font-size: 12px;"><spring:message
																					code="BzComposer.register.password" /> 
                                                                                    <span class="inputHighlighted">
                                                                                        <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                                    </span>
                                                                            </td>
																			<td style="width: 30%; font-size: 12px;"><input
																					type="password" name="password" id="password" size="40"
																					maxlength="45" required="true" />
                                                                            </td>
																			<td style="width: 40%;">&nbsp;</td>
																		</tr>
																		<tr>
																			<td nowrap style="font-size: 12px;">
                                                                                <spring:message code="BzComposer.register.confirmpassword" /> 
                                                                                <span class="inputHighlighted">
                                                                                    <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                                </span>&nbsp;
																			</td>
																			<td style="font-size: 12px;">
                                                                                <input type="password" name="confirmPassword" id="confirmPassword" size="40"
																					maxlength="45" required="true" /></td>
																			<td>
																				<button type="button" class="formbutton"
																					onclick="updateComapanySecurity();"
																					style="padding: 5 10px; font-size: 14px;">
																					<spring:message code='BzComposer.global.update' />
																				</button>
																			</td>
																		</tr>
																	</table>
																</form:form>
                                                            </div>
                                                        </div>
                                                        <div id="reminder">
															<div id="content4" class="tabPage">
																<jsp:include page="ReminderNew.jsp" />
															</div>
														</div>
                                                        <div id="emailSetup">
															<div id="tabs1" style="height: 600px;">
																<ul>
																	<li style="font-size: 12px;"><a
																		href="#smtpServerSettings"> <spring:message
																				code="BzComposer.tab.smtpServerSettings" />
																	</a></li>
																	<li style="font-size: 12px;"><a
																		href="#emailTemplate"> <spring:message
																				code="BzComposer.configuration.emailtemplate" />
																	</a></li>
																</ul>
																<div id="smtpServerSettings">
																	<div id="content" class="tabPage">
																		<%-- <jsp:include page="/WEB-INF/jsp/configuration/smtpSetup.jsp"/> --%>
																		<!-- SMTP Setup Starts -->
																		<table class="table-notifications" width="100%">
																			<tr>
																				<td colspan="2" style="font-size: 12px;"><b><spring:message
																							code="BzComposer.configuration.setuploginnote" /></b>
																				</td>
																			</tr>
																			<tr>
																				<th align="left" colspan="2"
																					style="font-size: 12px; padding: 5px;"><spring:message
																						code="BzComposer.configuration.serverinformation" />
																				</th>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;"><spring:message
																						code="BzComposer.configuration.smtpserver" /></td>
																				<td style="font-size: 12px;"><form:input
																						path="mailServer" size="30" maxlength="45" /></td>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;"><spring:message
																						code="BzComposer.configuration.senderemailaddress" />
																				</td>
																				<td style="font-size: 12px;"><form:input
																						path="senderEmail" size="30" maxlength="45" /></td>
																			</tr>
																			<tr>
																				<td colspan="2" style="font-size: 12px;"><input
																					type="button" name="testMailConnection"
																					class="formButton" size="25"
																					onclick="TestConnection()"
																					value='<spring:message code="BzComposer.configuration.testconnectiontomailserverbtn" />' />
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2" style="font-size: 12px;"><spring:message
																						code="BzComposer.configuration.mailserverauthentication" />
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2" style="font-size: 12px;"><input
																					type="checkbox" name="mailAuth" id="mailAuth"
																					onclick="EnableDisableFields2();"
																					value='${configDto.mailAuth}'
																					${configDto.mailAuth=='on'?'checked':''} /> <label><spring:message
																							code="BzComposer.configuration.serverrequeiresauthentication" /></label>
																				</td>
																			</tr>
																			<tr>
																				<th align="left" colspan="2"
																					style="font-size: 12px; padding: 5px;"><spring:message
																						code="BzComposer.configuration.userinformation" />
																				</th>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;"><spring:message
																						code="BzComposer.configuration.username" /></td>
																				<td style="font-size: 12px;"><form:input
																						type="email" path="mailUserName" size="30"
																						maxlength="45" /></td>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;"><spring:message
																						code="BzComposer.configuration.password" /></td>
																				<td style="font-size: 12px;"><form:input
																						path="mailPassword" size="30" maxlength="35" /></td>
																			</tr>
																		</table>
																		<!-- SMTP Setup Ends -->

																	</div>
																</div>
                                                                <div id="emailTemplate">
                                                                    <div id="content2" class="tabPage">
                                                                        <!-- Email Template Content -->
                                                                        <div class="email-template-wrapper">
                                                                            <div style="display: flex; gap: 20px;">
                                                                                <!-- Left Sidebar: Template List -->
                                                                                <div class="template-sidebar">
                                                                                    <h4><spring:message code="BzComposer.configuration.emailtemplate" /></h4>
                                                                                    <div class="action-links">
                                                                                        <a href="#" onclick="addNewTemplate(); return false;">
                                                                                            <spring:message code="BzComposer.configuration.newtemplate"/>
                                                                                        </a>
                                                                                        <a href="#" onclick="saveTemplate(); return false;">
                                                                                            <spring:message code="BzComposer.configuration.savetemplate"/>
                                                                                        </a>
                                                                                        <a href="#" onclick="deleteTemplate(); return false;">
                                                                                            <spring:message code="BzComposer.configuration.deletetemplate"/>
                                                                                        </a>
                                                                                    </div>
                                                                                    <label style="display: block; font-size: 12px; margin-bottom: 8px;">
                                                                                        <spring:message code="BzComposer.configuration.availabletemplate"/>:
                                                                                    </label>
                                                                                    <ul class="template-list-group" id="templateSidebar">
                                                                                        <c:if test="${not empty mailTemplateDtoArrayList}">
                                                                                            <c:forEach items="${mailTemplateDtoArrayList}" var="objList1" varStatus="loop">
                                                                                                <li class="template-list-item"
                                                                                                    data-template-id="${objList1.templateID}"
                                                                                                    data-template-name="${objList1.templateName}"
                                                                                                    onclick="setContentData('${objList1.templateID}');">
                                                                                                    ${objList1.templateName}
                                                                                                </li>
                                                                                            </c:forEach>
                                                                                        </c:if>
                                                                                    </ul>
                                                                                </div>

                                                                                <!-- Right Side: Mail Template Information Form -->
                                                                                <div style="flex: 1;">
                                                                                    <div class="template-form-card">
                                                                                        <div class="card-header">Mail Template Information</div>

                                                                                        <div class="template-form-group">
                                                                                            <label for="templateName"><spring:message code="BzComposer.configuration.templatename"/>*:</label>
                                                                                            <input type="text" id="templateName" placeholder="Enter Template Name" />
                                                                                            <input type="hidden" id="txtTemplateName" value="" />
                                                                                        </div>

                                                                                        <div class="template-form-group">
                                                                                            <label for="recipientEmail">Send to:</label>
                                                                                            <input type="email" id="recipientEmail" class="form-control" placeholder="Enter Recipient Mail" />
                                                                                        </div>

                                                                                        <div id="placeholdersContainer">
                                                                                            <!-- Dynamic placeholder inputs will be injected here -->
                                                                                        </div>

                                                                                        <div class="template-form-group">
                                                                                            <label for="templateSubject"><spring:message code="BzComposer.configuration.subject"/>*:</label>
                                                                                            <input type="text" id="templateSubject" placeholder="Enter Subject" />
                                                                                            <input type="hidden" id="txtTemplateSubject" value="" />
                                                                                        </div>

                                                                                        <div class="template-form-group">
                                                                                            <label for="templateBody"><spring:message code="BzComposer.configuration.emailtext"/>:</label>
                                                                                            <div id="templateBody"
                                                                                                class="template-body-editor"
                                                                                                contenteditable="true"
                                                                                                placeholder="Enter email content here..."></div>
                                                                                            <textarea id="txtTemplateText" style="display: none;"></textarea>
                                                                                        </div>

                                                                                        <div class="template-action-buttons">
                                                                                            <button type="button" class="formButton" onclick="addNewTemplate();">
                                                                                                New
                                                                                            </button>
                                                                                            <button type="button" class="formButton" onclick="saveTemplate();">
                                                                                                Save
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <input type="hidden" name="selectedTemplateId" id="selectedTemplateId" />
                                                                            <div id="errors" style="color: red; margin-top: 10px;"></div>
                                                                        </div>

                                                                        <!-- Save/Cancel Buttons for Email Template Tab -->
                                                                        <div align="center" id="emailTemplateButtons" style="display: block; margin-top: 20px; padding-top: 20px; border-top: 1px solid #e0e0e0;">
                                                                            <input type="button" class="bottomButton formButton" name="Save" id="SaveEmailTemplate" onclick="saveTemplate();" value="<spring:message code='BzComposer.global.save'/>" />
                                                                            <input type="reset" class="bottomButton formButton" id="CancelEmailTemplate" name="Cancel" onclick="RevokeValues()" value="<spring:message code='BzComposer.global.cancel'/>" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
 														</div>
                                                        <div id="smsSetup">
                                                            <div id="tabs2" style="height: 600px;">
																<ul>
																	<li style="font-size: 12px;"><a
																		href="#twilioSmsServerSettings"> Twilio SMS Server Settings
																	</a></li>
																	<li style="font-size: 12px;"><a
																		href="#smsTemplate"> SMS Template
																	</a></li>
																</ul>
																<div id="twilioSmsServerSettings">
																	<div id="smsContent" class="tabPage">
																		<!-- Twilio SMS Server Settings Starts -->
																		<table class="table-notifications" width="100%">
																			<tr>
																				<td colspan="2" style="font-size: 12px;"><b>Set up Twilio Account SID and Auth Token to connect SMS server.</b>
																				</td>
																			</tr>
																			<tr>
																				<th align="left" colspan="2"
																					style="font-size: 12px; padding: 5px;">Server Information
																				</th>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;">Account SID:</td>
																				<td style="font-size: 12px;">
                                                                                    <form:input type="text" path="twilioAccountSid" size="30" maxlength="100" /></td>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;">Auth Token:</td>
																				<td style="font-size: 12px;"><form:input
																						type="password" path="twilioAuthToken" size="30" maxlength="100" /></td>
																			</tr>
																			<tr>
																				<td style="font-size: 12px;">Phone Number:</td>
																				<td style="font-size: 12px;">
                                                                                    <form:input
																						type="text" path="twilioPhoneNumber" size="30" maxlength="20" placeholder="+1234567890" /></td>
																			</tr>
																			<tr>
																				<td colspan="2" style="font-size: 12px;"><input
																					type="button" name="testSmsConnection"
																					class="formButton" size="25"
																					onclick="TestSmsConnection()"
																					value="Test connection to SMS server ..." />
																				</td>
																			</tr>
																		</table>
																		<!-- Twilio SMS Server Settings Ends -->
																	</div>
																</div>
																<div id="smsTemplate">
																	<div id="smsContent2" class="tabPage">
																		<div class="sms-template-wrapper">
																			<div style="display: flex; gap: 20px;">
																				<!-- Left Sidebar: SMS Template List -->
																				<div class="sms-template-sidebar">
																					<h4>SMS Template</h4>
																					<div class="sms-action-links">
																						<a href="#" onclick="addNewSmsTemplate(); return false;">
																							New Template
																						</a>
																						<a href="#" onclick="saveSmsTemplate(); return false;">
																							Save Template
																						</a>
																						<a href="#" onclick="deleteSmsTemplate(); return false;">
																							Delete Template
																						</a>
																					</div>
																					<label style="display: block; font-size: 12px; margin-bottom: 8px;">
																						Available Templates:
																					</label>
																					<ul class="sms-template-list-group" id="smsTemplateSidebar">
																						<!-- SMS templates will be loaded here -->
																						<c:if test="${not empty smsTemplateDtoArrayList}">
                                                                                            <c:forEach items="${smsTemplateDtoArrayList}" var="objList1" varStatus="loop">
                                                                                                <li class="sms-template-list-item"
                                                                                                    data-template-id="${objList1.templateID}"
																	                                data-template-name="${objList1.templateName}"
                                                                                                    onclick="setSMSContentData('${objList1.templateID}');">
                                                                                                    ${objList1.templateName}
                                                                                                </li>
                                                                                            </c:forEach>
                                                                                        </c:if>
																					</ul>
																				</div>

																				<!-- Right Side: SMS Template Information Form -->
																				<div style="flex: 1;">
																					<div class="sms-template-form-card">
																						<div class="sms-card-header">SMS Template Information</div>

																						<div class="sms-template-form-group">
																							<label class="sms-form-label" for="smsTemplateName">
																								Template Name*:
																							</label>
																							<input type="text" id="smsTemplateName" class="sms-form-input" placeholder="Enter Template Name" />

																							<label class="sms-form-label" for="smsTemplateText">
																								SMS Text*:
																							</label>
																							<textarea id="smsTemplateText" class="sms-form-textarea" placeholder="Enter SMS content here..."></textarea>

																							<div id="smsPlaceholdersContainer"></div>
																						</div>
																					</div>
																				</div>
																			</div>

																			<input type="hidden" name="selectedSmsTemplateId" id="selectedSmsTemplateId" />
																			<div id="smsErrors" style="color: red; margin-top: 10px;"></div>
																		</div>
																	</div>
																</div>
															</div>
                                                        </div>
                                                        <div id="customization">
															<div id="tabs3" style="height: 600px;">
																<ul>
																	<li style="font-size: 12px;"><a
																		href="#employeeBoardSettings"> Employee Board
																	</a></li>
																</ul>
																<div id="employeeBoardSettings">
																	<div id="smsContent" class="tabPage">
																		<table class="table-notifications" width="100%">
																			<tr>
																				<th colspan="3" align="left" style="font-size:12px; padding:5px;">
																					Customize My Tabs
																				</th>
																			</tr>
																			<tr>
																				<td style="font-size:12px;padding-top: 20px;padding-bottom: 0px;">
																					Available Tabs
																				</td>
																				<td>&nbsp;&nbsp;
																				</td>
																				<td style="font-size:12px;padding-top: 20px;padding-bottom: 0px;">
																					Selected Tabs
																				</td>
																			</tr>
																			<tr>
																				<td style="width:60px;font-size:12px;padding-top: 0px;">
																					<select id="NotSelectedCustomerBoardTab" name="NotSelectedCustomerBoardTab" style="display:block; width: 200px; height: 200px;" multiple="multiple">
																						<c:if test="${not empty listOfCustomerBoardNotSelectTabs}">
																							<c:forEach items="${listOfCustomerBoardNotSelectTabs}" var="objList1">
																								<option value="${objList1.id}">${objList1.tabName}</option>
																							</c:forEach>
																						</c:if>
																					</select>
																				</td>

																				<td align="center" style="font-size:12px;width: 100px;padding-top: 0px;">
																					<br><br><br><br>
																					<span style="font-size: 14px;color: black !important;">Add</span><br>
																					<input type="button" id="addL2R" class="formButton" name="addL2R" onclick="setactivate()"  value=">" style="width: 40px;">
																					<br><br>
																					<input type="button" id="addR2L" style="width:40px;" class="formButton" name="addR2L" onclick="setdeactivate()"  value="<"><br>
																					<span style="font-size: 14px;color: black !important;">Remove</span>
																				</td>
																				<td style="font-size:12px;padding-top: 0px;">
																					<select id="SelectedCustomerBoardTab" name="SelectedCustomerBoardTab" style="display:block; width: 200px; height: 200px;" multiple="multiple">
																					<c:if test="${not empty listOfCustomerBoardSelectedTabs}">
																						<c:forEach items="${listOfCustomerBoardSelectedTabs}" var="objList1">
																							<option value="${objList1.id}" onclick="setDescription()">${objList1.tabName}</option>
																						</c:forEach>
																					</c:if>
																					</select>
																				</td>
																			</tr>
																			
																		</table>
																	</div>
																</div>
															</div>
														</div>
                                                        <!-- Custom Fields start -->
														<div id="customfields">
															<div id="tabs4" style="height: 600px;">
																<ul>
																	<li style="font-size: 12px;"><a
																		href="#EmployeeBoardCFSettings"> Employee Board
																	</a></li>
																</ul>
																<div id="EmployeeBoardCFSettings">
																	<div id="smsContent" class="tabPage">
																		<table class="table-notifications" width="100%">
																			<tr>
																				<td colspan="5" style="width:50px;font-size: 12px;" class="pb-3">
																					<input type="checkbox"name="isEmployeeCustomField" id="isEmployeeCustomField"
																						 ${isEmployeeCustomField == 1 ? 'checked="checked"' : ''}/>
																						Show on Employee Entry Form
																				</td>
																			</tr>
																			<tr>
																				<th colspan="5" align="left" style="font-size:12px; padding:5px;">
																					Employee Board Custom Fields Settings
																				</th>
																			</tr>
																			<tr>
																				<td colspan="3" style="font-size: 12px;">
																					<div style="overflow: auto; height: 200;"
																						class="section-border">
																						<table cellspacing="0" border="1"
																							class="usersTblNew">
																							<thead>
																								<tr>
																									<td><b>Order</b></td>
																									<td><b>Field Key</b></td>
																									<td><b>Display Name</b></td>
																									<td><b>Type</b></td>
																									<td><b>Show in List</b></td>
																									<td><b>Status</b></td>
																									
																								</tr>
																							</thead>
																							<tbody id="eCustomFieldTableBody">
																							</tbody>
																						</table>
																						<input type="hidden" id="eCustomFieldDataSize" value="0"/>
																					</div>
																				</td>
																				<td colspan="2" align="center" valign="middle"
																					style="font-size: 14px; padding-top: 40px;">
																					<button type="button" class="formButton" style="width: 120px;" onclick="openAddFields()">
																						Add
																					</button> <br /> <br />
																					<button type="button" class="formButton"  style="width: 120px;" onclick="openEditFields()">
																						Edit
																					</button> <br /> <br />
																					<button type="button" class="formButton"
																						onclick="deleteDilog();" style="width: 120px;">
																						<spring:message code="BzComposer.global.delete" />
																					</button>
																				</td>
																			</tr>
																			
																			
																		</table>
																	</div>
																</div>
																
															</div>
														</div>
														<!-- Custom Fields end -->
                                                    </div>
                                                </div>
                                                <!-- general page content ends -->
                                            </td>

                                        </tr>
                                    </table>
                                    <div>
                                        <form:hidden path="empStateID" />
                                        <form:hidden path="labelName" />
                                        <form:hidden path="fileName" />
                                    </div>
                                    <div>
                                        <input type="hidden" name="tabid" id="tabid" value="" />
                                        <input type="hidden" name="salesOrderBoard" value="" />
                                        <input type="hidden" name="itemReceivedBoard" value="" />
                                        <input type="hidden" name="itemShippedBoard" value="" />
                                        <input type="hidden" id="selectedECustomFieldId" />
                                        <input type="hidden" id="selectedCustomFieldId" />
                                        <input type="hidden" name="poboard" value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
    <jsp:include page="/WEB-INF/jsp/include/footer.jsp" />

    <!-- Add Fields Modal Start -->
	<div class="container-fluid" id="AddFields" style="width: 600px; display: none;">
		<div class="table-responsive"
			style="
				padding: 10 20px;
				font-size: 14px;
				border: 1px solid #ced4da;
				border-radius: 0.25rem;
				min-height: 220px;">
			<div class="row pb-2">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right">Display Name</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="displayName" />
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row pb-2">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right">Field Type</label>
				<div class="col-md-6">
					<select class="form-control" id="fieldType" style="height: calc(2.25rem + 2px); appearance: auto;">
						<option value="">Select Field Type</option>
						<option value="Text">Text</option>
						<option value="Textarea">Textarea</option>
						<option value="Number">Number</option>
						<!-- <option value="Date">Date</option>
						<option value="Dropdown">Dropdown</option>
						<option value="Checkbox">Checkbox</option> 
						<option value="Email">Email</option>
						<option value="Phone">Phone</option>-->
					</select>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row pb-2">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right"></label>
				<div class="col-md-6">
					<input type="checkbox"value="0" id="isRequired"> Required <br/>
					<input type="checkbox"value="0" id="isShowList"> Show in List <br/>
					<input type="checkbox"value="1" id="isActive" checked> Active <br/>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row pb-2" id="optionsSection" style="display:none;">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right pt-2">Options</label>
				<div class="col-md-6">
					<div id="optionsContainer">
						<div class="option-row d-flex mb-2">
							<input type="text" name="options[]" class="form-control" placeholder="Enter option" />
							<button type="button" class="btn btn-info custom-btn addOptionBtn" style=" margin-left: 5px; width: 114px;">Add</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-6 pt-2" style="font-size: 14px;text-align: end;">
					<button class="btn btn-info custom-btn" type="button" onclick="saveFieldData()"><spring:message code="BzComposer.global.save" /></button>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	<!-- Add Fields Modal End -->

    <!-- Edit Fields Modal Start -->
	<div class="container-fluid" id="EditFields" style="width: 600px; display: none;">
		<div class="table-responsive"
			style="
				padding: 10 20px;
				font-size: 14px;
				border: 1px solid #ced4da;
				border-radius: 0.25rem;
				min-height: 220px;">
			<div class="row pb-2">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right">Display Name</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="editDisplayName" />
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row pb-2">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right">Field Type</label>
				<div class="col-md-6">
					<select class="form-control" id="editFieldType" style="height: calc(2.25rem + 2px); appearance: auto;">
						<option value="">Select Field Type</option>
						<option value="Text">Text</option>
						<option value="Textarea">Textarea</option>
						<option value="Number">Number</option>
						<!-- <option value="Date">Date</option>
						<option value="Dropdown">Dropdown</option>
						<option value="Checkbox">Checkbox</option> 
						<option value="Email">Email</option>
						<option value="Phone">Phone</option>-->
					</select>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row pb-2">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right"></label>
				<div class="col-md-6">
					<input type="checkbox"value="0" id="editIsRequired"> Required <br/>
					<input type="checkbox"value="0" id="editIsShowList"> Show in List <br/>
					<input type="checkbox"value="0" id="editIsActive"> Active <br/>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row pb-2" id="editOptionsSection" style="display:none;">
				<div class="col-md-1"></div>
				<label class="col-md-3 text-right pt-2">Options</label>
				<div class="col-md-6">
					<div id="editOptionsContainer">
						<div class="option-row d-flex mb-2">
							<input type="text" name="editOptions[]" class="form-control" placeholder="Enter option" />
							<button type="button" class="btn btn-info custom-btn addOptionBtn" style=" margin-left: 5px; width: 114px;">Add</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-6 pt-2" style="font-size: 14px;text-align: end;">
					<button class="btn btn-info custom-btn" type="button" onclick="updateFieldData()">Update</button>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>	 
	<!-- Edit Fields Modal End -->
</body>
<script>
    $(function() {
        $("#tabs").tabs();
        $("#tabs1").tabs();
        $("#tabs2").tabs();
        $("#tabs3").tabs();
        $("#tabs4").tabs();
    });
    // Get references
    const phoneInput = document.getElementById("phone");
    const mobileInput = document.getElementById("mobileNumber");
    const sameAsPhoneCheckbox = document.getElementById("sameAsPhone");

    // On checkbox change
    sameAsPhoneCheckbox.addEventListener("change", function () {
        if (this.checked) {
            mobileInput.value = phoneInput.value; // copy value
            mobileInput.readOnly = true;          // optional: make mobile read-only
        } else {
            mobileInput.readOnly = false;         // allow editing
        }
    });

    // Optional: update mobile number live if phone changes while checkbox is checked
    phoneInput.addEventListener("input", function () {
        if (sameAsPhoneCheckbox.checked) {
            mobileInput.value = phoneInput.value;
        }
    });

</script>
<script type="text/javascript">
    EnableDisableFields2();
    function SaveValues(evt) {
        if (evt && evt.preventDefault) {
            evt.preventDefault();
        } else if (typeof event !== "undefined" && event && event.preventDefault) {
            event.preventDefault();
        }
        $("#showsaverecorddialog").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var currencyID = document.getElementById("currencyID").value;
                    var weightID = document.getElementById("weightID").value;
                    var defaultLabelID = document.getElementById("defaultLabelID").value;
                    var filterOption = document.getElementById("filterOption").value;
                    var moduleID = document.getElementById("moduleID").value;


                    var salesOrderBoard = $("#salesOrderBoard").val();
                    var itemReceivedBoard = $("#itemReceivedBoard").val();
                    var poboard = $("#poboard").val();
                    var itemShippedBoard = $("#itemShippedBoard").val();
                    document.getElementById('salesOrderBoard').value = salesOrderBoard;
                    document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
                    document.getElementById('itemShippedBoard').value = itemShippedBoard;
                    document.getElementById('poboard').value = poboard;
                    var x = document.getElementById("selectedModules");
                    var modules = "";
                    var i;
                    var moduleslist = [];
                    for (i = 0; i < x.length; i++) {
                        modules = x.options[i].text;
                        moduleslist.push(modules);
                    }
                    /* document.getElementById('tabid').value="SaveConfigurationGeneral";
                        document.forms[0].action = "Configuration";
                        document.forms[0].submit(); */
                    window.location.href = "${pageContext.request.contextPath}/Configuration?tabid=SaveConfigurationGeneral&salesOrderBoard=" + salesOrderBoard + "&itemReceivedBoard="
                        + itemReceivedBoard + "&itemShippedBoard=" + itemShippedBoard + "&poboard=" + poboard + "&currencyID=" + currencyID + "&weightID=" + weightID +
                        "&defaultLabelID=" + defaultLabelID + "&filterOption=" + filterOption + "&moduleID=" + moduleID + "&moduleslist=" + moduleslist;
                    $('form').submit();
                    $(this).dialog("close");
                    return false;
                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });
        return false;
    }
    function SaveValuesFeatures() {
        if (confirm('<spring:message code="BzComposer.configuration.saveconfirm"/>')) {
            event.preventDefault();
            $("#showsaverecorddialog").dialog({
                resizable: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: {
                    "<spring:message code='BzComposer.global.ok'/>": function () {
                        document.configurationForm.selectedModules.value = document.configurationForm.selectedModules.value;
                        document.configurationForm.selectedModuleId.value = document.configurationForm.selectedModuleId.value;

                        var x = document.getElementById("selectedModules");
                        var txt = "";
                        var i;
                        for (i = 0; i < x.length; i++) {
                            txt = txt + "\n" + x.options[i].text;
                        }
                        document.configurationForm.selectedModules.value = txt;

                        var x = document.getElementById("selectedModuleId");
                        var txt1 = "";
                        var i;
                        for (i = 0; i < x.length; i++) {
                            txt1 = txt1 + "\n" + x.options[i].text;
                        }

                        $('form').submit();
                        $(this).dialog("close");
                        return false;
                    },
                    "<spring:message code='BzComposer.global.cancel'/>": function () {
                        $(this).dialog("close");
                        return false;
                    }
                }
            });
            return false;
        }
    }
    function RevokeValues() {
        document.getElementById('tid').value = "config";
        document.forms[0].action = "Configuration";
        document.forms[0].submit();
    }

    function SetLabelName(lblid) {
        size = document.getElementById('lblsize').value;
        for (cnt = 0; cnt < size; cnt++) {
            lid = document.getElementById(cnt + 'lid').value;
            if (lblid == lid) {
                document.configurationForm.labelName.value = document.getElementById(cnt + 'lname').value;
                break;
            }
        }
    }
</script>
<!-- jQuery (for AJAX) -->
<script>
    function SaveFunction(e) {
        if (e && e.preventDefault) {
            e.preventDefault(); // prevent form submission
        }

        var employerIdVal = $("input[name='employerId']").val();
        if (employerIdVal && !employerIdVal.match(/^[0-9A-Za-z]{2}-[0-9A-Za-z]{7}$/)) {
            alert("Employer ID must follow the XX-XXXXXXX format.");
            return false;
        }

        // Collect all form data
        var formData = {
            membershipLevel: $("select[name='membershipLevel']").val(),
            emailAddress: $("input[name='emailAddress']").val(),
            firstName: $("input[name='firstName']").val(),
            lastName: $("input[name='lastName']").val(),
            jobPosition: $("select[name='jobPosition']").val(),
            employerId: employerIdVal,
            companyName: $("input[name='companyName']").val(),
            dbaName: $("input[name='dbaName']").val(),
            businessType: $("select[name='businessType']").val(),
            address1: $("input[name='address1']").val(),
            address2: $("input[name='address2']").val(),
            zipCode: $("input[name='zipCode']").val(),
            city: $("select[name='city']").val(),
            state: $("select[name='state']").val(),
            country: $("select[name='country']").val(),
            phone: $("input[name='phone']").val(),
            mobileNumber: $("input[name='mobileNumber']").val(),
            sameAsPhone: $("input[name='sameAsPhone']").is(":checked"),
            fax: $("input[name='fax']").val()
        };

        console.log("Form Data:", formData); // Debugging
        // Send AJAX POST request
        $.ajax({
            type: "POST",
            url: "/api/save/company-information",
            data: JSON.stringify(formData),
            contentType: "application/json", // Send as JSON
            success: function (response) {
                console.log("Server Response:", response);

                // If response is exactly false
                if (response === false) {
                    alert("User’s company information already exists.");
                } else {
                    alert("Data saved successfully!");
                }
            },
            error: function (xhr, status, error) {
                alert("Error while saving data!");
                console.error("Error:", xhr.responseText || error);
            }
        });
    }

    function getVisibleGeneralPanelId() {
        return $("#tabs > div:visible").first().attr("id");
    }

    function handleGeneralTopSave() {
        var activePanelId = getVisibleGeneralPanelId();
        if (activePanelId === "companyInformation") {
            SaveFunction({ preventDefault: function () { } });
            return false;
        }
        SaveValues();
        return false;
    }

    function handleGeneralTopCancel() {
        var activePanelId = getVisibleGeneralPanelId();
        if (activePanelId === "companyInformation") {
            var companyForm = document.getElementById("companyInformationId");
            if (companyForm) {
                companyForm.reset();
            }
            return false;
        }
        RevokeValues();
        return false;
    }
</script>
<script>
    $(document)
        .ready(
            function () {
                <c:if test="${not empty companyInfo}">
                    $("select[name='jobPosition']").val("${companyInfo.jobPosition}");
                    $("select[name='businessType']").val("${companyInfo.businessType}");
                    $("select[name='city']").val("${companyInfo.city}");
                    $("select[name='state']").val("${companyInfo.state}");
                    $("select[name='country']").val("${companyInfo.country}");
                    $("select[name='membershipLevel']").val("${companyInfo.membershipLevel}");
                </c:if>

                $('#sellectCountry')
                    .on(
                        'change',
                        function () {
                            var id = $(this).val();
                            console
                                .log("Selected Country ID: "
                                    + id);

                            $
                                .ajax({
                                    type: 'GET',
                                    url: '/api/states',
                                    data: {
                                        id: id
                                    },
                                    dataType: 'json', //  Important: Expecting JSON
                                    success: function (result) {

                                        var s;
                                        for (var i = 0; i < result.length; i++) { // use .length
                                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                                        }
                                        $('#sellectState').html(s);
                                    },
                                    error: function (
                                        xhr,
                                        status,
                                        error) {
                                        console
                                            .error(
                                                "AJAX Error:",
                                                error);
                                        console
                                            .log(
                                                "Response Text:",
                                                xhr.responseText);
                                    }
                                });
                        });

                $('#sellectState')
                    .on(
                        'change',
                        function () {
                            var id = $(this).val();
                            console
                                .log("Selected State ID: "
                                    + id);

                            $
                                .ajax({
                                    type: 'GET',
                                    url: '/api/cities',
                                    data: {
                                        id: id
                                    }, // send as query param ?id=...
                                    dataType: 'json', // expecting JSON from server
                                    success: function (
                                        result) {
                                        var s;
                                        for (var i = 0; i < result.length; i++) {
                                            console
                                                .log("Loop ID: "
                                                    + i);
                                            s += '<option value="' + result[i].id + '">'
                                                + result[i].name
                                                + '</option>';
                                        }
                                        $(
                                            '#sellectDistrict')
                                            .html(s);
                                    },
                                    error: function (
                                        xhr,
                                        status,
                                        error) {
                                        console
                                            .error(
                                                "AJAX Error:",
                                                error);
                                        console
                                            .log(
                                                "Response Text:",
                                                xhr.responseText);
                                    }
                                });

                        });
            });
</script>
<script type="text/javascript">
    var currentSmsTemplateBody = "";

    function addNewSmsTemplate() {
        document.getElementById('selectedSmsTemplateId').value = "";
        document.getElementById('smsTemplateName').value = "";
        document.getElementById('smsTemplateText').value = "";
        var bodyDiv = document.getElementById('smsTemplateBody');
        bodyDiv.innerHTML = "";
        currentSmsTemplateBody = "";
        var placeholdersContainer = document.getElementById('smsPlaceholdersContainer');
        placeholdersContainer.innerHTML = "";
        document.getElementById("smsErrors").innerHTML = "";
    }

    function saveSmsTemplate() {
        var selectedTemplateId = document.getElementById('selectedSmsTemplateId').value;
        var templateName = document.getElementById('smsTemplateName').value;
        var templateText = document.getElementById('smsTemplateText').value;
        var errorMessage = "";

        if (templateName == "" || templateName == null) {
            errorMessage = "<h3>Please Enter Template Name</h3>";
        } else if (templateText == "" || templateText == null) {
            errorMessage = "<h3>Please Enter SMS Template Text</h3>";
        }

        if (errorMessage != "") {
            document.getElementById("smsErrors").innerHTML = errorMessage;
            return false;
        } else {
            $.ajax({
                type: "POST",
                url: "/ConfigurationAjax/SaveConfiguration?tabid=addNewSMSTemplate",
                data: "selectedTemplateId=" + selectedTemplateId + "&templateName=" + templateName + "&templateText=" + templateText,
                success: function(data) {
                    window.location = "/settings/general";
                },
                error: function(data) {
                    alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                    return false;
                }
            });
        }
    }

    function deleteSmsTemplate() {
        var selectedTemplateId = document.getElementById('selectedSmsTemplateId').value;
        if (selectedTemplateId == null || selectedTemplateId == "") {
            alert("Please select template!");
        } else {
            // TODO: Implement AJAX call to delete SMS template
            if (confirm("Are you sure you want to delete this template?")) {
                $.ajax({
                    type: "POST",
                    url: "/ConfigurationAjax/SaveConfiguration?tabid=deleteSMSTemplate",
                    data: "selectedTemplateId=" + selectedTemplateId,
                    success: function(data) {
                        window.location = "/settings/general";
                    },
                    error: function(data) {
                        alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                        return false;
                    }
                });
            }
        }
    }

    function TestSmsConnection() {
        // TODO: Implement SMS connection test
        alert("SMS connection test will be implemented in backend");
    }

    $(document).ready(function() {
        $('.sms-template-list-item').on('click', function() {
            $('.sms-template-list-item').removeClass('active');
            $(this).addClass('active');
            var templateId = $(this).attr('data-template-id');
            if (templateId) {
                setSmsContentData(templateId);
            }
        });

        // Auto-select first template if available
        var firstItem = $('.sms-template-list-item').first();
        if (firstItem.length > 0) {
            firstItem.addClass('active');
            var firstTemplateId = firstItem.attr('data-template-id');
            if (firstTemplateId) {
                setSmsContentData(firstTemplateId);
            }
        }
    });
</script>
<!-- Email Template JavaScript Functions -->
<script type="text/javascript">
    var currentTemplateBody = "";

    function addNewTemplate() {
        document.getElementById('selectedTemplateId').value = "";
        document.getElementById('templateName').value = "";
        document.getElementById('templateSubject').value = "";
        document.getElementById('recipientEmail').value = "";
        document.getElementById('templateBody').innerHTML = "";
        document.getElementById('placeholdersContainer').innerHTML = "";
        document.getElementById("errors").innerHTML = "";

        // Remove active class from all template items
        var items = document.querySelectorAll('.template-list-item');
        items.forEach(function(item) {
            item.classList.remove('active');
        });
    }

    function setContentData(templateID) {
        $.ajax({
            type: "POST",
            url: "/ConfigurationAjax/SaveConfiguration?tabid=con&templateId=" + templateID,
            data: { emailText: templateID }
        }).done(function(data) {
            const mailTemplate = JSON.parse(data);
            document.getElementById('selectedTemplateId').value = mailTemplate.TemplateID;
            document.getElementById('templateName').value = mailTemplate.TemplateName;
            document.getElementById('templateSubject').value = mailTemplate.Subject;

            // Set template body and handle placeholders
            currentTemplateBody = mailTemplate.Content || "";
            populateTemplatePanel({
                subject: mailTemplate.Subject,
                body: currentTemplateBody
            });

            // Highlight selected template in list
            var items = document.querySelectorAll('.template-list-item');
            items.forEach(function(item) {
                item.classList.remove('active');
                if (item.getAttribute('data-template-id') == templateID) {
                    item.classList.add('active');
                }
            });
        });
    }

    function setSMSContentData(templateID) {
        $.ajax({
            type: "POST",
            url: "/ConfigurationAjax/SaveConfiguration?tabid=conSMS&templateId=" + templateID,
            data: { emailText: templateID }
        }).done(function(data) {
            const mailTemplate = JSON.parse(data);
            document.getElementById('selectedSmsTemplateId').value = mailTemplate.TemplateID;
            document.getElementById('smsTemplateName').value = mailTemplate.TemplateName;
            document.getElementById('smsTemplateText').value = mailTemplate.SmsText;

            // // Set template body and handle placeholders
            // currentTemplateBody = mailTemplate.Content || "";
            // populateTemplatePanel({
            //     subject: mailTemplate.Subject,
            //     body: currentTemplateBody
            // });

            // Highlight selected template in list
            var items = document.querySelectorAll('.sms-template-list-item');
            items.forEach(function(item) {
                item.classList.remove('active');
                if (item.getAttribute('data-template-id') == templateID) {
                    item.classList.add('active');
                }
            });
        });
    }
    function populateTemplatePanel(template) {
        var subjectInput = document.getElementById('templateSubject');
        var bodyDiv = document.getElementById('templateBody');
        var placeholdersContainer = document.getElementById('placeholdersContainer');

        subjectInput.value = template.subject || "";
        currentTemplateBody = template.body || "";
        bodyDiv.innerHTML = currentTemplateBody;

        // Clear placeholders container
        placeholdersContainer.innerHTML = "";

        // Extract placeholders using [placeholder] format
        var regex = /\[([^\]]+)\]/g;
        var matches = [];
        var match;
        while ((match = regex.exec(currentTemplateBody)) !== null) {
            if (matches.indexOf(match[1]) === -1) {
                matches.push(match[1]);
            }
        }

        // Create input fields for each placeholder
        matches.forEach(function(placeholder) {
            var wrapper = document.createElement('div');
            wrapper.className = 'placeholder-input-group';

            var label = document.createElement('label');
            label.className = 'form-label';
            label.textContent = placeholder;

            var input = document.createElement('input');
            input.type = 'text';
            input.className = 'form-control';
            input.placeholder = placeholder;
            input.setAttribute('data-placeholder', placeholder);

            input.addEventListener('input', function() {
                updateTemplateBody();
            });

            wrapper.appendChild(label);
            wrapper.appendChild(input);
            placeholdersContainer.appendChild(wrapper);
        });
    }

    function updateTemplateBody() {
        var bodyDiv = document.getElementById('templateBody');
        var placeholders = document.querySelectorAll('#placeholdersContainer input');
        var updatedBody = currentTemplateBody;

        placeholders.forEach(function(input) {
            var placeholder = input.getAttribute('data-placeholder');
            var value = input.value || '[' + placeholder + ']';
            // Escape special regex characters - using string concatenation to avoid EL parsing
            var escapedPlaceholder = placeholder.replace(/[.*+?^$()|[\]\\]/g, '\\$&');
            var regex = new RegExp('\\[' + escapedPlaceholder + '\\]', 'g');
            updatedBody = updatedBody.replace(regex, value);
        });

        bodyDiv.innerHTML = updatedBody;
    }

    function saveTemplate() {
        var selectedTemplateId = document.getElementById('selectedTemplateId').value;
        var templateName = document.getElementById('templateName').value;
        var subject = document.getElementById('templateSubject').value;
        var bodyDiv = document.getElementById('templateBody');
        var content = bodyDiv.innerHTML || bodyDiv.innerText || "";
        var errorMessage = "";

        if (templateName == "" || templateName == null) {
            errorMessage = "<h3>Please Enter Template Name</h3>";
        } else if (subject == "" || subject == null) {
            errorMessage = "<h3>Please Enter Subject</h3>";
        }

        if (errorMessage != "") {
            document.getElementById("errors").innerHTML = errorMessage;
            return false;
        } else {
            $.ajax({
                type: "POST",
                url: "/ConfigurationAjax/SaveConfiguration?tabid=addNewEmailTemplate",
                data: "selectedTemplateId=" + selectedTemplateId + "&templateName=" + templateName + "&content=" + encodeURIComponent(content) + "&subject=" + encodeURIComponent(subject),
                success: function(data) {
                    window.location = "/settings/general";
                },
                error: function(data) {
                    alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                    return false;
                }
            });
        }
    }

    function deleteTemplate() {
        var selectedTemplateId = document.getElementById('selectedTemplateId').value;
        if (selectedTemplateId == null || selectedTemplateId == "") {
            alert("Please select template!");
        } else {
            if (confirm("Are you sure you want to delete this template?")) {
                $.ajax({
                    type: "POST",
                    url: "/ConfigurationAjax/SaveConfiguration?tabid=deleteEmailTemplate",
                    data: "selectedTemplateId=" + selectedTemplateId,
                    success: function(data) {
                        window.location = "/settings/general";
                    },
                    error: function(data) {
                        alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                        return false;
                    }
                });
            }
        }
    }

    // Initialize template list click handlers
    $(document).ready(function() {
        $('.template-list-item').on('click', function() {
            $('.template-list-item').removeClass('active');
            $(this).addClass('active');
            var templateId = $(this).attr('data-template-id');
            if (templateId) {
                setContentData(templateId);
            }
        });

        // Auto-select first template if available
        var firstItem = $('.template-list-item').first();
        if (firstItem.length > 0) {
            firstItem.addClass('active');
            var firstTemplateId = firstItem.attr('data-template-id');
            if (firstTemplateId) {
                setContentData(firstTemplateId);
            }
        }
    });
</script>
<script>
 function saveData(){
    var activeIndex = $("#tabs").tabs("option", "active");
    if(activeIndex == 0){
        console.log("Customer Information");
        SaveFunction({ preventDefault: function () { } });
    }else if(activeIndex == 1){
        console.log("General Settings");
        saveGeneralSetting();
    }else if(activeIndex == 2){
        console.log("Security");
        updateComapanySecurity();
    }else if(activeIndex == 3){
        console.log("Reminders");
        updateReminder();
    }else if(activeIndex == 4){
        console.log("eMail Setup");
        updateEmail();
    }else if(activeIndex == 5){
        console.log("SMS setup");
        updateSMS();
    }else if(activeIndex == 6){
        console.log("Customization");
    }else if(activeIndex == 7){
        console.log("Custom Fields");
        saveIsCustomField();
    }
 }

 function saveGeneralSetting(){
    var formData = {
            currencyID : $("select[name='currencyID']").val(),
            weightID : $("select[name='weightID']").val(),
            salesOrderBoard : $("#salesOrderBoard").is(":checked"),
            itemReceivedBoard : $("#itemReceivedBoard").is(":checked"),
            showUSAInBillShipAddress : $("#showUSAInBillShipAddress").is(":checked"),
            poboard : $("#poboard").is(":checked"),
            itemShippedBoard : $("#itemShippedBoard").is(":checked")
        };
        console.log("Form Data:", formData); // Debugging
        // Send AJAX POST request
        $.ajax({
            type: "POST",
            url: "/api/save/general-setting",
            data: JSON.stringify(formData),
            contentType: "application/json", // Send as JSON
            success: function (response) {
                console.log("Server Response:", response);

                // If response is exactly false
                if (response === false) {
                    alert("User's company information already exists.");
                } else {
                    alert("Data saved successfully!");
                }
            },
            error: function (xhr, status, error) {
                alert("Error while saving data!");
                console.error("Error:", xhr.responseText || error);
            }
        });
 }

function updateComapanySecurity()
{
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;

	var errorMessage="";
	if(password == "" || password == null || confirmPassword == "" || confirmPassword == null){
        errorMessage = "<h3><spring:message code='BzComposer.signin.pleaseenterpassword'/></h3>";
    }
    else if(password != confirmPassword){
        errorMessage = "<h3><spring:message code='BzComposer.common.bothPwdsNotMatch'/></h3>";
    }
	if(errorMessage !=""){
		document.getElementById("errorsPWD").innerHTML = errorMessage;
		return false;
		event.preventDefault();
	}
	else
	{
		$.ajax({
			type: "POST",
			url:"/api/save/update-password/"+password,
 			success : function() {
 			    document.getElementById("errorsPWD").innerHTML = "<h3>Record updated</h3>";
	   		},
			error : function(data) {
				event.preventDefault();
				$("#errorOccurred").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			            "Ok": function () {
			                $(this).dialog("close");
			            }
			        }
			    });
			    return false;
			}
		});
	}
}

function updateReminder(){
    var formData = {
        invoiceMemo:$('input[name="invoiceMemo"]:checked').val(),
        invoiceMemoDays:$("#invoiceMemoDays").val(),
        memorizeEstimation:$('input[name="memorizeEstimation"]:checked').val(),
        memorizeEstimationDays:$("#memorizeEstimationDays").val(),
        overdueInvoice:$('input[name="overdueInvoice"]:checked').val(),
        overdueInvoiceDays:$("#overdueInvoiceDays").val(),
        inventoryOrder:$('input[name="inventoryOrder"]:checked').val(),
        inventoryOrderDays:$("#inventoryOrderDays").val(),
        serviceBilling:$('input[name="serviceBilling"]:checked').val(),
        serviceBillingDays:$("#serviceBillingDays").val(),
        billsToPay:$('input[name="billsToPay"]:checked').val(),
        billsToPayDays:$("#billsToPayDays").val(),
        memorizePurchaseOrder:$('input[name="memorizePurchaseOrder"]:checked').val(),
        memorizePurchaseOrderDays:$("#memorizePurchaseOrderDays").val(),
        memorizeBill:$('input[name="memorizeBill"]:checked').val(),
        memorizeBillDays:$("#memorizeBillDays").val(),
    }
    console.log("Form Data:", formData);
    $.ajax({
            type: "POST",
            url: "/api/save/update-reminder-setting",
            data: JSON.stringify(formData),
            contentType: "application/json", // Send as JSON
            success: function (response) {
                console.log("Server Response:", response);

                // If response is exactly false
                if (response === false) {
                    alert("User's company information already exists.");
                } else {
                    alert("Data saved successfully!");
                }
            },
            error: function (xhr, status, error) {
                alert("Error while saving data!");
                console.error("Error:", xhr.responseText || error);
            }
        });
    
}

function updateEmail(){
    var formData = {
        mailServer:$("#mailServer").val(),
        senderEmail:$("#senderEmail").val()
    }
    console.log("Form Data:", formData);
    $.ajax({
            type: "POST",
            url: "/api/save/update-email-details",
            data: JSON.stringify(formData),
            contentType: "application/json", // Send as JSON
            success: function (response) {
                console.log("Server Response:", response);

                // If response is exactly false
                if (response === false) {
                    alert("User's company information already exists.");
                } else {
                    alert("Data saved successfully!");
                }
            },
            error: function (xhr, status, error) {
                alert("Error while saving data!");
                console.error("Error:", xhr.responseText || error);
            }
        });
    
}

function updateSMS(){
    var formData = {
        twilioAccountSid:$("#twilioAccountSid").val(),
        twilioAuthToken:$("#twilioAuthToken").val(),
        twilioPhoneNumber:$("#twilioPhoneNumber").val()
    }
    console.log("Form Data:", formData);
    $.ajax({
            type: "POST",
            url: "/api/save/update-sms-details",
            data: JSON.stringify(formData),
            contentType: "application/json", // Send as JSON
            success: function (response) {
                console.log("Server Response:", response);

                // If response is exactly false
                if (response === false) {
                    alert("User's company information already exists.");
                } else {
                    alert("Data saved successfully!");
                }
            },
            error: function (xhr, status, error) {
                alert("Error while saving data!");
                console.error("Error:", xhr.responseText || error);
            }
        });
    
}

function saveIsCustomField(){
    var isEmployeeCustomField = $("#isEmployeeCustomField").is(":checked");
    
    $.ajax({
            type: "POST",
            url: "/api/save/save-is-custom-field/"+isEmployeeCustomField,
            data: null,
            success: function (response) {
                alert("Data saved successfully!");
            },
            error: function (xhr, status, error) {
                alert("Error while saving data!");
                console.error("Error:", xhr.responseText || error);
            }
        });
    
}

function setactivate() {
	var sel = document.getElementById("NotSelectedCustomerBoardTab");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;

	var sel1 = document.getElementById("SelectedCustomerBoardTab");
	sel.remove(sel.selectedIndex);

	var opt = document.createElement('option');
	opt.appendChild( document.createTextNode(selectValue) );
	opt.value = selectValue1;
	sel1.appendChild(opt);
	if(selectValue1 != ""){
		updateTabCustomization(selectValue1, 1);
	}
}

function setdeactivate() {
	var sel = document.getElementById("SelectedCustomerBoardTab");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;

	var sel1 = document.getElementById("NotSelectedCustomerBoardTab");
	sel.remove(sel.selectedIndex);

	var opt = document.createElement('option');
	opt.appendChild( document.createTextNode(selectValue) );
	opt.value = selectValue1;
	sel1.appendChild(opt);
	if(selectValue1 != ""){
		updateTabCustomization(selectValue1, 0);
	}
}

function updateTabCustomization(tabId, active){
	$.ajax({
		type : "POST",
		url :  "/Customization/update-tab-customization?tabId="+tabId+"&active="+active,
		data : null,
		success : function(data) {
			console.log("Success")
		},
		error : function(data) {
			alert("<spring:message code='BzComposer.common.erroroccurred'/>");
		}
	});
}

function getECustomFieldList() {
	$.ajax({
		type: "GET",
		url: "/get-custom-field-list/EmployeeBoard",
		success: function(data) {
			console.log(data);

			let rows = "";

			if (data && data.length > 0) {
				document.getElementById("eCustomFieldDataSize").value = data.length;
				$.each(data, function(index, item) {
					var indexd = Number(index) + 1;
					var rowId = index + "ecfIndex";

					rows += "<tr id='" + rowId + "' onclick=\"selectECFData(" + item.customFieldID + ", '" + rowId + "')\">"
						+ "<td>" + indexd + "</td>"
						+ "<td>Tag " + item.fieldKey + "</td>"
						+ "<td>" + item.displayName + "</td>"
						+ "<td>" + item.fieldType + "</td>"
						+ "<td>" + (item.isShowList == 1 ? "Yes" : "No") + "</td>"
						+ "<td>" + (item.isActive == 1 ? "Active" : "Inactive") + "</td>"
						+ "</tr>";
				});
			} else {
				rows = `
					<tr>
						<td colspan="6" style="text-align:center;">No data found</td>
					</tr>
				`;
			}

			$("#eCustomFieldTableBody").html(rows);
		},
		error: function(error) {
			console.log(error);
			alert("Error occurred");
		}
	});
}

function openAddFields() {
	$("#AddFields").dialog({
		modal: true,
		title: "Add Employee Custom Field",
		width: 650,
		height: 400,
		resizable: false,
		draggable: true,

		position: {
			my: "center top",
			at: "center top+200",
			of: window
		}
	});
}

function openEditFields() {
    debugger;
	var id = document.getElementById("selectedECustomFieldId").value;
	if(id == ""){
		alert("Please select any row first.");
		return;
	}
	getCCustomFieldData(id);
	$("#EditFields").dialog({
		modal: true,
		title: "Edit Employee Custom Field",
		width: 650,
		height: 400,
		resizable: false,
		draggable: true,

		position: {
			my: "center top",
			at: "center top+200",
			of: window
		}
	});
}

function selectECFData(selectedCustomFieldID, cfID){
    debugger;
    var size = document.getElementById('eCustomFieldDataSize').value;
    for(i=0; i<size; i++){
        if(document.getElementById(i+"ecfIndex").classList.contains('draft')){
            document.getElementById(i+"ecfIndex").classList.remove('draft');
        }
    }
    document.getElementById(cfID).className = "draft";
    document.getElementById('selectedECustomFieldId').value = selectedCustomFieldID;
}

function saveFieldData() {
	var displayName = ($("#displayName").val() || "").trim();
	var fieldType = $("#fieldType").val() || "";

	var isRequired = $("#isRequired").is(":checked") ? 1 : 0;
	var isShowList = $("#isShowList").is(":checked") ? 1 : 0;
	var isActive = $("#isActive").is(":checked") ? 1 : 0;

	if (displayName === "") {
		alert("Please enter display name");
		$("#displayName").focus();
		return false;
	}

	if (fieldType === "") {
		alert("Please select field type");
		$("#fieldType").focus();
		return false;
	}
	const payload = {
		displayName: displayName,
		fieldType: fieldType,
		isRequired: isRequired,
		isShowList: isShowList,
		isActive: isActive,
        boardType: "EmployeeBoard"
	};
	$.ajax({
		type: "POST",
		url:"/add-custom-field",
		data: payload,
		success : function(data){
			if(data == "Success"){
				resetFieldData()
				closeAddFieldsDialog();
				getECustomFieldList();
				
			}else if(data == "Failed"){
				resetFieldData();
				closeAddFieldsDialog();
				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			}else if(data == "Duplicate"){
				alert("Duplicate display name");
			}else if(data == "Maximum"){
				resetFieldData();
				closeAddFieldsDialog();
				alert("Maximum 8 custom fields are allowed.");
			}
		},
		error : function(error) {
			console.log(error);
			alert("<bean:message key='BzComposer.common.erroroccurred'/>");
		}
	});
	return true;
}
function resetFieldData() {
	selectedForm = "";
	$("#displayName").val("");
	$("#fieldType").val("");
	$("#isRequired").prop("checked", false);
	$("#isShowList").prop("checked", false);
	$("#isActive").prop("checked", false);
	$("#displayName").focus();
}

function updateFieldData() {
	var id = $("#selectedECustomFieldId").val();
	var displayName = ($("#editDisplayName").val() || "").trim();
	var fieldType = $("#editFieldType").val() || "";

	var isRequired = $("#editIsRequired").is(":checked") ? 1 : 0;
	var isShowList = $("#editIsShowList").is(":checked") ? 1 : 0;
	var isActive = $("#editIsActive").is(":checked") ? 1 : 0;

	if (displayName === "") {
		alert("Please enter display name");
		$("#editDisplayName").focus();
		return false;
	}

	if (fieldType === "") {
		alert("Please select field type");
		$("#editFieldType").focus();
		return false;
	}
	
	const payload = {
		customFieldID: id,
		displayName: displayName,
		fieldType: fieldType,
		isRequired: isRequired,
		isShowList: isShowList,
		isActive: isActive,
		boardType: "EmployeeBoard"
	};
	$.ajax({
		type: "POST",
		url:"/update-custom-field",
		data: payload,
		success : function(data){
			if(data == "Success"){
				resetFieldData();
				closeEditFieldsDialog();
				getECustomFieldList();
			}else if(data == "Failed"){
				closeEditFieldsDialog();
				resetFieldData();
				alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			}
		},
		error : function(error) {
			console.log(error);
			alert("<bean:message key='BzComposer.common.erroroccurred'/>");
		}
	});

	return true;
}

function closeAddFieldsDialog() {
	$("#AddFields").dialog("close");
}
function closeEditFieldsDialog() {
	$("#EditFields").dialog("close");
}

function getCCustomFieldData(id){
	$.ajax({
		type: "GET",
		url: "/get-custom-field/" + id,
		success: function(data) {
			document.getElementById('editDisplayName').value = data.displayName || "";
			document.getElementById('editFieldType').value = data.fieldType || "";
			document.getElementById('editIsRequired').checked = data.isRequired == 1;
			document.getElementById('editIsShowList').checked = data.isShowList == 1;
			document.getElementById('editIsActive').checked = data.isActive == 1;

			// options section show/hide
			if (data.fieldType === "Dropdown") {
				$("#editOptionsSection").show();
			} else {
				$("#editOptionsSection").hide();
			}

			// set dropdown options
			var container = $("#editOptionsContainer");
			container.html("");

			if (data.dropDownOptions && data.dropDownOptions.trim() !== "") {
				var options = data.dropDownOptions.split(",");

				$.each(options, function(index, option) {
					var buttonHtml = index === 0
						? '<button type="button" class="btn btn-info custom-btn addOptionBtn" style="margin-left: 5px; width: 114px;">Add</button>'
						: '<button type="button" class="btn btn-danger removeOptionBtn" style="margin-left: 5px; width: 114px;">Remove</button>';

					var row = '<div class="option-row d-flex mb-2">'
						+ '<input type="text" name="editOptions[]" class="form-control" placeholder="Enter option" value="' + option.trim() + '" />'
						+ buttonHtml
						+ '</div>';

					container.append(row);
				});
			} else {
				container.append(
					'<div class="option-row d-flex mb-2">'
					+ '<input type="text" name="editOptions[]" class="form-control" placeholder="Enter option" />'
					+ '<button type="button" class="btn btn-info custom-btn addOptionBtn" style="margin-left: 5px; width: 114px;">Add</button>'
					+ '</div>'
				);
			}
		},
		error: function(error) {
			console.log(error);
			alert("Error occurred");
		}
	});
}

function deleteDilog(){
	var id = document.getElementById("selectedECustomFieldId").value;
	if(id == ""){
		alert("Please select any row first.");
		return;
	}
	$("#deleteDialog").dialog({
		title: "Delete Customer Custom Field",
		resizable: false,
		height: 200,
		width: 500,
		modal: true,
		position: {
			my: "center top",
			at: "center top+200",
			of: window
		},
		buttons: {
			"<spring:message code='BzComposer.global.ok' />": function() {
				$(this).dialog("close");
				$.ajax({
					url: "/delete-custom-field/"+id,
					type: "POST",
					data: null,
					success: function(response) {
						getECustomFieldList();
						alert("deleted successfully!");
					},
					error: function(xhr, status, error) {
						console.error("Error deleting:", error);
						alert("Failed to delete. Please try again.");
					}
				});
			},
			"<spring:message code='BzComposer.global.cancel' />": function() {
				$(this).dialog("close");
				return false;
			}
		}
	});
}

</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
    <p>
        <spring:message code="BzComposer.configuration.saveconfirm" />
    </p>
</div>
<div id="serverConnectedErrorDialog" style="display:none;">
    <p>
        <spring:message code="BzComposer.configuration.manageservicetype.serverconnectederror" />
    </p>
</div>
<div id="serverConnectedSeccessDialog" style="display:none;">
    <p>
        <spring:message code="BzComposer.configuration.manageservicetype.serverconnectedsuccess" />
    </p>
</div>
<div id="pleaseWaitDialog" style="display:none;">
    <p>
        <spring:message code="BzComposer.configuration.pleaseWait" />
    </p>
</div>
<div id="deleteDialog" style="display: none;">
	<p>Are you sure you want to delete the selected field?</p>
</div>