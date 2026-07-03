<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
   <link href="/css/styles.css" rel="stylesheet"/>
<title>BzPayroll - Employee List</title>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
</head>
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
}
</style>
<script>
$(function() {
  let jobtype = "${employeeRoleStatus != null ? employeeRoleStatus : false}";
  let jobtypevalue = "${employeeRoleStatusValue != null ? employeeRoleStatusValue : 0}";

  $("#tabs").tabs({
    active: jobtypevalue,
    beforeActivate: function(event, ui) {
      // check which tab was clicked
      if ($(ui.newTab).find("a").hasClass("tabs1")) {
        window.location.href = '/employee-list';
        return false; // prevent jQuery UI from switching tab
      }
      if ($(ui.newTab).find("a").hasClass("tabs2")) {
        window.location.href = '/inactive-employee-list';
        return false;
      }
    }
  });
});
</script>
<body>

    <!-- Include common header -->
    <%@ include file="/WEB-INF/jsp/include/header.jsp" %>

    <!-- Divider and Title -->
    <hr class="section-divider">
    <h2 class="section-title">Employee List</h2>

<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<!-- begin Contents -->
						<div>


							<div style="width: 100%;">
								<table style="width: 100%;">


								</table>
							</div>

							<div style="float: right;">
								<table>

								</table>
							</div>
						</div>

						<div style="margin-top:40px; width:100%;" >
                                                  <div id="formCustomization">
                                                    <div id="tabs">
                                                      <ul>
                                                        <li><a href="#statusTab" class="tabs1">Active</a></li>
                                                        <li><a href="#statusTab" class="tabs2">Inactive</a></li>
                                                      </ul>
 <!-- Status Tab -->
      <div id="statusTab">


						<input type="hidden" id="lSize" value='${employeeList.size()}' />
						<table id="custTable" class="tabla-listados sortable"
							cellspacing="0"
							style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
							align="center">
							<thead>
								<tr valign="center">
									<th><spring:message code="BzComposer.Customer.ID" /></th>
									<th>Employee Name</th>
                                                         <%-- <th>Company</th>--%>
                                                          <th>Job Type</th>
                                                          <th>Job Title</th>
                                                          <th><spring:message code="BzComposer.global.address1" /></th>
                                                          <th><spring:message code="BzComposer.global.address2" /></th>
                                                          <th><spring:message code="BzComposer.global.zipcode" /></th>
                                                          <th><spring:message code="BzComposer.global.city" /></th>
                                                          <th><spring:message code="BzComposer.global.state" /></th>
                                                          <th>Memo</th>
                                                          <th>Province</th>
                                                          <th><spring:message code="BzComposer.global.country" /></th>
                                                          <th>Phone</th>
                                                          <th>Mobile</th>
                                                          <th>Email</th>
                                                          <th>Emp Type</th>
                                                          <th>Date of Added</th>
                                                          <th>Terminated</th>
                                                          <th>Terminated Date</th>
                                                          <th>Filing Status</th>
                                                          <th>State Worked</th>
                                                          <th>Pay Period</th>
									<th><spring:message code="BzComposer.UpdateInvoice.Service.Balance" /></th>
									<th><spring:message code="Bizcomposer.active" /></th>
								</tr>
							</thead>
							<tbody id="custTableBody">

                               <c:if test="${not empty employeeList}">
                                  <c:forEach items="${employeeList}" var="objList"
                                  		varStatus="loop">
                                  		<tr id='${loop.index}$$'
                                  		onclick="setRowId(${objList.employeeIndexId}, ${loop.index}, true);"
                                  		ondblclick="goToCustomerBoard(${objList.employeeIndexId});">

                                  		<td><input type="checkbox" id="custID${loop.index}" value="${objList.employeeIndexId}" onchange="addCustomerRowIndex(${loop.index}, ${objList.employeeIndexId})" />
                                  		${objList.employeeIndexId}</td>



                                       <td>
                                             ${objList.firstName} ${objList.lastName}
                                       </td>

                                      <%-- <td></td>--%>
                                       <td>${objList.jobType}</td>
                                       <td>${objList.jobTitle}</td>
                                       <td style="min-width: 250px;">${objList.address1}</td>
                                       <td style="min-width: 250px;">${objList.address2}</td>
                                       <td>${objList.zipCode}</td>
                                       <td>${objList.city}</td>
                                       <td>${objList.state}</td>
                                       <td>${objList.memo}</td>
                                       <td>${objList.province}</td>
                                       <td>${objList.country}</td>
                                       <td>${objList.phone}</td>
                                       <td>${objList.cellPhone}</td>
                                       <td>${objList.email}</td>
                                       <td>${objList.employeeType}</td>
                                       <td>${objList.dateAdded}</td>
                                       <td>${not empty objList.dateTerminated ? 'Yes' : 'No'}</td>
                                       <td>${objList.dateTerminated}</td>
                                       <td>${objList.filingStatus}</td>
                                       <td>${objList.stateWorked}</td>
                                       <td>${objList.payPeriod}</td>
                                       <td>${objList.amount}</td>
                                       <td>${objList.isDeleted eq 'Yes' ? 'No' : 'Yes'}</td>

                                    </tr>
                                  </c:forEach>
                               </c:if>
                            </tbody>
						</table>
						</div>
						</div>
                          </div>
                        </div>
					</div>
					<div>
						<input type="hidden" name="tabid" id="tabid" value="" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>


</body>
</html>
