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
<title><spring:message code="BzComposer.customerinfotitle" /></title>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<link href="https://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">

<link href="https://cdn.datatables.net/v/bs/dt-2.2.2/datatables.min.css" rel="stylesheet" integrity="sha384-xd6yqpSXZRZVl62sBIxyT2i4xVlfaxWVjVQB7qsVte0qEr3iepsBrLi/awgmIoPV" crossorigin="anonymous">
 
<script src="https://cdn.datatables.net/v/bs/dt-2.2.2/datatables.min.js" integrity="sha384-KsmaH+vFCWsWkBqzoXM7HmafapkguLKrj9aRyWzIIaUDqRN99PP25wJUm7ZE+KP3" crossorigin="anonymous"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>





<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.15.35/css/bootstrap-datetimepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/scripts/datetimepicker.js"></script>

	
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
	padding: 5px 0px 5px 14px;
	background: #fff;
	vertical-align: top;
}

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	min-height: 300px;
	height: auto;
	width: 200px;
	display: block;
	z-index: 101;
}

#highlight {
	background-color: #838383;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 28px;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 20px;
	width: 20px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #17a2b8;
}

input:checked+.slider:before {
	-webkit-transform: translateX(20px);
	-ms-transform: translateX(20px);
	transform: translateX(20px);
}

/* --------- Rounded sliders ---------- */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.paddingLeft30PX {
	padding-left: 30px ! important;
}

.inactiveText {
	color: #ccc;
}
</style>

<style>
.dataTables_length {
	display: none;
}

