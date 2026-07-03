<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/include/header.jsp"%>
<title>BzPayroll - All Employee List</title>
<style>
table.tabla-customListOds { width: 80%; border: 1px solid rgb(207, 207, 207); margin:auto; }
table.tabla-customListOds tbody tr.odd td { background: #e1e5e9; }
table.tabla-customListOds thead tr th { font-size: 14px; }
table.tabla-customListOds tbody tr td { font-size: 14px; }
</style>
</head>
<body>
<form action="PurchaseBoard?tabid=AllVendorList" method="post">
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
	<div class="report-form-underheader">
		<table>
			<tr>
				<td>
					<label style="padding-right: 10px">
						<spring:message code="BzComposer.reportcenter.allinvoicelist.dates"/>
					</label>
				</td>
				<td>
					<select id="datesCombo">
						<option value="0">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.all"/>
						</option>
						<option value="1">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.today"/>
						</option>
						<option value="2">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.thisweek"/>
						</option>
						<option value="3">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.thisweektodate"/>
						</option>
						<option value="4">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.thismonth"/>
						</option>
						<option value="5">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.thismonthtodate"/>
						</option>
						<option value="6">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.fiscalquarter"/>
						</option>
						<option value="7">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.fiscalquartertodate"/>
						</option>
						<option value="8">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.custom"/>
						</option>
						<option value="9">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.last10days"/>
						</option>
						<option value="10">
							<spring:message code="BzComposer.reportcenter.allinvoicelist.dates.last30days"/>
						</option>
						<option value="11">
							<spring:message code="BizComposer.amazonBulkMailer.DateSelect.60Days"/>
						</option>
					</select>
				</td>
				<td>
					<label style="padding-left: 15px">
						<spring:message code="BzComposer.reportcenter.allinvoicelist.from"/>
					</label>
				</td>
				<td>
					<input id="fromDate" size="15"/>
				</td>
				<td>
					<img src="/images/cal.gif" style="padding-left: 5px">
				</td>
				<td>
					<label style="padding-left: 15px"><spring:message code="BzComposer.reportcenter.allinvoicelist.to"/></label>
				</td>
				<td>
					<input id="toDate" size="15"/>
				</td>
				<td>
					<img src="/images/cal.gif" style="padding-left: 5px">
				</td>
				<td><input type="button" value='<spring:message code="BzComposer.reportcenter.allinvoicelist.searchbtn"/>' class="formbutton mar" style="margin-left: 50px" onclick="search()"></td>
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
								<th>Employee ID</th>
								<th>Employee Name</th> 
								<th>Phone</th>
								<th>Mobile</th>
								<th>Email</th>
								<th><spring:message code="BzComposer.global.address1" /></th>
								<th><spring:message code="BzComposer.global.address2" /></th>
								<th><spring:message code="BzComposer.global.zipcode" /></th>
								<th><spring:message code="BzComposer.global.city" /></th>
								<th><spring:message code="BzComposer.global.state" /></th>
								<th><spring:message code="BzComposer.global.country" /></th>
								<th>Memo</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty employeeList}">
								<input type="hidden" name="sListSize" id="lSize" value='${employeeList.size()}'>
								<c:forEach items="${employeeList}" var="objList">
									<tr>
										<td>${objList.id}</td>
										<td>${objList.firstName} ${objList.mi} ${objList.lastName}</td>
										<td>${objList.phone}</td>
										<td>${objList.cellPhone}</td>
										<td>${objList.email}</td>
										<td style="min-width: 250px;">${objList.address1}</td>
										<td style="min-width: 250px;">${objList.address2}</td>
										<td>${objList.zipCode}</td>
										<td>${objList.city}</td>
										<td>${objList.state}</td>
										<td>${objList.country}</td>
										<td>${objList.memo}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>
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