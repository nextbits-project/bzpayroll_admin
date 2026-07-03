<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>

<title><spring:message code="BzComposer.sales.campaign" /></title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>


<spring:url value="/cssresources/Myapp.css" var="mycss" />
<script>var ctx = "${pageContext.request.contextPath}";

</script>
<style type="text/css">
table.tabla-listados thead tr th {
	font-size: 12px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
	padding: 3px 5px;
}

#tabs ul li {
	font-size: 12px !important;
	color: #fff;
}

#tabs2 ul li {
	font-size: 12px !important;
}

input, textarea, select {
	font-size: 12px !important;
}

div#pie { /* 	color:#05A9C5;; */
	padding: 5px 0px 5px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}

table.tabla-listados th thead tr {
	font-size: 12px;
	text-align: left;
	padding: 5px 10px;
	/* 	background: rgba(5, 169, 197, 0.11); */
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	/* 	color: #333; */
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}

table.tabla-listados tbody tr td th {
	font-size: 12px;
	/* 	color: #666; */
	padding: 5px 0px 5px 5px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: #fff;
	vertical-align: top;
}

#popupWindow {
	/* width: 1500px;
    height: 900px;*/
	
}

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}

.horizontal_line {
	background-color: green;
	width: 90%;
	height: 5px;
	border-top: 5px dotted black;
	line-height: 80%;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff;
	padding: 5px;
}
/* .table tr:hover { cursor: pointer;} */
.bz_dialogTable tr td {
	padding: 5px;
}

.bz_dialogTable tr td label {
	font-size: 6px;
}

.bz_dialogTable tr td input {
	font-size: 12px;
}

.bz_dialogTable tr td select {
	font-size: 12px;
}