.dataTables_filter {
	font-size: 14px;
	float: left !important;
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

</head>
<body onload="initialize();">
	<!-- begin shared/header -->

	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="serviceForm" method="post"
		modelAttribute="serviceDto">
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
									<spring:message code="BzComposer.service.billableTimeCost" />
									
									 <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
									</c:if>
								</span>
							</div>
							<br>		
								
								
<!--  Edit time Cost  -->
<div align="left" >
	<div >

		<h6 style="color: #05A9C5;">
			<b> <spring:message code="BzComposer.service.timeandcostfor" /></b>
		       <form:select path="clientVendorID"
																style="width:200px"  onchange="loadCustomer(this.form);">

																<form:option value="0">
																	<spring:message code="BzComposer.timecost.Select" />
																</form:option>

															 <c:forEach items="${CustomerDetails}" var="currObject">
                                                            <form:option
                                                                    value="${currObject.clientVendorID}"> ${currObject.cname} 
                                                               </form:option>
                                                               
                                                        </c:forEach>
                                                        </form:select>
															
															
		</h6>

		
			<div class="form-horizontal">

				<div id="product">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>

								<td>
									<div id="tabs" style="height: auto;">
										<ul>
											<li style="font-size: 12px;font-weight:bold"><a href="#timeTab"><spring:message
														code="BzComposer.service.Time" /> <form:input
														style="font-weight:bold ; font-size:12px" path="timeTotal"
														value="0.00" /></a></li>
											<li style="font-size: 12px;font-weight:bold"><a href="#expensesTab"><spring:message
														code="BzComposer.service.Expenses" /> <form:input
														style="font-weight:bold ; font-size:12px"
														path="expenseTotal" value="0.00" /></a></li>
											<li style="font-size: 12px;font-weight:bold"><a href="#mileageTab"><spring:message
														code="BzComposer.service.Mileage" /> <form:input
														style="font-weight:bold ; font-size:12px "
														path="mileageTotal" value="0.00" /></a></li>
											<li style="font-size: 12px;font-weight:bold"><a href="#itemsTab"><spring:message
														code="BzComposer.service.Items" /> <form:input
														style="font-weight:bold ; font-size:12px" path="itemTotal"
														value="0.00" /></a></li>
										</ul>


										<!--         Time dialog tab start  -->



                                                  <div id="EmpDetails">
											<input type="hidden" name="EmpSize" id="EmpSize"
												value='${empList.size()}'>
											<c:forEach items="${empList}" var="objList" varStatus="loop">
												<input type="hidden" value='${objList.employeeIndexId}'
													id='${loop.index}employeeIndexId' />
												<input type="hidden" value='${objList.firstName}'
													id='${loop.index}firstName' />
												<input type="hidden" value='${objList.lastName}'
													id='${loop.index}lastName' />
													<input type="hidden" value='${objList.amount}'
													id='${loop.index}amount' />

												<input type="hidden" value='${objList.detail}'
													id='${loop.index}desc' />
												
												
											</c:forEach>
										</div>
										<div id="timeTab" style="display: none;">
											<table class="table-notifications" width="100%">
												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.time.info" /></th>
													</tr>
												</thead>
												<tr valign="center" style="width: 100%;">


													<td style="font-size: 12px; width: 10%"><spring:message
															code="BzComposer.service.time.date" /></td>

													<td style="font-size: 12px; width: 20%"><spring:message
															code="BzComposer.service.time.employee" /></td>
															
															
															<td style="font-size: 12px; width: 20%"><spring:message
																	code="BzComposer.service.time.serviceName" /></td>

													<td style="font-size: 12px; width: 10%"><spring:message
															code="BzComposer.service.time.hours" /></td>


													<td style="font-size: 12px; width: 5%"><spring:message
															code="BzComposer.service.time.rate" /></td>
													<td style="font-size: 12px; width: 5%"><spring:message
															code="BzComposer.service.time.amount" /></td>
													<td style="font-size: 12px; width: 20%"><spring:message
															code="BzComposer.service.time.description" /></td>
													<td></td>

												</tr>

												<tr>
													<td style="font-size: 12px;"><form:input
															path="empWorkDate" readonly="true"  size="10%"/> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.empWorkDate,'mm-dd-yyyy',this);">
													</td>

													<td>
														<div id="itemDiv">
															<div id="itemDiv" style="width: 40%" >
																<form:select path="empID"
																	onchange="empChange(this.value);" >
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${empList}" var="empList">
																		<c:if test="${not empty empList}">
																			<form:option value='${empList.employeeIndexId}'>&nbsp;&nbsp;&nbsp;&nbsp;${empList.firstName} ${empList.lastName}</form:option>
																		</c:if>

																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>
													
													<td>
														<div id="itemDiv" style="width: 40%">
															<div id="itemDiv">
																<form:select path="empServiceID"
														>
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${ServiceItemList}" var="itmList">
																		<c:if test="${itmList.iscategory == false}">
																			<form:option value='${itmList.inventoryId}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.itemCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.iscategory == true}">
																			<form:option value='01'>${itmList.itemCode}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>
													<td>

														<div class='input-group date' id='timepicker'>
															<form:input path="emphours" size="20px" oninput="empMultiplication()"  onchange="empMultiplication() "  onmouseup="empMultiplication()" />
															<span class="input-group-addon" onclick="empMultiplication()" ><span
																class="glyphicon glyphicon-date"  onclick="empMultiplication()"><i class='fas fa-clock'></i></i></span>
															</span>
														</div>
													</td>

													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" id="td12">
															<form:input path="emprate" 
																style="text-align: right;" size="10px" oninput="empMultiplication()" />
														</div>
														<div id="SaveUnitPrice" title="Update unit price"
															style="display: none;" size="10px">
															<p>
																<spring:message
																	code="BzComposer.invoice.saveItemUnitPrice" />
															</p>
														</div>
													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="emptotal" size="10px" readonly="true"
																style="text-align: right;" id="amount_id" />
														</div>
													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="empdescription" size="10px"
																readonly="false" style="text-align: left;" />
														</div>
													</td>

													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveTimeServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>

											</table>

											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllTimeServiceIDs();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteTimeServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>

											</table>

											<div style="width: 100%;" align="center">

												<table id="timeServiceTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">
													<thead>
														<tr valign="center" style="width: 100%;">

															<th
																style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																	code="BzComposer.service.time.use" /></th>
															<th style="font-size: 12px; width: 15%"><spring:message
																	code="BzComposer.service.time.date" /></th>

															<th style="font-size: 12px; width: 20%"><spring:message
																	code="BzComposer.service.time.employee" /></th>
																	<th style="font-size: 12px; width: 20%"><spring:message
																	code="BzComposer.service.time.serviceName" /></th>

															<th style="font-size: 12px; width: 10%"><spring:message
																	code="BzComposer.service.time.hours" /></th>


															<th style="font-size: 12px; width: 10%"><spring:message
																	code="BzComposer.service.time.rate" /></th>
															<th style="font-size: 12px; width: 10%"><spring:message
																	code="BzComposer.service.time.amount" /></th>
															<th style="font-size: 12px; width: 30%"><spring:message
																	code="BzComposer.service.time.description" /></th>

														</tr>
													</thead>

													<tbody id="timeServiceTableBody">
														
													</tbody>
												</table>

											</div>


										</div>


										<!--         Time tab end  -->


										<!--   items  start  -->
										<div id="ItemDetails">
											<input type="hidden" name="ItemSize" id="itemSize"
												value='${ServiceItemList.size()}'>
											<c:forEach items="${ServiceItemList}" var="objList"
												varStatus="loop">
												<input type="hidden" value='${objList.inventoryId}'
													id='${loop.index}inventoryId' />
												<input type="hidden" value='${objList.qty}'
													id='${loop.index}q' />
												<input type="hidden" value='${objList.itemCode}'
													id='${loop.index}itemCode' />

												<input type="hidden" value='${objList.inventoryDescription}'
													id='${loop.index}desc' />
												<input type="hidden" value='${objList.salePrice}'
													id='${loop.index}price' />

											</c:forEach>
										</div>
										<div id="itemsTab" style="display: none;">
											<table class="table-notifications" width="100%">


												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.item.info" /></th>
													</tr>
												</thead>

												<tr>
													<td><spring:message
															code="BzComposer.service.time.date" /></td>

													<td><spring:message
															code="BzComposer.service.items.item" /></td>
													<td><spring:message
															code="BzComposer.service.time.description" /></td>
													<td><spring:message
															code="BzComposer.service.items.qty" /></td>


													<td><spring:message
															code="BzComposer.service.time.rate" /></td>
													<td><spring:message
															code="BzComposer.service.time.amount" /></td>

													<td></td>
												</tr>
												<tr>
													<td style="font-size: 12px;"><form:input
															path="itemDate" readonly="true" size="" /> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.itemDate,'mm-dd-yyyy',this);">
													</td>

													<td>
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="itemID"
																	onchange="ItemChange(this.value);" id="itemID">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${ServiceItemList}" var="itmList">
																		<c:if test="${itmList.iscategory == false}">
																			<form:option value='${itmList.inventoryId}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.itemCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.iscategory == true}">
																			<form:option value='01'>${itmList.itemCode}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>
													<td><form:input path="itemMemo" size="20px" /></td>
													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" style="display:block;"
															id="td5">
															<form:input path="itemQty" class="minutesInput"
																style="text-align: right;" min="1" size="10" id="qty_id"
																oninput="itemMultiplication();"
																onkeypress="return numbersonly(event,this.value);" />
														</div>
														<div id=ReceivableListDto title="Update quantity"
															style="display: none;">
															<p>
																<spring:message
																	code="BzComposer.invoice.saveItemQuantity" />
															</p>
														</div>
													</td>

													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" id="td12">
															<form:input path="itemUnitPrice" size="10"
																style="text-align: right;" onclick="saveOldValue();"
																onchange="return saveNewUnitPrice();"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>

													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="itemAmount" size="10" readonly="true"
																style="text-align: right;" id="amount_id"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>
													</td>

													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveItemServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>
											</table>



											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllItemServiceIDs()();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteItemServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>
											</table>

											<div style="width: 100%;" align="center">

												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">


													<tr valign="center" style="width: 100%;">


														<th
															style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																code="BzComposer.service.time.use" /></th>
														<th><spring:message
																code="BzComposer.service.time.date" /></th>

														<th><spring:message
																code="BzComposer.service.items.item" /></th>
														<th><spring:message
																code="BzComposer.service.time.description" /></th>
														<th><spring:message
																code="BzComposer.service.items.qty" /></th>


														<th><spring:message
																code="BzComposer.service.time.rate" /></th>
														<th><spring:message
																code="BzComposer.service.time.amount" /></th>

													</tr>


													<tbody id="itemServiceTableBody">

													</tbody>
												</table>

											</div>


										</div>


										<!--   items   end  -->


										<!-- expense start -->
										<div id="accountDetails">
											<input type="hidden" name="accountItemSize"
												id="accountItemSize" value='${acclist.size()}'>
											<c:forEach items="${acclist}" var="objList" varStatus="loop">
												<input type="hidden" value='${objList.accountId}'
													id='${loop.index}accountId' />
												<input type="hidden" value='${objList.description}'
													id='${loop.index}desc' />

											</c:forEach>
										</div>

										<div id="expensesTab" style="display: none;">
											<table class="table-notifications" width="100%">

												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.expense.info" /></th>
													</tr>
												</thead>
												<tr valign="center" style="width: 100%;">



													<td><spring:message
															code="BzComposer.service.time.date" /></td>

													<td><spring:message
															code="BzComposer.service.expense.payee" /></td>
													<td><spring:message
															code="BzComposer.service.expense.memo" /></td>

													<td><spring:message
															code="BzComposer.service.time.amount" /></td>

												</tr>

												<tr>


													<td style="font-size: 12px;"><form:input
															path="expenseDate" readonly="true" size="15" /> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.expenseDate,'mm-dd-yyyy',this);">
													</td>

													<td>
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="expenseItemID"
																	onchange="accountChange(this.value);">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${acclist}" var="accListobj">

																		<form:option value='${accListobj.accountId}'>&nbsp;&nbsp;&nbsp;&nbsp;${accListobj.name}</form:option>

																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>


													<td><form:input path="expenseMemo" size="20px" /></td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="expenseAmount" size="10"
																readonly="false" style="text-align: right;"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>
													</td>


													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveExpenseServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>
											</table>
											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllExpenseServiceIDs();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteExpenseServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>

											</table>
											<div style="width: 100%;" align="center">

												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">

													<tr valign="center" style="width: 100%;">


														<th
															style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																code="BzComposer.service.time.use" /></th>
														<th><spring:message
																code="BzComposer.service.time.date" /></th>

														<th><spring:message
																code="BzComposer.service.expense.payee" /></th>
														<th><spring:message
																code="BzComposer.service.expense.memo" /></th>

														<th><spring:message
																code="BzComposer.service.time.amount" /></th>

													</tr>


													<tbody id="expenseServiceTableBody">

													</tbody>
												</table>

											</div>


										</div>

										<!--  expense  end-->



										<!--  Mileage  start -->
										<div id="mileageTab" style="display: none;">
											<table class="table-notifications" width="100%">
												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.mileage.info" /></th>
													</tr>
												</thead>

												<tr valign="center" style="width: 100%;">




													<td><spring:message
															code="BzComposer.service.time.date" /></td>
													<td><spring:message
															code="BzComposer.service.items.item" /></td>
													<td><spring:message
															code="BzComposer.service.mileage.miles" /></td>
													<td><spring:message
															code="BzComposer.service.time.rate" /></td>
													<td><spring:message
															code="BzComposer.service.time.amount" /></td>
													<td><spring:message
															code="BzComposer.service.mileage.notes" /></td>


												</tr>
												<tr>

													<td style="font-size: 12px;"><form:input
															path="mileageDate" readonly="true" size="15" /> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.mileageDate,'mm-dd-yyyy',this);">
													</td>

													<td style="font-size: 12px;">
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="mileageItemID"
																	onchange="mileageItemChange(this.value);">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${ServiceItemList}" var="itmList">
																		<c:if test="${itmList.iscategory == false}">
																			<form:option value='${itmList.inventoryId}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.itemCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.iscategory == true}">
																			<form:option value='01'>${itmList.itemCode}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>

													<td style="font-size: 12px;">
														<div style="padding-top: 0px;" style="display:block;"
															id="td5">
															<form:input path="miles" class="minutesInput"
																style="text-align: right;" min="1" type="text" size="10"
																id="qty_id" oninput="mileageMultiplication();"
																onkeypress="return numbersonly(event,this.value);" />
														</div>

													</td>

													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" id="td12">
															<form:input path="milesRate" size="10"
																style="text-align: right;" onclick="saveOldValue();"
																onchange="return saveNewUnitPrice();"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>

													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="mileageAmount" size="10"
																readonly="true" style="text-align: right;"
																id="amount_id"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>
													</td>
													<td><form:input path="mileageMemo" size="30px" /></td>

													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveMileageServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>
											</table>
											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllMileageServiceIDs();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteMileageServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>

											</table>
											<div style="width: 100%;" align="center">

												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">
													<thead>
														<tr valign="center" style="width: 100%;">


															<th
																style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																	code="BzComposer.service.time.use" /></th>
															<th><spring:message
																	code="BzComposer.service.time.date" /></th>
															<th><spring:message
																	code="BzComposer.service.items.item" /></th>
															<th><spring:message
																	code="BzComposer.service.mileage.miles" /></th>
															<th><spring:message
																	code="BzComposer.service.time.rate" /></th>
															<th><spring:message
																	code="BzComposer.service.time.amount" /></th>
															<th><spring:message
																	code="BzComposer.service.mileage.notes" /></th>


														</tr>
													</thead>

													<tbody id="mileageServiceTableBody">

													</tbody>
												</table>

											</div>


										</div>

										<!--   Mileage tab end       -->

									</div>
								</td>

							</tr>
					</table>



                    <div align="right">
					<table>
						<tr>
							<td><spring:message code="BzComposer.service.timecostTotal" />
								<form:input readonly="true" path="timeCostTotal" size="15px" />
							</td>
						</tr>
					</table>

				</div>


