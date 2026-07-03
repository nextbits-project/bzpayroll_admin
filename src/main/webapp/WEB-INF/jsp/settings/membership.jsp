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
                                                    <div id="Membership">
                                                         <jsp:include page="membership_content.jsp"/>
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

</html>