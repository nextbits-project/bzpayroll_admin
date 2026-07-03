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
			<spring:message code="BzComposer.DispatchBoard.editDispatchBoard" />
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
		<form:form name="TechnicianForm" method="post" id="frmNewTechnician"
			modelAttribute="customerDispatchBoardDto">
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
										<spring:message code="BzComposer.DispatchBoard.editDispatchBoard" />
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
														code="BzComposer.DispatchBoard.DispatchBoardInfo" />
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<spring:message code="BzComposer.DispatchBoard.DispatchBoardID" />
												</td>
												<td>
													<form:input path="dispatchBoardID" readonly="true" />
												</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td style="padding-top: 7px;">
													<spring:message code="BzComposer.DispatchBoard.SelectJob" />
												</td>
												<td>
                                                    <form:select path="jobID"
																style="width:200px" >

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>

															 <c:forEach items="${bcaJobList}" var="currObject">
                                                            <form:option
                                                                    value="${currObject.jobID}"> ${currObject.title}
                                                               </form:option>

                                                        </c:forEach>
                                                    </form:select>
												</td>
												<td style="padding-top: 7px;">
													<spring:message code="BzComposer.DispatchBoard.BusinessDivision" />
												</td>
												<td>
                                                    <form:select path="businessDivision" style="width:150px">
                                                        <form:option value="0">
                                                            <spring:message code="BzComposer.ComboBox.Select" />
                                                        </form:option>
                                                        <form:option value="Plumbing">
                                                            <spring:message code="BzComposer.DispatchBoard.BusinessDivision.Plumbing" />
                                                        </form:option>
                                                        <form:option value="HVAC">
                                                            <spring:message code="BzComposer.DispatchBoard.BusinessDivision.HVAC" />
                                                        </form:option>
                                                        <form:option value="Electrical">
                                                            <spring:message code="BzComposer.DispatchBoard.BusinessDivision.Electrical" />
                                                        </form:option>

                                                    </form:select>
												</td>
                                                <td colspan="3" style="width: 150px;">&nbsp;</td>
											</tr>
                                            <tr>
												<td style="padding-top: 7px;">
													<spring:message code="BzComposer.DispatchBoard.SelectTechnician" />
												</td>
												<td>
                                                    <form:select path="technicianID"
																style="width:200px" >

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>

															 <c:forEach items="${bcaTechnicianList}" var="currObject">
                                                            <form:option
                                                                    value="${currObject.technicianID}"> ${currObject.name}
                                                               </form:option>

                                                        </c:forEach>
                                                    </form:select>
												</td>
												<td style="padding-top: 7px;">
													<spring:message code="BzComposer.DispatchBoard.Status" />
												</td>
												<td>
                                                    <form:select path="status" style="width:150px">
                                                        <form:option value="0">
                                                            <spring:message code="BzComposer.ComboBox.Select" />
                                                        </form:option>
                                                        <form:option value="Pending">
                                                            <spring:message code="BzComposer.DispatchBoard.Status.Pending" />
                                                        </form:option>
                                                        <form:option value="Assigned">
                                                            <spring:message code="BzComposer.DispatchBoard.Status.Assigned" />
                                                        </form:option>
                                                        <form:option value="Completed">
                                                            <spring:message code="BzComposer.DispatchBoard.Status.Completed" />
                                                        </form:option>

                                                    </form:select>
												</td>
                                                <td colspan="3" style="width: 150px;">&nbsp;</td>
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
									title="Save Job" onclick="updateDispatchDetails();">
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
						<form:hidden path="clientVendorID" />
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

	function updateDispatchDetails() {
        debugger;
        var dispatchBoardID = document.getElementById("dispatchBoardID").value;
        var jobID = document.getElementById("jobID").value;
        var businessDivision = document.getElementById("businessDivision").value;
        var technicianID = document.getElementById("technicianID").value;
        var status = document.getElementById("status").value;
		if (jobID == 0) {
			showSelectJobDialog();
			return false;
		}
        else if (businessDivision == 0) {
			showSelectBusinessDivisionDialog();
			return false;
		}
        else if(technicianID == 0){
            showSelectTechnicianDialog();
            return false;
        }
        else if(status == 0){
            showSelectStatusDialog();
            return false;
        }

		var DispatchDetails ={
            "dispatchBoardID": dispatchBoardID,
			"clientvendorID": document.TechnicianForm.clientVendorID.value,
			"jobID": jobID,
			"businessDivision": businessDivision,
			"technicianID": technicianID,
			"status": status,
		};
		var obj = JSON.stringify(DispatchDetails);
		$.ajax({
			type: "POST",
			url: "customerDispatchBoard?tabid=updateDispatch",
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

	function showSelectJobDialog() {
		event.preventDefault();
		$("#showSelectJobDialog").dialog({
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
    function showSelectBusinessDivisionDialog() {
		event.preventDefault();
		$("#showSelectBusinessDivisionDialog").dialog({
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
    function showSelectTechnicianDialog() {
		event.preventDefault();
		$("#showSelectTechnicianDialog").dialog({
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
    function showSelectStatusDialog() {
		event.preventDefault();
		$("#showSelectStatusDialog").dialog({
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
<div id="showSelectJobDialog" style="display:none;">
	<p>
		<spring:message code="BzComposer.DispatchBoard.problem.jobId" />
	</p>
</div>
<div id="showSelectBusinessDivisionDialog" style="display:none;">
	<p>
		<spring:message code="BzComposer.DispatchBoard.problem.jobId" />
	</p>
</div>
<div id="showSelectTechnicianDialog" style="display:none;">
	<p>
		<spring:message code="BzComposer.DispatchBoard.problem.Technician" />
	</p>
</div>
<div id="showSelectStatusDialog" style="display:none;">
	<p>
		<spring:message code="BzComposer.DispatchBoard.problem.Status" />
	</p>
</div>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.saveData"/></p>
</div>