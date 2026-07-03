<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<c:if test="${not empty AdminURL && AdminURL=='administer'}">
	<%@include file="/WEB-INF/jsp/include/menuAdmin.jsp"%>
</c:if>
<c:if test="${empty AdminURL}">
	<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
</c:if>
<title><spring:message code="BzComposer.customerinfotitle" /></title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
/* .redColor{color: red;} */
.dataTables_filter {
	font-size: 14px;
}

.dataTables_info {
	font-size: 14px;
}

.dataTables_paginate {
	font-size: 14px;
}

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
<script type="text/javascript">
flag_state = 0;
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var o22 = null;
var o33 = null;
var oT = null;
var r = null;
function c(r) 
{
	console.log("c");
	if (___) {
    	var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    	try {
      		o = new ActiveXObject(t);
      		o.onreadystatechange = r;
    	} 
    	catch (ex) {
      		alert("<spring:message code='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
    	}
  	} else {
    	o = new XMLHttpRequest();
    	o.onload = r;
    	o.onerror = r;
  	}
  	return o;
}
function oGET(oo, url) {
	console.log("00"+oo);
	try {
    	oo.open("GET", url, true);	
    	oo.send(null);
  	} 
	catch (ex) 
	{}
}

function writeSelectTH(){
	console.log("writeSelectTH");
	if (oT.readyState != 4 || oT.status != 200) {
		return;
   	}
   	document.getElementById("t_history").innerHTML = o.responseText ;
}
function refreshTransationNow(radio_val,custid,dfrom,dto){
	console.log("refreshTransationNow");
	 oT = c(writeSelectTH); 
	oGET(oT,'${pageContext.request.contextPath}/sales/addTransactionHistory.jsp?custId=' + custid+'&cond='+radio_val+'&pfrom='+dfrom+'&pto='+dto)
}

$(document).ready(function() 
{
	console.log("inside default function");
	
$('#custTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    
    "order": [[0, 'desc']]
});
$('#contactTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "paging": true,
   
    "order": [[0, 'desc']] ,
drawCallback: function (settings) {
	 setRowId(0, 0, false);
}

});
$('#opportunityTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]

});

$('#eventTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]
});
$('#taskTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]
});

$('#logaCallTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]
});


$('#caseTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]
});
$('#jobTable').DataTable({
	"iDisplayLength": 10,
	"ordering": true,
	"order": [[0, 'desc']]
});
$('#technicianTable').DataTable({
	"iDisplayLength": 10,
	"ordering": true,
	"order": [[0, 'desc']]
});
$('#dispatchTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [[0, 'desc']]
    });
$('#sortBy').change(function(){
	var sortBy = $(this).val();
	$.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=sortInvoice&SortBy="+sortBy,
        data:{sortBy : sortBy},
    }).done(function(data){
        $('#custTableBody').html('');
        var custDetails = "<input type='hidden' name='listSize' id='lSize' value='"+data.length+"'>";
        for(var i=0; i<data.length; i++){
            var objList = data[i];
            custDetails = custDetails + "<tr id='"+i+"$$' onclick='setCutomerDataById("+objList.clientVendorID+", "+i+")'>"
                +"<td colspan='2' style='font-size:12px;'>"+objList.clientVendorID+" : "+objList.cname+" ("+objList.firstName+" "+objList.lastName+")</td></tr>";
        }
        $('#custTableBody').html(custDetails);
    });
});

});
</script>
<style type="text/css">
div#pie {
	padding: 10px 0px 20px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}

table.tabla-listados thead tr th {
	font-size: .7em;
	text-align: left;
	padding: 5px 10px;
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}

