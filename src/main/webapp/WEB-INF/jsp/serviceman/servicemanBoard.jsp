<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/emp/headlogo3.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>BzComposer - Serviceman Board</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"
	<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
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
.ui-tabs .ui-tabs-nav {
  display: flex;
  justify-content: center; /* centers horizontally */
  gap: 5px; /* space between tabs */
  padding: 0;
  margin: 0 auto;
  width: 100%; /* full width container */
}

.ui-tabs .ui-tabs-nav li {
  flex: 1; /* all tabs take equal space */
  max-width: 200px; /* optional limit */
  text-align: center;
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
#formCustomization {

  margin-right: 5px; /* center it horizontally */
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

                                                                $('input[name="employeeIndexId"]').val(data.employeeIndexId || '');
																$('input[name="payPeriod"][value="' + (data.payPeriod || '') + '"]').prop('checked', true);
                                                                $('select[name="jobTitleId"]').val(data.jobTitleId || '');
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


                                                                 $('select[name="employeeTypeId"]').val(data.employeeTypeId || '');
                                                                 $('select[name="filingStatusId"]').val(data.filingStatusId || '');
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

                                                                                                                                $('input[name="employeeIndexId"]').val(data.employeeIndexId || '');
                                                                																$('input[name="payPeriod"][value="' + (data.payPeriod || '') + '"]').prop('checked', true);
                                                                                                                                $('select[name="jobTitleId"]').val(data.jobTitleId || '');
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

                                                                                                                                 $('select[name="employeeTypeId"]').val(data.employeeTypeId || '');
                                                                                                                                 $('select[name="filingStatusId"]').val(data.filingStatusId || '');
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
          const url = `/edit-serviceman-board?employeeId=` + selectedEmployeeId;
          maximizePopup(url, "EditEmployeePopup");
      } else {
          alert("Please select an employee to edit.");
      }
  }

  function redirectToDeleteEmployee(event) {
      event.preventDefault();

      if (selectedEmployeeId !== null) {
          const url = `/delete-serviceman-board/` + selectedEmployeeId;
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
  <script>
  $(function() {
    $("#tabs").tabs({ active: 0 });
  });
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
							<div style="float:">
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									Serviceman Board </span>
							<!--	<table>
									<tr>
										<td></td>
										<td></td>
										<td colspan="4">&nbsp;</td>
									</tr>
								</table> -->



								<br>
							</div>

							<form action="searchEmployee" method="get" class="d-flex flex-wrap">
                              <input type="text" name="name" placeholder="Name" class="form-control m-1" style="font-size: 12px; flex:1 1 150px;" />
                              <input type="text" name="address" placeholder="Address" class="form-control m-1" style="font-size: 12px; flex:1 1 150px;" />
                              <input type="text" name="city" placeholder="City" class="form-control m-1" style="font-size: 12px; flex:1 1 120px;" />
                              <input type="text" name="state" placeholder="State" class="form-control m-1" style="font-size: 12px; flex:1 1 80px;" />
                              <input type="text" name="zip" placeholder="Zip" class="form-control m-1" style="font-size: 12px; flex:1 1 100px;" />
                              <input type="text" name="searchPhone" placeholder="Phone" class="form-control m-1" style="font-size: 12px; flex:1 1 140px;" />
                              <input type="text" name="searchEmail" placeholder="Email" class="form-control m-1" style="font-size: 12px; flex:1 1 160px;" />

                              <button type="submit" class="formbutton" style="padding:3px 8px;">Go</button>
                            </form>







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

										 <!-- Combined: Search Bar + Show Entries in one row -->
                                              <tr>
                                                  <div style="display: flex; justify-content: space-between; align-items: center; width: 100%; gap: 20px;">

                                                            <!-- Left: Show Entries -->


                                                                                       <!-- Right: Search Bar -->
                                                                        <div style="display: flex; align-items: center; gap: 10px; margin:5px;">
                                                                                         <label for="myInput">
                                                                                           <spring:message code="BzComposer.searchbuttontext" />
                                                                                         </label>
                                                                                         <input style="font-size: 13px;" type="text" id="myInput">
                                                                        </div>
                                                                         <div style="display: flex; align-items: center; gap: 5px; margin:5px;">

                      				 <input type="button" name="editAction" class="formbutton" style="padding: 7 15px;"
                      				value='<spring:message code="BzComposer.global.edit" />'
                      				title='<spring:message code="BzComposer.vendorlist.edittooltip" />'
                      				 onclick="redirectToEditEmployee(event)">



                      				<input style="padding: 7 15px;" class="formbutton"
                      				type="button" name="deleteAction"
                      				value='<spring:message code="BzComposer.global.delete" />'
                      				title='<spring:message code="BzComposer.vendorlist.deletetooltip" />'
                      				 onclick="redirectToDeleteEmployee(event)"></td>



                                                                         </div>

                                                     </div>
                                                </tr>
						         </tr>
										<td>
												<table cellspacing="0" style="border: 0; width: 100%;"
													class="section-border">
													<tr>
													    <td>  </td>
													    <td> </td>
													</tr>
													<thead>
														<tr id="css1">
															<th>Employee List</th>

														</tr>
													</thead>
												</table>




<div>
  <div id="formCustomization">
    <div id="tabs">
      <ul>
        <li><a href="#active">Active</a></li>
        <li><a href="#inactive">Inactive</a></li>
      </ul>



												<div style="height: 595px; overflow-y: auto;">
													<div class="tab-content" id="employeeTabsContent">
														<!-- Active Tab -->
														<div class="tab-pane fade show active" id="active"
															role="tabpanel">
															<div class="table-responsive">
																<table cellspacing="0" style="border: 0; width: 100%;"
																	   class="section-border">
																	<tbody>
                                                                      <tr>
                                                                        <th><hr style="border:1px solid black; margin:0;"></th>
                                                                      </tr>
                                                                    </tbody>
																	<tbody id="custTableBody">
																		<c:forEach var="emp" items="${employeesIdNameDtoList}">
																			<tr class="employee-row"
																				data-id="${emp.employeeIndexId}">
																				<td class="employee-col" style="padding: 10px; font-size: 13px;">
																					${empty emp.employeeIndexId ? '' : emp.employeeIndexId} :
																					${empty emp.firstName ? '' : emp.firstName}
																					${empty emp.lastName ? '' : emp.lastName}</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="tab-pane fade show active" id="inactive" role="tabpanel">
															<div class="table-responsive">
																<table cellspacing="0" style="border: 0; width: 100%;"
																	   class="section-border">

																	<tbody>
                                                                                                                                          <tr>
                                                                                                                                            <th><hr style="border:1px solid black; margin:0;"></th>
                                                                                                                                          </tr>
                                                                                                                                        </tbody>
																	<tbody id="custTableBody2">
																		<c:forEach var="employeeInfo"
																			items="${employeeInfoDTOList}">
																			<tr class="employee-row"
																				data-id="${employeeInfo.employeeIndexId}"
																				style="border-bottom: 1px solid #ccc; cursor: pointer;">
																				<td style="padding: 10px; font-size: 13px;" class="employee-col-${employeeInfo.employeeIndexId}">
																				${empty employeeInfo.employeeIndexId ? '' : employeeInfo.employeeIndexId} :

																				${empty employeeInfo.firstName ? '' : employeeInfo.firstName}
                                                                                ${empty employeeInfo.lastName ? '' : employeeInfo.lastName}</td>
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
																	ID:<span class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="employeeIndexId" class="form-control" readonly /></td>
																<td colspan="6"></td>
															</tr>
															<tr>


																<td width="100px;" style="padding-right: 10px;">First
																	Name: <span class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span>
																</td>
																<td style="padding-right: 10px;" colspan="2"><input style="font-size: 13px;" type="text"
																	name="firstName" class="form-control" required /></td>

																<td style="padding-right: 10px;">M.I.:</td>

																<td style="padding-right: 10px;"><input style="font-size:13px; width:70px;" type="text"
																	name="mi" class="form-control"
																	style="width: 70px;"  maxlength="5" /></td>
																	<td>Last
																	Name: <span class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span>
																</td>

																<td style="padding-right: 10px;" colspan="2"><input style="font-size: 13px; width: 275px;" type="text"
																	name="lastName" class="form-control" required /></td>


															</tr>
                                                            <tr>
																<td style="padding-right: 10px;">Job Title:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="jobTitleId" class="form-select" required>

																		<c:forEach var="bcpJobtitle"
																			items="${bcpJobtitleList}">
																			<option value="${bcpJobtitle.jobTitleId}">&nbsp;&nbsp;&nbsp;  ${bcpJobtitle.jobTitle}</option>
																		</c:forEach>
																</select></td>


																<td style="padding-right: 10px;">Job Type: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	name="jobType" class="form-select" required>

																		<c:forEach var="role" items="${employeeRoles}">
																			<option value="\${role}">${role}</option>
																		</c:forEach>
																</select></td>

																<td colspan="4"><label> W-9 Field: <input style="font-size: 13px;"
																		type="checkbox" name="fieldw9" value="Yes" />
																</label></td>

															</tr>

															<tr>

																<td style="padding-right: 10px;">Zip:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="zipCode" class="form-control" required /></td>
																<td style="padding-right: 10px;">City:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><span><input style="background-color:#f0f0f0;" type="text" name="cityReadOnly" readonly/></span><select style="font-size: 13px;"
																	name="cityId" id="sellectDistrict" class="form-select"
																	required>

																		<option value="">--Select--</option>
																</select></td>
																<td style="padding-right: 10px;">State:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><span><input style="background-color:#f0f0f0;" type="text" name="stateReadOnly" readonly/></span><select style="font-size: 13px;"
																	name="stateId" id="sellectState" required>
																		<option value="">--State--</option>
																</select></td>
																<td style="padding-right: 10px;">Country:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td style="padding-right: 10px;"><select style="font-size: 13px;"
																	id="sellectCountry" name="countryId"
																	class="form-select" required>
																		<option value="231">United States</option>
																		<c:forEach var="bcpcountries" items="${countries}">
																			<option value="${bcpcountries.id}">${bcpcountries.name}</option>
																		</c:forEach>
																</select></td>
															</tr>

															<tr>


																<td style="padding-right: 10px;">Address1:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td colspan="3" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="text" name="address1" class="form-control"
																	style="width: 100%;" required /></td>


																<td style="padding-right: 10px;">Address2:</td>
																<td colspan="3" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="text" name="address2" class="form-control"
																	style="width: 100%;" /></td>
															</tr>
															<tr>




																<td style="padding-right: 10px;">Phone:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></td>
																<td colspan="2" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="tel" id="phone" name="phone" class="form-control"
																	required></td>
																<td colspan="2"><label> Same as the mobile
																		number: <input style="font-size: 13px;" type="checkbox" name="sameAsPhoneNo" id="sameAsPhone"
																		onclick="copyMobileToPhone()" />
																</label></td>
																<td style="padding-right: 10px;">Mobile:</td>
																<td colspan="2" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="tel" name="cellPhone" id="mobile"
																	class="form-control" /></td>


															</tr>

															<tr>
																<td style="padding-right: 10px;">Email:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span></td>
																<td colspan="3" style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="email" name="email" class="form-control" required /></td>

																<td style="padding-right: 10px;">Password: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="password" id="password" name="password"
																	class="form-control" required /></td>

																<td style="padding-right: 10px;">Date of Started:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span></td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="date"
																	name="dateStarted" class="form-control" required /></td>

															</tr>


															<tr>
																<td style="padding-right: 10px;">Memo:</td>
																<td colspan="3"><textarea name="memo" rows="3"
																		class="form-control" style="font-size: 13px;"></textarea></td>
																<td style="padding-right: 10px;">Date Added:<span
																	class="inputHighlighted"><spring:message
																			code="BzComposer.CompulsoryField.Validation" /></span></td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="date"
																	name="dateAdded" class="form-control date-field"
																	required /></td>
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

															<td width="10%" style="padding-right: 10px;"><label>Allowed
																	URL: <input style="font-size: 13px;" type="checkbox" name="allowedUrl"
																	value="Yes" />
															</label></td>
															<td colspan="2" style="padding-right: 10px;"><input style="font-size: 13px;"
																type="text" value="https://bzcomposer.com/" name=""
																class="form-control" readonly /></td>
															<td></td>
															<td></td>
															<td></td>
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
															<td style="padding-right: 10px;">Code Number: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																name="codeNumber" class="form-control" required /></td>
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
																<td style="padding-right: 10px;">Filing Status: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;" ><select style="font-size: 13px;"
																	name="filingStatusId" class="form-select" required>

																		<c:forEach var="filingstatuses"
																			items="${bcpFilingstatuses}">
																			<option value="${filingstatuses.filingStatusId}">${filingstatuses.filingStatus}</option>
																		</c:forEach>
																</select>
																</td>

																<td style="padding-right: 10px;">Allowance: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="allowance" class="form-control"
																	min="0" required /></td>

																<td style="padding-right: 10px;">State Worked: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;" type="text"
																	name="stateWorked" class="form-control" maxlength="2"
																	required /></td>
																<td colspan="2" style="padding-right: 10px;"><label>
																		W-2 Submitted: <input style="font-size: 13px;" type="checkbox"
																		name="w2Submitted" value="Yes" />
																</label></td>
															</tr>
															<tr>
																<td style="padding-right: 10px;">Pay Period: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><label><input style="font-size: 13px;"
																		type="radio" name="payPeriod" value="Hourly" required />
																		Hourly</label> <label><input style="font-size: 13px;" type="radio"
																		name="payPeriod" value="Daily" /> Daily</label> <label><input style="font-size: 13px;"
																		type="radio" name="payPeriod" value="Salary" />
																		Salary</label></td>
																<td style="padding-right: 10px;">Amount: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="amount" class="form-control"
																	required /></td>

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
																<td style="padding-right: 10px;">Hourly Rate: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="hourlyRate" class="form-control"
																	required /></td>

																<td style="padding-right: 10px;"><label><input style="font-size: 13px;"
																		type="checkbox" name="overtimeApplied" value="Yes" />
																		Overtime Applied</label></td>
																<td style="padding-right: 10px;">Monthly Salary: <span
																	class="inputHighlighted"> <spring:message
																			code="BzComposer.CompulsoryField.Validation" />
																</span>
																</td>
																<td style="padding-right: 10px;"><input style="font-size: 13px;"
																	type="number" name="monthlySalary" class="form-control"
																	required /></td>
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