</div>
</div>

<div class="text-center row pb-2">
				<label class="col-md-3">&nbsp;</label>
				<div class="col-md-6" style="font-size: 14px;">

					<button type="button" class="btn btn-info"
						onclick="return saveServiceDetails()" id="saveNewcategory">
						<spring:message code="BzComposer.global.save" />
					</button>
					<button type="button" class="btn btn-info"
						onclick="closeAddDialog();">
						<spring:message code="BzComposer.global.close" />
					</button>
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
		</div>
		</div>
		
	</form:form>

	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

	<script>

let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];
let clientVendorID=0;
let estimationID=0;
let selectedTimeServiceCartIDs = [];

let selectedExpenseServiceCartIDs = [];
let selectedMileageServiceCartIDs = [];
let selectedItemServiceCartIDs = [];
$(document).ready(function()
		
		{
	
    $( "#tabs" ).tabs();
    
    
    
	$('#datetimepicker1').datetimepicker({
		 format: 'YYYY-MM-DD HH:mm'
	    	
	});

	 $('#timepicker').datetimepicker({
		   format: 'HH:mm'
		  });

	
    
});

function loadCustomer(form)
{
	clientVendorID=document.serviceForm.clientVendorID.value;
	getTimeServiceData(clientVendorID);
    getExpenseServiceData(clientVendorID);
    getMileageServiceData(clientVendorID);
    getItemServiceData(clientVendorID);
	
	
	}