table.tabla-listados tbody tr td {
	font-size: .8em;
	padding: 5px 0px 5px 12px;
	background: #fff;
	vertical-align: top;
}
</style>
</head>
<body onload="initialize();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="CustomerForm" method="post"
		modelAttribute="customerDto">
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
										<spring:message code="BzComposer.sales.CustomerBoard" />
									</span> <br>
									<table>
										<tr>
											<td><spring:message code="BzComposer.customer.sortby" /></td>
											<td><select id="sortBy">
													<option value="1"><spring:message
															code="BzComposer.customerinfo.companyname" /></option>
													<option value="2"><spring:message
															code="BzComposer.global.firstname" /></option>
													<option value="3"><spring:message
															code="BzComposer.global.lastname" /></option>
											</select></td>

										</tr>
									</table>
								</div>

								<div style="float: right;">
									<table>
										<tr align="right">
											<td colspan="6">
												<div>
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
							<table style="width: 100%; apdding: 0;">
								<tr>
									<td>
										<table style="padding: 0; width: 100%; margin-top: 10px;"
											align="center">
											<tr>
												<td valign="top" colspan="1"
													style="width: 250px; padding: 0; height: 75vh; border: 1px solid #ccc;">
													<input type="hidden" name="listSize" id="lSize"
													value='${CustomerDetails.size()}' />
													<table id="custTable" class="tabla-listados"
														cellspacing="0"
														style="border: 0; padding: 0; margin: 0; height: auto;">
														<thead>
															<tr valign="top">
																<th class="emblem" style="font-size: 12px;">
																	<div align="center">
																		<spring:message
																			code="BzComposer.customerinfo.customer" />
																	</div>
																</th>
															</tr>
														</thead>
														<tbody id="custTableBody">
															<c:forEach items="${CustomerDetails}" var="objList"
																varStatus="loop">
																<tr id='${loop.index}$$'
																	onclick="setCutomerDataById(${objList.clientVendorID}, ${loop.index})">
																	<td colspan="2" style="font-size: 12px;"
																		class="${objList.paymentUnpaid?'redColor':''}">
																		${objList.clientVendorID} : ${objList.cname} <span
																		style="display: none;">:${objList.firstName}:${objList.lastName}:${objList.zipCode}:${objList.phone}:${objList.cellPhone}:${objList.zipCode}:${objList.city}:${objList.address1}:${objList.address2}</span>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</td>
												<td colspan="10" style="vertical-align: 0;">
													<div id="table-negotiations" style="height: auto;">
														<table cellspacing="0" class="tabla-listados"
															style="margin-top: 0; margin-left: 20px;">
															<thead>
																<tr>
																	<td align="left"><img
																		src="/ConfigurationImages/customerCompany.png"
																		height="30" width="60"> <label
																		id="customerCompanyName" align="left"
																		style="font-size: 15px; font-weight: bold; color: #05A9C5"></td>
																</tr>

															</thead>
															<tbody>
																<tr>
																	<td style="padding: 0;">
																		<div id="customerInvoice"
																			style="padding: 0; position: relative; left: 0;">
																			<div id="tabs" style="height: auto;">
																				<ul>

																					<li style="font-size: 12px;"><a
																						href="#CustomerTab"><spring:message
																								code="BzComposer.customerinfo.customerinformation" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#CustomerContactTab"><spring:message
																								code="BzComposer.customerinfo.contactinformation" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#OpportunityTab"><spring:message
																								code="BzComposer.customer.opportunity.opportunityDetails" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#CaseTab"><spring:message
																								code="BzComposer.customer.case.caseDetails" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#OpenActivitiesTab"><spring:message
																								code="BzComposer.CustomerBoard.openActivities" /></a></li>

																					<li style="font-size: 12px;"><a
																						href="#ActivityHistoryTab"><spring:message
																								code="BzComposer.CustomerBoard.activityHistory" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#NotesAttachmentsTab"><spring:message
																								code="BzComposer.CustomerBoard.notesAttachments" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#PatnerTab"><spring:message
																								code="BzComposer.CustomerBoard.partners" /></a></li>
																					<li style="font-size: 12px;"><a
																						href="#TransactionTab"><spring:message
																								code="BzComposer.updatecustomer.tabs.transactionhistory" /></a></li>
																				</ul>


																				<!----  =================== Customer Information ==============  ---->

																				<div id="CustomerTab" style="display: none;">

																					<div id="table-negotiations" style="height: auto;">
																						<table cellspacing="0" class="tabla-listados"
																							style="margin-top: 0; margin-left: 20px;">
																							<thead>

																								<tr>
																									<th colspan="3" style="font-size: 12px;">
																										<spring:message
																											code="BzComposer.customerinfo.customerinformation" />
																									</th>
																								</tr>
																							</thead>
																							<tbody>
																								<tr>
																									<td style="width: 40%;">
																										<table cellspacing="0" class="tabla-listados">
																											<tr>
																												<td style="width: 50%;"><strong><spring:message
																															code="BzComposer.global.customerid" />:</strong></td>
																												<td style="width: 50%;" id="customerID"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.Employee.Name" />:</strong></td>
																												<td id="customerName"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.Customer.CompanyName" />:</strong></td>
																												<td id="cname"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.register.dbaName" />:</strong></td>
																												<td id="dbaName"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.Customer.Type" />:</strong></td>
																												<td><select id="customerType"
																													disabled="true">
																														<option value="0"><spring:message
																																code="BzComposer.ComboBox.Select" /></option>
																														<c:forEach items="${VendorCategoryList}"
																															var="item">
																															<option value="${item.value}">${item.label}</option>
																														</c:forEach>
																												</select></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.updatevendor.billingAddress" />:</strong></td>
																												<td id="billingAddress"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.updatevendor.shippingAddress" />:</strong></td>
																												<td id="shippingAddress"></td>
																											</tr>
																										</table>
																									</td>
																									<td style="width: 30%;">
																										<table cellspacing="0" class="tabla-listados">
																											<tr>
																												<td style="width: 50%;"><strong><spring:message
																															code="BzComposer.global.phone" />:</strong></td>
																												<td style="width: 50%;" id="phone"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.mobile" />:</strong></td>
																												<td id="cellPhone"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.fax" />:</strong></td>
																												<td id="fax"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.email" />:</strong></td>
																												<td id="email"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.dateadded" />:</strong></td>
																												<td id="dateAdded"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.orderimport.lastorderdate" />:</strong></td>
																												<td id="lastOrderDate"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.country" />:</strong></td>
																												<td><select id="country"
																													disabled="true" style="width: 170px;">
																														<option value="0"><spring:message
																																code="BzComposer.ComboBox.Select" /></option>
																														<c:forEach items="${countryList}"
																															var="item">
																															<option value="${item.countryId}">${item.countryName}</option>
																														</c:forEach>
																												</select></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="Bizcomposer.active" />:</strong></td>
																												<td id="activeCustomer"></td>
																											</tr>
																										</table>
																									</td>
																									<td style="width: 30%;">
																										<table cellspacing="0" class="tabla-listados">
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.common.totalOverdueAmount" />:</strong></td>
																												<td id="totalOverdueAmt"></td>
																											</tr>
																											<tr>
																												<td style="width: 60%;"><strong><spring:message
																															code="BzComposer.sales.SalesAmount" /></strong></td>
																												<td style="width: 40%;"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.common.last3MonthsAmount" />:</strong></td>
																												<td id="last3MonthAmt"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.common.last1YearAmount" />:</strong></td>
																												<td id="last1YearAmt"></td>
																											</tr>

																											<tr>
																												<td>&nbsp;</td>
																												<td>&nbsp;</td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.oppeningunpaidbalance" />:</strong></td>
																												<td id="openingUB"></td>
																											</tr>
																											<tr>
																												<td><strong><spring:message
																															code="BzComposer.global.existingcredits" />:</strong></td>
																												<td id="extCredit"></td>
																											</tr>
																										</table>
																									</td>
																								</tr>
																							</tbody>
																						</table>
																					</div>
																				</div>


																				<!----  =================== Customer Information END ==============  ---->


																				<!-- ===============  Customer Conatact   Details ================ -->
																				<div id="CustomerContactTab" style="display: none;">


																					<input type="hidden" name="clistSize" id="cSize"
																						value='${customerContactList.size()}' />
																					<table class="tabla-listados" cellspacing="0"
																						style="margin-top: 0; margin-left: 20px;">
																						<thead>
																							<tr>
																								<th style="font-size: 14px;"><spring:message
																										code="BzComposer.customer.opportunity.contactDetails" />
																								</th>
																							</tr>
																						</thead>
																						<tbody>
																							<tr align="right">
																								<td style="padding-right: 12px ! important;">
																									<table>
																										<tr align="left">
																											<td colspan="6">
																												<div>
																													<input type="button" class="formbutton"
																														onclick="addNewContact();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.new'/>" />
																													<input type="button" class="formbutton"
																														onclick="editContact();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.edit'/>" />
																													<input type="button" class="formbutton"
																														onclick="deleteContact();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.delete'/>" />
																												</div>
																											</td>
																										</tr>
																									</table>
																								</td>
																							</tr>

																							<tr>
																								<td>

																									<table id="contactTable"
																										class="tabla-listados sortable"
																										cellspacing="0"
																										style="margin-top: 10px; border: 0; padding: 0; height: auto;">
																										<thead>
																											<tr valign="center">
																												<th style="padding-right: 30px !important;"><spring:message
																														code="BzComposer.global.contactid" /></th>
																												<th><spring:message
																														code="BzComposer.customer.contactName" /></th>
																												<th><spring:message
																														code="BzComposer.global.titlename" /></th>
																												<th><spring:message
																														code="BzComposer.global.email" /></th>
																												<th><spring:message
																														code="BzComposer.global.phone" /></th>

																											</tr>
																										</thead>
																										<tbody id="contactTableBody">
																											<c:if test="${not empty customerContactList}">
																												<c:forEach items="${customerContactList}"
																													var="objList" varStatus="loop">
																													<tr id='${loop.index}c$$'
																														onclick="setRowId(${objList.contactID}, ${loop.index}, true);">
																														<td><input type="checkbox"
																															id="custID${loop.index}"
																															value="${objList.contactID}"
																															onchange="addRowIndex(${loop.index}, ${objList.contactID})" />

																															${objList.contactID}</td>
																														<td>${objList.firstName}${objList.middleName}
																															${objList.lastName}</td>
																													</tr>
																												</c:forEach>
																											</c:if>
																										</tbody>
																									</table>

																								</td>
																							</tr>

																						</tbody>

																						<tr>
																					</table>




																				</div>
																				<!-- ===============  Customer Contact    Details END================ -->



																				<!-- =============== opportunity  Details ================ -->

																				<div id="OpportunityTab" style="display: none;">

																					<input type="hidden" name="plistSize" id="pSize"
																						value='${opportunityList.size()}' />
																					<table class="tabla-listados" cellspacing="0"
																						style="margin-top: 0; margin-left: 20px;">
																						<thead>
																							<tr>
																								<th style="font-size: 14px;"><spring:message
																										code="BzComposer.customer.opportunity.opportunityDetails" />
																								</th>
																							</tr>
																						</thead>
																						<tbody>
																							<tr align="right">
																								<td style="padding-right: 12px ! important;">
																									<table>
																										<tr align="left">
																											<td colspan="6">
																												<div>
																													<input type="button" class="formbutton"
																														onclick="addOpportunity();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.new'/>" />
																													<input type="button" class="formbutton"
																														onclick="updateOpportunity();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.edit'/>" />
																													<input type="button" class="formbutton"
																														onclick="deleteOpportunity();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.delete'/>" />
																												</div>
																											</td>
																										</tr>
																									</table>
																								</td>
																							</tr>

																							<tr>
																								<td>

																									<table id="opportunityTable"
																										class="tabla-listados sortable"
																										cellspacing="0"
																										style="margin-top: 10px; border: 0; padding: 0; height: auto;">
																										<thead>
																											<tr valign="center">
																												<th style="padding-right: 30px !important;"><spring:message
																														code="BzComposer.Customer.opportunities.id" /></th>
																												<th><spring:message
																														code="BzComposer.Customer.opportunities.name" /></th>

																												<th><spring:message
																														code="BzComposer.Customer.opportunities.stage" /></th>
																												<th><spring:message
																														code="BzComposer.Customer.opportunities.amount" /></th>

																												<th><spring:message
																														code="BzComposer.Customer.opportunities.opportunityOwner" />
																												</th>
																												<th><spring:message
																														code="BzComposer.customer.opportunity.sourceID" /></th>
																												<th><spring:message
																														code="BzComposer.campaign.campaignName" /></th>


																												<th><spring:message
																														code="BzComposer.Customer.opportunities.startdate" /></th>
																												<th><spring:message
																														code="BzComposer.Customer.opportunities.closedate" /></th>
																											</tr>
																										</thead>
																										<tbody id="opportunityTableBody">
																											<c:if test="${not empty opportunityList}">
																												<c:forEach items="${opportunityList}"
																													var="objList" varStatus="loop">
																													<tr id='${loop.index}p$$'
																														onclick="setRowIdOpportunity(${objList.opportunityID}, ${loop.index}, true);"
																														ondblclick="goToManageOpportunity(${objList.opportunityID});">

																														<td><input type="checkbox"
																															id="opportunityId${loop.index}"
																															value="${objList.opportunityID}"
																															onchange="addRowIndex(${loop.index}, ${objList.opportunityID})" />
																															${objList.opportunityID}</td>
																														<td>${objList.opportunityName}</td>
																														<td>${objList.stage}</td>
																														<td>${objList.amount}</td>
																														<td>${objList.opportunityOwner}</td>
																														<td>${objList.sourceID}</td>
																														<td>${objList.campaignName}</td>
																														<td>${objList.startDate}</td>
																														<td>${objList.closedDate}</td>
																														<td>Yes</td>
																													</tr>
																												</c:forEach>
																											</c:if>
																										</tbody>
																									</table>

																								</td>
																							</tr>

																						</tbody>

																						<tr>
																					</table>

																				</div>


																				<!-- =============== opportunity  Details END ================ -->

																				<!-- =============== CASE  Details  ================ -->

																				<div id="CaseTab" style="display: none;">
																					

																					<table class="tabla-listados" cellspacing="0"
																						style="margin-top: 0; margin-left: 20px;">
																						<thead>
																							<tr>
																								<th style="font-size: 14px;"><spring:message
																										code="BzComposer.customer.case.caseDetails" />
																								</th>
																							</tr>
																						</thead>
																						<tbody>
																							<tr align="right">
																								<td style="padding-right: 12px ! important;">
																									<table>
																										<tr align="left">
																											<td colspan="6">
																												<div>
																													<input type="button" class="formbutton"
																														onclick="addNewCase();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.new'/>" />
																													<input type="button" class="formbutton"
																														onclick="editCase()"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.edit'/>" />
																													<input type="button" class="formbutton"
																														onclick="deleteCase();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.delete'/>" />
																												</div>
																											</td>
																										</tr>
																									</table>
																								</td>
																							</tr>

																							<tr>
																								<td>

																									<table id="caseTable"
																										class="tabla-listados sortable"
																										cellspacing="0"
																										style="margin-top: 10px; border: 0; padding: 0; height: auto;">
																										<thead>
																											<tr valign="center">
																												<th style="padding-right: 30px !important;"><spring:message
																														code="BzComposer.customer.case.caseID" /></th>
																												<th><spring:message
																														code="BzComposer.customer.case.contactName" /></th>
																												<th><spring:message
																														code="BzComposer.customer.case.subject" /></th>
																												<th><spring:message
																														code="BzComposer.customer.case.product" /></th>
																												<th><spring:message
																														code="BzComposer.customer.case.caseType" /></th>

																												<th><spring:message
																														code="BzComposer.customer.case.priority" /></th>
																												<th><spring:message
																														code="BzComposer.customer.case.dateOpened" /></th>

																												<th><spring:message
																														code="BzComposer.customer.case.status" /></th>
																												<th><spring:message
																														code="BzComposer.customer.case.owner" /></th>

																											</tr>
																										</thead>
																										<tbody id="caseTableBody">
																											<c:if test="${not empty caseList}">
																												<c:forEach items="${caseList}" var="objList"
																													varStatus="loop">
																													<tr id='${loop.index}case$$'
																														onclick="setRowIdCase(${objList.caseID}, ${loop.index}, true);">

																														<td><input type="hidden"
																															id="caseId${loop.index}"
																															value="${objList.caseID}"
																															onchange="addRowIndex(${loop.index}, ${objList.caseID})" />
																															${objList.caseId}</td>
																														<!-- 	<td>${objList.opportunity.opportunityId}</td> -->
																														<td>${objList.contactName}</td>
																														<td>${objList.subject}</td>
																														<td>${objList.product}</td>
																														<td>${objList.caseType}</td>
																														<td>${objList.priority}</td>


																														<td>${objList.status}</td>
																														<td>${objList.dateOpened}</td>
																														<td>${objList.owner}</td>
																													</tr>
																												</c:forEach>
																											</c:if>
																										</tbody>
																									</table>

																								</td>
																							</tr>

																						</tbody>

																						<tr>
																					</table>

																				</div>

																				<!-- =============== CASE Details END BzComposer.CustomerBoard.openActivities ================ -->




																							<!-- =============== Activity History   start================ -->
