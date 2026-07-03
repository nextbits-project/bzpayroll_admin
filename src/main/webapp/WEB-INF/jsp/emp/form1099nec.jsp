<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>BzPayroll - Form 1099-NEC</title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.employee-row:hover {
    background-color: #808080;
    color: #fff;
    font-weight: bold;
}

.form1099-layout {
    display: flex;
    width: 100%;
}

.contractor-panel {
    width: 15%;
    border: 1px solid #ccc;
    height: 430px;
    overflow-y: auto;
}

.form1099-panel {
    width: 80%;
    padding-left: 10px;
}

.form1099-shell {
    border: 0;
    width: 100%;
}

.form1099-shell-cell {
    padding-right: 20px;
    padding-bottom: 20px;
    vertical-align: top;
}

.form1099-panel-header {
    background-color: #d3d3d3;
    text-align: center;
    color: #111 !important;
}

.nec-wrapper {
    border: 1px solid #000;
    background: #fff;
    width: 100%;
    max-width: none;
    margin: 0;
    font-family: Arial, Helvetica, sans-serif;
    color: #111;
    font-size: 12px;
}

.nec-flags {
    text-align: center;
    font-size: 12px;
    padding: 10px 0 6px;
    letter-spacing: 0.2px;
}

.nec-flags label {
    margin: 0 24px;
    font-size: 18px;
    font-weight: 400;
    color: #111 !important;
}

.nec-body {
    display: flex;
    border-top: 1px solid #000;
}

.nec-left {
    width: 82%;
    border-right: 1px solid #000;
}

.nec-right {
    width: 18%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.nec-grid {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.nec-grid td {
    border: 1px solid #000;
    vertical-align: top;
    padding: 6px 8px;
    font-size: 12px;
    line-height: 1.2;
    color: #111 !important;
}

.omb-cell {
    text-align: center;
    padding: 0;
}

.omb-cell .line {
    border-bottom: 1px solid #000;
    padding: 8px 8px;
    font-size: 12px;
    color: #111 !important;
}

.omb-cell .line:last-child {
    border-bottom: none;
}

.nec-main-title {
    font-size: 52px;
    font-weight: 700;
    color: #111 !important;
}

.copy-panel-top {
    border-bottom: 1px solid #000;
    text-align: center;
    font-size: 16px;
    font-weight: 700;
    padding: 40px 10px;
    line-height: 1.1;
    color: #111 !important;
}

.copy-panel-bottom {
    text-align: center;
    font-size: 18px;
    font-weight: 700;
    padding: 70px 10px;
    line-height: 1.2;
    color: #111 !important;
}

.label {
    display: block;
    font-size: 11px;
    margin-bottom: 4px;
    color: #111 !important;
    font-weight: 600;
}

.value,
.value-area {
    width: 100%;
    border: none;
    outline: none;
    background: transparent;
    font-size: 12px;
    font-family: Arial, Helvetica, sans-serif;
    color: #111 !important;
}

.value {
    height: 22px;
}

.value-area {
    min-height: 64px;
    resize: vertical;
}

.recipient-area .value {
    margin-bottom: 6px;
}

.money-wrap {
    display: flex;
    align-items: center;
    margin-top: 4px;
}

.money-sign {
    font-size: 24px;
    margin-right: 4px;
    color: #111 !important;
}

.money-input {
    width: 100%;
    border: none;
    outline: none;
    background: transparent;
    border-bottom: 1px dashed #444;
    height: 22px;
    font-size: 12px;
    font-family: Arial, Helvetica, sans-serif;
    color: #111 !important;
}

.inline-check {
    float: right;
    transform: scale(1.1);
    margin-right: 8px;
    margin-top: 2px;
}

.state-table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}

.state-table td {
    border: 1px solid #000;
    font-size: 11px;
    padding: 6px 8px;
    vertical-align: top;
    color: #111 !important;
}

.nec-footer {
    border-top: 1px solid #000;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 4px 8px 7px;
    font-size: 10px;
    color: #111 !important;
}

.save-row {
    text-align: right;
    margin-top: 5px;
}

.nec-wrapper input,
.nec-wrapper textarea {
    border: none !important;
    box-shadow: none !important;
    color: #111 !important;
    background: transparent !important;
    font-family: Arial, Helvetica, sans-serif !important;
}

.nec-wrapper textarea:focus,
.nec-wrapper input:focus {
    outline: none !important;
}

/* Override global admin.css span color (teal) inside this form */
#padding #form1099nec .nec-wrapper span,
#padding #form1099nec .nec-wrapper label,
#padding #form1099nec .nec-wrapper td,
#padding #form1099nec .nec-wrapper div {
    color: #111 !important;
}

#padding #form1099nec .nec-main-title {
    color: #111 !important;
}
</style>

<script>
let selectedEmployeeId = null;

function clear1099Form() {
    $('#form1099nec').find('input[type="text"], input[type="number"], textarea').val('');
    $('#form1099nec').find('input[type="checkbox"]').prop('checked', false);
}