function initialize(){
	
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
    	if(document.getElementById('0$$') != null){
    		document.getElementById('0$$').className = "even";
    	}
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

function addRowIndex(rowId, custID){
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

$(document).ready(function () 
		{
    
	/*
    $('tr').click(function () 
    		{
         var selected = $(this).hasClass("highlight");
         $("tr").removeClass("highlight");
         if(!selected)
             $(this).addClass("highlight");
           });
   
	 
     */
     
  });

function init(){

    //let row1ID = $('.hideShowSubCatItems')[0].cells[0].innerText;
/*
    if($("#CategoryListTbl tr").length>2){
        $("#CategoryListTbl tr")[2].cells[0].click();
    }
    */
}

function closeCategoryDialog(){
    //$('#AddEditCategoryDlg').dialog('close');
}
function closeItemDialog(){
   // $('#AddEditItemDlg').dialog('close');
}

function setRowIdTimeService(rowid, rowIndex, flag){
    let lSize = document.getElementById("timeServicelSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'ts$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        tsID = rowid;
           
        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"e$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'e$$').classList.add('draft');
    }
}


function getSelectedEmployeeData()
{
	

	  $.ajax({
        type: "GET",
        url:"/employeeData?tabid=getEmpDataEmpid&empId="+document.newCaseForm.companyName.value,
        success:function(data)
        {
        	 document.getElementById("rate").innerHTML = catOptions;	 
        }
	,
    error:function(){
        alert("<bean:message key='BzComposer.common.erroroccurred'/>");
    }
});
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

function getAllTimeServiceIDs()
{
	
	
	selectedTimeServiceCartIDs = [];
 
    let tslsize = document.getElementById("timeServicelSize").value;
  
        for(i=0; i<tslsize; i++)
        {
        	document.getElementById('Time'+i).checked=true;
        	selectedTimeServiceCartIDs.push(document.getElementById("Time"+i).value);
        	
        }
        
       
 
        getSelectItemsCost(1,selectedTimeServiceCartIDs);
}


function getAllExpenseServiceIDs()
{
	
	
	selectedExpenseServiceCartIDs = [];
 
    let eslsize = document.getElementById("expenseServicelSize").value;
   
  
        for(i=0; i<eslsize; i++)
        {
        	document.getElementById('Expense'+i).checked=true;
        	selectedExpenseServiceCartIDs.push(document.getElementById("Expense"+i).value);
        	
        }
      
        getSelectItemsCost(2,selectedExpenseServiceCartIDs);
}

function addRowIndexExpense(rowId,cartID)
{
	   let isChecked = document.getElementById('Expense'+rowId).checked;
	
	let isFound = false;
 
    
    if(isChecked)
    	{
				    for(let x=0; x<selectedExpenseServiceCartIDs.length; x++)
				    {
				        if(selectedExpenseServiceCartIDs[x] == cartID)
				        {
				            isFound = true;
				            break;
				        }
				    }
						    if(!isFound)
						    {
						    	selectedExpenseServiceCartIDs.push(cartID);
						    }
    	}
    if(!isChecked)
    {
        const index = selectedExpenseServiceCartIDs.indexOf(cartID);
        if (index > -1) 
        {
        	selectedExpenseServiceCartIDs.splice(index, 1);
        
        }
    }

    getSelectItemsCost(2,selectedExpenseServiceCartIDs);
}


function getAllMileageServiceIDs()
{
	
	
	selectedMileageServiceCartIDs = [];
 
    let mslsize = document.getElementById("mileageServicelSize").value;
   
  
        for(i=0; i<mslsize; i++)
        {
        	document.getElementById('Mileage'+i).checked=true;
        	selectedMileageServiceCartIDs.push(document.getElementById("Mileage"+i).value);
        	
        }
      
        getSelectItemsCost(3,selectedMileageServiceCartIDs);
}

function addRowIndexMileage(rowId,cartID)
{
	   let isChecked = document.getElementById('Mileage'+rowId).checked;
	
	let isFound = false;
 
    
    if(isChecked)
    	{
				    for(let x=0; x<selectedMileageServiceCartIDs.length; x++)
				    {
				        if(selectedMileageServiceCartIDs[x] == cartID)
				        {
				            isFound = true;
				            break;
				        }
				    }
						    if(!isFound)
						    {
						    	selectedMileageServiceCartIDs.push(cartID);
						    }
    	}
    if(!isChecked)
    {
        const index = selectedMileageServiceCartIDs.indexOf(cartID);
        if (index > -1) 
        {
        	selectedMileageServiceCartIDs.splice(index, 1);
        
        }
    }
    getSelectItemsCost(3,selectedMileageServiceCartIDs);
}


function getAllItemServiceIDs()
{
	
	
	selectedItemServiceCartIDs = [];
 
    let islsize = document.getElementById("itemServicelSize").value;
   
  
        for(i=0; i<islsize; i++)
        {
        	document.getElementById('Item'+i).checked=true;
        	selectedItemServiceCartIDs.push(document.getElementById("Item"+i).value);
        	
        }
        getSelectItemsCost(4,selectedItemServiceCartIDs);
}

function empMultiplication()
{
	
	let amt=0.0,qty,rate;
	qty=document.serviceForm.emphours.value;
	const myArray = qty.split(':');
	var hr=Number(myArray[0]).toString();
	let min=myArray[1];
	var min2=parseInt(min);
	
	let totalmin=(hr*60.00);
	totalmin=totalmin+min2;
     rate=document.serviceForm.emprate.value;
      let permin=(rate/60.00);
     amt=permin*totalmin;
	document.serviceForm.emptotal.value=amt.toFixed(2);
	
}
function addRowIndexItem(rowId,cartID)
{
	   let isChecked = document.getElementById('Item'+rowId).checked;
	
	let isFound = false;
 
    
    if(isChecked)
    	{
				    for(let x=0; x<selectedItemServiceCartIDs.length; x++)
				    {
				        if(selectedItemServiceCartIDs[x] == cartID)
				        {
				            isFound = true;
				            break;
				        }
				    }
						    if(!isFound)
						    {
						    	selectedItemServiceCartIDs.push(cartID);
						    }
    	}
    if(!isChecked)
    {
        const index = selectedItemServiceCartIDs.indexOf(cartID);
        if (index > -1) 
        {
        	selectedItemServiceCartIDs.splice(index, 1);
        
        }
    }
    getSelectItemsCost(4,selectedItemServiceCartIDs);

}
function addRowIndexTime(rowId,cartID)
{
	   let isChecked = document.getElementById('Time'+rowId).checked;
	
	let isFound = false;
 
    
    if(isChecked)
    	{
				    for(let x=0; x<selectedTimeServiceCartIDs.length; x++)
				    {
				        if(selectedTimeServiceCartIDs[x] == cartID)
				        {
				            isFound = true;
				            break;
				        }
				    }
						    if(!isFound)
						    {
						    	selectedTimeServiceCartIDs.push(cartID);
						    }
    	}
    if(!isChecked)
    {
        const index = selectedTimeServiceCartIDs.indexOf(cartID);
        if (index > -1) 
        {
        	selectedTimeServiceCartIDs.splice(index, 1);
        
        }
    }
    getSelectItemsCost(1,selectedTimeServiceCartIDs);

}


function addRowIndex(rowId,opportunityID, custID)
{
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


function getContactData(vendorID)
{
//alert("Data of Conacts="+vendorID);
console.log("setCutomerContactsDataById");
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
                +objList.sourceID+"</td><td>"+objList.startDate+"</td><td>"+objList.closedDate+"</td></tr>";
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

function getOpportunityEventData(vendorID)
{

//alert("event loaded ..");
clientVendorID = vendorID;
$.ajax({
    type: "POST",
    url:"CustomerAjax?tabid=getCustomerOpportunityEventsDetails&cvId="+vendorID,
    data:{clientVendorID : vendorID},
    success : function(data)
    {
        //alert(" eventTable data lenth="+data.length);
    	$('#eventTableBody').html('');
        var eventTable = "<input type='hidden' name='elistSize' id='eSize' value='"+data.length+"'>";
        for(var i=0; i<data.length; i++){
            var objList = data[i];
            eventTable =  eventTable + "<tr id='"+i+"e$$'   onclick='setRowIdEvent("+objList.eventId+", "+i+",true)' >"
                +"<td><input type=checkbox id=eventId"+i+" value='"+ objList.eventId+"' onchange='addRowIndex("+i+","+objList.eventId+")'/> "
                +objList.eventId+"</td>"+"<td>"+objList.opportunityName+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.eventStartDate+"</td><td>"
                +objList.eventEndDate+"</td></tr>";
        }
        $('#eventTableBody').html(eventTable);
                
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
        clientVendorName=data.firstName +' '+ data.middleName +' '+ data.lastName;
        clientVendorCname=data.cname;
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
      getTimeServiceData(vendorID);
      getExpenseServiceData(vendorID);
      getMileageServiceData(vendorID);
      getItemServiceData(vendorID);
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
/******************** Delete Service Item form Cart ****************/

function saveServiceDetails()
{




var timeTotal=document.serviceForm.timeTotal.value;

var expenseTotal=document.serviceForm.expenseTotal.value;
var mileageTotal=document.serviceForm.mileageTotal.value;
var itemTotal =document.serviceForm.itemTotal.value;
var timeCostTotal =document.serviceForm.timeCostTotal.value;

if(timeCostTotal==""||timeCostTotal=="0.00"||expenseAmount=="0.0")
	{
	selectAllDialog();
	}



var timeData={
	         "timeTotal":timeTotal,
	         "expenseTotal":expenseTotal,
	         "mileageTotal":mileageTotal,
	          "itemTotal":itemTotal,
	          "timeCostTotal":timeCostTotal
	         
           };

 var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

$.ajax({
    type: "POST",
    url:"ServiceAjax?tabid=saveService&cvId="+clientVendorID+"&TimeIDs="+selectedTimeServiceCartIDs+
    		                                                 "&MileageIDs="+selectedMileageServiceCartIDs+
    		                                                 "&ExpenseIDs="+selectedExpenseServiceCartIDs+
    		                                                 "&ItemIDs="+selectedItemServiceCartIDs,
    data:"data=" + obj,
    success : function(data)
    {
    	saveSucessdia();
    	
    	
    	getTimeServiceData(clientVendorID);
        getExpenseServiceData(clientVendorID);
        getMileageServiceData(clientVendorID);
        getItemServiceData(clientVendorID);
   },
    error : function(error) 
    {
        alert("<bean:message key='BzComposer.common.erroroccurred'/>");
   }
});



}

function deleteTimeServiceItems()
{



 $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=deleteTimeServiceItems&cvId="+clientVendorID,
        data:"data=" + selectedTimeServiceCartIDs,
        success : function(data)
        {
        	
        	$('#timeServiceTableBody').html('');
        	var timeServiceTable = "<input type='hidden' name='timeServicelistSize' id='timeServicelSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
               
                
                timeServiceTable =  timeServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
                    +"<td><input type=checkbox id=Time"+i+" value='"+ objList.cartID+"' onchange='addRowIndexTime("+i+","+objList.cartID+")'/> "
                    +objList.cartID+"</td>"+"<td>"+objList.empWorkDate+"</td><td>"+objList.empName+"</td><td>"+objList.empServiceID+"</td><td>"+objList.emphours+"</td><td>"+objList.emprate+"</td><td>"
                    +objList.emptotal+"</td><td>"+objList.empdescription+"</td></tr>";
            }
            $('#timeServiceTableBody').html(timeServiceTable);
             
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });


}


function deleteExpenseServiceItems()
{

//alert("expense Selected =");//+selectedExpenseServiceCartIDs());
		

 $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=deleteExpenseServiceItems&cvId="+clientVendorID,
        data:"data=" + selectedExpenseServiceCartIDs,
        success : function(data)
        {
        	
        	$('#expenseServiceTableBody').html('');
        	var ServiceTable = "<input type='hidden' name='expenseServicelistSize' id='expenseServicelSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
               
                ServiceTable=  ServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowId("+objList.cartID+", "+i+",true)' >"
                +"<td><input type=checkbox id=Expense"+i+" value='"+ objList.cartID+"' onchange='addRowIndexExpense("+i+","+objList.cartID+")'/> "
                +objList.cartID+"</td><td>"+objList.expenseDate+"</td><td>"+objList.accName+"</td><td>"+objList.expenseMemo+"</td><td>"
                +objList.expenseAmount+"</td></tr>";
            }
            
            $('#expenseServiceTableBody').html(ServiceTable);
             
        	
             
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });


}


function getSelectItemsCost(serviceType,selectedServiceCartIDs)
{

if(selectedServiceCartIDs.length>0)
	{
	
	$.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=CostSelectedServiceItems&cvId="+clientVendorID,
        data:"data=" + selectedServiceCartIDs,
        success : function(data)
        {
        	if(serviceType==1)
        		{
        		var workhours=document.serviceForm.timeTotal.value=data;
        		 
        		
        		}
        	if(serviceType==2)
    		{
    	document.serviceForm.expenseTotal.value=data;
    		 
    		
    		}
        	if(serviceType==3)
    		{
    	document.serviceForm.mileageTotal.value=data;
    		 
    		
    		}
        	if(serviceType==4)
    		{
    	   document.serviceForm.itemTotal.value=data;
    		 
    		}
        	let timeCost= parseFloat(document.serviceForm.timeTotal.value);
        	let expenseCost= parseFloat(document.serviceForm.expenseTotal.value);
        	let mileageCost= parseFloat(document.serviceForm.mileageTotal.value);
        	let itemCost= parseFloat(document.serviceForm.itemTotal.value);
        	document.serviceForm.timeCostTotal.value=timeCost+expenseCost+mileageCost+itemCost;
        
        },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

	}
}
function deleteMileageServiceItems()
{

 $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=deleteMileageServiceItems&cvId="+clientVendorID,
        data:"data=" + selectedMileageServiceCartIDs,
        success : function(data)
        {
           	
		   	$('#mileageServiceTableBody').html('');
		   	var ServiceTable = "<input type='hidden' name='mileageServicelistSize' id='mileageServicelSize' value='"+data.length+"'>";
		       for(var i=0; i<data.length; i++){
		           var objList = data[i];
		          
		           
		           ServiceTable=  ServiceTable + "<tr id='"+i+"ms$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
		               +"<td><input type=checkbox id=Mileage"+i+" value='"+ objList.cartID+"' onchange='addRowIndexMileage("+i+","+objList.cartID+")'/> "
		               +objList.cartID+"</td><td>"+objList.mileageDate+"</td><td>"+objList.invName+"</td><td>"+objList.miles+"</td><td>"+objList.milesRate+"</td><td>"
		     +objList.mileageAmount+"</td><td>"+objList.mileageMemo+"</td></tr>";
		       }
		       
		       $('#mileageServiceTableBody').html(ServiceTable);
		        	
        
             
        	
             
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });


}

function deleteItemServiceItems()
{



 $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=deleteItemServiceItems&cvId="+clientVendorID,
        data:"data=" + selectedItemServiceCartIDs,
        success : function(data)
        {
           	
        	
		   	
		   	$('#itemServiceTableBody').html('');
		   	var ServiceTable = "<input type='hidden' name='itemServicelistSize' id='itemServicelSize' value='"+data.length+"'>";
		       for(var i=0; i<data.length; i++){
		           var objList = data[i];
		          
		           ServiceTable=  ServiceTable + "<tr id='"+i+"is$$'   onclick='setRowIdItemService("+objList.cartID+", "+i+",true)' >"
	               +"<td><input type=checkbox id=iscartID"+i+" value='"+ objList.cartID+"' onchange='addRowIndex("+i+","+objList.cartID+")'/> "
	               +objList.cartID+"</td><td>"+objList.itemDate+"</td><td>"+objList.invName+"</td><td>"+objList.itemMemo+"</td><td>"+objList.itemQty+"</td><td>"+objList.itemUnitPrice+"</td><td>"
	     +objList.itemAmount+"</td></tr>";
		       }
		       
		       $('#itemServiceTableBody').html(ServiceTable);
             
        	
             
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });


}
/**************************************** Delete Service Items  END ************************************/ 
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
                +objList.eventId+"</td>"+"<td>"+objList.opportunityID+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.eventStartDate+"</td><td>"
                +objList.eventEndDate+"</td></tr>";
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

var eventthead=	" <tr valign='center'><th style='padding-right: 30px !important;'><spring:message code='BzComposer.customer.opportunity.eventId' /></th>"
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
                +objList.eventId+"</td>"+"<td>"+objList.caseID+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.eventStartDate+"</td><td>"
                +objList.eventEndDate+"</td></tr>";
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


/*=====================            Service Type   ==========================*/

function getTimeServiceData(vendorID)
{

  $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=getTimeservice&cvId="+clientVendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	
        	$('#timeServiceTableBody').html('');
        	var timeServiceTable = "<input type='hidden' name='timeServicelistSize' id='timeServicelSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
               
                
                   timeServiceTable =  timeServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
                    +"<td><input type=checkbox id=Time"+i+" value='"+ objList.cartID+"' onchange='addRowIndexTime("+i+","+objList.cartID+")'/> "
                    +objList.cartID+"</td>"+"<td>"+objList.empWorkDate+"</td><td>"+objList.empName+"</td><td>"+objList.empServiceID+"</td><td>"+objList.emphours+"</td><td>"+objList.emprate+"</td><td>"
                    +objList.emptotal+"</td><td>"+objList.empdescription+"</td></tr>";
            }
            
            $('#timeServiceTableBody').html(timeServiceTable);
          
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });


}

