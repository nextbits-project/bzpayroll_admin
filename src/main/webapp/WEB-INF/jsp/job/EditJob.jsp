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
			<spring:message code="BzComposer.jobinfo.editJob" />
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
		<script type="text/javascript">
			selectValidCountryMsg = "<spring:message code='BzComposer.register.selectvalidcountry'/>";
			selectValidStateMsg = "<spring:message code='BzComposer.register.selectvalidstate'/>";
			selectValidZipcodeMsg = "<spring:message code='BzComposer.register.selectvalidzipcode'/>";
			noRecordsFoundMsg = "<spring:message code='BzComposer.employee.norecordsfound'/>";
		</script>
</head>

<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
		<form:form name="JobForm" method="post" id="frmNewCustomer"
			modelAttribute="customerJobDto">
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
										<spring:message code="BzComposer.jobinfo.editJob" />
									</span>
								</div>
								<table cellpadding="0" cellspacing="0" border="0" align=center
									style="width: 100%;">
									<c:if test="${not empty Status}">
										<tr>
											<td colspan="3">
												<span class="msgstyle">${Status}</span>
											</td>
										</tr>
									</c:if>
									<c:if test="${not empty actionMsg}">
										<tr>
											<td colspan="3">
												<span class="msgstyle">${actionMsg}</span>
												<% session.removeAttribute("actionMsg"); %>
											</td>
										</tr>
									</c:if>
								</table>

								<div id="table-negotiations">
									<table class="tabla-listados" cellspacing="0">
										<thead>
											<tr>
												<th colspan="7">
													<spring:message
														code="BzComposer.jobinfo.jobinformation" />
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<spring:message
														code="BzComposer.jobinfo.jobid" />
												</td>
												<td>
													<form:input path="jobID" readonly="true" />
												</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<spring:message
														code="BzComposer.jobinfo.title" />
												</td>
												<td>
													<form:input path="title" />
												</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<spring:message
														code="BzComposer.jobinfo.description" />
												</td>
												<td colspan="2">
													<form:textarea path="description" rows="5" style="width:90%;" />
												</td>
												<td colspan="3">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<spring:message
														code="BzComposer.jobinfo.status" />
												</td>
												<td>
													<form:select path="status">
														<option value="">
															<spring:message
																code="BzComposer.ComboBox.Select" />
														</option>
														<c:forEach var="status"
															items="<%= JobStatus.values() %>">
															<option value="${status}"
																${status==customerJobDto.status
																? 'selected' : '' }>${status}
															</option>
														</c:forEach>
													</form:select>
												</td>
												<td colspan="5">&nbsp;</td>
											</tr>
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
									title="Save Job" onclick="saveJobDetails();">
									<spring:message code='BzComposer.global.save' />
								</button>
								<button type="button" class="formbutton" title="Close"
									onclick="CloseMe();">
									<spring:message code='BzComposer.global.close' />
								</button>
								<input type="hidden" name="stname" value="" id="stateId" />
							</td>
						</tr>
					</table>

					<div>
						<form:hidden path="clientvendorID" />
						<form:hidden path="companyID" />

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

	function saveJobDetails() {
		debugger;
		var jobid = document.JobForm.jobID.value;
		var title = document.JobForm.title.value;
		var description = document.JobForm.description.value;
		var status = document.JobForm.status.value;

		if (title == "") {
			showTitleDialog();
			return false;
		}else if (description == "") {
			showDescriptionDialog();
			return false;
		}
		else if (status == "") {
			showStatusDialog();
			return false;
		}

		var jobDetails ={
			"jobid": document.JobForm.jobID.value,
			"clientvendorID": document.JobForm.clientvendorID.value,
			"title": document.JobForm.title.value,
			"description": document.JobForm.description.value,
			"status": document.JobForm.status.value,
		};
		var obj = JSON.stringify(jobDetails);
		$.ajax({
			type: "POST",
			url: "customerJob?tabid=addJob",
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
	function CloseMe() {
		window.close();
	}

	function showTitleDialog() {
		event.preventDefault();
		$("#showTitleDialog").dialog({
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
	function showDescriptionDialog() {
		event.preventDefault();
		$("#showDescriptionDialog").dialog({
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
	function showStatusDialog() {
		event.preventDefault();
		$("#showStatusDialog").dialog({
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


</script>
<!-- Dialog box used in this page -->
<div id="showTitleDialog" style="display:none;">
	<p>
		<spring:message code="AddEmployeeForm.jtitle.problem" />
	</p>
</div>
<div id="showDescriptionDialog" style="display:none;">
	<p>
		<spring:message code="BzComposer.datamanager.enterdescriptionvalidation" />
	</p>
</div>
<div id="showStatusDialog" style="display:none;">
	<p>Please select status</p>
</div>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.jobinfo.saveJob"/></p>
</div>