<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<title>BzPayroll - InActive Employee List</title>
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
	font-size: 14px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}
</style>
<style>

/* The final, definitive fix for the tab colors and borders */
.ui-tabs .ui-tabs-nav {
  /* Remove all borders from the main navigation bar */
  border: none !important;

}
.ui-tabs .ui-tabs-nav li {
  /* Style all tabs with a gray background and no border */
  border: 1px solid #ccc !important;


}
.ui-tabs .ui-tabs-nav li.ui-tabs-active {
  /* Style the active tab to be white and remove its bottom border */
  background: white !important;
  border-bottom: 1px solid white !important; /* This creates the seamless look */
  box-shadow: none !important;
}
.ui-tabs .ui-tabs-nav li.ui-tabs-active a {
  /* Ensure the link text is black and remove any outline/shadow */
  background: white !important;
  color: black !important;
  outline: none !important;
  box-shadow: none !important;
}
}
</style>
<style>
/* place this AFTER jQuery UI / DataTables CSS */
#tabs .tabla-listados thead th, .td-id,
#tabs .tabla-listados thead th a {
  color: #007AFF !important;  /* default link-like blue */
  cursor: pointer;            /* pointer cursor like links */
}

#tabs .tabla-listados thead th:hover, .td-id:hover,
#tabs .tabla-listados thead th a:hover {
  color: #0056B3 !important;     
}
#tablecontainer{
    overflow-x: auto;
}
</style>
</head>
<script>
$(function() {
  let jobtype = "${employeeRoleStatus != null ? employeeRoleStatus : false}";
  let jobtypevalue = "${employeeRoleStatusValue != null ? employeeRoleStatusValue : 0}";

  $("#tabs").tabs({
    active: jobtypevalue,
    beforeActivate: function(event, ui) {
      // check which tab was clicked
      if ($(ui.newTab).find("a").hasClass("tabs1")) {
        window.location.href = '/employee-list';
        return false; // prevent jQuery UI from switching tab
      }
      if ($(ui.newTab).find("a").hasClass("tabs2")) {
        window.location.href = '/inactive-employee-list';
        return false;
      }
    }
  });
});
</script>

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
									InActive Employee List
									<c:if
										test="${not empty message}">
										<br /> ${message}
                                    </c:if>
								</span>
							</div>

							<div style="width: 100%;">
								<table style="width: 100%;">
									<tr>
										<td align="center"><input type="button"
											class="formbutton" onclick="openCustomerMailSender();"
											style="padding: 7 15px;"
											value="<spring:message code='BzComposer.Email.SendMail'/>" />
											<input type="button" class="formbutton"
											onclick="openCustomerMailTemplates();" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.Email.MailTemplates'/>" />
											<input type="button" class="formbutton"
											onclick="manageCustomer('CONVERTCUSTOMERtoLEAD');" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.Customer.transform.lead'/>" />
											<input type="button" class="formbutton"
											onclick="manageCustomer('CONVERTCUSTOMERtoCONTACT');" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.Customer.transform.contact'/>" />
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="button"
											class="formbutton" onclick="employeeImport()"
											style="padding: 7 15px;"
											value="<spring:message code='menu.file.Import'/>" />
                                          <input
											type="button" class="formbutton" onclick="employeeExport()"
											style="padding: 7 15px;"
											value="<spring:message code='menu.file.ExportTo'/>" />
											<input
											type="button" class="formbutton" onclick="customerAddressLabels()"
											style="padding: 7 15px;"
											value="<spring:message code='BzComposer.customer.CustomerAddressLabels'/>" />

											</td>
									</tr>
								</table>
							</div>

							<div style="float: right;">
								<table>
									<tr align="right">
										<td colspan="6">
											<div>
												<input type="button" class="formbutton"
													onclick="addNewCustomer();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.new'/>" />
												<input type="button" class="formbutton"
													onclick="manageCustomer('EDIT');" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.edit'/>" />
												<input type="button" class="formbutton"
													onclick="manageCustomer('DELETE');"
													style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.delete'/>" />
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>

						<div style="margin-top:40px; width:100%;" >
                            <div id="formCustomization">
                                <div id="tablecontainer">
                                        <input type="hidden" id="lSize" value='${employeeList.size()}' />
                                        <table id="custTable" class="tabla-listados sortable"
                                            cellspacing="0"
                                            style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
                                            align="center">
                                            <thead>
                                                <tr valign="center">
                                                    <th><input type="checkbox"/></th>
                                                    <th>Employee ID</th>
                                                    <th>Employee Name</th>
                                                    <th>Employee Status</th>
                                                    <th>Payroll Type</th>
                                                    <th>Job Type</th>
                                                    <th>Job Title</th>
                                                    <th><spring:message code="BzComposer.global.address1" /></th>
                                                    <th><spring:message code="BzComposer.global.address2" /></th>
                                                    <th><spring:message code="BzComposer.global.zipcode" /></th>
                                                    <th><spring:message code="BzComposer.global.city" /></th>
                                                    <th><spring:message code="BzComposer.global.state" /></th>
                                                    <th>Memo</th>
                                                    <th>Province</th>
                                                    <th><spring:message code="BzComposer.global.country" /></th>
                                                    <th>Phone</th>
                                                    <th>Mobile</th>
                                                    <th>Email</th>
                                                    <th>Emp Type</th>
                                                    <th>Date of Added</th>
                                                    <th>Terminated</th>
                                                    <th>Terminated Date</th>
                                                    <th>Filing Status</th>
                                                    <th>State Worked</th>
                                                    <th>Pay Period</th>
                                                    <th><spring:message code="BzComposer.UpdateInvoice.Service.Balance" /></th>
                                                    <th>Photo</th>
                                                    <th><spring:message code="Bizcomposer.active" /></th>
                                                </tr>
                                            </thead>
                                            <tbody id="custTableBody">

                                                <c:if test="${not empty employeeList}">
                                                    <c:forEach items="${employeeList}" var="objList"
                                                        varStatus="loop">
                                                        <tr id='${loop.index}$$'
                                                        onclick="setRowId(${objList.id}, ${loop.index}, true);"
                                                        ondblclick="goToCustomerBoard(${objList.id});">
                                                        <td>
                                                            <input type="checkbox" id="custID${loop.index}" value="${objList.id}" onchange="addCustomerRowIndex(${loop.index}, ${objList.id})" />
                                                        </td>
                                                        <td>
                                                            <a class="td-id" href="">${objList.id}</a>
                                                        </td>
                                                        <td>
                                                                ${objList.firstName} ${objList.mi} ${objList.lastName}
                                                        </td>
                                                        <td>${objList.employeeStatus}</td>
                                                        <td>${objList.payrollType}</td>
                                                        <td>${objList.jobType}</td>
                                                        <td>${objList.jobTitle}</td>
                                                        <td style="min-width: 250px;">${objList.address1}</td>
                                                        <td style="min-width: 250px;">${objList.address2}</td>
                                                        <td>${objList.zipCode}</td>
                                                        <td>${objList.city}</td>
                                                        <td>${objList.state}</td>
                                                        <td>${objList.memo}</td>
                                                        <td>${objList.province}</td>
                                                        <td>${objList.country}</td>
                                                        <td>${objList.phone}</td>
                                                        <td>${objList.cellPhone}</td>
                                                        <td>${objList.email}</td>
                                                        <td>${objList.employeeStatus}</td>
                                                        <td>${objList.dateAdded}</td>
                                                        <td>${not empty objList.dateTerminated ? 'Yes' : 'No'}</td>
                                                        <td>${objList.dateTerminated}</td>
                                                        <td>${objList.filingStatus}</td>
                                                        <td>${objList.stateWorked}</td>
                                                        <td>${objList.payPeriod}</td>
                                                        <td>${objList.amount}</td>
                                                        <td>
                                                        <img src="https://bzcomposer.com/bucket${objList.photo}"
                                                        alt="Employee Photo"
                                                        width="60" height="60"
                                                        style="border-radius: 5px; object-fit: cover;" />
                                                    </td>
                                                        <td>${not empty objList.dateTerminated ? 'No' : 'Yes'}</td>

                                                    </tr>
                                                    </c:forEach>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                          </div>
                        </div>
					</div>
					<div>
						<input type="hidden" name="tabid" id="tabid" value="" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
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
        "order": [[0, 'desc']],
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
        }
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
function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}

