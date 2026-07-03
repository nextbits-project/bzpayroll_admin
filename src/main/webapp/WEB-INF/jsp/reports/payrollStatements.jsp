<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>BzPayroll - Payroll Statements</title>
<style>
table.tabla-customListOds { width: 80%; border: 1px solid rgb(207, 207, 207); margin:auto; }
table.tabla-customListOds tbody tr.odd td { background: #e1e5e9; }
table.tabla-customListOds thead tr th { font-size: 14px; }
table.tabla-customListOds tbody tr td { font-size: 14px; }
</style>
</head>
<body>
<form:form action="PurchaseBoard?tabid=AllVendorList" method="post">
	<div class="report-form-headerpanel" id="headerPanel">
		<table>
			<tr>
		   		
		   		<td>
		   			<input id="btnHeader1" type="button" value='<spring:message code="BzComposer.reportcenter.allinvoicelist.hideheaderbtn"/>' 
		   			class="formbutton mar" onclick="hideShowHeader()">
	   			</td>
		   		<td>
		   			<input type="button" value='<spring:message code="BzComposer.reportcenter.allinvoicelist.refreshbtn"/>' 
		   			class="formbutton mar" onclick="search()">
	   			</td>
		   	</tr>
		</table>
	</div>
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="table-negotiations">
		<table align="center">
			<tr>
				<td align="center">
					<c:if test="${not empty msg}">
						<font color="red"><b>${msg}</b></font>
					</c:if>
				</td>
			</tr>
		</table>
		<div id="printContent">
			<div id="headerBar">
				<h5 style="text-align: center; color: blue; padding-top: 20px">${sessionScope.user}</h5>
				<h6 style="text-align: center; color: blue;" id="headerBarValue">
					${pageTitle}
				</h6>
			</div>
			<div id="table-negotiations">
				<div  style="overflow: auto; height: 500; text-align: center;margin:20px">
					<table class="tabla-customListOds" id="exportPd" border="1">
						<thead>
							<tr>
								<th>Employee Name</th>
								<th>Employee ID</th>
								<th>Gross Pay</th>
								<th>Net Pay</th>
								<th>Status</th>
								<th>PDF</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty payrollList}">
								<input type="hidden" name="sListSize" id="lSize" value='${payrollList.size()}'>
								<c:forEach items="${payrollList}" var="objList">
									<tr data-payroll-id="${objList.id}"
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

										<td>${objList.firstName} ${objList.mi} ${objList.lastName}</td>
										<td>${objList.employeeId}</td>
                                        <td>$<fmt:formatNumber value="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
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
</form:form>
<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<!-- Javascript begins here -->
<script type="text/javascript">
var modal = document.getElementById('myModal');
function hideShowHeader()
{
	
	document.getElementById("headerBar").style.display = "none";
	/* $("#btnHeader1").hide(); */
	document.getElementById("headerBar").style.display = "none";
	$("#btnHeader1").replaceWith("<input id='btnHeader2' type='button' value='<spring:message code='BzComposer.reportcenter.allinvoicelist.showheaderbtn'/>' class='formbutton mar' onclick='ShowHeader()'>");
}
function ShowHeader()
{
	document.getElementById("headerBar").style.display = "block";
	$("#btnHeader2").replaceWith("<input id='btnHeader1' type='button' value='<spring:message code='BzComposer.reportcenter.allinvoicelist.hideheaderbtn'/>' class='formbutton mar' onclick='hideShowHeader()'>");
}
function printPage()
{
	/*   
	  var doc = new jsPDF("1", "pt","a2");  
	  var source = $("#printContent")[0]; 
	  doc.fromHTML(source); 
	  doc.save($("#headerBarValue").html()+".pdf");  */
	  
	  //for creating pdf 
	   var divToPrint=document.getElementById("exportPd");
	   var header = document.getElementById("headerBar");
	   newWin= window.open("");
	   newWin.document.write(header.outerHTML+divToPrint.outerHTML);
	   newWin.print();
	   newWin.close(); 
	 
	   //for creating excel
	   
	   str="";

  var myTableHead = document.getElementById('ProfitLossItem');
  var rowCount = myTableHead.rows.length;
  var colCount = myTableHead.getElementsByTagName("tr")[0].getElementsByTagName("th").length; 

var ExcelApp = new ActiveXObject("Excel.Application");
var ExcelSheet = new ActiveXObject("Excel.Sheet");
ExcelSheet.Application.Visible = true;

for(var i=0; i<rowCount; i++) 
{   
    for(var j=0; j<colCount; j++) 
    {           
        str= myTableHead.getElementsByTagName("tr")[i].getElementsByTagName("th")[j].innerHTML;
        ExcelSheet.ActiveSheet.Cells(i+1,j+1).Value = str;
    }
}
	/* window.open('data:application/vnd.ms-excel,' + $('#ProfitLossItem').html()); */
}
function search()
{
	location.reload();
}
function sendMail() {
	modal.style.display = "block";
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
}
function closeModal()
{
	modal.style.display = "none";
}
</script>
<script>
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
const { jsPDF } = window.jspdf;

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
<!-- Javascript end here -->
</body>
</html>