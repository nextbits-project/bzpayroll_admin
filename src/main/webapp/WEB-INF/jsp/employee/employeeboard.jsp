<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page isELIgnored="false"%>
<%--<%@ page errorPage="/WEB-INF/jsp/include/sessionExpired.jsp"%>--%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
	<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
	<title><spring:message code="BzComposer.hiredemployeelisttitle"/>
	</title>
	<link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
 	<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
     <!-- Bootstrap CSS CDN -->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .main-container {
                padding: 20px;
                max-width: 1400px;
                margin: 0 auto;
            }
            .panel {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
                margin-bottom: 20px;
                border: 1px solid #ddd;
            }
            .panel-header {
                padding: 15px 20px;
                border-bottom: 1px solid #eee;
                font-size: 18px;
                font-weight: 500;
                color: #333;
            }
            .panel-body {
                padding: 20px;
            }
            .form-control, .custom-select {
                border: 1px solid #ced4da;
                border-radius: 4px;
                height: calc(2.25rem + 2px);
                padding: .375rem .75rem;
                font-size: 14px;
            }
            .form-control:focus, .custom-select:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }
            label {
                font-size: 14px;
                font-weight: 500;
                color: #444;
                margin-bottom: 5px;
            }
            .btn-info {
                background-color: #17a2b8;
                border-color: #17a2b8;
            }
            .btn-info:hover {
                background-color: #138496;
                border-color: #117a8b;
            }
            .employee-list-container {
                border: 1px solid #ddd;
                border-radius: 4px;
                height: 600px;
                overflow-y: auto;
            }
            #employeeTable {
                width: 100%;
            }
            #employeeTable th {
                background-color: #f8f9fa;
                padding: 10px;
                font-size: 14px;
                font-weight: 500;
                border-bottom: 1px solid #ddd;
            }
            #employeeTable td {
                padding: 10px;
                font-size: 14px;
                border-bottom: 1px solid #eee;
            }
            #employeeTable tr:hover {
                background-color: #f1f1f1;
                cursor: pointer;
            }
            .form-layout {
                display: flex;
                flex-wrap: wrap;
            }
            .form-group {
                margin-bottom: 1rem;
            }
            .form-column {
                flex: 1;
                min-width: 250px;
                padding: 0 10px;
            }
            .action-buttons {
                text-align: right;
                padding: 15px;
                border-top: 1px solid #eee;
            }
            .payroll-table {
                width: 100%;
            }
            .payroll-table th {
                background-color: #f8f9fa;
                color: #333;
                border: 1px solid #dee2e6;
                padding: 10px;
                font-weight: 500;
            }
            .payroll-table td {
                border: 1px solid #dee2e6;
                padding: 10px;
                vertical-align: middle;
            }
            .payroll-table tr:hover {
                background-color: #f5f5f5;
            }
            .table-container {
                background-color: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            }
            .btn-sm {
                padding: 5px 10px;
                font-size: 12px;
            }
            .no-records {
                text-align: center;
                padding: 30px;
                color: #777;
            }
            .alert {
                margin-bottom: 20px;
            }

            <!----!>
            .employee-card {
                border: none;
                border-radius: 12px;
                overflow: hidden;
            }

            .employee-card.card-header {
                background-color: #00acc1; /* Turquoise Blue */
                font-size: 18px;
                font-weight: bold;
                padding: 12px;
            }

            .employee-scroll-container {
                max-height: 450px;
                overflow-y: auto;
                border-top: 1px solid #ddd;
            }

            .table td {
                padding: 12px 16px;
                font-size: 14px;
                background-color: #fff;
                border-bottom: 1px solid #eee;
            }

            .row-employee:hover {
                background-color: #f1f1f1;
                cursor: pointer;
            }
            #css{
               background: linear-gradient(135deg, #00ACC1, #00ACC1);
                        padding: 16px 24px;
                        border-radius: 8px;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                        color: #ffffff;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        font-size: 1.25rem;
                        font-weight: bold;
                        display: flex;
                        align-items: center;
                        justify-content: center;
            }
              #css1 th {
                  background: linear-gradient(135deg, #00ACC1, #00ACC1);
                  padding: 12px 20px;
                  border-radius: 8px;
                  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                  color: #ffffff;
                  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                  font-size: 1.50rem;
                  font-weight: bold;
                  text-align: center;
              }

        </style>








                                                                                                <style>
                                                                                                                                                                                    .selected-cell {
                                                                                                                                                                                        background-color: #7b8081 !important;
                                                                                                                                                                                        color: white !important;
                                                                                                                                                                                    }
                                                                                                                                                                                    </style>
	<style type="text/css">
		div#pie { /* 	color:#05A9C5;; */
			padding: 10px 0px 20px 0px;
		}
		table.tabla-listados {
			width: 100%;
			border: 1px solid rgb(207, 207, 207);
			margin: 20px 0px 20px 0px;
		}

		table.tabla-listados thead tr th {
			font-size: .7em;
			text-align: left;
			padding: 5px 10px;
			/* 	background: rgba(5, 169, 197, 0.11); */
			border-bottom: 1px solid rgba(5, 169, 197, 0.2);
			/* 	color: #333; */
			text-shadow: #999 0px 1px 1px;
			white-space: nowrap;
		}

		table.tabla-listados tbody tr td {
			font-size: .8em;
			/* 	color: #666; */
			padding: 5px 0px 5px 14px;
			/* 	border-bottom: 1px solid rgb(207, 207, 207); */
			background: #fff;
			vertical-align: top;
		}
	</style>
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
</head>
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
                        <span style="font-size: 1.6em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                           Employee Board
                        </span>
							<table>
								<tr>
									<td>

									</td>
									<td>

									</td>
									<td colspan="4">&nbsp;</td>
								</tr>
							</table>
							<table>
								<tr>
									<td>
										<spring:message code="BzComposer.searchbuttontext" />
									</td>
									<td>
										<input type="text" id="myInput">
									</td>
									<td colspan="4">&nbsp;</td>
								</tr>
							</table>
							<br>
						</div>
						<div style="display: flex; justify-content: flex-end; align-items: flex-end; height: 100px;">
							<table>
								<tr align="right">
									<td colspan="6" style="font-size: 14px;">

										<input type="button" name="editAction" value='<spring:message code="BzComposer.global.edit" />'
											   title='<spring:message code="BzComposer.vendorlist.edittooltip" />' class="formButton" onclick="showEditEmployee();">
										<input type="button" name="deleteAction" value='<spring:message code="BzComposer.global.delete" />'
											   title='<spring:message code="BzComposer.vendorlist.deletetooltip" />' class="formButton" onclick="DeleteEmployee();">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- dialog space -->
					<!-- Dialog used in vendor list page -->
					<div id="showSelectVendorDialog" style="display:none;">
						<p><spring:message code="BzComposer.vendorlist.selectvendordialog"/></p>
					</div>
					<div id="emptyemployeeidDialog" style="display:none;">
						<p><spring:message code="BzComposer.Employee.emptyEmployeeDialog"/></p>
					</div>

					<div id="deleteVendorDialog" style="display:none;">
						<p><spring:message code="BzComposer.vendorlist.selectvendortodelete"/></p>
					</div>
					<div id="deleteRowDialog" style="display:none;">
						<p><spring:message code="BzComposer.employee.deleteselectedemployee"/></p>
					</div>
					<div>
						<hidden path="clientVendorID" Id="clientVendorID" />
						<hidden path="selectedRowID" />
						<input type="hidden" id="employeeId" value="" />
						<input type="hidden" name="venrId" id="venrId" value="" />
						<input type="hidden" name="cvId" id="cvId" value=""/>
						<input type="hidden" name="tabid" id="tabid" value="" />
						<input type="hidden" name="SelectedRID" id="setRID" value="">
						<input type="hidden" name="bst" id="bsst" value="0" />
						<hidden path="state" value="0" />
						<hidden path="bsstate" value="0" />
						<hidden path="shstate" value="0" />
					</div>
					<!-- end Contents -->
					<input type="hidden" name="actionValidate" value="vendor.jsp">
					<table style="width: 100%;">
						<tr>
							<td style="font-size: 14px;">
								<table style="width: 100%;"class="dataTable no-foter customer-table">
									<tr>

										<td style="padding:0px; margin:0px; boarder:2px;">

                                                                    <div class="panel-header" id="css">
                                                                        Employee List
                                                                    </div>
                                                                     <div class="d-flex justify-content-between align-items-center px-3 py-2 mb-3" style="background-color: #f8f9fa; border-radius: 6px;">
                                                                            <label class="form-check-label mb-0" for="flexSwitchCheckDefault">View: Active / Inactive:</label>
                                                                            <div class="form-check form-switch">
                                                                              <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onchange="toggleTabs()">
                                                                            </div>
                                                                          </div>



