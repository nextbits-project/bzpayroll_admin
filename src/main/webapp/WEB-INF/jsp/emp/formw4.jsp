<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>BzPayroll - Form W-4</title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
:root {
    --w4-border: #1d1d1d;
    --w4-soft-border: #b8bec7;
    --w4-fill: transparent;
    --w4-muted: #5f666d;
    --w4-paper: #ffffff;
    --w4-sidebar: #f7f7f7;
}

body {
    background: #f4f4f4;
}

.w4-toolbar {
    display: flex;
    justify-content: flex-end;
    gap: 8px;
    margin: 4px 0 14px 0;
}

.w4-workspace {
    display: flex;
    gap: 18px;
    align-items: stretch;
    width: 100%;
}

.w4-sidebar {
    flex: 0 0 335px;
    width: 335px;
    min-width: 335px;
    border: 1px solid #cfcfcf;
    background: var(--w4-sidebar);
}

.w4-sidebar-search {
    width: calc(100% - 20px);
    margin: 10px;
    padding: 7px 8px;
    border: 1px solid #cfcfcf;
    font-size: 12px;
}

.w4-sidebar-body {
    max-height: 1180px;
    overflow-y: auto;
    background: #fff;
}

.w4-sidebar table {
    width: 100%;
    border-collapse: collapse;
}

.w4-sidebar .panel-header {
    background: #d3d3d3;
}

.employee-row {
    cursor: pointer;
}

.employee-row td {
    padding: 10px;
    font-size: 13px;
    border-bottom: 1px solid #e3e3e3;
}

.employee-row:hover,
.employee-row.active {
    background: #808080;
    color: #fff;
    font-weight: bold;
}

.w4-content {
    flex: 1;
    min-width: 0;
    width: calc(100% - 353px);
}

.w4-helper {
    margin-bottom: 12px;
    color: #666;
    font-size: 12px;
}

.w4-page {
    width: 100%;
    max-width: none;
    background: var(--w4-paper);
    border: 1px solid #d7d7d7;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
    margin-bottom: 22px;
    padding: 24px 28px;
    box-sizing: border-box;
}

.w4-paper-title {
    font-size: 39px;
    line-height: 1;
    font-weight: 700;
}

.w4-form-code {
    font-size: 76px;
    line-height: 0.95;
    font-weight: 800;
    letter-spacing: -2px;
}

.w4-year {
    font-size: 62px;
    line-height: 1;
    font-weight: 800;
    text-align: center;
}

.w4-header-grid {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 0;
}

.w4-header-grid td {
    border: 2px solid var(--w4-border);
    vertical-align: top;
    padding: 10px 12px;
}

.w4-header-grid .w4-header-center {
    text-align: center;
}

.w4-header-grid .w4-header-center h1 {
    margin: 2px 0 8px;
    font-size: 34px;
    font-weight: 800;
}

.w4-header-grid .w4-header-center p {
    margin: 2px 0;
    font-size: 14px;
    font-weight: 700;
}

.w4-section-table,
.w4-worksheet-table {
    width: 100%;
    border-collapse: collapse;
}

.w4-section-table td,
.w4-section-table th,
.w4-worksheet-table td,
.w4-worksheet-table th {
    border: 1px solid var(--w4-border);
    vertical-align: top;
    padding: 6px 9px;
    font-size: 12px;
}

.w4-step-cell {
    width: 170px;
    font-weight: 800;
    font-size: 20px;
    line-height: 1.16;
    padding: 10px 12px !important;
}

.w4-step-cell span {
    display: block;
    margin-top: 8px;
}

.w4-label-row td {
    font-weight: 700;
    padding-bottom: 3px !important;
}

.w4-fill-box,
.w4-money,
.w4-short,
.w4-mid,
.w4-long {
    width: 100%;
    border: 0;
    background: var(--w4-fill);
    min-height: 24px;
    padding: 2px 5px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: inherit;
    color: #000;
    box-sizing: border-box;
    outline: none;
}