function selectcustomerdia()
{
	
	 event.preventDefault();
	 $("#fillcv").dialog({
 	 	title:'Saved ',
 	    resizable: false,
 	    height: 200,
 	    width: 500,
 	    modal: true,
 	    buttons: {
 	        "<spring:message code='BzComposer.global.ok' />": function ()
 	        {
 	  
 	            $(this).dialog("close");
 	            return false;
 	        }
 	    }
 	});
		
}
function saveTimeServiceData()
{

var description=document.serviceForm.empdescription.value;

var workhours=document.serviceForm.emphours.value;			
var emprate=document.serviceForm.emprate.value;
var empServiceID=document.serviceForm.empServiceID.value;
var empID=document.serviceForm.empID.value;
var empWorkDate=document.serviceForm.empWorkDate.value;
var emptotal =document.serviceForm.emptotal.value;

if(clientVendorID==0)
	{
	selectcustomerdia();	
	return false
	}

if(empWorkDate==""||workhours==""||empID==""||emprate==""||empServiceID=="")
	{
	selectAllDialog();
	
	}

var timeData={
	         "empID":empID,
	         "empWorkDate":empWorkDate,
	         "empServiceID":empServiceID,
	         "workhours":workhours,
	         "emprate":emprate,
	          "emptotal":emptotal,
	          "description":description
      
           };
 var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

$.ajax({
    type: "POST",
    url:"ServiceAjax?tabid=saveTimeservice&cvId="+clientVendorID,
    data:"data=" + obj,
    success : function(data)
    {
    	
    	$('#timeServiceTableBody').html('');
    	var timeServiceTable = "<input type='hidden' name='timeServicelistSize' id='timeServicelSize' value='"+data.length+"'>";
        for(var i=0; i<data.length; i++){
            var objList = data[i];
           
            
            timeServiceTable =  timeServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
                +"<td><input type=checkbox id=Time"+i+" value='"+ objList.cartID+"' onchange='addRowIndexTime("+i+","+objList.cartID+")'/> "
                +objList.cartID+"</td>"+"<td>"+objList.empWorkDate+"</td><td>"+objList.empName+"</td><td>"+objList.empServiceID+"</td><td>"+objList.emphours+"</td><td>"+objList.emprate+"</td><td>"
                +objList.emptotal+"</td><td>"+objList.empdescription+"</td></tr>";
        }
        
        $('#timeServiceTableBody').html(timeServiceTable);
         
   },
    error : function(error) {
        alert("<bean:message key='BzComposer.common.erroroccurred'/>");
   }
});

}

