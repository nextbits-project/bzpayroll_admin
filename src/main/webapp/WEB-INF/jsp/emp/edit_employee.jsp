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
<title>BzPayroll - Edit Employee</title>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"

    <script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
</head>
<style>
table th {
  font-size: 14px !important;
}
</style>
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
                                    //$("#countryID"+indexNo).val(data.country).change();
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
																// Format phone number if it exists
																if (data.phone) {
																	const phoneDigits = String(data.phone).replace(/\D/g, '').substring(0, 10);
																	let formattedPhone = '';
																	if (phoneDigits.length > 0) {
																		if (phoneDigits.length <= 3) {
																			formattedPhone = '(' + phoneDigits;
																		} else if (phoneDigits.length <= 6) {
																			formattedPhone = '(' + phoneDigits.substring(0, 3) + ') ' + phoneDigits.substring(3);
																		} else {
																			formattedPhone = '(' + phoneDigits.substring(0, 3) + ') ' + phoneDigits.substring(3, 6) + '-' + phoneDigits.substring(6);
																		}
																	}
																	$('input[name="phone"]').val(formattedPhone);
																} else {
																	$('input[name="phone"]').val('');
																}
																$('input[name="companyName"]').val(data.companyName || '');
																$('input[name="dbaName"]').val(data.dbaName || '');
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
																// Format mobile number if it exists
																if (data.cellPhone) {
																	const digits = String(data.cellPhone).replace(/\D/g, '').substring(0, 10);
																	let formattedMobile = '';
																	if (digits.length > 0) {
																		if (digits.length <= 3) {
																			formattedMobile = '(' + digits;
																		} else if (digits.length <= 6) {
																			formattedMobile = '(' + digits.substring(0, 3) + ') ' + digits.substring(3);
																		} else {
																			formattedMobile = '(' + digits.substring(0, 3) + ') ' + digits.substring(3, 6) + '-' + digits.substring(6);
																		}
																	}
																	$('input[name="cellPhone"]').val(formattedMobile);
																} else {
																	$('input[name="cellPhone"]').val('');
																}
																$('input[name="password"]').val(data.password || '');
																$('input[name="dateStarted"]').val(data.dateStarted ? data.dateStarted.split('T')[0] : '');
																$('input[name="dateAdded"]').val(data.dateAdded ? data.dateAdded.split('T')[0] : '');
																$('textarea[name="memo"]').val(data.memo || '');
																$('input[name="codeNumber"]').val(data.codeNumber || '');
																$('input[name="allowance"]').val(data.allowance || '');
																$('input[name="stateWorked"]').val(data.stateWorked || '');

                                                                $('input[name="employeeId"]').val(data.id || '');

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


                                                                 $('select[name="employeeStatus"]').val($.trim(data.employeeStatus));
                                                                 $('select[name="filingStatus"]').val(data.filingStatus || '');
																 $('select[name="payPeriod"]').val(data.payPeriod || '');
																 $('select[name="payrollType"]').val(data.payrollType || '');
																 debugger;
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
	<!-- begin shared/header -->