function prefillFromEmployee(employeeId) {
    $.ajax({
        url: '/api/employees/' + employeeId,
        type: 'GET',
        success: function (emp) {
            if (!emp) {
                return;
            }
            $('input[name="employeeIndexId"]').val(emp.id || '');
            $('input[name="recipientTin"]').val(emp.ssn || '');
            $('input[name="recipientName"]').val(((emp.firstName || '') + ' ' + (emp.lastName || '')).trim());
            $('input[name="recipientStreetAddress"]').val(((emp.address1 || '') + ' ' + (emp.address2 || '')).trim());
            $('input[name="recipientCityStateZip"]').val(
                ((emp.city || '') + ', ' + (emp.state || '') + ', ' + (emp.country || '') + ' ' + (emp.zipCode || '')).trim()
            );
            $('input[name="accountNumber"]').val(emp.id || '');
            if (!$('input[name="taxYear"]').val()) {
                $('input[name="taxYear"]').val(new Date().getFullYear());
            }
        }
    });
}

function loadSavedForm(employeeId) {
    $.ajax({
        url: '/api/form1099nec/' + employeeId,
        type: 'GET',
        success: function (data) {
            clear1099Form();
            if (data) {
                $('input[name="employeeIndexId"]').val(data.employeeIndexId || '');
                $('input[name="voidFlag"]').prop('checked', data.voidFlag === 'Yes');
                $('input[name="corrected"]').prop('checked', data.corrected === 'Yes');
                $('textarea[name="payerNameAddress"]').val(data.payerNameAddress || '');
                $('input[name="payerTin"]').val(data.payerTin || '');
                $('input[name="recipientTin"]').val(data.recipientTin || '');
                $('input[name="recipientName"]').val(data.recipientName || '');
                $('input[name="recipientStreetAddress"]').val(data.recipientStreetAddress || '');
                $('input[name="recipientCityStateZip"]').val(data.recipientCityStateZip || '');
                $('input[name="accountNumber"]').val(data.accountNumber || '');
                $('input[name="nonemployeeCompensation"]').val(data.nonemployeeCompensation || '');
                $('input[name="directSales"]').prop('checked', data.directSales === 'Yes');
                $('input[name="excessGoldenParachutePayments"]').val(data.excessGoldenParachutePayments || '');
                $('input[name="federalIncomeTaxWithheld"]').val(data.federalIncomeTaxWithheld || '');
                $('input[name="stateTaxWithheld"]').val(data.stateTaxWithheld || '');
                $('input[name="statePayerStateNo"]').val(data.statePayerStateNo || '');
                $('input[name="stateIncome"]').val(data.stateIncome || '');
                $('input[name="taxYear"]').val(data.taxYear || '');
            } else {
                prefillFromEmployee(employeeId);
            }
        },
        error: function () {
            clear1099Form();
            prefillFromEmployee(employeeId);
        }
    });
}

$(document).ready(function () {
    $('#custTableBody').on('click', '.employee-row', function () {
        $('.employee-row').css({
            'background-color': '',
            'color': '',
            'font-weight': ''
        });

        $(this).css({
            'background-color': '#808080',
            'color': 'white',
            'font-weight': 'bold'
        });

        const employeeId = $(this).data('id');
        if (!employeeId) {
            return;
        }
        selectedEmployeeId = employeeId;
        loadSavedForm(employeeId);
    });
});
</script>
</head>

