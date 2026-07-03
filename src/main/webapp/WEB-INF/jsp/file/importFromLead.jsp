<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.nxsol.bzcomposer.company.domain.expensesFeature.entity.JobStatus" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
		<title>
			<spring:message code="BzComposer.ImportFromLeads" />
		</title>
		<link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
			rel="stylesheet" media="screen" />
		<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
		<style>
			table.tabla-listados thead tr th {
				font-size: 14px;
			}

			table.tabla-listados tbody tr td {
				font-size: 12px;
			}

			#tabs ul li {
				font-size: 12px !important;
			}

			input,
			textarea,
			select {
				font-size: 12px !important;
			}
		</style>
</head>

<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
		<form:form name="JobForm" method="post" id="frmNewCustomer">
			<input type="hidden" name="tabid" id="tabid" value="" />
			<div id="cos">
				<div class="statusquo ok">
					<div id="hoja">
						<div id="blanquito">
							<div id="padding">
								<!-- begin Contents -->
								<!-- add the code for tab here -->
								<div>
									<span
										style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
										<spring:message code="BzComposer.ImportFromLeads" />
									</span>
								</div>
								<table cellpadding="0" cellspacing="0" border="0" align=center
									style="width: 100%;">
									<tr>
                                        <td colspan="3">
                                            <span><spring:message code="BzComposer.SelectLeadsToImportIntoContact" /></span>
                                        </td>
                                    </tr>
								</table>

								<div id="table-negotiations">
									<table id="custTable" class="tabla-listados sortable"
										cellspacing="0"
										style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
										align="center">
										<thead>
											<tr valign="center">
												<th><spring:message code="BzComposer.Customer.ID" /></th>
												<th><spring:message code="BzComposer.customerinfo.lead.source" /></th>
												<th><spring:message code="BzComposer.global.name" /></th>
												<th><spring:message code="BzComposer.global.company" /></th>
												<th><spring:message code="BzComposer.global.address1" /></th>
												<th><spring:message code="BzComposer.global.address2" /></th>
												<th><spring:message code="BzComposer.global.city" /></th>
												<th><spring:message code="BzComposer.global.state" /></th>
												<th><spring:message code="BzComposer.global.zip" /></th>
												<th><spring:message code="BzComposer.global.country" /></th>
												<th><spring:message code="BzComposer.global.dateadded" /></th>
												<th><spring:message code="BzComposer.global.phone" /></th>
												<th><spring:message code="BzComposer.global.mobile" /></th>
												<th><spring:message code="BzComposer.global.fax" /></th>
												<th><spring:message code="BzComposer.global.emailaddress" /></th>

											</tr>
										</thead>
										<tbody id="custTableBody">
											<c:if test="${not empty customerList1}">
												<c:forEach items="${customerList1}" var="objList"
													varStatus="loop">
													<tr id='${loop.index}$$'>
														<td>
															<input type="checkbox" id="custID${loop.index}" value="${objList.leadID}"
																onchange="toggleLeadSelection(this, ${objList.leadID})" />
															${objList.leadID}
														</td>
														<c:if test="${(not empty objList.leadSource) && (not empty objList.leadSource.name)}">
															<td>${objList.leadSource.name}</td>
														</c:if>
														<c:if test="${(empty objList.leadSource) && (empty objList.leadSource.name)}">
															<td>Not Specified</td>
														</c:if>
														<td>${objList.firstName}${objList.middleName}
															${objList.lastName}</td>
														<td>${objList.name}</td>
														<td>${objList.address1}</td>
														<td>${objList.address2}</td>
														<td>${objList.city}</td>
														<td>${objList.state}</td>
														<td>${objList.zipCode}</td>
														<td>${objList.country}</td>
														<td>${objList.formattedDateAdded}</td>
														<td>${objList.phone}</td>
														<td>${objList.cellPhone}</td>
														<td>${objList.fax}</td>
														<td>${objList.email}</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<table cellpadding="0" cellspacing="0" border="0" align=center
						style="width: 100%;margin-top:5px;">
						<script>
							count = 0;
							cnt = 0;
							var exist = new Array(10);
							for (i = 0; i < exist.length; i++) {
								exist[i] = -1;
							}
						</script>
						<tr>
							<td valign=top class="tabPage">
							</td>
						</tr>
						<tr>
							<td align="center">

								<button type="button" class="formbutton"
									title="Import Selected Customer" onclick="ImportSelectedLeads();">
									<spring:message code='BzComposer.ImportSelectedLead' />
								</button>
								<button type="button" class="formbutton" title="Close"
									onclick="CloseMe();">
									<spring:message code='BzComposer.global.close' />
								</button>
							</td>
						</tr>
					</table>

					<div>

					</div>
				</div>
			</div>

		</form:form>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>

</html>
<script>
	window.onunload = refreshParent;
	function refreshParent() {
		window.opener.location.reload();
	}
    let selectedLeads = [];
	function CloseMe() {
		window.close();
	}

    function toggleLeadSelection(checkbox, leadID) {
        if (checkbox.checked) {
            // Add to array if checked
            if (!selectedLeads.includes(leadID)) {
                selectedLeads.push(leadID);
            }
        } else {
            // Remove from array if unchecked
            selectedLeads = selectedLeads.filter(id => id !== leadID);
        }
        console.log("Selected leads:", selectedLeads);
    }
    // Function to send data via AJAX
    function ImportSelectedLeads() {
        if (selectedLeads.length === 0) {
            showNoCustomersSelectedDialog()
            return;
        }
        var details ={
			"leadIDs": selectedLeads
		};
		var obj = JSON.stringify(details);
		$.ajax({
			type: "POST",
			url: "ContactImportAjex?tabid=ImportFromLeads",
			data: "data=" + obj,
			success: function (data) {
				showSuccessDialog();
			}
			,
			error: function (data) {
				//return showerrordialog();
			}
		});
    }

    function showSuccessDialog() {
		event.preventDefault();
		$("#showSuccessDialog").dialog({
			resizable: false,
			height: 200,
			width: 350,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
					window.close();
				}
			}
		});
		return false;
	}
    function showNoCustomersSelectedDialog() {
		event.preventDefault();
		$("#showNoCustomersSelectedDialog").dialog({
			resizable: false,
			height: 200,
			width: 350,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
</script>
<div id="showNoCustomersSelectedDialog" style="display:none;">
    <p><spring:message code="BzComposer.NoCustomersSelected"/></p>
</div>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.saveData"/></p>
</div>