<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>BzPayroll - Employee Board</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"
	<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>

</head>
<style>
table th {
  font-size: 14px !important;
}
</style>
<script>
   $(document).ready(function () {
      $('#custTableBody').on('click', '.employee-col', function () {
         // Remove all styles from all rows
         $('.employee-col').css({
            'background-color': '',
            'color': '',
            'font-weight': ''
         });

         // Apply new styles to the clicked row
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
			console.log("Employee CSS ID:", employeeId);

			// Remove old styles from previously selected row
			if (tempcssid !== 0) {
				$('.employee-col-' + tempcssid).css({
					'background-color': '',
					'color': '',
					'font-weight': ''
				});
			}

			// Update tempcssid
			tempcssid = employeeId;

			// Add highlight styles to all columns of the clicked employee
			$('.employee-col-' + employeeId).css({
				'background-color': '#808080',
				'color': 'white',
				'font-weight': 'bold'
			});
		});
	});
</script>

<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#custTableBody2 tr").filter(
									function() {

										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#custTableBody tr").filter(
									function() {

										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>
<script>
	function toggleTabs() {
		const isChecked = document.getElementById('flexSwitchCheckDefault').checked;

		const activeTab = document.getElementById('active');
		const inactiveTab = document.getElementById('inactive');

		if (isChecked) {
			// Show Inactive
			activeTab.classList.remove('show', 'active');
			inactiveTab.classList.add('show', 'active');
		} else {
			// Show Active
			inactiveTab.classList.remove('show', 'active');
			activeTab.classList.add('show', 'active');
		}
	}
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#custTableBody')
								.on(
										'click',
										'.employee-row',
										function() {
											const employeeId = $(this).data(
													'id');
											console.log("Employee ID:",
													employeeId);

											if (!employeeId) {
												console
														.warn("No employee ID found on row.");
												return;
											}

											const apiUrl = `/api/employees/`
													+ employeeId;
											console.log("Calling:", apiUrl);

											$
													.ajax({
														url : apiUrl,
														type : 'GET',
														success : function(data) {
															console
																	.log(
																			"Employee Data:",
																			data);

															if (data) {
																$('select[name="title"]').val(data.title || 'Mr.');
																$('input[name="firstName"]').val(data.firstName || '');
																$('input[name="mi"]').val(data.mi || '');
																$('input[name="lastName"]').val(data.lastName || '');
																$('input[name="dateofBirth"]').val(data.dateofBirth ? data.dateofBirth.split('T')[0] : '');
																$('input[name="email"]').val(data.email || '');
																$('input[name="phone"]').val(data.phone || '');
																$('input[name="address1"]').val(data.address1 || '');
																$('input[name="address2"]').val(data.address2 || '');
																// For city
																$('input[name="cityReadOnly"]').val(data.city || '');
                                                               // For state
                                                               $('input[name="stateReadOnly"]').val(data.state || '');

																$('input[name="zipCode"]').val(data.zipCode || '');
																$('input[name="dateTerminated"]').val(data.dateTerminated ? data.dateTerminated.split('T')[0] : '');
																$('select[name="status"]').val(data.status || '');
																$('input[name="ssn"]').val(data.ssn || '');

                                                                // New fields
																$('input[name="fieldw9"]').prop('checked', data.fieldw9 === 'Yes');
																$('input[name="sameAsPhoneNo"]').prop('checked', (data.phone || '') === (data.cellPhone || ''));
																$('input[name="cellPhone"]').val(data.cellPhone || '');
																$('input[name="password"]').val(data.password || '');
																$('input[name="dateStarted"]').val(data.dateStarted ? data.dateStarted.split('T')[0] : '');
																$('input[name="dateAdded"]').val(data.dateAdded ? data.dateAdded.split('T')[0] : '');
																$('textarea[name="memo"]').val(data.memo || '');
																$('input[name="codeNumber"]').val(data.codeNumber || '');
																$('input[name="allowance"]').val(data.allowance || '');
																$('input[name="stateWorked"]').val(data.stateWorked || '');

                                                                $('input[name="id"]').val(data.id || '');
																$('input[name="payPeriod"][value="' + (data.payPeriod || '') + '"]').prop('checked', true);
                                                                $('select[name="jobTitle"]').val(data.jobTitle || '');
																$('input[name="amount"]').val(data.amount || '');

																$('input[name="hourlyRate"]').val(data.hourlyRate || '');
																$('input[name="monthlySalary"]').val(data.monthlySalary || '');
															    $('input[name="overtimeApplied"]').prop('checked', data.overtimeApplied === "Yes");
                                                                $('input[name="websiteAccess"]').prop('checked', data.websiteAccess === "Yes");
                                                                $('input[name="allowedUrl"]').prop('checked', data.allowedUrl === "Yes");
                                                                $('input[name="timeClockAccess"]').prop('checked', data.timeClockAccess === "Yes");
                                                                 $('input[name="fullTime"]').prop('checked', data.fullTime === "Yes");
                                                                 $('input[name="partTime"]').prop('checked', data.partTime === "Yes");
                                                                 $('input[name="w2Submitted"]').prop('checked', data.w2Submitted === "Yes");

                                                                 $('select[name="jobType"] option').filter(function () {
                                                                   return $(this).text() === (data.jobType || '');
                                                                    }).prop('selected', true);


                                                                 $('select[name="employeeStatus"]').val(data.employeeStatus || '');
                                                                 $('select[name="filingStatus"]').val(data.filingStatus || '');
                                                                  $('select[name="countryId"] option').filter(function () {
                                                                      return $(this).text() === (data.country || '');
                                                                  }).prop('selected', true);


															} else {
																console
																		.warn("No data returned");
															}
														},
														error : function(xhr) {
															console
																	.error(
																			"Failed to fetch employee:",
																			xhr.status,
																			xhr.responseText);
															alert('Employee data not found.');
														}

													});
										});
					});
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#custTableBody2')
								.on(
										'click',
										'.employee-row',
										function() {
											const employeeId = $(this).data(
													'id');
											console.log("Employee ID:",
													employeeId);

											if (!employeeId) {
												console
														.warn("No employee ID found on row.");
												return;
											}

											const apiUrl = `/api/employees/`
													+ employeeId;
											console.log("Calling:", apiUrl);

											$
													.ajax({
														url : apiUrl,
														type : 'GET',
														success : function(data) {
															console
																	.log(
																			"Employee Data:",
																			data);

															if (data) {
																                                                                  $('select[name="title"]').val(data.title || 'Mr.');
                                                                																$('input[name="firstName"]').val(data.firstName || '');
                                                                																$('input[name="mi"]').val(data.mi || '');
                                                                																$('input[name="lastName"]').val(data.lastName || '');
                                                                																$('input[name="dateofBirth"]').val(data.dateofBirth ? data.dateofBirth.split('T')[0] : '');
                                                                																$('input[name="email"]').val(data.email || '');
                                                                																$('input[name="phone"]').val(data.phone || '');
                                                                																$('input[name="address1"]').val(data.address1 || '');
                                                                																$('input[name="address2"]').val(data.address2 || '');
                                                                																// For city
                                                                																$('input[name="cityReadOnly"]').val(data.city || '');
                                                                                                                               // For state
                                                                                                                               $('input[name="stateReadOnly"]').val(data.state || '');

                                                                																$('input[name="zipCode"]').val(data.zipCode || '');
                                                                																$('input[name="dateTerminated"]').val(data.dateTerminated ? data.dateTerminated.split('T')[0] : '');
                                                                																$('select[name="status"]').val(data.status || '');
                                                                																$('input[name="ssn"]').val(data.ssn || '');

                                                                                                                                // New fields
                                                                																$('input[name="fieldw9"]').prop('checked', data.fieldw9 === 'Yes');
                                                                																$('input[name="sameAsPhoneNo"]').prop('checked', (data.phone || '') === (data.cellPhone || ''));
                                                                																$('input[name="cellPhone"]').val(data.cellPhone || '');
                                                                																$('input[name="password"]').val(data.password || '');
                                                                																$('input[name="dateStarted"]').val(data.dateStarted ? data.dateStarted.split('T')[0] : '');
                                                                																$('input[name="dateAdded"]').val(data.dateAdded ? data.dateAdded.split('T')[0] : '');
                                                                																$('textarea[name="memo"]').val(data.memo || '');
                                                                																$('input[name="codeNumber"]').val(data.codeNumber || '');
                                                                																$('input[name="allowance"]').val(data.allowance || '');
                                                                																$('input[name="stateWorked"]').val(data.stateWorked || '');

                                                                                                                                $('input[name="id"]').val(data.id || '');
                                                                																$('input[name="payPeriod"][value="' + (data.payPeriod || '') + '"]').prop('checked', true);
                                                                                                                                $('select[name="jobTitle"]').val(data.jobTitle || '');
                                                                																$('input[name="amount"]').val(data.amount || '');

                                                                																$('input[name="hourlyRate"]').val(data.hourlyRate || '');
                                                                																$('input[name="monthlySalary"]').val(data.monthlySalary || '');
                                                                															    $('input[name="overtimeApplied"]').prop('checked', data.overtimeApplied === "Yes");
                                                                                                                                $('input[name="websiteAccess"]').prop('checked', data.websiteAccess === "Yes");
                                                                                                                                $('input[name="allowedUrl"]').prop('checked', data.allowedUrl === "Yes");
                                                                                                                                $('input[name="timeClockAccess"]').prop('checked', data.timeClockAccess === "Yes");
                                                                                                                                 $('input[name="fullTime"]').prop('checked', data.fullTime === "Yes");
                                                                                                                                 $('input[name="partTime"]').prop('checked', data.partTime === "Yes");
                                                                                                                                 $('input[name="w2Submitted"]').prop('checked', data.w2Submitted === "Yes");

                                                                                                                                 $('select[name="jobType"] option').filter(function () {
                                                                                                                                   return $(this).text() === (data.jobType || '');
                                                                                                                                    }).prop('selected', true);

                                                                                                                                 $('select[name="employeeStatus"]').val(data.employeeStatus || '');
                                                                                                                                 $('select[name="filingStatus"]').val(data.filingStatus || '');
                                                                                                                                  $('select[name="countryId"] option').filter(function () {
                                                                                                                                      return $(this).text() === (data.country || '');
                                                                                                                                  }).prop('selected', true);
															} else {
																console
																		.warn("No data returned");
															}
														},
														error : function(xhr) {
															console
																	.error(
																			"Failed to fetch employee:",
																			xhr.status,
																			xhr.responseText);
															alert('Employee data not found.');
														}

													});
										});
					});
