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
<title>BzPayroll - W-9 Form</title>
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
    font-size: 12px;
    padding:0px;
    height:19px;
    padding:2px 4px;
    /* background-color: #f0f0ff; */
}
.digital-input {
    font-family: 'Share Tech Mono', monospace;
    font-size: 16px; /* adjust as needed */
    letter-spacing: 2px; /* adds spacing like your image */
}
</style>
<style>
    input[type="checkbox"] {
        vertical-align: middle;
        margin-right: 5px; /* small spacing */
    }
    label {
        font-size: 10px;
        padding:2px;
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
								W-9 Form </span>
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
<form action="save-new-w9form" method="post" name="w9form">
						<div style="display: flex; width: 100%; margin: 0; border-spacing: 0; border-collapse: collapse;">

							<table cellspacing="0"
								style="border: 0; width: 94%; margin: 0; padding: 0; border-collapse: collapse;"
								class="section-border">
								<tr>

									<td valign="top"
										style="padding-right: 20px; padding-bottom: 20px;">
										<%--////////--%>



										<div class="main-container">
											<div class="row">
												<!-- Form Column -->
												<div class="col-md-12">


														<!-- Panel Start -->
														<div class="panel">
															<div class="panel-header"
																style="background-color: #D3D3D3; text-align:center;">
																<strong>&nbsp;&nbsp;W-9 Form Information</strong>

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
                                                                <table class="table table-bordered boarder" style="margin-bottom:-15px;">
                                                                                                                <!-- Name and Business Name -->
                                                                                                                <tr>
                                                                                                                    <td colspan="6" style="font-size: 10px;"><b>1</b> Name of entity/individual. An entry is required. (For a sole proprietor or disregarded entity, enter the owner’s name on line 1, and enter the business/disregarded
                                                                                                                                                   entity’s name on line 2.)

                                                                                                                        <spring:message code="BzComposer.CompulsoryField.Validation" />

                                                                                                                    <input type="hidden" name="employeeIndexId" />

                                                                                                                        <input type="text" name="nameOfEntity" class="form-control digital-input" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td colspan="6" style="font-size: 10px;"><b>2</b> Business name/disregarded entity name, if different from above

                                                                                                                        <input type="text" name="businessName" class="form-control digital-input" />
                                                                                                                    </td>
                                                                                                                </tr>


                                                                                                                <tr>
                                                                                                                    <td colspan="5" style="font-size: 10px;">
                                                                                                                        <div><b>3a</b> Check the appropriate box for federal tax classification of the entity/individual whose name is entered on line 1. Check<br>
                                                                                                                                only one of the following seven boxes</div>
                                                                                                                        <label><input type="checkbox" name="individual" value="Yes" /> Individual/sole proprietor</label>
                                                                                                                        <label><input type="checkbox" name="cCorporation" value="Yes" /> C corporation</label>
                                                                                                                        <label><input type="checkbox" name="sCorporation" value="Yes" /> S corporation</label>
                                                                                                                        <label><input type="checkbox" name="partnership" value="Yes" /> Partnership</label>
                                                                                                                        <label><input type="checkbox" name="trustOrEstate" value="Yes" /> Trust/estate</label>
                                                                                                                        <label>
                                                                                                                            <input type="checkbox" name="llc" value="Yes" />
                                                                                                                            LLC. Enter the tax classification (C = C corporation, S = S corporation, P = Partnership) . . . . <input type="text" name="llcType" value="${bcpW9Form.llcType}" style="width: 50px;" class="digital-input" /></label>
                                                                                                                            <label>
                                                                                                                       <b>Note:</b> Check the “LLC” box above and, in the entry space, enter the appropriate code (C, S, or P) for the tax<br>
                                                                                                                       classification of the LLC, unless it is a disregarded entity. A disregarded entity should instead check the appropriate
                                                                                                                       box for the tax classification of its owner

                                                                                                                            <br><label><input type="checkbox" name="other" value="Yes" />
                                                                                                                            Other (see instructions)</label>
                                                                                                                            <input type="text" name="otherText"  style="width: 80%;" class="digital-input" />

                                                                                                                    </td>
                                                                                                                    <td rowspan="2" style="font-size: 10px;"><b>4</b> Exemptions (codes apply only to
                                                                                                                                    certain entities, not individuals;
                                                                                                                                    see instructions on page 3):<br><br>
                                                                                                                                    Exempt payee code (if any)
                                                                                                                                    <input type="text" name="exemptCode" class="form-control" style="width:25%" />
                                                                                                                                    <br>Exemption from Foreign Account Tax
                                                                                                                                    Compliance Act (FATCA) reporting
                                                                                                                                     code (if any)
                                                                                                                                    <input type="text" name="fatcaCode" class="form-control digital-input" /><br>
                                                                                                                                    <div style="padding:5px; text-align:center;">(Applies to accounts maintained
                                                                                                                                       outside the United States.)</div>

                                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <!-- 3b -->
                                                                                                                <tr>
                                                                                                                    <td colspan="5" style="font-size: 10px;">
                                                                                                                        <label>
                                                                                                                            <b>3b</b> If on line 3a you checked “Partnership” or “Trust/estate,” or checked “LLC” and entered “P” as its tax classification,<br>
                                                                                                                                      and you are providing this form to a partnership, trust, or estate in which you have an ownership interest, check<br>
                                                                                                                                      this box if you have any foreign partners, owners, or beneficiaries. See instructions . . . . . . . . .
                                                                                                                            <input type="checkbox" name="hasForeignOwners" value="Yes" class="digital-input" />
                                                                                                                        </label>
                                                                                                                    </td>

                                                                                                                </tr>

                                                                                                                <!-- Address -->
                                                                                                                <tr>
                                                                                                                    <td style="font-size: 10px; width:60%;" colspan="3"><b>5</b> Address (number, street, and apt. or suite no.). See instructions
                                                                                                                        <spring:message code="BzComposer.CompulsoryField.Validation" />

                                                                                                                        <input type="text" name="address" class="form-control digital-input" />
                                                                                                                    </td>

                                                                                                                   <td style="font-size: 10px;" colspan="3" rowspan="2" >
                                                                                                                      Requester’s name and address (optional)
                                                                                                                     <textarea name="requesterInfo" class="form-control digital-input" style="width: 100%; height: 4.6em;" ></textarea>
                                                                                                                   </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="font-size: 10px;" colspan="3"><b>6</b> City, state, and ZIP code

                                                                                                                        <input type="text" name="cityStateZip" class="form-control digital-input" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="font-size: 10px;" colspan="6"><b>7</b> List account number(s) here (optional)

                                                                                                                        <input type="text" name="accountNumbers" class="form-control digital-input" />
                                                                                                                    </td>
                                                                                                                </tr>



                                                                                                                <!-- TIN Section -->
                                                                                                                <tr>
                                                                                                                    <td colspan="6" style="font-size: 10px;">
                                                                                                                        <div class="panel">
                                                                                                                            <div class="panel-header" style="background-color: #D3D3D3;">
                                                                                                                                <strong>&nbsp;&nbsp;Part I — Taxpayer Identification Number (TIN)</strong>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                <td style="font-size: 10px; width:70%" colspan="4">
                                                                                                                Enter your TIN in the appropriate box. The TIN provided must match the name given on line 1 to avoid
                                                                                                                backup withholding. For individuals, this is generally your social security number (SSN). However, for a
                                                                                                                resident alien, sole proprietor, or disregarded entity, see the instructions for Part I, later. For other
                                                                                                                entities, it is your employer identification number (EIN). If you do not have a number, see How to get a
                                                                                                                TIN, later.<br>
                                                                                                                <b>Note:</b> If the account is in more than one name, see the instructions for line 1. See also What Name and
                                                                                                                Number To Give the Requester for guidelines on whose number to enter.

                                                                                                                </td>
                                                                                                                    <td style="font-size: 10px; text-align:center;" colspan="2">Social security number<br>

                                                                                                                        <input type="text" name="ssn1" maxlength="3" style="width: 55px;" class="digital-input" /> -
                                                                                                                        <input type="text" name="ssn2" maxlength="2" style="width: 30px;" class="digital-input" /> -
                                                                                                                        <input type="text" name="ssn3" maxlength="4" style="width: 55px;" class="digital-input" />

                                                                                                                   <br><b>or</b> <br>Employer identification number<br>

                                                                                                                        <input type="text" name="ein1" maxlength="2" style="width: 30px;" class="digital-input" /> -
                                                                                                                        <input type="text" name="ein2" maxlength="7" style="width: 110px;" class="digital-input" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>

                                                                    </div>
															</div>
														</div>

												</div>
											</div>

										</div> <%--////////--%>
									</td>
								</tr>
							</table>

						</div>
				<div style="margin-left:89.25%;">
                <table>
                									<tr align="left">
                										<td >
                										<button type="submit" class="formbutton" name="Submit" value="submit">Save</button>
                										</td>
                											</tr>
                											</table>
                											</div>

</form>
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