function getExpenseServiceData(vendorID)
{


  $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=getExpenseservice&cvId="+clientVendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	

	        	$('#expenseServiceTableBody').html('');
	        	var ServiceTable = "<input type='hidden' name='expenseServicelistSize' id='expenseServicelSize' value='"+data.length+"'>";
	            for(var i=0; i<data.length; i++)
	            {
	                var objList = data[i];
	                     
	              //  alert(objList.expenseAmount);
	                // alert(objList.expenseMemo);
	                ServiceTable=  ServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowId("+objList.cartID+", "+i+",true)' >"
	                    +"<td><input type=checkbox id=Expense"+i+" value='"+ objList.cartID+"' onchange='addRowIndexExpense("+i+","+objList.cartID+")'/> "
	                    +objList.cartID+"</td><td>"+objList.expenseDate+"</td><td>"+objList.accName+"</td><td>"+objList.expenseMemo+"</td><td>"
	                    +objList.expenseAmount+"</td></tr>";
	            }
	            
	            $('#expenseServiceTableBody').html(ServiceTable);	
	        	
       },
        error : function(error)
        {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
  }

function saveExpenseServiceData()
{	
var expenseMemo=document.serviceForm.expenseMemo.value;

var expenseItemID=document.serviceForm.expenseItemID.value;
var expenseDate=document.serviceForm.expenseDate.value;
var expenseAmount =document.serviceForm.expenseAmount.value;

if(clientVendorID==0)
{
selectcustomerdia();	
return false
}
if(expenseItemID==""||expenseDate==""||expenseAmount=="")
	{
	selectAllDialog();
	
	}

var timeData={
	         "expenseItemID":expenseItemID,
	         "expenseDate":expenseDate,
	        
	          "expenseAmount":expenseAmount,
	          "expenseMemo":expenseMemo
      
           };
 var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

$.ajax({
    type: "POST",
    url:"ServiceAjax?tabid=saveExpenseService&cvId="+clientVendorID,
    data:"data=" + obj,
    success : function(data)
    {
    	
    	
    	$('#expenseServiceTableBody').html('');
    	var ServiceTable = "<input type='hidden' name='expenseServicelistSize' id='expenseServicelSize' value='"+data.length+"'>";
        for(var i=0; i<data.length; i++){
            var objList = data[i];
           
            ServiceTable=  ServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowId("+objList.cartID+", "+i+",true)' >"
            +"<td><input type=checkbox id=Expense"+i+" value='"+ objList.cartID+"' onchange='addRowIndexExpense("+i+","+objList.cartID+")'/> "
            +objList.cartID+"</td><td>"+objList.expenseDate+"</td><td>"+objList.accName+"</td><td>"+objList.expenseMemo+"</td><td>"
            +objList.expenseAmount+"</td></tr>";
        }
        
        $('#expenseServiceTableBody').html(ServiceTable);
         
   },
    error : function(error) {
        alert("<bean:message key='BzComposer.common.erroroccurred'/>");
   }
});

}
function getMileageServiceData(vendorID)
{


  $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=getMileageService&cvId="+clientVendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	
           	
		   	$('#mileageServiceTableBody').html('');
		   	var ServiceTable = "<input type='hidden' name='mileageServicelistSize' id='mileageServicelSize' value='"+data.length+"'>";
		       for(var i=0; i<data.length; i++){
		           var objList = data[i];
		          
		           
		           ServiceTable=  ServiceTable + "<tr id='"+i+"ms$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
		               +"<td><input type=checkbox id=Mileage"+i+" value='"+ objList.cartID+"' onchange='addRowIndexMileage("+i+","+objList.cartID+")'/> "
		               +objList.cartID+"</td><td>"+objList.mileageDate+"</td><td>"+objList.invName+"</td><td>"+objList.miles+"</td><td>"+objList.milesRate+"</td><td>"
		     +objList.mileageAmount+"</td><td>"+objList.mileageMemo+"</td></tr>";
		       }
		       
		       $('#mileageServiceTableBody').html(ServiceTable);
		        
	        	
          
       },
        error : function(error)
        {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
  }