.w4-short {
    max-width: 110px;
}

.w4-mid {
    max-width: 180px;
}

.w4-money {
    text-align: right;
    padding-right: 10px;
}

.w4-note {
    font-size: 11px;
    line-height: 1.35;
    color: #222;
}

.w4-tip {
    border-top: 2px solid var(--w4-border);
    border-bottom: 2px solid var(--w4-border);
    padding: 10px 0 12px;
    margin: 0 0 14px;
    font-size: 13px;
    line-height: 1.45;
}

.w4-tip b,
.w4-worksheet-head b {
    font-weight: 800;
}

.w4-checklist label,
.w4-inline-check {
    display: block;
    margin-bottom: 7px;
    font-size: 12px;
    font-weight: 700;
}

.w4-inline-check.light {
    font-weight: 400;
}

.w4-checklist input,
.w4-inline-check input {
    margin-right: 6px;
}

.w4-right-line {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 8px;
}

.w4-right-line strong {
    font-size: 18px;
}

.w4-right-line span {
    font-size: 28px;
    line-height: 1;
}

.w4-sign-line {
    width: 100%;
    border: 0;
    border-bottom: 2px solid var(--w4-border);
    background: transparent;
    padding: 4px 0;
    font-family: Arial, Helvetica, sans-serif;
    font-size: inherit;
    color: #000;
    outline: none;
}

.w4-footer-note {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    margin-top: 8px;
    font-size: 12px;
}

.w4-worksheet-head {
    margin-bottom: 16px;
}

.w4-worksheet-head h2 {
    margin: 0 0 6px;
    font-size: 28px;
    font-weight: 800;
    text-align: center;
}

.w4-worksheet-head p {
    margin: 4px 0;
    font-size: 13px;
    line-height: 1.45;
}

.w4-line-code {
    width: 54px;
    text-align: center;
    font-weight: 800;
    white-space: nowrap;
}

.w4-line-amount {
    width: 170px;
}

.w4-compact td {
    font-size: 11px;
    padding-top: 5px;
    padding-bottom: 5px;
}

.w4-muted {
    color: var(--w4-muted);
}

.w4-employer-table td {
    height: 70px;
}

@media print {
    #ddcolortabsline,
    #header,
    #menu,
    .w4-toolbar,
    .w4-sidebar,
    .w4-helper {
        display: none !important;
    }

    body,
    .w4-page {
        background: #fff !important;
        box-shadow: none !important;
    }

    .w4-page {
        border: 0;
        margin: 0 0 18px;
        padding: 0;
        page-break-after: always;
    }
}
</style>
<script>
function payPeriodToCount(payPeriod) {
    if (!payPeriod) {
        return "";
    }

    const value = String(payPeriod).toLowerCase();

    if (value.indexOf("weekly") !== -1 && value.indexOf("bi") === -1) {
        return "52";
    }
    if (value.indexOf("bi") !== -1 || value.indexOf("every other week") !== -1) {
        return "26";
    }
    if (value.indexOf("semi") !== -1) {
        return "24";
    }
    if (value.indexOf("monthly") !== -1) {
        return "12";
    }
    if (value.indexOf("quarter") !== -1) {
        return "4";
    }
    if (value.indexOf("annual") !== -1 || value.indexOf("year") !== -1) {
        return "1";
    }
    if (value.indexOf("daily") !== -1) {
        return "260";
    }

    return "";
}

function clearW4Form() {
    const form = document.getElementById("w4Form");
    if (form) {
        form.reset();
    }
    $(".employee-row").removeClass("active");
}