</script>
<script>
        $(document).ready(function () {

            $('#sellectCountry').on('change', function () {
                var id = $(this).val();
                console.log("Selected Country ID: " + id);

                $.ajax({
                    type: 'GET',
                    url: '/api/states',
                    data: { id: id },
                    dataType: 'json', //  Important: Expecting JSON
                    success: function (result) {

                        var s;
                        for (var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        }
                        $('#sellectState').html(s);
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", error);
                        console.log("Response Text:", xhr.responseText);
                    }
                });
            });




            $('#sellectState').on('change', function () {
                var id = $(this).val();
                console.log("Selected State ID: " + id);

                $.ajax({
                    type: 'GET',
                    url: '/api/cities',
                    data: { id: id }, // send as query param ?id=...
                    dataType: 'json', // expecting JSON from server
                    success: function (result) {
                        var s;
                        for (var i = 0; i < result.length; i++) {
                            console.log("Loop ID: " + i);
                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        }
                        $('#sellectDistrict').html(s);
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", error);
                        console.log("Response Text:", xhr.responseText);
                    }
                });

            });
        });
    </script>
<script>
function redirectToAddEmployee(event) {
  event.preventDefault();
  const url = '/add-new-employee_board';
  maximizePopup(url, 'AddEmployeePopup');
}