function saveMileageServiceData()
{

var mileageMemo=document.serviceForm.mileageMemo.value;
 var miles=document.serviceForm.miles.value;
 var milesRate=document.serviceForm.milesRate.value;
var mileageItemID=document.serviceForm.mileageItemID.value;
var mileageDate=document.serviceForm.mileageDate.value;
var mileageAmount =document.serviceForm.mileageAmount.value;

if(clientVendorID==0)
{
selectcustomerdia();	
return false
}
if(milesRate==""||miles==""||mileageItemID==""||mileageAmount=="")
	{
	selectAllDialog();
	
	}


var timeData={
         "mileageItemID":mileageItemID,
         "mileageDate":mileageDate,
          "miles":miles,
         "milesRate":milesRate,
          "mileageAmount":mileageAmount,
          "mileageMemo":mileageMemo
 
      };
var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

			$.ajax({
			   type: "POST",
			   url:"ServiceAjax?tabid=saveMileageService&cvId="+clientVendorID,
			   data:"data=" + obj,
			   success : function(data)
			   {
			   	
			   	
			   	$('#mileageServiceTableBody').html('');
			   	var ServiceTable = "<input type='hidden' name='mileageServicelistSize' id='mileageServicelSize' value='"+data.length+"'>";
			       for(var i=0; i<data.length; i++){
			           var objList = data[i];
			          
			           ServiceTable=  ServiceTable + "<tr id='"+i+"ms$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
		               +"<td><input type=checkbox id=Mileage"+i+" value='"+ objList.cartID+"' onchange='addRowIndexMileage("+i+","+objList.cartID+")'/> "
		               +objList.cartID+"</td><td>"+objList.mileageDate+"</td><td>"+objList.invName+"</td><td>"+objList.miles+"</td><td>"+objList.milesRate+"</td><td>"
		     +objList.mileageAmount+"</td><td>"+objList.mileageMemo+"</td></tr>";
			       }
			       
			       $('#mileageServiceTableBody').html(ServiceTable);
			        
			  },
			   error : function(error) {
			       alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			  }
			});

}
function getItemServiceData(vendorID)
{


  $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=getItemService&cvId="+clientVendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	

		   	$('#itemServiceTableBody').html('');
		   	var ServiceTable = "<input type='hidden' name='itemServicelistSize' id='itemServicelSize' value='"+data.length+"'>";
		       for(var i=0; i<data.length; i++){
		           var objList = data[i];
		          
		           ServiceTable=  ServiceTable + "<tr id='"+i+"is$$'   onclick='setRowIdItemService("+objList.cartID+", "+i+",true)' >"
	               +"<td><input type=checkbox id=Item"+i+" value='"+ objList.cartID+"' onchange='addRowIndexItem("+i+","+objList.cartID+")'/> "
	               +objList.cartID+"</td><td>"+objList.itemDate+"</td><td>"+objList.invName+"</td><td>"+objList.itemMemo+"</td><td>"+objList.itemQty+"</td><td>"+objList.itemUnitPrice+"</td><td>"
	     +objList.itemAmount+"</td></tr>";
		       }
		       
		       $('#itemServiceTableBody').html(ServiceTable);
		        
	        	
          
       },
        error : function(error)
        {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
  }