<div id="ActivityHistoryTab" style="display: none;">


																					<div id="activtHisTabs" style="height: auto;">
																						<ul>

																							<li style="font-size: 12px;"><a
																								href="#LogAcallTab"><spring:message
																										code="BzComposer.campaign.logACall" /></a></li>
																							<li style="font-size: 12px;"><a
																								href="#SendMailTab" onclick="openMailSender()"> <spring:message
																										code="BzComposer.campaign.sendMail" /></a>
																							 </li>
																						</ul>
																						
																						
																						
																						
																						
																						
																						
																							<div id="LogAcallTab" style="display: none;">
																							<table class="tabla-listados" cellspacing="0"
																								style="margin-top: 0; margin-left: 20px;">
																								<thead>
																									<tr>
																										<th style="font-size: 14px;"><spring:message
																												code="BzComposer.crmCustomer.logaCall.Details" />
																										</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr align="right">
																										<td style="padding-right: 12px ! important;">
																											<table>
																												<tr align="left">
                                                                                                                     <!--  
																													<td><spring:message
																															code="BzComposer.customer.eventType" /></td>
																													<td><form:select path="eventType"
																															id="eventTypeID" style="width:200px;"
																															onchange="loadEventList()">
																															<form:option value="0">
																																<spring:message
																																	code="BzComposer.customer.opportunity" />
																															</form:option>
																															<form:option value="1">
																																<spring:message
																																	code="BzComposer.customer.case" />
																															</form:option>

																														</form:select></td>
																														-->

																													
																												</tr>
																											</table>
																										</td>
																									</tr>


<tr>
															<td>
																<div align="right">
																	<input type="button" class="formbutton"
																		onclick="addLogaCall();" style="padding: 7 15px;"
																		value="<spring:message code='BzComposer.global.new'/>" />
																	<input type="button" class="formbutton"
																		onclick="editLogaCall()" style="padding: 7 15px;"
																		value="<spring:message code='BzComposer.global.edit'/>" />
																	<input type="button" class="formbutton"
																		onclick="deleteLogaCall();" style="padding: 7 15px;"
																		value="<spring:message code='BzComposer.global.delete'/>" />
																</div>
															</td>
														</tr>
																									<tr>
																										<td>

																											<table id="logaCallTable"
																												class="tabla-listados sortable"
																												cellspacing="0"
																												style="margin-top: 10px; border: 0; padding: 0; height: auto;">

																												<colgroup>
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 20%;">
																													<col span="1" style="width: 40%;">
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 20%;">
																													
																												</colgroup>
																												<thead id="logaCallThred">

																													<tr valign="center">

																														<th
																															style="padding-right: 30px !important;"><spring:message
																																code="BzComposer.CustomerBoard.taskID" /></th>
																														<th><spring:message
																																code="BzComposer.CustomerBoard.subject" /></th>
																														<th><spring:message
																																code="BzComposer.crmCustomer.logaCall.comment" /></th>

																														<th><spring:message
																																code="BzComposer.CustomerBoard.contactName" /></th>
																														<th><spring:message
																																code="BzComposer.CustomerBoard.RelatedTo" /></th>

																														
																													</tr>

																												</thead>
																												<tbody id="logaCallTableBody">
																													
																												</tbody>
																											</table>
																										</td>
																									</tr>
																								</tbody>
																								<tr>
																							</table>

																						</div>
																						</div>
																						</div>
																							<!-- =============== Activity History   End================ -->
																						
																						
																				<!-- =============== Open Activities   Details Start  ================ -->

																				<div id="OpenActivitiesTab" style="display: none;">


																					<div id="activtiesTabs" style="height: auto;">
																						<ul>

																							<li style="font-size: 12px;"><a
																								href="#EventDetailsTab"><spring:message
																										code="BzComposer.customer.opportunity.EventDetails" /></a></li>
																							<li style="font-size: 12px;"><a
																								href="#TaskDetailsTab"><spring:message
																										code="BzComposer.CustomerBoard.taskDetails" /></a></li>
																						</ul>


																						<div id="EventDetailsTab" style="display: none;">
																							<table class="tabla-listados" cellspacing="0"
																								style="margin-top: 0; margin-left: 20px;">
																								<thead>
																									<tr>
																										<th style="font-size: 14px;"><spring:message
																												code="BzComposer.customer.opportunity.EventDetails" />
																										</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr align="right">
																										<td style="padding-right: 12px ! important;">
																											<table>
																												<tr align="left">

																													<td><spring:message
																															code="BzComposer.customer.eventType" /></td>
																													<td><form:select path="eventType"
																															id="eventTypeID" style="width:200px;"
																															onchange="loadEventList()">
																															<form:option value="0">
																																<spring:message
																																	code="BzComposer.customer.opportunity" />
																															</form:option>
																															<form:option value="1">
																																<spring:message
																																	code="BzComposer.customer.case" />
																															</form:option>

																														</form:select></td>

																													<td colspan="6">
																														<div>
																															<input type="button" class="formbutton"
																																onclick="addEvent();"
																																style="padding: 7 15px;"
																																value="<spring:message code='BzComposer.global.new'/>" />
																															<input type="button" class="formbutton"
																																onclick="editEvent()"
																																style="padding: 7 15px;"
																																value="<spring:message code='BzComposer.global.edit'/>" />
																															<input type="button" class="formbutton"
																																onclick="deleteEvent();"
																																style="padding: 7 15px;"
																																value="<spring:message code='BzComposer.global.delete'/>" />
																														</div>
																													</td>
																												</tr>
																											</table>
																										</td>
																									</tr>

																									<tr>
																										<td>

																											<table id="eventTable"
																												class="tabla-listados sortable"
																												cellspacing="0"
																												style="margin-top: 10px; border: 0; padding: 0; height: auto;">

																												<colgroup>
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 15%;">
																													<col span="1" style="width: 20%;">
																													<col span="1" style="width: 25%;">
																													<col span="1" style="width: 15%;">
																													<col span="1" style="width: 15%;">

																												</colgroup>
																												<thead id="eventthead">
																													<tr valign="center">
																														<th
																															style="padding-right: 30px !important;"><spring:message
																																code="BzComposer.customer.opportunity.eventId" /></th>
																														<th><spring:message
																																code="BzComposer.customer.event.opportunity" /></th>
																														<th><spring:message
																																code="BzComposer.customer.opportunity.eventName" /></th>

																														<th><spring:message
																																code="BzComposer.customer.opportunity.eventMemo" /></th>
																														<th><spring:message
																																code="BzComposer.customer.opportunity.eventStartDate" /></th>

																														<th><spring:message
																																code="BzComposer.customer.opportunity.eventEndDate" /></th>

																													</tr>
																												</thead>
																												<tbody id="eventTableBody">
																													<c:if test="${not empty eventList}">
																														<c:forEach items="${eventList}"
																															var="objList" varStatus="loop">
																															<tr id='${loop.index}e$$'
																																onclick="setRowIdEvent(${objList.eventId}, ${loop.index}, true);">

																																<td><input type="hidden"
																																	id="eventId${loop.index}"
																																	value="${objList.eventId}"
																																	onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
																																	${objList.eventId}</td>
																																<!-- 	<td>${objList.opportunity.opportunityId}</td> -->
																																<td>${objList.opportunityID}</td>
																																<td>${objList.eventName}</td>
																																<td>${objList.eventMemo}</td>
																																<td>${objList.formatedEventStartDate}</td>
																																<td>${objList.formatedEventEndDate}</td>
																															</tr>
																														</c:forEach>
																													</c:if>
																												</tbody>
																											</table>

																										</td>
																									</tr>

																								</tbody>

																								<tr>
																							</table>

																						</div>


																						<div id="TaskDetailsTab" style="display: none;">
																							<table class="tabla-listados" cellspacing="0"
																								style="margin-top: 0; margin-left: 20px;">
																								<thead>
																									<tr>
																										<th style="font-size: 14px;"><spring:message
																												code="BzComposer.CustomerBoard.taskDetails" />
																										</th>
																									</tr>
																								</thead>
																								<tbody>
																									<tr align="right">
																										<td style="padding-right: 12px ! important;">
																											<table>
																												<tr align="left">
                                                                                                                     <!--  
																													<td><spring:message
																															code="BzComposer.customer.eventType" /></td>
																													<td><form:select path="eventType"
																															id="eventTypeID" style="width:200px;"
																															onchange="loadEventList()">
																															<form:option value="0">
																																<spring:message
																																	code="BzComposer.customer.opportunity" />
																															</form:option>
																															<form:option value="1">
																																<spring:message
																																	code="BzComposer.customer.case" />
																															</form:option>

																														</form:select></td>
																														-->

																													
																												</tr>
																											</table>
																										</td>
																									</tr>


