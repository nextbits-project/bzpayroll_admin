<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>BzPayroll - Employee Payroll History</title>
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
								<th>Date</th>
                                <th>ID</th>
								<th>Employee Name</th>
								<th>Payment<br>Method</th>
								<th>Gross<br>Payment</th>
								<th>Federal<br>Tax</th>
								<th>Social<br>Security</th>
								<th>Medicare<br>Tax</th>
								<th>State<br>Tax</th>
								<th>Total<br>Deduction</th>
								<th>Net<br>Payment</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty payrollList}">
								<input type="hidden" name="sListSize" id="lSize" value='${payrollList.size()}'>
								<c:forEach items="${payrollList}" var="objList">
									<tr>
										<td>${objList.date}</td>
										<td>${objList.id}</td>
                                        <td>${objList.firstName} ${objList.mi} ${objList.lastName}</td>
                                        <td>${objList.paymentMethod}</td>
                                        <td>$<fmt:formatNumber value="${objList.grossPaymentAmount != null ? objList.grossPaymentAmount : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td style="font-weight: bold; color: #0066cc;">$<fmt:formatNumber value="${objList.federalWithholdingTax != null ? objList.federalWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td>$<fmt:formatNumber value="${objList.socialSecurityTax != null ? objList.socialSecurityTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td>$<fmt:formatNumber value="${objList.medicareTax != null ? objList.medicareTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td style="font-weight: bold; color: #cc6600;">$<fmt:formatNumber value="${objList.stateWithholdingTax != null ? objList.stateWithholdingTax : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td>$<fmt:formatNumber value="${objList.totalDeduction != null ? objList.totalDeduction : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td>$<fmt:formatNumber value="${objList.netPayment != null ? objList.netPayment : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
										<td>${objList.paymentStatus}</td>
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
<!-- Javascript end here -->
</body>
</html>