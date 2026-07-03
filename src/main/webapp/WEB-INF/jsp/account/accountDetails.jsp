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
<style>
/* .redColor{color: red;} */
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



$(document).ready(function()
{

	var zipvalue=document.CompanyDetailsForm.zip.value;

	loadAddressDetailsByZipcode(zipvalue, 1);
	
	console.log("inside default function");
$('#custTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]
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
<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="CompanyDetailsForm" method="post"
		modelAttribute="companyInfoDto">
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<!-- begin Contents -->
							<div>


								<div style="width: 100%;">
									<table style="width: 90%;">
										<tr>
											<td>

												<div style="float: left;">
													<span
														style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
														<spring:message
															code="BzComposer.customer.opportunity.accountDetails" />
													</span> <br>

												</div>

												<div id="success" align="center"
													style="float: center; color: green;"></div>
											</td>
											<td align="right" style="float: center; right: 25px;"><input
												type="button" class="formbutton"
												onclick="editCompnay(this.form)" style="padding: 7 15px;"
												value="<spring:message code='BzComposer.global.edit'/>" />


												<input type="button" class="formbutton"
												onclick="saveCompnay(this.form)" style="padding: 7 15px;"
												value="<spring:message code='BzComposer.global.save'/>" />

											</td>


										</tr>
									</table>
								</div>

								<div>
									<table style="width: 100%; apdding: 0;">
										<tr>
											<td style="vertical-align: 0;">
												<!-- ================== Company Information =============== -->
												<div id="table-negotiations" style="height: auto;">
													<table cellspacing="0" class="tabla-listados"
														style="margin-top: 0; margin-left: 20px;">
														<thead>
															<tr>
																<th colspan="3" style="font-size: 12px;"><spring:message
																		code="BzComposer.customerinfo.accountInformation" /></th>
															</tr>
														</thead>
														<tbody>

															<tr>
																<td colspan="3" align="center"><div id="errors"
																		style="color: red;"></div></td>

															</tr>

															<tr>
																<td style="width: 40%;">
																	<table cellspacing="0" class="tabla-listados">
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Customer.CompanyName" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /> </span>
																			</td>
																			<td><form:input readonly="true"
																					path="companyName" size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.FirstName" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input readonly="true" path="firstName"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.LastName" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input readonly="true" path="lastName"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.Address1" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input readonly="true" path="address1"
																					size="40" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.Address2" />:</strong></td>
																			<td><form:input readonly="true" path="address2"
																					size="40" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.ZipCode" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input path="zip" readonly="true"
																					onfocusout="loadAddressDetailsByZipcode(this.value, 1)"
																					onkeypress="return numbersonly(event,this.value)"
																					value="${zipcode }" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.City" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:select path="city" disabled="true"
																					id="cityID" style="width:200px;">
																					<form:option value="0">
																						<spring:message
																							code="BzComposer.register.selectcity" />
																					</form:option>
																					<c:forEach items="${cityList}" var="currObject">
																						<form:option value="${currObject.cityId}">${currObject.cityName}</form:option>
																					</c:forEach>
																				</form:select></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.State" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:select disabled="true" path="state"
																					id="stateID"
																					onchange="loadCitiesByStateID(this.value, 1);"
																					style="width:180px;">
																					<form:option value="0">
																						<spring:message
																							code="BzComposer.register.selectstate" />
																					</form:option>
																					<c:forEach items="${stateList}" var="currObject">
																						<form:option value="${currObject.stateId}">${currObject.state}</form:option>
																					</c:forEach>
																				</form:select></td>
																		</tr>

																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.Country" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:select disabled="true" path="country"
																					id="countryID"
																					onchange="loadStatesByCountryID(this.value, 1);"
																					style="width:180px">
																					<form:option value="0">
																						<spring:message
																							code="BzComposer.register.selectcounry" />
																					</form:option>
																					<c:forEach items="${countryList}" var="currObject">
																						<form:option data-code="${currObject.phoneCode}"
																							value="${currObject.countryId}">${currObject.countryName}</form:option>
																					</c:forEach>
																				</form:select></td>
																		</tr>





																	</table>
																</td>
																<td style="width: 30%;">
																	<table cellspacing="0" class="tabla-listados">
																		<tr>
																			<td style="width: 50%;"><strong><spring:message
																						code="BzComposer.global.phone" />:</strong></td>
																			<td><form:input readonly="true" path="phone"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.global.mobile" />:</strong></td>
																			<td><form:input readonly="true" path="cellPhone"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.global.fax" />:</strong></td>
																			<td><form:input readonly="true" path="fax"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.global.email" />:</strong> <span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input readonly="true" path="email"
																					size="40" required="true" /></td>
																		</tr>


																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Vendor.HomePage" />:</strong></td>
																			<td><form:input readonly="true" path="homePage"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.membership.membershipPlan" />:</strong></td>
																			<td><form:select path="membershipLevel"
																					required="true">
																					<!-- <form:option value="select membership"><spring:message code="BzComposer.register.selectmembership"/></form:option> -->
																					<form:option value="standard">
																						<spring:message
																							code="BzComposer.register.standardmembership" />
																					</form:option>
																					<form:option value="professional">
																						<spring:message
																							code="BzComposer.register.professionalmembership" />
																					</form:option>
																					<form:option value="eSales">
																						<spring:message
																							code="BzComposer.register.esalesmembership" />
																					</form:option>
																				</form:select></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.account.membershipStartDate" />:</strong></td>
																			<td><form:input readonly="true" path="fromDate"
																					size="20" /></td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.account.membershipEndDate" />:</strong></td>
																			<td><form:input readonly="true" path="toDate"
																					size="20" /></td>
																		</tr>

																	</table>
																</td>
																<td style="width: 30%;">
																	<table cellspacing="0" class="tabla-listados">

																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.register.jobposition" />:</strong></td>
																			<td><form:input readonly="true"
																					path="jobPosition" size="20" /></td>
																		</tr>


																		<tr>
																			<td><strong><spring:message
																						code="BzComposer.Companyinformation.Type" /> </strong><span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td class="select_option"><form:select
																					path="businessTypeId" required="true">
																					<form:option value="0">
																						<spring:message
																							code="BzComposer.Companyinformation.Type" />
																					</form:option>
																					<c:forEach items="${businessType}" var="curObject">
																						<form:option
																							data-code="${curObject.businessTypeID}"
																							value="${curObject.businessTypeID}">
																							<b>${curObject.businessName}</b>
																						</form:option>
																					</c:forEach>
																				</form:select></td>
																			<td>&nbsp;</td>
																		</tr>
																		<tr>
																			<td><strong><spring:message
																						code="MultiUserForm.userName" />:</strong><span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input readonly="true" path="userName"
																					size="20" /></td>
																		</tr>

																		<tr>
																			<td><strong><spring:message
																						code="MultiUserForm.password" />:</strong><span
																				class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span></td>
																			<td><form:input readonly="true" path="password"
																					size="20" /></td>
																		</tr>


																		<tr>

																			<td><strong> <spring:message
																						code="BzComposer.register.confirmpassword" /> :
																			</strong> <span class="inputHighlighted"><spring:message
																						code="BzComposer.CompulsoryField.Validation" /></span>&nbsp;
																			</td>
																			<td style="font-size: 12px;"><form:input
																					type="password" path="confirmPassword" size="20"
																					maxlength="45" required="true" /></td>
																			<td>
																		</tr>

																	</table>
																</td>
															</tr>
														</tbody>
													</table>
												</div>

											</td>
										</tr>


										<tr>
											<td>
												<!--------------------------------- contact details -------------------------------------------------------->
												<div style="width: 100%;">
													<table style="width: 100%;">
														<tr>
															<td style="width: 50%;">

																<div style="float: left;">
																	<span
																		style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
																		<spring:message
																			code="BzComposer.customer.opportunity.contactDetails" />
																	</span> <br>

																</div>
															</td>
															<td style="width: 50%;">
																<div align="left">
																	<table>
																		<tr align="left">
																			<td colspan="6">
																				<div>
																					<input type="button" class="formbutton"
																						onclick="addNewCustomer();"
																						style="padding: 7 15px;"
																						value="<spring:message code='BzComposer.global.new'/>" />
																					<input type="button" class="formbutton"
																						onclick="manageCustomer('EDIT');"
																						style="padding: 7 15px;"
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

															</td>
														</tr>
													</table>
												</div> <input type="hidden" id="lSize"
												value='${customerList.size()}' />
												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">
													<thead>
														<tr valign="center">
															<th style="padding-right: 30px !important;"><spring:message
																	code="BzComposer.Customer.ID" /></th>
															<th><spring:message
																	code="BzComposer.customerinfo.customer" /></th>
															<th><spring:message code="BzComposer.global.company" /></th>
															<th><spring:message
																	code="BzComposer.Companyinformation.Type" /></th>
															<th><spring:message code="BzComposer.global.email" /></th>
															<th><spring:message code="BzComposer.global.phone" /></th>
															<th><spring:message code="BzComposer.global.mobile" /></th>
															<th><spring:message code="BzComposer.global.fax" /></th>
															<th><spring:message
																	code="BzComposer.global.address1" /></th>
															<th><spring:message
																	code="BzComposer.global.address2" /></th>
															<th><spring:message code="BzComposer.global.city" /></th>
															<th><spring:message code="BzComposer.global.zipcode" /></th>
															<th><spring:message code="BzComposer.global.country" /></th>
															<th><spring:message
																	code="BzComposer.common.overdueAmount" /></th>
															<th><spring:message
																	code="BzComposer.orderimport.lastorderdate" /></th>
															<th><spring:message
																	code="BzComposer.global.dateadded" /></th>
														</tr>
													</thead>
													<tbody id="opportunityTableBody">
														<c:if test="${not empty customerList}">
															<c:forEach items="${customerList}" var="objList"
																varStatus="loop">
																<tr id='${loop.index}$$'
																	onclick="setRowId(${objList.clientVendorID}, ${loop.index}, true);">
																	<td class="${objList.paymentUnpaid?'redColor':''}"><input
																		type="checkbox" id="custID${loop.index}"
																		value="${objList.clientVendorID}"
																		onchange="addRowIndex(${loop.index}, ${objList.clientVendorID})" />

																		${objList.clientVendorID}</td>
																	<td>${objList.firstName}${objList.middleName}
																		${objList.lastName}</td>
																	<td>${objList.companyName}</td>
																	<td>${objList.type}</td>
																	<td>${objList.email}</td>
																	<td>${objList.phone}</td>
																	<td>${objList.cellPhone}</td>
																	<td>${objList.fax}</td>
																	<td>${objList.address1}</td>
																	<td>${objList.address2}</td>
																	<td>${objList.city}</td>
																	<td>${objList.zipCode}</td>
																	<td>${objList.country}</td>
																	<td>${objList.totalOverdueAmt}</td>
																	<td>${objList.lastOrderDate}</td>
																	<td>${objList.dateAdded}</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>








											</td>
										</tr>

										<!--      Contact Details end -->

										<!--   Opportunity start    -->


										<tr>

											<td>


												<div style="width: 100%;">
													<table style="width: 100%;">
														<tr>
															<td style="width: 50%;">

																<div style="float: left;">
																	<span
																		style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
																		<spring:message
																			code="BzComposer.customer.opportunity.opportunityDetails" />
																	</span> <br>

																</div>
															</td>
															<td style="width: 50%;">
																<div align="left">
																	<table>
																		<tr align="left">
																			<td colspan="6">
																				<div>
																					<input type="button" class="formbutton"
																						onclick="manageOpportunity()"
																						style="padding: 7 15px;"
																						value="<spring:message code='BzComposer.account.manageOpportunity'/>" />

																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
															</td>

														</tr>
													</table>
												</div> <input type="hidden" id="lSize"
												value='${opportunityList.size()}' />
												<table id="opportunityTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">
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
																	code="BzComposer.Customer.opportunities.startdate" /></th>
															<th><spring:message
																	code="BzComposer.Customer.opportunities.closedate" /></th>
															<th><spring:message
																	code="BzComposer.customer.opportunity.active" /></th>
														</tr>
													</thead>
													<tbody id="custTableBody">
														<c:if test="${not empty opportunityList}">
															<c:forEach items="${opportunityList}" var="objList"
																varStatus="loop">
																<tr id='${loop.index}$$'
																	onclick="goToManageOpportunity(${objList.opportunityID});"
																	ondblclick="goToManageOpportunity(${objList.opportunityID});">

																	<td><input type="hidden"
																		id="opportunityId${loop.index}"
																		value="${objList.opportunityID}"
																		onchange="addRowIndex(${loop.index}, ${objList.opportunityID})" />
																		${objList.opportunityID}</td>
																	<td>${objList.opportunityName}</td>
																	<td>${objList.stage}</td>
																	<td>${objList.amount}</td>
																	<td>${objList.opportunityOwner}</td>
																	<td>${objList.sourceID}</td>
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


										<tr>
											<td>

												<div style="width: 100%;">
													<table style="width: 100%;">
														<tr>
															<td style="width: 50%;">

																<div style="float: left;">
																	<span
																		style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
																		<spring:message
																			code="BzComposer.customer.opportunity.EventDetails" />
																	</span> <br>

																</div>
															</td>
															<td style="width: 50%;">
																<div align="left">
																	<table>
																		<tr align="left">
																			<td colspan="6">
																				<div>
																					<input type="button" class="formbutton"
																						onclick="manageEvents();" style="padding: 7 15px;"
																						value="<spring:message code='BzComposer.account.manageEvents'/>" />

																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
															</td>

														</tr>
													</table>
												</div>


												<table id="eventTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="right">
													<thead>
														<tr valign="center" style="width: 80%;">

															<th style="padding-right: 30px !important;"><spring:message
																	code="BzComposer.Customer.opportunities.id" /></th>

															<th style="padding-right: 30px !important;"><spring:message
																	code="BzComposer.customer.opportunityid" /></th>
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
															<c:forEach items="${eventList}" var="objList"
																varStatus="loop">
																<tr id='${loop.index}$$'>

																	<td><input type="hidden" id="eventId${loop.index}"
																		value="${objList.eventId}"
																		onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
																		${objList.eventId}</td>
																	<td>${objList.opportunity.opportunityId}</td>
																	<td>${objList.eventName}</td>
																	<td>${objList.eventMemo}</td>
																	<td>${objList.eventStartDate}</td>
																	<td>${objList.eventEndDate}</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>

											</td>
										</tr>
										<!--   Opportunity end   -->

									</table>

								</div>
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
		</div>

	</form:form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js">
	</script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js">
	</script>

	<script>
let clientVendorID = 0;

let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];





function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
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

function addRowIndex(rowId, custID){
    let isFound = false;
    let isChecked = document.getElementById('custID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == custID)
        {
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


function manageOpportunity()
{
	 
	 window.location="Customer?tabid=opportunityBoard";

}
function goToManageOpportunity(opportunityID)
{

	window.location="Opportunity?tabid=ManageOpportunity&opportunityID="+opportunityID;
}

function manageEvents()
{
	 
	window.open("Opportunity?tabid=dailyEventCalendar",null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no" );

}


function manageCustomer(cmd)
{
    
	if (itemID == 0)
	{
		return showCustomerValidationDialog();
	}
	else
	{
						if (cmd=="EDIT")
						{
							//window.location = "Customer?tabid=editCustomer&cvId="+itemID+"&itemIndex="+itemIndex;
							window.open("Customer?tabid=editContact&cvId="+itemID, null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
						}
						else if (cmd=="DELETE") 
						{
										if(confirm("<spring:message code='BzComposer.customerinfo.deleteselectedcustomer'/>")==true)
										{
											//window.location = "Customer?tabid=Customer&customerAction=DELETE&cvID="+clientVendorID;
											$.ajax({
							                    type : "GET",
							                    url : "Customer?tabid=Customer&customerAction=DELETE&cvID="+itemID,
							                    success : function(data) {
							                        location.reload();
							                    },
							                    error : function(error) {
							                       // alert("<bean:message key='BzComposer.common.erroroccurred'/>");
							                    }
							                });
										} 
							return false;
						}
		
			return false;
		}
	
}

function editCompnay(form)
{
	alert("Do you want to edit  Company Details ? ");
	
	 document.getElementById('companyName').readOnly = false;
		
		document.getElementById('membershipLevel').disabled = false;
		
		document.getElementById('cityID').disabled = false;
		document.getElementById('stateID').disabled = false;
		document.getElementById('countryID').disabled = false;
		document.getElementById('jobPosition').readOnly = false;
		document.getElementById('email').readOnly = false;
		
		document.getElementById('firstName').readOnly = false;
		document.getElementById('lastName').readOnly = false;
		document.getElementById('address1').readOnly = false;
		document.getElementById('address2').readOnly = false;
		document.getElementById('zip').readOnly = false;
		
		document.getElementById('businessTypeId').disabled = false;
		
	 	document.getElementById('cellPhone').readOnly = false;
		document.getElementById('homePage').readOnly = false;
		document.getElementById('phone').readOnly = false;

		document.getElementById('userName').readOnly = false;
		document.getElementById('password').readOnly = false;
}


function saveCompnay(form)
{
	   alert("Do you want to save Company Details ? ");
	
		var email = document.getElementById("email").value;
		var fName = document.getElementById("firstName").value;
		var lName = document.getElementById("lastName").value;
		var companyName = document.getElementById("companyName").value;
	
		var address1 = document.getElementById("address1").value;
		
		var zip = document.getElementById("zip").value;
		var stateID = document.getElementById("stateID").value;
		var cityID = document.getElementById("cityID").value;
		var countryId = document.getElementById("countryID").value;
		var phone = document.getElementById("phone").value;

		var cellphone = document.getElementById("cellPhone").value;
		var userName= document.getElementById("userName").value;
	
		var membershipLevel = document.getElementById("membershipLevel").value;
		var password = document.getElementById("password").value;
		var confirmedPassword = document.getElementById("confirmPassword").value;
	
		var jobPosition = document.getElementById("jobPosition").value;

		var errorMessage="";

	if(email == "" || fName == "" || lName == "" || companyName == "" || address1 == "" || cityID == "" || password==""||confirmPassword=="" ||
			zip=="" || phone=="" ||stateID=="" || countryID=="" || userName=="")
		{	
			
			document.getElementById("errors").innerHTML = "Please Enter All filed and try again!! ";
			return false ;
		}

		if(password !=confirmedPassword)
			{
			document.getElementById("errors").innerHTML = "Password dnt match !! ";
			return false;
			}
	  
	document.forms["CompanyDetailsForm"].action = "/CompanyAccount?tabid=updateCompanyAccount";
	document.forms["CompanyDetailsForm"]
			.submit();
	
	document.getElementById("success").innerHTML = "Company Details Updated SuccessFully  !! ";
	
}


function addNewCustomer()
{
	//window.location = "Customer?tabid=NewCustomer";
	window.open("Customer?tabid=NewContact", null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
}
function showCustomerValidationDialog()
{
	console.log("showCustomerValidationDialog");
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
</script>
</body>
</html>
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


<div id="editCompanyDialog" title="Warning .." style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.editCompany" />
	</p>
</div>

<div id="saveCompanyDialog" title="Warning .." style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.saveCompany" />
	</p>
</div>