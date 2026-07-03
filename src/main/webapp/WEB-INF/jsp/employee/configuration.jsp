<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
	<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    <title>Configuration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/configuration.css">
</head>
<body>



<h2 style="font-size: 1.6em; font-weight: bold; color: Black; margin-left:10px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">Employee Configuration</h2>


<div class="container">
    <div class="employee-list card" >
        <h3 class="card-header text-center">Employee List</h3>
        <table class="table table-bordered">
            <tbody id="employeeTableBody" class="list-group"></tbody>
        </table>
    </div>







    <div class="forms-container card">
        <!-- W2 Form -->
        <div class="form-section">
            <h3 class="card-header">Form W2</h3>
            <form id="w2Form" style="margin-top:15px;margin-left:15px">
                <h5 class="mb-3 font-weight-bold">Employer Information</h5>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Employer's Name</label>
                        <input type="text" class="form-control" name="employerName" >
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">EIN (Employer Identification text)</label>
                        <input type="text" class="form-control" name="employerEIN" >
                    </div>
                    <div class="col-md-6 mt-2">
                        <label class="form-label">Employer's Address</label>
                        <input type="text" class="form-control" name="employerAddress" >
                    </div>
                    <div class="col-md-6 mt-2">
                        <label class="form-label">Employer's State ID text</label>
                        <input type="text" class="form-control" name="employerStateId" >
                    </div>
                </div>

                <h5 class="mb-3 mt-4 font-weight-bold">Employee Information</h5>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Employee Name</label>
                        <input type="text" class="form-control" name="employeeName" >
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Social Security text (SSN)</label>
                        <input type="text" class="form-control" name="ssn" >
                    </div>
                </div>

                <h5 class="mb-3 mt-4 font-weight-bold">Income & Withholding</h5>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Wages, Tips, & Other Compensation</label>
                        <input type="text" class="form-control" name="wages" >
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Federal Income Tax Withheld</label>
                        <input type="text" class="form-control" name="federalTax" >
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Social Security Tax Withheld</label>
                        <input type="text" class="form-control" name="socialSecurityTaxWithheld" >
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">Social Security Wages</label>
                        <input type="text" class="form-control" name="socialSecurityWages" >
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">Medicare Wages</label>
                        <input type="text" class="form-control" name="medicareWages" >
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">Medicare tax withheld</label>
                        <input type="text" class="form-control" name="medicareTaxWithheld" >
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">State Wages</label>
                        <input type="text" class="form-control" name="stateWages">
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">State tax withheld</label>
                        <input type="text" class="form-control" name="stateTaxWithheld">
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">Local Wages</label>
                        <input type="text" class="form-control" name="localWages" >
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="form-label">Local tax withheld</label>
                        <input type="text" class="form-control" name="localTaxWithheld" >
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-info">
                        <i class="bi btn-info"></i> Submit W-2 Form
                    </button>
                </div>
            </form>
        </div>

        <!-- 1099 Form -->
        <div class="card-body" style="padding:0px">
            <h3 class="card-header">Form 1099</h3>
            <form id="form1099" style="margin-top:15px;margin-left:15px">
                <h5 class="font-weight-bold">Payer Information</h5>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Payer's Name</label>
                        <input type="text" class="form-control" name="payerName" >
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Payer's TIN</label>
                        <input type="text" class="form-control" name="payerTIN" >
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Payer's Address</label>
                        <input type="text" class="form-control" name="payerAddress" >
                    </div>

                </div>

                <h5 class="mt-4 font-weight-bold" >Recipient Information</h5>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Recipient's Name</label>
                        <input type="text" class="form-control" name="recipientName" >
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Recipient's TIN</label>
                        <input type="text" class="form-control" name="recipientTIN" >
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Recipient's Address</label>
                        <input type="text" class="form-control" name="recipientAddress" >
                    </div>
                </div>

                <h5 class="mt-4 font-weight-bold">Income & Payments</h5>
                <div class="row">
                    <div class="col-md-4">
                        <label class="form-label">Non-Employee Compensation</label>
                        <input type="text" step="0.01" class="form-control" name="nonEmployeeCompensation">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Other Income</label>
                        <input type="text" step="0.01" class="form-control" name="otherIncome">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Dividends Paid</label>
                        <input type="text" step="0.01" class="form-control" name="dividendsPaid">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <label class="form-label">Interest Income</label>
                        <input type="text" step="0.01" class="form-control" name="interestIncome">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">State Income</label>
                        <input type="text" step="0.01" class="form-control" name="stateIncome">
                    </div>

                </div>

                <h5 class="mt-4 font-weight-bold">Tax Withholding</h5>
                <div class="row">
                    <div class="col-md-4">
                        <label class="form-label">Federal Tax Withheld</label>
                        <input type="text" step="0.01" class="form-control" name="federalTaxWithheld">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">State Tax Withheld</label>
                        <input type="text" step="0.01" class="form-control" name="stateTaxWithheld">
                    </div>
                </div>

                <div class="mt-4 text-center">
                    <button type="submit" class="btn btn-info">Submit Form 1099</button>
                </div>

            </form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/js/configuration.js"></script>
</body>
</html>
