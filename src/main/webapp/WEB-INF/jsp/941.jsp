<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <title>BzPayroll - Form 941</title>
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

        .form941-screen,
        .form941-screen div,
        .form941-screen span,
        .form941-screen td,
        .form941-screen b,
        .form941-screen strong,
        .form941-screen label,
        .form941-screen input,
        .form941-screen textarea,
        .form941-screen a {
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

        /* Utility Classes */
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

        .mr-1 {
            margin-right: 5px;
        }

        .ml-2 {
            margin-left: 10px;
        }

        .mb-2 {
            margin-bottom: 5px;
        }

        .mb-1 {
            margin-bottom: 4px;
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
            font-size: 36px;
            font-weight: 900;
            line-height: 0.8;
        }

        .header-grid {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .ein-input-group {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .ein-part-short {
            width: 30px;
            height: 25px;
        }

        .ein-part-long {
            width: 92px;
            height: 25px;
        }

        .ein-separator {
            font-weight: bold;
            font-size: 14px;
            line-height: 1;
        }

        .ein-input-group input {
            text-align: center;
            padding: 2px 4px;
        }

        .entity-box {
            flex: 2;
            border: 1px solid black;
            padding: 5px;
            position: relative;
        }

        .quarter-box {
            flex: 1;
            border: 2px solid black;
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        .quarter-header {
            background: #7f7f7f;
            color: #fff;
            padding: 5px;
            font-weight: bold;
            font-size: 11px;
        }

        .quarter-options {
            padding: 10px;
        }

        /* Column Inputs for Part 1 Line 5 */
        .col-input {
            width: 140px;
            border: 1px solid black;
            height: 22px;
            background: white;
        }

        .col-input input {
            text-align: right;
        }
    </style>
</head>

<body style="min-width: 1366px;">
    <c:set var="displayYear" value="${form != null && form.formYear != null ? form.formYear : currentYear}" />
    <c:set var="normalizedEin" value="${form != null && not empty form.ein ? fn:replace(form.ein, '-', '') : ''}" />
    <c:set var="socialSecurityTaxValue" value="${form != null && form.socialSecurityTax != null ? form.socialSecurityTax : 0}" />
    <c:set var="medicareTaxValue" value="${form != null && form.medicareTax != null ? form.medicareTax : 0}" />
    <c:set var="taxableSocialSecurityWages" value="${socialSecurityTaxValue / 0.124}" />
    <c:set var="taxableMedicareWages" value="${medicareTaxValue / 0.029}" />
    <c:set var="socialSecurityAndMedicareTotal" value="${socialSecurityTaxValue + medicareTaxValue}" />

    <div class="form941-screen">
        <div id="ddcolortabsline">&nbsp;</div>
        <div id="cos">
            <div class="statusquo ok">
                <div id="hoja">
                    <div id="blanquito">
                        <div id="padding">
                            <div>
                                <span class="page-title">Form 941</span>
                            </div>

                            <div class="action-bar">
                                <div class="toolbar-summary">
                                    Quarterly Form 941 workspace for tax year ${displayYear}. History lists available quarter filings for that year.
                                </div>
                                <form action="${pageContext.request.contextPath}/form941/generate" method="post" class="action-form">
                                    <label for="taxYear941">Year</label>
                                    <input id="taxYear941" type="number" name="year" value="${displayYear}" min="2000" max="2100" required>
                                    <input type="hidden" name="quarter" value="4">
                                    <button type="submit" class="formbutton">Generate</button>
                                </form>
                                <a style="padding:5px; text-decoration: none;" class="formButton" href="${pageContext.request.contextPath}/form941">Latest</a>
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
                                                        <strong>&nbsp;&nbsp;Form 941 History</strong>
                                                    </div>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="entry" items="${historyList}">
                                                <tr class="history-row${form != null && entry.id == form.id ? ' active' : ''}" onclick="window.location.href='${pageContext.request.contextPath}/form941?id=${entry.id}'">
                                                    <td>
                                                        <div class="history-item" style="${form != null && entry.id == form.id ? 'color:#fff !important;' : 'color:#000 !important;'}">
                                                            <span class="history-year" style="color: inherit !important;">Q${entry.formQuarter} ${entry.formYear}</span>
                                                            <span class="history-meta" style="color: inherit !important;">${entry.companyName}</span>
                                                            <span class="history-meta" style="color: inherit !important;">Total Tax: <fmt:formatNumber value="${entry.totalTaxLiability}" type="currency"/></span>
                                                            <span class="history-meta" style="color: inherit !important;">${entry.generatedAt}</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty historyList}">
                                                <tr>
                                                    <td class="history-empty">No quarterly Form 941 history available for ${displayYear}.</td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-pages">
                                    <div class="form-shell">
                                        <div class="form-shell-header">Form 941 Information</div>
                                        <div class="form-shell-body">
                                            <div class="form-shell-note">
                                                Form 941 is filed quarterly. The sidebar shows the latest available Q1 through Q4 records for ${displayYear}.
                                            </div>

    <div class="page">
        <!-- Draft Watermark (Optional based on screenshot literalism) -->
        <div style="text-align: center; color: #ccc; font-weight: bold; font-size: 18px; margin-bottom: -20px;">
            TREASURY/IRS AND OMB USE ONLY DRAFT</div>

        <!-- Header -->
        <div class="top-header-row">
            <div style="flex: 1;">
                <div class="row items-end">
                    <span style="font-size: 12px; margin-right: 5px; font-weight: bold;">Form</span>
                    <span class="form-title">941</span>
                    <span style="font-size: 24px; font-weight: bold; margin-left: 10px;">for ${form != null && form.formYear != null ? form.formYear : currentYear}:</span>
                </div>
                <div style="font-size: 10px;">(Rev. March 2026)</div>
            </div>
            <div style="flex: 2; text-align: center;">
                <div style="font-size: 18px; font-weight: bold;">Employer's Final Year Federal Tax Calculation</div>
                <div style="font-size: 11px;">Department of the Treasury — Internal Revenue Service</div>
            </div>
            <div style="flex: 1; text-align: right;">
                <div style="font-size: 14px; font-weight: bold;">950126</div>
                <div style="font-size: 10px;">OMB No. 1545-0029</div>
            </div>
        </div>

        <div class="header-grid">
            <!-- Left Entity Info -->
            <div class="box-container" style="flex: 2; padding: 10px; position: relative;">
                <div class="row items-center mb-2">
                    <div style="width: 160px; font-weight: bold; font-size: 10px;">Employer identification number (EIN)
                    </div>
                    <div class="ein-input-group">
                        <div class="box-container ein-part-short"><input
                                type="text" maxlength="2" value="${fn:length(normalizedEin) >= 2 ? fn:substring(normalizedEin, 0, 2) : ''}"></div>
                        <span class="ein-separator">-</span>
                        <div class="box-container ein-part-long"><input type="text" maxlength="7" value="${fn:length(normalizedEin) > 2 ? fn:substring(normalizedEin, 2, fn:length(normalizedEin)) : ''}">
                        </div>
                    </div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 160px; font-weight: bold; font-size: 10px;">Name <span
                            style="font-weight: normal; font-style: italic;">(not your trade name)</span></div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text" value="${form != null ? form.companyName : ''}"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 160px; font-weight: bold; font-size: 10px;">Trade name <span
                            style="font-weight: normal; font-style: italic;">(if any)</span></div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text" value="${form != null ? form.tradeName : ''}"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 160px; font-weight: bold; font-size: 10px;">Address</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text" value="${form != null ? form.addressLine : ''}"></div>
                </div>
                <div class="row" style="margin-left: 160px; font-size: 9px; margin-bottom: 5px;">
                    <div style="flex: 1;">Number</div>
                    <div style="flex: 2;">Street</div>
                    <div style="flex: 1;">Suite or room number</div>
                </div>

                <div class="row items-center mb-2" style="margin-left: 160px;">
                    <div class="box-container" style="flex: 2; height: 25px; margin-right: 10px;"><input type="text">
                    </div>
                    <div class="box-container" style="width: 50px; height: 25px; margin-right: 10px;"><input
                            type="text"></div>
                    <div class="box-container" style="width: 80px; height: 25px;"><input type="text"></div>
                </div>
                <div class="row" style="margin-left: 160px; font-size: 9px;">
                    <div style="flex: 2;">City</div>
                    <div style="width: 60px;">State</div>
                    <div style="width: 80px;">ZIP code</div>
                </div>
                <div class="row items-center mb-2" style="margin-left: 160px;">
                    <div class="box-container" style="flex: 1; height: 25px; margin-right: 10px;"><input type="text" value="${form != null ? form.cityStateZip : ''}">
                    </div>
                    <div class="box-container" style="flex: 1; height: 25px; margin-right: 10px;"><input type="text">
                    </div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row" style="margin-left: 160px; font-size: 9px;">
                    <div style="flex: 1;">Foreign country name</div>
                    <div style="flex: 1;">Foreign province/county</div>
                    <div style="flex: 1;">Foreign postal code</div>
                </div>
            </div>

            <!-- Right Quarter Info -->
            <div class="quarter-box">
                <div class="quarter-header">Final year snapshot for ${form != null && form.formYear != null ? form.formYear : currentYear}<br><span style="font-weight: normal;">(Check
                        one.)</span></div>
                <div class="quarter-options">
                    <div class="cb-container mb-2">
                        <div class="cb-box"><input type="checkbox" <c:if test="${(form != null ? form.formQuarter : currentQuarter) == 1}">checked</c:if>></div> <span
                            style="font-size: 11px; margin-left: 5px;">1: January, February, March</span>
                    </div>
                    <div class="cb-container mb-2">
                        <div class="cb-box"><input type="checkbox" <c:if test="${(form != null ? form.formQuarter : currentQuarter) == 2}">checked</c:if>></div> <span
                            style="font-size: 11px; margin-left: 5px;">2: April, May, June</span>
                    </div>
                    <div class="cb-container mb-2">
                        <div class="cb-box"><input type="checkbox" <c:if test="${(form != null ? form.formQuarter : currentQuarter) == 3}">checked</c:if>></div> <span
                            style="font-size: 11px; margin-left: 5px;">3: July, August, September</span>
                    </div>
                    <div class="cb-container">
                        <div class="cb-box"><input type="checkbox" <c:if test="${(form != null ? form.formQuarter : currentQuarter) == 4}">checked</c:if>></div> <span
                            style="font-size: 11px; margin-left: 5px;">4: October, November, December</span>
                    </div>
                </div>

                <div style="border-top: 2px solid black; padding: 5px;">
                    <div class="quarter-header" style="background: black; color: white;">Aggregate Return Filers Only
                    </div>
                    <div style="font-size: 10px; padding: 5px;">
                        Type of filer (check one):
                        <div class="cb-container mb-1">
                            <div class="cb-box"><input type="checkbox"></div> <span style="margin-left: 5px;">Section
                                3504 Agent</span>
                        </div>
                        <div class="cb-container mb-1">
                            <div class="cb-box"><input type="checkbox"></div> <span style="margin-left: 5px;">Certified
                                Professional Employer Organization (CPEO)</span>
                        </div>
                        <div class="cb-container">
                            <div class="cb-box"><input type="checkbox"></div> <span style="margin-left: 5px;">Other
                                Third Party</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="font-size: 11px; margin-bottom: 5px;">Read the separate instructions before you complete Form 941.
            Type or print within the boxes.</div>

        <!-- Part 1 -->
        <div class="section-header">
            <span class="part-badge">Part 1:</span>
            <span>Answer these questions for this quarter.</span>
        </div>
        <div style="font-size: 11px; font-weight: bold; margin-bottom: 10px;">
            Employers in American Samoa, Guam, the Commonwealth of the Northern Mariana Islands, the U.S. Virgin
            Islands, and Puerto Rico must skip lines 2 and 3, unless you have employees who are subject to U.S. income
            tax withholding.
        </div>

        <div class="line-item">
            <div class="line-idx">1</div>
            <div class="line-content">
                <div style="font-weight: bold;">Number of employees who received wages, tips, or other compensation for
                    the pay period including: Mar. 12 (Quarter 1), June 12 (Quarter 2), Sept. 12 (Quarter 3), or Dec. 12
                    (Quarter 4)</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">1</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.employeeCount : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">2</div>
            <div class="line-content">
                <div class="bold">Wages, tips, and other compensation</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">2</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.totalWages : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">3</div>
            <div class="line-content">
                <div class="bold">Federal income tax withheld from wages, tips, and other compensation</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">3</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.federalIncomeTaxWithheld : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">4</div>
            <div class="line-content">
                <div class="bold">If no wages, tips, and other compensation are subject to social security or Medicare
                    tax</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="cb-container">
                <div class="cb-box"><input type="checkbox"></div>
            </div>
            <span class="bold ml-2">Check here and go to line 6.</span>
        </div>

        <!-- Column Headers for Taxable Wages -->
        <div class="row" style="margin-left: 350px; font-weight: bold; margin-bottom: 5px;">
            <div style="width: 150px; text-align: center;">Column 1</div>
            <div style="width: 150px; text-align: center; margin-left: 40px;">Column 2</div>
        </div>

        <div class="line-item">
            <div class="line-idx">5a</div>
            <div class="line-content">
                <div class="bold">Taxable social security wages</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="col-input"><input type="number" value="${form != null ? taxableSocialSecurityWages : ''}"></div>
            <div style="font-size: 10px; margin: 0 5px;">x 0.124 =</div>
            <div class="col-input"><input type="number" value="${form != null ? socialSecurityTaxValue : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">5b</div>
            <div class="line-content">
                <div class="bold">Taxable social security tips</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="col-input"><input type="number" value="0"></div>
            <div style="font-size: 10px; margin: 0 5px;">x 0.124 =</div>
            <div class="col-input"><input type="number" value="0"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">5c</div>
            <div class="line-content">
                <div class="bold">Taxable Medicare wages & tips</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="col-input"><input type="number" value="${form != null ? taxableMedicareWages : ''}"></div>
            <div style="font-size: 10px; margin: 0 5px;">x 0.029 =</div>
            <div class="col-input"><input type="number" value="${form != null ? medicareTaxValue : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">5d</div>
            <div class="line-content">
                <div class="bold">Taxable wages & tips subject to Additional Medicare Tax withholding</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="col-input"><input type="number" value="0"></div>
            <div style="font-size: 10px; margin: 0 5px;">x 0.009 =</div>
            <div class="col-input"><input type="number" value="0"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">5e</div>
            <div class="line-content">
                <div class="bold">Total social security and Medicare taxes.</div> Add Column 2 from lines 5a, 5b, 5c,
                and 5d
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">5e</div>
            <div class="input-currency"><input type="number" value="${form != null ? socialSecurityAndMedicareTotal : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">5f</div>
            <div class="line-content">
                <div class="bold">Section 3121(q) Notice and Demand—Tax due on unreported tips</div> (see instructions)
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">5f</div>
            <div class="input-currency"><input type="number"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">6</div>
            <div class="line-content">
                <div class="bold">Total taxes before adjustments.</div> Add lines 3, 5e, and 5f
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">6</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.totalTaxLiability : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">7</div>
            <div class="line-content">
                <div class="bold">Current quarter's adjustment for fractions of cents</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">7</div>
            <div class="input-currency"><input type="number"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">8</div>
            <div class="line-content">
                <div class="bold">Current quarter's adjustment for sick pay</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">8</div>
            <div class="input-currency"><input type="number"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">9</div>
            <div class="line-content">
                <div class="bold">Current quarter's adjustments for tips and group-term life insurance</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">9</div>
            <div class="input-currency"><input type="number"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">10</div>
            <div class="line-content">
                <div class="bold">Total taxes after adjustments.</div> Combine lines 6 through 9
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">10</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.totalTaxLiability : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">11</div>
            <div class="line-content">
                <div class="bold">Qualified small business payroll tax credit for increasing research activities.</div>
                Attach Form 8974
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">11</div>
            <div class="input-currency"><input type="number"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">12</div>
            <div class="line-content">
                <div class="bold">Total taxes after adjustments and nonrefundable credits.</div> Subtract line 11 from
                line 10
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">12</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.totalTaxLiability : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">13</div>
            <div class="line-content">
                <div class="bold">Total deposits for this quarter, including overpayment applied from a prior quarter
                    and overpayments applied from Form 941-X, 941-X (PR), or 944-X filed in the current quarter</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">13</div>
            <div class="input-currency"><input type="number" value="${form != null ? form.totalTaxLiability : ''}"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">14</div>
            <div class="line-content">
                <div class="bold">Balance due.</div> If line 12 is more than line 13, enter the difference and see
                instructions
                <div class="dotted-spacer"></div>
            </div>
            <div class="line-idx-right">14</div>
            <div class="input-currency"><input type="number"></div>
        </div>

        <div class="line-item">
            <div class="line-idx">15a</div>
            <div class="line-content">
                <div class="bold">Overpayment.</div> If line 13 is more than line 12, enter the difference
                <div class="dotted-spacer"></div>
            </div>
            <div class="input-currency" style="margin-right: 5px;"><input type="number"></div>
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

        <div class="row" style="margin-top: 10px;">
            <div class="row flex-grow" style="align-items: center;">
                <span class="bold mr-1">15c</span> Routing number
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 2px;"><input type="text"
                        maxlength="1"></div>
                <div class="box-container" style="width: 15px; height: 15px; margin-right: 20px;"><input type="text"
                        maxlength="1"></div>

                <span class="bold mr-1">15d Reference:</span>
                <div class="cb-container mr-1">
                    <div class="cb-box mr-1"><input type="checkbox"></div> Checking
                </div>
                <div class="cb-container">
                    <div class="cb-box mr-1"><input type="checkbox"></div> Savings
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 5px; align-items: center;">
            <span class="bold mr-1">15e</span> Account number
            <div class="box-container" style="flex: 1; max-width: 300px; height: 18px;"><input type="text"></div>
        </div>

        <div
            style="font-weight: bold; border-top: 2px solid black; margin-top: 10px; padding-top: 5px; display: flex; justify-content: space-between;">
            <div>For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</div>
            <div>Cat. No. 17001Z</div>
            <div>Form 941 (Rev. 3-${form != null && form.formYear != null ? form.formYear : currentYear})</div>
        </div>
    </div>
    </div>

    <!-- Page 2 -->
    <div class="page" style="margin-top: 20px;">
        <div class="row border-b" style="padding-bottom: 5px; margin-bottom: 20px;">
            <div style="flex:1;">
                <div class="bold" style="font-size: 10px;">Name <span
                        style="font-weight:normal; font-style:italic;">(not your trade name)</span></div>
                <div class="box-container" style="height: 25px;"><input type="text" value="${form != null ? form.companyName : ''}"></div>
            </div>
            <div style="width: 200px; margin-left: 20px;">
                <div class="bold" style="font-size: 10px;">Employer identification number (EIN)</div>
                <div class="box-container" style="height: 25px;"><input type="text" value="${form != null ? form.ein : ''}"></div>
            </div>
            <div style="width: 100px; text-align: right; font-weight: bold; font-size: 16px; align-self: flex-end;">
                950224</div>
        </div>

        <div class="section-header">
            <span class="part-badge">Part 2:</span>
            <span>Tell us about your deposit schedule and tax liability for this quarter.</span>
        </div>

        <div style="font-size: 11px; font-weight: bold; margin-bottom: 10px;">
            If you're unsure about whether you're a monthly schedule depositor or a semiweekly schedule depositor, see
            section 11 of Pub. 15.
        </div>

        <div class="row" style="margin-bottom: 10px;">
            <div class="bold mr-1">16</div>
            <div class="bold mr-1">Check one:</div>

            <div class="flex-col" style="flex: 1;">
                <div class="row mb-2">
                    <div class="cb-container mr-1" style="align-items: flex-start;">
                        <div class="cb-box mt-1"><input type="checkbox"></div>
                    </div>
                    <div style="font-size: 11px;">
                        <span class="bold">Line 12 on this return is less than $2,500 or line 12 on the return for the
                            prior quarter was less than $2,500, and you didn't incur a $100,000 next-day deposit
                            obligation during the current quarter.</span> If line 12 for the prior quarter was less than
                        $2,500 but line 12 on this return is $100,000 or more, you must provide a record of your federal
                        tax liability. If you're a monthly schedule depositor, complete the deposit schedule below; if
                        you're a semiweekly schedule depositor, attach Schedule B (Form 941). Go to Part 3.
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="cb-container mr-1" style="align-items: flex-start;">
                        <div class="cb-box mt-1"><input type="checkbox"></div>
                    </div>
                    <div style="font-size: 11px;">
                        <span class="bold">You were a monthly schedule depositor for the entire quarter.</span> Enter
                        your tax liability for each month and total liability for the quarter, then go to Part 3.
                    </div>
                </div>

                <div class="row items-center mb-2" style="margin-left: 30px;">
                    <div class="bold" style="width: 80px;">Tax liability:</div>
                    <div class="bold" style="width: 60px;">Month 1</div>
                    <div class="input-currency"><input type="number" value="${form != null ? form.month1Liability : ''}"></div>
                </div>
                <div class="row items-center mb-2" style="margin-left: 110px;">
                    <div class="bold" style="width: 60px;">Month 2</div>
                    <div class="input-currency"><input type="number" value="${form != null ? form.month2Liability : ''}"></div>
                </div>
                <div class="row items-center mb-2" style="margin-left: 110px;">
                    <div class="bold" style="width: 60px;">Month 3</div>
                    <div class="input-currency"><input type="number" value="${form != null ? form.month3Liability : ''}"></div>
                </div>

                <div class="row items-center mb-2" style="margin-left: 30px;">
                    <div style="flex: 1; text-align: right; margin-right: 10px;">Total liability for quarter</div>
                    <div class="input-currency"><input type="number" value="${form != null ? form.totalTaxLiability : ''}"></div>
                    <div class="bold ml-2">Total must equal line 12.</div>
                </div>

                <div class="row mb-2">
                    <div class="cb-container mr-1">
                        <div class="cb-box"><input type="checkbox"></div>
                    </div>
                    <div style="font-size: 11px;">
                        <span class="bold">You were a semiweekly schedule depositor for any part of this quarter.</span>
                        Complete Schedule B (Form 941), Report of Tax Liability for Semiweekly Schedule Depositors, and
                        attach it to Form 941. Go to Part 3.
                    </div>
                </div>
            </div>
        </div>

        <!-- Part 3 -->
        <div class="section-header">
            <span class="part-badge">Part 3:</span>
            <span>Tell us about your business. If a question does NOT apply to your business, leave it blank.</span>
        </div>

        <div class="line-item">
            <div class="line-idx">17</div>
            <div class="line-content">
                <div class="bold">If your business has closed or you stopped paying wages . . . . . . . . . . . . . . .
                    . . . .</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="cb-container mr-1">
                <div class="cb-box"><input type="checkbox"></div>
            </div>
            <div style="font-size: 11px;">Check here and</div>
        </div>
        <div class="row items-center mb-2" style="margin-left: 30px;">
            enter the final date you paid wages
            <div class="box-container" style="width: 30px; height: 20px; margin: 0 2px;"><input type="text"
                    placeholder="/" class="text-center"></div> /
            <div class="box-container" style="width: 30px; height: 20px; margin: 0 2px;"><input type="text"
                    placeholder="/" class="text-center"></div> /
            <div class="box-container" style="width: 50px; height: 20px; margin: 0 2px;"><input type="text"
                    placeholder="${form != null && form.formYear != null ? form.formYear : currentYear}" class="text-center"></div>
            ; also attach a statement to your return. See instructions.
        </div>

        <div class="line-item">
            <div class="line-idx">18</div>
            <div class="line-content">
                <div class="bold">If you're a seasonal employer and you don't have to file a return for every quarter of
                    the year . . . .</div>
                <div class="dotted-spacer"></div>
            </div>
            <div class="cb-container mr-1">
                <div class="cb-box"><input type="checkbox"></div>
            </div>
            <div style="font-size: 11px;">Check here.</div>
        </div>

        <!-- Part 4 -->
        <div class="section-header">
            <span class="part-badge">Part 4:</span>
            <span>May we speak with your third-party designee?</span>
        </div>

        <div class="mb-2 bold" style="font-size: 11px;">
            Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the
            IRS? See the instructions for details.
        </div>

        <div class="row items-center mb-2">
            <div class="cb-container mr-1">
                <div class="cb-box"><input type="checkbox"></div>
            </div>
            <span class="bold mr-1">Yes.</span>
            <span class="mr-1" style="margin-left: 20px;">Designee's name and phone number</span>
            <div class="box-container" style="width: 200px; height: 25px; margin-right: 10px;"><input type="text"></div>
            <div class="box-container" style="width: 150px; height: 25px; margin-right: 10px;"><input type="text"></div>

            <div style="font-size: 11px; margin-right: 5px;">Select a 5-digit personal identification number (PIN) to
                use when talking to the IRS.</div>
            <div class="row">
                <div class="box-container" style="width: 20px; height: 25px; margin-right: 2px;"><input type="text"
                        maxlength="1" class="text-center"></div>
                <div class="box-container" style="width: 20px; height: 25px; margin-right: 2px;"><input type="text"
                        maxlength="1" class="text-center"></div>
                <div class="box-container" style="width: 20px; height: 25px; margin-right: 2px;"><input type="text"
                        maxlength="1" class="text-center"></div>
                <div class="box-container" style="width: 20px; height: 25px; margin-right: 2px;"><input type="text"
                        maxlength="1" class="text-center"></div>
                <div class="box-container" style="width: 20px; height: 25px;"><input type="text" maxlength="1"
                        class="text-center"></div>
            </div>
        </div>
        <div class="row items-center mb-2">
            <div class="cb-container mr-1">
                <div class="cb-box"><input type="checkbox"></div>
            </div>
            <span class="bold mr-1">No.</span>
        </div>

        <!-- Part 5 -->
        <div class="section-header">
            <span class="part-badge">Part 5:</span>
            <span>Sign here. You MUST complete both pages of Form 941 and SIGN it.</span>
        </div>

        <div style="font-size: 10px; margin-bottom: 5px;">
            Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and
            statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of
            preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
        </div>

        <div class="row border-b" style="padding-bottom: 10px; margin-bottom: 15px;">
            <div style="width: 250px; margin-right: 20px;">
                <div class="bold" style="font-size: 14px; margin-bottom: 5px;">Sign your name here</div>
                <div class="box-container" style="height: 40px; margin-bottom: 5px;"><input type="text"></div>

                <div class="row items-center">
                    <span class="bold mr-1" style="width: 40px;">Date</span>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
            </div>

            <div style="flex: 1;">
                <div class="row items-center mb-2">
                    <div style="width: 80px; font-size: 10px;">Print your name here</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 80px; font-size: 10px;">Print your title here</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 120px; font-size: 10px;">Best daytime phone</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
            </div>
        </div>

        <!-- Paid Preparer -->
        <div class="bold" style="font-size: 14px; margin-bottom: 5px;">Paid Preparer Use Only</div>

        <div class="row">
            <div style="flex: 1; margin-right: 20px;">
                <div class="row items-center mb-2">
                    <div style="width: 100px;">Preparer's name</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 100px;">Preparer's signature</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 100px; font-size: 10px;">Firm's name (or yours if self-employed)</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 100px;">Address</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 100px;">City</div>
                    <div class="box-container" style="flex: 2; height: 25px; margin-right: 5px;"><input type="text">
                    </div>
                    <div style="width: 40px;">State</div>
                    <div class="box-container" style="width: 50px; height: 25px; margin-right: 5px;"><input type="text">
                    </div>
                    <div style="width: 60px;">ZIP code</div>
                    <div class="box-container" style="width: 80px; height: 25px;"><input type="text"></div>
                </div>
            </div>

            <div style="width: 300px;">
                <div class="row items-center mb-2 justify-end">
                    <div style="font-size: 11px;">Check if you're self-employed</div>
                    <div class="cb-container ml-2">
                        <div class="cb-box"><input type="checkbox"></div>
                    </div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 50px;">PTIN</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 50px;">Date</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 50px;">EIN</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
                <div class="row items-center mb-2">
                    <div style="width: 50px;">Phone</div>
                    <div class="box-container" style="flex: 1; height: 25px;"><input type="text"></div>
                </div>
            </div>
        </div>

        <div
            style="margin-top: 5px; font-size: 12px; border-top: 2px solid black; display: flex; justify-content: space-between;">
            <div>Page <span class="bold">2</span></div>
            <div class="bold">Form 941 (Rev. 3-${form != null && form.formYear != null ? form.formYear : currentYear})</div>
        </div>
    </div>

    <!-- Voucher -->
    <div
        style="text-align: center; margin: 20px 0; border-top: 2px dashed black; padding-top: 20px; font-weight: bold;">
        Detach Here and Mail With Your Payment and Form 941.
    </div>

    <div class="page" style="height: 350px;">
        <div class="row border-b" style="padding-bottom: 5px; border-bottom: 2px solid black;">
            <div style="width: 150px;">
                <div class="bold" style="font-size: 32px;">941-V</div>
                <div style="font-size: 10px;">Department of the Treasury<br>Internal Revenue Service</div>
            </div>
            <div style="flex: 1; text-align: center;">
                <div class="bold" style="font-size: 24px;">Payment Voucher</div>
                <div class="bold" style="font-size: 12px;">Don't staple or attach this voucher to your payment.</div>
            </div>
            <div style="width: 150px; text-align: right;">
                <div style="font-size: 10px;">OMB No. 1545-0029</div>
                <div class="bold" style="font-size: 32px;">2026</div>
            </div>
        </div>

        <div class="row" style="height: 200px;">
            <div style="width: 250px; border-right: 1px solid black; padding: 10px;">
                <div class="bold" style="font-size: 10px; margin-bottom: 2px;">1 Enter your employer identification
                    number (EIN).</div>
                <div class="row justify-center">
                    <div class="box-container" style="width: 25px; height: 25px; margin-right: 5px;"><input type="text"
                            maxlength="2"></div>
                    <div class="box-container" style="width: 80px; height: 25px;"><input type="text" maxlength="7">
                    </div>
                </div>
            </div>

            <div style="flex: 1; padding: 10px; border-right: 1px solid black;">
                <div class="bold" style="font-size: 10px; margin-bottom: 2px;">2 Enter the amount of your payment.</div>
                <div style="font-size: 10px; margin-bottom: 5px;">Make your check or money order payable to "United
                    States Treasury."</div>
                <div class="row items-center">
                    <div class="bold mr-1" style="font-size: 24px;">$</div>
                    <div class="box-container" style="flex: 1; height: 40px; background: #eef;"><input type="number"
                            style="font-size: 20px;"></div>
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
            <div class="row">
                <div class="flex-col mr-1" style="width: 80px;">
                    <div class="bold" style="font-size: 10px; margin-bottom: 2px;">3 Tax Period</div>
                    <div class="row items-center mb-2">
                        <div class="cb-container">
                            <div class="cb-box" style="border-radius: 50%;"><input type="radio" name="qtr"></div>
                        </div> <span style="font-size: 10px; margin-left: 2px;">1st<br>Quarter</span>
                    </div>
                    <div class="row items-center mb-2">
                        <div class="cb-container">
                            <div class="cb-box" style="border-radius: 50%;"><input type="radio" name="qtr"></div>
                        </div> <span style="font-size: 10px; margin-left: 2px;">2nd<br>Quarter</span>
                    </div>
                    <div class="row items-center mb-2">
                        <div class="cb-container">
                            <div class="cb-box" style="border-radius: 50%;"><input type="radio" name="qtr"></div>
                        </div> <span style="font-size: 10px; margin-left: 2px;">3rd<br>Quarter</span>
                    </div>
                    <div class="row items-center">
                        <div class="cb-container">
                            <div class="cb-box" style="border-radius: 50%;"><input type="radio" name="qtr"></div>
                        </div> <span style="font-size: 10px; margin-left: 2px;">4th<br>Quarter</span>
                    </div>
                </div>

                <div class="flex-col" style="flex: 1; border-left: 1px solid black; padding-left: 10px;">
                    <div class="bold" style="font-size: 10px; margin-bottom: 2px;">4 Enter your business name
                        (individual name if sole proprietor).</div>
                    <div class="box-container" style="height: 25px; margin-bottom: 5px; width: 100%;"><input
                            type="text"></div>

                    <div class="bold" style="font-size: 10px; margin-bottom: 2px;">Enter your address.</div>
                    <div class="box-container" style="height: 25px; margin-bottom: 5px; width: 100%;"><input
                            type="text"></div>

                    <div class="bold" style="font-size: 10px; margin-bottom: 2px;">Enter your city, state, and ZIP code;
                        or your city, foreign country name, foreign province/county, and foreign postal code.</div>
                    <div class="box-container" style="height: 25px; width: 100%;"><input type="text"></div>
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
