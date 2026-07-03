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
<title>BzPayroll - Edit W-2 Form</title>
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
font-size: 14px;
padding:2px;
}
.boarder input, .boarder textarea {
    border: none;
   /* background-color: #f0f0ff;*/
    color: black;
    font-size: 14px;
    padding:0px;
    height:25px;
    padding:4px 4px;
}
.digital-input {
    font-family: 'Share Tech Mono', monospace;
    font-size: 16px; /* adjust as needed */
    letter-spacing: 2px; /* adds spacing like your image */
}

</style>

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
  .employee-row:hover {
    background-color: #f0f0f0;
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
								Edit W-2 Form </span>
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
													<form action="/update-w2form" method="post" name="w2form">

														<!-- Panel Start -->
														<div class="panel">

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

	<table cellspacing="0"
    								style="border: 0; width: 95%; overflow-y: scroll;"
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

    	<table class="table table-bordered boarder" style="border: 1px solid black; margin:0">

    		<tr>
    			<td style="width:20%;">
    			<input type="hidden" name="employeeIndexId" value="${bcpW2Form.employeeIndexId}"/>
    			</td>

    			<td><label for="employeeSocialSecurityNumber" class="label">
    					Employee's social security number <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label><input value="${bcpW2Form.employeeSocialSecurityNumber}" required type="text" name="employeeSocialSecurityNumber" class="form-control digital-input" />
    			</td>
    			<td colspan="3">OBM No. 1545-0029</td>
    		<tr>
    			<td colspan="3"><label for="employerIdentificationNumber" class="label"> b
    					Employer identification number (EIN) <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.employerIdentificationNumber}" required type="text" name="employerIdentificationNumber" class="form-control digital-input" />
    			</td>
    			<td><label for="wagesTipsOtherCompensation" class="label"> 1
    					Wages, tips, other compensation <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.wagesTipsOtherCompensation}" required type="text" name="wagesTipsOtherCompensation" class="form-control" />
    			</td>
    			<td style="width:20%;"><label for="federalIncomeTaxWithheld" class="label"> 2
    					Federal income tax withheld <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.federalIncomeTaxWithheld}" required type="text" name="federalIncomeTaxWithheld" class="form-control" />
    			</td>

    		<tr>
    			<td colspan="3" rowspan="4"><label for="employerNameAddressZip" class="label"> c
    					employer's name, address, ZIP code <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <textarea required type="text" name="employeeNameAddressZip" class="form-control digital-input" style="width: 100%; height: 9em;" >${bcpW2Form.employeeNameAddressZip}</textarea>
    			</td>
    			</tr>
    			<tr>
    			<td><label for="socialSecurityWages" class="label"> 3
                					Social security wages <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                					</span>
                				</label> <input value="${bcpW2Form.socialSecurityWages}" required type="text" name="socialSecurityWages" class="form-control" />
                			</td>
                			<td><label for="socialSecurityTaxWithheld" class="label"> 4
                					Social security tax withheld <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                					</span>
                				</label> <input value="${bcpW2Form.socialSecurityTaxWithheld}" required type="text" name="socialSecurityTaxWithheld" class="form-control" />
                			</td>
    		</tr>
    		<tr>
    		<td><label for="medicareWagesAndTips" class="label"> 5
                        					Medicare wages and tips <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                        					</span>
                        				</label> <input value="${bcpW2Form.medicareWagesAndTips}" required type="text" name="medicareWagesAndTips" class="form-control" />
                        			</td>
                        			<td><label for="medicareTaxWithheld" class="label"> 6
                        					medicare tax withheld <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                        					</span>
                        				</label> <input value="${bcpW2Form.medicareWagesAndTips}" required type="text" name="medicareTaxWithheld" class="form-control" />
                        			</td>
    		</tr>
    <tr>
            		<td><label for="socialSecurityTips" class="label"> 7
                                					Social security tips <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                					</span>
                                				</label> <input value="${bcpW2Form.socialSecurityTips}" required type="text" name="socialSecurityTips" class="form-control" />
                                			</td>
                                			<td><label for="allocatedTips" class="label"> 8
                                					Allocated tips <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                					</span>
                                				</label> <input value="${bcpW2Form.allocatedTips}" required type="text" name="allocatedTips" class="form-control" />

                                			</td>
            		</tr>

    		<tr>
    			<td colspan="3"><label for="controlNumber" class="label"> d
    					Control number <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.controlNumber}" required type="text" name="controlNumber" class="form-control" />
    			</td>
    			<td>
                                        			<label for="box9" class="label"> 9 <span class="inputHighlighted">
                                                    						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                    					</span>
                                                    				</label> <input value="${bcpW2Form.box9}" required type="text" name="box9" class="form-control" />
                                                    			</td>
                                                    			<td><label for="dependentCareBenefits" class="label"> 10
                                                    					Dependent care benefits <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                    					</span>
                                                    				</label> <input value="${bcpW2Form.dependentCareBenefits}" required type="text" name="dependentCareBenefits" class="form-control" />
                                                    			</td>
    		</tr>
    		<tr>
    			<td colspan="3">
    			<table style="width:100%;">
                			<tr>
                			<td>
                    <label for="employeeFirstNameInitial" class="label">
                        Employee's first name and initial
                    </label>
                    <span class="inputHighlighted">
                        <spring:message code="BzComposer.CompulsoryField.Validation" />
                    </span>
                    <input value="${bcpW2Form.employeeFirstName}" required type="text" name="employeeFirstName" class="form-control" />
                   </td>
                   <td>
                    <label for="employeeLastName" class="label">
                        Last name
                    </label>
                    <span class="inputHighlighted">
                        <spring:message code="BzComposer.CompulsoryField.Validation" />
                    </span>
                    <input value="${bcpW2Form.employeeLastName}" required type="text" name="employeeLastName" class="form-control" />
                 </td>
                 <td>
                    <label for="employeeSuffix" class="label">
                        Suffix
                    </label>
                    <span class="inputHighlighted">
                        <spring:message code="BzComposer.CompulsoryField.Validation" />
                    </span>
                    <input value="${bcpW2Form.employeeSuffix}" required type="text" name="employeeSuffix" class="form-control" />
                </td>
               </tr>
               </table>
               </td>


    			<td><label for="nonqualifiedPlan" class="label"> 11
                                                            					Nonqualified plan <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                            					</span>
                                                            				</label> <input value="${bcpW2Form.nonqualifiedPlan}" required type="text" name="nonqualifiedPlan" class="form-control" />
                                                            			</td>
                                                            			<td><label for="box12a" class="label"> 12a <span class="inputHighlighted">
                                                            						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                            					</span>
                                                            				</label> <input value="${bcpW2Form.box12a}" required type="text" name="box12a" class="form-control" />
                                                            			</td>
                			</tr>
                			<tr>
                			<td rowspan="2" colspan="3">
                			<textarea required type="text" name="othersTextArea" class="form-control digital-input" style="width: 100%; height: 8em;" >${bcpW2Form.othersTextArea}</textarea>
                			</td>
                                                			<td> <table style="border: 1px solid red; border-collapse: collapse;">
                                                			<tr><td><b>13</b></td>

                                                            					<td style="text-align:center;"> Statutory employee<br><input type="checkbox" name="statutoryEmployee" value="Yes" <c:if test="${bcpW2Form.statutoryEmployee == 'Yes'}">checked</c:if> />
                                                            					</td>
                                                            					<td style="text-align:center;"> Retirement plan<br><input type="checkbox" id="retirementPlan" name="retirementPlan" value="Yes" <c:if test="${bcpW2Form.retirementPlan == 'Yes'}">checked</c:if> />
                                                            					</td>
                                                            					<td style="text-align:center;"> Third-party sick pay<br><input type="checkbox" id="sickPay" name="thirdPartySickPay" value="Yes" <c:if test="${bcpW2Form.thirdPartySickPay == 'Yes'}">checked</c:if> />
                                                            					</td>
                                                            					</tr>
                                                            					</table>

                                                            			</td>
                                                            			<td><label for="box12b" class="label"> 12b <span class="inputHighlighted">
                                                            						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                            					</span>
                                                            				</label> <input required value="${bcpW2Form.box12b}" type="text" name="box12b" class="form-control" />
                                                            			</td>
                                                			</tr>
                                                			<tr>
                                                			<td rowspan="2"><label for="box14" class="label"> 14
                                                            					Other <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                            					</span>
                                                            				</label> <textarea required type="text" name="box14" class="form-control digital-input" style="width: 100%; height: 5em;">${bcpW2Form.box14}</textarea>
                                                            			</td>
                                                            			<td><label for="box12c" class="label"> 12c <span class="inputHighlighted">
                                                            						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                            					</span>
                                                            				</label> <input value="${bcpW2Form.box12c}" required type="text" name="box12c" class="form-control" />
                                                            			</td>
                                                			</tr>

    		<tr>
    			<td colspan="3"><label for="employeeAddressZip" class="label"> f
    					Employee's address and ZIP code <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.employeeAddressZip}" required type="text" name="employeeAddressZip" class="form-control" />
    			</td>








                                			<td><label for="box12d" class="label"> 12d <span class="inputHighlighted">
                                                                            						<spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                            					</span>
                                                                            				</label> <input value="${bcpW2Form.box12d}" required type="text" name="box12d" class="form-control" />
                                                                            			</td>
                                                                            			</tr>
    		<tr>
    		<td colspan="5">
    		<table style="width:100%;">
    		<tr>
    		<td><label for="state" class="label"> 15
            					State <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
            					</span>
            				</label> <input value="${bcpW2Form.state}" required type="text" name="state" class="form-control" />

            			</td>
    			<td><label for="employerStateIdNumber" class="label">
    					Employer’s state ID number <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.employerStateIdNumber}" required type="text" name="employerStateIdNumber" class="form-control" />
    			</td>
    			<td><label for="stateWagesTips" class="label"> 16
    					State wages, tips, etc. <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.stateWagesTips}" required type="text" name="stateWagesTips" class="form-control" />
    			</td>
    			<td><label for="stateIncomeTax" class="label"> 17
    					State income tax <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.stateIncomeTax}" required type="text" name="stateIncomeTax" class="form-control" />
    			</td>
    			<td><label for="localWagesTips" class="label"> 18
    					Local wages, tips, etc. <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.localWagesTips}" required type="text" name="localWagesTips" class="form-control" />
    			</td>
    			<td><label for="localIncomeTax" class="label"> 19
    					Local income tax <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.localIncomeTax}" required type="text" name="localIncomeTax" class="form-control" />
    			</td>
    			<td><label for="localityName" class="label"> 20
    					Locality name <span class="inputHighlighted"> <spring:message code="BzComposer.CompulsoryField.Validation" />
    					</span>
    				</label> <input value="${bcpW2Form.localityName}" required type="text" name="localityName" class="form-control" />
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
                                                                                                            										<button type="submit" class="formbutton" name="Submit" value="submit">Update</button>
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
