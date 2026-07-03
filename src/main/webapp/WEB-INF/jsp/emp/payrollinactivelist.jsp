<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<title>BzPayroll - InActive Payroll List</title>
<style>
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

table.sortable thead {
	background-color: #eee;
	color: #666666;
	font-weight: bold;
	cursor: default;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 0px 0px 0px 0px;
}

table.tabla-listados tbody tr.odd td {
	background: #e1e5e9;
}

table.tabla-listados thead tr th {
	font-size: 12px;
	white-space: normal;
	line-height: 1.2;
	padding: 8px 4px;
	vertical-align: middle;
	text-align: center;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}

/* Tab styles - matching Employee List */
.ui-tabs .ui-tabs-nav {
	border: none !important;
	display: flex;
	justify-content: flex-start;
	gap: 5px;
	padding: 0;
	margin: 0;
	width: 100%;
}

.ui-tabs .ui-tabs-nav li {
	flex: 0 0 auto;
	text-align: center;
	border: 1px solid #ccc !important;
	margin-right: 2px;
}

.ui-tabs .ui-tabs-nav li.ui-tabs-active {
	background: white !important;
	border-bottom: 1px solid white !important;
	box-shadow: none !important;
}

.ui-tabs .ui-tabs-nav li.ui-tabs-active a {
	background: white !important;
	color: black !important;
	outline: none !important;
	box-shadow: none !important;
}

.ui-tabs .ui-tabs-nav li:hover {
	background: #e8e8e8 !important;
	cursor: pointer;
}

.ui-tabs .ui-tabs-nav li:hover a {
	color: #000;
}

#formCustomization {
	margin-right: 5px;
	margin-top: 20px;
}

/* Blue text for table headers - matching Employee List */
#tabs .tabla-listados thead th, .td-id,
#tabs .tabla-listados thead th a {
	color: #007AFF !important;
	cursor: pointer;
}

#tabs .tabla-listados thead th:hover, .td-id:hover,
#tabs .tabla-listados thead th a:hover {
	color: #0056B3 !important;
}

/* Print button styling */
.formbutton {
	background-color: #007AFF;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: normal;
}

.formbutton:hover {
	background-color: #0056B3;
}

/* Checkbox styling */
input[type="checkbox"] {
	cursor: pointer;
	width: 18px;
	height: 18px;
}
#custTable {
    width: 100%;
    overflow-x: auto;
}

.custTable_wrapper{
    width: 100% !important;
    white-space: nowrap;
}
</style>
<script>
$(document).ready(function () {

    $("#tabs").tabs({
        active: 0
    });

});
</script>
</head>