<form action="/update-employee" method="post" name="employee"  onsubmit="return validateFileSize()">

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
								<div id="tabs" style="height: 950px;">

									<div id="General-1">
										<div id="content1" class="tabPage">
                                            <!-- BUTTONS (AFTER TABLE, RIGHT ALIGNED) -->
                                                    <div style="width:100%; overflow:hidden;">
                                                        <div style="float:right;">
                                                            <input type="submit" class="formbutton" name="update" value="Update" />
                                                            <input type="button" class="formbutton" value="Close" onclick="window.close();" />
                                                        </div>
                                                    </div>
											<div id="table-negotiations">
												<table class="tabla-listados" cellspacing="0" style="margin-top:-1px;">
													<thead>
														<tr>
															<th colspan="8">Employee Information</th>
														</tr>
													</thead>
													<tbody>
														<!-- Row 1: Title, First Name, M.I., Last Name -->
														<tr>
															<td style="padding-right: 10px;">Employee ID:</td>
															<td style="padding-right: 10px;">
															<input type="text" name="employeeId" value="${employee.id}"
                                                                       class="form-control" readonly /></td>
															<td colspan="4"></td>
                                                            <%--<td>Photo:</td>
                                                            <td>
                                                                <input type="file" name="file" id="file" accept="image/*" />
                                                                <br>
                                                                <small style="color: #666;">Note: Upload a passport-size photo in JPG, JPEG, or PNG format (under 50 KB).</small>
                                                            </td>--%>
                                                            <td colspan="2"></td>
														</tr>
														<tr>
															<td style="padding-right: 10px;">Title: </td>
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
															<td style="padding-right: 10px;" colspan="5">
															<div style="display:flex; align-items:center; gap:8px;">
															<input type="text" name="firstName" style="width: 35%;" value="${employee.firstName}"
																class="form-control" required />
                                                            <label style="margin:0; white-space:nowrap;">
                                                            M.I.:
															</label>
															<input type="text" name="mi" value="${employee.mi}"
																class="form-control" style="width:70px;" />
                                                           <label style="margin:0; white-space:nowrap;">
                                                           Last Name: <span class="inputHighlighted"><spring:message
                                                                 code="BzComposer.CompulsoryField.Validation" /></span>
                                                           </label>
															<input type="text" name="lastName" value="${employee.lastName}"
																class="form-control" style="width:150%;" required/>
																</div>
																</td>

														</tr>


														<tr>
                                                           <td rowspan="6" colspan="3">
                                                            <img id="empPhoto"
                                                               src="https://bzcomposer.com/bucket${employee.photo}"
                                                               alt="Passport Photo"
                                                              style="width:320px;height:220px;border:1px solid #ccc;">
                                                           </td>
															<td style="padding-right: 10px;">SSN:<span class="inputHighlighted"><spring:message
																		code="BzComposer.CompulsoryField.Validation" /></td>
															<td style="padding-right: 10px;"><input type="text" name="ssn" value="${employee.ssn}"
																class="form-control"/></td>

															
															<td style="padding-right: 10px;">

																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																Date Of Birth:
																</label>
																<input type="date" name="dateofBirth" value="${employee.dateofBirth}"
																class="form-control" placeholder="dd-mm-yyyy"/>
																</div>
																</td>
                                                            <td></td>

														</tr>


														<tr>
															<td style="padding-right: 10px;">Job Title:</td>
															<td style="padding-right: 10px;"><select name="jobTitle" class="form-select" >

																	<c:forEach var="bcpJobtitle"
																		items="${bcpJobtitleList}">
																		<option value="${bcpJobtitle.jobTitle}">&nbsp;&nbsp;&nbsp; ${bcpJobtitle.jobTitle}</option>
																	</c:forEach>
															</select></td>

															<td style="padding-right: 10px;">Employee Status:</td>


																<td style="padding-right: 10px;">
                                                                    <select name="employeeStatus">
                                                                        <c:forEach var="employeeType" items="${bcpEmployeetypeList}">
                                                                            <option value="${employeeType.employeeType}">
                                                                                ${employeeType.employeeType}
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                            <td></td>
														</tr>
														<tr>
														<td style="padding-right: 10px;">
                                                         Job Type:
                                                        </td>
                                                        <td >
                                                            <select name="jobType" class="form-select" >

                                                                <c:forEach var="role" items="${employeeRoles}">
                                                                    <option value="${role}">${role}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        <td colspan="3">
                                                        <label> W-9 Field: <input
                                                        type="checkbox" name="fieldw9" value="Yes"
                                                        <c:if test="${employee.fieldw9 == 'Yes'}">checked="checked"</c:if>
                                                         />
                                                        </label>
                                                        </td>
														</tr>
														<tr>
														<td>Company Name:</td>
                                                        <td style="padding-right: 10px;"><input type="text"
                                                         name="companyName" class="form-control" /></td>
                                                        <td>DBA Name:</td>
                                                        <td style="padding-right: 10px;"><input type="text"
                                                            name="dbaName" class="form-control" /></td>
                                                            <td></td>
                                                        </tr>
                                                           <tr>
															<td style="padding-right: 10px;">Address1:</td>
															<td colspan="4" style="padding-right: 10px;"><input type="text" name="address1" value="${employee.address1}"
																class="form-control" style="width: 100%;" /></td><td></td>
																</tr>
																<tr>
                                                            <td style="padding-right: 10px;">Address2:</td>
                                                            <td colspan="4" style="padding-right: 10px;"><input type="text" name="address2" value="${employee.address2}"
                                                              class="form-control" style="width: 100%;" /></td>

														</tr>
														<tr>

															<td colspan="3" style="text-align:center;">
                                                            <label for="file" class="formbutton" title="Note: Upload a passport-size photo in JPG, JPEG, or PNG format (under 50 KB).">Choose File</label>
                                                            <input type="file" name="file" id="file" accept="image/*" style="display:none;" onchange="uploadPhoto()" />
                                                             <input type="hidden" name="passportPhoto" id="passPhoto">
                                                             </td>
                                                              <td style="padding-right: 10px;">Zip Code:</td>
                                                             <td style="padding-right: 10px;"><input type="text" name="zipCode" value="${employee.zipCode}"
                                                                 class="form-control" onfocusout="loadAddressDetailsByZipcode(this.value, 1)"/></td>
															
                                                            <td style="padding-right: 10px;">
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																City:
																</label>
                                                                <select name="cityId" id="sellectDistrict" class="form-select">
                                                                    <c:forEach items="${cityList}"
                                                                        var="mxObject">
                                                                        <option
                                                                            id="cityId${mxObject.cityId}"
                                                                            value="${mxObject.cityId}">
                                                                            ${mxObject.cityName}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
																</div>
                                                            </td>
                                                            <td></td>
														</tr>
                                                       <tr>
                                                        <td style="padding-right: 10px;">State:</td>
                                                        <td style="padding-right: 10px;">
                                                        <select name="stateId" id="sellectState" >
                                                           <c:forEach items="${stateList}"
                                                               var="stateItem">
                                                               <option
                                                                   value="${stateItem.stateId}">
                                                                   ${stateItem.state}
                                                               </option>
                                                           </c:forEach>
                                                           </select>
                                                           </td>
                                                           <td></td>
                                                        <td style="padding-right: 10px;">Country:</td>
                                                        <td style="padding-right: 10px;">
                                                            <select id="sellectCountry" name="countryId" class="form-select">

                                                            <c:forEach var="bcpcountries" items="${countries}">
                                                            <option value="${bcpcountries.id}">${bcpcountries.name}</option>
                                                            </c:forEach>
                                                           </select>
                                                        </td>
                                                        <td colspan="3"></td>
                                                       </tr>

														<tr>
															<td style="padding-right: 10px;">Phone:</td>
															<td colspan="2" style="padding-right: 10px;">
                                                              <input
                                                                type="tel"
                                                                name="phone"
                                                                id="phone"
                                                                class="form-control"
                                                                value="${employee.phone}"
                                                                placeholder="1(213)732-9638"
                                                                maxlength="14"
                                                                title="Format: 1(213)732-9638">
                                                            </td>

															<td colspan="2"><label> Same as the mobile
																	number: <input name="sameAsPhoneNo" type="checkbox" id="sameAsPhone"
																	onclick="copyMobileToPhone()" />
															</label></td>
															
															<td colspan="3">
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																Mobile:
																</label>
                                                              <input
                                                                type="tel"
                                                                name="cellPhone"
                                                                id="mobile"
                                                                class="form-control"
                                                                value="${employee.cellPhone}"
                                                                placeholder="(555) 555-5555"
                                                                maxlength="14">
																</div>
                                                            </td>


														</tr>
														<tr>
															<!-- Wrap Email label input and Date of added in div flex box -->
															<td colspan="5">
																<div style="display: flex; align-items: center; gap: 16px;">
																	<div style="display: flex; align-items: center; gap: 6px; width: 50%;">
																		<label style="margin-bottom: 0; width: 70px;">Email:</label>
																		<input
																			type="email"
																			name="email"
																			value="${employee.email}"
																			class="form-control"
																		/>
																	</div>
																	<div style="display: flex; align-items: center; gap: 6px; width: 35%;">
																		<label style="margin-bottom: 0; width: 200px;">Date of Started:</label>
																		<input
																			type="date"
																			name="dateStarted"
																			value="${employee.dateStarted}"
																			class="form-control"
																		/>
																	</div>
																</div>
															</td>
														</tr>
														<tr>
                                                            <td style="padding-right: 10px;">Memo:</td>
                                                            <td colspan="3">
                                                                <textarea name="memo" rows="3" class="form-control">${employee.memo}</textarea>
                                                            </td>
                                                            <td colspan="2">
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																Date Added:
																</label>
																<input type="date" name="dateAdded" value="${employee.dateAdded}"
																class="form-control date-field"/>
																</div>
																</td>
														<td colspan="2">
														<div style="display:flex; align-items:center; gap:8px;">
                                                        <label style="margin:0; white-space:nowrap;">
														Terminated Date:
														</label>
                                                                  <input type="date" id="dateTerminated" name="dateTerminated" value="${employee.dateTerminated}" class="form-control" />
                                                                </div>
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

														<td colspan="3" style="padding-right: 10px;"><input
															type="text" value="https://bzcomposer.com/" name=""
															class="form-control" readonly /></td>
															<td><label>Allowed
                                                            URL: <input type="checkbox" checked name="allowedUrl"
                                                                        <c:if test="${employee.allowedUrl == 'Yes'}">checked="checked"</c:if>
                                                            value="Yes" />
                                                           </label></td>
															<td colspan="2">
															<div style="display:flex; align-items:center; gap:8px;">
                                                            <label style="margin:0; white-space:nowrap;">
                                                            Password:
                                                            </label>
                                                                <input type="password" id="password" name="password" class="form-control" />
                                                            </div>
                                                            </td>
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
                                                                                     <c:if test="${employee.timeClockAccess == 'Yes'}">checked="checked"</c:if>
																name="timeClockAccess" value="Yes" checked />
														</label></td>
														
														<td>
															<div style="display:flex; align-items:center; gap:8px;">
															<label style="margin:0; white-space:nowrap;">
															Code Number:
															</label>
															<input type="text" value="${employee.codeNumber}"
															name="codeNumber" class="form-control"  />
															</div>
															</td>
														</tr>
													</tbody>

													<thead>
														<tr>
															<th colspan="8">PayRoll & Tax Info</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>Filing Status:
															</td>
															<td><select name="filingStatus" class="form-control"
																>
                                                                      <option value="Single">Single</option>
																		<option value="Married">Married</option>
																		<option value="Unmarried head of household">Unmarried head of household</option>

																	<c:forEach var="filingstatuses"
																		items="${bcpFilingstatuses}">
																		<option value="${filingstatuses.filingStatusId}">${filingstatuses.filingStatus}</option>
																	</c:forEach>
															</select></td>

															
															<td>
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																Allowance:
																</label>
																<input type="number" name="allowance" value="${employee.allowance}"
																class="form-control" min="0" />
																</div>
																</td>
															<td>
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																State Worked:
																</label>
																<input type="text" name="stateWorked"
																class="form-control" maxlength="2" value="${employee.stateWorked}" />
																</div>
																</td>
                                                            <td colspan="2">
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <label>
                                                                W-2 Submitted: <input type="checkbox" checked name="w2Submitted" value="Yes" />
                                                                </label></td>
																<td></td>
                                                                <td></td>
                                                                <td></td>
														</tr>
														<tr>
															<td>Pay Period:</td>
															<!-- <td colspan="2">
                                                                <label>
                                                                    <input type="radio" name="payPeriod" value="Hourly"
                                                                           ${employee.payPeriod == 'Hourly' ? 'checked' : ''} /> Hourly
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="payPeriod" value="Daily"
                                                                           ${employee.payPeriod == 'Daily' ? 'checked' : ''} /> Daily
                                                                </label>
                                                                <label>
                                                                    <input type="radio" name="payPeriod" value="Salary"
                                                                           ${employee.payPeriod == 'Salary' ? 'checked' : ''} /> Salary
                                                                </label>
                                                            </td> -->
															<td>
                                                                <select style="width:100%;" name="payPeriod" class="form-select" >
                                                                    <c:forEach var="payPeriod"
                                                                        items="${bcpPayPeriodList}">
                                                                        <option value="${payPeriod.payPeriod}">${payPeriod.payPeriod}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
															<td colspan="2">
                                                                <div style="display:flex; align-items:center; gap:8px;">Payroll Type:
                                                                <select style="width:50%;" name="payrollType" class="form-select">
                                                                    <c:forEach var="payrollType"
                                                                        items="${bcpPayrollTypeList}">
                                                                        <option value="${payrollType.payrollType}">${payrollType.payrollType}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                </div>
                                                            </td>

															
															<td>
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																Amount:
																</label>
																<input type="number" name="amount" value="${employee.amount}"
																class="form-control" />
																</div>
																</td>

															<td>
                                                                <label>
                                                                    <input type="checkbox" name="fullTime" value="Yes"
                                                                           /> Full Time
                                                                </label>
                                                            </td>

															<td>
                                                                <label>
                                                                    <input type="checkbox" name="partTime" value="Yes"
                                                                         /> Part Time
                                                                </label>
                                                            </td>
                                                            <td></td>
														</tr>

														<tr>
															<td>Hourly Rate:
															</td>
															<td><input type="number" name="hourlyRate"
																class="form-control" value="${employee.hourlyRate}" /></td>

															<td><label><input type="checkbox" value="Yes"
																	name="overtimeApplied" checked/> Overtime Applied</label></td>
															<td>
																<div style="display:flex; align-items:center; gap:8px;">
																<label style="margin:0; white-space:nowrap;">
																Monthly Salary:
																</label>
																<input type="number" name="monthlySalary"
																class="form-control" value="${employee.monthlySalary}"/></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
														</tr>
														</tr>
													<thead>
														<tr>
															<th colspan="8">Other Deductions</th>
														</tr>
													</thead>
													<tbody>
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
													</tbody>
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
    		const phoneInput = window
    				.intlTelInput(
    						phoneInputField,
    						{
    							initialCountry : "us",
    							preferredCountries : [ "us", "in", "gb" ],
    							separateDialCode : true,
    							nationalMode : false,
    							utilsScript : "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
    						});

    	</script>

    	<script>
    		// Function to format phone number as (555) 555-5555
    		function formatPhoneNumber(value) {
    			// Remove all non-digit characters
    			const digits = value.replace(/\D/g, '');
    			
    			// Limit to 10 digits
    			const limitedDigits = digits.substring(0, 10);
    			
    			// Format as (XXX) XXX-XXXX
    			if (limitedDigits.length === 0) {
    				return '';
    			} else if (limitedDigits.length <= 3) {
    				return '(' + limitedDigits;
    			} else if (limitedDigits.length <= 6) {
    				return '(' + limitedDigits.substring(0, 3) + ') ' + limitedDigits.substring(3);
    			} else {
    				return '(' + limitedDigits.substring(0, 3) + ') ' + limitedDigits.substring(3, 6) + '-' + limitedDigits.substring(6);
    			}
    		}

    		// Apply formatting to phone field
    		const phoneField = document.getElementById("phone");
    		if (phoneField) {
    			// Format on input
    			phoneField.addEventListener('input', function(e) {
    				const cursorPosition = e.target.selectionStart;
    				const oldValue = e.target.value;
    				const newValue = formatPhoneNumber(e.target.value);
    				
    				// Only update if formatting changed
    				if (oldValue !== newValue) {
    					e.target.value = newValue;
    					// Adjust cursor position
    					const lengthDiff = newValue.length - oldValue.length;
    					e.target.setSelectionRange(cursorPosition + lengthDiff, cursorPosition + lengthDiff);
    				}
    			});
    			
    			// Format existing value on load
    			setTimeout(function() {
    				if (phoneField.value) {
    					phoneField.value = formatPhoneNumber(phoneField.value);
    				}
    			}, 100);
    		}

    		// Apply formatting to mobile field
    		const mobileField = document.getElementById("mobile");
    		if (mobileField) {
    			// Format on input
    			mobileField.addEventListener('input', function(e) {
    				const cursorPosition = e.target.selectionStart;
    				const oldValue = e.target.value;
    				const newValue = formatPhoneNumber(e.target.value);
    				
    				e.target.value = newValue;
    				
    				// Adjust cursor position
    				const lengthDiff = newValue.length - oldValue.length;
    				e.target.setSelectionRange(cursorPosition + lengthDiff, cursorPosition + lengthDiff);
    			});
    			
    			// Format existing value on load
    			if (mobileField.value) {
    				mobileField.value = formatPhoneNumber(mobileField.value);
    			}
    		}

    		const checkbox = document.getElementById("sameAsPhone");

    		if (checkbox && phoneField && mobileField) {
    			checkbox.addEventListener("change", function() {
    				if (this.checked) {
    					// Copy phone to mobile and format it
    					mobileField.value = formatPhoneNumber(phoneField.value);
    					mobileField.readOnly = true; // Make mobile read-only

    				} else {
    					mobileField.readOnly = false; // Remove read-only
    					mobileField.value = ""; // Clear mobile field

    				}
    			});
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
</body>
</html>
