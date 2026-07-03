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
<title><spring:message code="BzComposer.formcustomizationtitle" /></title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
</head>
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
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 22px;
	margin-left: 10px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
	margin-top: 15px;
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
	height: 15px;
	width: 15px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(15px);
	-ms-transform: translateX(15px);
	transform: translateX(15px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 20px;
}

.slider.round:before {
	border-radius: 50%;
}

.parentImage {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.parentImage:hover {
	-moz-transform: scale(2);
	-webkit-transform: scale(2);
	-o-transform: scale(2);
	-ms-transform: scale(2);
	transform: scale(2);
}
</style>
<style>
  .employee-row:hover {
    background-color: #f0f0f0;
  }
</style>
</head>
<!-- <body onload="init1();"> -->
<div onload="init();" style="min-width: 1366px;">
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
								Form 1099 </span>
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
								style="width: 25%; border: 1px solid #ccc; height: 725px; overflow-y: auto;">
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
											<tr lass="employee-row" style="border-bottom: 1px solid #ccc; cursor: pointer;">
												<td style="padding: 10px; font-size: 13px;">
												${empty emp.title ? '' : emp.title}
												${empty emp.firstName ? '' : emp.firstName}
												${empty emp.middleName ? '' : emp.middleName}
												${empty emp.lastName ? '' : emp.lastName}
                                                 </td>
											</tr>
										</c:forEach>
                                               </tbody>

									</table>
								</div>
							</div>




							<table cellspacing="0"
								style="border: 0; width: 100%; overflow-y: scroll;"
								class="section-border">
								<tr>

									<td valign="top"
										style="padding-right: 20px; padding-bottom: 20px;">
										<%--////////--%>



										<div class="main-container">
											<div class="row">
												<!-- Form Column -->
												<div class="col-md-12">
													<form action="#" method="post">

														<!-- Panel Start -->
														<div class="panel">
															<div class="panel-header"
																style="background-color: #D3D3D3;">
																<strong>&nbsp;&nbsp;Form 1099 Information</strong>

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
																	<table class="table table-bordered">
																	<tr>
																	<td colspan="5" style="text-align:center; font-size: 13px;">
																	<input type="checkbox"> VOID   <input type="checkbox"> CORRECTED
																	</td>
																	</tr>
																		<tr>
																			<td style="font-size: 14px;" colspan="2"><label for="ssn" class="label">
																					PAYER'S name, street address, city or town, state or province, country, ZIP or foreign postal code, and telephone no. <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td></td>
																			<td><table style="width:100%; text-align:center;">
                                                                                 																			<tr>
                                                                                 																			<td style="font-size: 14px;">OMB No. 1545-0116<br>Form <b>1099-NEC</b><br>(Rev.April 2025)</td>
                                                                                 																			</tr>
                                                                                 																			<tr>
                                                                                                                                                             <td style="font-size: 14px;">
                                                                                                                                                             		For calendar year<span
                                                                                                                                                             																					class="inputHighlighted"> <spring:message
                                                                                                                                                             																							code="BzComposer.CompulsoryField.Validation" />
                                                                                                                                                             																				</span>
                                                                                                                                                             																			</label> <input type="text" name="ssn" class="form-control" />
                                                                                                                                                             																			</td>

                                                                                                                                                             	</tr>
                                                                                 																			</table></td>
                                                                                 																			<td style="text-align:center; font-size: 13px;"><strong>Nonemployee Compensation</strong></td>
																		<tr>
																			<td style="font-size: 14px;">

																			<label for="ssn" class="label"> b
																					PAYER'S TIN <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td style="font-size: 14px;"><label for="ssn" class="label"> 1
																					RECIPIENT'S TIN <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label"> 2
																					1 Nonemployee compensation <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td rowspan="4" style="text-align:center; font-size: 13px;"> <strong>Copy 1<br>For State Tax Department</strong>
																			</td>

																		<tr>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label"> c
																					RECIPIENT'S name <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td colspan="2" style="font-size: 14px;">2 Payer made direct sales totaling $5,000 or more of consumer products to recipient for resale <input type="checkbox">
																			</td>


																		</tr>

																		<tr>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label"> d
																					Street address (including apt. no.) <span class="inputHighlighted">
																						<spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label"> 3 Excess golden parachute payments <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>

																		</tr>
																		<tr>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label">City or town, state or province, country, and ZIP or foreign postal code</ <span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label"> 4 Federal income tax withheld</ <span class="inputHighlighted">
																						<spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>

																		</tr>
																		<tr>
																			<td colspan="2" style="font-size: 14px;"><label for="ssn" class="label">Account number (see instructions)<span
																					class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td style="font-size: 14px;"><label for="ssn" class="label"> 5 State tax withheld <span class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td style="font-size: 14px;"><label for="ssn" class="label"> 6 State/Payer's state no.
																					<span class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>
																			<td style="font-size: 14px;"><label for="ssn" class="label"> 7 State income
																					<span class="inputHighlighted"> <spring:message
																							code="BzComposer.CompulsoryField.Validation" />
																				</span>
																			</label> <input type="text" name="ssn" class="form-control" />
																			</td>

																		</tr>

																		<!-- Buttons -->
																		<tr>
																			<td colspan="6" style="text-align: center; ont-size: 13px;">
																				<button type="submit" class="btn btn-info"
																					name="Submit" value="submit">Save</button>
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