.bzbtn {
	position: relative;
	top: 10px;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

.titl1 {
	color: #373D3F;
}

label {
	display: inline-block;
	margin-bottom: 0;
}

.nav {
	padding-left: 15px;
}

.nav-item {
	border-color: #dee2e6 ! important;
}

.nav-item.active {
	border-color: 2px solid #dee2e6 ! important;
}

.errorField {
	color: red ! important;
}

.customSearch {
	display: none;
}
</style>

</head>
<body>
	<div id="ddcolortabsline">&nbsp;</div>

	<form:form name="campaignForm" id="campaignForm" method="post"
		modelAttribute="campaignDto">

		<div class="content1 clearfix">

			<p>
				<a href="Campaign?tabid=CampaignBoard" class="btn btn-info btn-md">
					<span class="glyphicon glyphicon-arrow-left"></span> &#129152;
					CAMPAIGN BOARD
				</a>
			</p>
			<h3 class="title1">
				<img style="margin: 0;"
					src="${pageContext.request.contextPath}/images/campaign.png"
					height='48' width='58'>
				<spring:message code="BzComposer.sales.campaign" />
			</h3>
			<h5 class="titl1">${campaignDto.campaignName}</h5>


			<div class="filterbar filterbar1">
				<table style="width: 50%;">
					<tr class="title1" style="font-size: 13px">
						<td><spring:message code="BzComposer.campaign.type" /></td>

						<td><spring:message code="BzComposer.customer.case.status" /></td>
						<td><spring:message code="BzComposer.campaign.startDate" /></td>
						<td><spring:message code="BzComposer.campaign.endDate" /></td>
					</tr>
					<tr>
						<td>${campaignDto.campaignType}</td>
						<td>${campaignDto.status}</td>
						<td>${campaignDto.startDate}</td>
						<td>${campaignDto.closeDate}</td>
					</tr>
				</table>
			</div>
			<div id="table-negotiations"
				style="padding: 0; border: 1px solid #ccc;">

				<div style="width: 62%; float: left">


					<div id="tabs" style="height: auto;">
						<ul>
							<li style="font-size: 12px;"><a href="#RelatedTab"><spring:message
										code="BzComposer.campaign.relatedfeatures" /></a></li>
							<li style="font-size: 12px;"><a href="#DetailsTab"><spring:message
										code="BzComposer.campaign.Details" /></a></li>

						</ul>
						<div id="DetailsTab" style="display: none;">

							<div id="table-negotiations">
								<table class="tabla-listados" cellspacing="30px">
									<thead>
										<tr>
											<th colspan="9"><spring:message
													code="BzComposer.campaign.info" /></th>
										</tr>
									</thead>
									<tbody>


										<tr>
											<td><spring:message code="BzComposer.campaign.id" /></td>
											<td><form:input path="campaignID" readonly="true"
													style="width:100px;" /></td>
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td><spring:message code="BzComposer.campaign.name" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td colspan="1"><form:input path="campaignName" /></td>
											<td><spring:message code="BzComposer.campaign.owner" /><span
												class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td><form:select path="owner" style="width:200px;">
													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													<form:options items="${OwnerList}" itemValue="name"
														itemLabel="name" />
												</form:select></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><spring:message code="BzComposer.campaign.active" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td colspan="3"><form:checkbox path="isActive" /></td>
											<td colspan="3">&nbsp;</td>
										<tr>
										</tr>
										<td><spring:message code="BzComposer.campaign.type" /> <span
											class="inputHighlighted"><spring:message
													code="BzComposer.CompulsoryField.Validation" /></span></td>
										<td><form:select path="campaignType" style="width:200px;">
												<form:option value="0">
													<spring:message code="BzComposer.ComboBox.Select" />
												</form:option>

												<form:option value="1">
																	Webinar
																</form:option>
												<form:option value="2">
																	Mail
																</form:option>
												<form:option value="3">
																	Direct Mail
																</form:option>


											</form:select></td>
										<td colspan="3">&nbsp;</td>
										</tr>
										<tr>
											<td style="color: #black !important;">
												<div class="lblZipcodeShow float-left">
													<spring:message code="BzComposer.campaign.startDate" />

												</div> <span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span>
											</td>
											<td><form:input path="startDate" /> <img
												src="${pageContext.request.contextPath}/images/cal.gif"
												onclick="displayCalendar(document.campaignForm.startDate,'mm-dd-yyyy',this);">
											</td>
											<td><spring:message code="BzComposer.campaign.endDate" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td><form:input path="closeDate" /> <img
												src="${pageContext.request.contextPath}/images/cal.gif"
												onclick="displayCalendar(document.campaignForm.closeDate,'mm-dd-yyyy',this);">
											</td>

										</tr>

										<tr>
											<td id="t_country"><spring:message
													code="BzComposer.campaign.status" /> <span
												class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td><form:select path="status" style="width:150px">

													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													<form:option value="Planned ">
																	  Planned
																</form:option>
													<form:option value="In Progress">
																	In Progress
																</form:option>
													<form:option value="Complete">
																	Complete
																</form:option>
												</form:select></td>
											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2"><spring:message
													code="BzComposer.campaign.expectedRevenue" /></td>
											<td><form:input path="expectedRevenue" maxlength="16"
													onkeypress="return numbersonly(event,this.value)" /></td>


											<td>&nbsp;</td>
										</tr>
										<tr>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.actualCost" /></td>
											<td><form:input path="actualCost" maxlength="16"
													onkeypress="return numbersonly(event,this.value)" /></td>


											<td>&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2"><spring:message
													code="BzComposer.campaign.budgetedCost" /></td>
											<td><form:input path="budgetedCost" maxlength="16"
													onkeypress="return numbersonly(event,this.value)" /></td>


											<td>&nbsp;</td>
										</tr>
										<tr>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.expectedResponse" /></td>
											<td><form:input path="expectedResponse" maxlength="16"
													onkeypress="return numbersonly(event,this.value)" /></td>

											<td>&nbsp;</td>
										</tr>

										<tr>
											<td colspan="2"><spring:message
													code="BzComposer.campaign.numSentinCampaign" /></td>
											<td><form:input path="numSentInCampaign" maxlength="16"
													onkeypress="return numbersonly(event,this.value)" /></td>


											<td>&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2"><spring:message
													code="BzComposer.campaign.parentCampaign" /></td>

											<td><form:select path="parentCampaign"
													style="width:200px;">
													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													<c:forEach items="${campaignList}" var="currObject">
														<form:option value="${currObject.campaignID}">${currObject.campaignName}</form:option>
													</c:forEach>
												</form:select></td>


											<td colspan="2">&nbsp;</td>
										</tr>
										<tr>

											<td><spring:message code="BzComposer.campaign.createby" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td colspan="2"><form:input path="lastModifiedDate"
													style="width:150px;" readonly="true" /></td>
											<td><spring:message
													code="BzComposer.campaign.lastModifityby" /></td>
											<td colspan="2"><form:input path="lastModifiedDateBy"
													style="width:150px;" readonly="true" /></td>
										</tr>
										<tr>




											<td colspan="2"><spring:message
													code="BzComposer.campaign.leadsinCampaign" /> <span
												class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td><form:input path="leadsInCompaign"
													style="width:100px;" readonly="" /></td>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.convertedleadsinCampaign" /></td>
											<td><form:input path="convertedleadsInCompaign"
													style="width:100px;" readonly="true" /></td>
										</tr>
										<tr>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.contactinCampaign" /></td>
											<td><form:input path="contactsInCompaign"
													style="width:100px;" readonly="" /></td>
										</tr>

										<tr>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.customerinCampaign" /></td>
											<td><form:input path="contactsInCompaign"
													style="width:100px;" readonly="" /></td>
										</tr>
										<tr>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.opportunitiesinCampaign" /></td>
											<td><form:input path="opportunitiesInCompaign"
													style="width:100px;" readonly="" /></td>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.wonOpportunitiesinCampaign" /></td>

											<td><form:input path="wonOpportunitiesInCompaign"
													style="width:100px;" readonly="" /></td>
										</tr>
										<tr>

											<td colspan="2"><spring:message
													code="BzComposer.campaign.valueOpportunitiesinCampaign" />
											<td><form:input path="valueOpportunitiesInCompaign"
													style="width:100px;" readonly="" /></td>
											<td colspan="2"><spring:message
													code="BzComposer.campaign.valueWonOpportunitiesinCampaign" />
											<td><form:input path="valueWonOpportunitiesInCompaign"
													style="width:100px;" readonly="" /></td>


										</tr>


									</tbody>
								</table>
								<div>
									<table align="center" style="width: 100%; margin-top: 5px;">
										<tr align="center">
											<td colspan="5">&nbsp;</td>

											<td colspan="5">
												<button type="button" class="formbutton"
													title="Save Campaign" onclick="updateCampaign();">
													<spring:message code='BzComposer.global.update' />
												</button>
												<button type="button" class="formbutton"
													title="Save Customer" onclick="AddLead();">
													<spring:message code='BzComposer.global.cancel' />
												</button>

											</td>

										</tr>
									</table>
								</div>

							</div>

						</div>

						<div id="RelatedTab" style="display: none;">

							<table class="table-notifications" width="100%">
								<tr>
									<td colspan="5">

										<h3 class="title1">
											<img style="margin: 0;"
												src="${pageContext.request.contextPath}/images/campaignhierarchy.png"
												height='20' width='30' align="left">
											<spring:message code="BzComposer.campaign.hierarchy" />
										</h3>
									</td>


								</tr>

							</table>

							<table class="tabla-listados sortable" cellspacing="0"
								style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
								align="center">
								<thead>
									<tr valign="center" style="width: 100%;">


										<th width="35%"><spring:message
												code="BzComposer.campaign.campaignName" /></th>

										<th><spring:message
												code="BzComposer.campaign.campaignType" /></th>
										<th><spring:message code="BzComposer.campaign.StartDate" /></th>

										<th><spring:message code="BzComposer.campaign.EndDate" /></th>
										<th><spring:message
												code="BzComposer.campaign.ExpectedRevenue" /></th>
										<th><spring:message
												code="BzComposer.campaign.BudgetedCost" />($)</th>
										<th><spring:message code="BzComposer.campaign.ActualCost" />($)</th>
										<th><spring:message code="BzComposer.campaign.Status" /></th>

									</tr>
								</thead>

								<tbody id="custTableBody">


									<c:if test="${not empty campaignHierarchyList}">
										<c:forEach items="${campaignHierarchyList}" var="objList"
											varStatus="loop">
											<tr id='${loop.index}$$' ondblclick="openCampaign()"
												onclick="setRowId(${objList.campaignID}, ${loop.index}, true);">

												<c:if test="${loop.index == 0}">
													<td>${objList.campaignName}</td>
												</c:if>
												<c:if test="${loop.index > 0}">
													<td>&#8627 ${objList.campaignName}</td>
												</c:if>

												<td>${objList.campaignType}</td>
												<td>${objList.startDate}</td>
												<td>${objList.closeDate}</td>

												<td>${objList.expectedRevenue}</td>
												<td>${objList.budgetedCost}</td>
												<td>${objList.actualCost}</td>

												<td>${objList.status}</td>

											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>

							<table class="table-notifications" width="100%">
								<tr>
									<td colspan="5">

										<h3 class="title1">
											<img style="margin: 0;"
												src="${pageContext.request.contextPath}/images/oppotunityIcon.png"
												height='20' width='30' align="left">
											<spring:message code="BzComposer.Customer.opportunities" />
											(${opportunityList.size()})
										</h3>
									</td>

									<td align="right"><input type="button" class="formbutton"
										onclick="addNewOpportunity();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.addNew'/>" /> <input
										type="button" class="formbutton"
										onclick="deleteOpportunity();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.global.delete'/>" />
									</td>
								</tr>
							</table>

							<div style="width: 100%;" align="center">

								<table class="tabla-listados sortable" cellspacing="0"
									style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
									align="center">
									<thead>
										<tr>
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
													onclick="setRowIdOpportunity(${objList.opportunityID},${objList.clientVendor.clientVendorId}, ${loop.index}, true);"
													ondblclick="goToManageOpportunity(${objList.opportunityID});">

													<td><input type="checkbox"
														id="opportunityId${loop.index}"
														value="${objList.opportunityID}"
														onchange="addRowIndexOpportunity(${loop.index},${objList.opportunityID}, ${objList.clientVendor.clientVendorId})" />
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

							</div>

							<table class="table-notifications" width="100%">
								<tr>


									<td colspan="5">

										<h3 class="title1">
											<img style="margin: 0;"
												src="${pageContext.request.contextPath}/images/campaignmembers.png"
												height='20' width='30' align="left">
											<spring:message code="BzComposer.campaign.member" />
											(${campaignMembersList.size()})
										</h3>
									</td>


									<td align="right"><input type="button" class="formbutton"
										onclick="openAddLead();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.campaign.addLeads'/>" />
										<input type="button" class="formbutton"
										onclick="openAddContact();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.campaign.addContact'/>" />
										<input type="button" class="formbutton"
										onclick="openAddCustomer();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.campaign.addCustomer'/>" />

										<input type="button" class="formbutton"
										onclick="openMailSender();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.campaign.updateStatus'/>" />
										<input type="button" class="formbutton"
										onclick="refreshPage();" style="padding: 7 15px;"
										value="<spring:message code='BzComposer.estimationboard.refresh'/>" />


										<form:select path="actionType" onchange="takeAction()"
											style="width: 100px;">

											<form:option value="0">
												<b>Select Action</b>
											</form:option>
											<form:option value="1">
												<b>Import Leads</b>
											</form:option>
											<form:option value="2">
												<b>Import Contacts</b>
											</form:option>

											<form:option value="3">
												<b>Import Customers</b>
											</form:option>

											<form:option value="4">
												<b>Send List Mail </b>
											</form:option>
											<form:option value="5">
												<b>Mail Template</b>
											</form:option>
											<form:option value="6">
												<b>Delete CampaignMembers</b>
											</form:option>

										</form:select></td>
								</tr>
							</table>

							<div style="width: 100%;" align="center">

								<table id="custTable" class="tabla-listados sortable"
									cellspacing="0"
									style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
									align="center">
									<thead>
										<tr valign="center" style="width: 80%;">

											<th style="padding-right: 30px !important;"><spring:message
													code="BzComposer.Customer.opportunities.id" /></th>
											<th><spring:message code="BzComposer.campaign.type" /></th>
											<th><spring:message code="BzComposer.campaign.status" /></th>

											<th><spring:message code="BzComposer.global.firstname" /></th>
											<th><spring:message code="BzComposer.global.lastname" /></th>
											<th><spring:message code="BzComposer.global.email" /></th>

											<th><spring:message code="BzComposer.global.titlename" /></th>
											<th><spring:message code="BzComposer.global.company" /></th>
										</tr>
									</thead>

									<tbody id="custTableBody">


										<c:if test="${not empty campaignMembersList}">
											<c:forEach items="${campaignMembersList}" var="objList"
												varStatus="loop">
												<tr id='${loop.index}$$'
													onclick="setRowId(${objList.campaignMemberID}, ${loop.index}, true);">

													<td><input type="checkbox"
														id="campaignMemberID${loop.index}"
														value="${objList.campaignMemberID}"
														onchange="addRowIndex(${loop.index}, ${objList.campaignMemberID})" />
														${objList.campaignMemberID}</td>
													<td>${objList.memberType}</td>
													<td>${objList.status}</td>
													<td>${objList.firstName}</td>
													<td>${objList.lastName}</td>
													<td>${objList.emailID}</td>
													<td>${objList.title}</td>
													<td>${objList.company}</td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>

							</div>

						</div>



						<!--  related tab End  -->

					</div>
				</div>

				<div style="width: 38%; float: right; font-size: 14px">

					<div id="tabs2" style="height: auto;">
						<ul>
							<li style="font-size: 12px;"><a href="#activityTab"><spring:message
										code="BzComposer.customer.opportunity.activity" /></a></li>
							<li style="font-size: 12px;">
						</ul>
						<div id="activityTab" style="display: none;">
							<table class="table-notifications" width="100%">
								<tr>
									<td>
										<div id="tabs3" style="height: auto; float: left; width: 100%">
											<ul>
												<li style="font-size: 14px;"><a href="#EventTab"><spring:message
															code="BzComposer.campaign.newEvent" /></a></li>
												<li style="font-size: 14px;"><a href="#taskTab"><spring:message
															code="BzComposer.campaign.newTask" /> </a></li>


											</ul>

											<div id="EventTab"
												style="display: none; float: left; width: 100%">

												<div>
													<table class="table-notifications" width="100%">

														<tr>
															<td><a href="#"
																class="btn btn-primary btn-sm active" role="button"
																aria-pressed="true" onclick="openCalendar()"><spring:message
																		code="BzComposer.customer.opportunity.calendar" /> <i
																	class="fa fa-calendar" aria-hidden="true"
																	style="font-size: 18px; color: red"></i> </a> <a href="#"
																class="btn btn-primary btn-sm active" role="button"
																aria-pressed="true" onclick="addEvent()"> <spring:message
																		code="BzComposer.customer.opportunity.manageEvent" />
																	<svg xmlns="http://www.w3.org/2000/svg" width="16"
																		height="16" fill="currentColor"
																		class="bi bi-calendar4-event" viewBox="0 0 16 16">
  <path
																			d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z" />
  <path
																			d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z" />
</svg>
															</a></td>
														</tr>
													</table>
												</div>

												<div style="width: 100%; float: left;">
													<img
														src="${pageContext.request.contextPath}/images/EventsIcon.png"
														height='20' width='30'> <label for="css"
														style="color: #05A9C5">
														<h6>Upcoming Events</h6>
													</label><br>

													<div style="float: left; width: 100%">

														<font size="6">
															<table class="tabla-listados sortable" cellspacing="0"
																style="width: 100%; font: margin-top: 10px; border: 0; padding: 0; height: auto; width: 100%">


																<colgroup>
																	<col span="1" style="width: 5%;">
																	<col span="1" style="width: 25%;">
																	<col span="1" style="width: 20%;">

																	<col span="1" style="width: 25%;">
																	<col span="1" style="width: 25%;">


																</colgroup>
																<thead>
																	<tr style="width: 100%;">



																		<th style="padding-right: 5px !important;"><spring:message
																				code="BzComposer.Customer.opportunities.id" /></th>
																		<th><spring:message
																				code="BzComposer.customer.opportunity.eventName" /></th>


																		<th><spring:message
																				code="BzComposer.campaign.taskMemo" /></th>
																		<th><spring:message
																				code="BzComposer.campaign.startDate" /></th>

																		<th><spring:message
																				code="BzComposer.campaign.endDate" /></th>
																	</tr>
																</thead>

																<tbody>

																	<c:if test="${not empty eventList}">
																		<c:forEach items="${eventList}" var="objList"
																			varStatus="loop">
																			<tr id='${loop.index}$$'
																				onclick="setRowId(${objList.eventId}, ${loop.index}, true);">

																				<td style="font-size: 10px"><input
																					type="hidden" id="eventId${loop.index}"
																					value="${objList.eventId}"
																					onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
																					${objList.eventId}</td>
																				<td style="font-size: 10px">${objList.eventName}</td>
																				<td style="font-size: 10px">${objList.eventMemo}</td>
																				<td style="font-size: 10px">${objList.eventStartDate}</td>
																				<td style="font-size: 10px">${objList.eventEndDate}</td>
																			</tr>
																		</c:forEach>
																	</c:if>

																</tbody>
															</table>
														</font>
													</div>
												</div>
											</div>


											<div id="taskTab"
												style="display: none; float: left; width: 80%">

												<div>
													<table class="table-notifications" width="80%">
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
															<td><img
																src="${pageContext.request.contextPath}/images/EventsIcon.png"
																height='20' width='30'> <label for="css"
																style="color: #05A9C5">
																	<h6>Upcoming Tasks</h6>
															</label></td>
														</tr>
														<tr>
															<td><input type="hidden" name="tSize" id="tSize"
																value='${taskList.size()}' />


																<table id="taskTable" class="tabla-listados sortable"
																	cellspacing="0"
																	style="width: 100%; font: margin-top: 0px; border: 0; padding: 0; height: auto; width: 100%">


																	<colgroup>
																		<col span="1" style="width: 5%;">
																		<col span="1" style="width: 25%;">
																		<col span="1" style="width: 20%;">
																		<col span="1" style="width: 25%;">
																		<col span="1" style="width: 25%;">
																	</colgroup>


																	<thead id="taskthead">

																		<tr valign="center">

																			<th style="padding-right: 30px !important;"><spring:message
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
																			<c:forEach items="${taskList}" var="objList"
																				varStatus="loop">


																				<tr id='${loop.index}task$$'
																					onclick="setRowIdTask(${objList.taskID}, ${loop.index}, true);">

																					<td style="font-size: 10px"><input
																						type="checkbox" id="taskId${loop.index}"
																						value="${objList.taskID}" /> ${objList.taskID}</td>
																					<td style="font-size: 10px">${objList.subject}</td>
																					<td style="font-size: 10px">${objList.dueDate}</td>
																					<td style="font-size: 10px">${objList.contactName}</td>
																					<td style="font-size: 10px">${objList.relatedTo}</td>
																					<td style="font-size: 10px">${objList.assignedTo}</td>
																					<td style="font-size: 10px">${objList.status}</td>
																				</tr>




																			</c:forEach>
																		</c:if>



																	</tbody>
																</table></td>
														</tr>


													</table>
												</div>








											</div>
									</td>
								</tr>
							</table>

						</div>
					</div>
				</div>

			</div>

		</div>

		<input type="hidden" id="tabid" name="tabid" value="" />

	</form:form>

	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js">
	</script>


	<script type="text/javascript">                            
	const stages=["New", "Working", "Escalated", "Closed" ];
	let stageArray = new Array(4).fill(false);
	var selectedStage="";
	<!-- Javascript Begins Here -->
	
	let itemID= 0;
	let taskID= 0;
	let itemIndex = 0;
	let selectedRowIndexs = [];
	
	$(function() 
			
			{
		//alert("here");
	    $( "#tabs" ).tabs();
	    $( "#tabs2" ).tabs();
	    $( "#tabs3" ).tabs();
	  });
	
	$(document).ready(function() {
	    $('#custTable').DataTable({
	        "iDisplayLength": 10,
	        "ordering": true,
	        "order": [[0, 'desc']],
	        "fnDrawCallback": function( oSettings ) {
	            setRowId(0, 0, false);
	            hightlightROW();
	        }
	    });
	});
	
	
	function addTask()
	{
		window.open("Campaign?tabid=newTask&CampaignID="+${campaignDto.campaignID}, null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");

	}

	function editTask()
	{
		if(taskID==0)
		{
		if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
		 return false;
		}
		else
		window.open("Campaign?tabid=editTask&taskID="+taskID+"&CampaignID="+${campaignDto.campaignID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
	}
	

	function deleteTask()
	{

		
		if(taskID==0)
		{
			
			if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
		 return false;
		}
		else
		{
			deleteTaskValidationDialog();

	   }

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
	        	  of: "#taskTable"
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

	
	function addNewOpportunity()
	{
		//window.location = "Customer?tabid=NewCustomer";
		window.open("Opportunity?tabid=newOpportunity", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
	}
	function updateCampaign()
	{
		event.preventDefault();
		
				
				$("#addNewCustomerDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 500,
									modal : true,
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {

											$(this).dialog("close");
											//document.getElementById('tabid').value = "AddCustomer";
											// document.forms["frmNewCampaign"].action = "Customer?tabid=AddCustomer" ;
											//document.forms["frmNewCampaign"].action = "/postNewLead";
											document.forms["campaignForm"].action = "Campaign?tabid=SaveEditCampaignPage&CampaignID="+${campaignDto.campaignID};
							
											document.forms["campaignForm"].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
				return false;
			//}
		//}
	}
	
	function takeAction()
	{
		 var actionType=document.campaignForm.actionType.value;
		 
		 if(actionType=="1")
		 {
			 openImportLeads();
		 
		 }
		 if(actionType=="2")
		 {
			 openImportContacts();
		 
		 }
		 if(actionType=="3")
		 {
			 openImportCustomers();
		 
		 }
		 else if(actionType=="4")
			 {
				openMailSender();
				
			 
			 }
		 
		 else if(actionType=="5")
		 {
			 openMailTemplates();
			
		 
		 }
		 else if(actionType=="6")
		 {
			deleteCampaignMembers(); 
		 }
			
	}
	
	function deleteCampaignMembers()
	{
		
		  if (selectedRowIndexs.length == 0){
		        alert("<spring:message code='BzComposer.campaign.selectcampaignMember'/>");
		        return false;
		    }else{
		        let CustIDs = "";
		        for(let x=0; x<selectedRowIndexs.length; x++){
		            CustIDs = CustIDs + selectedRowIndexs[x] +":";
		        }
		        CustIDs = CustIDs.substring(0, CustIDs.length-1);
		       
		        $.ajax({
			 		type : "POST",
			 		url :"CampaignAjax?tabid=DeleteCampaignMembers&CampaignID="+${campaignDto.campaignID}+"&CustIDs="+CustIDs,
			 	    data :"data="+CustIDs,
			 	    success : function(data)
			 	    {
			 	             alert("Campaign Members Deleted Successfully !!");
			 	    	location.reload();
			 		}
			 		,
			 		 error : function(data) 
			 		 {
			 			 
			 			 //return showerrordialog();
			 		}
			 	});
		        
		        
		    }
		
		
	}

	

	function openCalendar()
	{
		window.open("Campaign?tabid=calendarEvent&CampaignID="+${campaignDto.campaignID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function addEvent()
	{
		window.open("Campaign?tabid=manageEvent&CampaignID="+${campaignDto.campaignID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function openImportLeads()
	{
		window.open("File?tabid=ImportLeads", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
	}
	
	
	function openImportCustomers()
	{
		window.open("File?tabid=ImportCustomer", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
	}
	
	function openImportContacts()
	{
		window.open("File?tabid=ImportContact", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
	}
	function openMailTemplates(){
		window.open("MailTemplates?tabid=getMailTemplates", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
	}

	
	function setRowIdOpportunity(rowid,cvId, rowIndex, flag){
	    let lSize = document.getElementById("pSize").value;
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
	            cvID=cvId;
	        itemIndex = rowIndex;
	        if(rowIndex%2 == 1)
	        { ;
	            document.getElementById(rowIndex+"$$").classList.remove('odd');
	        }
	        document.getElementById(rowIndex+'$$').classList.add('draft');
	    }
	}
	
	function setRowIdTask(rowid,rowIndex, flag){
	    let lSize = document.getElementById("tSize").value;
	    for (i=0; i<lSize; i++) {
	        let currROW = document.getElementById(i+'$$');
	        if(currROW == null) continue;
	        if(i%2 == 1){
	            currROW.className = "odd";
	        }else{
	            currROW.className = "even";
	        }
	    }
	    if(flag)
	    {
	         taskID = rowid;
	        itemIndex = rowIndex;
	        if(rowIndex%2 == 1)
	        { ;
	            document.getElementById(rowIndex+"task$$").classList.remove('odd');
	        }
	        document.getElementById(rowIndex+'task$$').classList.add('draft');
	    }
	}

	function deleteOpportunity()
	{
		

		  if (selectedRowIndexs.length == 0)
		  {
		        alert("<spring:message code='BzComposer.campaign.selectcampaignMember'/>");
		        return false;
		    }
		  else{
		        let CustIDs = "";
		        for(let x=0; x<selectedRowIndexs.length; x++){
		            CustIDs = CustIDs + selectedRowIndexs[x] +":";
		        }
		        CustIDs = CustIDs.substring(0, CustIDs.length-1);
		       
		        
		        //alert("CustIDs"+CustIDs);
		        $.ajax({
			 		type : "POST",
			 		url :"CampaignAjax?tabid=DeleteCampaignOpportunity&CampaignID="+${campaignDto.campaignID}+"&CustIDs="+CustIDs,
			 	    data :"data="+CustIDs,
			 	    success : function(data)
			 	    {
			 	       alert("Opportunity  Deleted Successfully !!");
			 	    	location.reload();
			 		}
			 		,
			 		 error : function(data) 
			 		 {
			 			 
			 			 //return showerrordialog();
			 		}
			 	});
		        
		        
		    }
		
		
		
		
	}

	
	function addRowIndexOpportunity(rowId,opportunityID, custID){
	    let isFound = false;
	    let isChecked = document.getElementById('opportunityId'+rowId).checked;
	    for(let x=0; x<selectedRowIndexs.length; x++){
	        if(selectedRowIndexs[x] == opportunityID){
	            isFound = true;
	            break;
	        }
	    }
	    if(!isFound){
	        selectedRowIndexs.push(opportunityID);
	    }
	    if(!isChecked){
	        const index = selectedRowIndexs.indexOf(opportunityID);
	        if (index > -1) {
	          selectedRowIndexs.splice(index, 1);
	        }
	    }
	}
	
	
	
	
	
	function addRowIndex(rowId, custID){
	    let isFound = false;
	    let isChecked = document.getElementById('campaignMemberID'+rowId).checked;
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

	function openMailSender()
	{
	    if (selectedRowIndexs.length == 0){
	        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
	        return false;
	    }else{
	        let CustIDs = "";
	        for(let x=0; x<selectedRowIndexs.length; x++){
	            CustIDs = CustIDs + selectedRowIndexs[x] +":";
	        }
	        CustIDs = CustIDs.substring(0, CustIDs.length-1);
	        window.open("Campaign?tabid=openSendMail&CampaignID="+${campaignDto.campaignID}+"&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
	    }
	}
	
	
	function openAddOpportunity()
	{
		
		window.open("Campaign?tabid=addOpportunity&CampaignID="+${campaignDto.campaignID},null,"scrollbars=yes,height=600,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function openAddLead()
	{
		
		window.open("Campaign?tabid=addLead&CampaignID="+${campaignDto.campaignID},null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");
		
		
	}
	
	function refreshPage()
	{
	    window.location.reload();
	} 
	function openAddContact()
	{
		
		window.open("Campaign?tabid=ContactBoard&CampaignID="+${campaignDto.campaignID},null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function openAddCustomer()
	{
		
		window.open("Campaign?tabid=addCustomer&CampaignID="+${campaignDto.campaignID},null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	
</script>


</body>
</html>

<div id="saveOpportunityDialog" title="Warning  .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.saveOpportunity" />
	</p>
</div>
<div id="editOpportunityDialog" title="Warning .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.editOpportunity" />
	</p>
</div>
<div id="showErrorDialog" title="Invalid Stage .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.invalidStage" />
	</p>
</div>
<div id="addNewCaseDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.updateCase" />
	</p>
</div>

<div id="selectOneDialog" title="Please Select one record .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.case.selectOne" />
	</p>
</div>
<div id="confirmDialog" title="Confirm  .." style="display: none;">

	<p>
		<spring:message code="BzComposer.customer.case.confirm" />
	</p>
</div>

<div class="container-fluid" id="AddEditItemDlg" style="display: none;">
	<div class="table-responsive"
		style="padding: 10 20px; font-size: 14px; border: 1px solid #ced4da; border-radius: .25rem; min-height: 220px">

		<h6>
			<spring:message code="BzComposer.customer.case.commentInfo" />
		</h6>

		<span
			style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">

			<c:if test="${not empty actionMsg}">
				<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
			</c:if>
		</span>

		<hr />

		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"> <spring:message
					code="BzComposer.customer.case.commentsID" />

			</label>

			<div class="col-md-5"></div>

			<div class="col-md-3"></div>

		</div>


		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"> <spring:message
					code="BzComposer.customer.case.comment" /></label>
			<div class="col-md-6">
				<textarea class="form-control" id="commentBox" rows="4" cols="80"> </textarea>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"><spring:message
					code="BzComposer.customer.case.addedBy" /></label>
			<div class="col-md-5"></div>

			<div class="col-md-3"></div>
		</div>
		<div>

			<div class="row">
				<div class="col-md-4"></div>


				<div class="col-md-8 pt-2" style="font-size: 14px;">
					<button type="button" class="btn btn-info" onclick="saveComment();">
						<spring:message code="BzComposer.global.save" />
					</button>
					<button type="button" class="btn btn-info"
						onclick="closeNewCommentDialog();">
						<spring:message code="BzComposer.global.close" />
					</button>
				</div>
			</div>

		</div>
	</div>
</div>


<div class="container-fluid" id="editComment" style="display: none">
	<div class="table-responsive"
		style="padding: 10 20px; font-size: 14px; border: 1px solid #ced4da; border-radius: .25rem; min-height: 220px">
		<h6>
			<spring:message code="BzComposer.customer.case.commentInfo" />
		</h6>

		<span
			style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">

			<c:if test="${not empty actionMsg}">
				<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
			</c:if>
		</span>
		<hr />

		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"><spring:message
					code="BzComposer.customer.case.commentsID" />: </label>
			<div class="col-md-5">
				<label class="col-md-3 text-center" id="commentID"> </label>
			</div>

			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"> <spring:message
					code="BzComposer.customer.case.comment" />:
			</label>
			<div class="col-md-8">
				<textarea class="form-control" id="commentBox2" rows="4" cols="80">
                    
                     </textarea>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"> <spring:message
					code="BzComposer.customer.case.addedBy" />:
			</label>
			<div class="col-md-5">

				<label class="row-md-3 text-center" id="createdBy"> </label>
			</div>
			<div class="col-md-3"></div>
		</div>

		<div class="row">
			<div class="col-md-1"></div>
			<label class="col-md-3 text-right"> <spring:message
					code="BzComposer.customer.case.createdDate" />:
			</label>
			<div class="col-md-5">

				<label class="row-md-5 text-center" id="createdDateData"> </label>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div>
			<div class="row">
				<div class="col-md-4"></div>

				<div class="col-md-8 pt-2" style="font-size: 14px;">
					<button type="button" class="btn btn-info"
						onclick="updateComment();">
						<spring:message code="BzComposer.global.update" />
					</button>
					<button type="button" class="btn btn-info"
						onclick="closeCommentDialog();">
						<spring:message code="BzComposer.global.close" />
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="addNewCustomerDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.campaign.message.updateCampaign" />
	</p>
</div>




<div id="deleteTask" style="display: none;">
	<p>
		<spring:message code="BzComposer.CustomerBoard.deleteselectedTask" />
	</p>
</div>