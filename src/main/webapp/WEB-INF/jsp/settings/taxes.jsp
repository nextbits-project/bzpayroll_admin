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
        <title><spring:message code="BzComposer.taxinfotitle" /></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
              integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
        <script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
        <style>
            .settings-page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 16px;
                margin: 30px 0px 15px 0px;
                border-bottom: 1px dotted #333;
                padding: 0 0 .3em 0;
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
        <script type="text/javascript">
            function toggleFunction() {
                debugger;
                var x = document.getElementById("divtoggle");
                var lftmenu = document.getElementById("leftMenu");
                if (x.style.display === "none") {
                    x.style.display = "block";
                    lftmenu.style.width = "180px";
                    lftmenu.style.position = "relative";
                } else {
                    x.style.display = "none";
                    lftmenu.style.width = "0";
                    lftmenu.style.position = "absolute";
                }
            }
            $(function ()
            {
                $("#tabs1").tabs();
                $("#tabs2").tabs();
                $("#tabs").tabs();
                $("#tabsFederalTax").tabs();
                $("#tabsEmployeeFederalTax").tabs({activate: function (event, ui) {
                        if (ui.newTab.index() == 0) {
                            $("#trFUTA").hide();
                            $("#trFIT").show();
                        } else if (ui.newTab.index() == 1) {
                            $("#trFUTA").show();
                            $("#trFIT").hide();
                        }

                    }});
                $("#tabsCompanyTaxOption").tabs();
                $("#tabsEmployeeStateTax").tabs();

                $("#resetSIDOthers").hide();
                $("#sitStateActive").hide();
                $("#sitStateInActive").hide();
                $("#setAsDefault").hide();
                $("#sitSave").hide();



                var isUPS = $("#isUPSActive").val();
                var isUSPS = $("#isUSPSActive").val();
                var isFedex = $("#isFeDexActive").val();

                /* alert("is UPS Active:"+isUPS+"\n is USPS Active:"+isUSPS+"\n is Fedex Active:"+isFedex); */

                if (isUPS == 1)
                {
                    $("#upsUserId").attr('readonly', true);
                    $("#upsPassword").attr('readonly', true);
                    $("#accessKey").attr('readonly', true);
                    $("#upsAccountNo").attr('readonly', true);
                    $("#isUPSActive").attr('checked', true);
                } else
                {
                    $("#upsUserId").attr('readonly', false);
                    $("#upsPassword").attr('readonly', false);
                    $("#accessKey").attr('readonly', false);
                    $("#upsAccountNo").attr('readonly', false);
                    $("#isUPSActive").attr('checked', false);
                }

                if (isUSPS == 1)
                {
                    $("#isUSPSActive").attr('checked', true);
                    $("#uspsUserId").attr('readonly', true);
                } else
                {
                    $("#isUSPSActive").attr('checked', false);
                    $("#uspsUserId").attr('readonly', false);
                }

                if (isFedex == 1)
                {
                    $("#fedexAccountNumber").attr('readonly', true);
                    $("#fedexMeterNumber").attr('readonly', true);
                    $("#fedexPassword").attr('readonly', true);
                    $("#fedexTestKey").attr('readonly', true);
                } else
                {
                    $("#fedexAccountNumber").attr('readonly', false);
                    $("#fedexMeterNumber").attr('readonly', false);
                    $("#fedexPassword").attr('readonly', false);
                    $("#fedexTestKey").attr('readonly', false);
                }
                $("#weekendSaturday").click(function () {
                    if ($(this).is(":checked")) {
                        $("#weekendSaturdayRate").removeAttr("disabled");
                        $("#weekendSaturdayRate").focus();
                    } else {
                        $("#weekendSaturdayRate").attr("disabled", "disabled");
                    }
                });

                $("#weekendSunday").click(function () {
                    if ($(this).is(":checked")) {
                        $("#weekendSundayRate").removeAttr("disabled");
                        $("#weekendSundayRate").focus();
                    } else {
                        $("#weekendSundayRate").attr("disabled", "disabled");
                    }
                });

                $("#holiday").click(function () {
                    if ($(this).is(":checked")) {
                        $("#holidayRate").removeAttr("disabled");
                        $("#holidayRate").focus();
                    } else {
                        $("#holidayRate").attr("disabled", "disabled");
                    }
                });

                $("#daysOfWeek").click(function () {
                    if ($(this).is(":checked")) {
                        $("#txtDayOfWeek").removeAttr("disabled");
                        $("#txtDayOfWeek").focus();
                    } else {
                        $("#txtDayOfWeek").attr("disabled", "disabled");
                    }
                });

                $("#daysOfMonth").click(function () {
                    if ($(this).is(":checked")) {
                        $("#txtDayOfMonth").removeAttr("disabled");
                        $("#txtDayOfMonth").focus();
                    } else {
                        $("#txtDayOfMonth").attr("disabled", "disabled");
                    }
                });

                $("#otherStateChck_1").click(function () {
                    if ($(this).is(":checked")) {
                        $("#otherStateInput_1").removeAttr("disabled");
                        $("#otherStateTaxRate_1").removeAttr("disabled");
                        $("#otherStateUpto_1").removeAttr("disabled");
                        $("#otherStateInput_1").focus();
                    } else {
                        $("#otherStateInput_1").attr("disabled", "disabled");
                        $("#otherStateTaxRate_1").attr("disabled", "disabled");
                        $("#otherStateUpto_1").attr("disabled", "disabled");
                    }
                });
                $("#otherStateChck_2").click(function () {
                    if ($(this).is(":checked")) {
                        $("#otherStateInput_2").removeAttr("disabled");
                        $("#otherStateTaxRate_2").removeAttr("disabled");
                        $("#otherStateUpto_2").removeAttr("disabled");
                        $("#otherStateInput_2").focus();
                    } else {
                        $("#otherStateInput_2").attr("disabled", "disabled");
                        $("#otherStateTaxRate_2").attr("disabled", "disabled");
                        $("#otherStateUpto_2").attr("disabled", "disabled");
                    }
                });

                $("#otherStateChck_3").click(function () {
                    if ($(this).is(":checked")) {
                        $("#otherStateInput_3").removeAttr("disabled");
                        $("#otherStateTaxRate_3").removeAttr("disabled");
                        $("#otherStateUpto_3").removeAttr("disabled");
                        $("#otherStateInput_3").focus();
                    } else {
                        $("#otherStateInput_3").attr("disabled", "disabled");
                        $("#otherStateTaxRate_3").attr("disabled", "disabled");
                        $("#otherStateUpto_3").attr("disabled", "disabled");
                    }
                });

                $("#deductRateChck").click(function () {
                    if ($(this).is(":checked")) {
                        $("#deductionRate").removeAttr("disabled");
                        $("#deductionAmount").attr("disabled", "disabled");
                        $("#deductionRate").focus();
                    }
                });

                $("#deductAmountChck").click(function () {
                    if ($(this).is(":checked")) {
                        $("#deductionAmount").removeAttr("disabled");
                        $("#deductionRate").attr("disabled", "disabled");
                        $("#deductionAmount").focus();
                    }
                });

                $("#dailyOverHours").click(function () {
                    if ($(this).is(":checked")) {
                        $("#dailyHours").removeAttr("disabled");
                        $("#dailyHours").focus();
                    } else {
                        $("#dailyHours").attr("disabled", "disabled");
                    }
                });

                $("#weeklyOverHours").click(function () {
                    if ($(this).is(":checked")) {
                        $("#weeklyHours").removeAttr("disabled");
                        $("#weeklyHours").focus();
                    } else {
                        $("#weeklyHours").attr("disabled", "disabled");
                    }
                });
            });

            $(document).ready(function () {
                $('#shippingTypeWeight').scroll(function () {
                    var length = $(this).scrollTop();
                    $('#shippingTypePrice').scrollTop(length);
                });
                $('#shippingTypePrice').scroll(function () {
                    var length = $(this).scrollTop();
                    $('#shippingTypeWeight').scrollTop(length);
                });

                $("#modifySeletedWeight").attr('disabled', true);
                $("#deleteSeletedWeight").attr('disabled', true);

                //$("#selectedMailTypeId")append(new Option("", "0"));
                var o = new Option("", "0");
                $(o).html("");
                var o1 = new Option("", "0");
                $(o1).html("");
                var o2 = new Option("", "0");
                $(o2).html("");
                $("#selectedMailTypeId").append(o);
                $("#selectedPackageSizeId").append(o1);
                $("#selectedContainerId").append(o2);
                $('select[id="selectedMailTypeId"]').find('option[value="' + 0 + '"]').attr("selected", true);
                $('select[id="selectedPackageSizeId"]').find('option[value="' + 0 + '"]').attr("selected", true);
                $('select[id="selectedContainerId"]').find('option[value="' + 0 + '"]').attr("selected", true);

                var nowY = new Date().getFullYear(),
                        options = "",
                        defaultVal = nowY;
                for (var Y = nowY; Y >= 1980; Y--) {
                    options += "<option value='" + Y + "'>" + Y + "</option>";
                }
                $("#selectedTaxYear").append(options);
                $("#selectedTaxYear").val(defaultVal);
                $("#selectedTaxYearEmplyr").append(options);
                $("#selectedTaxYearEmplyr").val(defaultVal);

                $('#selectedTaxYear').on('change', function () {
                    $.ajax({
                        type: "GET",
                        url: "/dashboard/Configuration/FederalTax/companyTaxInfo/loadTaxYear/" + this.value,
                        success: function (res) {
                            console.log('res', res)
                            if (res) {
                                $('#autoFIT').val('' + res.autoFIT);
                                $('#yearFIT').val(res.yearFIT);
                                $('#rateFICA').val(res.rateFICA);
                                $('#rateSocialTax').val(res.rateSocialTax);
                                $('#socialTaxLimit').val(res.socialTaxLimit);
                                $('#rateMedicareTax').val(res.rateMedicareTax);
                                $('#rateFUTA').val(res.rateFUTA);
                                $('#rateFIT').val(res.rateFIT);
                            }

                        },
                        error: function (data) {
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

                });

                $('#selectedTaxYearEmplyr').on('change', function () {
                    alert('Emplyr ' + this.value);
                });


                $('#stateList').on('change', function () {
                    $.ajax({
                        type: "GET",
                        url: "/dashboard/Configuration/StateTax/" + this.value,
                        success: function (res) {
                            console.log('res', res)

                            $("#resetSIDOthers").show();
                            $("#sitStateActive").hide();
                            $("#sitStateInActive").hide();
                            $("#setAsDefault").hide();
                            $("#sitSave").show();

                            if (res) {
                                if (res.active) {
                                    $("#sitStateInActive").show();
                                } else {
                                    $("#sitStateActive").show();
                                }
                                if (!res.asDefault) {
                                    $("#setAsDefault").show();
                                }
                            }








                            $('#otherStateChck_1').prop("checked", false);
                            if (res.otherStateChck1) {
                                $('#otherStateChck_1').click();

                            }

                            $('#otherStateChck_2').prop("checked", false);
                            if (res.otherStateChck2) {
                                $('#otherStateChck_2').click();

                            }

                            $('#otherStateChck_3').prop("checked", false);
                            if (res.otherStateChck3) {
                                $('#otherStateChck_3').click();

                            }



                            $('#otherStateInput_1').val(res.otherStateInput1);
                            $('#otherStateInput_2').val(res.otherStateInput2);
                            $('#otherStateInput_3').val(res.otherStateInput3);

                            $('#otherStateTaxRate_1').val(res.otherStateTaxRate1);
                            $('#otherStateTaxRate_2').val(res.otherStateTaxRate2);
                            $('#otherStateTaxRate_3').val(res.otherStateTaxRate3);

                            $('#otherStateUpto_1').val(res.otherStateUpto1);
                            $('#otherStateUpto_2').val(res.otherStateUpto2);
                            $('#otherStateUpto_3').val(res.otherStateUpto3);


                            $('#upToEtt').val(res.upToEtt);
                            $('#upToSdi').val(res.upToSdi);
                            $('#pitRate').val(res.pitRate);


                            $('#ettRate').val(res.ettRate);
                            $('#uiRate').val(res.uiRate);
                            $('#sdiRate').val(res.sdiRate);

                            $('#upToui').val(res.upToui);
                            $('#stateTaxId').val(res.stateTaxId);


                        },
                        error: function (data) {
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
                });

            });
        //Extra Code start
            function setPrice()
            {
                $('select[id="shippingTypePrice"]').find('option').attr("selected", false);
                var weight = $.trim($("#shippingTypeWeight option:selected").val());
                $('select[id="shippingTypePrice"]').find('option[value="' + weight + '"]').attr("selected", true);
                var price = $.trim($("#shippingTypePrice option:selected").text());
                alert("Selected Weight:" + weight + "\n Price:" + price);
                $("#upsWeight").val(weight);
                $("#upsShippingFee").val("$" + price);
                $("#modifySeletedWeight").attr('disabled', false);
                $("#deleteSeletedWeight").attr('disabled', false);
            }
            function showPanel()
            {
                var selectedTab = $("#tabs1").tabs('option', 'active');
                if (selectedTab == 2)
                {
                    document.getElementById("shippingFreeMethodDiv").style.display = "none";
                    document.getElementById("valueAddedCalculator").style.display = "none";
                } else
                {
                    document.getElementById("shippingFreeMethodDiv").style.display = "block";
                    document.getElementById("valueAddedCalculator").style.display = "block";
                }
            }

            /* comented on 24-11-2019 to prevent simple alert
             function updateSelectedWeight()
             {
             alert("Inside update weight function")
             }

             function deleteSelectedWeight()
             {
             alert("Inside delete selected weight function");
             }*/
            function setServices()
            {
                debugger
                var serviceName = $.trim($("#upsSelect option:selected").text());
                $("#upsServiceName").val(serviceName);
            }

            function setUSPSService()
            {
                var uspsService = $("#uspsSelect option:selected").text();
                $("#uspsServiceName").val(uspsService);
            }

            function setWeightPrice()
            {
                var shippingType = $("#userShippingType option:selected").val();
                if (shippingType == 0)
                {
                    //alert("<spring:message code='BzComposer.configuration.tax.selectshippingtype'/>");
                    return selectshippingtypedialog();
                } else
                {
                    //alert("Weight And Price are:"+shippingType);
                    $("#modifySeletedWeight").attr('disabled', true);
                    $("#deleteSeletedWeight").attr('disabled', true);
                    window.open("Configuration?tabid=config30&shippingCarrierId=" + shippingType);
                    //window.open("Configuration?tabid=showStore");
                }
            }

            function addModalShippingType()
            {
                var sType = $.trim($("#modalShippingType option:selected").text());
                $("#selectedShippingType").val(sType);
            }

            function setModalDescription()
            {
                debugger
                var sType = $.trim($("#modalShippingType option:selected").text());
                $("#selectedShippingType").val(sType);
            }

            /* comented on 24-11-2019 to prevent simple alert
             function saveTemplate()
             {
             alert("Inside saveTemplate Method")
             }
             function deleteTemplate()
             {
             alert("Inside deleteTemplate Method")
             } */
            function saveModalShippingType()
            {
                debugger
                var selectedSType = $.trim($("#modalShippingType option:selected").text());
                debugger
                var textboxValue = $("#selectedShippingType").val();
                debugger
                if (textboxValue == "")
                {
                    //alert("<spring:message code='BzComposer.configuration.tax.selectshippingviatoupdate'/>");
                    return selectshippingtypetoupdatedialog();
                } else if (selectedSType == textboxValue)
                {
                    //alert("<spring:message code='BzComposer.configuration.tax.duplicatevalue'/>");
                    return duplicatevaluedialog();
                } else
                {
                    return;
                }		//This else added on 24-11-2019
                /* else
                 {
                 alert(textboxValue)
                 } */
            }

            function addNewTemplate()
            {
                debugger
                document.getElementById("templateName").style.display = "block";
                document.getElementById("templateSubject").style.display = "block";
                document.getElementById("emailText").style.display = "block";
                document.getElementById("txtTemplateText").style.display = "none";
                document.getElementById("txtTemplateName").style.display = "none";
                document.getElementById("txtTemplateSubject").style.display = "none";
                document.getElementById("emailText").value = "<<name>>" + '\n' + "<<company name>>" + '\n' + "<<address>>" + '\n' + "<<phonenumber>>";
            }
            function setContent()
            {
                debugger
                var id = $("#selectedTemplateId option:selected").val();
                //alert("Selected Tempalte Id:"+id)
                document.getElementById("templateName").style.display = "none";
                document.getElementById("txtTemplateName").style.display = "block";
                document.getElementById("templateSubject").style.display = "none";
                document.getElementById("txtTemplateSubject").style.display = "block";
                document.getElementById("emailText").style.display = "none";
                document.getElementById("txtTemplateText").style.display = "block";

                //window.open("Configuration?tabid=config21&templateId="+id,null,"scrollbars=yes,height=600,width=1300,status=yes,toolbar=no,menubar=no,location=no");
            }

            function showTime()
            {
                var h = document.getElementById("hours").value;
                var m = document.getElementById("minutes").value;
                var t = document.getElementById("selectedTime").value;
                if (h >= 0 && h < 10)
                {
                    h = "0" + h;
                }
                if (m >= 0 && m < 10)
                {
                    m = "0" + m;
                }
                var time = h + " : " + m + " " + t;
                $("#scheduleTime").append("<option value=" + time + ">" + time + "</option>");
            }
            function removeTime()
            {
                $('#scheduleTime option:selected').remove();
            }
        //Extra Code end
        </script>

        <!-- <body onload="init2();"> -->
    <body onload="init();">


        <!-- begin shared/header -->
    <form:form action="Configuration?" enctype="MULTIPART/FORM-DATA" method="post" modelAttribute="configDto">
        <%--Header-Body line separator--%>
        <div id="ddcolortabsline">&nbsp;</div>

        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">

                        <%--Configuration Title addition start--%>
                        <div class="settings-page-header">
                            <span class="settings-page-title">SETTINGS</span>
                            <div class="settings-page-actions">
                                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.save'/>" onclick="saveFederalTax();">
                                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.edit'/>" disabled>
                                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.cancel'/>" onclick="window.location.reload();">
                                <input type="button" class="formbutton" value="<spring:message code='BzComposer.global.delete'/>" disabled>
                            </div>
                        </div>
                        <%--Configuration Title addition end--%>

                        <div><%--Tax Body start--%>

                            <div><%--Hidden Labels start--%>
                                <%--
                                        !!!!! Code not converted from spring to struts
                                --%>

                                <logic:present name="Labels">
                                    <bean:size name="Labels" id="size" />
                                    <input type="hidden" name="lsize" id="lblsize" value='<bean:write name="size" />' />
                                    <logic:iterate name="Labels" id="lbl" indexId="index">
                                        <input type="hidden" id='<bean:write name="index" />lid' name='<bean:write name="index" />lidname'
                                               value='<bean:write name="lbl" property="value" />' />
                                        <input type="hidden" id='<bean:write name="index" />lname' name='<bean:write name="index" />lnm'
                                               value='<bean:write name="lbl" property="label" />' />
                                    </logic:iterate>
                                </logic:present>
                            </div><%--Hidden Labels end--%>

                            <div id="table-negotiations" style="padding: 0; margin: 0; border: 1px solid #ccc;">
                                <table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
                                    <tr>
                                        <%--Configuration menu start--%>

                                        <td id="leftMenu" valign="top" style="position: relative; width: 180px; vertical-align: top;">
                                            <table>
                                                <tr>

                                                    <td style="vertical-align: top;">
                                                        <jsp:include page="menuPage.jsp" />
                                                    </td>

                                                </tr>
                                                <%--
                                                    <tr align="center">
                                                        <td>
                                                            <input type="button" name="Revoke" class="formButton" onclick="RevokeValues();" value='<spring:message code="BizComposer.Configuration.RevokeButton"/>' />
                                                            <input type="button" name="Save" class="formButton" onclick="SaveValues();" value='<spring:message code="BizComposer.Configuration.SaveButton"/>' />
                                                        </td>
                                                        <td>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                --%>
                                            </table>
                                        </td>


                                        <%--Configuration menu end--%>
                                        <%--Tax page start--%>



                                        <td valign="top">
                                            <%--Tax tab start--%>
                                            <div id="tax" style="padding: 0; position: relative; left: 0;">
                                                <%--Federal Tax content starts directly--%>
                                                <div id="federalTax">
                                                        <div id="tabsFederalTax" style="height:auto;">
                                                            <ul>
                                                                <li style="font-size:12px; ">
                                                                    <a href="#companyTaxInformation">
                                                                        <spring:message code="BzComposer.configuration.tab.companytaxinformation" />
                                                                    </a>
                                                                </li>
                                                                <li style="font-size:12px; ">
                                                                    <a href="#companyTaxOption">
                                                                        <spring:message code="BzComposer.configuration.tab.companytaxoption" />
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                            <%--companyTaxInformation tab starts--%>
                                                            <div id="companyTaxInformation">
                                                                <table class="table-notifications" width="100%">
                                                                    <tr>
                                                                        <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                            <b>Employer ID</b>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" style="font-size:12px;">
                                                                    Employer ID :
                                                                    <input type="text" id="employerIdDisplay" value="${companyInfo.employerId}" readonly="readonly" />

                                                                    </td>
                                                                    <td colspan="2" style="font-size:12px;">
                                                                    <spring:message code="BzComposer.configuration.fiscalmonth"/> :
                                                                    <form:select path="fiscalMonth">
                                                                        <option value="January" ${configDto.fiscalMonth == "January" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.january'/></option>
                                                                        <option value="February" ${configDto.fiscalMonth == "February" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.february'/></option>
                                                                        <option value="March" ${configDto.fiscalMonth == "March" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.march'/></option>
                                                                        <option value="April" ${configDto.fiscalMonth == "April" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.april'/></option>
                                                                        <option value="May" ${configDto.fiscalMonth == "May" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.may'/></option>
                                                                        <option value="June" ${configDto.fiscalMonth == "June" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.june'/></option>
                                                                        <option value="July" ${configDto.fiscalMonth == "July" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.july'/></option>
                                                                        <option value="August" ${configDto.fiscalMonth == "August" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.august'/></option>
                                                                        <option value="September" ${configDto.fiscalMonth == "September" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.september'/></option>
                                                                        <option value="October" ${configDto.fiscalMonth == "October" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.october'/></option>
                                                                        <option value="November" ${configDto.fiscalMonth == "November" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.november'/></option>
                                                                        <option value="December" ${configDto.fiscalMonth == "December" ? 'selected' : ''}><spring:message code='BzComposer.configuration.month.december'/></option>
                                                                    </form:select>
                                                                    </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                            <b><spring:message code="BzComposer.configuration.federaltax" /></b>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <div id="tabsEmployeeFederalTax">
                                                                                <ul>
                                                                                    <li style="font-size:12px;">
                                                                                        <a href="#employeeTaxInfo2" style="font-size:12px;">Employee
                                                                                            <%--<spring:message code="BzComposer.configuration.tab.employeeTaxInfo" />--%>
                                                                                        </a>
                                                                                    </li>
                                                                                    <li style="font-size:12px;">
                                                                                        <a href="#employerTaxInfo2" style="font-size:12px;">Employer
                                                                                            <%--<spring:message code="BzComposer.configuration.tab.employerTaxInfo" />--%>
                                                                                        </a>
                                                                                    </li>
                                                                                </ul>
                                                                                <div id="employeeTaxInfo2"></div><div id="employerTaxInfo2"></div>

                                                                                <%--Employee FederalTax tab starts--%>
                                                                                <div id="employeeTaxInfo">
                                                                                    <table class="table-notifications" width="100%">
                                                                                        <tr>
                                                                                            <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                                <b><spring:message code="BzComposer.configuration.incometaxwithhold"/></b>
                                                                                            </th>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="2" style="font-size:12px;">
                                                                                        <input type="hidden" id="autoFIT" value="${configDto.autoFIT}" />
                                                                                        Federal Income Tax :
                                                                                        <label style="margin-left:10px;">
                                                                                            <input type="radio" name="fitMode" value="1" ${configDto.autoFIT == 1 ? 'checked' : ''}>
                                                                                            Use table by IRS
                                                                                        </label>
                                                                                        </td>
                                                                                        <td colspan="2" style="font-size:12px;">
                                                                                        <spring:message code="BzComposer.configuration.taxyear"/> :
                                                                                        <form:select path="selectedTaxYear">
                                                                                            <%--<c:if test="${not empty configDto.listOfExistingTaxYear}">
                                                                                                <c:forEach items="${configDto.listOfExistingTaxYear}" var="objList1">
                                                                                                    <option value="${objList1.availableTaxYear}">${objList1.selectedTaxYear}</option>
                                                                                                </c:forEach>
                                                                                            </c:if>--%>
                                                                                            <option value="">select</option>
                                                                                        </form:select>
                                                                                        </td>
                                                                                        </tr>
                                                                                        <tr id="trFITManual">
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                Federal Income Tax (FIT) :
                                                                                                <div class="input-group" style="display:inline-flex; margin-left:8px;">
                                                                                                    <label style="margin-right:10px;">
                                                                                                        <input type="radio" name="fitMode" value="0" ${configDto.autoFIT == 0 ? 'checked' : ''}>
                                                                                                        Manual rate
                                                                                                    </label>
                                                                                                    <form:input path="rateFIT" type="text" placeholder="0.00" style="height:25px;" id="rateFIT"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                <b>FICA (Federal Insurance Contribution Act) Deductions<%--<spring:message code="BzComposer.configuration.ficadeduction"/>--%></b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="fica">--%>
                                                                                                <%--<spring:message code="BzComposer.configuration.fica"/> :--%>
                                                                                                <%--<spring:message code="BzComposer.configuration.rate"/>--%>
                                                                                                <div class="input-group">
                                                                                                    FICA Deduction Rate :
                                                                                                    &nbsp;&nbsp;
                                                                                                    <form:input type="text" path="rateFICA" placeholder="0.00" style="height:25px;"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div></div>

                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="15%" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="socicalSecurityTax">--%>
                                                                                                Social Security Tax :
                                                                                                <%--<spring:message code="BzComposer.configuration.socialsecurityrate"/> :--%>
                                                                                            </td>
                                                                                            <td width="25%"style="font-size:12px;">
                                                                                                <div class="input-group">
                                                                                                    <spring:message code="BzComposer.configuration.rate"/>
                                                                                                    &nbsp;&nbsp;
                                                                                                    <form:input path="rateSocialTax" type="text" placeholder="0.00" style="height:25px;"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                            <td colspan="2" style="font-size:12px;">
                                                                                                <div class="input-group">
                                                                                                    <spring:message code="BzComposer.configuration.upto"/>
                                                                                                    &nbsp;&nbsp;
                                                                                                    <form:input type="text" path="socialTaxLimit" placeholder="0.00" style="height:25px;"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">$</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="15%"style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="medicare">--%>
                                                                                        <spring:message code="BzComposer.configuration.medicare"/> :
                                                                                        </td>
                                                                                        <td width="20%"style="font-size:12px;">
                                                                                            <div class="input-group">
                                                                                                <spring:message code="BzComposer.configuration.rate"/>
                                                                                                &nbsp;&nbsp;
                                                                                                <form:input path="rateMedicareTax" type="text" placeholder="0.00" style="height:25px;" />
                                                                                                <div class="input-group-append">
                                                                                                    <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                </div></div>
                                                                                        </td>
                                                                                        <td style="font-size:12px;" colspan="2">
                                                                                            No Limit
                                                                                        </td>
                                                                                        </tr>
                                                                                        <tr id="trFIT" style="display:none;">
                                                                                            <td colspan="4"></td>
                                                                                        </tr>
                                                                                        <tr id="trFUTA" style="display:none">
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="futa">--%>
                                                                                                <%--<spring:message code="BzComposer.configuration.futa"/> :--%>
                                                                                                <div class="input-group">
                                                                                                    Federal Unemployment (FUTA) :
                                                                                                    &nbsp;&nbsp;
                                                                                                    <form:input path="rateFUTA" type="text" placeholder="0.00" style="height:25px;" />
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                                <%--Employee FederalTax tab ends--%>
                                                                                <%--Employer FederalTax tab starts--%>
                                                                                <div id="employerTaxInfo" style="display:none">
                                                                                    <table class="table-notifications" width="100%">
                                                                                        <tr>
                                                                                            <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                                <b><spring:message code="BzComposer.configuration.incometaxwithhold"/></b>
                                                                                            </th>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="2" style="font-size:12px;">
                                                                                        <spring:message code="BzComposer.configuration.federalincometax"/> :
                                                                                        <select id="federalIncomeTaxEmplyr">
                                                                                            <option value="1"  ${configDto.autoFIT == "1" ? 'selected' : ''}>
                                                                                            <spring:message code="BzComposer.configuration.usefederalincometaxtable"/>
                                                                                            </option>
                                                                                            <option value="0" ${configDto.autoFIT == "0" ? 'selected' : ''}>
                                                                                            <spring:message code="BzComposer.configuration.usemanualestimatedtaxrate"/>
                                                                                            </option>
                                                                                        </select>
                                                                                        </td>
                                                                                        <td colspan="2" style="font-size:12px;">
                                                                                        <spring:message code="BzComposer.configuration.taxyear"/> :
                                                                                        <form:select id="selectedTaxYearEmplyr" path="selectedTaxYear">

                                                                                            <%-- <c:if test="${not empty configDto.listOfExistingTaxYear}">
                                                                                                 <c:forEach items="${configDto.listOfExistingTaxYear}" var="objList1">
                                                                                                     <option value="${objList1.availableTaxYear}">${objList1.selectedTaxYear}</option>
                                                                                                 </c:forEach>
                                                                                             </c:if>--%>
                                                                                        </form:select>
                                                                                        </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                <b>FICA (Federal Insurance Contribution Act) Deductions<%--<spring:message code="BzComposer.configuration.ficadeduction"/>--%></b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="fica">--%>
                                                                                                <%--<spring:message code="BzComposer.configuration.fica"/> :--%>
                                                                                                <%--<spring:message code="BzComposer.configuration.rate"/>--%>
                                                                                                <div class="input-group">
                                                                                                    FICA Deduction Rate :
                                                                                                    &nbsp;&nbsp;
                                                                                                    <input value="${configDto.rateFICA}"  type="text" placeholder="0.00" style="height:25px;"  id="ficaRateEmplyr"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="15%" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="socicalSecurityTax">--%>
                                                                                                Social Security Tax :
                                                                                                <%--<spring:message code="BzComposer.configuration.socialsecurityrate"/> :--%>
                                                                                            </td>
                                                                                            <td width="20%" style="font-size:12px;">
                                                                                                <div class="input-group">
                                                                                                    <spring:message code="BzComposer.configuration.rate"/>
                                                                                                    &nbsp;&nbsp;
                                                                                                    <input value="${configDto.rateSocialTax}" type="text" placeholder="0.00" style="height:25px;" id="sstRateEmplyr"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                            <td colspan="2" style="font-size:12px;">
                                                                                                <div class="input-group">
                                                                                                    <spring:message code="BzComposer.configuration.upto"/>
                                                                                                    &nbsp;&nbsp;
                                                                                                    <input value="${configDto.socialTaxLimit}"   type="text" placeholder="0.00" style="height:25px;" id="upToEmplyr"/>
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">$</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="15%" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="medicare">--%>
                                                                                        <spring:message code="BzComposer.configuration.medicare"/> :
                                                                                        </td>
                                                                                        <td width="20%" style="font-size:12px;">
                                                                                            <div class="input-group">
                                                                                                <spring:message code="BzComposer.configuration.rate"/>
                                                                                                &nbsp;&nbsp;
                                                                                                <input value="${configDto.rateMedicareTax}" type="text" placeholder="0.00" style="height:25px;" id="medicareRateEmplyr" />
                                                                                                <div class="input-group-append">
                                                                                                    <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                </div></div>
                                                                                        </td>
                                                                                        <td style="font-size:12px;" colspan="2">
                                                                                            No Limit
                                                                                        </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4" align="left" style="font-size:12px;">
                                                                                                <%--<input type="checkbox" id="futa">--%>
                                                                                                <%--<spring:message code="BzComposer.configuration.futa"/> :--%>
                                                                                                <div class="input-group">
                                                                                                    Federal Unemployment (FUTA) :
                                                                                                    &nbsp;&nbsp;
                                                                                                    <form:input path="rateFUTA" type="text" placeholder="0.00" style="height:25px;" />
                                                                                                    <div class="input-group-append">
                                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                                    </div></div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                                <%--Employer FederalTax tab ends--%>
                                                                            </div>
                                                                            <%--Employer FederalTax tab ends--%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <%--companyTaxInformation tab end--%>
                                                            <%--companyTaxOption tab starts--%>
                                                            <div id="companyTaxOption">
                                                                <%-- <div id="tabsCompanyTaxOption" style="height:700px;">--%>
                                                                <div id="tabsCompanyTaxOption">
                                                                    <ul>
                                                                        <li style="font-size:12px;">
                                                                            <a href="#deduction">
                                                                                <spring:message code="BzComposer.configuration.tab.deduction" />
                                                                            </a>
                                                                        </li>
                                                                        <li style="font-size:12px;">
                                                                            <a href="#option">
                                                                                <spring:message code="BzComposer.configuration.tab.option" />
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                    <%--deduction tab starts--%>
                                                                    <div id="deduction">
                                                                        <table class="table-notifications" width="100%">
                                                                            <tr>
                                                                                <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                    <b><spring:message code="BzComposer.configuration.deductioninformation" /></b>
                                                                                </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="10%" style="font-size:12px;">
                                                                            <spring:message code="BzComposer.configuration.name"/> :
                                                                            </td>
                                                                            <td width="25%" style="font-size:12px;">
                                                                                <input type="text" list="payrollDeductionOptions" style="width: 450px; height: 35px; font-size: 16px; padding-left: 10px;" id="deductionName">
                                                                                <input type="hidden"  id="deductionListId">
                                                                                <datalist id="payrollDeductionOptions">
                                                                                    <c:forEach items="${payrollDeductionList}" var="payrollDeduction">
                                                                                        <option value="${payrollDeduction.name}"></option>
                                                                                    </c:forEach>
                                                                                </datalist>
                                                                            </td>
                                                                            <td width="25%" style="font-size:12px;">
                                                                            </td>
                                                                            <td style="font-size:12px;">

                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="10%" style="font-size:12px;">
                                                                                    <input type="radio" name="deductType" id="deductAmountChck" checked/>
                                                                            <spring:message code="BzComposer.configuration.amount"/> :
                                                                            </td>
                                                                            <td width="25%" style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <input type="text" placeholder="0.00" style="height:25px;" id="deductionAmount">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">$</span>
                                                                                    </div></div>
                                                                            </td>
                                                                            <td width="25%" style="font-size:12px;">
                                                                                &nbsp; &nbsp;
                                                                            </td>
                                                                            <td style="font-size:14px;">

                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="10%" style="font-size:12px;">
                                                                                    <input type="radio"  name="deductType" id="deductRateChck"/>
                                                                            <spring:message code="BzComposer.configuration.rate"/> :
                                                                            </td>
                                                                            <td width="25%" style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <input type="text" placeholder="0.00" disabled="disabled" style="height:25px;" id="deductionRate">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                    </div></div>
                                                                            </td>
                                                                            <td width="25%" style="font-size:12px;">
                                                                                &nbsp; &nbsp;
                                                                            </td>
                                                                            <td style="font-size:14px;">

                                                                            </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                    <b><spring:message code="BzComposer.configuration.deductionlist"/></b>
                                                                                </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                    <%--Deduction List starts--%>
                                                                                    <div>
                                                                                        <table id="tbl-comtaxoptions-deduction-list" class="tabla-listados" cellspacing="0" border="1">
                                                                                            <thead>
                                                                                                <tr style="height: 35px;">
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                        &nbsp;&nbsp;
                                                                                                        <b>Deduction Name</b>
                                                                                                    </td>
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                        &nbsp;&nbsp;
                                                                                                        <b>Amount</b>
                                                                                                    </td>
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                        &nbsp;&nbsp;
                                                                                                        <b>Rate</b>
                                                                                                    </td>
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                        &nbsp;&nbsp;
                                                                                                        <b>Use Rate</b>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                            <c:forEach items="${configDto.deductionList}" var="deduct" varStatus="loop">
                                                                                                <tr class="row-comp-tax-deduction" id='${loop.index}-row-comp-tax-deduction' onclick="setCompanyTaxDeduction(this, '${deduct.deductionListId}', '${deduct.deductionListName}', '${deduct.deductionAmount}', '${deduct.deductionRate}', '${deduct.useRate}', '${deduct.isTaxExempt}')">
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                        ${deduct.deductionListName}
                                                                                                    </td>
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                        ${deduct.deductionAmount}
                                                                                                    </td>
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                    </td>
                                                                                                    <td width="20%" style="font-size:12px; text-align: center;">
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <%--Deduction List ends--%>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" align="center" style="font-size:14px; padding: 5px;">
                                                                                    <button type="button" class="formButton" onclick="saveCompanyTaxDeduction(false);">
                                                                                        <spring:message code="BzComposer.configuration.adddeductionbtn"/>
                                                                                    </button>
                                                                                    <button type="button" class="formButton" onclick="saveCompanyTaxDeduction(true)">
                                                                                        <spring:message code="BzComposer.global.edit"/>
                                                                                    </button>
                                                                                    <button type="button" id="delete" class="formButton" onclick="deleteCompanyTaxDeduction()">
                                                                                        <spring:message code="BzComposer.global.delete"/>
                                                                                    </button>
                                                                                    <button type="reset" class="formButton" onclick="clearCompanyTaxDeduction()">
                                                                                        <spring:message code="BzComposer.global.clear"/>
                                                                                    </button>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                    <%--deduction tab ends--%>
                                                                    <%--option tab starts--%>
                                                                    <div id="option">
                                                                        <table class="table-notifications" width="100%">
                                                                            <tr>
                                                                                <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                    <b><spring:message code="BzComposer.configuration.setpayrollday"/></b>
                                                                                </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" style="font-size:12px;">
                                                                            <spring:message code="BzComposer.configuration.startingdate"/> :
                                                                            &nbsp;
                                                                            <input type="date" id="selectStartingDate"/>
                                                                            <input type="hidden" id="optionId"/>
                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" style="font-size:12px;">

                                                                                    <div class="input-group">
                                                                                        <input type="checkbox" id="daysOfWeek">
                                                                                        &nbsp;&nbsp;
                                                                                        <input type="text" disabled="disabled"  style="height:25px;" id="txtDayOfWeek">
                                                                                        <div class="input-group-append">
                                                                                            <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">
                                                                                                <spring:message code="BzComposer.configuration.dayofweek"/></span>
                                                                                        </div></div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" style="font-size:12px;">
                                                                                    <div class="input-group">
                                                                                        <input type="checkbox" id="daysOfMonth">
                                                                                        &nbsp;&nbsp;
                                                                                        <input type="text" disabled="disabled" style="height:25px;" id="txtDayOfMonth">
                                                                                        <div class="input-group-append">
                                                                                            <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">
                                                                                                <spring:message code="BzComposer.configuration.dayofmonth"/></span>
                                                                                        </div></div>
                                                                                </td>
                                                                            </tr>                                    <tr>
                                                                                <th colspan="4" align="left" style="font-size:12px; padding: 5px;">
                                                                                    <b><spring:message code="BzComposer.configuration.payperiod" /></b>
                                                                                </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="font-size:12px;">
                                                                                    <input type="checkbox" id="dailyOrMiscellaneous" />
                                                                            <spring:message code="BzComposer.configuration.dailyormiscellaneous"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <input type="checkbox" id="weekly" />
                                                                            <spring:message code="BzComposer.configuration.weekly"/>
                                                                            </td>
                                                                            <td colspan="2" style="font-size:12px;">
                                                                                <input type="checkbox" id="biWeekly">
                                                                            <spring:message code="BzComposer.configuration.biweekly"/>
                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="font-size:12px;">
                                                                                    <input type="checkbox" id="semiMonthly">
                                                                            <spring:message code="BzComposer.configuration.semimonthly"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <input type="checkbox" id="monthly">
                                                                            <spring:message code="BzComposer.configuration.monthly"/>
                                                                            </td>
                                                                            <td colspan="2" style="font-size:12px;">
                                                                                <input type="checkbox" id="quartely">
                                                                            <spring:message code="BzComposer.configuration.quarterly"/>
                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="2"style="font-size:12px;">
                                                                                    <input type="checkbox" id="semiAnnually">
                                                                            <spring:message code="BzComposer.configuration.semiannualy"/>
                                                                            </td>
                                                                            <td colspan="2" style="font-size:12px;">
                                                                                <input type="checkbox" id="annually">
                                                                            <spring:message code="BzComposer.configuration.annually"/>
                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <th colspan="2" align="left" style="font-size:12px; padding: 5px;">
                                                                            <spring:message code="BzComposer.configuration.setovertime"/>
                                                                            </th>
                                                                            <th colspan="2" align="left" style="font-size:12px; padding:5px;">
                                                                            <spring:message code="BzComposer.configuration.setholidaytime"/>
                                                                            </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="font-size:12px;">
                                                                                    <input type="checkbox" id="dailyOverHours">
                                                                            <spring:message code="BzComposer.configuration.dailyover"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <input type="text" style="height:25px;" disabled="disabled" id="dailyHours">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">
                                                                                            <spring:message code="Bzcomposer.configuration.hours"/></span>
                                                                                    </div></div>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <input type="checkbox" id="weekendSaturday">
                                                                            <spring:message code="BzComposer.configuration.weekendsaturday"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <spring:message code="BzComposer.configuration.rate"/>
                                                                                    &nbsp;&nbsp;
                                                                                    <input type="text" placeholder="0.00" style="height:25px;" disabled="disabled" id="weekendSaturdayRate">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                    </div></div>
                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="font-size:12px;">
                                                                                    <input type="checkbox" id="weeklyOverHours">
                                                                            <spring:message code="BzComposer.configuration.weeklyover"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <input type="text" style="height:25px;" disabled="disabled" id="weeklyHours">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">
                                                                                            <spring:message code="Bzcomposer.configuration.hours"/></span>
                                                                                    </div></div>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <input type="checkbox" id="weekendSunday">
                                                                            <spring:message code="BzComposer.configuration.weekendsunday"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <spring:message code="BzComposer.configuration.rate"/>
                                                                                    &nbsp;&nbsp;
                                                                                    <input type="text" placeholder="0.00" disabled="disabled" style="height:25px;" id="weekendSundayRate">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                    </div></div>
                                                                            </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="font-size:12px;">
                                                                            <spring:message code="BzComposer.configuration.rate"/>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <input type="text" placeholder="0.00" style="height:25px;" id="overtimeRate">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                    </div></div>
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <input type="checkbox" id="holiday">
                                                                            <spring:message code="BzComposer.configuration.holiday"/> :
                                                                            </td>
                                                                            <td style="font-size:12px;">
                                                                                <div class="input-group">
                                                                                    <spring:message code="BzComposer.configuration.rate"/>
                                                                                    &nbsp;&nbsp;
                                                                                    <input type="text" placeholder="0.00" disabled="disabled" style="height:25px;" id="holidayRate">
                                                                                    <div class="input-group-append">
                                                                                        <span class="input-group-text" style="height:25px; font-size:12px; color:black !important;">%</span>
                                                                                    </div></div>
                                                                            </td>
                                                                            </tr>

                                                                        </table>
                                                                    </div>
                                                                    <%--option tab ends--%>
                                                                </div>
                                                            </div>
                                                            <%--companyTaxOption tab ends--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--Federal Tax content ends--%>
                                            </div>
                                            <%--Tax tab end--%>
                                        </td>

                                        <%--Tax page end--%>
                                    </tr>
                                </table>
                            </div><%--Configuration tab border end--%>

                        </div><%--Tax Body end--%>


                    </div><%--div class="statusquo ok" end--%>
                </div><%--div id="hoja" end--%>
            </div><%--div id="blanquito" end--%>
        </div><%--div id="padding" end--%>
    </form:form>

    <jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
<%--Extra Code start--%>
<script type="text/javascript">
    $(document).ready(function() {
        // Keep the legacy block from overwriting saved database values.
    });

    function selectshippingtypedialog()
    {
        event.preventDefault();
        $("#selectshippingtypedialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }
    function selectshippingtypetoupdatedialog()
    {
        event.preventDefault();
        $("#selectshippingtypetoupdatedialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }
    function duplicatevaluedialog()
    {
        event.preventDefault();
        $("#duplicatevaluedialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }


    function saveFederalTax() {
        var active = $("#tabsEmployeeFederalTax").tabs("option", "active");

        $("#saveFederaTax").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        autoFIT: parseInt($('#autoFIT').val()),
                        yearFIT: $('#selectedTaxYear').val(),
                        rateFICA: $('#rateFICA').val(),
                        rateSocialTax: $('#rateSocialTax').val(),
                        socialTaxLimit: $('#socialTaxLimit').val(),
                        rateMedicareTax: $('#rateMedicareTax').val(),
                        rateFUTA: $('#rateFUTA').val(),
                        rateFIT: $('#rateFIT').val()
                    };
                    var postDataOption = {
                        startingDate: $('#selectStartingDate').val(),
                        daily: $('#dailyOrMiscellaneous').is(":checked") ? 1 : 0,
                        weekly: $('#weekly').is(":checked") ? 1 : 0,
                        monthly: $('#monthly').is(":checked") ? 1 : 0,
                        annually: $('#annually').is(":checked") ? 1 : 0,
                        biweekly: $('#biWeekly').is(":checked") ? 1 : 0,
                        quarterly: $('#quartely').is(":checked") ? 1 : 0,
                        semiAnnually: $('#semiAnnually').is(":checked") ? 1 : 0,
                        semiMonthly: $('#semiMonthly').is(":checked") ? 1 : 0,
                        dailyOver: $('#dailyOverHours').is(":checked") ? 1 : 0,
                        weeklyOver: $('#weeklyOverHours').is(":checked") ? 1 : 0,
                        dailyOverVal: $('#dailyHours').val(),
                        weeklyOverVal: $('#weeklyHours').val(),
                        wendSt: $('#weekendSaturday').is(":checked") ? 1 : 0,
                        wendStRate: $('#weekendSaturdayRate').val(),
                        wendSn: $('#weekendSunday').is(":checked") ? 1 : 0,
                        wendSnRate: $('#weekendSundayRate').val(),
                        holiday: $('#holiday').is(":checked") ? 1 : 0,
                        holidayRate: $('#holidayRate').val(),
                        dayOfWeek: $('#daysOfWeek').is(":checked") ? 1 : 0,
                        dayOfWeekVal: $('#txtDayOfWeek').val(),
                        dayOfMonth: $('#daysOfMonth').is(":checked") ? 1 : 0,
                        dayOfMonthVal: $('#txtDayOfMonth').val(),
                        overtimeRate: $('#overtimeRate').val(),
                        optionId: $('#optionId').val() == "" ? "0" : $('#optionId').val()
                    }

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxInfo",
                        data: postData,
                        success: function (res) {
                            console.log('Save response:', res);
                            if (res && res.success) {
                                // Now save options as well
                                $.ajax({
                                    type: "POST",
                                    url: "/dashboard/Configuration/FederalTax/companyTaxOption/option",
                                    data: postDataOption,
                                    success: function (resOpt) {
                                        alert("All changes saved successfully!");
                                    },
                                    error: function(xhrOpt) {
                                        alert("Federal tax saved, but error saving options.");
                                    }
                                });
                            } else {
                                alert("Error saving configuration: " + (res && res.message ? res.message : "Unknown error"));
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error('Save error:', error, xhr.responseText);
                            alert("Error saving federal tax configuration. Please check console for details.");
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });


    }

    function clearCompanyTaxDeduction() {

        $('.row-comp-tax-deduction').removeClass('draft');

        $('#deductionListId').val('');
        $('#deductionName').val('');

        $('#deductionRate').val('');
        $('#deductionAmount').val('');
        $('#deductionRate').val('');
        $('#deductionAmount').val('');
        $("#deductionAmount").removeAttr("disabled");
        $('#deductAmountChck').prop("checked", true);
        $('#deductRateChck').prop("checked", false);
        $("#deductionRate").attr("disabled", "disabled");

    }


    function clearCompanyTaxOption() {
        $('.row-comp-tax-option').removeClass('draft');
        $('#optionId').val('');


        $("#holidayRate").attr("disabled", "disabled");
        $("#weekendSundayRate").attr("disabled", "disabled");
        $("#dailyHours").attr("disabled", "disabled");
        $("#weekendSaturdayRate").attr("disabled", "disabled");
        $("#weeklyHours").attr("disabled", "disabled");
        $("#txtDayOfMonth").attr("disabled", "disabled");
        $("#txtDayOfWeek").attr("disabled", "disabled");


    }




    function deleteCompanyTaxDeduction()
    {
        var deductionListId = $('#deductionListId').val();


        // validation....
        if (deductionListId == '') {
            $("#federaltaxemptydata").dialog({
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
            return;
        }

        $("#deleteFederalTaxCompanyDeduction").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        deductionListId: deductionListId
                    }

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction/delete",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            clearCompanyTaxDeduction();

                            var html = '';
                            for (let step = 0; step < res.length; step++) {
                                var d = res[step];
                                var str = 'setCompanyTaxDeduction(this,"' + d.deductionListId + '","' + d.deductionListName + '","' + d.deductionAmount + '","' + d.deductionRate + '","' + d.useRate + '","' + d.isTaxExempt + '")';
                                html += "<tr class='row-comp-tax-deduction' id='" + step + "-row-comp-tax-deduction' onclick='" + str + "'>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.deductionListName + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.deductionAmount + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.deductionRate + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.useRate + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + (d.isTaxExempt == 1 ? 'Yes' : 'No') + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-comtaxoptions-deduction-list > tbody').html('')
                            $('#tbl-comtaxoptions-deduction-list > tbody').html(html)

                        },
                        error: function (data) {
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });



    }



    function deleteCompanyTaxOption()
    {
        var optionId = $('#optionId').val();


        // validation....
        if (optionId == '') {
            $("#federaltaxemptydata").dialog({
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
            return;
        }

        $("#deleteFederalTaxCompanyOption").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        optionId: optionId
                    }

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/option/delete",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            // clearCompanyTaxDeduction();

                            $("#resetClearOption").click()

                            var html = '';
                            for (let step = 0; step < res.length; step++) {
                                var deduct = res[step];
                                var str = 'setCompanyTaxOption(this, "' + deduct.startingDate + '","' + deduct.daily + '","' + deduct.weekly + '","' + deduct.monthly + '","' + deduct.annually + '","' + deduct.biweekly + '","' + deduct.quarterly + '","' + deduct.semiAnnually + '","' + deduct.semiMonthly + '","' + deduct.dailyOver + '","' + deduct.weeklyOver + '","' + deduct.dailyOverVal + '","' + deduct.weeklyOverVal + '","' + deduct.wendSt + '","' + deduct.wendStRate + '","' + deduct.wendSn + '","' + deduct.wendSnRate + '","' + deduct.holiday + '","' + deduct.overtimeRate + '","' + deduct.holidayRate + '","' + deduct.dayOfWeek + '","' + deduct.dayOfWeekVal + '","' + deduct.dayOfMonth + '","' + deduct.dayOfMonthVal + '","' + deduct.optionId + '")';
                                html += "<tr class='row-comp-tax-option' id='" + step + "-row-comp-tax-option' onclick='" + str + "'>"
                                html += "<td width='50%' style='font-size:12px;'>" + deduct.startingDate + "</td>"
                                html += "<td width='50%' style='font-size:12px;'>" + deduct.createdAt + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-comtaxoptions-option-list > tbody').html('')
                            $('#tbl-comtaxoptions-option-list > tbody').html(html)
                        },
                        error: function (data) {
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });



    }


    function saveCompanyTaxDeduction(edit)
    {
        var deductionListId = edit ? $('#deductionListId').val() : "";
        var deductionListName = $('#deductionName').val();
        var deductionRate = $('#deductionRate').val();
        var deductionAmount = $('#deductionAmount').val();
        var deductionRate = 0;
        var deductionAmount = 0;
        var isTaxExempt = $('#taxExemption').is(":checked") ? 1 : 0;

        if ($('#deductRateChck').is(":checked")) {
            deductionRate = $("#deductionRate").val();
        } else if ($('#deductAmountChck').is(":checked")) {
            deductionAmount = $("#deductionAmount").val();
        }

        // validation....
        if ((edit && deductionListId == "") || (!edit && deductionListId != "") || deductionListName == '') {
            $("#federaltaxemptydata").dialog({
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
            return;
        }








        $("#saveFederalTaxCompanyDeduction").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        deductionListId: deductionListId == "" ? "0" : deductionListId,
                        deductionListName: deductionListName,
                        deductionRate: deductionRate,
                        deductionAmount: deductionAmount,
                        deductionRate: deductionRate,
                        deductionAmount: deductionAmount,
                        isTaxExempt: isTaxExempt

                    }

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            clearCompanyTaxDeduction();

                            var html = '';
                            for (let step = 0; step < res.length; step++) {
                                var d = res[step];
                                var str = 'setCompanyTaxDeduction(this,"' + d.deductionListId + '","' + d.deductionListName + '","' + d.deductionAmount + '","' + d.deductionRate + '","' + d.useRate + '","' + d.isTaxExempt + '")';
                                html += "<tr class='row-comp-tax-deduction' id='" + step + "-row-comp-tax-deduction' onclick='" + str + "'>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.deductionListName + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.deductionAmount + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.deductionRate + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + d.useRate + "</td>"
                                html += "<td width='20%' style='font-size:12px;'>" + (d.isTaxExempt == 1 ? 'Yes' : 'No') + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-comtaxoptions-deduction-list > tbody').html('')
                            $('#tbl-comtaxoptions-deduction-list > tbody').html(html)

                        },
                        error: function (data) {
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });



    }



    function saveCompanyTaxOption(edit)
    {

        var startingDate = $('#selectStartingDate').val()
        var optionId = edit ? $('#optionId').val() : "";
        var selectStartingDate = $('#selectStartingDate').val()
        var daysOfWeek = $('#daysOfWeek').is(":checked") ? 1 : 0;
        var txtDayOfWeek = $('#txtDayOfWeek').val()
        var daysOfMonth = $('#daysOfMonth').is(":checked") ? 1 : 0;
        var txtDayOfMonth = $('#txtDayOfMonth').val()
        var dailyOrMiscellaneous = $('#dailyOrMiscellaneous').is(":checked") ? 1 : 0;
        var weekly = $('#weekly').is(":checked") ? 1 : 0;
        var biWeekly = $('#biWeekly').is(":checked") ? 1 : 0;
        var semiMonthly = $('#semiMonthly').is(":checked") ? 1 : 0;
        var monthly = $('#monthly').is(":checked") ? 1 : 0;
        var quartely = $('#quartely').is(":checked") ? 1 : 0;
        var semiAnnually = $('#semiAnnually').is(":checked") ? 1 : 0;
        var annually = $('#annually').is(":checked") ? 1 : 0;
        var dailyOverHours = $('#dailyOverHours').is(":checked") ? 1 : 0;
        var dailyHours = $('#dailyHours').val()
        var weekendSaturday = $('#weekendSaturday').is(":checked") ? 1 : 0;
        var weekendSaturdayRate = $('#weekendSaturdayRate').val()
        var weeklyOverHours = $('#weeklyOverHours').is(":checked") ? 1 : 0;
        var weeklyHours = $('#weeklyHours').val()
        var weekendSunday = $('#weekendSunday').is(":checked") ? 1 : 0;
        var weekendSundayRate = $('#weekendSundayRate').val()
        var holiday = $('#holiday').is(":checked") ? 1 : 0;
        var holidayRate = $('#holidayRate').val();
        var overtimeRate = $('#overtimeRate').val();


        // validation....
        if ((edit && optionId == "") || (!edit && optionId != "")) {
            $("#federaltaxemptydata").dialog({
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
            return;
        }


        $("#saveFederalTaxCompanyOption").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        startingDate: startingDate,
                        daily: dailyOrMiscellaneous,
                        weekly: weekly,
                        monthly: monthly,
                        annually: annually,
                        biweekly: biWeekly,
                        quarterly: quartely,
                        semiAnnually: semiAnnually,
                        semiMonthly: semiMonthly,
                        dailyOver: dailyOverHours,
                        weeklyOver: weeklyOverHours,
                        dailyOverVal: dailyHours,
                        weeklyOverVal: weeklyHours,
                        wendSt: weekendSaturday,
                        wendStRate: weekendSaturdayRate,
                        wendSn: weekendSunday,
                        wendSnRate: weekendSundayRate,
                        holiday: holiday,
                        holidayRate: holidayRate,
                        dayOfWeek: daysOfWeek,
                        dayOfWeekVal: txtDayOfWeek,
                        dayOfMonth: daysOfMonth,
                        dayOfMonthVal: txtDayOfMonth,
                        overtimeRate: overtimeRate,
                        optionId: optionId == "" ? "0" : optionId
                    }

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/option",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            // clearCompanyTaxOption();
                            $("#resetClearOption").click()

                            var html = '';
                            for (let step = 0; step < res.length; step++) {
                                var deduct = res[step];
                                var str = 'setCompanyTaxOption(this, "' + deduct.startingDate + '","' + deduct.daily + '","' + deduct.weekly + '","' + deduct.monthly + '","' + deduct.annually + '","' + deduct.biweekly + '","' + deduct.quarterly + '","' + deduct.semiAnnually + '","' + deduct.semiMonthly + '","' + deduct.dailyOver + '","' + deduct.weeklyOver + '","' + deduct.dailyOverVal + '","' + deduct.weeklyOverVal + '","' + deduct.wendSt + '","' + deduct.wendStRate + '","' + deduct.wendSn + '","' + deduct.wendSnRate + '","' + deduct.holiday + '","' + deduct.overtimeRate + '","' + deduct.holidayRate + '","' + deduct.dayOfWeek + '","' + deduct.dayOfWeekVal + '","' + deduct.dayOfMonth + '","' + deduct.dayOfMonthVal + '","' + deduct.optionId + '")';
                                html += "<tr class='row-comp-tax-option' id='" + step + "-row-comp-tax-option' onclick='" + str + "'>"
                                html += "<td width='50%' style='font-size:12px;'>" + deduct.startingDate + "</td>"
                                html += "<td width='50%' style='font-size:12px;'>" + deduct.createdAt + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-comtaxoptions-option-list > tbody').html('')
                            $('#tbl-comtaxoptions-option-list > tbody').html(html)

                        },
                        error: function (data) {
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });



    }

    function setCompanyTaxDeduction(obj, deductionListId, deductionListName, deductionAmount, deductionRate, useRate, isTaxExempt)
    {
        // row-comp-tax-deduction
        console.log(deductionListId, deductionListName, deductionAmount, deductionRate, useRate, isTaxExempt);
        $('.row-comp-tax-deduction').removeClass('draft');
        $(obj).addClass('draft');

        $(obj).addClass('draft');
        $('#deductionListId').val(deductionListId);
        $('#deductionName').val(deductionListName);

        $('#deductionRate').val('');
        $('#deductionAmount').val('');



        if (deductionRate && deductionRate > 0) {
            $('#deductRateChck').prop("checked", true);
            $('#deductAmountChck').prop("checked", false);
            $('#deductionRate').val(deductionRate);
            $("#deductionRate").removeAttr("disabled");
            $("#deductionAmount").attr("disabled", "disabled");
        } else if (deductionAmount && deductionAmount > 0) {
            $('#deductRateChck').prop("checked", false);
            $('#deductAmountChck').prop("checked", true);
            $('#deductionAmount').val(deductionAmount);
            $("#deductionAmount").removeAttr("disabled");
            $("#deductionRate").attr("disabled", "disabled");

        }

        if (isTaxExempt && isTaxExempt == 1) {
            $('#taxExemption').prop("checked", true);
        } else {
            $('#taxExemption').prop("checked", false);
        }



    }


    function setCompanyTaxOption(obj, startingDate, daily, weekly, monthly, annually, biweekly, quarterly, semiAnnually, semiMonthly, dailyOver, weeklyOver, dailyOverVal, weeklyOverVal, wendSt, wendStRate, wendSn, wendSnRate, holiday, overtimeRate, holidayRate, dayOfWeek, dayOfWeekVal, dayOfMonth, dayOfMonthVal, optionId)
    {

        // row-comp-tax-deduction
        $('.row-comp-tax-option').removeClass('draft');
        $(obj).addClass('draft');
        $(obj).addClass('draft');
        $('#optionId').val(optionId);

        $('#selectStartingDate').val(startingDate);

        if (dayOfWeek && dayOfWeek == 1) {
            $('#daysOfWeek').prop("checked", true);
            $("#txtDayOfWeek").removeAttr("disabled");
        } else {
            $('#daysOfWeek').prop("checked", false);
            $("#txtDayOfWeek").attr("disabled", "disabled");
        }



        $('#txtDayOfWeek').val(dayOfWeekVal);

        if (dayOfMonth && dayOfMonth == 1) {
            $('#daysOfMonth').prop("checked", true);
            $("#txtDayOfMonth").removeAttr("disabled");
        } else {
            $('#daysOfMonth').prop("checked", false);
            $("#txtDayOfMonth").attr("disabled", "disabled");
        }

        $('#txtDayOfMonth').val(dayOfMonthVal);

        if (daily && daily == 1) {
            $('#dailyOrMiscellaneous').prop("checked", true);
        } else {
            $('#dailyOrMiscellaneous').prop("checked", false);
        }

        if (weekly && weekly == 1) {
            $('#weekly').prop("checked", true);
        } else {
            $('#weekly').prop("checked", false);
        }

        if (biweekly && biweekly == 1) {
            $('#biWeekly').prop("checked", true);
        } else {
            $('#biWeekly').prop("checked", false);
        }
        if (semiMonthly && semiMonthly == 1) {
            $('#semiMonthly').prop("checked", true);
        } else {
            $('#semiMonthly').prop("checked", false);
        }
        if (monthly && monthly == 1) {
            $('#monthly').prop("checked", true);
        } else {
            $('#monthly').prop("checked", false);
        }
        if (quarterly && quarterly == 1) {
            $('#quartely').prop("checked", true);
        } else {
            $('#quartely').prop("checked", false);
        }

        if (semiAnnually && semiAnnually == 1) {
            $('#semiAnnually').prop("checked", true);
        } else {
            $('#semiAnnually').prop("checked", false);
        }

        if (annually && annually == 1) {
            $('#annually').prop("checked", true);
        } else {
            $('#annually').prop("checked", false);
        }
        if (dailyOver && dailyOver == 1) {
            $('#dailyOverHours').prop("checked", true);
            $("#dailyHours").removeAttr("disabled");
        } else {
            $('#dailyOverHours').prop("checked", false);
        }


        $('#dailyHours').val(dailyOverVal)

        if (wendSt && wendSt == 1) {
            $("#weekendSaturdayRate").removeAttr("disabled");
            $('#weekendSaturday').prop("checked", true);
        } else {
            $('#weekendSaturday').prop("checked", false);
            $("#weekendSaturdayRate").attr("disabled", "disabled");
        }


        $('#weekendSaturdayRate').val(wendStRate)

        if (weeklyOver && weeklyOver == 1) {
            $('#weeklyOverHours').prop("checked", true);
            $("#weeklyHours").removeAttr("disabled");
        } else {
            $('#weeklyOverHours').prop("checked", false);


        }
        $('#weeklyHours').val(weeklyOverVal)

        if (wendSn && wendSn == 1) {
            $('#weekendSunday').prop("checked", true);
            $("#weekendSundayRate").removeAttr("disabled");

        } else {
            $('#weekendSunday').prop("checked", false);
            $("#weekendSundayRate").attr("disabled", "disabled");
        }


        $('#weekendSundayRate').val(wendSnRate)


        if (holiday && holiday == 1) {
            $("#holidayRate").removeAttr("disabled");
            $('#holiday').prop("checked", true);
        } else {
            $('#holiday').prop("checked", false);
            $("#holidayRate").attr("disabled", "disabled");
        }



        $('#holidayRate').val(holidayRate);
        $('#overtimeRate').val(overtimeRate);




    }



    function setSIDOther(obj, ID, TaxName, TaxRate, UpTo)
    {
        $('.row-state-tax-other').removeClass('draft');
        $(obj).addClass('draft');
        $(obj).addClass('draft');
        $('#sidOtherName').val(TaxName);

        $('#sidOtherId').val(ID);
        $('#sidOtherRate').val(TaxRate)
        $('#sidOtherUpTo').val(UpTo);
    }


    function clearSIDOthers() {
        $('.row-state-tax-other').removeClass('draft');
        $('#sidOtherId').val('');
        $('#sidOtherId').val('');
        $('#sidOtherRate').val('')
        $('#sidOtherUpTo').val('');
        $('#sidOtherName').val('');

    }


    function saveSID() {


        var otherStateChck1 = $('#otherStateChck_1').is(":checked") ? 1 : 0;
        var otherStateChck2 = $('#otherStateChck_2').is(":checked") ? 1 : 0;
        var otherStateChck3 = $('#otherStateChck_3').is(":checked") ? 1 : 0;

        var otherStateInput1 = $('#otherStateInput_1').val();
        var otherStateInput2 = $('#otherStateInput_2').val();
        var otherStateInput3 = $('#otherStateInput_3').val();

        var otherStateTaxRate1 = $('#otherStateTaxRate_1').val();
        var otherStateTaxRate2 = $('#otherStateTaxRate_2').val();
        var otherStateTaxRate3 = $('#otherStateTaxRate_3').val();


        var otherStateUpto1 = $('#otherStateUpto_1').val();
        var otherStateUpto2 = $('#otherStateUpto_2').val();
        var otherStateUpto3 = $('#otherStateUpto_3').val();

        var ettRate = $('#ettRate').val();
        var uiRate = $('#uiRate').val();
        var sdiRate = $('#sdiRate').val();
        var pitRate = $('#pitRate').val();


        var upToSdi = $('#upToSdi').val();
        var upToEtt = $('#upToEtt').val();
        var upToui = $('#upToui').val();
        var stateTaxId = $('#stateTaxId').val();

        var stateId = $('#stateList').find(":selected").val();




        $("#saveFederalTaxCompanyOption").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        otherStateChck1: otherStateChck1,
                        otherStateChck2: otherStateChck2,
                        otherStateChck3: otherStateChck3,

                        otherStateInput1: otherStateInput1,
                        otherStateInput2: otherStateInput2,
                        otherStateInput3: otherStateInput3,

                        otherStateTaxRate1: otherStateTaxRate1,
                        otherStateTaxRate2: otherStateTaxRate2,
                        otherStateTaxRate3: otherStateTaxRate3,

                        otherStateUpto1: otherStateUpto1,
                        otherStateUpto2: otherStateUpto2,
                        otherStateUpto3: otherStateUpto3,

                        ettRate: ettRate,
                        uiRate: uiRate,
                        sdiRate: sdiRate,
                        pitRate: pitRate,

                        upToSdi: upToSdi,
                        upToEtt: upToEtt,
                        upToui: upToui,

                        stateTaxId: stateTaxId,
                        stateId: stateId
                    }

                    console.log('postData -->', postData)

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/StateTax",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            // clearCompanyTaxOption();
                            $("#resetSIDOthers").click()

                            var html = '';
                            for (let step = 0; step < res.length; step++) {
                                var deduct = res[step];
                                console.log(deduct);
                                // ID, TaxName, TaxRate, UpTo
                                var str = 'setSIDOther(this, "' + deduct.id + '","' + deduct.name + '","' + deduct.rate + '","' + deduct.upTo + '","' + deduct.stateId + '")';
                                html += "<tr class='row-state-tax-other' id='" + step + "-row-state-tax-other' onclick='" + str + "'>"
                                html += "<td width='40%' style='font-size:12px;'>" + deduct.name + "</td>"
                                html += "<td width='30%' style='font-size:12px;'>" + deduct.rate + "</td>"
                                html += "<td width='30%' style='font-size:12px;'>" + deduct.upTo + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-statetax-other-list > tbody').html('')
                            $('#tbl-statetax-other-list > tbody').html(html)
                        },
                        error: function (data) {
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });

    }



    function deleteSIDOthers()
    {
        var sidOtherId = $('#sidOtherId').val();


        // validation....
        if (optionId == '') {
            $("#federaltaxemptydata").dialog({
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
            return;
        }

        $("#deleteFederalTaxCompanyOption").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        id: sidOtherId,
                        stateId: 6
                    }

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/StateTax/OtherTax/delete",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            // clearCompanyTaxDeduction();

                            $("#resetSIDOthers").click()

                            var html = '';
                            var html = '';
                            for (let step = 0; step < res.length; step++) {
                                var deduct = res[step];
                                console.log(deduct);
                                // ID, TaxName, TaxRate, UpTo
                                var str = 'setSIDOther(this, "' + deduct.id + '","' + deduct.name + '","' + deduct.rate + '","' + deduct.upTo + '","' + deduct.stateId + '")';
                                html += "<tr class='row-state-tax-other' id='" + step + "-row-state-tax-other' onclick='" + str + "'>"
                                html += "<td width='40%' style='font-size:12px;'>" + deduct.name + "</td>"
                                html += "<td width='30%' style='font-size:12px;'>" + deduct.rate + "</td>"
                                html += "<td width='30%' style='font-size:12px;'>" + deduct.upTo + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-statetax-other-list > tbody').html('')
                            $('#tbl-statetax-other-list > tbody').html(html)
                            for (let step = 0; step < res.length; step++) {
                                var deduct = res[step];
                                var str = 'setCompanyTaxOption(this, "' + deduct.startingDate + '","' + deduct.daily + '","' + deduct.weekly + '","' + deduct.monthly + '","' + deduct.annually + '","' + deduct.biweekly + '","' + deduct.quarterly + '","' + deduct.semiAnnually + '","' + deduct.semiMonthly + '","' + deduct.dailyOver + '","' + deduct.weeklyOver + '","' + deduct.dailyOverVal + '","' + deduct.weeklyOverVal + '","' + deduct.wendSt + '","' + deduct.wendStRate + '","' + deduct.wendSn + '","' + deduct.wendSnRate + '","' + deduct.holiday + '","' + deduct.overtimeRate + '","' + deduct.holidayRate + '","' + deduct.dayOfWeek + '","' + deduct.dayOfWeekVal + '","' + deduct.dayOfMonth + '","' + deduct.dayOfMonthVal + '","' + deduct.optionId + '")';
                                html += "<tr class='row-comp-tax-option' id='" + step + "-row-comp-tax-option' onclick='" + str + "'>"
                                html += "<td width='50%' style='font-size:12px;'>" + deduct.startingDate + "</td>"
                                html += "<td width='50%' style='font-size:12px;'>" + deduct.createdAt + "</td>"
                                html += "</tr>";
                            }
                            $('#tbl-comtaxoptions-option-list > tbody').html('')
                            $('#tbl-comtaxoptions-option-list > tbody').html(html)
                        },
                        error: function (data) {
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


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    return false;
                }
            }
        });



    }

    function setSITAsDefault() {

        var stateId = $('#stateList').find(":selected").val();


        $('#setAsDefault').hide();

        $("#saveSITsetAsDefault").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        stateId: stateId
                    }

                    console.log('postData -->', postData)

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/StateTax/setAsDefault",
                        data: postData,
                        success: function (res) {
                            // console.log('res',res)
                            // clearCompanyTaxOption();

                        },
                        error: function (data) {
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
                            $('#setAsDefault').show();

                            return false;
                        }
                    });


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    $('#setAsDefault').show();

                    return false;
                }
            }
        });

    }

    function setSITStateActive(active) {


        var stateId = $('#stateList').find(":selected").val();

        var v = active ? '#saveSITStateStatusActive' : '#saveSITStateStatusInActive';

        $(v).dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    var postData = {
                        active: active,
                        stateId: stateId
                    }

                    console.log('postData -->', postData)

                    $(this).dialog("close");

                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/StateTax/setActive",
                        data: postData,
                        success: function (res) {
                            console.log('res', res)
                            // clearCompanyTaxOption();

                            $('#sitStateActive').hide();
                            $('#sitStateInActive').hide();

                            if (res.active) {
                                $('#sitStateInActive').show()
                            } else {
                                $('#sitStateActive').show()
                            }

                        },
                        error: function (data) {
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
                            $('#setAsDefault').show();

                            return false;
                        }
                    });


                },
                "<spring:message code='BzComposer.global.cancel'/>": function () {
                    $(this).dialog("close");
                    $('#setAsDefault').show();

                    return false;
                }
            }
        });

    }

</script>
<script type="text/javascript">
    function syncFitModeUI(mode) {
        var selectedMode = String(mode) === "0" ? "0" : "1";
        $("#autoFIT").val(selectedMode);
        $("input[name='fitMode'][value='" + selectedMode + "']").prop("checked", true);
        $("#rateFIT").prop("disabled", selectedMode !== "0");
    }

    function bindFederalSettingsOverrides() {
        $("#daysOfWeek").off("click").on("click", function () {
            $("#txtDayOfWeek").prop("disabled", !$(this).is(":checked"));
        });

        $("#daysOfMonth").off("click").on("click", function () {
            $("#txtDayOfMonth").prop("disabled", !$(this).is(":checked"));
        });

        $("#dailyOverHours").off("click").on("click", function () {
            $("#dailyHours").prop("disabled", !$(this).is(":checked"));
        });

        $("#weeklyOverHours").off("click").on("click", function () {
            $("#weeklyHours").prop("disabled", !$(this).is(":checked"));
        });

        $("#weekendSaturday").off("click").on("click", function () {
            $("#weekendSaturdayRate").prop("disabled", !$(this).is(":checked"));
        });

        $("#weekendSunday").off("click").on("click", function () {
            $("#weekendSundayRate").prop("disabled", !$(this).is(":checked"));
        });

        $("#holiday").off("click").on("click", function () {
            $("#holidayRate").prop("disabled", !$(this).is(":checked"));
        });

        $("input[name='fitMode']").off("change").on("change", function () {
            syncFitModeUI($(this).val());
        });

        syncFitModeUI($("#autoFIT").val());
        $("#txtDayOfWeek").prop("disabled", !$("#daysOfWeek").is(":checked"));
        $("#txtDayOfMonth").prop("disabled", !$("#daysOfMonth").is(":checked"));
        $("#dailyHours").prop("disabled", !$("#dailyOverHours").is(":checked"));
        $("#weeklyHours").prop("disabled", !$("#weeklyOverHours").is(":checked"));
        $("#weekendSaturdayRate").prop("disabled", !$("#weekendSaturday").is(":checked"));
        $("#weekendSundayRate").prop("disabled", !$("#weekendSunday").is(":checked"));
        $("#holidayRate").prop("disabled", !$("#holiday").is(":checked"));
    }

    function renderCompanyTaxDeductions(rows) {
        var $table = $("#tbl-comtaxoptions-deduction-list");
        var $tbody = $table.find("tbody");
        if ($tbody.length === 0) {
            $tbody = $("<tbody></tbody>").appendTo($table);
        }

        $tbody.empty();

        (rows || []).forEach(function (d, index) {
            var deductionId = d.deductionListId == null ? "" : String(d.deductionListId);
            var deductionName = d.deductionListName == null ? "" : String(d.deductionListName);
            var deductionAmount = d.deductionAmount == null ? "" : String(d.deductionAmount);
            var deductionRate = d.deductionRate == null ? "" : String(d.deductionRate);
            var useRate = d.useRate != null ? String(d.useRate) : (Number(deductionRate) > 0 ? "1" : "0");

            var $row = $("<tr>", {
                "class": "row-comp-tax-deduction",
                id: index + "-row-comp-tax-deduction"
            });

            $row.on("click", function () {
                setCompanyTaxDeduction(this, deductionId, deductionName, deductionAmount, deductionRate, useRate);
            });

            $row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(deductionName));
            $row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(deductionAmount));
            $row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(deductionRate));
            $row.append($("<td>", { width: "20%", style: "font-size:12px;" }).text(useRate === "1" ? "Yes" : "No"));

            $tbody.append($row);
        });
    }

    function refreshCompanyTaxDeductions() {
        $.ajax({
            type: "GET",
            url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction/list",
            success: function (rows) {
                renderCompanyTaxDeductions(Array.isArray(rows) ? rows : []);
            },
            error: function () {
                renderCompanyTaxDeductions([]);
            }
        });
    }

    function refreshCompanyTaxOptions() {
        $.ajax({
            type: "GET",
            url: "/dashboard/Configuration/FederalTax/companyTaxOption/option/list",
            success: function (rows) {
                var safeRows = Array.isArray(rows) ? rows : [];
                renderCompanyTaxOptions(safeRows);
                if (safeRows.length > 0) {
                    var selectedOptionId = $("#optionId").val();
                    var selectedOption = safeRows.find(function (row) {
                        return String(row.optionId || "") === String(selectedOptionId || "");
                    }) || safeRows[0];
                    setCompanyTaxOption(null,
                        selectedOption.startingDate || "",
                        selectedOption.daily || 0,
                        selectedOption.weekly || 0,
                        selectedOption.monthly || 0,
                        selectedOption.annually || 0,
                        selectedOption.biweekly || 0,
                        selectedOption.quarterly || 0,
                        selectedOption.semiAnnually || 0,
                        selectedOption.semiMonthly || 0,
                        selectedOption.dailyOver || 0,
                        selectedOption.weeklyOver || 0,
                        selectedOption.dailyOverVal || "",
                        selectedOption.weeklyOverVal || "",
                        selectedOption.wendSt || 0,
                        selectedOption.wendStRate || "",
                        selectedOption.wendSn || 0,
                        selectedOption.wendSnRate || "",
                        selectedOption.holiday || 0,
                        selectedOption.overtimeRate || "",
                        selectedOption.holidayRate || "",
                        selectedOption.dayOfWeek || 0,
                        selectedOption.dayOfWeekVal || "",
                        selectedOption.dayOfMonth || 0,
                        selectedOption.dayOfMonthVal || "",
                        selectedOption.optionId || 0);
                } else {
                    clearCompanyTaxOption();
                }
            },
            error: function () {
                renderCompanyTaxOptions([]);
            }
        });
    }

    function renderCompanyTaxOptions(rows) {
        var html = "";
        (rows || []).forEach(function (opt, index) {
            var str = "setCompanyTaxOption(this, '" + (opt.startingDate || "") + "','" + (opt.daily || 0) + "','" + (opt.weekly || 0) + "','" + (opt.monthly || 0) + "','" + (opt.annually || 0) + "','" + (opt.biweekly || 0) + "','" + (opt.quarterly || 0) + "','" + (opt.semiAnnually || 0) + "','" + (opt.semiMonthly || 0) + "','" + (opt.dailyOver || 0) + "','" + (opt.weeklyOver || 0) + "','" + (opt.dailyOverVal || "") + "','" + (opt.weeklyOverVal || "") + "','" + (opt.wendSt || 0) + "','" + (opt.wendStRate || "") + "','" + (opt.wendSn || 0) + "','" + (opt.wendSnRate || "") + "','" + (opt.holiday || 0) + "','" + (opt.overtimeRate || "") + "','" + (opt.holidayRate || "") + "','" + (opt.dayOfWeek || 0) + "','" + (opt.dayOfWeekVal || "") + "','" + (opt.dayOfMonth || 0) + "','" + (opt.dayOfMonthVal || "") + "','" + (opt.optionId || 0) + "')";
            html += "<tr class='row-comp-tax-option' id='" + index + "-row-comp-tax-option' onclick=\"" + str + "\">";
            html += "<td width='50%' style='font-size:12px;'>" + (opt.startingDate || "") + "</td>";
            html += "<td width='50%' style='font-size:12px;'>" + (opt.createdAt || "") + "</td>";
            html += "</tr>";
        });
        $("#tbl-comtaxoptions-option-list > tbody").html(html);
    }

    function currentCompanyTaxOptionPayload() {
        return {
            startingDate: $("#selectStartingDate").val(),
            daily: $("#dailyOrMiscellaneous").is(":checked") ? 1 : 0,
            weekly: $("#weekly").is(":checked") ? 1 : 0,
            monthly: $("#monthly").is(":checked") ? 1 : 0,
            annually: $("#annually").is(":checked") ? 1 : 0,
            biweekly: $("#biWeekly").is(":checked") ? 1 : 0,
            quarterly: $("#quartely").is(":checked") ? 1 : 0,
            semiAnnually: $("#semiAnnually").is(":checked") ? 1 : 0,
            semiMonthly: $("#semiMonthly").is(":checked") ? 1 : 0,
            dailyOver: $("#dailyOverHours").is(":checked") ? 1 : 0,
            weeklyOver: $("#weeklyOverHours").is(":checked") ? 1 : 0,
            dailyOverVal: $("#dailyHours").val(),
            weeklyOverVal: $("#weeklyHours").val(),
            wendSt: $("#weekendSaturday").is(":checked") ? 1 : 0,
            wendStRate: $("#weekendSaturdayRate").val(),
            wendSn: $("#weekendSunday").is(":checked") ? 1 : 0,
            wendSnRate: $("#weekendSundayRate").val(),
            holiday: $("#holiday").is(":checked") ? 1 : 0,
            holidayRate: $("#holidayRate").val(),
            dayOfWeek: $("#daysOfWeek").is(":checked") ? 1 : 0,
            dayOfWeekVal: $("#txtDayOfWeek").val(),
            dayOfMonth: $("#daysOfMonth").is(":checked") ? 1 : 0,
            dayOfMonthVal: $("#txtDayOfMonth").val(),
            overtimeRate: $("#overtimeRate").val(),
            optionId: $("#optionId").val() === "" ? "0" : $("#optionId").val()
        };
    }

    function hasCompanyTaxOptionData(payload) {
        return Boolean(
            payload.optionId !== "0" ||
            payload.startingDate ||
            payload.daily || payload.weekly || payload.monthly || payload.annually ||
            payload.biweekly || payload.quarterly || payload.semiAnnually || payload.semiMonthly ||
            payload.dailyOver || payload.weeklyOver || payload.wendSt || payload.wendSn || payload.holiday ||
            payload.dayOfWeek || payload.dayOfMonth ||
            payload.dailyOverVal || payload.weeklyOverVal || payload.wendStRate || payload.wendSnRate ||
            payload.holidayRate || payload.dayOfWeekVal || payload.dayOfMonthVal || payload.overtimeRate
        );
    }

    function currentDeductionPayload() {
        var deductionListId = $("#deductionListId").val();
        var deductionListName = $.trim($("#deductionName").val());
        var useRate = $("#deductRateChck").is(":checked");
        return {
            deductionListId: deductionListId === "" ? "0" : deductionListId,
            deductionListName: deductionListName,
            deductionRate: useRate ? $("#deductionRate").val() : 0,
            deductionAmount: useRate ? 0 : $("#deductionAmount").val(),
            isTaxExempt: 0
        };
    }

    function hasDeductionPayload(payload) {
        return Boolean(payload && payload.deductionListName);
    }

    function applyFederalTaxResponse(res, selectedYear) {
        var yearValue = selectedYear || $("#selectedTaxYear").val() || $("#selectedTaxYearEmplyr").val();
        if (yearValue) {
            $("#selectedTaxYear").val(String(yearValue));
            $("#selectedTaxYearEmplyr").val(String(yearValue));
        }

        $("#autoFIT").val(res && res.autoFIT != null ? String(res.autoFIT) : "1");
        $("#rateFICA").val(res && res.rateFICA != null ? res.rateFICA : "");
        $("#ficaRateEmplyr").val(res && res.rateFICA != null ? res.rateFICA : "");
        $("#rateSocialTax").val(res && res.rateSocialTax != null ? res.rateSocialTax : "");
        $("#sstRateEmplyr").val(res && res.rateSocialTax != null ? res.rateSocialTax : "");
        $("#socialTaxLimit").val(res && res.socialTaxLimit != null ? res.socialTaxLimit : "");
        $("#upToEmplyr").val(res && res.socialTaxLimit != null ? res.socialTaxLimit : "");
        $("#rateMedicareTax").val(res && res.rateMedicareTax != null ? res.rateMedicareTax : "");
        $("#medicareRateEmplyr").val(res && res.rateMedicareTax != null ? res.rateMedicareTax : "");
        $("#rateFUTA").val(res && res.rateFUTA != null ? res.rateFUTA : "");
        $("#rateFIT").val(res && res.rateFIT != null ? res.rateFIT : "");

        if ($("#federalIncomeTaxEmplyr").length) {
            $("#federalIncomeTaxEmplyr").val($("#autoFIT").val());
        }

        syncFitModeUI($("#autoFIT").val());
    }

    function loadFederalTaxYear(year) {
        if (!year) {
            return;
        }
        $.ajax({
            type: "GET",
            url: "/dashboard/Configuration/FederalTax/companyTaxInfo/loadTaxYear/" + year,
            success: function (res) {
                applyFederalTaxResponse(res || {}, year);
            }
        });
    }

    function getFederalTaxPostData() {
        return {
            fiscalMonth: $("#fiscalMonth").val(),
            autoFIT: parseInt($("#autoFIT").val(), 10) || 1,
            yearFIT: $("#selectedTaxYear").val(),
            rateFICA: $("#rateFICA").val() || $("#ficaRateEmplyr").val(),
            rateSocialTax: $("#rateSocialTax").val() || $("#sstRateEmplyr").val(),
            socialTaxLimit: $("#socialTaxLimit").val() || $("#upToEmplyr").val(),
            rateMedicareTax: $("#rateMedicareTax").val() || $("#medicareRateEmplyr").val(),
            rateFUTA: $("#rateFUTA").val(),
            rateFIT: $("#rateFIT").val()
        };
    }

    saveFederalTax = function () {
        var postData = getFederalTaxPostData();
        var deductionPayload = currentDeductionPayload();
        var optionPayload = currentCompanyTaxOptionPayload();

        $("#saveFederaTax").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "Ok": function () {
                    $(this).dialog("close");
                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxInfo",
                        data: postData,
                        success: function (res) {
                            if (!(res && res.success)) {
                                alert((res && res.message) || "Unable to save federal tax settings.");
                                return;
                            }

                            var saveDeduction = hasDeductionPayload(deductionPayload);
                            var saveOption = hasCompanyTaxOptionData(optionPayload);

                            if (!saveDeduction && !saveOption) {
                                alert(res.message || "Federal tax configuration saved successfully!");
                                return;
                            }

                            var finishSave = function () {
                                loadFederalTaxYear(postData.yearFIT);
                                refreshCompanyTaxOptions();
                                refreshCompanyTaxDeductions();
                                alert("Federal tax settings saved successfully!");
                            };

                            var saveOptionRequest = function () {
                                if (!saveOption) {
                                    finishSave();
                                    return;
                                }
                                $.ajax({
                                    type: "POST",
                                    url: "/dashboard/Configuration/FederalTax/companyTaxOption/option",
                                    data: optionPayload,
                                    success: function () {
                                        refreshCompanyTaxOptions();
                                        finishSave();
                                    },
                                    error: function () {
                                        $("#errorOccurred").dialog({
                                            resizable: false,
                                            height: 200,
                                            width: 500,
                                            modal: true,
                                            buttons: { "Ok": function () { $(this).dialog("close"); } }
                                        });
                                    }
                                });
                            };

                            if (!saveDeduction) {
                                saveOptionRequest();
                                return;
                            }

                            $.ajax({
                                type: "POST",
                                url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction",
                                data: deductionPayload,
                                success: function () {
                                    refreshCompanyTaxDeductions();
                                    saveOptionRequest();
                                },
                                error: function () {
                                    $("#errorOccurred").dialog({
                                        resizable: false,
                                        height: 200,
                                        width: 500,
                                        modal: true,
                                        buttons: { "Ok": function () { $(this).dialog("close"); } }
                                    });
                                }
                            });
                        },
                        error: function () {
                            $("#errorOccurred").dialog({
                                resizable: false,
                                height: 200,
                                width: 500,
                                modal: true,
                                buttons: { "Ok": function () { $(this).dialog("close"); } }
                            });
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
    };

    clearCompanyTaxDeduction = function () {
        $(".row-comp-tax-deduction").removeClass("draft");
        $("#deductionListId").val("");
        $("#deductionName").val("");
        $("#deductionRate").val("").prop("disabled", true);
        $("#deductionAmount").val("").prop("disabled", false);
        $("#deductAmountChck").prop("checked", true);
        $("#deductRateChck").prop("checked", false);
    };

    saveCompanyTaxDeduction = function (edit) {
        var deductionListId = edit ? $("#deductionListId").val() : "";
        var deductionListName = $.trim($("#deductionName").val());
        var deductionRate = $("#deductRateChck").is(":checked") ? $("#deductionRate").val() : 0;
        var deductionAmount = $("#deductAmountChck").is(":checked") ? $("#deductionAmount").val() : 0;

        if ((edit && deductionListId === "") || (!edit && deductionListId !== "") || deductionListName === "") {
            $("#federaltaxemptydata").dialog({
                resizable: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: { "Ok": function () { $(this).dialog("close"); } }
            });
            return;
        }

        $("#saveFederalTaxCompanyDeduction").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "Ok": function () {
                    $(this).dialog("close");
                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction",
                        data: {
                            deductionListId: deductionListId === "" ? "0" : deductionListId,
                            deductionListName: deductionListName,
                            deductionRate: deductionRate,
                            deductionAmount: deductionAmount,
                            isTaxExempt: 0
                        },
                        success: function () {
                            clearCompanyTaxDeduction();
                            refreshCompanyTaxDeductions();
                            alert(edit ? "Deduction updated successfully!" : "Deduction added successfully!");
                        },
                        error: function () {
                            $("#errorOccurred").dialog({
                                resizable: false,
                                height: 200,
                                width: 500,
                                modal: true,
                                buttons: { "Ok": function () { $(this).dialog("close"); } }
                            });
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
    };

    deleteCompanyTaxDeduction = function () {
        var deductionListId = $("#deductionListId").val();

        if (deductionListId === "") {
            $("#federaltaxemptydata").dialog({
                resizable: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: { "Ok": function () { $(this).dialog("close"); } }
            });
            return;
        }

        $("#deleteFederalTaxCompanyDeduction").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "Ok": function () {
                    $(this).dialog("close");
                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/deduction/delete",
                        data: { deductionListId: deductionListId },
                        success: function () {
                            clearCompanyTaxDeduction();
                            refreshCompanyTaxDeductions();
                        },
                        error: function () {
                            $("#errorOccurred").dialog({
                                resizable: false,
                                height: 200,
                                width: 500,
                                modal: true,
                                buttons: { "Ok": function () { $(this).dialog("close"); } }
                            });
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
    };

    saveCompanyTaxOption = function (edit) {
        var payload = currentCompanyTaxOptionPayload();

        if ((edit && payload.optionId === "0") || (!edit && payload.optionId !== "0")) {
            $("#federaltaxemptydata").dialog({
                resizable: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: { "Ok": function () { $(this).dialog("close"); } }
            });
            return;
        }

        $("#saveFederalTaxCompanyOption").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "Ok": function () {
                    $(this).dialog("close");
                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/option",
                        data: payload,
                        success: function () {
                            refreshCompanyTaxOptions();
                            clearCompanyTaxOption();
                            alert(edit ? "Company tax option updated successfully!" : "Company tax option added successfully!");
                        },
                        error: function () {
                            $("#errorOccurred").dialog({
                                resizable: false,
                                height: 200,
                                width: 500,
                                modal: true,
                                buttons: { "Ok": function () { $(this).dialog("close"); } }
                            });
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
    };

    deleteCompanyTaxOption = function () {
        var optionId = $("#optionId").val();

        if (optionId === "") {
            $("#federaltaxemptydata").dialog({
                resizable: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: { "Ok": function () { $(this).dialog("close"); } }
            });
            return;
        }

        $("#deleteFederalTaxCompanyOption").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "Ok": function () {
                    $(this).dialog("close");
                    $.ajax({
                        type: "POST",
                        url: "/dashboard/Configuration/FederalTax/companyTaxOption/option/delete",
                        data: { optionId: optionId },
                        success: function () {
                            clearCompanyTaxOption();
                            refreshCompanyTaxOptions();
                        },
                        error: function () {
                            $("#errorOccurred").dialog({
                                resizable: false,
                                height: 200,
                                width: 500,
                                modal: true,
                                buttons: { "Ok": function () { $(this).dialog("close"); } }
                            });
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
    };

    setCompanyTaxDeduction = function (obj, deductionListId, deductionListName, deductionAmount, deductionRate, useRate) {
        $(".row-comp-tax-deduction").removeClass("draft");
        $(obj).addClass("draft");
        $("#deductionListId").val(deductionListId);
        $("#deductionName").val(deductionListName);
        $("#deductionRate").val("");
        $("#deductionAmount").val("");

        if (deductionRate && Number(deductionRate) > 0) {
            $("#deductRateChck").prop("checked", true);
            $("#deductAmountChck").prop("checked", false);
            $("#deductionRate").val(deductionRate).prop("disabled", false);
            $("#deductionAmount").prop("disabled", true);
        } else {
            $("#deductRateChck").prop("checked", false);
            $("#deductAmountChck").prop("checked", true);
            $("#deductionAmount").val(deductionAmount).prop("disabled", false);
            $("#deductionRate").prop("disabled", true);
        }
    };

    setCompanyTaxOption = function (obj, startingDate, daily, weekly, monthly, annually, biweekly, quarterly, semiAnnually, semiMonthly, dailyOver, weeklyOver, dailyOverVal, weeklyOverVal, wendSt, wendStRate, wendSn, wendSnRate, holiday, overtimeRate, holidayRate, dayOfWeek, dayOfWeekVal, dayOfMonth, dayOfMonthVal, optionId) {
        $(".row-comp-tax-option").removeClass("draft");
        if (obj) {
            $(obj).addClass("draft");
        }
        $("#optionId").val(optionId);
        $("#selectStartingDate").val(startingDate);

        $("#daysOfWeek").prop("checked", String(dayOfWeek) === "1");
        $("#txtDayOfWeek").prop("disabled", String(dayOfWeek) !== "1").val(dayOfWeekVal);
        $("#daysOfMonth").prop("checked", String(dayOfMonth) === "1");
        $("#txtDayOfMonth").prop("disabled", String(dayOfMonth) !== "1").val(dayOfMonthVal);

        $("#dailyOrMiscellaneous").prop("checked", String(daily) === "1");
        $("#weekly").prop("checked", String(weekly) === "1");
        $("#biWeekly").prop("checked", String(biweekly) === "1");
        $("#semiMonthly").prop("checked", String(semiMonthly) === "1");
        $("#monthly").prop("checked", String(monthly) === "1");
        $("#quartely").prop("checked", String(quarterly) === "1");
        $("#semiAnnually").prop("checked", String(semiAnnually) === "1");
        $("#annually").prop("checked", String(annually) === "1");

        $("#dailyOverHours").prop("checked", String(dailyOver) === "1");
        $("#dailyHours").prop("disabled", String(dailyOver) !== "1").val(dailyOverVal);
        $("#weeklyOverHours").prop("checked", String(weeklyOver) === "1");
        $("#weeklyHours").prop("disabled", String(weeklyOver) !== "1").val(weeklyOverVal);

        $("#weekendSaturday").prop("checked", String(wendSt) === "1");
        $("#weekendSaturdayRate").prop("disabled", String(wendSt) !== "1").val(wendStRate);
        $("#weekendSunday").prop("checked", String(wendSn) === "1");
        $("#weekendSundayRate").prop("disabled", String(wendSn) !== "1").val(wendSnRate);
        $("#holiday").prop("checked", String(holiday) === "1");
        $("#holidayRate").prop("disabled", String(holiday) !== "1").val(holidayRate);
        $("#overtimeRate").val(overtimeRate);
    };

    $(document).ready(function () {
        bindFederalSettingsOverrides();
        refreshCompanyTaxDeductions();
        refreshCompanyTaxOptions();
        $("#selectedTaxYear").off("change.codexFederal").on("change.codexFederal", function () {
            loadFederalTaxYear($(this).val());
        });
        $("#selectedTaxYearEmplyr").off("change.codexFederal").on("change.codexFederal", function () {
            var year = $(this).val();
            $("#selectedTaxYear").val(year);
            loadFederalTaxYear(year);
        });
        if ($("#selectedTaxYear").val()) {
            loadFederalTaxYear($("#selectedTaxYear").val());
        }
    });
</script>
</html>
<!-- Dialog box used in this page -->
<div id="selectshippingtypedialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.tax.selectshippingtype"/></p>
</div>
<div id="selectshippingtypetoupdatedialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.tax.selectshippingviatoupdate"/></p>
</div>
<div id="duplicatevaluedialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.tax.duplicatevalue"/></p>
</div>
<div id="saveFederaTax" style="display:none;">
    <p><spring:message code="BzComposer.federaltax.savefederaltax"/></p>
</div>
<div id="saveSITStateStatusActive" style="display:none;">
    <p><spring:message code="BzComposer.statetax.saveactive"/></p>
</div>
<div id="saveSITStateStatusInActive" style="display:none;">
    <p><spring:message code="BzComposer.statetax.saveinactive"/></p>
</div>
<div id="saveSITsetAsDefault" style="display:none;">
    <p><spring:message code="BzComposer.statetax.savesetasdefault"/></p>
</div>


<div id="saveFederalTaxCompanyDeduction" style="display:none;">
    <p><spring:message code="BzComposer.federaltax.savefederaltaxcompanydeduction"/></p>
</div>
<div id="saveFederalTaxCompanyOption" style="display:none;">
    <p><spring:message code="BzComposer.federaltax.savefederaltaxcompanydeduction"/></p>
</div>
<div id="deleteFederalTaxCompanyDeduction" style="display:none;">
    <p><spring:message code="BzComposer.federaltax.deletefederaltaxcompanydeduction"/></p>
</div>
<div id="deleteFederalTaxCompanyOption" style="display:none;">
    <p><spring:message code="BzComposer.federaltax.deletefederaltaxcompanydeduction"/></p>
</div>
<div id="errorOccurred" style="display:none;font-size:12px;">
    <p><spring:message code="BzComposer.common.erroroccurred"/></p>
</div>
<div id="federaltaxemptydata" style="display:none;font-size:12px;">
    <p><spring:message code="BzComposer.federaltax.emptydata"/></p>
</div>



<%--Extra Code end--%>