<div style="height:550px; overflow-y:auto;">
<div class="tab-content" id="employeeTabsContent">
        <!-- Active Tab -->
        <div class="tab-pane fade show active" id="active" role="tabpanel">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead class="table-light">
                <tr>
                  <td>Employee Name</td>
                </tr>
              </thead>
              <tbody>
             <c:forEach var="employee" items="${allInActiveEmployees}">
               <tr>
                 <td>
                   ${employee.firstName}
                   <c:if test="${not empty employee.middleName}"> ${employee.middleName}</c:if>
                   ${employee.lastName}
                 </td>
               </tr>
             </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
           <div class="tab-pane fade" id="inactive" role="tabpanel">
                     <div class="table-responsive">
                       <table class="table table-bordered table-hover">
                         <thead class="table-light">
                      <thead class="table-light">
                        <tr>
                          <td>Employee Name</td>
                          <td>Full/Part Time</td>
                          <td>Salary/ Hourly</td>
                          <td>Regular/ Contractor</td>
                        </tr>
                      </thead>
                      <tbody>
                    <c:forEach var="employee" items="${allActiveEmployees}">
                          <tr>
                            <td>${employee.firstName}
                                   <c:if test="${not empty employee.middleName}"> ${employee.middleName}</c:if>
                                   ${employee.lastName}
                            </td>
                            <td>${employee.employeeType}</td>
                            <td>${employee.paymentType}</td>
                            <td>${employee.employeeType}</td>
                          </tr>
                        </c:forEach>
                   </tbody>
                              </table>
                            </div>
                          </div>
                          </div>
                           </div>
										</td>




										<td style="font-size:14px; margin: 0; padding: 0;vertical-align: 0;">
											<c:if test="${not empty empList1}"></c:if>
											<div id="table-negotiations" >
												<table cellspacing="0" class="tabla-listados " style="margin-top: 0; margin-left: 20px;">
													<thead >
													<tr id="css1">
														<th colspan="10">
															<spring:message code="BzComposer.Employee.GeneralInformation"/>
														</th>
													</tr>
													</thead>
													<tbody>
													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Title" />:
														</td>
														<td style="font-size:14px;">
															<select id="employeeTitle" disabled="true" style="width:125px;">
																<c:forEach items="${titleList}" var="obj">
																	<option value="${obj.value}">${obj.label}</option>
																</c:forEach>
															</select>
														</td>

														<td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.FirstName" />
															<!-- <span class="inputHighlighted">*</span> --> :
														</td>

														<td id="employeeFName" style="font-size:14px;">
 														</td>
														<td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.MiddleName" />
															<!-- <span class="inputHighlighted">*</span> --> :
														</td>
														<td id="employeeMName" style="font-size:14px;">
 														</td>
														<td colspan="4">&nbsp;</td>
													</tr>

													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.LastName" />
															<!-- <span class="inputHighlighted">*</span> --> :
														</td>
														<td id="employeeLName" style="font-size:14px;">
 														</td>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.SSN" />
														</td>
														<td id="employeeSSN" style="font-size:14px;">
															${empList1[0].ssn}
 														</td>

                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.DOB" />:
														</td>

														<td id="employeeDOB" style="font-size:14px;">

  														</td>
  														<td colspan="4">&nbsp;</td>
													</tr>

													<tr>
                                                        <td   style="font-size:1em;">
                                                            <spring:message code="BzComposer.newemployee.jobtitle" />
                                                        </td>
													    <td>
                                                            <select id="employeeJobTitle" style="font-size:1em;" disabled>
                                                                <option value=""><spring:message code="BzComposer.ComboBox.Select" /></option>
                                                                <c:forEach items="${jtitleList}" var="obj">
                                                                    <option value="${obj.value}">${obj.label}</option>
                                                                </c:forEach>
                                                            </select>
													    </td>
													    <td colspan="8">&nbsp;</td>

													</tr>

													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Address1" />
															<span class="inputHighlighted">*</span>
														</td>
														<td colspan="5" id="employeeAddress1" style="font-size:14px;">
															<%-- <text style="width:100%;" path="address1" name="vendorDetails1" readonly="true" /> --%>
															${empList1[0].address1}

														</td>

														<td colspan="4">&nbsp;</td>
													</tr>
													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Address2" />
															<span class="inputHighlighted">:</span>
														</td>
														<td colspan="5" id="employeeAddress2" style="font-size:14px;">
															<%-- <text style="width:100%;" path="address2" name="vendorDetails1" readonly="true" /> --%>
															${empList1[0].address2}
 														</td>

														<td colspan="4">&nbsp;</td>
													</tr>

													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Zip" />
															<!-- <span class="inputHighlighted">*</span> --> :
														</td>
														<td id="employeeZip" style="font-size:14px;">
															${empList1[0].zip}
 														</td>
                                                        <td  style="font-size:14px;">
															<spring:message code="BzComposer.Employee.City" />
 														</td>
														<td id="employeeCity" style="width:10%;font-size:14px;">
															${empList1[0].city}
 														</td>
                                                        <td id="t_state" style="font-size:14px;">
															<spring:message code="BzComposer.Employee.State" />
														</td>
														<td id="t_statedata" style="font-size:14px;"></td>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Province" />
														</td>
														<td id="employeeProvince" style="width: 10%;font-size:14px;">
															${vendorDetails1.province}
 														</td>
														<td colspan="2">&nbsp;</td>
													</tr>
                                                	<tr>
														<td id="t_country" style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Country" />
														</td>
														<td style="font-size:14px;">
															<select id="employeeCountry" disabled="true">
																<option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</option>
																<c:forEach items="${cList}" var="obj">
																	<option value="${obj.value}">${obj.label}</option>
																</c:forEach>
															</select>
														</td>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Phone" />
														</td>
														<td id="employeePhone" style="width: 10%;font-size:14px;">
  														</td>
                                                        <td colspan="2" style="font-size:14px;">
															<input type="checkbox" name="sameAsMobileNumber" disabled="disabled"/>
                                                            <spring:message code="BzComposer.global.sameasmobileno"/>
                                                        </td>
														 <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Mobile" />
														</td>
														<td id="employeeMobile" style="width: 10%;font-size:14px;">
  														</td>
														<td colspan="1">&nbsp;</td>
													</tr>
													<script>
														<c:if test="${not empty state_gen}">
														var contry=document.VendorForm.country.value;
														refreshItemsNow33(contry,'${state_gen}');
														</c:if>
													</script>
													 <tr>

														<td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Email" />
														</td>
														<td id="employeeEmail" style="font-size:14px;">
															${empList1[0].email}
 														</td>
														<td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.EmpType" />
														</td>
														<td style="font-size:14px;">
															<select id="employeeType" disabled="true">
																<option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</option>
																<c:forEach items="${emptypeList}" var="obj">
																	<option value="${obj.value}">${obj.label}</option>
																</c:forEach>
															</select>
														</td>
														<td colspan="6">&nbsp;</td>
													</tr>
													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.DOA" />:
														</td>
														<td id="employeeDOA" style="font-size:14px;">
  														</td>
  														<td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Terminated" />

															<%-- <bean:message key="BzComposer.vendorlist.isalsoclient" /> --%>
														</td>
                                                        <td  style="font-size: 14px;">
															<input id="ckhEmployeeTerminated" type="checkbox" disabled="disabled">

 														</td>
														<td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.TerminatedDate" />
														</td>
														<td id="employeeTerminated" style="font-size: 14px;">
															${empList1[0].terminated}
 														</td>
														<td colspan="4">&nbsp;</td>
													</tr>
													<tr>
                                                        <td style="font-size:14px;">
															<spring:message code="BzComposer.Employee.Memo" />:
														</td>
														<td  colspan="5" id="employeeMemo" style="font-size:14px;">
  														</td>
                                                        <td colspan="4">&nbsp;</td>
													</tr>
													</tbody>
												</table>
												<table cellspacing="0" class="tabla-listados" style="margin-top: 0; margin-left: 20px;">
                                                  <thead>
                                                    <tr>
                                                      <th colspan="10" style="font-size: 14px;">
                                                        <spring:message code="BzComposer.editemployee.payrollinfo"/>
                                                      </th>
                                                    </tr>
                                                  </thead>
                                                  <tbody>
                                                    <tr>
                                                      <!-- Filing Status -->
                                                      <td style="font-size:1em;">
                                                        <label for="employeeFilingStatus">
                                                          <spring:message code="BzComposer.editemployee.filingstatus" />
                                                          <span class="inputHighlighted">
                                                            <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                          </span>
                                                        </label>
                                                      </td>
                                                      <td>
                                                        <select id="employeeFilingStatus" name="filingStatus" style="font-size:1em;" disabled>
                                                          <option value="">
                                                            <spring:message code="BzComposer.ComboBox.Select" />
                                                          </option>
                                                          <c:forEach items="${filingList}" var="obj">
                                                            <option value="${obj.value}">${obj.label}</option>
                                                          </c:forEach>
                                                        </select>
                                                      </td>

                                                      <!-- Allowance -->
                                                      <td style="font-size:1em;">
                                                        <label>
                                                          <spring:message code="BzComposer.editemployee.allowance" />
                                                          <span class="inputHighlighted">
                                                            <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                          </span>
                                                        </label>
                                                      </td>
                                                      <td style="font-size:1em;">
                                                        ${empList1[0].allowance}
                                                      </td>

                                                      <!-- State Worked -->
                                                      <td style="font-size:1em;">
                                                        <label for="employeeStateWorked">
                                                          <spring:message code="BzComposer.editemployee.stateworked" />
                                                          <span class="inputHighlighted">
                                                            <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                          </span>
                                                        </label>
                                                      </td>
                                                      <td>
                                                        <select id="employeeStateWorked" name="stateWorked" style="font-size:1em;" disabled>
                                                          <option value="">
                                                            <spring:message code="BzComposer.ComboBox.Select" />
                                                          </option>
                                                          <c:forEach items="${statewList}" var="obj">
                                                            <option value="${obj.value}">${obj.label}</option>
                                                          </c:forEach>
                                                        </select>
                                                      </td>

                                                      <!-- Payroll Method -->
                                                      <td>
                                                   <label for="employeeStateWorked">
                                                                                                             <spring:message code="BzComposer.editemployee.payrollmethod"/>
                                                                                                             <span class="inputHighlighted">
                                                                                                               <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                                                             </span>
                                                                                                           </label>
                                                      </td>
                                                      <td colspan="3" style="font-size:1em;">
                                                        <input type="radio" id="payMethodHourly" name="payMethod" value="2" />
                                                        <label for="payMethodHourly">
                                                          <spring:message code="BzComposer.editemployee.hourly" />
                                                        </label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" id="payMethodDaily" name="payMethod" value="3" />
                                                        <label for="payMethodDaily">
                                                          <spring:message code="BzComposer.editemployee.daily" />
                                                        </label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" id="payMethodSalary" name="payMethod" value="1" />
                                                        <label for="payMethodSalary">
                                                          <spring:message code="BzComposer.editemployee.salary" />
                                                        </label>
                                                      </td>
                                                    </tr>

                                                    <tr>
                                                      <!-- Amount -->
                                                      <td style="font-size:1em;">
                                                        <label for="employeeAmount">
                                                          <spring:message code="BzComposer.editemployee.amount" />
                                                          <span class="inputHighlighted">
                                                            <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                          </span>
                                                        </label>
                                                      </td>
                                                      <td id="employeeAmount">
                                                        ${empList1[0].amount}
                                                      </td>

                                                      <!-- Pay Period (Commented Out) -->
                                                      <td style="font-size:1em;">
                                                        <!--
                                                        <label for="employeePayPeriod">
                                                          <spring:message code="BzComposer.editemployee.payperiod" />
                                                          <span class="inputHighlighted">
                                                            <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                          </span>
                                                        </label>
                                                        -->
                                                      </td>
                                                      <td>
                                                        <!--
                                                        <select id="employeePayPeriod" name="payPeriod" class="ctrl" style="font-size:1em;" disabled>
                                                          <option value="">
                                                            <spring:message code="BzComposer.ComboBox.Select" />
                                                          </option>
                                                          <c:forEach items="${periodList}" var="obj">
                                                            <option value="${obj.value}">${obj.label}</option>
                                                          </c:forEach>
                                                        </select>
                                                        -->
                                                      </td>

                                                      <!-- Empty Cells for Alignment -->
                                                      <td colspan="5"></td>
                                                    </tr>
                                                  </tbody>
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
</div>

</body>
</html>
<!-- dialog box that used in this page -->