<body onload="initialize();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<!-- begin Contents -->
						<div>
							<div style="float: left;">
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									InActive Payroll List
									<c:if test="${not empty message}">
										<br /> ${message}
                                    </c:if>
								</span>
							</div>
							<br><br>
						</div>

						<!-- Tabs Section -->
						<div id="formCustomization" style="margin-top: 20px;">
							<div id="tabs">
								<ul>
									<li><a href="#payrollListTab" class="tabs-payroll-list" style="font-size:18px;">Payroll Lists</a></li>
									<li><a href="#paidTab" class="tabs-paid" style="font-size:18px;">Paid</a></li>
									<li><a href="#unpaidTab" class="tabs-unpaid" style="font-size:18px;">Unpaid</a></li>
								</ul>
								
								<!-- Payroll List Tab -->
								<div id="payrollListTab">
									<input type="hidden" id="lSize" value='${payrollList.size()}' />
									<div class="">
                                        <table id="custTable" class="tabla-listados sortable"
                                            cellspacing="0"
                                            style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
                                            align="center">
                                            <thead>
                                                <tr valign="center">
                                                    <th><input type="checkbox" id="selectAll" onchange="toggleSelectAll(this);" /></th>
                                                    <th>Date</th>
                                                    <th>ID</th>
                                                    <th>First<br>Name</th>
                                                    <th>M.I.</th>
                                                    <th>Last<br>Name</th>
                                                    <th>SSN</th>
                                                    <th>Photo</th>
                                                    <th>State</th>
                                                    <th>Allowance</th>
                                                    <th>Payment<br>Method</th>
                                                    <th>Gross<br>Payment</th>
                                                    <th>Federal<br>Tax</th>
                                                    <th>Social<br>Security</th>
                                                    <th>Medicare<br>Tax</th>
                                                    <th>State<br>Tax</th>
                                                    <th>State<br>Disability</th>
                                                    <th>Deduction<br>Type</th>
                                                    <th>Amount</th>
                                                    <th>Rate</th>
                                                    <th>Use<br>Rate</th>
                                                    <th>Tax<br>Exempt</th>
                                                    <th>Total<br>Deduction</th>
                                                    <th>Net<br>Payment</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="custTableBody">
                                                <c:if test="${not empty payrollList}">
                                                    <c:forEach items="${payrollList}" var="objList" varStatus="loop">
                                                        <tr id='${loop.index}$$'
                                                            onclick="setRowId(${objList.id}, ${loop.index}, true);"
                                                            ondblclick="goToCustomerBoard(${objList.id});"
                                                            data-payroll-id="${objList.id}"
                                                            data-first-name="${objList.firstName != null ? objList.firstName : ''}"
                                                            data-last-name="${objList.lastName != null ? objList.lastName : ''}"
                                                            data-mi="${objList.mi != null ? objList.mi : ''}"
                                                            data-date="${objList.date != null ? objList.date : ''}"
                                                            data-state="${objList.state != null ? objList.state : ''}"
                                                            data-allowance="${objList.allowance != null ? objList.allowance : ''}"
                                                            data-payment-method="${objList.paymentMethod != null ? objList.paymentMethod : ''}"
                                                            data-gross-payment="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}"
                                                            data-federal-tax="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}"
                                                            data-social-security="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}"
                                                            data-medicare-tax="${objList.medicareTax != null ? objList.medicareTax : 0}"
                                                            data-state-tax="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}"
                                                            data-state-disability="${objList.stateDisabilityTax != null ? objList.stateDisabilityTax : 0}"
                                                            data-deduction-type="${objList.deductionType != null ? objList.deductionType : ''}"
                                                            data-deduction-amount="${objList.amount != null ? objList.amount : 0}"
                                                            data-deduction-rate="${objList.rate != null ? objList.rate : 0}"
                                                            data-use-rate="${objList.useRate != null ? objList.useRate : false}"
                                                            data-tax-exempt="${objList.taxExempt != null ? objList.taxExempt : false}"
                                                            data-total-deduction="${objList.totalDeduction != null ? objList.totalDeduction : 0}"
                                                            data-net-payment="${objList.netPayment != null ? objList.netPayment : 0}">

                                                            <td>
                                                                <input type="checkbox" class="row-checkbox" id="custID${loop.index}" value="${objList.id}"
                                                                    onchange="addCustomerRowIndex(${loop.index}, ${objList.id}); checkSelectAll();" />
                                                            </td>
                                                            <td>${objList.date}</td>
                                                            <td>
                                                                <a class="td-id" href="#">${objList.id}</a>
                                                            </td>
                                                            <td>${objList.firstName}</td>
                                                            <td>${objList.mi}</td>
                                                            <td>${objList.lastName}</td>
                                                            <td></td>
                                                            <td>
                                                            <img src="https://bzcomposer.com/bucket${objList.photo}"
                                                            alt="Employee Photo"
                                                            width="60" height="60"
                                                            style="border-radius: 5px; object-fit: cover;" />
                                                            </td>
                                                            <td>${objList.state}</td>
                                                            <td>${objList.allowance}</td>
                                                            <td>${objList.paymentMethod}</td>
                                                            <td>$<fmt:formatNumber value="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td style="font-weight: bold; color: #0066cc;">$<fmt:formatNumber value="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.medicareTax != null ? objList.medicareTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td style="font-weight: bold; color: #cc6600;">$<fmt:formatNumber value="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.stateDisabilityTax != null ? objList.stateDisabilityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>${objList.deductionType}</td>
                                                            <td>${objList.amount}</td>
                                                            <td>${objList.rate}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${objList.useRate}">Yes</c:when>
                                                                    <c:otherwise>No</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${objList.taxExempt}">Yes</c:when>
                                                                    <c:otherwise>No</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>$<fmt:formatNumber value="${objList.totalDeduction != null ? objList.totalDeduction : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.netPayment != null ? objList.netPayment : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>${objList.paymentStatus}</td>
                                                            <td>
                                                                <button type="button" class="formbutton" style="padding: 5px 10px; font-size: 11px;"
                                                                        onclick="event.stopPropagation(); printPayrollStatement(this);">
                                                                    Print Payroll Statement
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
								</div>
								<!-- Paid Tab -->
								<div id="paidTab">
                                    <input type="hidden" id="paidSize" value='${paidPayrollList.size()}' />
                                    <div class="">
                                        <table id="custTablePaid" class="tabla-listados sortable"
                                            cellspacing="0"
                                            style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
                                            align="center">
                                            <thead>
                                                <tr valign="center">
                                                    <th><input type="checkbox" id="selectAll" onchange="toggleSelectAll(this);" /></th>
                                                    <th>Date</th>
                                                    <th>ID</th>
                                                    <th>First<br>Name</th>
                                                    <th>M.I.</th>
                                                    <th>Last<br>Name</th>
                                                    <th>SSN</th>
                                                    <th>Photo</th>
                                                    <th>State</th>
                                                    <th>Allowance</th>
                                                    <th>Payment<br>Method</th>
                                                    <th>Gross<br>Payment</th>
                                                    <th>Federal<br>Tax</th>
                                                    <th>Social<br>Security</th>
                                                    <th>Medicare<br>Tax</th>
                                                    <th>State<br>Tax</th>
                                                    <th>State<br>Disability</th>
                                                    <th>Deduction<br>Type</th>
                                                    <th>Amount</th>
                                                    <th>Rate</th>
                                                    <th>Use<br>Rate</th>
                                                    <th>Tax<br>Exempt</th>
                                                    <th>Total<br>Deduction</th>
                                                    <th>Net<br>Payment</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="custTablePaidBody">
                                                <c:if test="${not empty paidPayrollList}">
                                                    <c:forEach items="${paidPayrollList}" var="objList" varStatus="loop">
                                                        <tr id='${loop.index}$$$'
                                                            onclick="setPaidRowId(${objList.id}, ${loop.index}, true);"
                                                            ondblclick="goToCustomerBoard(${objList.id});"
                                                            data-payroll-id="${objList.id}"
                                                            data-first-name="${objList.firstName != null ? objList.firstName : ''}"
                                                            data-last-name="${objList.lastName != null ? objList.lastName : ''}"
                                                            data-mi="${objList.mi != null ? objList.mi : ''}"
                                                            data-date="${objList.date != null ? objList.date : ''}"
                                                            data-state="${objList.state != null ? objList.state : ''}"
                                                            data-allowance="${objList.allowance != null ? objList.allowance : ''}"
                                                            data-payment-method="${objList.paymentMethod != null ? objList.paymentMethod : ''}"
                                                            data-gross-payment="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}"
                                                            data-federal-tax="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}"
                                                            data-social-security="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}"
                                                            data-medicare-tax="${objList.medicareTax != null ? objList.medicareTax : 0}"
                                                            data-state-tax="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}"
                                                            data-state-disability="${objList.stateDisabilityTax != null ? objList.stateDisabilityTax : 0}"
                                                            data-deduction-type="${objList.deductionType != null ? objList.deductionType : ''}"
                                                            data-deduction-amount="${objList.amount != null ? objList.amount : 0}"
                                                            data-deduction-rate="${objList.rate != null ? objList.rate : 0}"
                                                            data-use-rate="${objList.useRate != null ? objList.useRate : false}"
                                                            data-tax-exempt="${objList.taxExempt != null ? objList.taxExempt : false}"
                                                            data-total-deduction="${objList.totalDeduction != null ? objList.totalDeduction : 0}"
                                                            data-net-payment="${objList.netPayment != null ? objList.netPayment : 0}">

                                                            <td>
                                                                <input type="checkbox" class="row-checkbox" id="custID${loop.index}" value="${objList.id}"
                                                                    onchange="addCustomerRowIndex(${loop.index}, ${objList.id}); checkSelectAll();" />
                                                            </td>
                                                            <td>${objList.date}</td>
                                                            <td>
                                                                <a class="td-id" href="#">${objList.id}</a>
                                                            </td>
                                                            <td>${objList.firstName}</td>
                                                            <td>${objList.mi}</td>
                                                            <td>${objList.lastName}</td>
                                                            <td></td>
                                                            <td>
                                                            <img src="https://bzcomposer.com/bucket${objList.photo}"
                                                            alt="Employee Photo"
                                                            width="60" height="60"
                                                            style="border-radius: 5px; object-fit: cover;" />
                                                            </td>
                                                            <td>${objList.state}</td>
                                                            <td>${objList.allowance}</td>
                                                            <td>${objList.paymentMethod}</td>
                                                            <td>$<fmt:formatNumber value="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td style="font-weight: bold; color: #0066cc;">$<fmt:formatNumber value="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.medicareTax != null ? objList.medicareTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td style="font-weight: bold; color: #cc6600;">$<fmt:formatNumber value="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.stateDisabilityTax != null ? objList.stateDisabilityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>${objList.deductionType}</td>
                                                            <td>${objList.amount}</td>
                                                            <td>${objList.rate}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${objList.useRate}">Yes</c:when>
                                                                    <c:otherwise>No</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${objList.taxExempt}">Yes</c:when>
                                                                    <c:otherwise>No</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>$<fmt:formatNumber value="${objList.totalDeduction != null ? objList.totalDeduction : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.netPayment != null ? objList.netPayment : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>${objList.paymentStatus}</td>
                                                            <td>
                                                                <button type="button" class="formbutton" style="padding: 5px 10px; font-size: 11px;"
                                                                        onclick="event.stopPropagation(); printPayrollStatement(this);">
                                                                    Print Payroll Statement
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
								</div>
								
								<!-- Unpaid Tab -->
								<div id="unpaidTab">
                                    <input type="hidden" id="unpaidSize" value='${unpaidPayrollList.size()}' />
                                    <div class="">
                                        <table id="custTableUnPaid" class="tabla-listados sortable"
                                            cellspacing="0"
                                            style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
                                            align="center">
                                            <thead>
                                                <tr valign="center">
                                                    <th><input type="checkbox" id="selectAll" onchange="toggleSelectAll(this);" /></th>
                                                    <th>Date</th>
                                                    <th>ID</th>
                                                    <th>First<br>Name</th>
                                                    <th>M.I.</th>
                                                    <th>Last<br>Name</th>
                                                    <th>SSN</th>
                                                    <th>Photo</th>
                                                    <th>State</th>
                                                    <th>Allowance</th>
                                                    <th>Payment<br>Method</th>
                                                    <th>Gross<br>Payment</th>
                                                    <th>Federal<br>Tax</th>
                                                    <th>Social<br>Security</th>
                                                    <th>Medicare<br>Tax</th>
                                                    <th>State<br>Tax</th>
                                                    <th>State<br>Disability</th>
                                                    <th>Deduction<br>Type</th>
                                                    <th>Amount</th>
                                                    <th>Rate</th>
                                                    <th>Use<br>Rate</th>
                                                    <th>Tax<br>Exempt</th>
                                                    <th>Total<br>Deduction</th>
                                                    <th>Net<br>Payment</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="custTableUnPaidBody">
                                                <c:if test="${not empty unpaidPayrollList}">
                                                    <c:forEach items="${unpaidPayrollList}" var="objList" varStatus="loop">
                                                        <tr id='${loop.index}$$'
                                                            onclick="setUnPaidRowId(${objList.id}, ${loop.index}, true);"
                                                            ondblclick="goToCustomerBoard(${objList.id});"
                                                            data-payroll-id="${objList.id}"
                                                            data-first-name="${objList.firstName != null ? objList.firstName : ''}"
                                                            data-last-name="${objList.lastName != null ? objList.lastName : ''}"
                                                            data-mi="${objList.mi != null ? objList.mi : ''}"
                                                            data-date="${objList.date != null ? objList.date : ''}"
                                                            data-state="${objList.state != null ? objList.state : ''}"
                                                            data-allowance="${objList.allowance != null ? objList.allowance : ''}"
                                                            data-payment-method="${objList.paymentMethod != null ? objList.paymentMethod : ''}"
                                                            data-gross-payment="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}"
                                                            data-federal-tax="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}"
                                                            data-social-security="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}"
                                                            data-medicare-tax="${objList.medicareTax != null ? objList.medicareTax : 0}"
                                                            data-state-tax="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}"
                                                            data-state-disability="${objList.stateDisabilityTax != null ? objList.stateDisabilityTax : 0}"
                                                            data-deduction-type="${objList.deductionType != null ? objList.deductionType : ''}"
                                                            data-deduction-amount="${objList.amount != null ? objList.amount : 0}"
                                                            data-deduction-rate="${objList.rate != null ? objList.rate : 0}"
                                                            data-use-rate="${objList.useRate != null ? objList.useRate : false}"
                                                            data-tax-exempt="${objList.taxExempt != null ? objList.taxExempt : false}"
                                                            data-total-deduction="${objList.totalDeduction != null ? objList.totalDeduction : 0}"
                                                            data-net-payment="${objList.netPayment != null ? objList.netPayment : 0}">

                                                            <td>
                                                                <input type="checkbox" class="row-checkbox" id="custID${loop.index}" value="${objList.id}"
                                                                    onchange="addCustomerRowIndex(${loop.index}, ${objList.id}); checkSelectAll();" />
                                                            </td>
                                                            <td>${objList.date}</td>
                                                            <td>
                                                                <a class="td-id" href="#">${objList.id}</a>
                                                            </td>
                                                            <td>${objList.firstName}</td>
                                                            <td>${objList.mi}</td>
                                                            <td>${objList.lastName}</td>
                                                            <td></td>
                                                            <td>
                                                            <img src="https://bzcomposer.com/bucket${objList.photo}"
                                                            alt="Employee Photo"
                                                            width="60" height="60"
                                                            style="border-radius: 5px; object-fit: cover;" />
                                                            </td>
                                                            <td>${objList.state}</td>
                                                            <td>${objList.allowance}</td>
                                                            <td>${objList.paymentMethod}</td>
                                                            <td>$<fmt:formatNumber value="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td style="font-weight: bold; color: #0066cc;">$<fmt:formatNumber value="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.medicareTax != null ? objList.medicareTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td style="font-weight: bold; color: #cc6600;">$<fmt:formatNumber value="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.stateDisabilityTax != null ? objList.stateDisabilityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>${objList.deductionType}</td>
                                                            <td>${objList.amount}</td>
                                                            <td>${objList.rate}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${objList.useRate}">Yes</c:when>
                                                                    <c:otherwise>No</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${objList.taxExempt}">Yes</c:when>
                                                                    <c:otherwise>No</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>$<fmt:formatNumber value="${objList.totalDeduction != null ? objList.totalDeduction : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>$<fmt:formatNumber value="${objList.netPayment != null ? objList.netPayment : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                            <td>${objList.paymentStatus}</td>
                                                            <td>
                                                                <button type="button" class="formbutton" style="padding: 5px 10px; font-size: 11px;"
                                                                        onclick="event.stopPropagation(); printPayrollStatement(this);">
                                                                    Print Payroll Statement
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
								</div>
							</div>
						</div>
						</div>
						</div>
                          </div>
                        </div>
					</div>
					<div>
						<input type="hidden" name="tabid" id="tabid" value="" />
					</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/polyfills.umd.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/jspdf.umd.min.js"></script>
</body>
</html>
<script>
    
let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];
$(document).ready(function() {
    $('#custTable').DataTable({
        "iDisplayLength": 25,
        "ordering": true,
        "order": [[1, 'desc']], // Changed from column 0 to 1 since we added checkbox column
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
            checkSelectAll(); // Update select all checkbox state after table redraw
        },
        "columnDefs": [
            { "orderable": false, "targets": [0, 24] } // Make checkbox and action columns non-sortable
        ]
    });
});
$(document).ready(function() {
    $('#custTablePaid').DataTable({
        "iDisplayLength": 25,
        "ordering": true,
        "order": [[1, 'desc']], // Changed from column 0 to 1 since we added checkbox column
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
            checkSelectAll(); // Update select all checkbox state after table redraw
        },
        "columnDefs": [
            { "orderable": false, "targets": [0, 24] } // Make checkbox and action columns non-sortable
        ]
    });
});
$(document).ready(function() {
    $('#custTableUnPaid').DataTable({
        "iDisplayLength": 25,
        "ordering": true,
        "order": [[1, 'desc']], // Changed from column 0 to 1 since we added checkbox column
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
            checkSelectAll(); // Update select all checkbox state after table redraw
        },
        "columnDefs": [
            { "orderable": false, "targets": [0, 24] } // Make checkbox and action columns non-sortable
        ]
    });
});