<tr>
															<td>
																<div align="right">
																	<input type="button" class="formbutton"
																		onclick="addTask();" style="padding: 7 15px;"
																		value="<spring:message code='BzComposer.global.new'/>" />
																	<input type="button" class="formbutton"
																		onclick="editTask()" style="padding: 7 15px;"
																		value="<spring:message code='BzComposer.global.edit'/>" />
																	<input type="button" class="formbutton"
																		onclick="deleteTask();" style="padding: 7 15px;"
																		value="<spring:message code='BzComposer.global.delete'/>" />
																</div>
															</td>
														</tr>
																									<tr>
																										<td>

																											<table id="taskTable"
																												class="tabla-listados sortable"
																												cellspacing="0"
																												style="margin-top: 10px; border: 0; padding: 0; height: auto;">

																												<colgroup>
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 20%;">
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 20%;">
																													<col span="1" style="width: 10%;">
																													<col span="1" style="width: 10%;">
																												</colgroup>
																												<thead id="taskthead">

																													<tr valign="center">

																														<th
																															style="padding-right: 30px !important;"><spring:message
																																code="BzComposer.CustomerBoard.taskID" /></th>
																														<th><spring:message
																																code="BzComposer.CustomerBoard.subject" /></th>
																														<th><spring:message
																																code="BzComposer.CustomerBoard.dueDate" /></th>

																														<th><spring:message
																																code="BzComposer.CustomerBoard.contactName" /></th>
																														<th><spring:message
																																code="BzComposer.CustomerBoard.RelatedTo" /></th>

																														<th><spring:message
																																code="BzComposer.CustomerBoard.assignedTo" /></th>
																														<th><spring:message
																																code="BzComposer.CustomerBoard.status" /></th>

																													</tr>

																												</thead>
																												<tbody id="taskTableBody">
																													<c:if test="${not empty taskList}">
																														<c:forEach items="${taskList}"
																															var="objList" varStatus="loop">

																															<tr id='${loop.index}task$$'
																																onclick="setRowIdTask(${objList.taskID}, ${loop.index}, true);">

																																<td><input type="hidden"
																																	id="taskId${loop.index}"
																																	value="${objList.taskID}"
																																	onchange="addRowIndex(${loop.index}, ${objList.taskID})" />
																																	${objList.taskID}</td>
																																<!-- 	<td>${objList.opportunity.opportunityId}</td> -->
																																<td>${objList.taskID}</td>
																																<td>${objList.subject}</td>
																																<td>${objList.dueDate}</td>
																																<td>${objList.relatedTo}</td>
																																<td>${objList.assignedTo}</td>
																																<td>${objList.status}</td>
																																<td>${objList.active}</td>
																															</tr>
																														</c:forEach>
																													</c:if>
																												</tbody>
																											</table>
																										</td>
																									</tr>
																								</tbody>
																								<tr>
																							</table>

																						</div>

																					</div>



																				</div>




																				<!-- =============== Open Activities   Details  END  ================ -->


																				<!-- =============== Transaction History ================ -->
																				<div id="TransactionTab" style="display: none;">



																					<table class="tabla-listados" cellspacing="0"
																						style="margin-top: 0; margin-left: 20px;">
																						<thead>
																							<tr>
																								<th style="font-size: 14px;"><spring:message
																										code="BzComposer.updatecustomer.tabs.transactionhistory" />
																								</th>
																							</tr>
																						</thead>
																						<tbody>
																							<tr>
																								<td style="padding-right: 12px ! important;">
																									<table class="tabla-listados" cellspacing="0">
																										<thead>
																											<tr>
																												<th colspan="4"><spring:message
																														code="BzComposer.updatecustomer.displayoption" />
																												</th>
																											</tr>
																										</thead>
																										<tbody>
																											<tr>
																												<td colspan="4"><form:radiobutton
																														path="dispay_info" value="ShowAll"
																														onclick="hide_details(this.value);" /> <spring:message
																														code="BzComposer.updatecustomer.showall" />
																													<script type="text/javascript">
                                                    radio_val = document.CustomerForm.dispay_info.value;
                                                </script></td>
																											</tr>
																											<tr>
																												<td><form:radiobutton
																														path="dispay_info" value="ByVal"
																														onclick="hide_details(this.value);" /> <spring:message
																														code="BzComposer.updatecustomer.byval" /></td>
																												<td><spring:message
																														code="BzComposer.updatecustomer.from" />
																													<form:input path="periodFrom"
																														readonly="true" size="15" disabled="true" />
																													<img
																													src="${pageContext.request.contextPath}/images/cal.gif"
																													id="imgfrm"
																													onclick="displayCalendar(document.CustomerForm.periodFrom,'mm-dd-yyyy',this);" />
																												</td>
																												<td><spring:message
																														code="BzComposer.updatecustomer.to" /> <form:input
																														path="periodTo" readonly="true" size="15"
																														disabled="true" /> <img
																													src="${pageContext.request.contextPath}/images/cal.gif"
																													id="imgto"
																													onclick="displayCalendar(document.CustomerForm.periodTo,'mm-dd-yyyy',this);" />
																												</td>
																												<td><input type="button"
																													class="formbutton"
																													value="<spring:message code='BzComposer.updatecustomer.lookhistory'/>"
																													id="lookBtn" onclick="lookUpHistory();" /></td>
																											</tr>
																										</tbody>
																									</table>
																									<div id="t_history"></div>
																								</td>
																							</tr>
																						</tbody>
																					</table>

																				</div>

																				<!-- =============== Transaction History END ================ -->



