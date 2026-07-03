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
<link rel="stylesheet"
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
		$(document)
				.ready(
						function() {

							$('#sellectCountry')
									.on(
											'change',
											function() {
												var id = $(this).val();
												console
														.log("Selected Country ID: "
																+ id);

												$
														.ajax({
															type : 'GET',
															url : '/api/states',
															data : {
																id : id
															},
															dataType : 'json', //  Important: Expecting JSON
															success : function(
																	result) {

																var s;
																for (var i = 0; i < result.length; i++) {
																	s += '<option value="' + result[i].id + '">'
																			+ result[i].name
																			+ '</option>';
																}
																$(
																		'#sellectState')
																		.html(s);
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error(
																				"AJAX Error:",
																				error);
																console
																		.log(
																				"Response Text:",
																				xhr.responseText);
															}
														});
											});

							$('#sellectState')
									.on(
											'change',
											function() {
												var id = $(this).val();
												console
														.log("Selected State ID: "
																+ id);

												$
														.ajax({
															type : 'GET',
															url : '/api/cities',
															data : {
																id : id
															}, // send as query param ?id=...
															dataType : 'json', // expecting JSON from server
															success : function(
																	result) {
																var s;
																for (var i = 0; i < result.length; i++) {
																	console
																			.log("Loop ID: "
																					+ i);
																	s += '<option value="' + result[i].id + '">'
																			+ result[i].name
																			+ '</option>';
																}
																$(
																		'#sellectDistrict')
																		.html(s);
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error(
																				"AJAX Error:",
																				error);
																console
																		.log(
																				"Response Text:",
																				xhr.responseText);
															}
														});

											});
						});
	</script>
	<!-- begin shared/header -->


	<form action="/serviceman-save-employee" method="post" name="employee">
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">

						<div id="padding">
							<!-- begin Contents -->
							<!-- add the code for tab here -->
							<div>
								<span
									style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">Add
									New Employee</span>
							</div>

							<div>
								<div id="tabs" style="height: 720px;">

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


						                            <tr>
															<td width="10%" style="padding-right: 10px;">Employee
																ID:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span>
															</td>
															<td style="padding-right: 10px;"><input type="text"
																name="employeeIndexId" class="form-control" readonly /></td>
															<td colspan="6"></td>
														</tr>
														<tr>
															<td style="padding-right: 10px;">Title: <span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><select
																name="title" class="form-select" required>

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
															<td style="padding-right: 10px;"><input type="text"
																name="firstName" class="form-control" required /></td>

															<td style="padding-right: 10px;">M.I.:</td>
															<td style="padding-right: 10px;"><input type="text"
																name="mi" class="form-control"
																style="width: 70px;" /></td>

															<td width="100px;" style="padding-right: 10px;">Last
																Name: <span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span>
															</td>

															<td style="padding-right: 10px;"><input type="text"
																name="lastName" class="form-control" required /></td>

														</tr>


														<tr>


															<td style="padding-right: 10px;">SSN:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="text"
																name="ssn" class="form-control" required /></td>

															<td style="padding-right: 10px;">Date Of Birth:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="date"
																name="dateofBirth" class="form-control"
																placeholder="dd-mm-yyyy" required /></td>

															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>


														<tr>
															<td style="padding-right: 10px;">Job Title:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><select
																name="jobTitleId" class="form-select" required>
																	<c:forEach var="bcpJobtitle" items="${bcpJobtitleList}">
																		<option value="${bcpJobtitle.jobTitleId}">&nbsp;&nbsp;&nbsp; ${bcpJobtitle.jobTitle}</option>
																	</c:forEach>
															</select></td>

															<td style="padding-right: 10px;">Employee Status:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><select
																name="employeeTypeId" class="form-select" required>
																	<c:forEach var="employeeType"
																		items="${bcpEmployeetypeList}">
																		<option value="${employeeType.employeeTypeId}">${employeeType.employeeType}</option>
																	</c:forEach>
															</select></td>
															<td style="padding-right: 10px;">Job Type: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><select
																name="jobType" class="form-select" required>

																	<c:forEach var="role" items="${employeeRoles}">
																		<option value="${role}">${role}</option>
																	</c:forEach>
															</select></td>

															<td colspan="2"><label> W-9 Field: <input
																	type="checkbox" name="fieldw9" value="Yes" />
															</label></td>

														</tr>

														<tr>

															<td style="padding-right: 10px;">Zip:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="text"
																name="zipCode" class="form-control" required /></td>
															<td style="padding-right: 10px;">City:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><select
																name="cityId" id="sellectDistrict" class="form-select"
																required>
																	<option value="42865">California City</option>
															</select></td>
															<td style="padding-right: 10px;">State:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><select
																name="stateId" id="sellectState" required>
																	<option value="3924">California</option>
															</select></td>
															<td style="padding-right: 10px;">Country:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><select
																id="sellectCountry" name="countryId" class="form-select"
																required>
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
															<td colspan="3" style="padding-right: 10px;"><input
																type="text" name="address1" class="form-control"
																style="width: 100%;" required /></td>


															<td style="padding-right: 10px;">Address2:</td>
															<td colspan="3" style="padding-right: 10px;"><input
																type="text" name="address2" class="form-control"
																style="width: 100%;" /></td>
														</tr>
														<tr>




															<td style="padding-right: 10px;">Phone:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td colspan="2" style="padding-right: 10px;"><input
																type="tel" id="phone" name="phone" class="form-control"
																required></td>
															<td colspan="2"><label> Same as the mobile
																	number: <input type="checkbox" id="sameAsPhone"
																	onclick="copyMobileToPhone()" />
															</label></td>
															<td style="padding-right: 10px;">Mobile:</td>
															<td colspan="2" style="padding-right: 10px;"><input
																type="tel" name="cellPhone" id="mobile"
																class="form-control" /></td>


														</tr>

														<tr>
															<td style="padding-right: 10px;">Email:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td colspan="3" style="padding-right: 10px;"><input
																type="email" name="email" class="form-control" required /></td>

															<td style="padding-right: 10px;">Password: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input
																type="password" id="password" name="password"
																class="form-control" required /></td>

															<td style="padding-right: 10px;">Date of Started:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><input type="date"
																name="dateStarted" class="form-control" required /></td>

														</tr>


														<tr>
															<td style="padding-right: 10px;">Memo:</td>
															<td colspan="3"><textarea name="memo" rows="3"
																	class="form-control"></textarea></td>
															<td style="padding-right: 10px;">Date Added:<span
																class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></span></td>
															<td style="padding-right: 10px;"><input type="date"
																name="dateAdded" class="form-control date-field"
																required /></td>
															<td style="padding-right: 10px;">Terminated Date:<span
																class="inputHighlighted"></td>
															<td style="padding-right: 10px;"><input type="date"
																name="dateTerminated" class="form-control" /></td>
														</tr>
														<tr>
													<thead>
														<tr>
															<th colspan="8">bzcomposer.com</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td colspan="2" style="padding-right: 10px;"><label>Website
																	Access: <input type="checkbox" checked
																	name="websiteAccess" value="Yes" />
															</label></td>

															<td width="10%" style="padding-right: 10px;"><label>Allowed
																	URL: <input type="checkbox" checked name="allowedUrl"
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
														<tr>
															<td colspan="2" style="padding-right: 10px;"><label>Time
																	Clock Access: <input type="checkbox"
																	name="timeClockAccess" value="Yes" checked />
															</label></td>
															<td style="padding-right: 10px;">Code Number: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="text"
																name="codeNumber" class="form-control" required /></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>

													<thead>
														<tr>
															<th colspan="8">PayRoll & Tax Info</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style="padding-right: 10px;">Filing Status: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><select
																name="filingStatusId" class="form-control" required>

																	<c:forEach var="filingstatuses"
																		items="${bcpFilingstatuses}">
																		<option value="${filingstatuses.filingStatusId}">${filingstatuses.filingStatus}</option>
																	</c:forEach>
															</select></td>

															<td style="padding-right: 10px;">Allowance: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input
																type="number" name="allowance" class="form-control"
																min="0" required /></td>

															<td style="padding-right: 10px;">State Worked: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input type="text"
																name="stateWorked" class="form-control" maxlength="2"
																required /></td>
															<td colspan="2" style="padding-right: 10px;"><label>
																	W-2 Submitted: <input type="checkbox" checked
																	name="w2Submitted" value="Yes" />
															</label></td>

														</tr>
														<tr>
															<td style="padding-right: 10px;">Pay Period: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><label><input
																	type="radio" name="payPeriod" value="Hourly" required />
																	Hourly</label> <label><input type="radio"
																	name="payPeriod" value="Daily" /> Daily</label> <label><input
																	type="radio" name="payPeriod" value="Salary" /> Salary</label>
															</td>
															<td style="padding-right: 10px;">Amount: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input
																type="number" name="amount" class="form-control"
																required /></td>

															<td style="padding-right: 10px;"><label><input
																	type="checkbox" checked name="fullTime" value="Yes" />
																	Full Time</label></td>

															<td style="padding-right: 10px;"><label><input
																	type="checkbox" checked name="partTime" value="Yes" />
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
															<td style="padding-right: 10px;"><input
																type="number" name="hourlyRate" class="form-control"
																required /></td>

															<td style="padding-right: 10px;"><label><input
																	type="checkbox" checked name="overtimeApplied" value="Yes" />
																	Overtime Applied</label></td>
															<td style="padding-right: 10px;">Monthly Salary: <span
																class="inputHighlighted"> <spring:message
																		code="BzComposer.CompulsoryField.Validation" />
															</span>
															</td>
															<td style="padding-right: 10px;"><input
																type="number" name="monthlySalary" class="form-control"
																required /></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>

													</tbody>

												</table>
											</div>
										</div>
									</div>







								</div>
								<div>
									<table cellpadding="0" cellspacing="0" border="0"
										align="center" style="width: 100%;">
										<tr>
											<td align="center"><input type="reset"
												class="formbutton" name="clear" value="Clear Data" /> <input
												type="submit" class="formbutton" name="save" value="Save" />
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
		<!--</div>-->
		<!--</div></div>-->
		<!--</div>-->
		<!--</div>-->


	</form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
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

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			let today = new Date().toISOString().split('T')[0];
			document.querySelectorAll(".date-field").forEach(function(el) {
				el.value = today;
			});
		});
	</script>

</body>
</html>

