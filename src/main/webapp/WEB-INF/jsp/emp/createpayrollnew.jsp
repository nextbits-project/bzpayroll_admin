<%@ page contentType="text/html;charset=UTF-8" %>
	<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
						<%@include file="/WEB-INF/jsp/include/header.jsp" %>
							<%@include file="/WEB-INF/jsp/include/menu.jsp" %>
								<title>
									<spring:message code="BzComposer.payroll.title.createPayroll" />
								</title>
								<link rel="stylesheet"
									href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
								<link rel="stylesheet"
									href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css">
								<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
								<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
									rel="stylesheet">
								<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
								<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"
									rel="stylesheet">
								<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

								<style>
									input{
										height: 20px;
									}
									.dataTables_length {
										font-size: 12px;
									}

									.dataTables_filter {
										font-size: 12px;
									}

									.dataTables_info {
										font-size: 12px;
									}

									.dataTables_paginate {
										font-size: 12px;
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
									}

									table.tabla-listados tbody tr td {
										font-size: 12px;
									}

									table th {
										font-size: 12px !important;
										background-color: #C3C5C7 !important;
									}

									/* Tab styles - matching Employee Board */
									.ui-tabs .ui-tabs-nav {
										border: none !important;
									}

									.ui-tabs .ui-tabs-nav li {
										border: 1px solid #ccc !important;
									}

									.ui-tabs .ui-tabs-nav {
										display: flex;
										justify-content: center;
										gap: 5px;
										padding: 0;
										margin: 0 auto;
										width: 100%;
									}

									.ui-tabs .ui-tabs-nav li {
										flex: 1;
										max-width: 200px;
										text-align: center;
										border: 1px solid #ccc !important;
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


									.selected-row {
										background-color: #808080;
										color: white;
										font-weight: bold;
									}

									.employee-row {
										border-bottom: 1px solid #ccc;
										cursor: pointer;
									}

									.payroll-row {
										cursor: pointer;
									}

									.payroll-row:hover {
										background-color: #f5f5f5;
									}

									.payroll-row.selected {
										background-color: #d4edda;
									}

									#selectAll {
										cursor: pointer;
									}

									.row-checkbox {
										cursor: pointer;
									}

									.panel-header {
										background-color: #C3C5C7;
										padding: 8px 12px;
										border-bottom: 1px solid #eee;
										font-size: 12px;
										font-weight: bold;
										color: #333;
										margin-bottom: 0;
									}

									#css1 {
										background-color: #C3C5C7;
										padding: 8px 12px;
										border: none;
										color: #333;
										font-size: 12px;
										font-weight: bold;
									}

									#css1 th {
										background-color: #C3C5C7;
										color: #333;
										border: none;
										font-size: 12px;
										font-weight: bold;
										padding: 8px 12px;
									}

									.alert {
										margin-bottom: 20px;
									}

									.section-border {
										border: 0;
									}

									/* Light font weight and 12px font size for form elements - matching employeeboard.jsp */
									table td {
										font-weight: normal !important;
										font-size: 12px !important;
									}

									.form-control,
									.form-select {
										font-weight: normal !important;
										font-size: 12px !important;
									}

									table td input,
									table td select {
										font-weight: normal !important;
										font-size: 12px !important;
									}
								</style>
				</head>

				<body>
					<script>
						$(document).ready(function () {
							$('#custTableBody').on('click', '.employee-row', function (e) {
								const employeeId = $(this).data('id');
								console.log("Employee ID:", employeeId);

								if (!employeeId) {
									console.warn("No employee ID found on row.");
									return;
								}

								const apiUrl = `/api/employees/` + employeeId;
								console.log("Calling:", apiUrl);

								$.ajax({
									url: apiUrl,
									type: 'GET',
									success: function (data) {
										console.log("Employee Data:", data);

										if (data) {
											$('select[name="title"]').val(data.title || '');
											$('input[name="firstName"]').val(((data.firstName || '')).trim());
											$('input[name="lastName"]').val(((data.lastName || '')).trim());
											$('input[name="mi"]').val(((data.mi || '')).trim());
											$('input[name="ssn"]').val(((data.ssn || '')).trim());
											$('input[name="photo"]').val(((data.photo || '')).trim());
											$('input[name="allowance"]').val(data.allowance || '');
											$('input[name="payPeriod"][value="' + (data.payPeriod || '') + '"]').prop('checked', true);
											$('select[name="jobType"] option').filter(function () {
												return $(this).text() === (data.jobType || '');
											}).prop('selected', true);
											$('select[name="countryId"] option').filter(function () {
												return $(this).text() === (data.country || '');
											}).prop('selected', true);
										} else {
											console.warn("No data returned");
										}
									},
									error: function (xhr) {
										console.error("Failed to fetch employee:", xhr.status, xhr.responseText);
										alert('Employee data not found.');
									}
								});
							});
						});
					</script>


					<script>
						document.addEventListener("DOMContentLoaded", function () {
							const today = new Date();
							const options = { year: 'numeric', month: 'long', day: 'numeric' };
							const formattedDate = today.toLocaleDateString('en-US', options);

							document.querySelectorAll(".date-field").forEach(function (el) {
								el.textContent = formattedDate;
							});
						});
					</script>

					<script>
						$(document).ready(function () {
							$('#custTableBody').on('click', '.employee-col', function () {
								$('.employee-col').css({
									'background-color': '',
									'color': '',
									'font-weight': ''
								});
								$(this).css({
									'background-color': '#808080',
									'color': 'white',
									'font-weight': 'bold'
								});
							});
						});
					</script>

					<script>
						let tempcssid = 0;
						$(document).ready(function () {
							$('#custTableBody2').on('click', '.employee-row', function () {
								const employeeId = $(this).data('id');
								console.log("Employee ID:", employeeId);

								if (!employeeId) {
									console.warn("No employee ID found on row.");
									return;
								}

								const apiUrl = `/api/employees/` + employeeId;
								console.log("Calling:", apiUrl);

								$.ajax({
									url: apiUrl,
									type: 'GET',
									success: function (data) {
										console.log("Employee Data:", data);

										if (data) {
											$('select[name="title"]').val(data.title || '');
											$('input[name="firstName"]').val(((data.firstName || '')).trim());
											$('input[name="lastName"]').val(((data.lastName || '')).trim());
											$('input[name="mi"]').val(((data.mi || '')).trim());
											$('input[name="ssn"]').val(((data.ssn || '')).trim());
											$('input[name="photo"]').val(((data.photo || '')).trim());
											$('input[name="allowance"]').val(data.allowance || '');
											$('input[name="payPeriod"][value="' + (data.payPeriod || '') + '"]').prop('checked', true);
											$('select[name="jobType"] option').filter(function () {
												return $(this).text() === (data.jobType || '');
											}).prop('selected', true);
											$('select[name="countryId"] option').filter(function () {
												return $(this).text() === (data.country || '');
											}).prop('selected', true);
										} else {
											console.warn("No data returned");
										}
									},
									error: function (xhr) {
										console.error("Failed to fetch employee:", xhr.status, xhr.responseText);
										alert('Employee data not found.');
									}
								});

								if (tempcssid !== 0) {
									$('.employee-col-' + tempcssid).css({
										'background-color': '',
										'color': '',
										'font-weight': ''
									});
								}

								tempcssid = employeeId;

								$('.employee-col-' + employeeId).css({
									'background-color': '#808080',
									'color': 'white',
									'font-weight': 'bold'
								});
							});
						});
					</script>

					<!-- begin shared/header -->
					<div id="ddcolortabsline">&nbsp;</div>
					<div id="cos">
						<div class="statusquo ok">
							<div id="hoja">
								<div id="blanquito">
									<div id="padding">
										<div>
											<div>
												<span
													style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
													Create Payroll </span>
												<br>
											</div>
										</div>

										<div>
											<div style="width:100%; overflow:hidden; padding: 0px 0px 0px 0px;">
												<div style="float:right;">
													<button class="formbutton" onclick="batchCalculateTaxes(); return false;">Batch Calculations</button>
													<button class="formbutton" style="margin-right:15px;" onclick="batchPrintPayroll(); return false;">Batch
														Print</button>
												</div>
											</div>
										</div>

										<input type="hidden" name="actionValidate" value="vendor.jsp">
										<table style="width: 100%;">

											<tr>
												<td style="font-size: 12px;">
													<table class="tabla-listados" cellspacing="0"
														style="margin-top: 0; margin-left: 20px;">
											</tr>
											<td style="display: flex;">

												<td colspan="8" style="font-size: 14px; font-weight: bold;">
													<table cellspacing="0"
														style="border: 1px solid #ccc; width: 100%; background-color: #f9f9f9; padding: 10px;">
														<tr>
															<td style="padding-right: 10px;"><strong>Date:</strong></td>
															<td style="padding-right: 10px;"><strong><span
																class="date-field"></span></strong></td>
															<td colspan="6"></td>
														</tr>
														<tr>
															<td style="padding-right: 10px;" colspan="2" >
																<strong>Payroll Period:</strong></td>
															<td colspan="6"></td>
														</tr>
														<tr>
															<td
																style="padding-right: 10px; width: 15%; vertical-align: middle;">
																<strong>From</strong></td>
															<td
																style="padding-right: 10px; width: 30%; padding-top: 5px; padding-bottom: 5px;">
																<input type="date" name="fromDate"
																	id="fromDate" class="form-control" />
															</td>
															<td
																style="padding-right: 10px; width: 8%; vertical-align: middle;">
																<strong>To</strong></td>
															<td
																style="padding-right: 10px; width: 30%; padding-top: 5px; padding-bottom: 5px;">
																<input type="date" name="toDate" id="toDate"
																	class="form-control" />
															</td>
															<td colspan="4"></td>
														</tr>
													</table>
												</div>

												<table cellspacing="0" style="border: 0; width: 100%;"
													class="section-border">
													<tr>
														<td> </td>
														<td> </td>
													</tr>
												</table>

												<div>
													<div id="formCustomization">
														<div id="tabs">
															<ul>
																<li><a href="#active" style="font-size:18px;">Active</a>
																</li>
																<li><a href="#inactive"
																		style="font-size:18px;">Inactive</a></li>
															</ul>



															<div style="height: 690px; overflow-y: auto;">
																<div class="tab-content" id="employeeTabsContent">
																	<!-- Active Tab -->
																	<div class="tab-pane fade show active" id="active"
																		role="tabpanel">
																		<div class="table-responsive">
																			<table cellspacing="0"
																				style="border: 0; width: 100%;"
																				class="section-border">
																				<tbody>
																					<tr>
																						<th>
																							<hr
																								style="border:1px solid black; margin:0;">
																						</th>
																					</tr>
																				</tbody>
																				<tbody id="custTableBody">
																					<c:forEach var="emp"
																						items="${employeesIdNameDtoList}">
																						<tr class="employee-row"
																							data-id="${emp.id}">
																							<td class="employee-col"
																								style="padding: 10px;">
																								${empty emp.firstName ?
																								'' : emp.firstName}
																								${empty emp.lastName ?
																								'' : emp.lastName}
																								${empty emp.mi ? '' :
																								emp.mi}-
																								${empty emp.ssn ? '' :
																								emp.ssn} <br />
																								${empty emp.payPeriod ?
																								'' : emp.payPeriod},
																								Pay Date:
																								${"02-11-2025"}
																							</td>
																						</tr>
																					</c:forEach>
																				</tbody>
																			</table>
																		</div>
																	</div>
																	<div class="tab-pane fade show active" id="inactive"
																		role="tabpanel">
																		<div class="table-responsive">
																			<table cellspacing="0"
																				style="border: 0; width: 100%;"
																				class="section-border">

																				<tbody>
																					<tr>
																						<th>
																							<hr
																								style="border:1px solid black; margin:0;">
																						</th>
																					</tr>
																				</tbody>
																				<tbody id="custTableBody2">
																					<c:forEach var="employeeInfo"
																						items="${employeeInfoDTOList}">
																						<tr class="employee-row"
																							data-id="${employeeInfo.id}"
																							style="border-bottom: 1px solid #ccc; cursor: pointer;">
																							<td style="padding: 10px;"
																								class="employee-col-${employeeInfo.id}">
																								${empty
																								employeeInfo.firstName ?
																								'' :
																								employeeInfo.firstName}
																								${empty
																								employeeInfo.lastName ?
																								'' :
																								employeeInfo.lastName}
																								${empty employeeInfo.mi
																								? '' : employeeInfo.mi}-
																								${empty employeeInfo.ssn
																								? '' :
																								employeeInfo.ssn}<br />
																								${empty
																								employeeInfo.payPeriod ?
																								'' :
																								employeeInfo.payPeriod},
																								Pay Date:
																								${"02-11-2025"}
																							</td>
																						</tr>
																					</c:forEach>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>

											<td style="font-size: 12px; margin: 0; padding: 0; vertical-align: top;">
												<div id="table-negotiations">
													<table class="tabla-listados" cellspacing="0" style="width: 100%; margin-top: 0;" id="payrollTable">
														<thead>
															<tr id="css1">
																<th><input type="checkbox" id="selectAll" title="Select All" /></th>
																<th>Employee ID</th>
																<th>Employee Name</th>
																<th>SSN</th>
																<th>Job Title</th>
																<th>Job Status</th>
																<th>Total Hours</th>
																<th>Reg Hours</th>
																<th>OT Hours</th>
																<th>Hourly Rate</th>
																<th>Pay Date</th>
																<th>Regular Wage</th>
																<th>OT Wage</th>
																<th>Total Wage</th>
																<th>Federal<br>Tax</th>
																<th>Social<br>Security</th>
																<th>Medicare<br>Tax</th>
																<th>State<br>Tax</th>
																<th>State<br>Disability</th>
																<th>Total<br>Deduction</th>
																<th>Net<br>Payment</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="summary" items="${payrollSummaries}" varStatus="status">
																<tr class="payroll-row" data-employee-id="${summary.employeeId}" data-state="${empty summary.state ? 'CA' : summary.state}">
																	<td><input type="checkbox" class="row-checkbox" data-employee-id="${summary.employeeId}" /></td>
																	<td>${summary.employeeId}</td>
																	<td>${empty summary.employeeName ? '' : summary.employeeName}</td>
																	<td>${empty summary.ssn ? '' : summary.ssn}</td>
																	<td>${empty summary.jobTitle ? '' : summary.jobTitle}</td>
																	<td>${empty summary.jobType ? '' : summary.jobType}</td>
																	<td><fmt:formatNumber value="${summary.totalHours != null ? summary.totalHours : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td><fmt:formatNumber value="${summary.regHours != null ? summary.regHours : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td><fmt:formatNumber value="${summary.otHours != null ? summary.otHours : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td>$<fmt:formatNumber value="${summary.hourlyRate != null ? summary.hourlyRate : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td>${empty summary.payDate ? '' : summary.payDate}</td>
																	<td>$<fmt:formatNumber value="${summary.regularWage != null ? summary.regularWage : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td>$<fmt:formatNumber value="${summary.otWage != null ? summary.otWage : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td>$<fmt:formatNumber value="${summary.totalWage != null ? summary.totalWage : 0}" minFractionDigits="2" maxFractionDigits="2"/></td>
																	<td class="federal-tax">-</td>
																	<td class="social-security-tax">-</td>
																	<td class="medicare-tax">-</td>
																	<td class="state-tax">-</td>
																	<td class="state-disability-tax">-</td>
																	<td class="total-deduction">-</td>
																	<td class="net-payment">-</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</td>
											</tr>
										</table>
										</td>
										</tr>

									</div>
								</div>
							</div>
						</div>
					</div>


					<script>
						fetch('/api/getemployeeList')
							.then(async (response) => {
								if (!response.ok) {
									throw new Error("Failed to fetch employee data: " + response.status);
								}
								const listOfEmployee = await response.json()
								const tableBody = document.querySelector("#employeeTable tbody");
								listOfEmployee.forEach((item) => {
									console.log(item)
									console.log(item.firstName, item.lastName)
									const row = document.createElement("tr");
									const fullNameCell = document.createElement("td");
									const fullName = item.firstName + "  " + item.lastName;
									fullNameCell.textContent = fullName;
									row.appendChild(fullNameCell);
									tableBody.appendChild(row);
								});
							});
					</script>

					<script type="text/javascript">
						function createPayroll() {
							var empid = document.getElementById("empids").value;
							var PaymentMethod = document.getElementById("PaymentMethod").value;
							var workingHours = document.getElementById("workingHours").value;
							if (empid == "") {
								return selectemployeeDialog();
							} else if (workingHours == 0 || workingHours == 0.0) {
								return emptyemployeetimesheetDialog();
							} else if (PaymentMethod == "") {
								return selectPaymentMethodDialog();
							} else {
								document.forms['PayrollForm'].action = "/dashboard/Payroll?tabid=createList";
								document.forms['PayrollForm'].submit();
							}
						}

						function selectemployeeDialog() {
							event.preventDefault();
							$("#selectemployeeDialog").dialog({
								resizable: false,
								height: 200,
								width: 450,
								modal: true,
								buttons: {
									"<spring:message code='BzComposer.global.ok'/>": function () {
										$(this).dialog("close");
									}
								}
							});
							return false;
						}

						function selectPaymentMethodDialog() {
							event.preventDefault();
							$("#selectPaymentMethodDialog").dialog({
								resizable: false,
								height: 200,
								width: 450,
								modal: true,
								buttons: {
									"<spring:message code='BzComposer.global.ok'/>": function () {
										$(this).dialog("close");
									}
								}
							});
							return false;
						}

						function emptyemployeetimesheetDialog() {
							event.preventDefault();
							$("#emptyemployeetimesheetDialog").dialog({
								resizable: false,
								height: 200,
								width: 450,
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

					<script>
						// Initialize tabs at the very end - simple approach like employeeboard.jsp
						// This must be after all other scripts to ensure proper initialization
						$(document).ready(function () {
							// Wait for everything to be ready
							setTimeout(function () {
								if ($("#tabs").length) {
									// Destroy if already initialized to prevent conflicts
									if ($("#tabs").hasClass("ui-tabs")) {
										try {
											$("#tabs").tabs("destroy");
										} catch (e) { }
									}

									// Initialize tabs - simple like employeeboard.jsp
									$("#tabs").tabs({ active: 0 });

									// Debug: log tab clicks
									$("#tabs").on("tabsactivate", function (event, ui) {
										console.log("Tab activated:", ui.newTab.index());
									});
								}
							}, 50);
						});
					</script>

					<script>
						// Multiple selection functionality for batch calculations
						$(document).ready(function() {
							// Select All checkbox functionality
							$('#selectAll').on('change', function() {
								var isChecked = $(this).prop('checked');
								$('.row-checkbox').prop('checked', isChecked);
								$('.payroll-row').toggleClass('selected', isChecked);
							});

							// Individual row checkbox functionality
							$(document).on('change', '.row-checkbox', function() {
								var $row = $(this).closest('.payroll-row');
								if ($(this).prop('checked')) {
									$row.addClass('selected');
								} else {
									$row.removeClass('selected');
									$('#selectAll').prop('checked', false);
								}
								
								// Update select all checkbox state
								var totalCheckboxes = $('.row-checkbox').length;
								var checkedCheckboxes = $('.row-checkbox:checked').length;
								$('#selectAll').prop('checked', totalCheckboxes === checkedCheckboxes && totalCheckboxes > 0);
							});

							// Row click to toggle checkbox
							$(document).on('click', '.payroll-row', function(e) {
								// Don't toggle if clicking directly on checkbox
								if ($(e.target).is('input[type="checkbox"]')) {
									return;
								}
								var $checkbox = $(this).find('.row-checkbox');
								$checkbox.prop('checked', !$checkbox.prop('checked')).trigger('change');
							});

							// Function to get selected employee IDs for batch calculations
							window.getSelectedEmployeeIds = function() {
								var selectedIds = [];
								$('.row-checkbox:checked').each(function() {
									selectedIds.push($(this).data('employee-id'));
								});
								return selectedIds;
							};

							// Function to get selected rows data for batch calculations
							window.getSelectedPayrollRows = function() {
								var selectedRows = [];
								$('.payroll-row').has('.row-checkbox:checked').each(function() {
									var $row = $(this);
									var $cells = $row.find('td');
									var totalWageText = $cells.eq(13).text().trim();
									var totalWage = 0;
									
									// Parse total wage, handling $ and comma formatting
									if (totalWageText && totalWageText !== '-') {
										totalWage = parseFloat(totalWageText.replace(/[$,]/g, '')) || 0;
									}
									
									// Get state from row data attribute or default to CA
									var state = $row.data('state') || 'CA';
									
									if (totalWage > 0) {
										selectedRows.push({
											employeeId: $row.data('employee-id'),
											totalWage: totalWage,
											state: state,
											row: $row
										});
									}
								});
								return selectedRows;
							};
						});
					</script>

					<script>
						// Batch tax calculation function
						function batchCalculateTaxes() {
							debugger;
							var selectedRows = getSelectedPayrollRows();
							
							if (selectedRows.length === 0) {
								alert('Please select at least one employee for batch calculation.');
								return;
							}

							// Prepare payroll data for API call
							var payrollData = selectedRows.map(function(item) {
								return {
									employeeId: item.employeeId,
									totalWage: item.totalWage,
									state: item.state
								};
							});

							// Show loading indicator
							var $button = $('button:contains("Batch Calculations")');
							$button.prop('disabled', true).text('Calculating...');

							// Call batch calculation API
							$.ajax({
								url: '/api/payroll/batch-calculate',
								type: 'POST',
								contentType: 'application/json',
								data: JSON.stringify({ payrollData: payrollData }),
								success: function(response) {
									if (response.success && response.results) {
										// Update table with calculated tax values
										response.results.forEach(function(result) {
											var $row = $('.payroll-row[data-employee-id="' + result.employeeId + '"]');
											if ($row.length > 0) {
												// Add tax columns if they don't exist, or update existing ones
												var $cells = $row.find('td');
												
												// Check if tax columns already exist (after Total Wage column)
												if ($cells.length <= 14) {
													// Add tax columns
													$row.append(
														'<td class="federal-tax">$' + result.federalTax.toFixed(2) + '</td>' +
														'<td class="social-security-tax">$' + result.socialSecurityTax.toFixed(2) + '</td>' +
														'<td class="medicare-tax">$' + result.medicareTax.toFixed(2) + '</td>' +
														'<td class="state-tax">$' + result.stateTax.toFixed(2) + '</td>' +
														'<td class="state-disability-tax">$' + result.stateDisabilityTax.toFixed(2) + '</td>' +
														'<td class="total-deduction">$' + result.totalDeduction.toFixed(2) + '</td>' +
														'<td class="net-payment">$' + result.netPayment.toFixed(2) + '</td>'
													);
												} else {
													// Update existing tax columns
													$row.find('.federal-tax').text('$' + result.federalTax.toFixed(2));
													$row.find('.social-security-tax').text('$' + result.socialSecurityTax.toFixed(2));
													$row.find('.medicare-tax').text('$' + result.medicareTax.toFixed(2));
													$row.find('.state-tax').text('$' + result.stateTax.toFixed(2));
													$row.find('.state-disability-tax').text('$' + result.stateDisabilityTax.toFixed(2));
													$row.find('.total-deduction').text('$' + result.totalDeduction.toFixed(2));
													$row.find('.net-payment').text('$' + result.netPayment.toFixed(2));
												}
												
												// Highlight the row to show it was calculated
												$row.addClass('tax-calculated');
												setTimeout(function() {
													$row.removeClass('tax-calculated');
												}, 2000);
											}
										});
										
										alert('Tax calculations completed successfully for ' + response.results.length + ' employee(s).');
									} else {
										alert('Error calculating taxes: ' + (response.error || 'Unknown error'));
									}
								},
								error: function(xhr, status, error) {
									console.error('Batch calculation error:', error);
									alert('Error calculating taxes. Please try again.');
								},
								complete: function() {
									$button.prop('disabled', false).text('Batch Calculations');
								}
							});
						}

						function batchPrintPayroll() {
							alert('Batch print functionality will be implemented.');
						}
					</script>

					<style>
						.payroll-row.tax-calculated {
							background-color: #d4edda !important;
							transition: background-color 0.3s ease;
						}
					</style>

				</body>

				</html>

				<div id="selectemployeeDialog" style="display:none;">
					<p>
						<spring:message code="BzComposer.payroll.employee.problem" />
					</p>
				</div>

				<div id="selectPaymentMethodDialog" style="display:none;">
					<p>
						<spring:message code="BzComposer.payroll.PaymentMethod.problem" />
					</p>
				</div>

				<div id="emptyemployeetimesheetDialog" style="display:none;">
					<p>
						<spring:message code="BzComposer.payroll.emptyemployeetimesheet.problem" />
					</p>
				</div>