function manageCustomer(cmd){

	if (itemID == 0) {
		return showCustomerValidationDialog();
	} else {
		if (cmd=="EDIT") {
			//window.location = "Customer?tabid=editCustomer&cvId="+itemID+"&itemIndex="+itemIndex;
			window.open("/edit-employee?employeeId="+itemID, null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
		}
		else if (cmd=="DELETE") {
			event.preventDefault();
			$("#deleteCustomer").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		            "<spring:message code='BzComposer.global.ok'/>": function () {
		                $(this).dialog("close");
		                window.location = "/delete-employee/"+itemID;
		            },
		            <spring:message code='BzComposer.global.cancel'/>: function () {
		                $(this).dialog("close");
		                return false;
		            }
				}
			});
			return false;
		}
		else if (cmd=="CONVERTCUSTOMERtoLEAD") {
			if(confirm("<spring:message code='BzComposer.customerinfo.convertltolead'/>")==true) {
				$.ajax({
                    type : "GET",
                    url : "CustomerConvertToLead?tabid=Customer&customerAction=CONVERT&cvTypeId=Lead&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
		else if (cmd=="CONVERTCUSTOMERtoCONTACT") {
			if(confirm("<spring:message code='BzComposer.customerinfo.convertltocontact'/>")==true) {
				$.ajax({
                    type : "GET",
                    url : "Customer?tabid=Customer&customerAction=CONVERT&cvTypeId=7&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
	}
}

function goToCustomerBoard(clientVendorID){
	window.open("Customer?tabid=editCustomer&cvId="+itemID, null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
	   // window.location = "/Customer?tabid=CustomerBoard&selectedCvID="+clientVendorID;


}
function addNewCustomer(){
	//window.location = "Customer?tabid=NewCustomer";
	window.open("/add-new-employee", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showCustomerValidationDialog(){
	event.preventDefault();
	$("#showCustomerValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function openCustomerMailSender(){


    if (selectedRowIndexs.length == 0){
        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
        return false;
    }else{
        let CustIDs = "";
        for(let x=0; x<selectedRowIndexs.length; x++){
            CustIDs = CustIDs + selectedRowIndexs[x] +":";
        }
        CustIDs = CustIDs.substring(0, CustIDs.length-1);
        window.open("Customer?tabid=ShowEmailOnCustomerBoard&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    }
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

function customerAddressLabels() {
	window.location.href = "Customer?tabid=PrintLabels";
}

function customerAddressLabels()
{
	window.open("Customer?tabid=PrintLabels", null,"scrollbars=yes,height=700,width=1200,status=yes,toolbar=no,menubar=no,location=no");
}
function openCustomerMailTemplates(){
	window.open("MailTemplates?tabid=getMailTemplates", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
}
function employeeImport() {
    window.open(
        "/employees/employee-import",
        "_blank",
        "scrollbars=yes,height=800,width=1200,left=" + left + ",top=" + top + ",status=yes,toolbar=no,menubar=no,location=no,resizable=yes"
    );
}

function employeeExport() {
    window.open(
        "/employees/employee-export",
        "_blank",
        "scrollbars=yes,height=800,width=1200,left=" + left + ",top=" + top + ",status=yes,toolbar=no,menubar=no,location=no,resizable=yes"
    );
}

</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.employeeinfo.selectemployeefirst" />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.employeeinfo.deleteselecteemployee" />
	</p>
</div>