<!------------------                      Patner Tab End       -------------------->
<div id="PatnerTab" style="display: none;">
																					

																					<table class="tabla-listados" cellspacing="0"
																						style="margin-top: 0; margin-left: 20px;">
																						<thead>
																							<tr>
																								<th style="font-size: 14px;"><spring:message
																										code="BzComposer.crmCustomer.patner.Details" />
																								</th>
																							</tr>
																						</thead>
																						<tbody>
																							<tr align="right">
																								<td style="padding-right: 12px ! important;">
																									<table>
																										<tr align="left">
																											<td colspan="6">
																												<div>
																													<input type="button" class="formbutton"
																														onclick="addPatner();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.new'/>" />
																													<input type="button" class="formbutton"
																														onclick="editPatner()"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.edit'/>" />
																													<input type="button" class="formbutton"
																														onclick="deletePatner();"
																														style="padding: 7 15px;"
																														value="<spring:message code='BzComposer.global.delete'/>" />
																												</div>
																											</td>
																										</tr>
																									</table>
																								</td>
																							</tr>

																							<tr>
																								<td>

																									<table id="caseTable"
																										class="tabla-listados sortable"
																										cellspacing="0"
																										style="margin-top: 10px; border: 0; padding: 0; height: auto;">
																										<thead>
																											<tr valign="center">
																												
									<th><spring:message code="BzComposer.Customer.ID" /></th>
									<th><spring:message
											code="BzComposer.global.name" /></th>
									<th><spring:message code="BzComposer.global.company" /></th>
								
									<th><spring:message code="BzComposer.global.address1" /></th>
									<th><spring:message code="BzComposer.global.address2" /></th>
									<th><spring:message code="BzComposer.global.city" /></th>
									<th><spring:message code="BzComposer.global.state" /></th>
									<th><spring:message code="BzComposer.global.zipcode" /></th>
									<th><spring:message code="BzComposer.global.country" /></th>
									<th><spring:message
											code="BzComposer.orderimport.lastorderdate" /></th>
									
									<th><spring:message code="BzComposer.UpdateInvoice.Service.Balance" />
									
									</th>
									
								
										</tr>
																										</thead>
																										<tbody id="caseTableBody">
																											<c:if test="${not empty caseList}">
																												<c:forEach items="${caseList}" var="objList"
																													varStatus="loop">
																													<tr id='${loop.index}case$$'
																														onclick="setRowIdCase(${objList.caseID}, ${loop.index}, true);">

																														<td><input type="hidden"
																															id="caseId${loop.index}"
																															value="${objList.caseID}"
																															onchange="addRowIndex(${loop.index}, ${objList.caseID})" />
																															${objList.caseId}</td>
																														<!-- 	<td>${objList.opportunity.opportunityId}</td> -->
																														<td>${objList.contactName}</td>
																														<td>${objList.subject}</td>
																														<td>${objList.product}</td>
																														<td>${objList.caseType}</td>
																														<td>${objList.priority}</td>


																														<td>${objList.status}</td>
																														<td>${objList.dateOpened}</td>
																														<td>${objList.owner}</td>
																													</tr>
																												</c:forEach>
																											</c:if>
																										</tbody>
																									</table>

																								</td>
																							</tr>

																						</tbody>

																						<tr>
																					</table>

																				</div>
																				
	<!------------------                      Patner Tab End       -------------------->



																			</div>









																		</div>
																	</td>
																</tr>



															</tbody>
														</table>
												</td>


											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
						<div>
							<input type="hidden" name="tabid" id="tabid" value="" /> <input
								type="hidden" id="selectedCvID" value="${selectedCvID}" />

							<c:forEach items="${CustomerDetails}" var="objList"
								varStatus="loop">
								<input type="hidden"
									id="selectedCvIndex${objList.clientVendorID}"
									value="${loop.index}" />
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>


	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

</body>
</html>
<script>
let clientVendorID = 0;
let itemID=0;
let cID=0;
let oppID=0;
let eventID=0;
let taskID=0;
let caseID=0;
let jobId = 0;
let technicianId = 0;
let dispatchBoardId = 0;
let logaCallID=0;
let current;

