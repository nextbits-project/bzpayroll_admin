<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>BzPayroll - Form 940</title>
<style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
        }

        .page-title {
            font-size: 1.1em;
            font-weight: normal;
            color: #838383;
            margin: 30px 0 15px 0;
            border-bottom: 1px dotted #333;
            padding: 0 0 .3em 0;
        }

        .form940-screen,
        .form940-screen div,
        .form940-screen span,
        .form940-screen td,
        .form940-screen b,
        .form940-screen strong,
        .form940-screen label,
        .form940-screen input,
        .form940-screen textarea,
        .form940-screen a {
            color: #000 !important;
        }

        .page-title,
        .toolbar-summary,
        .history-empty,
        .form-shell-note {
            color: #666 !important;
        }

        .action-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 8px;
            margin: 0 40px 12px 0;
            flex-wrap: wrap;
        }

        .toolbar-summary {
            margin-right: auto;
            font-size: 12px;
            color: #666;
        }

        .action-form {
            display: flex;
            align-items: center;
            gap: 6px;
            margin: 0;
            color: #000;
        }

        .action-form input[type="number"] {
            width: 90px;
            margin: 0;
            color: #000;
            border: 1px solid #666;
            background: #fff;
            height: 30px;
        }

        .action-bar .formbutton,
        .action-bar .formButton {
            background: #666 !important;
            color: #fff !important;
            border: 1px solid #444 !important;
            text-decoration: none !important;
            box-shadow: none !important;
        }

        .action-bar .formbutton:hover,
        .action-bar .formButton:hover {
            background: #4d4d4d !important;
            color: #fff !important;
        }

        .history-wrap {
            display: flex;
            width: 100%;
            gap: 14px;
            align-items: flex-start;
        }

        .history-panel {
            width: 15%;
            min-width: 210px;
            border: 1px solid #ccc;
            min-height: 430px;
            overflow-y: auto;
            background: #fff;
        }

        .history-panel table {
            width: 100%;
            border-collapse: collapse;
        }

        .history-row {
            cursor: pointer;
            border-bottom: 1px solid #ccc;
            background: #fff;
            color: #000 !important;
        }

        .history-row td {
            padding: 0;
            font-size: 13px;
            background: transparent;
            color: inherit !important;
        }

        .history-item {
            display: block;
            padding: 10px 12px;
            border: none;
            background: transparent;
            color: #000 !important;
        }

        .history-item,
        .history-item * {
            color: #000 !important;
        }

        .history-row:hover {
            background-color: #efefef;
        }

        .history-row:hover .history-item {
            background: transparent;
            border: none;
        }

        .history-row.active {
            background-color: #808080;
            color: #fff;
            font-weight: bold;
        }

        .history-row.active .history-item {
            background: transparent;
            border: none;
        }

        .history-row:hover .history-year,
        .history-row:hover .history-meta {
            color: #000 !important;
        }

        .history-row:not(.active),
        .history-row:not(.active) td,
        .history-row:not(.active) div,
        .history-row:not(.active) span,
        .history-row:not(.active) .history-item,
        .history-row:not(.active) .history-item *,
        .history-row:not(.active) .history-year,
        .history-row:not(.active) .history-meta {
            color: #000 !important;
        }

        .history-row.active td,
        .history-row.active div,
        .history-row.active span,
        .history-row.active .history-item,
        .history-row.active .history-item *,
        .history-row.active .history-year,
        .history-row.active .history-meta {
            color: #fff !important;
        }

        .history-year {
            display: block;
            font-size: 15px;
            font-weight: bold;
            margin-bottom: 2px;
        }

        .history-meta {
            display: block;
            margin-top: 4px;
            font-size: 11px;
            line-height: 1.35;
            color: #000 !important;
        }

        .ein-row {
            align-items: flex-start;
        }

        .ein-label {
            width: 160px;
            font-weight: bold;
            line-height: 1.35;
            padding-top: 1px;
        }

        .ein-inputs {
            display: flex;
            align-items: flex-start;
            gap: 5px;
            padding-top: 1px;
        }

        .history-empty {
            padding: 12px;
            font-size: 12px;
            color: #666;
        }

        .form-pages {
            flex: 1;
            min-width: 980px;
        }

        .form-shell {
            border: 1px solid #ccc;
            background: #fff;
        }

        .form-shell-header {
            background-color: #D3D3D3;
            border-bottom: 1px solid #b5b5b5;
            text-align: center;
            font-weight: bold;
            font-size: 14px;
            padding: 2px 0;
            color: #000 !important;
        }

        .form-shell-body {
            padding: 0;
        }

        .form-shell-note {
            font-size: 12px;
            color: #666;
            padding: 10px 16px 6px 16px;
        }

        .page {
            background-color: transparent;
            width: 100%;
            margin: 0 0 12px 0;
            padding: 16px 18px 10px 18px;
            box-sizing: border-box;
            position: relative;
            box-shadow: none;
        }

        @media print {
            .action-bar,
            .history-panel,
            .page-title,
            .toolbar-summary {
                display: none;
            }

            .page {
                box-shadow: none;
                margin: 0;
                width: 100%;
                page-break-after: always;
            }
        }

        .flex {
            display: flex;
        }

        .flex-col {
            display: flex;
            flex-direction: column;
        }

        .row {
            display: flex;
            flex-direction: row;
        }

        .items-center {
            align-items: center;
        }

        .items-end {
            align-items: flex-end;
        }

        .justify-between {
            justify-content: space-between;
        }

        .justify-end {
            justify-content: flex-end;
        }

        .w-full {
            width: 100%;
        }

        .bold {
            font-weight: bold;
        }

        .italic {
            font-style: italic;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        .relative {
            position: relative;
        }

        .border-b {
            border-bottom: 1px solid black;
        }

        .border-t {
            border-top: 1px solid black;
        }

        .border-l {
            border-left: 1px solid black;
        }

        .border-r {
            border-right: 1px solid black;
        }

        .border {
            border: 1px solid black;
        }

        h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 900;
        }

        .header-small {
            font-size: 10px;
        }

        input[type="text"],
        input[type="number"] {
            border: none;
            background: transparent;
            width: 100%;
            height: 100%;
            font-family: inherit;
            font-size: inherit;
            outline: none;
            padding: 2px 5px;
            box-sizing: border-box;
        }

        .box-container {
            border: 1px solid black;
        }

        .section-header {
            background-color: #D3D3D3;
            color: #000;
            font-weight: bold;
            padding: 2px 5px;
            display: flex;
            align-items: center;
            margin-top: 5px;
            margin-bottom: 5px;
            border: 1px solid #999;
        }

        .part-badge {
            background-color: #7f7f7f;
            color: #fff;
            font-weight: 900;
            padding: 2px 8px;
            margin-right: 10px;
        }

        .section-header,
        .section-header * {
            color: #000 !important;
        }

        .part-badge,
        .part-badge * {
            color: #fff !important;
        }

        .line-item {
            display: flex;
            align-items: flex-end;
            margin-bottom: 5px;
        }

        .line-idx {
            width: 30px;
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
            flex-shrink: 0;
        }

        .line-idx-right {
            width: 25px;
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
            flex-shrink: 0;
        }

        .line-content {
            flex-grow: 1;
            display: flex;
            align-items: flex-end;
        }

        .dotted-spacer {
            flex-grow: 1;
            border-bottom: 2px dotted black;
            margin: 0 5px 3px 5px;
            min-width: 10px;
        }

        .input-currency {
            border: 1px solid black;
            width: 160px;
            height: 22px;
            display: flex;
            background-color: #fff;
            position: relative;
        }

        .input-currency input {
            text-align: right;
            padding-right: 15px;
        }

        .cb-container {
            display: flex;
            align-items: center;
        }

        .cb-box {
            width: 14px;
            height: 14px;
            border: 1px solid black;
            margin-right: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: white;
        }

        .cb-box input {
            width: 100%;
            height: 100%;
            margin: 0;
            cursor: pointer;
            appearance: none;
            -webkit-appearance: none;
        }

        .cb-box input:checked:after {
            content: 'X';
            font-size: 12px;
            font-weight: bold;
            display: block;
            margin-top: -1px;
        }

        .top-header-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            border-bottom: 2px solid black;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        .form-title {
            font-size: 48px;
            font-weight: 900;
            line-height: 0.8;
        }

        .omb-info {
            font-size: 10px;
            text-align: right;
        }

        .entity-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            grid-gap: 10px;
            margin-bottom: 5px;
        }

        .type-of-return-box {
            background: #d3d3d3;
            color: #000;
            padding: 5px;
            font-weight: bold;
            border-bottom: 1px solid #999;
        }

        .type-of-return-box,
        .type-of-return-box * {
            color: #000 !important;
        }

        .type-return-content {
            border: 1px solid black;
            background: white;
            color: black;
            padding: 10px;
            height: 100%;
            box-sizing: border-box;
        }

        .type-return-content,
        .type-return-content * {
            color: #000 !important;
        }

        .voucher-separator {
            text-align: center;
            margin: 14px 18px;
            border-top: 2px dashed black;
            padding-top: 14px;
            font-weight: bold;
            width: auto;
        }
