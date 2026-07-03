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
<title>BzPayroll - W-2 Form</title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">

</head>
<style>
.boarder td,
.boarder th {
    border: 1px solid black;
font-size: 11px;
padding:2px;
}
.boarder input, .boarder textarea {
    border: none;
   /* background-color: #f0f0ff;*/
    color: black;
    font-size: 14px;
    padding:0px;
    height:15px;
    padding:2px 4px;
}
.digital-input {
    font-family: 'Share Tech Mono', monospace;
    font-size: 16px; /* adjust as needed */
    letter-spacing: 2px; /* adds spacing like your image */
}
</style>
<script>
   $(document).ready(function () {
      $('#custTableBody').on('click', '.employee-row', function () {
         // Remove all styles from all rows
         $('.employee-row').css({
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
	$(function() {
		$("#tabs").tabs();
	});
	function toggleFunction() {

		var x = document.getElementById("divtoggle");
		var lftmenu = document.getElementById("leftMenu");
		if (x.style.display === "none") {
			x.style.display = "block";
			lftmenu.style.width = "180px";
			lftmenu.style.position = "relative";
			/* document.getElementById("togglebtn").value = "+"; */
		} else {
			x.style.display = "none";
			lftmenu.style.width = "0";
			lftmenu.style.position = "absolute";
			/* document.getElementById("togglebtn").value = "-"; */
		}
	}
</script>
<script>
	let employeeIdForEdit = null; // global variable
	// When clicking Edit button
	$(document).ready(function () {
	$('#editButton').on('click', function () {
		console.log('Edit button');
		if (!employeeIdForEdit) {
			alert("Please select an employee first.");
			return;
		}

		const apiUrlForEdit = `/edit-w2form/`+employeeIdForEdit;
		console.log("Redirecting to:", apiUrlForEdit);
		window.location.href = apiUrlForEdit;
	});
	});
	let employeeIdForDelete = null; // global variable
    	// When clicking Edit button
    	$(document).ready(function () {
    	$('#deleteButton').on('click', function () {
    		console.log('Delete button');
    		if (!employeeIdForEdit) {
    			alert("Please select an employee first.");
    			return;
    		}

    		const apiUrlForEdit = `/delete-w2form/`+employeeIdForDelete;
    		console.log("Redirecting to:", apiUrlForEdit);
    		window.location.href = apiUrlForEdit;
    	});
    	});
	$(document).ready(function () {
		$('#custTableBody').on('click', '.employee-row', function () {
			const employeeId = $(this).data('id');
			console.log("Employee ID:", employeeId);

			if (!employeeId) {
				console.warn("No employee ID found on row.");
				return;
			}
			employeeIdForEdit=employeeId;
            employeeIdForDelete=employeeId;
			const apiUrl = `/api/w2-form/` + employeeId;
			console.log("Calling:", apiUrl);
			$.ajax({
				url: apiUrl,
				type: 'GET',
				success: function (data) {
					console.log("Employee Data:", data);

					if (data) {
						$('input[name="employeeIndexId"]').val(data.employeeIndexId || '');
						$('input[name="employeeSocialSecurityNumber"]').val(data.employeeSocialSecurityNumber || '');
						$('input[name="employerIdentificationNumber"]').val(data.employerIdentificationNumber || '');
						$('input[name="wagesTipsOtherCompensation"]').val(data.wagesTipsOtherCompensation || '');
						$('input[name="federalIncomeTaxWithheld"]').val(data.federalIncomeTaxWithheld || '');
						$('input[name="socialSecurityWages"]').val(data.socialSecurityWages || '');
						$('input[name="socialSecurityTaxWithheld"]').val(data.socialSecurityTaxWithheld || '');
						$('textarea[name="employeeNameAddressZip"]').val(data.employeeNameAddressZip || '');
						$('input[name="medicareWagesAndTips"]').val(data.medicareWagesAndTips || '');
						$('input[name="medicareTaxWithheld"]').val(data.medicareTaxWithheld || '');
						$('input[name="socialSecurityTips"]').val(data.socialSecurityTips || '');
						$('input[name="allocatedTips"]').val(data.allocatedTips || '');
						$('input[name="controlNumber"]').val(data.controlNumber || '');
						$('input[name="box9"]').val(data.box9 || '');
						$('input[name="dependentCareBenefits"]').val(data.dependentCareBenefits || '');
						$('input[name="nonqualifiedPlan"]').val(data.nonqualifiedPlan || '');
						$('input[name="box12a"]').val(data.box12a || '');
						$('input[name="employeeFirstName"]').val(data.employeeFirstName || '');
						$('input[name="employeeLastName"]').val(data.employeeLastName || '');
						$('input[name="employeeSuffix"]').val(data.employeeSuffix || '');
						$('input[name="statutoryEmployee"]').prop('checked', data.statutoryEmployee === "Yes");
						$('input[name="retirementPlan"]').prop('checked', data.retirementPlan === "Yes");
						$('input[name="thirdPartySickPay"]').prop('checked', data.thirdPartySickPay === "Yes");

						$('input[name="box12b"]').val(data.box12b || '');
						$('input[name="employeeAddressZip"]').val(data.employeeAddressZip || '');
						$('textarea[name="box14"]').val(data.box14 || '');
						$('textarea[name="othersTextArea"]').val(data.othersTextArea || '');
						$('input[name="box12c"]').val(data.box12c || '');
						$('input[name="box12d"]').val(data.box12d || '');
						$('input[name="state"]').val(data.state || '');
						$('input[name="employerStateIdNumber"]').val(data.employerStateIdNumber || '');
						$('input[name="stateWagesTips"]').val(data.stateWagesTips || '');
						$('input[name="stateIncomeTax"]').val(data.stateIncomeTax || '');
						$('input[name="localWagesTips"]').val(data.localWagesTips || '');
						$('input[name="localIncomeTax"]').val(data.localIncomeTax || '');
						$('input[name="localityName"]').val(data.localityName || '');

					} else {
						// Clear all input fields and checkboxes
						$('input, select, textarea').each(function() {
							// Skip buttons and reset inputs
							if (this.type === 'button' || this.type === 'reset' || this.type === 'submit') {
								return; // continue to next element
							}
							if (this.type === 'checkbox' || this.type === 'radio') {
								this.checked = false;
							} else {
								$(this).val('');
							}
						});
						const apiUrl = `/api/employees/` + employeeId;
						console.log("Calling:", apiUrl);

						$.ajax({
							url: apiUrl,
							type: 'GET',
							success: function (data) {
								console.log("Employee Data:", data);

								if (data) {
									$('input[name="employeeIndexId"]').val(employeeId || '');
									$('input[name="employeeFirstName"]').val((data.firstName || ''));

									$('input[name="employeeLastName"]').val(data.lastName || '');
									$('textarea[name="employeeNameAddressZip"]').val((data.firstName || '')+' '+(data.lastName || '')+' '+(data.address1 || '')+' '+(data.zipCode || ''));
									$('input[name="employeeAddressZip"]').val((data.address1 || '')+' '+(data.zipCode || ''));
									$('input[name="phone"]').val(data.phone || '');
									$('input[name="address1"]').val(data.address1 || '');
									$('input[name="address2"]').val(data.address2 || '');
									$('input[name="city"]').val(data.city || '');
									$('input[name="state"]').val(data.state || '');
									$('input[name="country"]').val(data.country || '');
									$('input[name="zipCode"]').val(data.zipCode || '');
									$('input[name="dateTerminated"]').val(data.dateTerminated ? data.dateTerminated.split('T')[0] : '');
									$('select[name="status"]').val(data.status || '');
									$('input[name="ssn"]').val(data.ssn || '');

								} else {
									console.warn("No data returned");
								}
							}

						});
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
	function clearFormFields() {
		$('input, select, textarea').each(function() {
			// Skip buttons and reset inputs
			if (this.type === 'button' || this.type === 'reset' || this.type === 'submit') {
				return; // continue to next element
			}

			if (this.type === 'checkbox' || this.type === 'radio') {
				this.checked = false;
			} else {
				$(this).val('');
			}
		});
	}
</script>

<style>
  .employee-row:hover {
    background-color: #808080;
    color: white;
    font-weight: bold;
  }
</style>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();" style="min-width: 1366px;">
	<!-- begin shared/header -->

	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">

						<div>
							<span
								style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
								W-2 Form </span>
						</div>
<div
    style="display: flex; justify-content: flex-end; align-items: flex-end; margin-right: 85px;">

								<table>
									<tr align="right">
									<td>
									<a style="padding:5px; text-decoration: none;" class="formButton" href="/add-new-w9form">New</a>
									</td>
										<td ><input style="padding:5px;" type="button" id="editButton" class="formbutton" name="edit" value="Edit"/>
											</td>
                                           <td ><input style="padding:5px;" type="button" id="deleteButton" class="formbutton" name="edit" value="Delete"/>
											</td>
											<%--<td>
											<input style="padding:5px;" type="reset"
												class="formbutton" name="clear" value="Clear" onclick="clearFormFields();" /></td>--%>
									</tr>
								</table>
							</div>
						<div>
							<c:if test="${not empty Labels}">
								<input type="hidden" name="lsize" id="lblsize"
									value='${Labels.size()}' />
								<c:forEach items="${Labels}" var="lbl" varStatus="loop">
									<input type="hidden" id='${loop.index}lid'
										name='${loop.index}lidname' value='${lbl.value}' />
									<input type="hidden" id='${loop.index}lname'
										name='${loop.index}lnm' value='${lbl.label}' />
								</c:forEach>
							</c:if>
						</div>

						<div style="display: flex; width: 100%;">
							<!-- Left Sidebar: Employee List -->
							<div
								style="width: 15%; border: 1px solid #ccc; height: 430px; overflow-y: auto;">
								<div id="table-negotiations" style="padding: 0;">
									<table cellspacing="0" style="border: 0; width: 100%;"
										class="section-border">
										<thead>
											<tr style="background-color: #f2f2f2;">
												<td>
													<div class="panel-header"
														style="background-color: #D3D3D3;">
														<strong>&nbsp;&nbsp;Employee List</strong>

													</div>
												</td>
											</tr>
										</thead>
										       <tbody id="custTableBody">
										<c:forEach var="emp" items="${dtoList}">
											<tr class="employee-row" data-id="${emp.id}" style="border-bottom: 1px solid #ccc; cursor: pointer;">

												<td style="padding: 10px; font-size: 14px;">
												${empty emp.firstName ? '' : emp.firstName}
												${empty emp.lastName ? '' : emp.lastName}
                                                 </td>
											</tr>
										</c:forEach>
									</tbody>

									</table>
								</div>
							</div>



							<table cellspacing="0"
								style="border: 0; width: 80%; overflow-y: scroll;"
								class="section-border">
								<tr>

									<td valign="top"
										style="padding-right: 20px; padding-bottom: 20px;">
										<%--////////--%>



										<div class="main-container">
											<div class="row">
												<!-- Form Column -->
												<div class="col-md-12">
													<form action="save-w2form" method="post" name="w2form">

														<!-- Panel Start -->
														<div class="panel">
															<div class="panel-header"
																style="background-color: #D3D3D3; text-align: center;">
																<strong>&nbsp;&nbsp;W-2 Form Information</strong>

															</div>
															<div class="panel-body">
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

																<!-- Form Layout -->
																<div class="form-layout">

	<table class="table table-bordered boarder" style="border: 1px solid black; margin: 0; border-spacing: 0; border-collapse: collapse;">
		<tr>
			<td style="width:20%;">
			<input type="hidden" name="employeeIndexId" />
			</td>

			<td>
					<b>a</b> Employee's social security number <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				<input value="${bcpW2Form.employeeSocialSecurityNumber}" required type="text" name="employeeSocialSecurityNumber" class="form-control digital-input" />
			</td>
			<td colspan="3">OBM No. 1545-0029</td>
		<tr>
			<td colspan="3"> <b>b</b>
					Employer identification number (EIN) <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="employerIdentificationNumber" class="form-control digital-input" />
			</td>
			<td> <b>1</b>
					Wages, tips, other compensation <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="wagesTipsOtherCompensation" class="form-control" />
			</td>
			<td style="width:20%;"><b>2</b>
					Federal income tax withheld <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="federalIncomeTaxWithheld" class="form-control" />
			</td>

		<tr>
			<td colspan="3" rowspan="4"> <b>c</b>
					employer's name, address, ZIP code <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <textarea required type="text" name="employeeNameAddressZip" class="form-control digital-input" style="width: 100%; height: 7em;" ></textarea>
			</td>
			</tr>
			<tr>
			<td> <b>3</b>
            					Social security wages <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
            					</span>
            				 <input required type="text" name="socialSecurityWages" class="form-control" />
            			</td>
            			<td> <b>4</b>
            					Social security tax withheld <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
            					</span>
            				 <input required type="text" name="socialSecurityTaxWithheld" class="form-control" />
            			</td>
		</tr>
		<tr>
		<td> <b>5</b>
                    					Medicare wages and tips <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                    					</span>
                    				<input required type="text" name="medicareWagesAndTips" class="form-control" />
                    			</td>
                    			<td> <b>6</b>
                    					medicare tax withheld <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                    					</span>
                    				 <input required type="text" name="medicareTaxWithheld" class="form-control" />
                    			</td>
		</tr>
<tr>
        		<td> <b>7</b>
                            					Social security tips <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                            					</span>
                            				 <input required type="text" name="socialSecurityTips" class="form-control" />
                            			</td>
                            			<td> <b>8</b>
                            					Allocated tips <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                            					</span>
                            				 <input required type="text" name="allocatedTips" class="form-control" />

                            			</td>
        		</tr>

		<tr>
			<td colspan="3"> <b>d</b>
					Control number <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="controlNumber" class="form-control" />
			</td>
			<td>
                                    			 <b>9</b> <span class="inputHighlighted">
                                                						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                					</span>
                                                				 <input required type="text" name="box9" class="form-control" />
                                                			</td>
                                                			<td> <b>10</b>
                                                					Dependent care benefits <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                					</span>
                                                				 <input required type="text" name="dependentCareBenefits" class="form-control" />
                                                			</td>
		</tr>
		<tr>
			<td colspan="3">
			<table style="width:100%;">
            			<tr>
            			<td>

                   <b>e</b> Employee's first name and initial

                <span class="inputHighlighted">
                    <spring:message code="BzComposer.CompulsoryField.Validation" />
                </span>
                <input required type="text" name="employeeFirstName" class="form-control digital-input" />
               </td>
               <td>

                    Last name

                <span class="inputHighlighted">
                    <spring:message code="BzComposer.CompulsoryField.Validation" />
                </span>
                <input required type="text" name="employeeLastName" class="form-control digital-input" />
             </td>
             <td>

                    Suffix

                <span class="inputHighlighted">
                    <spring:message code="BzComposer.CompulsoryField.Validation" />
                </span>
                <input required type="text" name="employeeSuffix" class="form-control digital-input" />
            </td>
           </tr>
           </table>
           </td>


			<td><b>11</b>
                                                        					Nonqualified plan <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                        					</span>
                                                        				 <input required type="text" name="nonqualifiedPlan" class="form-control" />
                                                        			</td>
                                                        			<td><b>12a</b> <span class="inputHighlighted">
                                                        						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                        					</span>
                                                        				 <input required type="text" name="box12a" class="form-control" />
                                                        			</td>
            			</tr>
            			<tr>
            			<td rowspan="2" colspan="3">
            			<textarea required type="text" name="othersTextArea" class="form-control digital-input" style="width: 100%; height: 5em;" ></textarea>
            			</td>
                                            			<td> <table style="border: 1px solid red; border-collapse: collapse;">
                                            			<tr><td><b>13</b></td>

                                                        					<td style="text-align:center;"> Statutory employee<br><input type="checkbox" name="statutoryEmployee" value="Yes" />
                                                        					</td>
                                                        					<td style="text-align:center;"> Retirement plan<br><input type="checkbox" id="retirementPlan" name="retirementPlan" value="Yes" />
                                                        					</td>
                                                        					<td style="text-align:center;"> Third-party sick pay<br><input type="checkbox" id="sickPay" name="thirdPartySickPay" value="Yes" />
                                                        					</td>
                                                        					</tr>
                                                        					</table>

                                                        			</td>
                                                        			<td><b>12b</b> <span class="inputHighlighted">
                                                        						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                        					</span>
                                                        				 <input required type="text" name="box12b" class="form-control" />
                                                        			</td>
                                            			</tr>
                                            			<tr>
                                            			<td rowspan="2"><b>14</b>
                                                        					Other <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                        					</span>
                                                        				 <textarea required type="text" name="box14" class="form-control digital-input" style="width: 100%; height: 4em;"></textarea>
                                                        			</td>
                                                        			<td><b>12c</b> <span class="inputHighlighted">
                                                        						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                        					</span>
                                                        				 <input required type="text" name="box12c" class="form-control" />
                                                        			</td>
                                            			</tr>

		<tr>
			<td colspan="3"><b>f</b>
					Employee's address and ZIP code <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="employeeAddressZip" class="form-control" />
			</td>








                            			<td><b>12d</b> <span class="inputHighlighted">
                                                                        						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                        					</span>
                                                                        				 <input required type="text" name="box12d" class="form-control" />
                                                                        			</td>
                                                                        			</tr>
		<tr>
		<td colspan="5">
		<table style="width:100%;">
		<tr>
		<td><b>15</b>
        					State <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
        					</span>
        				 <input required type="text" name="state" class="form-control" />

        			</td>
			<td>
					Employer’s state ID number <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="employerStateIdNumber" class="form-control" />
			</td>
			<td><b>16</b>
					State wages, tips, etc. <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="stateWagesTips" class="form-control" />
			</td>
			<td><b>17</b>
					State income tax <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="stateIncomeTax" class="form-control" />
			</td>
			<td><b>18</b>
					Local wages, tips, etc. <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="localWagesTips" class="form-control" />
			</td>
			<td><b>19</b>
					Local income tax <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
			 <input required type="text" name="localIncomeTax" class="form-control" />
			</td>
			<td><b>20</b>
					Locality name <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
					</span>
				 <input required type="text" name="localityName" class="form-control" />
			</td>
			<tr>
			</table>
			</td>
		</tr>
	</table>
	<div style="display: flex; justify-content: flex-end; align-items: flex-end; margin-right: 100px; margin: 0; border-spacing: 0; border-collapse: collapse;">
<table>
									<tr align="right">
										<td style="padding-top:5px; padding-right:0px;">
										<button type="submit" class="formbutton" name="Submit" value="submit">Save</button>
										</td>
											</tr>
											</table>
											</div>

</div>
															</div>
														</div>
													</form>
												</div>
											</div>

										</div> <%--////////--%>
									</td>
								</tr>
							</table>

																</div>
															</div>
														</div>
													</form>
												</div>
											</div>

										</div> <%--////////--%>
									</td>
								</tr>
							</table>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>


	<!-- JavaScript to control checkbox behavior -->

	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>
<!-- Dialog box used in this page -->
<div id="showSuccessDialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.common.recordUpdated' />
	</p>
</div>
<div id="errorOccureddialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.common.erroroccurred' />
	</p>
</div>
<div id="selectAnyTemplateDialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.common.selectAtleast1Template' />
	</p>
</div>