function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
        document.getElementById('0$$').className = "even";
    }
}

function setRowId(rowid, rowIndex, flag){
    let lSize = document.getElementById("lSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        itemID = rowid;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
}
function setPaidRowId(rowid, rowIndex, flag){
    let lSize = document.getElementById("paidSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'$$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        itemID = rowid;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$$').classList.add('draft');
    }
}
function setUnPaidRowId(rowid, rowIndex, flag){
    let lSize = document.getElementById("unpaidSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'$$$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        itemID = rowid;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$$$').classList.add('draft');
    }
}

function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}

function goToCustomerBoard(clientVendorID){
	window.open("Customer?tabid=editCustomer&cvId="+itemID, null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function addCustomerRowIndex(rowId, custID){
    let isFound = false;
    let isChecked = document.getElementById('custID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == custID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(custID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(custID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}

function toggleSelectAll(selectAllCheckbox) {
    const checkboxes = document.querySelectorAll('.row-checkbox');
    checkboxes.forEach(function(checkbox) {
        checkbox.checked = selectAllCheckbox.checked;
        const rowId = checkbox.id.replace('custID', '');
        const custID = checkbox.value;
        if(selectAllCheckbox.checked) {
            addCustomerRowIndex(rowId, custID);
        } else {
            const index = selectedRowIndexs.indexOf(parseInt(custID));
            if (index > -1) {
                selectedRowIndexs.splice(index, 1);
            }
        }
    });
}

function checkSelectAll() {
    const checkboxes = document.querySelectorAll('.row-checkbox');
    const selectAllCheckbox = document.getElementById('selectAll');
    if (checkboxes.length === 0) {
        selectAllCheckbox.checked = false;
        return;
    }
    let allChecked = true;
    checkboxes.forEach(function(checkbox) {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });
    selectAllCheckbox.checked = allChecked;
}

// Make printTheReport globally accessible (similar to timesheet.jsp)
window.printTheReport = function(payrollData) {
    if (!payrollData) {
        alert('Please select a payroll to print.');
        return;
    }
    
    generatePayrollPDF(payrollData);
};

function printPayrollStatement(buttonElement) {
    // Get the table row containing the button
    var row = buttonElement.closest('tr');
    if (!row) {
        alert('Could not find payroll data.');
        return;
    }
    
    // Extract payroll data from data attributes
    var payrollData = {
        id: row.getAttribute('data-payroll-id') || '',
        firstName: row.getAttribute('data-first-name') || '',
        lastName: row.getAttribute('data-last-name') || '',
        mi: row.getAttribute('data-mi') || '',
        date: row.getAttribute('data-date') || '',
        state: row.getAttribute('data-state') || '',
        allowance: parseFloat(row.getAttribute('data-allowance')) || null,
        paymentMethod: row.getAttribute('data-payment-method') || '',
        grossPaymentAmount: parseFloat(row.getAttribute('data-gross-payment')) || 0,
        federalWithholdingTax: parseFloat(row.getAttribute('data-federal-tax')) || 0,
        socialSecurityTax: parseFloat(row.getAttribute('data-social-security')) || 0,
        medicareTax: parseFloat(row.getAttribute('data-medicare-tax')) || 0,
        stateWithholdingTax: parseFloat(row.getAttribute('data-state-tax')) || 0,
        stateDisabilityTax: parseFloat(row.getAttribute('data-state-disability')) || 0,
        deductionType: row.getAttribute('data-deduction-type') || '',
        amount: parseFloat(row.getAttribute('data-deduction-amount')) || 0,
        rate: parseFloat(row.getAttribute('data-deduction-rate')) || 0,
        useRate: row.getAttribute('data-use-rate') === 'true',
        taxExempt: row.getAttribute('data-tax-exempt') === 'true',
        totalDeduction: parseFloat(row.getAttribute('data-total-deduction')) || 0,
        netPayment: parseFloat(row.getAttribute('data-net-payment')) || 0
    };
    
    // Call the printTheReport function
    window.printTheReport(payrollData);
}

function generatePayrollPDF(payrollData) {
    var doc = new jsPDF({
        orientation: "portrait",
        unit: "in",
        format: "a4"
    });

    // Helper functions
    function formatDateMMDDYYYY(dateStr) {
        if (!dateStr) return '';
        var date;
        if (typeof dateStr === 'string' && dateStr.includes('-')) {
            date = new Date(dateStr + 'T00:00:00');
        } else {
            date = new Date(dateStr);
        }
        if (isNaN(date.getTime())) return '';
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var y = date.getFullYear();
        return m + "/" + d + "/" + y;
    }

    function formatCurrency(amount) {
        if (amount == null || amount === undefined) return "0.00";
        return parseFloat(amount).toFixed(2);
    }

    // Layout
    var margin = 0.5;
    var pageWidth = doc.internal.pageSize.getWidth();
    var pageHeight = doc.internal.pageSize.getHeight();
    var cursorY = margin;

    // Employee Name
    var employeeName = (payrollData.firstName || '') + ' ' + 
                       (payrollData.mi || '') + ' ' + 
                       (payrollData.lastName || '');
    employeeName = employeeName.trim() || 'Unknown Employee';

    // Header
    doc.setFontSize(14);
    doc.setFont("helvetica", "bold");
    doc.text("PAYROLL STATEMENT", pageWidth / 2, cursorY, {align: "center"});
    cursorY += 0.3;

    // Employee Information Section
    doc.setFontSize(10);
    doc.setFont("helvetica", "bold");
    doc.text("Employee Information", margin, cursorY);
    cursorY += 0.2;

    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    
    var infoX = margin;
    var infoY = cursorY;
    var lineHeight = 0.18;
    
    doc.text("Name: " + employeeName, infoX, infoY);
    infoY += lineHeight;
    
    if (payrollData.date) {
        doc.text("Pay Date: " + formatDateMMDDYYYY(payrollData.date), infoX, infoY);
        infoY += lineHeight;
    }
    
    if (payrollData.state) {
        doc.text("State: " + payrollData.state, infoX, infoY);
        infoY += lineHeight;
    }
    
    if (payrollData.allowance != null) {
        doc.text("Allowance: " + payrollData.allowance, infoX, infoY);
        infoY += lineHeight;
    }
    
    if (payrollData.paymentMethod) {
        doc.text("Payment Method: " + payrollData.paymentMethod, infoX, infoY);
        infoY += lineHeight;
    }
    
    cursorY = infoY + 0.2;

    // Earnings Section
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10);
    doc.text("Earnings", margin, cursorY);
    cursorY += 0.2;

    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    
    var earningsX = margin;
    var earningsY = cursorY;
    var valueX = pageWidth - margin - 1.5;
    
    doc.text("Gross Payment:", earningsX, earningsY);
    doc.text("$" + formatCurrency(payrollData.grossPaymentAmount), valueX, earningsY, {align: "right"});
    earningsY += lineHeight;
    
    cursorY = earningsY + 0.2;

    // Deductions Section
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10);
    doc.text("Deductions", margin, cursorY);
    cursorY += 0.2;

    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    
    var deductionsX = margin;
    var deductionsY = cursorY;
    var dedValueX = pageWidth - margin - 1.5;
    
    if (payrollData.federalWithholdingTax != null && payrollData.federalWithholdingTax > 0) {
        doc.text("Federal Tax:", deductionsX, deductionsY);
        doc.text("$" + formatCurrency(payrollData.federalWithholdingTax), dedValueX, deductionsY, {align: "right"});
        deductionsY += lineHeight;
    }
    
    if (payrollData.socialSecurityTax != null && payrollData.socialSecurityTax > 0) {
        doc.text("Social Security:", deductionsX, deductionsY);
        doc.text("$" + formatCurrency(payrollData.socialSecurityTax), dedValueX, deductionsY, {align: "right"});
        deductionsY += lineHeight;
    }
    
    if (payrollData.medicareTax != null && payrollData.medicareTax > 0) {
        doc.text("Medicare Tax:", deductionsX, deductionsY);
        doc.text("$" + formatCurrency(payrollData.medicareTax), dedValueX, deductionsY, {align: "right"});
        deductionsY += lineHeight;
    }
    
    if (payrollData.stateWithholdingTax != null && payrollData.stateWithholdingTax > 0) {
        doc.text("State Tax:", deductionsX, deductionsY);
        doc.text("$" + formatCurrency(payrollData.stateWithholdingTax), dedValueX, deductionsY, {align: "right"});
        deductionsY += lineHeight;
    }
    
    if (payrollData.stateDisabilityTax != null && payrollData.stateDisabilityTax > 0) {
        doc.text("State Disability:", deductionsX, deductionsY);
        doc.text("$" + formatCurrency(payrollData.stateDisabilityTax), dedValueX, deductionsY, {align: "right"});
        deductionsY += lineHeight;
    }
    
    // Other Deductions
    if (payrollData.deductionType) {
        var otherDeduction = 0;
        if (payrollData.useRate && payrollData.rate != null && payrollData.grossPaymentAmount != null) {
            otherDeduction = payrollData.grossPaymentAmount * (payrollData.rate / 100);
        } else if (payrollData.amount != null) {
            otherDeduction = payrollData.amount;
        }
        
        if (otherDeduction > 0) {
            doc.text(payrollData.deductionType + ":", deductionsX, deductionsY);
            doc.text("$" + formatCurrency(otherDeduction), dedValueX, deductionsY, {align: "right"});
            deductionsY += lineHeight;
        }
    }
    
    cursorY = deductionsY + 0.2;

    // Summary Section
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10);
    doc.text("Summary", margin, cursorY);
    cursorY += 0.2;

    doc.setFont("helvetica", "normal");
    doc.setFontSize(9);
    
    var summaryX = margin;
    var summaryY = cursorY;
    var sumValueX = pageWidth - margin - 1.5;
    
    doc.text("Total Deductions:", summaryX, summaryY);
    doc.text("$" + formatCurrency(payrollData.totalDeduction), sumValueX, summaryY, {align: "right"});
    summaryY += lineHeight;
    
    doc.setFont("helvetica", "bold");
    doc.setFontSize(11);
    doc.text("Net Payment:", summaryX, summaryY);
    doc.text("$" + formatCurrency(payrollData.netPayment), sumValueX, summaryY, {align: "right"});
    summaryY += lineHeight;

    // Footer timestamp
    doc.setFontSize(8);
    doc.setFont("helvetica", "normal");
    var now = new Date();
    doc.text("Generated: " + now.toLocaleString(), margin, pageHeight - margin - 0.05);

    // Save file
    var payrollIdStr = payrollData.id ? payrollData.id.toString() : 'unknown';
    var fileName = employeeName.replace(/\s+/g, "_") + "_payroll_" + payrollIdStr + ".pdf";
    doc.save(fileName);
}
</script>