function maximizePopup(url, windowName) {
  const popup = window.open(
    url,
    windowName,
    `scrollbars=yes,resizable=yes,toolbar=no,location=no,menubar=no,status=no,left=0,top=0,width=${screen.availWidth},height=${screen.availHeight}`
  );

  if (popup) {
    popup.moveTo(0, 0);
    popup.resizeTo(screen.availWidth, screen.availHeight);
    popup.focus();
  } else {
    alert("Please allow popups for this site.");
  }
}
</script>

  <script>

  let selectedEmployeeId = null;

  $(document).on('click', '#custTableBody .employee-row', function () {
      selectedEmployeeId = $(this).data('id');
      console.log("Selected Employee ID:", selectedEmployeeId);
  });
  $(document).on('click', '#custTableBody2 .employee-row', function () {
        selectedEmployeeId = $(this).data('id');
        console.log("Selected Employee ID:", selectedEmployeeId);
    });

  function redirectToEditEmployee(event) {
      event.preventDefault();

      if (selectedEmployeeId !== null) {
          const url = `/edit-employee-board?employeeId=` + selectedEmployeeId;
          maximizePopup(url, "EditEmployeePopup");
      } else {
          alert("Please select an employee to edit.");
      }
  }


  function redirectToDeleteEmployee(event) {
      event.preventDefault();

      if (selectedEmployeeId !== null) {
          const url = `/delete-employee-board/` + selectedEmployeeId;
          window.location.href = url;
      } else {
          alert("Please select an employee to delete.");
      }
  }
  function maximizePopup(url, windowName) {
         const popup = window.open(
           url,
           windowName,
           `scrollbars=yes,resizable=yes,toolbar=no,location=no,menubar=no,status=no,left=0,top=0`
         );

         // Resize to full screen after load
         const resizeInterval = setInterval(() => {
           if (popup && !popup.closed) {
             popup.moveTo(0, 0);
             popup.resizeTo(screen.availWidth, screen.availHeight);
             clearInterval(resizeInterval);
           }
         }, 100);
       }
  </script>