<body onload="init();" style="min-width: 1366px;">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
    <div class="statusquo ok">
        <div id="hoja">
            <div id="blanquito">
                <div id="padding">
                    <div>
                        <span
                                style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                            Form 1099-NEC
                        </span>
                    </div>

                    <c:if test="${status == true}">
                        <c:if test="${not empty message}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                ${message}
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${status == false}">
                        <c:if test="${not empty message}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${message}
                            </div>
                        </c:if>
                    </c:if>

                    <form id="form1099nec" action="save-form1099nec" method="post">
                        <input type="hidden" name="employeeIndexId" />
                        <div class="form1099-layout">
                            <div class="contractor-panel">
                                <div id="table-negotiations" style="padding: 0;">
                                    <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                        <thead>
                                        <tr style="background-color: #f2f2f2;">
                                            <td>
                                                <div class="panel-header" style="background-color: #D3D3D3;">
                                                    <strong>&nbsp;&nbsp;Contractor List</strong>
                                                </div>
                                            </td>
                                        </tr>
                                        </thead>
                                        <tbody id="custTableBody">
                                        <c:forEach var="emp" items="${dtoList}">
                                            <tr class="employee-row" data-id="${emp.id}"
                                                style="border-bottom: 1px solid #ccc; cursor: pointer;">
                                                <td style="padding: 10px; font-size: 14px;">
                                                        ${empty emp.firstName ? '' : emp.firstName}
                                                        ${empty emp.lastName ? '' : emp.lastName}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="form1099-panel">
                                <table cellspacing="0" class="section-border form1099-shell">
                                    <tr>
                                        <td valign="top" class="form1099-shell-cell">
                                            <div class="panel-header form1099-panel-header">
                                                <strong>&nbsp;&nbsp;Form 1099-NEC Information</strong>
                                            </div>
                                <div class="nec-wrapper">
                                    <div class="nec-flags">
                                        <label><input type="checkbox" name="voidFlag" value="Yes" /> VOID</label>
                                        <label><input type="checkbox" name="corrected" value="Yes" /> CORRECTED</label>
                                    </div>

                                    <div class="nec-body">
                                        <div class="nec-left">
                                            <table class="nec-grid">
                                                <colgroup>
                                                    <col style="width: 28%;">
                                                    <col style="width: 28%;">
                                                    <col style="width: 44%;">
                                                </colgroup>
                                                <tr>
                                                    <td colspan="2" style="height: 118px;">
                                                        <span class="label">PAYER'S name, street address, city or town, state or province, country, ZIP or foreign postal code, and telephone no.</span>
                                                        <textarea class="value-area" name="payerNameAddress"></textarea>
                                                    </td>
                                                    <td class="omb-cell" style="height: 118px;">
                                                        <div class="line">OMB No. 1545-0116</div>
                                                        <div class="line">Form <span class="nec-main-title">1099-NEC</span></div>
                                                        <div class="line">(Rev. April 2025)</div>
                                                        <div class="line">For calendar year <input class="value" type="text" name="taxYear"></div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <span class="label">PAYER'S TIN</span>
                                                        <input class="value" type="text" name="payerTin">
                                                    </td>
                                                    <td>
                                                        <span class="label">RECIPIENT'S TIN</span>
                                                        <input class="value" type="text" name="recipientTin">
                                                    </td>
                                                    <td>
                                                        <span class="label"><b>1</b> Nonemployee compensation</span>
                                                        <div class="money-wrap">
                                                            <span class="money-sign">$</span>
                                                            <input class="money-input" type="text" name="nonemployeeCompensation">
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2" rowspan="3" class="recipient-area" style="height: 176px;">
                                                        <span class="label">RECIPIENT'S name</span>
                                                        <input class="value" type="text" name="recipientName">
                                                        <span class="label">Street address (including apt. no.)</span>
                                                        <input class="value" type="text" name="recipientStreetAddress">
                                                        <span class="label">City or town, state or province, country, and ZIP or foreign postal code</span>
                                                        <input class="value" type="text" name="recipientCityStateZip">
                                                    </td>
                                                    <td>
                                                        <span class="label"><b>2</b> Payer made direct sales totaling $5,000 or more of consumer products to recipient for resale
                                                            <input class="inline-check" type="checkbox" name="directSales" value="Yes"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span class="label"><b>3</b> Excess golden parachute payments</span>
                                                        <div class="money-wrap">
                                                            <span class="money-sign">$</span>
                                                            <input class="money-input" type="text" name="excessGoldenParachutePayments">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span class="label"><b>4</b> Federal income tax withheld</span>
                                                        <div class="money-wrap">
                                                            <span class="money-sign">$</span>
                                                            <input class="money-input" type="text" name="federalIncomeTaxWithheld">
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td colspan="2">
                                                        <span class="label">Account number (see instructions)</span>
                                                        <input class="value" type="text" name="accountNumber">
                                                    </td>
                                                    <td style="padding: 0;">
                                                        <table class="state-table">
                                                            <tr>
                                                                <td style="width: 33%;">
                                                                    <span class="label"><b>5</b> State tax withheld</span>
                                                                    <div class="money-wrap">
                                                                        <span class="money-sign">$</span>
                                                                        <input class="money-input" type="text" name="stateTaxWithheld">
                                                                    </div>
                                                                </td>
                                                                <td style="width: 33%;">
                                                                    <span class="label"><b>6</b> State/Payer's state no.</span>
                                                                    <input class="value" type="text" name="statePayerStateNo">
                                                                </td>
                                                                <td style="width: 34%;">
                                                                    <span class="label"><b>7</b> State income</span>
                                                                    <div class="money-wrap">
                                                                        <span class="money-sign">$</span>
                                                                        <input class="money-input" type="text" name="stateIncome">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="nec-right">
                                            <div class="copy-panel-top">Nonemployee<br>Compensation</div>
                                            <div class="copy-panel-bottom">Copy 1<br>For State Tax<br>Department</div>
                                        </div>
                                    </div>

                                    <div class="nec-footer">
                                        <div>Form <b>1099-NEC</b> (Rev. 4-2025)</div>
                                        <div>www.irs.gov/Form1099NEC</div>
                                        <div>Department of the Treasury - Internal Revenue Service</div>
                                    </div>
                                </div>

                                <div class="save-row">
                                    <button type="submit" class="formbutton">Save</button>
                                </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>