$(document).ready(function() {
    $("#employeeSearch").on("keyup", function() {
        const value = $(this).val().toLowerCase();
        $("#custTableBody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $("#custTableBody").on("click", ".employee-row", function() {
        const employeeId = $(this).data("id");

        $(".employee-row").removeClass("active");
        $(this).addClass("active");

        if (!employeeId) {
            return;
        }

        $.ajax({
            url: "/api/employees/" + employeeId,
            type: "GET",
            success: function(data) {
                const middle = data.mi ? " " + data.mi : "";
                const fullName = (data.firstName || "") + middle + ((data.lastName || "") ? " " + data.lastName : "");
                const addressParts = [data.address1 || "", data.address2 || ""].filter(Boolean);
                const cityStateZip = [data.city || "", data.state || "", data.zipCode || ""].filter(Boolean).join(", ").replace(", ,", ",");

                $('input[name="employeeIndexId"]').val(data.id || "");
                $('input[name="employeeFirstName"]').val((data.firstName || "") + middle);
                $('input[name="employeeLastName"]').val(data.lastName || "");
                $('input[name="employeeSsn"]').val(data.ssn || "");
                $('input[name="employeeAddress"]').val(addressParts.join(", "));
                $('input[name="employeeCityStateZip"]').val(cityStateZip);
                $('input[name="employeeSignature"]').val(fullName.trim());
                $('input[name="firstDateOfEmployment"]').val(data.dateStarted ? data.dateStarted.split("T")[0] : "");
                $('input[name="worksheetPayPeriods"]').val(payPeriodToCount(data.payPeriod || ""));
            },
            error: function(xhr) {
                console.error("Failed to fetch employee:", xhr.status, xhr.responseText);
                alert("Employee data not found.");
            }
        });
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
                            <span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0 15px 0; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                                Form W-4
                            </span>
                        </div>

                        <div class="w4-toolbar">
                            <input type="button" class="formbutton" value="Print" onclick="window.print();" />
                            <input type="button" class="formbutton" value="Clear" onclick="clearW4Form();" />
                        </div>

                        <div class="w4-workspace">
                            <div class="w4-sidebar">
                                <div class="panel-header">
                                    <strong>&nbsp;&nbsp;Employee List</strong>
                                </div>
                                <input type="text" id="employeeSearch" class="w4-sidebar-search" placeholder="Search employee" />
                                <div class="w4-sidebar-body">
                                    <table cellspacing="0" class="section-border">
                                        <tbody id="custTableBody">
                                        <c:forEach var="emp" items="${dtoList}">
                                            <tr class="employee-row" data-id="${emp.id}">
                                                <td>
                                                    ${empty emp.title ? '' : emp.title}
                                                    ${empty emp.firstName ? '' : emp.firstName}
                                                    ${empty emp.lastName ? '' : emp.lastName}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="w4-content">
                                <div class="w4-helper">Select an employee from the left to prefill Step 1 fields. The rest of the worksheet stays editable for manual entry.</div>

                                <form id="w4Form" action="#" method="post">
                                    <input type="hidden" name="employeeIndexId" />

                                    <div class="w4-page">
                                        <table class="w4-header-grid">
                                            <tr>
                                                <td style="width: 240px;">
                                                    <div class="w4-paper-title">Form</div>
                                                    <div class="w4-form-code">W-4</div>
                                                    <div style="margin-top: 18px; font-size: 18px; line-height: 1.25;">Department of the Treasury<br>Internal Revenue Service</div>
                                                </td>
                                                <td class="w4-header-center">
                                                    <h1>Employee's Withholding Certificate</h1>
                                                    <p>Complete Form W-4 so that your employer can withhold the correct federal income tax from your pay.</p>
                                                    <p>Give Form W-4 to your employer.</p>
                                                    <p>Your withholding is subject to review by the IRS.</p>
                                                </td>
                                                <td style="width: 220px;">
                                                    <div style="font-size: 18px; text-align: center; margin-bottom: 18px;">OMB No. 1545-0074</div>
                                                    <div class="w4-year">2026</div>
                                                </td>
                                            </tr>
                                        </table>

                                        <table class="w4-section-table">
                                            <tr class="w4-label-row">
                                                <td class="w4-step-cell" rowspan="7">Step 1:<span>Enter Personal Information</span></td>
                                                <td>(a)&nbsp;&nbsp;First name and middle initial</td>
                                                <td>Last name</td>
                                                <td>(b)&nbsp;&nbsp;Social security number</td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="w4-fill-box" name="employeeFirstName"></td>
                                                <td><input type="text" class="w4-fill-box" name="employeeLastName"></td>
                                                <td><input type="text" class="w4-fill-box" name="employeeSsn"></td>
                                            </tr>
                                            <tr class="w4-label-row">
                                                <td colspan="2">Address</td>
                                                <td rowspan="4" class="w4-note"><b>Does your name match the name on your social security card?</b> If not, to ensure you get credit for your earnings, contact SSA at 800-772-1213 or go to <i>www.ssa.gov</i>.</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="text" class="w4-fill-box" name="employeeAddress"></td>
                                            </tr>
                                            <tr class="w4-label-row">
                                                <td colspan="2">City or town, state, and ZIP code</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="text" class="w4-fill-box" name="employeeCityStateZip"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <div class="w4-checklist">
                                                        <label><input type="checkbox" name="filingSingle">Single or Married filing separately</label>
                                                        <label><input type="checkbox" name="filingJointly">Married filing jointly or Qualifying surviving spouse</label>
                                                        <label class="w4-inline-check light"><input type="checkbox" name="filingHead">Head of household (Check only if you are unmarried and pay more than half the costs of keeping up a home for yourself and a qualifying individual.)</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="w4-note"><b>Caution:</b> To claim certain credits or deductions on your tax return, you (and/or your spouse if married filing jointly) are required to have a social security number valid for employment. See page 2 for more information.</td>
                                            </tr>
                                        </table>

                                        <div class="w4-tip"><b>TIP:</b> Consider using the estimator at <i>www.irs.gov/W4App</i> to determine the most accurate withholding for the rest of the year if you are completing this form after the beginning of the year, expect to work only part of the year, or have changes during the year in your marital status, number of jobs, dependents, other income, deductions, or credits.</div>

                                        <table class="w4-section-table">
                                            <tr>
                                                <td class="w4-step-cell" rowspan="5">Step 2:<span>Multiple Jobs or Spouse Works</span></td>
                                                <td colspan="2"><b>Complete Steps 2-4 ONLY if they apply to you; otherwise, skip to Step 5.</b> See page 2 for more information on each step, who can claim exemption from withholding, and when to use the estimator at <i>www.irs.gov/W4App</i>.</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">Complete this step if you (1) hold more than one job at a time, or (2) are married filing jointly and your spouse also works. The correct amount of withholding depends on income earned from all of these jobs.</td>
                                            </tr>
                                            <tr>
                                                <td><b>(a)</b> Use the estimator at <i>www.irs.gov/W4App</i> for the most accurate withholding for this step (and Steps 3-4). If you or your spouse have self-employment income, use this option; <b>or</b></td>
                                                <td style="width: 160px;"></td>
                                            </tr>
                                            <tr>
                                                <td><b>(b)</b> Use the Multiple Jobs Worksheet on page 3 and enter the result in Step 4(c) below; <b>or</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>(c)</b> If there are only two jobs total, you may check this box. Do the same on Form W-4 for the other job.</td>
                                                <td style="text-align: center; vertical-align: middle;"><input type="checkbox" name="twoJobsCheckbox"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3"><b>Complete Steps 3-4(b) on Form W-4 for only ONE of these jobs.</b> Leave those steps blank for the other jobs. Your withholding will be most accurate if you complete Steps 3-4(b) on the Form W-4 for the highest paying job.</td>
                                            </tr>
                                        </table>

                                        <table class="w4-section-table">
                                            <tr>
                                                <td class="w4-step-cell" rowspan="3">Step 3:<span>Claim Dependent and Other Credits</span></td>
                                                <td>If your total income will be $200,000 or less ($400,000 or less if married filing jointly):</td>
                                                <td class="w4-line-code">3(a)</td>
                                                <td class="w4-line-amount"><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="step3a"></div></td>
                                            </tr>
                                            <tr>
                                                <td>Multiply the number of qualifying children under age 17 by $2,200</td>
                                                <td class="w4-line-code">3(b)</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="step3b"></div></td>
                                            </tr>
                                            <tr>
                                                <td>Add the amounts from Steps 3(a) and 3(b), plus the amount for other credits. Enter the total here.</td>
                                                <td class="w4-line-code">3</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="step3total"></div></td>
                                            </tr>
                                            <tr>
                                                <td class="w4-step-cell" rowspan="3">Step 4:<span>Other Adjustments</span></td>
                                                <td><b>(a) Other income (not from jobs).</b> If you want tax withheld for other income you expect this year that will not have withholding, enter the amount here.</td>
                                                <td class="w4-line-code">4(a)</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="step4a"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>(b) Deductions.</b> Use the Deductions Worksheet on page 4 to determine the amount of deductions you may claim, which will reduce your withholding.</td>
                                                <td class="w4-line-code">4(b)</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="step4b"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>(c) Extra withholding.</b> Enter any additional tax you want withheld each pay period.</td>
                                                <td class="w4-line-code">4(c)</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="step4c"></div></td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight: 800;">Exempt from withholding</td>
                                                <td colspan="3">I claim exemption from withholding for 2026, and I certify that I meet both of the conditions for exemption for 2026. I understand I will need to submit a new Form W-4 for 2027. <span style="float: right;"><input type="checkbox" name="exemptWithholding"></span></td>
                                            </tr>
                                        </table>

                                        <table class="w4-section-table">
                                            <tr>
                                                <td class="w4-step-cell" rowspan="4">Step 5:<span>Sign Here</span></td>
                                                <td colspan="3">Under penalties of perjury, I declare that this certificate, to the best of my knowledge and belief, is true, correct, and complete.</td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="text" class="w4-sign-line" name="employeeSignature"></td>
                                                <td><input type="date" class="w4-sign-line" name="signatureDate"></td>
                                            </tr>
                                            <tr class="w4-note">
                                                <td colspan="2"><b>Employee's signature</b> (This form is not valid unless you sign it.)</td>
                                                <td><b>Date</b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding: 0;">
                                                    <table class="w4-section-table w4-employer-table">
                                                        <tr>
                                                            <td style="width: 50%;"><b>Employers Only</b><br>Employer's name and address<br><input type="text" class="w4-fill-box" name="employerNameAddress"></td>
                                                            <td style="width: 17%;">First date of employment<br><input type="date" class="w4-fill-box" name="firstDateOfEmployment"></td>
                                                            <td>Employer identification number (EIN)<br><input type="text" class="w4-fill-box" name="employerEin"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="w4-footer-note">
                                            <div><b>For Privacy Act and Paperwork Reduction Act Notice, see page 4.</b></div>
                                            <div>Cat. No. 10220Q</div>
                                            <div>Form W-4 (2026) Created 12/8/25</div>
                                        </div>
                                    </div>

                                    <div class="w4-page">
                                        <div class="w4-worksheet-head">
                                            <h2>Step 2(b) - Multiple Jobs Worksheet <span class="w4-muted">(Keep for your records.)</span></h2>
                                            <p>If you choose the option in Step 2(b) on Form W-4, complete this worksheet on only ONE Form W-4. Withholding will be most accurate if you complete the worksheet and enter the result on the Form W-4 for the highest paying job.</p>
                                            <p><b>Note:</b> If more than one job has annual wages of more than $120,000 or there are more than three jobs, see Pub. 505 for additional tables; or, use the online withholding estimator at <i>www.irs.gov/W4App</i>.</p>
                                        </div>

                                        <table class="w4-worksheet-table">
                                            <tr>
                                                <td><b>1 Two jobs.</b> If you have two jobs or you are married filing jointly and you and your spouse each have one job, find the amount from the appropriate table on page 5. Using the "Higher Paying Job" row and the "Lower Paying Job" column, find the value at the intersection of the two household salaries and enter that value on line 1. Then, skip to line 3.</td>
                                                <td class="w4-line-code">1</td>
                                                <td class="w4-line-amount"><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="worksheet1"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>2 Three jobs.</b> If you and/or your spouse have three jobs at the same time, complete lines 2a, 2b, and 2c below. Otherwise, skip to line 3.</td>
                                                <td class="w4-line-code"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>a</b> Find the amount from the appropriate table on page 5 using the annual wages from the highest paying job and the annual wages for your next highest paying job. Enter that value on line 2a.</td>
                                                <td class="w4-line-code">2a</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="worksheet2a"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>b</b> Add the annual wages of the two highest paying jobs from line 2a together and use the total as the wages in the "Higher Paying Job" row. Use the annual wages for your third job in the "Lower Paying Job" column and enter this amount on line 2b.</td>
                                                <td class="w4-line-code">2b</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="worksheet2b"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>c</b> Add the amounts from lines 2a and 2b and enter the result on line 2c.</td>
                                                <td class="w4-line-code">2c</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="worksheet2c"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>3</b> Enter the number of pay periods per year for the highest paying job. For example, if that job pays weekly, enter 52; if it pays every other week, enter 26; if it pays monthly, enter 12, etc.</td>
                                                <td class="w4-line-code">3</td>
                                                <td><input type="text" class="w4-fill-box" name="worksheetPayPeriods"></td>
                                            </tr>
                                            <tr>
                                                <td><b>4</b> Divide the annual amount on line 1 or line 2c by the number of pay periods on line 3. Enter this amount here and in Step 4(c) of Form W-4 for the highest paying job.</td>
                                                <td class="w4-line-code">4</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="worksheet4"></div></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="w4-page">
                                        <div class="w4-worksheet-head">
                                            <h2>Step 4(b) - Deductions Worksheet <span class="w4-muted">(Keep for your records.)</span></h2>
                                            <p>See the Instructions for Schedule 1-A (Form 1040) for more information about whether you qualify for the deductions on lines 1a, 1b, 1c, 3a, and 3b.</p>
                                        </div>

                                        <table class="w4-worksheet-table w4-compact">
                                            <tr>
                                                <td><b>1a</b> Qualified tips. If your total income is less than $150,000 ($300,000 if married filing jointly), enter an estimate of your qualified tips up to $25,000.</td>
                                                <td class="w4-line-code">1a</td>
                                                <td class="w4-line-amount"><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction1a"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>1b</b> Qualified overtime compensation. If your total income is less than $150,000 ($300,000 if married filing jointly), enter an estimate of your qualified overtime compensation.</td>
                                                <td class="w4-line-code">1b</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction1b"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>1c</b> Qualified passenger vehicle loan interest. If your total income is less than $100,000 ($200,000 if married filing jointly), enter an estimate of your qualified passenger vehicle loan interest up to $10,000.</td>
                                                <td class="w4-line-code">1c</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction1c"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>2</b> Add lines 1a, 1b, and 1c. Enter the result here.</td>
                                                <td class="w4-line-code">2</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction2"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>3a</b> Seniors age 65 or older. If your total income is less than $75,000 ($150,000 if married filing jointly), enter $6,000 if you are age 65 or older before the end of the year.</td>
                                                <td class="w4-line-code">3a</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction3a"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>3b</b> Enter $6,000 if your spouse is age 65 or older before the end of the year and has a social security number valid for employment.</td>
                                                <td class="w4-line-code">3b</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction3b"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>4</b> Add lines 3a and 3b. Enter the result here.</td>
                                                <td class="w4-line-code">4</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction4"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>5</b> Enter an estimate of your student loan interest, deductible IRA contributions, educator expenses, alimony paid, and certain other adjustments from Schedule 1 (Form 1040), Part II.</td>
                                                <td class="w4-line-code">5</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction5"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>6a</b> Medical and dental expenses. Enter expenses in excess of 7.5% of your total income.</td>
                                                <td class="w4-line-code">6a</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction6a"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>6b</b> State and local taxes. If your total income is less than $505,000 ($252,500 if married filing separately), enter state and local taxes paid up to $40,400 ($20,200 if married filing separately).</td>
                                                <td class="w4-line-code">6b</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction6b"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>6c</b> Home mortgage interest. If your home acquisition debt is less than $750,000 ($375,000 if married filing separately), enter your home mortgage interest expense.</td>
                                                <td class="w4-line-code">6c</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction6c"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>6d</b> Gifts to charities. Enter contributions in excess of 0.5% of your total income.</td>
                                                <td class="w4-line-code">6d</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction6d"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>6e</b> Other itemized deductions. Enter the amount for other itemized deductions.</td>
                                                <td class="w4-line-code">6e</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction6e"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>7</b> Add lines 6a, 6b, 6c, 6d, and 6e. Enter the result here.</td>
                                                <td class="w4-line-code">7</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction7"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>8a</b> Enter your total income.</td>
                                                <td class="w4-line-code">8a</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction8a"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>8b</b> Subtract line 4 from line 8a. If line 4 is greater than line 8a, enter -0- here and on line 10. Skip line 9.</td>
                                                <td class="w4-line-code">8b</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction8b"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>9</b> Enter: $768,700 if married filing jointly or a qualifying surviving spouse; $640,600 if you are single or head of household; $384,350 if you are married filing separately.</td>
                                                <td class="w4-line-code">9</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction9"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>10</b> If line 9 is greater than line 8b, enter the amount from line 7. Otherwise, multiply line 7 by 94% (0.94) and enter the result here.</td>
                                                <td class="w4-line-code">10</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction10"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>11</b> Standard deduction. Enter: $32,200 if married filing jointly or a qualifying surviving spouse; $24,150 if you are head of household; $16,100 if you are single or married filing separately.</td>
                                                <td class="w4-line-code">11</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction11"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>12</b> Cash gifts to charities. If you take the standard deduction, enter cash contributions up to $1,000 ($2,000 if married filing jointly).</td>
                                                <td class="w4-line-code">12</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction12"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>13</b> Add lines 11 and 12. Enter the result here.</td>
                                                <td class="w4-line-code">13</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction13"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>14</b> If line 10 is greater than line 13, subtract line 11 from line 10 and enter the result here. If line 13 is greater than line 10, enter the amount from line 12.</td>
                                                <td class="w4-line-code">14</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction14"></div></td>
                                            </tr>
                                            <tr>
                                                <td><b>15</b> Add lines 2, 4, 5, and 14. Enter the result here and in Step 4(b) of Form W-4.</td>
                                                <td class="w4-line-code">15</td>
                                                <td><div class="w4-right-line"><span>$</span><input type="text" class="w4-money" name="deduction15"></div></td>
                                            </tr>
                                        </table>

                                        <div class="w4-footer-note" style="margin-top: 16px;">
                                            <div style="flex: 1;"><b>Privacy Act and Paperwork Reduction Act Notice.</b> We ask for the information on this form to carry out the Internal Revenue laws of the United States. Your employer uses it to determine your federal income tax withholding.</div>
                                            <div style="flex: 1;">You are not required to provide the information requested on a form that is subject to the Paperwork Reduction Act unless the form displays a valid OMB control number.</div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
