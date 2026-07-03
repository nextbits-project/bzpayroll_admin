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
<link rel="stylesheet"
                                href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
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

table th {
	font-size: 14px !important;
}

.employee-board-toolbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 20px;
	width: 100%;
	margin: 5px 0 12px;
}

.employee-board-toolbar-left,
.employee-board-toolbar-right {
	display: flex;
	align-items: center;
	gap: 10px;
}

.employee-board-list-column {
	width: 28%;
	min-width: 320px;
	vertical-align: top;
}

.employee-board-detail-column {
	width: 72%;
	vertical-align: top;
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
<style>
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
<script>
$(document).ready(function () {

    var table = $('#custTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [],

        "columnDefs": [
            { "targets": [1,2], "visible": false },
            { "targets": 0, "orderable": false }
        ],
		// AFTER DATATABLE LOAD
        "initComplete": function () {

            let searchInput = $('div.dataTables_filter input');

            // remove remembered value
            searchInput.val('');

            // prevent chrome autofill
            searchInput.attr({
                autocomplete: 'new-password',
                autocorrect: 'off',
                autocapitalize: 'off',
                spellcheck: 'false',
                name: 'search_' + Date.now()
            });

            // keep clearing if browser tries autofill again
            setTimeout(function () {
                searchInput.val('');
            }, 200);

            setTimeout(function () {
                searchInput.val('');
            }, 1000);
        }
    });

    // Disable autocomplete
    $('div.dataTables_filter input')
        .attr('autocomplete', 'off')
        .val('');

    // 🔽 Sort dropdown
    $('#sortBy').on('change', function () {

        var colIndex = $(this).val();

        // ❗ Clear previous sorting first
        table.order([]).draw();

        // Apply fresh sorting
        table.order([colIndex, 'asc']).draw();
    });

    // Row highlight
    $('#custTableBody').on('click', '.employee-col', function () {
        $('.employee-col').removeClass('active-row');
        $(this).addClass('active-row');
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
	// Helper function to update employee photo preview
	function updateEmployeePhoto(photoData) {
		const empPhotoElement = document.getElementById("empPhoto");
		if (empPhotoElement) {
			if (photoData && photoData.trim() !== '') {
				// Check if photoData is already a full URL
				if (photoData.startsWith('http://') || photoData.startsWith('https://')) {
					empPhotoElement.setAttribute("src", photoData);
				} else {
					// Construct full URL from relative path
					const photoUrl = "https://bzcomposer.com/bucket" + photoData;
					empPhotoElement.setAttribute("src", photoUrl);
				}
			} else {
				// Use default image if no photo
				empPhotoElement.setAttribute("src", "/images/passport_Photo.png");
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
	getSelectedEmployee(rowid);

}
function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}
	function getSelectedEmployee(employeeId) {
		debugger;
		if (!employeeId) {
			console
					.warn("No employee ID found on row.");
			return;
		}
		const apiUrl = `/api/employees/`+ employeeId;
		console.log("Calling:", apiUrl);
		$.ajax({
			url : apiUrl,
			type : 'GET',
			success : function(data) {
				if (data) {
					$('#customerCompanyName').text(data.companyName || '');
					$('#employeeId').text(data.id || '');
					$('#title').text(data.title || 'Mr.');
					$('#firstName').text(data.firstName || '');
					$('#mi').text(data.mi || '');
					$('#lastName').text(data.lastName || '');
					$('#DateOfBirth').text(data.dateofBirth ? data.dateofBirth.split('T')[0] : '');
					$('#jobType').text(data.jobType || '');
					$('#employeeStatus').text(data.employeeStatus || '');
					$('input[name="fieldw9"]').prop('checked', data.fieldw9 === 'Yes');
					$('#companyName').text(data.companyName || '');
					$('#dbaName').text(data.dbaName || '');
					$('#address1').text(data.address1 || '');
					$('#address2').text(data.address2 || '');
					$('#zipCode').text(data.zipCode || '');
					$('#cityId').text(data.city || '');
					$('#stateId').text(data.state || '');
					$('#countryId').text(data.country || '');
					$('#mobileNumber').text(data.mobile || '');
					$('#phoneNumber').text(data.phone || '');
					$('#phoneNumber').text(data.phone || '');
					$('#emailAddress').text(data.email || '');
					$('#dateStarted').text(data.dateStarted ? data.dateStarted.split('T')[0] : '');
					$('#dateAdded').text(data.dateAdded ? data.dateAdded.split('T')[0] : '');
					$('#dateTerminated').text(data.dateTerminated ? data.dateTerminated.split('T')[0] : '');
					$('#memo').text(data.memo || '');
					$('#codeNumber').text(data.codeNumber || '');
					$('#filingStatus').text(data.filingStatus || '');
					$('#allowance').text(data.allowance || '');
					$('#stateWorked').text(data.stateWorked || '');
					$('#payDate').text(formatPayDate(data.dateAdded));
					$('#payrollType').text(data.payrollType || '');
					$('#payPeriod').text(data.payPeriod || '');
					$('select[name="status"]').val(data.status || '');
					$('input[name="ssn"]').val(data.ssn || '');
					// New fields
					$('input[name="sameAsPhoneNo"]').prop('checked', (data.phone || '') === (data.cellPhone || ''));
					$('input[name="cellPhone"]').val(data.cellPhone || '');
					$('input[name="password"]').val(data.password || '');
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
					updateEmployeePhoto(data.photo || data.passportPhoto || '');
				} else {
					console.warn("No data returned");
				}
			},
			error : function(xhr) {
				console.error("Failed to fetch employee:",xhr.status, xhr.responseText);
				alert('Employee data not found.');
			}
		});
	}
function formatPayDate(dateString) {
    if (!dateString) return '';

    const date = new Date(dateString);
    return date.toLocaleString('en-US', {
        month: 'long',
        day: 'numeric'
    });
}
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

                        var s = '';
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
                        var s = '';
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

  function submitInlineEmployeeForm(event) {
      event.preventDefault();

      const employeeIdField = document.querySelector('input[name="employeeId"]');
      if (!employeeIdField || !employeeIdField.value) {
          alert("Please select an employee to save.");
          return false;
      }
      if (!validateFileSize()) {
          return false;
      }

      if (window.phoneInput) {
          document.getElementById("phone").value = window.phoneInput.getNumber();
      }
      if (window.mobileInput) {
          document.getElementById("mobile").value = window.mobileInput.getNumber();
      }

      document.getElementById("employeeBoardForm").submit();
      return false;
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
  <script>
        // Optional client-side validation
        function validateFileSize() {
        const fileInput = document.getElementById("file");
        const file = fileInput.files[0];
        if (file && file.size > 50 * 1024) {
        alert("Passport photo must be under 50 KB!");
        fileInput.value = "";
        return false;
        }
        return true;
        }
    </script>
    <script>
        let finalUrl='';
        function uploadPhoto() {

        const fileInput = document.getElementById("file");
        const file = fileInput.files[0];

        if (!file) {
        alert("Please select a photo!");
        return;
        }

        let formData = new FormData();
        formData.append("file", file);

        fetch("/api/photo-upload", {
        method: "POST",
        body: formData
        })
        .then(response => response.text())
        .then(result => {

        if (result.startsWith("SUCCESS")) {
        const newPhotoPath = result.split(":")[1];
        const finalUrl = "https://bzcomposer.com/bucket" + newPhotoPath;

        document.getElementById("empPhoto").setAttribute("src", finalUrl);
          document.getElementById("passPhoto").value = newPhotoPath;
        alert("Photo uploaded successfully!");
        }
        else if (result === "SIZE_ERROR") {
        alert("Image must be under 50 KB!");
        }
        else if (result === "TYPE_ERROR") {
        alert("Only JPG/PNG image files are allowed!");
        }
        else if (result === "UPLOAD_ERROR") {
        alert("Image server not working. Please try again.");
        }
        else if (result === "EMPTY") {
        alert("No file selected. Please choose a photo.");
        }
        else {
        alert("Something went wrong while uploading!");
        }

        })
        .catch(error => {
        console.error("Upload error:", error);
        alert("Network error! Please try again.");
        });

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
								</span> <br>
								<table>
									<tr>
										<td>
											<spring:message code="BzComposer.customer.sortby" />
										</td>
										<td><select id="sortBy">
												<option value="1">
													<spring:message
														code="BzComposer.global.firstname" />
												</option>
												<option value="2">
													<spring:message
														code="BzComposer.global.lastname" />
												</option>
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
													onclick="save();"
													style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.save'/>" />
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
						</div>
						<input type="hidden" id="lSize" value='${employeesIdNameDtoList.size()}' />
						<table style="width: 100%; apdding: 0;">
							<tr>
                                <td>
									<table style="padding: 0; width: 100%; margin-top: 10px;" align="center">
										<tr>
											<td valign="top" colspan="1"
												style="width: 250px; padding: 0; height: 75vh; border: 1px solid #ccc;">
												<table id="custTable" class="tabla-listados"
													cellspacing="0"
													style="border: 0; padding: 0; margin: 0; height: auto;">
													<thead>
														<tr valign="top">
															<th class="emblem"
																style="font-size: 12px;">
																<div align="center">
																	Employee
																</div>
															</th>
														</tr>
													</thead>
													<tbody id="custTableBody">
														<c:forEach var="emp" items="${employeesIdNameDtoList}" varStatus="loop">
															<tr class="employee-row" data-id="${emp.id}"
															id='${loop.index}$$'
															onclick="setRowId(${emp.id}, ${loop.index}, true);">
																<td class="employee-col" style="padding: 10px;">
																	${emp.id} :
																		${empty emp.lastName ? '' : emp.lastName}
																		${empty emp.mi ? '' : emp.mi}
																		${empty emp.firstName ? '' : emp.firstName}
																</td>
																<td>${emp.firstName}</td>
																<td>${emp.lastName}</td>
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
                                                                        id="customerImage"
                                                                        style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;">
                                                                    <label id="customerCompanyName"
                                                                        align="left"
                                                                        style="font-size: 15px; font-weight: bold; color: #05A9C5">
                                                                </td>
                                                            </tr>
                                                        </thead>
														 <tbody>
                                                            <tr>
                                                                <td style="padding: 0;">
                                                                    <div id="customerInvoice"
                                                                        style="padding: 0; position: relative; left: 0;">
                                                                        <div id="tabs"
                                                                            style="height: auto;">
                                                                            <ul style=" padding: .2em .2em 2px; justify-content: start;background-color: #cccccc;">
																				<li style="font-size: 12px; ">
																					<a href="#GeneralInformation" style="width: 100%;">
																						General Information
																					</a>
                                                                                </li>
																				<li style="font-size: 12px; ">
																					<a href="#bzcomposer" style="width: 100%;">
																						bzcomposer.com
																					</a>
                                                                                </li>
																				<li style="font-size: 12px; ">
																					<a href="#TimeClock" style="width: 100%;">
																						Time Clock
																					</a>
                                                                                </li>
																				<li style="font-size: 12px; ">
																					<a href="#PayRollTaxInfo" style="width: 100%;">
																						PayRoll & Tax Info
																					</a>
                                                                                </li>
																				<li style="font-size: 12px; ">
																					<a href="#OtherDeductions" style="width: 100%;">
																						  Other Deductions
																					</a>
                                                                                </li>
																			</ul>
																			<!----  =================== General Information ==============  ---->
																			<div id="GeneralInformation">
                                                                                <div id="table-negotiations">
																					<table
                                                                                        cellspacing="0"
                                                                                        class="tabla-listados"
                                                                                        style="margin-top: 0;">
                                                                                        <thead>
                                                                                            <tr>
                                                                                            </tr>
                                                                                        </thead>
																						<tbody>
                                                                                            <tr>
                                                                                                <td style="width: 40%;">
																									<table
                                                                                                        cellspacing="0"
                                                                                                        class="tabla-listados">
                                                                                                        <tr>
                                                                                                            <td
                                                                                                                style="width: 50%;">
                                                                                                                <strong>
                                                                                                                    Employee ID:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td style="width: 50%;" id="employeeId">
                                                                                                            </td>
                                                                                                        </tr>
																										
																										<tr>
                                                                                                            <td><strong>
                                                                                                                    Title:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="title">
                                                                                                            </td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td><strong>
																												First Name: <span class="inputHighlighted"><spring:message code="BzComposer.CompulsoryField.Validation" /></span></strong>
                                                                                                            </td>
                                                                                                            <td id="firstName"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>M.I.:</strong>
                                                                                                            </td>
                                                                                                            <td id="mi"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
																												<strong>
                                                                                                                   Last Name:
																													<span class="inputHighlighted">
																														<spring:message code="BzComposer.CompulsoryField.Validation" />
																													</span>
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="lastName"></td>
                                                                                                        </tr>
																									<tr>
                                                                                                            <td>
																												<strong>Date Of Birth:</strong>
                                                                                                            </td>
                                                                                                            <td id="DateOfBirth">
                                                                                                            </td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td>
																												<strong>Job Title:</strong>
                                                                                                            </td>
                                                                                                            <td id="jobType"></td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td>
																												<strong>Pay Date:</strong>
                                                                                                            </td>
                                                                                                            <td id="payDate"></td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td>
																												<strong>Payroll Type:</strong>
                                                                                                            </td>
                                                                                                            <td id="payrollType"></td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
																								<td
                                                                                                    style="width: 30%;">
                                                                                                    <table
                                                                                                        cellspacing="0"
                                                                                                        class="tabla-listados">
																										<tr>
                                                                                                            <td>
																												<strong>Pay Period:</strong>
                                                                                                            </td>
                                                                                                            <td id="payPeriod"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
																												<strong>Employee Status:</strong>
                                                                                                            </td>
                                                                                                            <td id="employeeStatus"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
																												<strong>W-9 Field: </strong>
                                                                                                            </td>
                                                                                                            <td>
																												<input type="checkbox" name="fieldw9" value="Yes" />
																											</td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td
                                                                                                                style="width: 50%;">
                                                                                                                <strong>Company Name:</strong>
                                                                                                            </td>
                                                                                                            <td style="width: 50%;" id="companyName"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>DBA Name:</strong>
                                                                                                            </td>
                                                                                                            <td id="dbaName"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
																												<strong>Address1</strong>
                                                                                                            </td>
                                                                                                            <td id="address1"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>Address2</strong></td>
                                                                                                            <td id="address2"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>
																												Zip Code:
																												<span class="inputHighlighted">
																													<spring:message code="BzComposer.CompulsoryField.Validation" />
																												</span>
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="zipCode"></td>
                                                                                                        </tr>
                                                                                                        
                                                                                                        
                                                                                                    </table>
                                                                                                </td>
																							<td style="width: 30%;">
                                                                                                    <table
                                                                                                        cellspacing="0"
                                                                                                        class="tabla-listados">
																										<tr>
                                                                                                            <td><strong>
																												City:
																												<span class="inputHighlighted">
																													<spring:message code="BzComposer.CompulsoryField.Validation" />
																												</span>
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="cityId"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td>
																												<strong>State:</strong>
                                                                                                            </td>
                                                                                                            <td id="stateId"></td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td>
																												<strong>Country:</strong>
                                                                                                            </td>
                                                                                                            <td id="countryId"></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>
                                                                                                                    Phone:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td
                                                                                                                id="phoneNumber">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td
                                                                                                                style="width: 60%;">
                                                                                                                <strong>
                                                                                                                Mobile:    
																												</strong>
                                                                                                            </td>
                                                                                                            <td style="width: 40%;" id="mobileNumber"> </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>Email:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td
                                                                                                                id="emailAddress">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td><strong>Date of Started:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="dateStarted"></td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td><strong>Date Added:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="dateAdded"></td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td><strong>Memo:
                                                                                                                </strong>
                                                                                                            </td>
                                                                                                            <td id="memo"></td>
                                                                                                        </tr>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!----  =================== bzcomposer.com ==============  ---->
																			<div id="bzcomposer">
																				<div id="table-negotiations">
																					<table
                                                                                        cellspacing="0"
                                                                                        class="tabla-listados"
                                                                                        style="margin-top: 0;">
																						<tbody>
                                                                                            <tr>
                                                                                                <td style="width: 40%;">
																									<table
                                                                                                        cellspacing="0"
                                                                                                        class="tabla-listados">
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <strong>Website Access: </strong>
																												<input type="checkbox" checked name="websiteAccess" value="Yes" />
                                                                                                            </td>
                                                                                                            <td>
																												<input type="text" value="https://bzcomposer.com/" name="" class="form-control" readonly /></td>
																											<td>
                                                                                                                <strong>
																													Allowed URL:
																													<input type="checkbox" checked name="allowedUrl" value="Yes" />
																												</strong>
                                                                                                            </td>
                                                                                                            <td>
																												<strong>Password: </strong>
                                                                                                            </td>
																											<td>
																												<input type="password" id="passwordWebsite" name="passwordWebsite" class="form-control" />
																											</td>
                                                                                                        </tr>
																									</table>
																								</td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!----  ===================  Time Clock ==============  ---->
																			<div id="TimeClock">
																				<div id="table-negotiations">
																					<table
                                                                                        cellspacing="0"
                                                                                        class="tabla-listados"
                                                                                        style="margin-top: 0;">
																						<tbody>
                                                                                            <tr>
                                                                                                <td style="width: 40%;">
																									<table
                                                                                                        cellspacing="0"
                                                                                                        class="tabla-listados">
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <strong>Hourly: </strong>
																												<input type="checkbox" name="hourly" value="Yes" checked />
                                                                                                            </td>
																											<td>
                                                                                                                <strong>
																													Time Clock Access:
																													<input type="checkbox" name="timeClockAccess" value="Yes" />
																												</strong>
                                                                                                            </td>
                                                                                                            <td>
																												<strong>Code Number: <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" /> </span> </strong>
                                                                                                            </td>
																											<td>
																												<input type="text" name="codeNumber" class="form-control"  />
																											</td>
                                                                                                        </tr>
																									</table>
																								</td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!----  =================== PayRoll & Tax Info ==============  ---->
																			<div id="PayRollTaxInfo">
																				<div id="table-negotiations">
																					<table
                                                                                        cellspacing="0"
                                                                                        class="tabla-listados"
                                                                                        style="margin-top: 0;">
																						<tbody>
                                                                                            <tr>
                                                                                                <td style="width: 40%;">
																									<table
                                                                                                        cellspacing="0"
                                                                                                        class="tabla-listados">
                                                                                                        <tr>
                                                                                                            <td style=" width: 14%; ">
                                                                                                                <strong>Filing Status: </strong>
                                                                                                            </td>
																											<td style=" width: 14%; " id="filingStatus"></td>
																											<td style=" width: 14%; ">
                                                                                                                <strong>
																													Allowance:
																												</strong>
                                                                                                            </td>
                                                                                                            <td style=" width: 14%; " id="allowance"></td>
																											<td style=" width: 14%; ">
                                                                                                                <strong>State Worked:</strong>
                                                                                                            </td>
                                                                                                            <td style=" width: 14%; " id="stateWorked"></td>
																											<td style=" width: 14%; ">
                                                                                                                <strong>
																													W-2 Submitted: <input type="checkbox" name="w2Submitted" value="Yes" />
																												</strong>
                                                                                                            </td>
                                                                                                        </tr>
																										<tr>
                                                                                                            <td style=" width: 14%; ">
                                                                                                                <strong>Pay Period: </strong>
                                                                                                            </td>
																											<td style="padding-right: 10px;" colspan="2"><label><input                                                                        type="radio" name="payPeriod" value="Hourly"  />
																												Hourly</label> <label><input type="radio"
																												name="payPeriod" value="Daily" /> Daily</label> <label><input                                                                        type="radio" name="payPeriod" value="Salary" />
																												Salary</label>
																											</td>
																										</tr>
																									</table>
																								</td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!----  =================== Other Deductions ==============  ---->
																			<div id="OtherDeductions">
																				<div id="table-negotiations">
																					<table
                                                                                        cellspacing="0"
                                                                                        class="tabla-listados"
                                                                                        style="margin-top: 0;">
																						<tbody>
                                                                                            <tr>
                                                                                                <tr>
																									<td colspan="8">
																										<table class="table table-sm table-bordered" id="otherDeductionsTable">
																											<thead>
																												<tr>
																													<td>Deduction</td>
																													<td>Amount</td>
																													<td>Rate</td>
																													<td>Use Rate</td>
																													<td>Tax Exempt</td>
																												</tr>
																											</thead>
																											<tbody>
																												<!-- These rows should be generated dynamically based on company configuration -->
																												<tr>
																													<td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
																													<td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
																													<td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
																												</tr>
																												<tr>
																													<td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
																													<td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
																													<td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
																												</tr>
																												<tr>
																													<td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
																													<td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
																													<td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
																												</tr>
																												<tr>
																													<td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
																													<td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
																													<td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
																												</tr>
																												<tr>
																													<td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
																													<td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
																													<td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
																													<td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
																												</tr>
																											</tbody>
																										</table>
																									</td>
																								</tr>
																								<tr>
																									<td style="padding-right: 10px;">Hourly Rate:
																									</td>
																									<td style="padding-right: 10px;"><input																	type="number" name="hourlyRate" class="form-control"
																										/></td>

																									<td style="padding-right: 10px;"><label><input																		type="checkbox" name="overtimeApplied" value="Yes" />
																											Overtime Applied</label></td>
																									<td style="padding-right: 10px;">Monthly Salary:
																									</td>
																									<td style="padding-right: 10px;"><input																	type="number" name="monthlySalary" class="form-control"
																										/></td>
																									<td></td>
																									<td></td>
																									<td></td>
																								</tr>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>

																			
																		</div>
																	</div>
																</td>
															</tr>
													</table>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
				</div>
			</div>
		</div>
	</div>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"></script>

        	<script>
        		document.addEventListener("DOMContentLoaded", function() {
        			// Initialize intl-tel-input for phone fields
        			const phoneInputField = document.querySelector("#phone");
        			if (phoneInputField && window.intlTelInput) {
        				window.phoneInput = window.intlTelInput(
        						phoneInputField,
        						{
        							initialCountry : "us",
        							preferredCountries : [ "us", "in", "gb" ],
        							separateDialCode : true,
        							nationalMode : false,
        							utilsScript : "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
        						});
        			}

        			const mobileInputField = document.querySelector("#mobile");
        			if (mobileInputField && window.intlTelInput) {
        				window.mobileInput = window.intlTelInput(
        						mobileInputField,
        						{
        							initialCountry : "us",
        							preferredCountries : [ "us", "in", "gb" ],
        							separateDialCode : true,
        							nationalMode : false,
        							utilsScript : "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
        						});
        			}

        			// Set default date for date fields
        			let today = new Date().toISOString().split('T')[0];
        			document.querySelectorAll(".date-field").forEach(function(el) {
        				el.value = today;
        			});
        		});
        	</script>

        	<script>
        		document.addEventListener("DOMContentLoaded", function() {
        			const phoneField = document.getElementById("phone");
        			const mobileField = document.getElementById("mobile");
        			const checkbox = document.getElementById("sameAsPhone");

        			if (checkbox && phoneField && mobileField) {
        				checkbox.addEventListener("change", function() {
        					if (this.checked) {
        						// Copy phone to mobile using intl-tel-input's getNumber method if available
        						if (window.phoneInput && window.mobileInput) {
        							const phoneNumber = window.phoneInput.getNumber();
        							window.mobileInput.setNumber(phoneNumber);
        						} else {
        							mobileField.value = phoneField.value;
        						}
        						mobileField.readOnly = true; // Make mobile read-only
        					} else {
        						mobileField.readOnly = false; // Remove read-only
        						mobileField.value = ""; // Clear mobile field
        						if (window.mobileInput) {
        							window.mobileInput.setNumber("");
        						}
        					}
        				});

        				// Update mobile when phone changes while checkbox is checked
        				phoneField.addEventListener("input", function() {
        					if (checkbox.checked) {
        						if (window.phoneInput && window.mobileInput) {
        							const phoneNumber = window.phoneInput.getNumber();
        							window.mobileInput.setNumber(phoneNumber);
        						} else {
        							mobileField.value = phoneField.value;
        						}
        					}
        				});
        			}
        		});
        	</script>
        	<script>
        		function loadAddressDetailsByZipcode(zipCode, indexNo){
        		console.log(zipCode)
        		indexNo = indexNo==1?"":indexNo;
        		if(zipCode.length < 4 || zipCode.length > 6){
        		alert(selectValidZipcodeMsg);
        		}
        		else{
        		$.ajax({
        		type: "POST",
        		url:"/cities/"+zipCode,
        		success : function(data) {
        		console.log(data)
        		if(data){
        		setTimeout(function(){
        		console.log("MARKERXYZ",data);
        		$("#sellectState").val(data.state).change();
        		setTimeout(function(){
        		$("#sellectDistrict").val(data.cityId);
        		}, 1000);
        		}, 1000);
        		}else{
        		alert(noRecordsFoundMsg);
        		}
        		},
        		error : function(data) {
        		alert('ERROR');
        		}
        		});
        		}
        		}
        	</script>
<script type="text/javascript"
                            src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
</html>
<!-- dialog box that used in this page -->