</style>
</head>
<body style="min-width: 1366px;">
    <c:set var="displayYear" value="${form != null && form.formYear != null ? form.formYear : currentYear}" />
    <c:set var="normalizedEin" value="${form != null && not empty form.ein ? fn:replace(form.ein, '-', '') : ''}" />
    <c:set var="paymentsSubtotal" value="${form != null ? ((form.paymentsExempt != null ? form.paymentsExempt : 0) + (form.paymentsOver7000 != null ? form.paymentsOver7000 : 0)) : ''}" />
    <c:set var="liabilityTotal" value="${form != null ? ((form.q1Liability != null ? form.q1Liability : 0) + (form.q2Liability != null ? form.q2Liability : 0) + (form.q3Liability != null ? form.q3Liability : 0) + (form.q4Liability != null ? form.q4Liability : 0)) : ''}" />
    <c:set var="annualDeposits" value="${form != null && form.totalFutaTax != null ? form.totalFutaTax : 0}" />
    <c:set var="balanceDue" value="${form != null && form.totalFutaTax != null && form.totalFutaTax > annualDeposits ? form.totalFutaTax - annualDeposits : 0}" />
    <c:set var="overpayment" value="${form != null && annualDeposits > (form.totalFutaTax != null ? form.totalFutaTax : 0) ? annualDeposits - form.totalFutaTax : 0}" />

    <div class="form940-screen">
    <div id="ddcolortabsline">&nbsp;</div>
    <div id="cos">
        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">
                        <div>
                            <span class="page-title">Form 940</span>
                        </div>

                        <div class="action-bar">
                            <div class="toolbar-summary">
                                Annual FUTA filing workspace for tax year ${displayYear}. History is listed by year only.
                            </div>
                            <form action="${pageContext.request.contextPath}/form940/generate" method="post" class="action-form">
                                <label for="taxYear940">Year</label>
                                <input id="taxYear940" type="number" name="year" value="${displayYear}" min="2000" max="2100" required>
                                <button type="submit" class="formbutton">Generate</button>
                            </form>
                            <a style="padding:5px; text-decoration: none;" class="formButton" href="${pageContext.request.contextPath}/form940">Latest</a>
                        </div>

                        <c:if test="${not empty message}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert" style="margin-bottom:12px;">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                ${message}
                            </div>
                        </c:if>

                        <div class="history-wrap">
                            <div class="history-panel">
                                <table cellspacing="0" class="section-border">
                                    <thead>
                                        <tr style="background-color: #f2f2f2;">
                                            <td>
                                                <div class="panel-header" style="background-color: #D3D3D3;">
                                                    <strong>&nbsp;&nbsp;Form 940 History</strong>
                                                </div>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${historyList}">
                                            <tr class="history-row${form != null && entry.formYear == form.formYear ? ' active' : ''}" onclick="window.location.href='${pageContext.request.contextPath}/form940?id=${entry.id}'">
                                                <td>
                                                    <div class="history-item" style="${form != null && entry.formYear == form.formYear ? 'color:#fff !important;' : 'color:#000 !important;'}">
                                                        <span class="history-year" style="color: inherit !important;">${entry.formYear}</span>
                                                        <span class="history-meta" style="color: inherit !important;">${entry.companyName}</span>
                                                        <span class="history-meta" style="color: inherit !important;">FUTA: <fmt:formatNumber value="${entry.totalFutaTax}" type="currency"/></span>
                                                        <span class="history-meta" style="color: inherit !important;">${entry.generatedAt}</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty historyList}">
                                            <tr>
                                                <td class="history-empty">No annual Form 940 history available.</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>

                            <div class="form-pages">
                                <div class="form-shell">
                                    <div class="form-shell-header">Form 940 Information</div>
                                    <div class="form-shell-body">
                                        <div class="form-shell-note">
                                            Form 940 is filed yearly. History is shown by tax year only.
                                        </div>
                                <div class="page">
                                    <div class="top-header-row">
                                        <div style="flex: 1;">
                                            <div class="row items-end">
                                                <span style="font-size: 12px; margin-right: 5px;">Form</span>
                                                <span class="form-title">940</span>
                                                <span style="font-size: 24px; font-weight: bold; margin-left: 10px;">for ${displayYear}:</span>
                                            </div>
                                        </div>
                                        <div style="flex: 2; text-align: center;">
                                            <div style="font-size: 18px; font-weight: bold;">Employer's Annual Federal Unemployment (FUTA) Tax Return</div>
                                            <div style="font-size: 11px;">Department of the Treasury — Internal Revenue Service</div>
                                        </div>
                                        <div style="flex: 1; text-align: right;">
                                            <div style="font-size: 14px; font-weight: bold;">850125</div>
                                            <div class="omb-info">OMB No. 1545-0029</div>
                                        </div>
                                    </div>

                                    <div class="entity-grid">
                                        <div class="box-container" style="padding: 10px; position: relative;">
                                            <div class="row mb-2 ein-row" style="margin-bottom: 10px;">
                                                <div class="ein-label">Employer identification number<br>(EIN)</div>
                                                <div class="ein-inputs">
                                                    <div class="box-container" style="width: 25px; height: 25px; margin-right: 5px;"><input
                                                            type="text" maxlength="2" value="${fn:length(normalizedEin) >= 2 ? fn:substring(normalizedEin, 0, 2) : ''}"></div>
                                                    <div class="box-container" style="width: 80px; height: 25px;"><input type="text" maxlength="7" value="${fn:length(normalizedEin) > 2 ? fn:substring(normalizedEin, 2, fn:length(normalizedEin)) : ''}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 160px; font-weight: bold;">Name <span
                                                        style="font-weight: normal; font-style: italic;">(not your trade name)</span></div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text" value="${form != null ? form.companyName : ''}"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 160px; font-weight: bold;">Trade name <span
                                                        style="font-weight: normal; font-style: italic;">(if any)</span></div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text" value="${form != null ? form.tradeName : ''}"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 160px; font-weight: bold;">Address</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text" value="${form != null ? form.addressLine : ''}"></div>
                                            </div>

                                            <div class="row" style="margin-left: 160px; font-size: 10px; margin-bottom: 5px;">
                                                <div style="flex: 1;">Number</div>
                                                <div style="flex: 2;">Street</div>
                                                <div style="flex: 1;">Suite or room number</div>
                                            </div>

                                            <div class="row items-center mb-2" style="margin-bottom: 5px; margin-left: 160px;">
                                                <div class="box-container" style="flex: 2; height: 25px; margin-right: 10px;"><input type="text"></div>
                                                <div class="box-container" style="width: 50px; height: 25px; margin-right: 10px;"><input type="text"></div>
                                                <div class="box-container" style="width: 80px; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row" style="margin-left: 160px; font-size: 10px;">
                                                <div style="flex: 2;">City</div>
                                                <div style="width: 60px;">State</div>
                                                <div style="width: 80px;">ZIP code</div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px; margin-left: 160px;">
                                                <div class="box-container" style="flex: 1; height: 25px; margin-right: 10px;"><input type="text" value="${form != null ? form.cityStateZip : ''}">
                                                </div>
                                                <div class="box-container" style="flex: 1; height: 25px; margin-right: 10px;"><input type="text">
                                                </div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row" style="margin-left: 160px; font-size: 10px;">
                                                <div style="flex: 1;">Foreign country name</div>
                                                <div style="flex: 1;">Foreign province/county</div>
                                                <div style="flex: 1;">Foreign postal code</div>
                                            </div>
                                        </div>

                                        <div class="box-container flex-col">
                                            <div class="type-of-return-box">
                                                Type of Return<br>
                                                <span style="font-weight: normal; font-size: 11px;">(Check all that apply.)</span>
                                            </div>
                                            <div class="type-return-content flex-grow" style="flex-grow: 1;">
                                                <div class="cb-container" style="margin-bottom: 8px;">
                                                    <span class="bold mr-1" style="width: 20px;">a.</span>
                                                    <div class="cb-box"><input type="checkbox"></div>
                                                    <span style="margin-left: 5px;">Amended</span>
                                                </div>
                                                <div class="cb-container" style="margin-bottom: 8px;">
                                                    <span class="bold mr-1" style="width: 20px;">b.</span>
                                                    <div class="cb-box"><input type="checkbox"></div>
                                                    <span style="margin-left: 5px;">Successor employer</span>
                                                </div>
                                                <div class="cb-container" style="margin-bottom: 8px;">
                                                    <span class="bold mr-1" style="width: 20px;">c.</span>
                                                    <div class="cb-box"><input type="checkbox"></div>
                                                    <span style="margin-left: 5px;">No payments to employees in ${displayYear}</span>
                                                </div>
                                                <div class="cb-container">
                                                    <span class="bold mr-1" style="width: 20px;">d.</span>
                                                    <div class="cb-box"><input type="checkbox"></div>
                                                    <span style="margin-left: 5px;">Final: Business closed or stopped paying wages</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center" style="font-style: italic; font-size: 11px; margin-bottom: 5px;">
                                        Read the separate instructions before you complete this form. Please type or print within the boxes.
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 1:</span>
                                        <span>Tell us about your return. If any line does NOT apply, leave it blank. See instructions before completing Part 1.</span>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">1a</div>
                                        <div class="line-content">
                                            <div>If you had to pay state unemployment tax in one state only, enter the state abbreviation .</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">1a</div>
                                        <div class="box-container" style="width: 40px; height: 22px;"><input type="text" maxlength="2" style="text-align: center; text-transform: uppercase;"></div>
                                        <div style="width: 160px;"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">1b</div>
                                        <div class="line-content">
                                            <div>If you had to pay state unemployment tax in more than one state, you are a multi-state employer . . . . . . . . . . . . . . . . . . . .</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">1b</div>
                                        <div class="cb-container" style="margin-right: 5px;">
                                            <div class="cb-box"><input type="checkbox"></div>
                                        </div>
                                        <div style="font-size: 11px; width: 140px;">Check here.<br>Complete Schedule A (Form 940).</div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">2</div>
                                        <div class="line-content">
                                            <div>If you paid wages in a state that is subject to CREDIT REDUCTION . . . . . . .</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">2</div>
                                        <div class="cb-container" style="margin-right: 5px;">
                                            <div class="cb-box"><input type="checkbox"></div>
                                        </div>
                                        <div style="font-size: 11px; width: 140px;">Check here.<br>Complete Schedule A (Form 940).</div>
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 2:</span>
                                        <span>Determine your FUTA tax before adjustments. If any line does NOT apply, leave it blank.</span>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">3</div>
                                        <div class="line-content">
                                            <div class="bold">Total payments to all employees</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">3</div>
                                        <div class="input-currency"><input type="number" value="${form != null ? form.totalPayments : ''}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">4</div>
                                        <div class="line-content">
                                            <div class="bold">Payments exempt from FUTA tax</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">4</div>
                                        <div class="input-currency"><input type="number" value="${form != null ? form.paymentsExempt : ''}"></div>
                                    </div>

                                    <div class="row" style="margin-left: 35px; margin-bottom: 5px;">
                                        <span style="margin-right: 10px;">Check all that apply:</span>
                                        <div class="row" style="width: 500px; flex-wrap: wrap;">
                                            <div class="cb-container" style="margin-right: 10px; width: 150px;">
                                                <span class="bold mr-1">4a</span>
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Fringe benefits
                                            </div>
                                            <div class="cb-container" style="margin-right: 10px; width: 180px;">
                                                <span class="bold mr-1">4c</span>
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Retirement/Pension
                                            </div>
                                            <div class="cb-container" style="margin-right: 10px;">
                                                <span class="bold mr-1">4e</span>
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Other
                                            </div>
                                            <div class="cb-container" style="margin-right: 10px; width: 180px;">
                                                <span class="bold mr-1">4b</span>
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Group-term life insurance
                                            </div>
                                            <div class="cb-container" style="margin-right: 10px; width: 150px;">
                                                <span class="bold mr-1">4d</span>
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Dependent care
                                            </div>
                                        </div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">5</div>
                                        <div class="line-content">
                                            <div class="bold">Total of payments made to each employee in excess of $7,000</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">5</div>
                                        <div class="input-currency"><input type="number" value="${form != null ? form.paymentsOver7000 : ''}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">6</div>
                                        <div class="line-content">
                                            <div class="bold">Subtotal</div> (line 4 + line 5 = line 6)
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">6</div>
                                        <div class="input-currency"><input type="number" value="${paymentsSubtotal}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">7</div>
                                        <div class="line-content">
                                            <div class="bold">Total taxable FUTA wages</div> (line 3 – line 6 = line 7). See instructions
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">7</div>
                                        <div class="input-currency"><input type="number" value="${form != null ? form.futaTaxableWages : ''}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">8</div>
                                        <div class="line-content">
                                            <div class="bold">FUTA tax before adjustments</div> (line 7 x 0.006 = line 8)
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">8</div>
                                        <div class="input-currency"><input type="number" value="${form != null ? form.futaTaxBeforeAdjustments : ''}"></div>
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 3:</span>
                                        <span>Determine your adjustments. If any line does NOT apply, leave it blank.</span>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">9</div>
                                        <div class="line-content">
                                            <div>
                                                <span class="bold">If ALL of the taxable FUTA wages you paid were excluded from state unemployment tax,</span><br>
                                                multiply line 7 by 0.054 (line 7 x 0.054 = line 9). Go to line 12
                                            </div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">9</div>
                                        <div class="input-currency"><input type="number"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">10</div>
                                        <div class="line-content">
                                            <div>
                                                <span class="bold">If SOME of the taxable FUTA wages you paid were excluded from state unemployment tax, OR you paid ANY state unemployment tax late</span> (after the due date for filing Form 940),<br>
                                                complete the worksheet in the instructions. Enter the amount from line 7 of the worksheet
                                            </div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">10</div>
                                        <div class="input-currency"><input type="number"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">11</div>
                                        <div class="line-content">
                                            <div><span class="bold">If credit reduction applies,</span> enter the total from Schedule A (Form 940)</div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">11</div>
                                        <div class="input-currency"><input type="number"></div>
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 4:</span>
                                        <span>Determine your FUTA tax and balance due or overpayment. If any line does NOT apply, leave it blank.</span>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">12</div>
                                        <div class="line-content">
                                            <div class="bold">Total FUTA tax after adjustments</div> (lines 8 + 9 + 10 + 11 = line 12)
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">12</div>
                                        <div class="input-currency"><input type="number" value="${form != null ? form.totalFutaTax : ''}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">13</div>
                                        <div class="line-content">
                                            <div class="bold">FUTA tax deposited for the year,</div> including any overpayment applied from a prior year
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">13</div>
                                        <div class="input-currency"><input type="number" value="${annualDeposits}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">14</div>
                                        <div class="line-content">
                                            <div>
                                                <span class="bold">Balance due.</span> If line 12 is more than line 13, enter the excess on line 14.<br>
                                                <ul>
                                                    <li>If line 14 is more than $500, you must deposit your tax.</li>
                                                    <li>If line 14 is $500 or less, you may pay with this return. See instructions</li>
                                                </ul>
                                            </div>
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">14</div>
                                        <div class="input-currency"><input type="number" value="${balanceDue}"></div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">15a</div>
                                        <div class="line-content">
                                            <div class="bold">Overpayment.</div> If line 13 is more than line 12, enter the difference
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="input-currency" style="margin-right: 5px;"><input type="number" value="${overpayment}"></div>
                                        <div class="row items-center">
                                            <span class="bold mr-1">15b</span> Check one:
                                            <div class="cb-container ml-2">
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Apply to next return.
                                            </div>
                                            <div class="cb-container ml-2">
                                                <div class="cb-box mr-1"><input type="checkbox"></div> Send a refund.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="page" style="margin-top: 20px;">
                                    <div class="row border-b" style="padding-bottom: 5px; margin-bottom: 20px;">
                                        <div style="flex:1;">
                                            <div class="bold" style="font-size: 10px;">Name <span style="font-weight:normal; font-style:italic;">(not your trade name)</span></div>
                                            <div class="box-container" style="height: 25px;"><input type="text" value="${form != null ? form.companyName : ''}"></div>
                                        </div>
                                        <div style="width: 200px; margin-left: 20px;">
                                            <div class="bold" style="font-size: 10px;">Employer identification number (EIN)</div>
                                            <div class="box-container" style="height: 25px;"><input type="text" value="${form != null ? form.ein : ''}"></div>
                                        </div>
                                        <div style="width: 100px; text-align: right; font-weight: bold; font-size: 16px; align-self: flex-end;">850212</div>
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 5:</span>
                                        <span>Report your FUTA tax liability by quarter only if line 12 is more than $500. If not, go to Part 6.</span>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">16</div>
                                        <div class="line-content">
                                            <div class="bold">Report the amount of your FUTA tax liability for each quarter; do NOT enter the amount you deposited. If you had no liability for a quarter, leave the line blank.</div>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-left: 35px; margin-bottom: 5px;">
                                        <div style="flex: 1;">
                                            <div class="line-item">
                                                <span class="bold mr-1">16a</span> 1st quarter (January 1 – March 31)
                                                <div class="dotted-spacer"></div>
                                                <span class="bold mr-1">16a</span>
                                                <div class="input-currency"><input type="number" value="${form != null ? form.q1Liability : ''}"></div>
                                            </div>
                                            <div class="line-item">
                                                <span class="bold mr-1">16b</span> 2nd quarter (April 1 – June 30)
                                                <div class="dotted-spacer"></div>
                                                <span class="bold mr-1">16b</span>
                                                <div class="input-currency"><input type="number" value="${form != null ? form.q2Liability : ''}"></div>
                                            </div>
                                            <div class="line-item">
                                                <span class="bold mr-1">16c</span> 3rd quarter (July 1 – September 30)
                                                <div class="dotted-spacer"></div>
                                                <span class="bold mr-1">16c</span>
                                                <div class="input-currency"><input type="number" value="${form != null ? form.q3Liability : ''}"></div>
                                            </div>
                                            <div class="line-item">
                                                <span class="bold mr-1">16d</span> 4th quarter (October 1 – December 31)
                                                <div class="dotted-spacer"></div>
                                                <span class="bold mr-1">16d</span>
                                                <div class="input-currency"><input type="number" value="${form != null ? form.q4Liability : ''}"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="line-item">
                                        <div class="line-idx">17</div>
                                        <div class="line-content">
                                            <div class="bold">Total tax liability for the year</div> (lines 16a + 16b + 16c + 16d = line 17)
                                            <div class="dotted-spacer"></div>
                                        </div>
                                        <div class="line-idx-right">17</div>
                                        <div class="input-currency"><input type="number" value="${liabilityTotal}"></div>
                                        <div class="bold" style="margin-left: 10px;">Total must equal line 12.</div>
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 6:</span>
                                        <span>May we speak with your third-party designee?</span>
                                    </div>

                                    <div style="margin-bottom: 10px;">
                                        <div class="bold">Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS? See the instructions for details.</div>
                                    </div>

                                    <div class="row items-center mb-2" style="margin-bottom: 10px;">
                                        <div class="cb-container mr-1">
                                            <div class="cb-box"><input type="checkbox"></div>
                                        </div>
                                        <span class="bold mr-1">Yes.</span>
                                        <span class="mr-1" style="margin-left: 20px;">Designee's name and phone number</span>
                                        <div class="box-container" style="width: 250px; height: 25px; margin-right: 10px;"><input type="text"></div>
                                        <div class="box-container" style="width: 150px; height: 25px; margin-right: 10px;"><input type="text"></div>

                                        <div class="flex-col">
                                            <span style="font-size: 11px;">Select a 5-digit personal identification number (PIN) to use when talking to the IRS.</span>
                                            <div class="row">
                                                <div class="box-container" style="width: 25px; height: 25px; margin-right: 2px;"><input type="text" maxlength="1" class="text-center"></div>
                                                <div class="box-container" style="width: 25px; height: 25px; margin-right: 2px;"><input type="text" maxlength="1" class="text-center"></div>
                                                <div class="box-container" style="width: 25px; height: 25px; margin-right: 2px;"><input type="text" maxlength="1" class="text-center"></div>
                                                <div class="box-container" style="width: 25px; height: 25px; margin-right: 2px;"><input type="text" maxlength="1" class="text-center"></div>
                                                <div class="box-container" style="width: 25px; height: 25px;"><input type="text" maxlength="1" class="text-center"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row items-center mb-2">
                                        <div class="cb-container mr-1">
                                            <div class="cb-box"><input type="checkbox"></div>
                                        </div>
                                        <span class="bold mr-1">No.</span>
                                    </div>

                                    <div class="section-header">
                                        <span class="part-badge">Part 7:</span>
                                        <span>Sign here. You MUST complete both pages of this form and SIGN it.</span>
                                    </div>

                                    <div style="font-size: 11px; margin-bottom: 10px;">
                                        Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete, and that no part of any payment made to a state unemployment fund claimed as a credit was, or is to be, deducted from the payments made to employees. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
                                    </div>

                                    <div class="row border-b" style="padding-bottom: 15px; margin-bottom: 15px;">
                                        <div style="width: 250px; margin-right: 20px;">
                                            <div class="bold" style="font-size: 14px; margin-bottom: 5px;">Sign your name here</div>
                                            <div class="box-container" style="height: 40px; margin-bottom: 5px;"><input type="text"></div>

                                            <div class="row items-center">
                                                <span class="bold mr-1" style="width: 40px;">Date</span>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                        </div>

                                        <div style="flex: 1;">
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 100px;">Print your name here</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 100px;">Print your title here</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2">
                                                <div style="width: 100px;">Best daytime phone</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="bold" style="font-size: 14px; margin-bottom: 5px;">Paid Preparer Use Only</div>

                                    <div class="row">
                                        <div style="flex: 1; margin-right: 20px;">
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 100px;">Preparer's name</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 100px;">Preparer's signature</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 100px; font-size: 10px;">Firm's name (or yours if self-employed)</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 100px;">Address</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2">
                                                <div style="width: 100px;">City</div>
                                                <div class="box-container" style="flex: 2; height: 25px; margin-right: 5px;"><input type="text"></div>
                                                <div style="width: 40px;">State</div>
                                                <div class="box-container" style="width: 50px; height: 25px; margin-right: 5px;"><input type="text"></div>
                                                <div style="width: 60px;">ZIP code</div>
                                                <div class="box-container" style="width: 80px; height: 25px;"><input type="text"></div>
                                            </div>
                                        </div>

                                        <div style="width: 300px;">
                                            <div class="row items-center mb-2 justify-end" style="margin-bottom: 5px;">
                                                <div class="cb-container">
                                                    <div class="cb-box mr-1"><input type="checkbox"></div>
                                                </div> Check if you are self-employed
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 50px;">PTIN</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 50px;">Date</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2" style="margin-bottom: 5px;">
                                                <div style="width: 50px;">EIN</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                            <div class="row items-center mb-2">
                                                <div style="width: 50px;">Phone</div>
                                                <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="margin-top: 10px; font-size: 12px; border-top: 2px solid black; display: flex; justify-content: space-between;">
                                        <div>Page <span class="bold">2</span></div>
                                        <div class="bold">Form 940 (${displayYear})</div>
                                    </div>
                                </div>

                                <div class="voucher-separator">
                                    Detach Here and Mail With Your Payment and Form 940.
                                </div>

                                <div class="page" style="height: 350px;">
                                    <div class="row border-b" style="padding-bottom: 5px; border-bottom: 2px solid black;">
                                        <div style="width: 150px;">
                                            <div class="bold" style="font-size: 32px;">940-V</div>
                                            <div style="font-size: 10px;">Department of the Treasury<br>Internal Revenue Service</div>
                                        </div>
                                        <div style="flex: 1; text-align: center;">
                                            <div class="bold" style="font-size: 24px;">Payment Voucher</div>
                                            <div class="bold" style="font-size: 12px;">Don't staple or attach this voucher to your payment.</div>
                                        </div>
                                        <div style="width: 150px; text-align: right;">
                                            <div style="font-size: 10px;">OMB No. 1545-0029</div>
                                            <div class="bold" style="font-size: 32px;">${displayYear}</div>
                                        </div>
                                    </div>

                                    <div class="row" style="height: 200px;">
                                        <div style="width: 250px; border-right: 1px solid black; padding: 10px;">
                                            <div class="bold" style="font-size: 10px; margin-bottom: 2px;">1 Enter your employer identification number (EIN).</div>
                                            <div class="row justify-center">
                                                <div class="box-container" style="width: 25px; height: 25px; margin-right: 5px;"><input type="text" maxlength="2" value="${fn:length(normalizedEin) >= 2 ? fn:substring(normalizedEin, 0, 2) : ''}"></div>
                                                <div class="box-container" style="width: 80px; height: 25px;"><input type="text" maxlength="7" value="${fn:length(normalizedEin) > 2 ? fn:substring(normalizedEin, 2, fn:length(normalizedEin)) : ''}"></div>
                                            </div>
                                        </div>

                                        <div style="flex: 1; padding: 10px; border-right: 1px solid black;">
                                            <div class="bold" style="font-size: 10px; margin-bottom: 2px;">2 Enter the amount of your payment.</div>
                                            <div style="font-size: 10px; margin-bottom: 5px;">Make your check or money order payable to "United States Treasury."</div>
                                            <div class="row items-center">
                                                <div class="bold mr-1" style="font-size: 24px;">$</div>
                                                <div class="box-container" style="flex: 1; height: 40px; background: #eef;"><input type="number" style="font-size: 20px;" value="${balanceDue}"></div>
                                            </div>
                                        </div>

                                        <div style="width: 100px; padding: 10px;">
                                            <div class="row justify-between" style="font-size: 10px;">
                                                <span>Dollars</span>
                                                <span>Cents</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="border-top: 1px solid black; margin-top: -100px; padding: 10px;">
                                        <div class="bold" style="font-size: 10px; margin-bottom: 2px;">3 Enter your business name (individual name if sole proprietor).</div>
                                        <div class="box-container" style="height: 25px; margin-bottom: 5px; width: 100%;"><input type="text" value="${form != null ? form.companyName : ''}"></div>

                                        <div class="bold" style="font-size: 10px; margin-bottom: 2px;">Enter your address.</div>
                                        <div class="box-container" style="height: 25px; margin-bottom: 5px; width: 100%;"><input type="text" value="${form != null ? form.addressLine : ''}"></div>

                                        <div class="bold" style="font-size: 10px; margin-bottom: 2px;">Enter your city, state, and ZIP code; or your city, foreign country name, foreign province/county, and foreign postal code.</div>
                                        <div class="box-container" style="height: 25px; width: 100%;"><input type="text" value="${form != null ? form.cityStateZip : ''}"></div>
                                    </div>
                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