<style>
.selected-row {
	background-color: #808080;
        color: white;
        font-weight: bold;
}

.employee-row {
	border-bottom: 1px solid #ccc;
	cursor: pointer;
}
</style>
<body onload="initialize();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<div>
							<div style="float: left;">
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									Employee Board
									<c:if
                                    test="${not empty message}">
                                    <br /> ${message}
                                    </c:if>
									</span>
								<table>
									<tr>
										<td></td>
										<td></td>
										<td colspan="4">&nbsp;</td>
									</tr>
								</table>
								<table>
									<tr>
										<td><spring:message code="BzComposer.searchbuttontext" />
										</td>
										<td><input style="font-size: 13px;" type="text" id="myInput"></td>
										<td colspan="4">&nbsp;</td>
									</tr>
								</table>
								<br>
							</div>
							<div
								style="display: flex; justify-content: flex-end; align-items: flex-end; height: 100px;">
								<table>
									<tr align="right">

										<td colspan="8" style="font-size: 14px;">
										<input style="font-size: 13px;"
                                        type="button" name="addAction"
                                        value='Add'
                                        title='Add the selected vendor'
                                        class="formButton" onclick="redirectToAddEmployee(event)">
										<input style="font-size: 13px;"
											type="button" name="editAction"
											value='<spring:message code="BzComposer.global.edit" />'
											title='<spring:message code="BzComposer.vendorlist.edittooltip" />'
											class="formButton" onclick="redirectToEditEmployee(event)">

											 <input style="font-size: 13px;"
											type="button" name="deleteAction"
											value='<spring:message code="BzComposer.global.delete" />'
											title='<spring:message code="BzComposer.vendorlist.deletetooltip" />'
											class="formButton" onclick="redirectToDeleteEmployee(event)"></td>
									</tr>
								</table>
							</div>
						</div>
						<!-- dialog space -->
						<!-- Dialog used in vendor list page -->
						<div id="showSelectVendorDialog" style="display: none;">
							<p>
								<spring:message code="BzComposer.vendorlist.selectvendordialog" />
							</p>
						</div>
						<div id="emptyemployeeidDialog" style="display: none;">
							<p>
								<spring:message code="BzComposer.Employee.emptyEmployeeDialog" />
							</p>
						</div>

						<div id="deleteVendorDialog" style="display: none;">
							<p>
								<spring:message
									code="BzComposer.vendorlist.selectvendortodelete" />
							</p>
						</div>
						<div id="deleteRowDialog" style="display: none;">
							<p>
								<spring:message
									code="BzComposer.employee.deleteselectedemployee" />
							</p>
						</div>
						<div>
							<hidden path="clientVendorID" Id="clientVendorID" />
							<hidden path="selectedRowID" />
							<input style="font-size: 13px;" type="hidden" id="employeeId" value="" /> <input style="font-size: 13px;"
								type="hidden" name="venrId" id="venrId" value="" /> <input style="font-size: 13px;"
								type="hidden" name="cvId" id="cvId" value="" /> <input style="font-size: 13px;"
								type="hidden" name="tabid" id="tabid" value="" /> <input style="font-size: 13px;"
								type="hidden" name="SelectedRID" id="setRID" value=""> <input style="font-size: 13px;"
								type="hidden" name="bst" id="bsst" value="0" />
							<hidden path="state" value="0" />
							<hidden path="bsstate" value="0" />
							<hidden path="shstate" value="0" />
						</div>
						<!-- end Contents -->
						<input style="font-size: 13px;" type="hidden" name="actionValidate" value="vendor.jsp">
						<table style="width: 100%;">
							<tr>
								<td style="font-size: 14px;">
									<table class="tabla-listados" cellspacing="0"
										style="margin-top: 0; margin-left: 20px;">
										<tr>
											<td>
												<table cellspacing="0" style="border: 0; width: 100%;"
													class="section-border">
													<thead>
														<tr id="css1">
															<th>Employee List</th>

														</tr>
													</thead>
												</table>

												<div
													class="d-flex justify-content-between align-items-center px-3 py-2 mb-3"
													style="background-color: #f8f9fa; border-radius: 6px;">
													<label class="form-check-label mb-0"
														for="flexSwitchCheckDefault">View: Active /
														Inactive:</label>
													<div class="form-check form-switch">
														<input style="font-size: 13px;" class="form-check-input" type="checkbox"
															id="flexSwitchCheckDefault" onchange="toggleTabs()">
													</div>
												</div>



												<div style="height: 580px; overflow-y: auto;">
													<div class="tab-content" id="employeeTabsContent">
														<!-- Active Tab -->
														<div class="tab-pane fade show active" id="active"
															role="tabpanel">
															<div class="table-responsive">
																<table cellspacing="0" style="border: 0; width: 100%;"
																	   class="section-border">
																	<thead class="table-light">
																		<tr>
																			<th>Employee Name</th>
																		</tr>
																	</thead>
																	<tbody id="custTableBody">
																		<c:forEach var="emp" items="${employeesIdNameDtoList}">
																			<tr class="employee-row"
																				data-id="${emp.id}">
																				<td class="employee-col" style="padding: 10px; font-size: 13px;">
																					${empty emp.firstName ? '' : emp.firstName}
																					${empty emp.lastName ? '' : emp.lastName}</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="tab-pane fade" id="inactive" role="tabpanel">
															<div class="table-responsive">
																<table cellspacing="0" style="border: 0; width: 100%;"
																	   class="section-border">

																	<thead>
																		<tr>
																			<td style="background-color: #bfc2c5; font-weight:bold;">Employee Name</td>
																			<td style="background-color: #bfc2c5; font-weight:bold;">Full/Part Time</td>
																			<td style="background-color: #bfc2c5; font-weight:bold;">Salary/Hourly/Daily</td>
																			<td style="background-color: #bfc2c5; font-weight:bold;">Regular/Contractor</td>
																		</tr>
																	</thead>
																	<tbody id="custTableBody2">
																		<c:forEach var="employeeInfo"
																			items="${employeeInfoDTOList}">
																			<tr class="employee-row"
																				data-id="${employeeInfo.id}"
																				style="border-bottom: 1px solid #ccc; cursor: pointer;">
																				<td class="employee-col-${employeeInfo.id}">${employeeInfo.employeeName}</td>
																				<td class="employee-col-${employeeInfo.id}"></td>
																				<td class="employee-col-${employeeInfo.id}">${employeeInfo.salaryOrHourlyOrDaily}</td>
																				<td class="employee-col-${employeeInfo.id}"></td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</td>




											<td
												style="font-size: 14px; margin: 0; padding: 0; vertical-align: 0;">
												<c:if test="${not empty empList1}"></c:if>
												<div id="table-negotiations">
													<table cellspacing="0" style="border: 0; width: 100%;"
														class="section-border">
														<tr>
															<td colspan="8">
																<table cellspacing="0" style="border: 0; width: 100%;"
																	class="section-border">
																	<thead>
																		<tr id="css1">
																			<th colspan="8"><spring:message
																					code="BzComposer.Employee.GeneralInformation" /></th>

																		</tr>
																	</thead>
																</table>
															</td>
														</tr>
														<tr>
                                                         <tr>
                                                            <td colspan="8" c:if test="${status != null}">
                                                            <!-- Success Message -->
                                                            																<c:if test="${status == true}">
                                                            																	<c:if test="${not empty message}">
                                                            																		<div
                                                            																			class="alert alert-primary alert-dismissible fade show"
                                                            																			role="alert">
                                                            																			<button type="button" class="close"
                                                            																				data-dismiss="alert" aria-label="Close">
                                                            																				<span aria-hidden="true">&times;</span>
                                                            																			</button>
                                                            																			${message}
                                                            																		</div>
                                                            																	</c:if>
                                                            																</c:if>
                                                            																<!-- Error Message -->
                                                            																<c:if test="${status == false}">
                                                            																	<c:if test="${not empty message}">
                                                            																		<div
                                                            																			class="alert alert-danger alert-dismissible fade show"
                                                            																			role="alert">
                                                            																			<button type="button" class="close"
                                                            																				data-dismiss="alert" aria-label="Close">
                                                            																				<span aria-hidden="true">&times;</span>
                                                            																			</button>
                                                            																			${message}
                                                            																		</div>
                                                            																	</c:if>
                                                            																</c:if>
                                                            </td>
                                                         </tr>
															<tr>
																<td width="10%" style="padding-right: 10px;">Employee
																	ID:
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="id" class="form-control" readonly /></td>
																<td colspan="6"></td>
															</tr>
															<tr>
																<td style="padding-right: 10px;">Title: </td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="title" class="form-select" >

																		<option value="Mr.">Mr.</option>
																		<option value="Mrs.">Mrs.</option>
																		<option value="Ms.">Ms.</option>
																		<option value="Dr.">Dr.</option>
																		<option value="Prof.">Prof.</option>
																</select></td>

																<td width="100px;" style="padding-right: 10px;">First
																	Name: <span class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="firstName" class="form-control" required /></td>

																<td style="padding-right: 10px;">M.I.:</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="mi" class="form-control"
																	style="width: 70px;" /></td>

																<td width="100px;" style="padding-right: 10px;">Last
																	Name: <span class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span>
																</td>

																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="lastName" class="form-control" required /></td>

															</tr>


															<tr>


																<td style="padding-right: 10px;">SSN:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="ssn" class="form-control" /></td>

																<td style="padding-right: 10px;font-size: 13px;">Date Of Birth:</td>
																<td style="padding-right: 10px;font-size: 13px;"><input style="font-size: 13px;" type="date"
																	name="dateofBirth" class="form-control" 
																	placeholder="dd-mm-yyyy" required /></td>

																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>


															<tr>
																<td style="padding-right: 10px;">Job Title:</td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="jobTitle" class="form-select" required>
																		<c:forEach var="bcpJobtitle"
																			items="${bcpJobtitleList}">
																			<option value="${bcpJobtitle.jobTitle}">&nbsp;&nbsp;&nbsp;  ${bcpJobtitle.jobTitle}</option>
																		</c:forEach>
																</select></td>

																<td style="padding-right: 10px;">Employee Status:</td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="employeeStatus" class="form-select" required>
																		<c:forEach var="employeeType"
																			items="${bcpEmployeetypeList}">
																			<option value="${employeeType.employeeType}">${employeeType.employeeType}</option>
																		</c:forEach>
																</select></td>
																<td style="padding-right: 10px;">Job Type: 
																</td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="jobType" class="form-select" required>
																		<c:forEach var="role" items="${employeeRoles}">
																			<option value="\${role}">${role}</option>
																		</c:forEach>
																</select></td>

																<td colspan="2"><label> W-9 Field: <input style="font-size: 13px;"
																		type="checkbox" name="fieldw9" value="Yes" />
																</label></td>

															</tr>
                                                               <tr>
																<td style="padding-right: 10px;">Address1:</td>
																<td colspan="3" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="text" name="address1" class="form-control"
																	style="width: 100%;" required /></td> <td></td><td></td><td></td><td></td>
                                                            </tr>
                                                             <tr>
																<td style="padding-right: 10px;">Address2:</td>
																<td colspan="3" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="text" name="address2" class="form-control"
																	style="width: 100%;" /></td><td></td><td></td><td></td><td></td>
															</tr>
															<tr>

																<td style="padding-right: 10px;">Zip Code:</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="zipCode" class="form-control" required /></td>
																<td style="padding-right: 10px;">City:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="cityId" id="sellectDistrict" class="form-select"
																	>

																		<option value="">--Select--</option>
																</select></td>
																<td style="padding-right: 10px;">State:</td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="stateId" id="sellectState" >
																		<option value="">--State--</option>
																</select></td>
																<td style="padding-right: 10px;">Country:</td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	id="sellectCountry" name="countryId"
																	class="form-select" >
																		<option value="231">United States</option>
																		<c:forEach var="bcpcountries" items="${countries}">
																			<option value="${bcpcountries.id}">${bcpcountries.name}</option>
																		</c:forEach>
																</select></td>
															</tr>


															<tr>




																<td style="padding-right: 10px;">Phone:</td>
																<td colspan="2" style="padding-right: 10px;">
                                                                  <input
                                                                    type="tel"
                                                                    id="phone"
                                                                    name="phone"
                                                                    class="form-control"
                                                                    style="font-size: 13px;"
                                                                    placeholder="1(213)732-9638"
                                                                    pattern="^1\(\d{3}\)\d{3}-\d{4}$"
                                                                    maxlength="14"
                                                                    title="Format: 1(213)732-9638">
                                                                </td>

																<td colspan="2"><label> Same as the mobile
																		number: <input style="font-size: 13px;" type="checkbox" name="sameAsPhoneNo" id="sameAsPhone"
																		onclick="copyMobileToPhone()" />
																</label></td>
																<td style="padding-right: 10px;">Mobile:</td>
																<td colspan="2" style="padding-right: 10px;">
                                                                  <input
                                                                    type="tel"
                                                                    name="cellPhone"
                                                                    id="mobile"
                                                                    class="form-control"
                                                                    style="font-size: 13px;"
                                                                    placeholder="1(213)732-9638"
                                                                    pattern="^1\(\d{3}\)\d{3}-\d{4}$"
                                                                    maxlength="14"
                                                                    title="Format: 1(213)732-9638">
                                                                </td>



															</tr>

															<tr>
																<td style="padding-right: 10px;">Email:</td>
																<td colspan="3" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="email" name="email" class="form-control" required /></td>

																<td style="padding-right: 10px;">Password:

																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="password" id="password" name="password"
																	class="form-control"  /></td>

																<td style="padding-right: 10px;">Date of Started:</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="date"
																	name="dateStarted" class="form-control" required /></td>

															</tr>


															<tr>
																<td style="padding-right: 10px;">Memo:</td>
																<td colspan="3"><textarea name="memo" rows="3"
																		class="form-control" style="font-size: 13px;"></textarea></td>
																<td style="padding-right: 10px;">Date Added:</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="date"
																	name="dateAdded" class="form-control date-field"
																	 /></td>
																<td style="padding-right: 10px;">Terminated Date:</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="date"
																	name="dateTerminated" class="form-control" /></td>
															</tr>
														<tr>
															<td colspan="8">
															<div class="panel-header"
																 style="background-color: #D3D3D3;">
																<strong>&nbsp;&nbsp;bzcomposer.com</strong>

															</div>
															</td>
														</tr>
														<tr>

															<td colspan="2" style="padding-right: 10px;"><label>Website
																	Access: <input style="font-size: 13px;" type="checkbox"
																	name="websiteAccess" value="Yes" />
															</label></td>


															<td colspan="5" style="padding-right: 10px;"><input style="font-size: 13px;"
																type="text" value="https://bzcomposer.com/" name=""
																class="form-control" readonly /></td>
																<td width="10%" style="padding-right: 10px;"><label>Allowed
                                                                URL: <input style="font-size: 13px;" type="checkbox" name="allowedUrl"
                                                                value="Yes" />
                                                               </label></td>

															</tr>


															<tr>
																<td colspan="8">
																<div class="panel-header"
																style="background-color: #D3D3D3;">
																<strong>&nbsp;&nbsp;Time Clock</strong>
                                                                 </div>
                                                                 </td>
															</tr>


														<tr>
															<td colspan="2" style="padding-right: 10px;"><label>Time
																	Clock Access: <input style="font-size: 13px;" type="checkbox"
																	name="timeClockAccess" value="Yes" />
															</label></td>
															<td style="padding-right: 10px;">Code Number:
															</td>
															<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																name="codeNumber" class="form-control" /></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>


															<tr>
																<td colspan="8">
																<div class="panel-header"
																style="background-color: #D3D3D3;">
																<strong>&nbsp;&nbsp;PayRoll & Tax Info</strong>
                                                               </div>
                                                               </td>
															</tr>


															<tr>
																<td style="padding-right: 10px;">Filing Status:
																</td>
																<td style="padding-right: 10px;" ><select style="font-size: 13px;"
																	name="filingStatus" class="form-select">
                                                                        <option value="Single">Single</option>
																		<option value="Married">Married</option>
																		<option value="Unmarried head of household">Unmarried head of household</option>

																		<c:forEach var="filingstatuses"
																			items="${bcpFilingstatuses}">
																			<option value="${filingstatuses.filingStatusId}">${filingstatuses.filingStatus}</option>
																		</c:forEach>
																</select>
																</td>

																<td style="padding-right: 10px;">Allowance:
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="allowance" class="form-control"
																	min="0" required /></td>

																<td style="padding-right: 10px;">State Worked:
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="stateWorked" class="form-control" maxlength="2"
																	 /></td>
																<td colspan="2" style="padding-right: 10px;"><label>
																		W-2 Submitted: <input style="font-size: 13px;" type="checkbox"
																		name="w2Submitted" value="Yes" />
																</label></td>
															</tr>
															<tr>
																<td style="padding-right: 10px;">Pay Period:
																</td>
																<td style="padding-right: 10px;"><label><input style="font-size: 13px;"
																		type="radio" name="payPeriod" value="Hourly" required />
																		Hourly</label> <label><input style="font-size: 13px;" type="radio"
																		name="payPeriod" value="Daily" /> Daily</label> <label><input style="font-size: 13px;"
																		type="radio" name="payPeriod" value="Salary" />
																		Salary</label></td>
																<td style="padding-right: 10px;">Amount:
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="amount" class="form-control"
																	 /></td>

																<td style="padding-right: 10px;"><label><input style="font-size: 13px;"
																		type="checkbox" name="fullTime" value="Yes" />
																		Full Time</label></td>

																<td style="padding-right: 10px;"><label><input style="font-size: 13px;"
																		type="checkbox" name="partTime" value="Yes" />
																		Part Time</label></td>
																<td></td>
																<td></td>

															</tr>

															<tr>
																<td style="padding-right: 10px;">Hourly Rate:
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="hourlyRate" class="form-control"
																	 /></td>

																<td style="padding-right: 10px;"><label><input style="font-size: 13px;"
																		type="checkbox" name="overtimeApplied" value="Yes" />
																		Overtime Applied</label></td>
																<td style="padding-right: 10px;">Monthly Salary:
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="monthlySalary" class="form-control"
																	 /></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>


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
	</div>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"></script>

	<script>
        const phoneInputField = document.querySelector("#phone");
        const mobileInputField = document.querySelector("#mobile");

        // Initialize intlTelInput
        const phoneInput = window.intlTelInput(phoneInputField, {
            initialCountry: "us",
            preferredCountries: ["us", "in", "gb"],
            separateDialCode: true,
            nationalMode: false,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
        });

        const mobileInput = window.intlTelInput(mobileInputField, {
            initialCountry: "us",
            preferredCountries: ["us", "in", "gb"],
            separateDialCode: true,
            nationalMode: false,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
        });

        // Allow only numbers
        function allowOnlyNumbers(inputField) {
            inputField.addEventListener("input", function () {
                this.value = this.value.replace(/\D/g, ""); // Remove all non-digits
            });
        }

        allowOnlyNumbers(phoneInputField);
        allowOnlyNumbers(mobileInputField);

        // Validate on submit
        function validateNumber(inputField, iti) {
            if (!iti.isValidNumber()) {
                alert("Please enter a valid phone number");
                return false;
            }
            return true;
        }

        document.querySelector("form").addEventListener("submit", function (e) {
            if (!validateNumber(phoneInputField, phoneInput) ||
                !validateNumber(mobileInputField, mobileInput)) {
                e.preventDefault(); // stop form submission
            }
        });
    </script>

	<script>
    		const phoneField = document.getElementById("phone");
    		const mobileField = document.getElementById("mobile");
    		const checkbox = document.getElementById("sameAsPhone");

    		checkbox.addEventListener("change", function() {
    			if (this.checked) {
    				mobileField.value = phoneField.value; // Copy phone to mobile
    				mobileField.readOnly = true; // Make mobile read-only

    			} else {
    				mobileField.readOnly = false; // Remove read-only
    				mobileField.value = ""; // Clear mobile field

    			}
    		});
    	</script>

</body>
</html>
<!-- dialog box that used in this page -->
