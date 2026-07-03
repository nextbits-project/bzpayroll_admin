<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <jsp:include page="/WEB-INF/jsp/include/headlogo.jsp" />
        <jsp:include page="/WEB-INF/jsp/include/header.jsp" />
        <jsp:include page="/WEB-INF/jsp/include/menu.jsp" />
        <title><spring:message code="BzComposer.generaltitle" /></title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
        <link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
        <script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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
select[id^="dm-list-"]:focus, select[id^="dm-list-"]:active {
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

    </head>

    <script>
        function toggleFunction() {
            debugger;
            var x = document.getElementById("divtoggle");
            var lftmenu = document.getElementById("leftMenu");
            if (x.style.display === "none") {
                x.style.display = "block";
                lftmenu.style.width = "180px";
                lftmenu.style.position = "relative";
                /* document.getElementById("togglebtn").value = "+"; */
            } else {
                x.style.display = "none";
                lftmenu.style.width = "0";
                lftmenu.style.position = "absolute";
                /* document.getElementById("togglebtn").value = "-"; */
            }
        }
    </script>
    <script type="text/javascript">
        function showLocale()
        {
        var lang = document.getElementById("locale").value;
            var locale = "<%= request.getAttribute("selectedLocale")%>";

            if (lang == "" && locale != "")
            {
                $('select[id="locale"]').find('option[value="' + locale + '"]').attr("selected", true);
                return showLanguageDialog();
            } else
            {
                window.location = "./changeLocale?lang=" + lang;
            }
        }
        function showLanguageDialog()
        {
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

        $(document).ready(function ()
        {

            // Top-level sections now controlled by sidebar ?tab= URL param
            // $("#tabs").tabs(); -- removed, sections shown by JSP scriptlet

        var isSOBChecked = "<%= request.getAttribute("isSOBChecked")%>";
        var isISBChecked = "<%= request.getAttribute("isISBChecked")%>";
        var isIRBChecked = "<%= request.getAttribute("isIRBChecked")%>";
        var isPOBChecked = "<%= request.getAttribute("isPOBChecked")%>";
            var isSelectedWeightID = "<%= request.getAttribute("isSelectedWeightID")%>";

            $('select[id="weightID"]').find('option[value="' + isSelectedWeightID + '"]').attr("selected", true);

            $('#salesOrderBoard').change(function ()
            {
                var isChecked = isSOBChecked;
                if ($(this).prop("checked") == true)
                {
                    $("#salesOrderBoard").attr('checked', true);
                    isChecked = "on";
                } else if ($(this).prop("checked") == false)
                {
                    $("#salesOrderBoard").attr('checked', false);
                    isChecked = "off";
                } else
                {
                    $("#salesOrderBoard").attr('checked', isChecked);
                }
                document.configurationForm.salesOrderBoard.value = isChecked;
                $("#salesOrderBoard").val(isChecked);
            });
            $('#itemReceivedBoard').change(function ()
            {

                var isChecked = isIRBChecked;
                if ($(this).prop("checked") == true)
                {
                    $("#itemReceivedBoard").attr('checked', true);
                    isChecked = "on";
                } else if ($(this).prop("checked") == false)
                {
                    $("#itemReceivedBoard").attr('checked', false);
                    isChecked = "off";
                } else
                {
                    $("#itemReceivedBoard").attr('checked', isChecked);
                }
                document.configurationForm.itemReceivedBoard.value = isChecked;
                $("#itemReceivedBoard").val(isChecked);
            });
            $('#poboard').change(function ()
            {
                var isChecked = isPOBChecked;
                if ($(this).prop("checked") == true)
                {
                    $("#poboard").attr('checked', true);
                    isChecked = "on";
                } else if ($(this).prop("checked") == false)
                {
                    $("#poboard").attr('checked', false);
                    isChecked = "off";
                } else
                {
                    $("#poboard").attr('checked', isChecked);
                }
                document.configurationForm.poboard.value = isChecked;
                $("#poboard").val(isChecked);
            });
            $('#itemShippedBoard').change(function ()
            {
                var isChecked = isISBChecked;

                if ($(this).prop("checked") == true)
                {
                    $("#itemShippedBoard").attr('checked', true);
                    isChecked = "on";
                } else if ($(this).prop("checked") == false)
                {
                    $("#itemShippedBoard").attr('checked', false);
                    isChecked = "off";
                } else
                {
                    $("#itemShippedBoard").attr('checked', isChecked);
                }
                document.configurationForm.itemShippedBoard.value = isChecked;
                $("#itemShippedBoard").val(isChecked);
            });
        });
        function TestConnection()
        {
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
        function CheckEmailConnection()
        {
            $('#pleaseWaitDialog').dialog("close");
            if (oEmail.readyState != 4 || oEmail.status != 200) {
                return;
            }
            response = parseInt(trim(oEmail.responseText));
            if (response == 1)
            {
                return serverConnectedSeccessDialog();
                document.configurationForm.mailAuth.disabled = false;
                EnableDisableFields2();
            } else
            {
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
    <form:form name="configurationForm" enctype="MULTIPART/FORM-DATA" method="post" modelAttribute="configDto">
        <div id="ddcolortabsline">&nbsp;</div>
        <div id="cos">
            <div class="statusquo ok">
                <div id="hoja">
                    <div id="blanquito">
                        <div id="padding">
                            <div class="settings-page-header">
                                <span class="settings-page-title">SETTINGS</span>
                                <div class="settings-page-actions">
                                    <input class="formbutton" type="button" value="<spring:message code='BzComposer.global.save'/>" onclick="handleGeneralTopSave()">
                                    <input class="formbutton" type="button" value="<spring:message code='BzComposer.global.cancel'/>" onclick="handleGeneralTopCancel()">
                                </div>
                            </div>
                            <div>
                                <div>
                                    <c:if test="${not empty Labels}">
                                        <input type="hidden" name="lsize" id="lblsize" value='${Labels.size()}' />
                                        <c:forEach items="${Labels}" var="lbl" varStatus="loop">
                                            <input type="hidden" id='${loop.index}lid' name='${loop.index}lidname' value='${lbl.value}' />
                                            <input type="hidden" id='${loop.index}lname' name='${loop.index}lnm' value='${lbl.label}' />
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div id="table-negotiations" style="padding: 0; border: 1px solid #ccc; margin-top: 15px;">
                                    <table cellspacing="0" style="border: 0; padding: 0; width: 100%;overflow-y:scroll;" class="">
                                        <!-- <tr>
                                                <td>
                                                        <span style="font-size:30px;cursor:pointer; margin-left: 30px;" onclick="toggleFunction()">&#9776;</span>
                                                </td>
                                                <td></td>
                                        </tr> -->
                                        <tr>
                                        <!-- Three line side bar menu -->
                                        <!-- <span style="font-size:30px;cursor:pointer; margin-left: 20px; float: left;" onclick="toggleFunction()">&#9776;</span> -->
                                        <td id="leftMenu" style="position: relative; width: 165px; vertical-align: top;">
                                            <div style="display: flex; justify-content: flex-start; align-items: flex-start; width: 165px;">
                                                <table>
                                                    <tr>
                                                        <td style="vertical-align: top;">
                                                            <div>
                                                                <jsp:include page="menuPage.jsp" />
                                                            </div>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                        <td valign="top">
                                            <!-- general page content starts -->
                                            <div id="general" style="padding: 0; position: relative; left: 0;">
                                                <div id="tabs" style="height: auto; border: none; padding: 0;">
                                                     <div id="datamanager">
                                                          <div id="content1" class="tabPage">

                                                              <!-- Data Manager 7-Column Grid - BZComposer Style -->
                                                              <div id="dm-wrapper" style="border:none; font-family:Arial,sans-serif; font-size:12px;">

                                                                  <!-- Header Bar -->
                                                                  <div style="text-align:left; padding-left: 15px; height: 63px; display: flex; align-items: flex-end; margin-left: -5px; padding-bottom: 2px; box-sizing: border-box;">
                                                                      <h2 style='font-family: "Philosopher", "Bitstream Vera Sans", "Lucida Grande", "Trebuchet MS", Arial, Helvetica, sans-serif !important; color: #05A9C5 !important; font-weight: bold !important; border: none !important; font-size: 2.2em; margin: 0; padding: 0; line-height: 1;'>Data Manager</h2>
                                                                  </div>

                                                                  <!-- 7-column grid inner box -->
                                                                  <div style="border: 1px solid #ccc; margin: 0 10px 10px 0; padding:15px 8px 0 8px; overflow-x:auto;">
                                                                      <table style="width:100%; border-collapse:collapse; table-layout:fixed;">

                                                                          <!-- ROW 1 -->
                                                                          <tr>
                                                                              <!-- Salutation -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Salutation</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-salutation" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('salutation', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-salutation" class="dm-cat-btn" onclick="dmActivateCategory('salutation'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Salutation</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Business Type -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Business Type</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-business-type" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('business-type', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-business-type" class="dm-cat-btn" onclick="dmActivateCategory('business-type'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Business Type</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Job Title -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Job Title</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-job-title" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('job-title', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-job-title" class="dm-cat-btn" onclick="dmActivateCategory('job-title'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Job Title</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Payment Type -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Payment Type</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-payment-type" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('payment-type', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-payment-type" class="dm-cat-btn" onclick="dmActivateCategory('payment-type'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Payment Type</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Received Type -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Received Type</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-received-type" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('received-type', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-received-type" class="dm-cat-btn" onclick="dmActivateCategory('received-type'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Received Type</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Credit Card -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Credit Card</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-credit-card" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('credit-card', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-credit-card" class="dm-cat-btn" onclick="dmActivateCategory('credit-card'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Credit Card</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Message -->
                                                                              <td valign="top" style="padding:0 0 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Message</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-message" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('message', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-message" class="dm-cat-btn" onclick="dmActivateCategory('message'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Message</button>
                                                                                  </div>
                                                                              </td>
                                                                          </tr>

                                                                          <!-- ROW 2 -->
                                                                          <tr>
                                                                              <!-- Payroll Deductions -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Payroll Deductions</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-payroll-deduction" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('payroll-deduction', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-payroll-deduction" class="dm-cat-btn" onclick="dmActivateCategory('payroll-deduction'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Payroll Deductions</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Description -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Description</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-description" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('description', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-description" class="dm-cat-btn" onclick="dmActivateCategory('description'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Description</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- Employee Status -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                  <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                      <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Employee Status</th></tr>
                                                                                      <tr><td style="padding:0;"><select id="dm-list-employee-status" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('employee-status', this)"></select></td></tr>
                                                                                  </table>
                                                                                  <div style="text-align:center; margin-top:2px;">
                                                                                      <button id="dm-btn-description" class="dm-cat-btn" onclick="dmActivateCategory('employee-status'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Employee Status</button>
                                                                                  </div>
                                                                              </td>
                                                                              <!-- payroll type -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                    <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Payroll Type</th></tr>
                                                                                    <tr><td style="padding:0;"><select id="dm-list-payroll-type" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('payroll-type', this)"></select></td></tr>
                                                                                </table>
                                                                                <div style="text-align:center; margin-top:2px;">
                                                                                    <button id="dm-btn-description" class="dm-cat-btn" onclick="dmActivateCategory('payroll-type'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Payroll Type</button>
                                                                                </div>
                                                                              </td>
                                                                              <!-- pay period -->
                                                                              <td valign="top" style="padding:0 4px 8px 0; width:14.28%;">
                                                                                <table style="border:none; border-collapse:collapse; width:100%;">
                                                                                    <tr><th style="background:#C3C5C7; color:#333; font-size:12px; padding:4px 6px; text-align:center; white-space:nowrap; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; font-weight:bold;">Pay Period</th></tr>
                                                                                    <tr><td style="padding:0;"><select id="dm-list-pay-period" size="8" style="width:140px; height:180px; font-size:12px; border:1px solid #cccccc; border-radius:3px; outline:none; padding:2px; margin-top:3px; margin-bottom:3px;" onclick="dmSelectItem('pay-period', this)"></select></td></tr>
                                                                                </table>
                                                                                <div style="text-align:center; margin-top:2px;">
                                                                                    <button id="dm-btn-description" class="dm-cat-btn" onclick="dmActivateCategory('pay-period'); return false;" style="background-color:#05A9C5; color:white; cursor:pointer; padding:5px; border-radius:2px; border:0px; font-size:12px;">Pay Period</button>
                                                                                </div>
                                                                              </td>
                                                                              <td colspan="5" valign="bottom" align="center" style="padding-top:20px; padding-bottom: 0;">
                                                                                  <!-- CRUD Panel - BZComposer Style -->
                                                                                  <div style="background:#fff; padding:0; text-align:center; width: 100%;">
                                                                                      <h2 id="dm-active-category" style="margin:0 0 15px 0; font-size:22px; color:#222; font-weight:bold; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif;">Set the Values</h2>
                                                                                      
                                                                                      <div style="margin-bottom: 5px; display: inline-block;">
                                                                                          <label style="display:block; font-size:14px; font-weight:bold; margin-bottom:8px; font-family:'Bitstream Vera Sans', 'Lucida Grande', 'Trebuchet MS', Arial, Helvetica, sans-serif; color:#222;">Description</label>
                                                                                          <textarea id="dm-input-name" style="padding:6px; font-size:13px; border:1px solid #ccc; width:240px; height:70px; border-radius:4px; outline:none; resize:none;"></textarea>
                                                                                      </div>
                                                                                      
                                                                                      <div style="min-height: 18px; margin-bottom: 2px;">
                                                                                          <span id="dm-status-msg" style="font-size:13px; color:green; display:inline-block;"></span>
                                                                                      </div>
                                                                                      
                                                                                      <div style="margin-top: 0px; padding-bottom: 1px; line-height: 0;">
                                                                                          <input type="button" class="formbutton" onclick="dmAdd(); return false;" style="font-size:15px; padding:14px 14px; margin:0 2px 0 2px; background-color:#05A9C5; color:white; border:none; border-radius:3px 3px 0 0; cursor:pointer;" value="Add" />
                                                                                          <input type="button" class="formbutton" onclick="dmUpdate(); return false;" style="font-size:15px; padding:14px 14px; margin:0 2px 0 2px; background-color:#05A9C5; color:white; border:none; border-radius:3px 3px 0 0; cursor:pointer;" value="Update" />
                                                                                          <input type="button" class="formbutton" onclick="return false;" style="font-size:15px; padding:14px 14px; margin:0 2px 0 2px; background-color:#05A9C5; color:white; border:none; border-radius:3px 3px 0 0; cursor:pointer;" value="Default" />
                                                                                          <input type="button" class="formbutton" onclick="dmDelete(); return false;" style="font-size:15px; padding:14px 14px; margin:4px 2px 4px 2px; background-color:#05A9C5; color:white; border:none; border-radius:3px 3px 0 0; cursor:pointer;" value="Delete" />
                                                                                          <input type="button" class="formbutton" onclick="dmClear(); return false;" style="font-size:15px; padding:14px 14px; margin:0 2px 0 2px; background-color:#05A9C5; color:white; border:none; border-radius:3px 3px 0 0; cursor:pointer;" value="Clear" />
                                                                                      </div>
                                                                                      
                                                                                      <input type="hidden" id="dm-selected-id" value="" />
                                                                                      <input type="hidden" id="dm-selected-category" value="" />
                                                                                  </div>
                                                                              </td>
                                                                          </tr>

                                                                      </table>
                                                                  </div>

                                                              </div>

                                                          </div>
                                                     </div>
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
                                        <input type="hidden" name="salesOrderBoard" value=""/>
                                        <input type="hidden" name="itemReceivedBoard" value=""/>
                                        <input type="hidden" name="itemShippedBoard" value=""/>
                                        <input type="hidden" name="poboard" value=""/>
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
</body>




<script>
// Get references
const phoneInput = document.getElementById("phone");
const mobileInput = document.getElementById("mobileNumber");
const sameAsPhoneCheckbox = document.getElementById("sameAsPhone");

// On checkbox change
sameAsPhoneCheckbox.addEventListener("change", function() {
    if (this.checked) {
        mobileInput.value = phoneInput.value; // copy value
        mobileInput.readOnly = true;          // optional: make mobile read-only
    } else {
        mobileInput.readOnly = false;         // allow editing
    }
});

// Optional: update mobile number live if phone changes while checkbox is checked
phoneInput.addEventListener("input", function() {
    if (sameAsPhoneCheckbox.checked) {
        mobileInput.value = phoneInput.value;
    }
});

</script>
<script type="text/javascript">
    EnableDisableFields2();
    function SaveValues(evt)
    {
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

                    /* document.configurationForm.currencyID.value = parseInt(document.configurationForm.currencyID.value);
                     var currencyValue = $.trim($("#currencyID option:selected").text());

                     document.configurationForm.weightID.value = parseInt(document.configurationForm.weightID.value);
                     var weightName =$.trim($("#weightID option:selected").text());

                     document.configurationForm.defaultLabelID.value = document.configurationForm.defaultLabelID.value;
                     var labelValue = $.trim($("#defaultLabelID option:selected").text());

                     document.configurationForm.filterOption.value = document.configurationForm.filterOption.value;
                     var filterOption = $.trim($("#filterOption option:selected").text());

                     document.configurationForm.moduleID.value = document.configurationForm.moduleID.value;
                     var moduleName = $.trim($("#moduleID option:selected").text());
                     //Added by tulsi


                     document.configurationForm.salesOrderBoard.value = document.configurationForm.salesOrderBoard.value;
                     document.configurationForm.itemReceivedBoard.value = document.configurationForm.itemReceivedBoard.value;
                     document.configurationForm.poboard.value = document.configurationForm.poboard.value;
                     document.configurationForm.itemShippedBoard.value = document.configurationForm.itemShippedBoard.value; */

                    /*first checkbox for showReminder*/
                    //document.configurationForm.showReminder.value = $("#showReminder").val();

                    /*Radio Button values- Either 0 or 1*/
                    /* document.configurationForm.invoiceMemo.value = document.configurationForm.invoiceMemo.value;
                     document.configurationForm.overdueInvoice.value = document.configurationForm.overdueInvoice.value;
                     document.configurationForm.inventoryOrder.value = document.configurationForm.inventoryOrder.value;
                     document.configurationForm.billsToPay.value = document.configurationForm.billsToPay.value;
                     document.configurationForm.memorizeEstimation.value = document.configurationForm.memorizeEstimation.value;
                     document.configurationForm.serviceBilling.value = document.configurationForm.serviceBilling.value;
                     document.configurationForm.memorizeBill.value = document.configurationForm.memorizeBill.value;
                     document.configurationForm.memorizePurchaseOrder.value = document.configurationForm.memorizePurchaseOrder.value; */

                    /*All RadioButton Days value*/
                    /* document.configurationForm.invoiceMemoDays.value = document.configurationForm.invoiceMemoDays.value;
                     document.configurationForm.overdueInvoiceDays.value = document.configurationForm.overdueInvoiceDays.value;
                     document.configurationForm.inventoryOrderDays.value = document.configurationForm.inventoryOrderDays.value;
                     document.configurationForm.billsToPayDays.value = document.configurationForm.billsToPayDays.value;
                     document.configurationForm.memorizeEstimationDays.value = document.configurationForm.memorizeEstimationDays.value;
                     document.configurationForm.memorizePurchaseOrderDays.value = document.configurationForm.memorizePurchaseOrderDays.value;
                     document.configurationForm.serviceBillingDays.value = document.configurationForm.serviceBillingDays.value;
                     document.configurationForm.memorizeBillDays.value = document.configurationForm.memorizeBillDays.value;
                     document.getElementById('showReminderStatus').value = $("#showReminder").val();*/
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
                    for (i = 0; i < x.length; i++)
                    {
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
    function SaveValuesFeatures()
    {
        if (confirm('<spring:message code="BzComposer.configuration.saveconfirm"/>'))
        {
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
                        for (i = 0; i < x.length; i++)
                        {
                            txt = txt + "\n" + x.options[i].text;
                        }
                        document.configurationForm.selectedModules.value = txt;

                        var x = document.getElementById("selectedModuleId");
                        var txt1 = "";
                        var i;
                        for (i = 0; i < x.length; i++)
                        {
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
        success: function(response) {
         console.log("Server Response:", response);

            // If response is exactly false
            if (response === false) {
                alert("User’s company information already exists.");
            } else {
                alert("Data saved successfully!");
            }
        },
        error: function(xhr, status, error) {
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
        SaveFunction({ preventDefault: function () {} });
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
// ========================
// DATA MANAGER CRUD JS
// ========================
var DM_CATEGORIES = [
    'salutation', 'business-type', 'job-title',
    'payment-type', 'received-type', 'credit-card',
    'message', 'payroll-deduction', 'description', 'employee-status', 'payroll-type', 'pay-period'
];

var DM_ACTIVE_CATEGORY = '';

function dmGetNameField(category, item) {
    if (category === 'job-title') return item.jobTitle;
    return item.name;
}

function dmLoadList(category) {
    $.ajax({
        url: '/api/data-manager/' + category,
        type: 'GET',
        success: function(data) {
            var sel = document.getElementById('dm-list-' + category);
            if (!sel) return;
            var prevSelectedId = document.getElementById('dm-selected-id').value;
            sel.innerHTML = '';
            data.forEach(function(item) {
                var opt = document.createElement('option');
                if(category == "employee-status"){
                    opt.value = item.employeeTypeId;
                    opt.text = item.employeeType;
                }else if(category == "payroll-type"){
                    opt.value = item.payrollTypeId;
                    opt.text = item.payrollType;
                }else if(category == "pay-period"){
                    opt.value = item.payPeriodId;
                    opt.text = item.payPeriod;
                }else{
                    opt.value = item.id;
                    opt.text = dmGetNameField(category, item);
                }
                sel.appendChild(opt);
            });
            sel.selectedIndex = -1;
        },
        error: function() { console.error('Failed to load: ' + category); }
    });
}

function dmLoadAll() {
    DM_CATEGORIES.forEach(function(cat) { dmLoadList(cat); });
}

// Called when category button is clicked (sets active category)
function dmActivateCategory(category) {
    DM_ACTIVE_CATEGORY = category;
    document.getElementById('dm-selected-category').value = category;
    document.getElementById('dm-selected-id').value = '';
    document.getElementById('dm-input-name').value = '';
    document.getElementById('dm-status-msg').innerText = '';

    // Highlight the active button, reset others
    DM_CATEGORIES.forEach(function(cat) {
        var btn = document.getElementById('dm-btn-' + cat);
        if (btn) {
            btn.style.background = (cat === category) ? '#038fa8' : '#05A9C5';
            btn.style.color = '#fff';
            btn.style.border = 'none';
            btn.style.fontWeight = (cat === category) ? 'bold' : 'normal';
        }
        // Deselect lists that are not the active category
        var sel = document.getElementById('dm-list-' + cat);
        if (sel && cat !== category) sel.selectedIndex = -1;
    });

    // Update title
    var label = category.replace(/-/g, ' ').replace(/\b\w/g, function(c){ return c.toUpperCase(); });
    document.getElementById('dm-active-category').innerText = label;
}

// Called when an item inside a list is clicked
function dmSelectItem(category, selectEl) {
    // Activate this category
    dmActivateCategory(category);

    var opt = selectEl.options[selectEl.selectedIndex];
    if (opt) {
        document.getElementById('dm-selected-id').value = opt.value;
        document.getElementById('dm-input-name').value = opt.text;
    }
    document.getElementById('dm-status-msg').innerText = '';
}

function dmSetStatus(msg, isError) {
    var el = document.getElementById('dm-status-msg');
    el.innerText = msg;
    el.style.color = isError ? 'red' : 'green';
}

function dmAdd() {
    var category = document.getElementById('dm-selected-category').value;
    var name = document.getElementById('dm-input-name').value.trim();
    if (!category) { dmSetStatus('Please select a category first by clicking a category button.', true); return; }
    if (!name) { dmSetStatus('Please enter a value.', true); return; }
    $.ajax({
        url: '/api/data-manager/' + category,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({name: name}),
        success: function() {
            dmSetStatus('Added successfully!', false);
            dmLoadList(category);
            document.getElementById('dm-input-name').value = '';
            document.getElementById('dm-selected-id').value = '';
        },
        error: function(xhr) { dmSetStatus('Error: ' + (xhr.responseText || 'Add failed'), true); }
    });
}

function dmUpdate() {
    var id = document.getElementById('dm-selected-id').value;
    var category = document.getElementById('dm-selected-category').value;
    var name = document.getElementById('dm-input-name').value.trim();
    if (!category) { dmSetStatus('Please select a category first.', true); return; }
    if (!id) { dmSetStatus('Please select an item from the list to update.', true); return; }
    if (!name) { dmSetStatus('Please enter a value.', true); return; }
    $.ajax({
        url: '/api/data-manager/' + category + '/' + id,
        type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify({name: name}),
        success: function() {
            dmSetStatus('Updated successfully!', false);
            dmLoadList(category);
        },
        error: function(xhr) { dmSetStatus('Error: ' + (xhr.responseText || 'Update failed'), true); }
    });
}

function dmDelete() {
    var id = document.getElementById('dm-selected-id').value;
    var category = document.getElementById('dm-selected-category').value;
    if (!category) { dmSetStatus('Please select a category first.', true); return; }
    if (!id) { dmSetStatus('Please select an item from the list to delete.', true); return; }
    if (!confirm('Are you sure you want to delete this item?')) return;
    $.ajax({
        url: '/api/data-manager/' + category + '/' + id,
        type: 'DELETE',
        success: function() {
            dmSetStatus('Deleted successfully!', false);
            dmLoadList(category);
            document.getElementById('dm-input-name').value = '';
            document.getElementById('dm-selected-id').value = '';
        },
        error: function(xhr) { dmSetStatus('Error: ' + (xhr.responseText || 'Delete failed'), true); }
    });
}

function dmClear() {
    document.getElementById('dm-input-name').value = '';
    document.getElementById('dm-selected-id').value = '';
    document.getElementById('dm-status-msg').innerText = '';
    DM_CATEGORIES.forEach(function(cat) {
        var s = document.getElementById('dm-list-' + cat);
        if (s) s.selectedIndex = -1;
    });
}

$(document).ready(function() {
    dmLoadAll();
});
</script>

<script>
		$(document)
				.ready(
						function() {
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
											function() {
												var id = $(this).val();
												console
														.log("Selected Country ID: "
																+ id);

												$
														.ajax({
															type : 'GET',
															url : '/api/states',
															data : {
																id : id
															},
															dataType : 'json', //  Important: Expecting JSON
															success : function(result) {

																var s;
																 for (var i = 0; i < result.length; i++) { // use .length
                                                                        s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                                                                    }
                                                                    $('#sellectState').html(s);
															},
															error : function(
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
											function() {
												var id = $(this).val();
												console
														.log("Selected State ID: "
																+ id);

												$
														.ajax({
															type : 'GET',
															url : '/api/cities',
															data : {
																id : id
															}, // send as query param ?id=...
															dataType : 'json', // expecting JSON from server
															success : function(
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
															error : function(
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
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="serverConnectedErrorDialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.manageservicetype.serverconnectederror"/></p>
</div>
<div id="serverConnectedSeccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.manageservicetype.serverconnectedsuccess"/></p>
</div>
<div id="pleaseWaitDialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.pleaseWait"/></p>
</div>