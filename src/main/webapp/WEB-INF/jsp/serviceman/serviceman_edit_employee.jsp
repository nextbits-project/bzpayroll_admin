<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page errorPage="../include/sessionExpired.jsp"%>
<html>
<head>
<!-- <script> -->
<!-- 	self.moveTo(100,50); -->
<!-- </script> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../include/header.jsp"%>
<title><spring:message
		code="BzComposer.Purchase.PurchaseOrder.AddNewUserTitle" /></title>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"

    <script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
</head>
<body onload="init();">
	<script type="text/javascript">
		$(function() {
			$("#tabs").tabs();
		});
		var funsequence = 0;
		var _1 = navigator.userAgent.toLowerCase();
		var ___ = (_1.indexOf("msie") != -1);
		var ___5 = (_1.indexOf("msie 5") != -1);
		var _io = (_1.indexOf("opera") != -1);
		var _im = (_1.indexOf("mac") != -1);
		var ____gi = (_1.indexOf("gecko") != -1);
		var i____s = (_1.indexOf("safari") != -1);
		var o = null;
		var o1 = null;
		var o2 = null;
		var o3 = null;
		var r = null;

		function c(r) {

			if (___) {
				var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
				try {
					o = new ActiveXObject(t);
					o.onreadystatechange = r;
				} catch (ex) {
					alert("<bean:message key='BzComposer.common.needToEnableActiveXObject'/> ts.."
							+ ex);
				}
			} else {
				o = new XMLHttpRequest();
				o.onload = r;
				o.onerror = r;
			}
			return o;
		}
		function oGET(oo, url) {
			try {
				oo.open("GET", url, true);
				oo.send(null);
			} catch (ex) {
			}
		}
		function writeSelect() {
			if (o.readyState != 4 || o.status != 200) {
				return;
			}
			document.getElementById("t_statedata").innerHTML = o.responseText;
		}
		function refreshItemsNow(val) {
			o = c(writeSelect);
			oGET(o,
					'${pageContext.request.contextPath}/include/GetStates.jsp?st=state&Cid='
							+ val)
		}
		function writeSelect1() {
			if (o1.readyState != 4 || o1.status != 200) {
				return;
			}
			document.getElementById("t_statedata1").innerHTML = o1.responseText;
		}
		function refreshItemsNow1(val) {
			o1 = c(writeSelect1);
			oGET(o1,
					'${pageContext.request.contextPath}/include/GetStates.jsp?st=bsstate&Cid='
							+ val)

		}
		function writeSelect2() {
			if (o2.readyState != 4 || o2.status != 200) {
				return;
			}
			document.getElementById("t_statedata2").innerHTML = o2.responseText;
		}
		function refreshItemsNow12(val, sval) {
			o2 = c(writeSelect2);
			oGET(o2,
					'${pageContext.request.contextPath}/include/GetStates.jsp?st=shstate&Cid='
							+ val + "&sval=" + sval)
		}
		function refreshItemsNow2(val) {
			o2 = c(writeSelect2);
			oGET(o2,
					'${pageContext.request.contextPath}/include/GetStates.jsp?st=shstate&Cid='
							+ val)
		}
		function setState(state_id, name) {
			if (name == 'state') {
				document.VendorForm.state.value = state_id;
			} else if (name == 'bsstate') {
				document.VendorForm.bsstate.value = state_id;
				document.getElementById('bsst').value = state_id;
			} else if (name == 'shstate') {
				document.VendorForm.shstate.value = state_id;
			}
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
	$(document)
			.ready(
					function() {
 // Helper function to get URL parameters
        function getUrlParam(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        // Get employeeId from URL
        const employeeId = getUrlParam('employeeId');
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
</script>

	<!-- begin shared/header -->


<form action="/serviceman-update-employee" method="post" name="employee">

		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">

						<div id="padding">
							<!-- begin Contents -->
							<!-- add the code for tab here -->
							<div>
								<span
									style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">Edit Employee Information</span>
							</div>

							<div>
								<div id="tabs" style="height: 750px;">

									<div id="General-1">
										<div id="content1" class="tabPage">
											<!-- add here the content of first tab -->

											<div id="table-negotiations">
												<table class="tabla-listados" cellspacing="0">
													<thead>
														<tr>
															<th colspan="8">Employee Information</th>
														</tr>
													</thead>
													<tbody>
														<!-- Row 1: Title, First Name, M.I., Last Name -->
														<tr>
															<td style="padding-right: 10px;">Employee ID:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;">
															<input type="text" name="employeeIndexId" value="${employee.employeeIndexId}"
                                                                       class="form-control" readonly /></td>
															<td colspan="6"></td>
														</tr>
														<tr>
															<td style="padding-right: 10px;">Title: <span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><select name="title" class="form-select"
																required>

																	<option value="Mr.">Mr.</option>
																	<option value="Mrs.">Mrs.</option>
																	<option value="Ms.">Ms.</option>
																	<option value="Dr.">Dr.</option>
																	<option value="Prof.">Prof.</option>
															</select></td>

															<td style="padding-right: 10px;">First Name: <span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><input type="text" name="firstName" value="${employee.firstName}"
																class="form-control" required /></td>

															<td style="padding-right: 10px;">M.I.:</td>
															<td style="padding-right: 10px;"><input type="text" name="mi" value="${employee.mi}"
																class="form-control" /></td>
                                                           <td style="padding-right: 10px;">Last Name: <span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><input type="text" name="lastName" value="${employee.lastName}"
																class="form-control" required /></td>

														</tr>


														<tr>

															<td style="padding-right: 10px;">SSN:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="text" name="ssn" value="${employee.ssn}"
																class="form-control" readonly/></td>

															<td style="padding-right: 10px;">Date Of Birth:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="date" name="dateofBirth" value="${employee.dateofBirth}"
																class="form-control" placeholder="dd-mm-yyyy" required/></td>
                                                            <td colspan="4"></td>

														</tr>


														<tr>
															<td style="padding-right: 10px;">Job Title:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><select name="jobTitleId" class="form-select" required>
																	<c:forEach var="bcpJobtitle"
																		items="${bcpJobtitleList}">
																		<option value="${bcpJobtitle.jobTitleId}">&nbsp;&nbsp;&nbsp; ${bcpJobtitle.jobTitle}</option>
																	</c:forEach>
															</select></td>

															<td style="padding-right: 10px;">Employee Status:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>


																<td style="padding-right: 10px;"><select name="employeeTypeId"
                                                                																class="form-select" required>

                                                                																<c:forEach var="employeeType" items="${bcpEmployeetypeList}">
                                                                																<option value="${employeeType.employeeTypeId}">${employeeType.employeeType}</option>
                                                                																</c:forEach>
                                                                																</select></td>

															<td style="padding-right: 10px;">
                                                                Job Type:
                                                                <span class="inputHighlighted">
                                                                    <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                </span>
                                                            </td>
                                                            <td style="padding-right: 10px;">
                                                                <select name="jobType" class="form-select" required>

                                                                    <c:forEach var="role" items="${employeeRoles}">
                                                                        <option value="${role}">${role}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
                                                            <td colspan="2"><label> W-9 Field: <input
                                                                    type="checkbox" name="fieldw9" value="Yes"
                                                                    <c:if test="${employee.fieldw9 == 'Yes'}">checked="checked"</c:if>
                                                                     />
                                                            </label></td>
														</tr>

														<tr>

															<td style="padding-right: 10px;">Zip:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="text" name="zipCode" value="${employee.zipCode}"
																class="form-control" required/></td>

															<td style="padding-right: 10px;">City:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
                                                            <td style="padding-right: 10px;"><span><input style="background-color:#f0f0f0;" type="text" name="cityReadOnly" readonly/>
                                                                <select name="cityId" id="sellectDistrict" class="form-select" required>
                                                                    <option value="">--Select--</option>
                                                                </select>
                                                            </td>
<td style="padding-right: 10px;">State:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
                                                            <td style="padding-right: 10px;"><span><input style="background-color:#f0f0f0;" type="text" name="stateReadOnly" readonly/><select name="stateId" id="sellectState"  required>
                                                                <option value="">--Select--</option>
                                                            </select></td>
															<td style="padding-right: 10px;">Country:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;">
																<select id="sellectCountry" name="countryId" class="form-select" required>
	                                                         	<option value="231">United States</option>
	                                                         	<c:forEach var="bcpcountries" items="${countries}">
		                                                     	<option value="${bcpcountries.id}">${bcpcountries.name}</option>
	                                                        	</c:forEach>
	                                                           </select>
															</td>
														</tr>
														<!-- Row 4: Address1, Address2 -->
														<tr>

															<td style="padding-right: 10px;">Address1:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td colspan="3" style="padding-right: 10px;"><input type="text" name="address1" value="${employee.address1}"
																class="form-control" style="width: 100%;" required/></td>
                                                            <td style="padding-right: 10px;">Address2:</td>
                                                            <td colspan="3" style="padding-right: 10px;"><input type="text" name="address2" value="${employee.address2}"
                                                                                                    class="form-control" style="width: 100%;" /></td>
														</tr>
														<tr>
															<td style="padding-right: 10px;">Phone:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td colspan="2" style="padding-right: 10px;"><input type="tel" name="phone" value="${employee.phone}"  id="phone"
																class="form-control" required/></td>

															<td colspan="2"><label> Same as the mobile
																	number <input name="sameAsPhoneNo" type="checkbox" id="sameAsPhone"
																	onclick="copyMobileToPhone()" />
															</label></td>
															<td style="padding-right: 10px;">Mobile:</td>
															<td colspan="2" style="padding-right: 10px;"><input type="tel" name="cellPhone" value="${employee.cellPhone}" id="mobile"
																class="form-control" /></td>

														</tr>
														<tr>
															<td style="padding-right: 10px;">Email:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td colspan="3" style="padding-right: 10px;"><input type="email" name="email" value="${employee.email}"
																class="form-control" required/></td>

															<td style="padding-right: 10px;">Password:
                                                                                                                                <span class="inputHighlighted">
                                                                                                                                    <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                                                                                </span>
                                                                                                                            </td>
                                                                                                                            <td style="padding-right: 10px;">
                                                                                                                                <input type="password" id="password" name="password" class="form-control" required />
                                                                                                                            </td>
                                                            <td style="padding-right: 10px;">Date of Started:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
                                                            <td style="padding-right: 10px;"><input type="date" name="dateStarted" value="${employee.dateStarted}"
                                                                                                    class="form-control" required/></td>
														</tr>
														<tr>
                                                            <td style="padding-right: 10px;">Memo:</td>
                                                            <td colspan="3">
                                                                <textarea name="memo" rows="3" class="form-control" style="width: 100%;"></textarea>
                                                            </td>
                                                            <td style="padding-right: 10px;">Date Added:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><input type="date" name="dateAdded" value="${employee.dateAdded}"
																class="form-control date-field" required/></td>
														<td style="padding-right: 10px;">Terminated Date:</td>
															 <td style="padding-right: 10px;">
                                                                  <input type="date" id="dateTerminated" name="dateTerminated" class="form-control" />
                                                                </td>
														</tr>

													</tbody>
                                                    <tr>
													<thead>
														<tr>
															<th colspan="8">bzcomposer.com</th>
														</tr>
													</thead>
													<tbody>

														<td colspan="2" style="padding-right: 10px;"><label>Website
																Access: <input type="checkbox" checked name="websiteAccess"
                                                                               <c:if test="${employee.websiteAccess == 'Yes'}">checked="checked"</c:if>
																value="Yes" />
														</label></td>

														<td width="10%" style="padding-right: 10px;"><label>Allowed
																URL: <input type="checkbox" checked name="allowedUrl"
                                                                            <c:if test="${employee.allowedUrl == 'Yes'}">checked="checked"</c:if>
																value="Yes" />
														</label></td>
														<td colspan="2" style="padding-right: 10px;"><input
															type="text" value="https://bzcomposer.com/" name=""
															class="form-control" readonly /></td>
														<td></td>
														<td></td>
														<td></td>
														</tr>
													</tbody>
													<thead>
														<tr>
															<th colspan="8">Time Clock</th>
														</tr>
													</thead>
													<tbody>
														<td colspan="2" style="padding-right: 10px;"><label>Time
																Clock Access: <input type="checkbox"
                                                                                     <c:if test="${employee.timeClockAccess == 'Yes'}">checked="checked"</c:if>
																name="timeClockAccess" value="Yes" checked />
														</label></td>
														<td style="padding-right: 10px;">Code Number: <span
															class="inputHighlighted"> <spring:message
																	code="BzComposer.CompulsoryField.Validation" />
														</span>
														</td>
														<td style="padding-right: 10px;"><input type="text" value="${employee.codeNumber}"
															name="codeNumber" class="form-control" required /></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tbody>

													<thead>
														<tr>
															<th colspan="8">PayRoll & Tax Info</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="padding-right: 10px;">Filing Status: <span class="inputHighlighted">
																	<spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><select name="filingStatusId" class="form-control"
																required>

																	<c:forEach var="filingstatuses"
																		items="${bcpFilingstatuses}">
																		<option value="${filingstatuses.filingStatusId}">${filingstatuses.filingStatus}</option>
																	</c:forEach>
															</select></td>

															<td style="padding-right: 10px;">Allowance: <span class="inputHighlighted">
																	<spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="number" name="allowance" value="${employee.allowance}"
																class="form-control" min="0" required /></td>

															<td style="padding-right: 10px;">State Worked: <span class="inputHighlighted">
																	<spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="text" name="stateWorked"
																class="form-control" maxlength="2" value="${employee.stateWorked}" required />
															</td>
                                                            <td colspan="2" style="padding-right: 10px;"><label> W-2 Submitted:
                                                                <input type="checkbox" checked name="w2Submitted" value="Yes" />
                                                            </label></td>
														</tr>
														<tr>
															<td style="padding-right: 10px;">Pay Period: <span class="inputHighlighted">
																	<spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;">
                                                                <label>
                                                                    <input type="radio" name="payPeriod" value="Hourly"
                                                                           ${employee.payPeriod == 'Hourly' ? 'checked' : ''} required /> Hourly
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="payPeriod" value="Daily"
                                                                           ${employee.payPeriod == 'Daily' ? 'checked' : ''} /> Daily
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="payPeriod" value="Salary"
                                                                           ${employee.payPeriod == 'Salary' ? 'checked' : ''} /> Salary
                                                                </label>
                                                            </td>

															<td style="padding-right: 10px;">Amount: <span class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="number" name="amount" value="${employee.amount}"
																class="form-control" required /></td>

															<td style="padding-right: 10px;">
                                                                <label>
                                                                    <input type="checkbox" name="fullTime" value="Yes"
                                                                           /> Full Time
                                                                </label>
                                                            </td>


															<td style="padding-right: 10px;">
                                                                <label>
                                                                    <input type="checkbox" name="partTime" value="Yes"
                                                                         /> Part Time
                                                                </label>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
														</tr>

														<tr>
															<td style="padding-right: 10px;">Hourly Rate: <span class="inputHighlighted">
																	<spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="number" name="hourlyRate"
																class="form-control" value="${employee.hourlyRate}" required /></td>

															<td style="padding-right: 10px;"><label><input type="checkbox" value="Yes"
																	name="overtimeApplied" checked/> Overtime Applied</label></td>
															<td style="padding-right: 10px;">Monthly Salary: <span class="inputHighlighted">
																	<spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="number" name="monthlySalary"
																class="form-control" value="${employee.monthlySalary}" required/></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                       <tr>
                                                       <td colspan="8" align="center"><input type="submit"
                                                       												class="formbutton" name="update" value="Update" />
                                                       												<input type="button" class="formbutton" value="Close" onclick="window.close();" />

                                                       </td>
                                                       </tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>







								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--</div>-->
		<!--</div></div>-->
		<!--</div>-->
		<!--</div>-->


	</form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"></script>

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