function addNewCase()
{
	window.open("Case?tabid=newCase&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editCase()
{
	if(caseID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
       window.open("Case?tabid=editCase&cvId="+clientVendorID+"&caseID="+caseID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function initialize()
{
	 $( "#tabs" ).tabs();
	 $( "#activtiesTabs" ).tabs();
	 
	 $( "#activtHisTabs" ).tabs();
	
	console.log("initialize");
	document.getElementById("dispay_info1").checked = true;
	let selectedCvID = document.getElementById("selectedCvID").value;
	let selectedCvIndex = document.getElementById("selectedCvIndex"+selectedCvID).value;
    setCutomerDataById(selectedCvID, selectedCvIndex)

}

function lookUpHistory(){
	console.log("lookUpHistory");
    let radio_val = $('input[name="dispay_info"]:checked').val();
    var dfrom = document.CustomerForm.periodFrom.value;
    var dto = document.CustomerForm.periodTo.value;
    refreshTransationNow(radio_val, clientVendorID, dfrom, dto);
}
function writeSelectTH()
{
   if (oT.readyState != 4 || oT.status != 200) {
     return;
   }
   console.log("history items "+o.responseText);
   document.getElementById("t_history").innerHTML = o.responseText ;
}
function refreshTransationNow(radio_val, custid, dfrom, dto){
	 console.log("refreshTransationNow1");
       oT = c(writeSelectTH);
       console.log("oT "+oT);
       oGET(oT,'Customer?tabid=addTransactionHistory&custId=' + custid+'&cond='+radio_val+'&pfrom='+dfrom+'&pto='+dto)
}

/*
function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
        document.getElementById('0$$').className = "even";
    }
}
*/
function setRowId(rowid, rowIndex, flag)
{
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
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
}

function setRowIdContact(rowid, rowIndex, flag){
    let lSize = document.getElementById("cSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'c$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
    	cID = rowid;

        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"c$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'c$$').classList.add('draft');
    }
}

function setRowIdOpportunity(rowid, rowIndex, flag){
    let lSize = document.getElementById("pSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'p$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
         oppID = rowid;

        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"p$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'p$$').classList.add('draft');
    }
}
function setRowIdEvent(rowid, rowIndex, flag){
    let lSize = document.getElementById("eSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'e$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        eventID = rowid;

        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"e$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'e$$').classList.add('draft');
    }
}

function setRowIdTask(rowid, rowIndex, flag)
{

    let lSize = document.getElementById("taskSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'task$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
    	taskID= rowid;


        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"task$$").classList.remove('odd');
        }
         document.getElementById(rowIndex+'task$$').classList.add('draft');
    }
}

function setRowIdlogaCall(rowid, rowIndex, flag)
{
	

    let lSize = document.getElementById("logaCallSize").value;
    for (i=0; i<lSize; i++)
    {
        let currROW = document.getElementById(i+'logaCall$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag)
    {
    	logaCallID= rowid;


        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"logaCall$$").classList.remove('odd');
        }
         document.getElementById(rowIndex+'logaCall$$').classList.add('draft');
    }
}



function setRowIdCase(rowid, rowIndex, flag)
{

    let lSize = document.getElementById("caseSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'case$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
    	caseID = rowid;


        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"case$$").classList.remove('odd');
        }
         document.getElementById(rowIndex+'case$$').classList.add('draft');
    }
}




function addTask()
{
	window.open("Activity?tabid=newTask&cvId="+clientVendorID, null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");

}


function addLogaCall()
{
	window.open("Activity?tabid=newCallaLog&cvId="+clientVendorID, null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");

}

function editTask()
{
	if(taskID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
	window.open("Activity?tabid=editTask&taskID="+taskID, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");

}

function editLogaCall()
{
	if(logaCallID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
	window.open("Activity?tabid=editLogACall&logaCallID="+logaCallID, null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");

}







function deleteTask()
{

	if(taskID==0)
	{
		selectRecordDialog();
	 return false;
	}
	else
	{
		deleteTaskValidationDialog();

	  }

}
function deleteLogaCall()
{

	if(logaCallID==0)
	{
		selectRecordDialog();
	 return false;
	}
	else
	{
		deleteLogaCallValidationDialog();

	 }

	
}
	function addEvent()
	{
		window.open("Customer?tabid=customerOpportunityEvent&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");

	}

	function editEvent()
	{
		if(eventID==0)
		{
		if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
		 return false;
		}
		else
		window.open("Customer?tabid=customerOpportunityEvent&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");

	}

	function deleteEvent()
	{

		if(eventID==0)
		{
			selectRecordDialog();
		 return false;
		}
		else
			{
			deletetaskValidationDialog();


		  }

	}

	function deleteCase()
	{

		if(caseID==0)
		{
			selectRecordDialog();
		 return false;
		}
		else
			{
			deleteCaseValidationDialog();


		  }

	}

function addRowIndex(rowId,opportunityID, custID){
    let isFound = false;
    let isChecked = document.getElementById('opportunityId'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == opportunityID){
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
function getJobData(vendorID)
{

    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"JobAjax?tabid=getCustomerJobDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
            $('#jobTableBody').html('');
            //alert("data lenth="+data.length);
            if(data.length != 0){
                var jobTable = "<input type='hidden' name='jlistSize' id='jSize' value='"+data.length+"'>";
                for(var i=0; i<data.length; i++){
                    var objList = data[i];
                    jobTable = jobTable + "<tr id='"+i+"c$$' onclick='setRowIdContact("+objList.jobID+", "+i+",true)'>"
                        +"<td><input type=checkbox id=jobID"+i+" value='"+ objList.jobID+"' onchange='addRowJobIndex("+i+","+objList.jobID+")'/> "
                        +objList.jobID+"</td>"+"<td>"+objList.title+"</td><td>"+objList.description+"</td><td>"
                        +objList.status+"</td></tr>";
                }
                $('#jobTableBody').html(jobTable);
            }else{
                var jobTable = "<tr></td colspan='4'>No record found</td></tr>";
                $('#jobTableBody').html(jobTable);
            }
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}
function getTechnicianData(vendorID)
{

    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"TechnicianAjax?tabid=getCustomerTechnicianDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
       {
            $('#technicianTableBody').html('');
            //alert("data lenth="+data.length);
            if(data.length != 0){
                var technicianTable = "<input type='hidden' name='tlistSize' id='tSize' value='"+data.length+"'>";
                for(var i=0; i<data.length; i++){
                    var objList = data[i];
                    technicianTable = technicianTable + "<tr id='"+i+"technician$$' onclick='addRowTechnicianIndex("+objList.technicianID+", "+i+",true)'>"
                        +"<td><input type=checkbox id=technicianID"+i+" value='"+ objList.technicianID+"' onchange='addRowTechnicianIndex("+i+","+objList.technicianID+")'/> "
                        +objList.technicianID+"</td>"+"<td>"+objList.name+"</td><td>"+objList.phone+"</td><td>"
                        +objList.email+"<td>"+objList.specialization+"</td></td></tr>";
                }
                $('#technicianTableBody').html(technicianTable);
            }else{
                var technicianTable = "<tr></td colspan='4'>No record found</td></tr>";
                $('#technicianTableBody').html(technicianTable);
            }
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}
function getDispatchData(vendorID)
{

    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"DispatchBoardAjax?tabid=getCustomerDispatchDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
       {
            $('#dispatchTableBody').html('');
            //alert("data lenth="+data.length);
            if(data.length != 0){
                var dispatchTable = "<input type='hidden' name='dblistSize' id='dbSize' value='"+data.length+"'>";
                for(var i=0; i<data.length; i++){
                    var objList = data[i];
                    dispatchTable = dispatchTable + "<tr id='"+i+"DispatchBoard$$' onclick='addRowDispatchBoardIndex("+objList.dispatchBoardID+", "+i+",true)'>"
                        +"<td><input type=checkbox id=dispatchBoardID"+i+" value='"+ objList.dispatchBoardID+"' onchange='addRowDispatchBoardIndex("+i+","+objList.dispatchBoardID+")'/> "
                        +objList.jobID+"</td>"+"<td>"+objList.clientVendorName+"</td><td>"+objList.businessDivision+"</td><td>"
                        +objList.technicianName+"<td>"+objList.status+"</td></tr>";
                }
                $('#dispatchTableBody').html(dispatchTable);
            }else{
                var dispatchTable = "<tr></td colspan='4'>No record found</td></tr>";
                $('#dispatchTableBody').html(dispatchTable);
            }
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}

function addPatner()
{
	
	
	window.open("Customer?tabid=addNewPatner&cvId="+clientVendorID, null,"scrollbars=yes,height=800,width=1100,status=yes,toolbar=no,menubar=no,location=no");
	
}

function editPatner()
{
	
	window.open("Customer?tabid=editPatner&cvId="+clientVendorID, null,"scrollbars=yes,height=800,width=1100,status=yes,toolbar=no,menubar=no,location=no");
	
	
}

function deletePatner()
{
	
	
	
}

function addRowJobIndex(rowId, jobID){
    jobId = jobID;
    let isFound = false;
    let isChecked = document.getElementById('jobID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == jobID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(jobID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(jobID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}
function addRowDispatchBoardIndex(rowId, dispatchBoardID){
    dispatchBoardId = dispatchBoardID;
    let isFound = false;
    let isChecked = document.getElementById('dispatchBoardID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == dispatchBoardID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(dispatchBoardID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(dispatchBoardID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}

function addRowTechnicianIndex(rowId, technicianID){
    technicianId = technicianID;
    let isFound = false;
    let isChecked = document.getElementById('technicianID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == technicianID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(technicianID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(technicianID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}

function addNewJob()
{
	window.open("Job?tabid=newJob&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editJob()
{
	if(jobId==0){
        if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true){
            return false;
        }
	} else{
        window.open("Job?tabid=editJob&cvId="+clientVendorID+"&jobID="+jobId, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function deleteJob(){
    if(jobId==0){
        selectJobRecordDialog();
        return false;
    } else {
        deleteJobValidationDialog();
    }
}
function selectJobRecordDialog(){
    event.preventDefault();
    $("#selectJobRecordDialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
            my: "center",
            at: "center",
            of: "#jobTable"
        } ,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function deleteJobValidationDialog(){
	event.preventDefault();
	$("#deleteJob").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
            my: "center",
            at: "center",
            of: "#jobTable"
        },
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                $.ajax({
                    type : "POST",
                    url : "customerJob?tabid=deleteJob",
                    data :"jobID=" + jobId,
                    success : function(data){
                        selectRecordDeletedDialog();
                        getJobData(clientVendorID);
                    },
                    error : function(data) {
             			 //return showerrordialog();
                    }
                });
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}

function addNewTechnician()
{
	window.open("Technician?tabid=NewTechnician&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editTechnician()
{
	if(technicianId==0){
        if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true){
            return false;
        }
	} else{
        window.open("Technician?tabid=EditTechnician&cvId="+clientVendorID+"&technicianID="+technicianId, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function deleteTechnician(){
    if(technicianId==0)
    {
        selectRecordDialog();
        return false;
    } else {
        deleteTechnicianIdValidationDialog();
    }
}
function deleteTechnicianIdValidationDialog(){
	event.preventDefault();
	$("#deleteTechnician").dialog({
		resizable: false,
		height: 200,
		width: 400,
		modal: true,
		position:
		{
			my: "center",
			at: "center",
			of: "#caseTable"
		},

		buttons: {
			"<spring:message code='BzComposer.global.ok'/>": function () {
				$(this).dialog("close");
				$.ajax({
				type : "POST",
				url : "customerTechnician?tabid=deleteTechnician",
				data :"technicianID=" + technicianId,
				success : function(data)
				{
					selectRecordDeletedDialog();
					getTechnicianData(clientVendorID);
				},
				error : function(data)
				{
					//return showerrordialog();
				}
				});

			},
			"<spring:message code='BzComposer.global.cancel'/>": function () {
				$(this).dialog("close");
			}

		}
	});
return false;
}
function addNewDispatchBoard()
{
	window.open("DispatchBoard?tabid=NewDispatchBoard&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editDispatchBoard()
{
	if(dispatchBoardId==0){
        if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true){
            return false;
        }
	} else{
        window.open("DispatchBoard?tabid=EditDispatchBoard&cvId="+clientVendorID+"&dispatchBoardID="+dispatchBoardId, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
    }
}

function deleteDispatch(){
    if(dispatchBoardId==0)
    {
        selectRecordDialog();
        return false;
    } else {
        deleteDispatchIdValidationDialog();
    }
}
function deleteDispatchIdValidationDialog(){
    event.preventDefault();

    $("#deleteDispatch").dialog({

        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
            my: "center",
            at: "center",
            of: "#caseTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                $.ajax({
                type : "POST",
                url : "customerDispatchBoard?tabid=deleteDispatch",
                    data :"dispatchBoardID=" + dispatchBoardId,
                success : function(data)
                {
                    selectRecordDeletedDialog();
                    getDispatchData(clientVendorID);
                },
                error : function(data)
                {
                    //return showerrordialog();
                }
                });

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}

function getTaskData(vendorID)
{
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerTaskDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
            //alert("data lenth="+data.length);
        	$('#taskTableBody').html('');
            var taskTable = "<input type='hidden' name='tlistSize' id='taskSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                taskTable = taskTable + "<tr id='"+i+"t$$' onclick='setRowIdTask("+objList.taskID+", "+i+",true)'>"
                    +"<td><input type=checkbox id=taskID"+i+" value='"+ objList.taskID+"' onchange='addRowIndex("+i+","+objList.taskID+")'/> "
                    +objList.taskID+"</td>"+"<td>"+objList.subject+"</td><td>"+objList.dueDate+"</td><td>"+objList.contactName+"</td><td>"+objList.relatedTo+"</td><td>"+objList.assignedTo+"</td><td>"
                    +objList.status+"</td></tr>";
            }
            $('#taskTableBody').html(taskTable);
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}

function getLogaCallData(vendorID)
{
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerLogaCallDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
            //alert("data lenth="+data.length);
        	$('#logaCallTableBody').html('');
            var logaCallTable = "<input type='hidden' name='logaCalllistSize' id='logaCallSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++)
            {
                var objList = data[i];
                logaCallTable = logaCallTable + "<tr id='"+i+"logaCall$$' onclick='setRowIdlogaCall("+objList.logCallID+", "+i+",true)'>"
                    +"<td><input type=checkbox id=logaCall"+i+" value='"+ objList.logCallID+"' onchange='addRowIndex("+i+","+objList.logCallID+")'/> "
                    +objList.logCallID+"</td>"+"<td>"+objList.subject+"</td><td>"+objList.comment+"</td><td>"+objList.contactName+"</td><td>"+objList.relatedTo+"</td></tr>";
            }
            $('#logaCallTableBody').html(logaCallTable);
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}


function getContactData(vendorID)
{
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerContactsDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
            //alert("data lenth="+data.length);
        	$('#contactTableBody').html('');
            var contactTable = "<input type='hidden' name='clistSize' id='cSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                contactTable = contactTable + "<tr id='"+i+"c$$' onclick='setRowIdContact("+objList.contactID+", "+i+",true)'>"
                    +"<td><input type=checkbox id=contactID"+i+" value='"+ objList.contactID+"' onchange='addRowIndex("+i+","+objList.contactID+")'/> "
                    +objList.contactID+"</td>"+"<td>"+objList.firstName+" "+objList.middleName+" "+objList.lastName+"</td><td>"+objList.contactTitle+"</td><td>"
                    +objList.email+"</td><td>"+objList.phone+"</td></tr>";
            }
            $('#contactTableBody').html(contactTable);
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}

function goToManageOpportunity(opportunityID)
{


	window.location="Opportunity?tabid=ManageOpportunity&opportunityID="+oppID;
}

function getOpportunityData(vendorID)
{

	console.log("setCutomerContactsDataById");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerOpportunityDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
           //alert(" opportunity data lenth="+data.length);
        	$('#opportunityTableBody').html('');
            var opportunityTable = "<input type='hidden' name='plistSize' id='pSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                opportunityTable =  opportunityTable + "<tr id='"+i+"p$$'   onclick='setRowIdOpportunity("+objList.opportunityID+", "+i+",true)' ondblclick='goToManageOpportunity("+objList.opportunityID+")' >"
                    +"<td><input type=checkbox id=opportunityID"+i+" value='"+ objList.opportunityID+"' onchange='addRowIndex("+i+","+objList.opportunityID+")'/> "
                    +objList.opportunityID+"</td>"+"<td>"+objList.opportunityName+"</td><td>"+objList.stage+"</td><td>"+objList.amount+"</td><td>"+objList.opportunityOwner+"</td><td>"
                    +objList.sourceID+"</td><td>"+objList.campaignName+"</td><td>"+objList.startDate+"</td><td>"+objList.closedDate+"</td></tr>";
            }
            $('#opportunityTableBody').html(opportunityTable);

       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}


function getCaseData(vendorID)
{

	console.log("setCutomerCasesDataById");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerCaseDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
           //alert(" opportunity data lenth="+data.length);
        	$('#caseTableBody').html('');
            var caseTable = "<input type='hidden' name='plistSize' id='caseSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                caseTable =  caseTable + "<tr id='"+i+"case$$'   onclick='setRowIdCase("+objList.caseID+", "+i+",true)' >"
                    +"<td><input type=checkbox id=caseID"+i+" value='"+ objList.caseID+"' onchange='addRowIndex("+i+","+objList.caseID+")'/> "
                    +objList.caseID+"</td>"+"<td>"+objList.contactName+"</td><td>"+objList.subject+"</td><td>"+objList.product+"</td><td>"+objList.caseType+"</td><td>"+objList.priority+"</td><td>"+objList.dateOpened+"</td><td>"
                    +objList.status+"</td><td>"+objList.owner+"</td></tr>";
            }
            $('#caseTableBody').html(caseTable);

       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}



function loadEventList()
{


	var eventtype=document.CustomerForm.eventType.value;
	//alert( "clientVendorID"+clientVendorID+"EventType="+eventtype);
	if(eventtype==0)
		getOpportunityEventData(clientVendorID);

	if(eventtype==1)
		getCaseEventData(clientVendorID);



}

function getOpportunityEventData(vendorID)
{

	var eventthead=	"<tr valign='center'><th style='padding-right: 30px !important;'><spring:message code='BzComposer.customer.opportunity.eventId' /></th>"

		+"<th><spring:message code='BzComposer.customer.event.opportunity'/></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventName' /></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventMemo' /></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventStartDate' /></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventEndDate' /></th>"+"</tr>";

	//alert("OpportunityEvent event loaded ..");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerOpportunityEventsDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	$('#eventthead').html('');
        	$('#eventthead').html(eventthead);
        	$('#eventTableBody').html('');

            var eventTable = "<input type='hidden' name='elistSize' id='eSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                eventTable =  eventTable + "<tr id='"+i+"e$$'   onclick='setRowIdEvent("+objList.eventId+", "+i+",true)' >"
                    +"<td><input type=checkbox id=eventId"+i+" value='"+ objList.eventId+"' onchange='addRowIndex("+i+","+objList.eventId+")'/> "
                    +objList.eventId+"</td>"+"<td>"+objList.opportunityID+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.formatedEventStartDate+"</td><td>"
                    +objList.formatedEventEndDate+"</td></tr>";
            }



            $('#eventTableBody').html(eventTable);

            var element = document.getElementById("eventTable");
  		  element.classList.add("tabla-listados sortable");


       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}



function getCaseEventData(vendorID)
{

var eventthead=	"<tr valign='center'><th style='padding-right: 30px !important;'><spring:message code='BzComposer.customer.opportunity.eventId' /></th>"
+"<th><spring:message code='BzComposer.customer.case.caseID'/></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventName' /></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventMemo' /></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventStartDate' /></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventEndDate' /></th>"

+"</tr>";



	//alert("case Event event loaded ..");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerCaseEventsDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        $('#eventthead').html('');
        	$('#eventthead').html(eventthead);
        	$('#eventTableBody').html('');
            var eventTable = "<input type='hidden' name='elistSize' id='eSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                eventTable =  eventTable + "<tr id='"+i+"e$$'   onclick='setRowIdEvent("+objList.eventId+", "+i+",true)' >"
                    +"<td><input type=checkbox id=eventId"+i+" value='"+ objList.eventId+"' onchange='addRowIndex("+i+","+objList.eventId+")'/> "
                    +objList.eventId+"</td>"+"<td>"+objList.caseID+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.formatedEventStartDate+"</td><td>"
                    +objList.formatedEventEndDate+"</td></tr>";
            }

            $('#eventTableBody').html(eventTable);
            var element = document.getElementById("eventTable");
            element.classList.add("tabla-listados sortable");

       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}


function setCutomerDataById(vendorID, rowId){
	console.log("setCutomerDataById");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data) {
            $('#customerID').html(data.clientVendorID);
            $('#customerName').html(data.firstName +' '+ data.middleName +' '+ data.lastName);
            $('#cname').html(data.cname);


            $('#customerCompanyName').html(data.cname);
            $('#dbaName').html(data.dbaName);
            $('#customerType').val(data.cvCategoryTypeID);
            $('#billingAddress').html(data.billTo);
            $('#shippingAddress').html(data.shipTo);
            $('#country').val(data.countryID);
            $('#activeCustomer').html(data.active);

            $('#phone').html(data.phone);
            $('#cellPhone').html(data.cellPhone);
            $('#fax').html(data.fax);
            $('#email').html(data.email);
            $('#dateAdded').html(data.dateAdded);
            $('#lastOrderDate').html(data.lastOrderDate);

            $('#last3MonthAmt').html(data.last3MonthAmt);
            $('#last1YearAmt').html(data.last1YearAmt);
            $('#totalOverdueAmt').html(data.totalOverdueAmt);
            $('#openingUB').html(data.openingUB);
            $('#extCredit').html(data.extCredit);

            let size = document.getElementById("lSize").value;
            for(i=0; i<size; i++){
                if(document.getElementById(i+"$$"))
                    document.getElementById(i+"$$").classList.remove('draft');
            }
            document.getElementById(rowId+'$$').classList.add('draft');
            lookUpHistory();
           getContactData(vendorID);
          getOpportunityData(vendorID);
          getOpportunityEventData(vendorID);
          getCaseData(vendorID);
		  getJobData(vendorID);
		  getTaskData(vendorID);
		  getLogaCallData(vendorID);
		  
        },
        error : function(error) {
             alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
}

function manageCustomer(cmd)
{
	console.log("manageCustomer");
	if (clientVendorID == 0)
	{
		return showCustomerValidationDialog();
	} else
	{
		if (cmd=="EDIT")
		{
			window.open("Customer?tabid=editCustomer&cvId="+clientVendorID, null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
	      }
		else if (cmd=="DELETE")
		{


			deleteCustomerValidationDialog();

		}
			return false;
	}

}


function addOpportunity()
{

	window.open("Customer?tabid=addOpportunity&cvID="+clientVendorID, null,"scrollbars=yes,height=520,width=900,status=yes,toolbar=no,menubar=no,location=no");

}


function deleteOpportunity()
{

	if(oppID==0)
	{
		selectRecordDialog();
	 return false;
	}
	else
		{
		deleteOpportunityValidationDialog();

		}
	
}

function deleteContact()
{

	if(cID==0)
	{
		selectRecordDialog();

	 return false;
	}
	else
		{

		deleteContactValidationDialog();
		}
}

function updateOpportunity()
{
	if(oppID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
	window.open("Customer?tabid=editCustomerOpportunity&cvID="+clientVendorID+"&opportunityID="+oppID, null,"scrollbars=yes,height=420,width=900,status=yes,toolbar=no,menubar=no,location=no");


}

function addNewContact()
{

   console.log("addNewConact");
	window.open("Customer?tabid=addNewCustomerContact&cvID="+clientVendorID, null,"scrollbars=yes,height=420,width=900,status=yes,toolbar=no,menubar=no,location=no");

}

function editContact()
{

	console.log("editConact");

	if(cID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
	window.open("Customer?tabid=editCustomerContact&cvID="+clientVendorID+"&contactID="+cID, null,"scrollbars=yes,height=420,width=900,status=yes,toolbar=no,menubar=no,location=no");
}
function deleteCustomerValidationDialog(){
	console.log("showCustomerValidationDialog");
	event.preventDefault();


	$("#deleteCustomer").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#customerName"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

				                $.ajax({
				                    type : "GET",
				                    url : "Customer?tabid=Customer&customerAction=DELETE&cvID="+clientVendorID,
				                    success : function(data) {
				                        location.reload();
				                    },
				                    error : function(error) {
				                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
				                    }
				                });
            }
            ,
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function deleteContactValidationDialog(){

	event.preventDefault();


	$("#deleteContact").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#contactTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                       var conactDetails=
					         	   {
					         			 "contactID":cID,

					              };

					          var obj=JSON.stringify(conactDetails);

					          $.ajax({
					          		type : "POST",
					          		url : "customerContacts?tabid=delete",
					          	    data :"data=" + obj,
					          	    success : function(data)
					          	    {
					          	    selectRecordDeletedDialog();
					          	    getContactData(clientVendorID);
					          	    getOpportunityData(clientVendorID);
					          	    getOpportunityEventData(clientVendorID);

					          	    }
					          		,
					          		 error : function(data)
					          		 {

					          			 //return showerrordialog();
					          		  }
					          	});
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function deleteOpportunityValidationDialog(){

	event.preventDefault();

	$("#deleteOpportunity").dialog({

    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#opportunityTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                $.ajax({
             		type : "POST",
             		url : "customerOpportunity?tabid=deleteOpportunity",
             	    data :"opportunityId=" + oppID,
             	    success : function(data)
             	    {
             	    selectRecordDeletedDialog();
             	    getOpportunityData(clientVendorID);
             	     getContactData(clientVendorID);
             	    getOpportunityEventData(clientVendorID);

             	    }
             		,
             		 error : function(data)
             		 {

             			 //return showerrordialog();
             		  }
             	});

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}

function deleteCaseValidationDialog(){

	event.preventDefault();

	$("#deleteCase").dialog({

    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
        	my: "center",
        	  at: "center",
        	  of: "#caseTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                $.ajax({
             		type : "POST",
             		url : "Case?tabid=deleteCase",
             	    data :"caseID=" + caseID,
             	    success : function(data)
             	    {

             	    selectRecordDeletedDialog();
             	    getOpportunityData(clientVendorID);
             	     getContactData(clientVendorID);

             	    getOpportunityEventData(clientVendorID);
             	    getCaseData(clientVendorID);

             	    }
             		,
             		 error : function(data)
             		 {

             			 //return showerrordialog();
             		  }
             	});

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}


function deleteEventValidationDialog(){

	event.preventDefault();

	$("#deleteEvent").dialog({

    	resizable: false,

        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#eventTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function ()
            {
                $(this).dialog("close");
                $.ajax({
     	           type : "POST",
     	           url : "opportunityEvent?tabid=delete",
     	           data:"deletedEventId="+eventID,
     	           success : function(data)
     	           {

     	        	   getOpportunityEventData(clientVendorID);
     	        	  selectRecordDeletedDialog();
     	       	     getContactData(clientVendorID);
     	       	    getOpportunityData(clientVendorID);


     	           },
     	            error : function(data) {
     	              alert("<spring:message code='BzComposer.billingboard.someerroroccurred'/>");
     	           }
     	       });
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}



function openMailSender()
{
   
        window.open("Activity?tabid=openSendMail&cvID="+clientVendorID, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    
}

function deleteLogaCallValidationDialog()

{

	event.preventDefault();

	

	
	$("#deleteLogaCall").dialog({

    	resizable: false,

        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#CaseTab"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function ()
            {
            	 $(this).dialog("close");
                $.ajax({
     	           type : "POST",
     	           url : "manageActivity?tabid=deleteLogaCall&logaCallID="+logaCallID,
     	           data:"logaCallID="+logaCallID,
     	           success : function(data)
     	           {
     	        	
     	        	  selectRecordDeletedDialog();
     	       	     
     	       	    
     	       	      
     	       	      
     	       	  lookUpHistory();
     	           getContactData(clientVendorID);
     	          getOpportunityData(clientVendorID);
     	          getOpportunityEventData(clientVendorID);
     	          getCaseData(clientVendorID);
     			  getJobData(clientVendorID);
     			  getTaskData(clientVendorID);
     			 getLogaCallData(clientVendorID);
     			  
     	           },
     	            error : function(data) {
     	              alert("<spring:message code='BzComposer.billingboard.someerroroccurred'/>");
     	           }
     	       });
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}






function deleteTaskValidationDialog()

{

	event.preventDefault();

	
	
	
	$("#deleteTask").dialog({

    	resizable: false,

        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#CaseTab"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function ()
            {
            	 $(this).dialog("close");
                $.ajax({
     	           type : "POST",
     	           url : "manageActivity?tabid=deleteTask&taskID="+taskID,
     	           data:"taskID="+taskID,
     	           success : function(data)
     	           {
     	        	
     	        	  selectRecordDeletedDialog();
     	       	     
     	       	    
     	       	      
     	       	      
     	       	  lookUpHistory();
     	           getContactData(clientVendorID);
     	          getOpportunityData(clientVendorID);
     	          getOpportunityEventData(clientVendorID);
     	          getCaseData(clientVendorID);
     			  getJobData(clientVendorID);
     			  getTaskData(clientVendorID);
     			  
     	           },
     	            error : function(data) {
     	              alert("<spring:message code='BzComposer.billingboard.someerroroccurred'/>");
     	           }
     	       });
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}



function selectRecordDialog(){

	event.preventDefault();

	$("#selectRecordDialog").dialog({

    	resizable: false,

        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#opportunityTable"
        } ,

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function selectRecordDeletedDialog(){
	event.preventDefault();
	$("#selectRecordDeletedDialog").dialog({

    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#CaseTab"
        } ,

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>


<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectcustomerfirst" />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedcustomer" />
	</p>
</div>
<div id="deleteContact" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedcontact" />
	</p>
</div>
<div id="deleteOpportunity" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.customerinfo.deleteselectedOpportunity" />
	</p>
</div>
<div id="deleteCase" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedCase" />
	</p>
</div>
<div id="deleteEvent" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedEvent" />
	</p>
</div>

<div id="deleteTask" style="display: none;">
	<p>
		<spring:message code="BzComposer.CustomerBoard.deleteselectedTask" />
	</p>
</div>

<div id="deleteLogaCall" style="display: none;">
	<p>
		<spring:message code="BzComposer.CustomerBoard.deleteLogaCall" />
	</p>
</div>
<div id="selectRecordDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectrecordfirst" />
	</p>
</div>

<div id="selectRecordDeletedDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectedRecordDeleted" />
	</p>
</div>
<div id="selectJobRecordDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectrecordfirst" />
	</p>
</div>
<div id="deleteJob" style="display: none;">
	<p>
		<spring:message code="BzComposer.jobinfo.deleteselectedJob" />
	</p>
</div>
<div id="deleteTechnician" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.technicianinfo.deleteselectedTechnician" />
	</p>
</div>
<div id="deleteDispatch" style="display: none;">
	<p>
		<spring:message code="BzComposer.deleteRecord" />
	</p>
</div>