function saveItemServiceData()
{

var itemDate=document.serviceForm.itemDate.value;	 	

 var itemQty=document.serviceForm.itemQty.value;
 var itemUnitPrice=document.serviceForm.itemUnitPrice.value;
var itemID=document.serviceForm.itemID.value;
var itemAmount =document.serviceForm.itemAmount.value;

var itemMemo=document.serviceForm.itemMemo.value;


if(clientVendorID==0)
{
selectcustomerdia();	
return false
}

if(itemID==""|| itemDate==""||itemQty==""||itemAmount=="")
	{
	selectAllDialog();
	
	}


var timeData={
         "itemDate":itemDate,
         "itemID":itemID,
          "itemQty":itemQty,
         "itemUnitPrice":itemUnitPrice,
          "itemAmount":itemAmount,
          "itemMemo":itemMemo,
          
          
          
 
      };
var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

			$.ajax({
			   type: "POST",
			   url:"ServiceAjax?tabid=saveItemService&cvId="+clientVendorID,
			   data:"data=" + obj,
			   success : function(data)
			   {
			   	
			   	
			   	$('#itemServiceTableBody').html('');
			   	var ServiceTable = "<input type='hidden' name='itemServicelistSize' id='itemServicelSize' value='"+data.length+"'>";
			       for(var i=0; i<data.length; i++){
			           var objList = data[i];
			          
			           ServiceTable=  ServiceTable + "<tr id='"+i+"is$$'   onclick='setRowIdItemService("+objList.cartID+", "+i+",true)' >"
		               +"<td><input type=checkbox id=iscartID"+i+" value='"+ objList.cartID+"' onchange='addRowIndex("+i+","+objList.cartID+")'/> "
		               +objList.cartID+"</td><td>"+objList.itemDate+"</td><td>"+objList.invName+"</td><td>"+objList.itemMemo+"</td><td>"+objList.itemQty+"</td><td>"+objList.itemUnitPrice+"</td><td>"
		     +objList.itemAmount+"</td></tr>";
			       }
			       
			       $('#itemServiceTableBody').html(ServiceTable);
			        
			  },
			   error : function(error) {
			       alert("<bean:message key='BzComposer.common.erroroccurred'/>");
			  }
			});

}



function  empChange(value)
{


var size = document.getElementById('EmpSize').value;

var count;
for(count=0;count<size;count++)
{
    var employeeIndexId= document.getElementById(count+'employeeIndexId').value;
			    if(value==employeeIndexId)
			    	{
			    
				 var qty = "01:00";
				 var amt;
							let uprice = document.getElementById(count+'amount').value;
							let desc = document.getElementById(count+'desc').value;
							
							document.serviceForm.empdescription.value=desc;
							
							document.serviceForm.emphours.value=qty;				
							document.serviceForm.emprate.value=uprice;
							
							
							document.serviceForm.emptotal.value=uprice;
			      }
}


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


function deleteServiceItems()
{
 $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=getTimeservice&cvId="+clientVendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	
        	$('#timeServiceTableBody').html('');
        	var timeServiceTable = "<input type='hidden' name='timeServicelistSize' id='timeServicelSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
               
                
                   timeServiceTable =  timeServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
                    +"<td><input type=checkbox id=Time"+i+" value='"+ objList.cartID+"' onchange='addRowIndexTime("+i+","+objList.cartID+")'/> "
                    +objList.cartID+"</td>"+"<td>"+objList.empWorkDate+"</td><td>"+objList.empName+"</td><td>"+objList.empServiceID+"</td><td>"+objList.emphours+"</td><td>"+objList.emprate+"</td><td>"
                    +objList.emptotal+"</td><td>"+objList.empdescription+"</td></tr>";
            }
            
            $('#timeServiceTableBody').html(timeServiceTable);
          
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });


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

function saveSucessdia()
{

 event.preventDefault();
 $("#savesuccess").dialog({
	 	title:'Saved ',
	    resizable: false,
	    height: 200,
	    width: 500,
	    modal: true,
	    buttons: {
	        "<spring:message code='BzComposer.global.ok' />": function ()
	        {
	  
	            $(this).dialog("close");
	            return false;
	        }
	    }
	});
	
}

function deleteCaseValidationDialog()
{

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
    position:
    {
    	  my: "center",
    	  at: "center",
    	  of: "#eventTable"
    },

    buttons:
    {
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
 	            error:function(data) 
 	            {
 	              alert("<spring:message code='BzComposer.billingboard.someerroroccurred'/>");
 	            }
 	       });
        },
        "<spring:message code='BzComposer.global.cancel'/>": function () 
        {
            $(this).dialog("close");
        }
        
    }
});
return false;
}

function closeAddDialog()
{
$("#AddNewServiceItemDlgId").hide();
location.reload();

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
function selectAllDialog(){
event.preventDefault();
$("#selectAllDialog").dialog({
	
	resizable: false,
    height: 200,
    width: 400,
    modal: true,
    position: {
    	my: "center",
    	  at: "center",
    	  of: "#AddNewCategory"
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

</body>
</html>
<script>
function initialize(){
	/*
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0)
    {
        document.getElementById('0$$').className = "even";
    }
    */
}
</script>



<!-- Dialog box used in this page -->
<div id="selectcategorydialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.selectcategory' />
	</p>
</div>
<div id="selectitemdialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.selectitemrow' />
	</p>
</div>
<div id="showerrordialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.reconciliation.someerroroccurred' />
	</p>
</div>
<div id="deletedialogbox" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.wanttodelete' />
	</p>
</div>
<div id="editdialogbox" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.wanttoeditEstimation' />
	</p>
</div>
<div id="createInvoicedialogbox" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.wanttocreateInvoice' />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselecteditem" />
	</p>
</div>

<div id="selectAllDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectedAlldlg" />
	</p>
</div>

<div id="updatesuccess" style="display: none;">
	<p>
		<spring:message code="BzComposer.service.updatesuccess" />
	</p>
</div>

<div id="savesuccess" style="display: none;">
	<p>
		<spring:message code="BzComposer.service.savesuccess" />
	</p>
</div>