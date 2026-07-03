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
			<spring:message code="BzComposer.technicianinfo.editTechnician" />
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
			modelAttribute="customerTechnicianDto">
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
										<spring:message code="BzComposer.technicianinfo.editTechnician" />
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
														code="BzComposer.technicianinfo.technicianinformation" />
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<spring:message
														code="BzComposer.technicianinfo.technicianid" />
												</td>
												<td>
													<form:input path="technicianID" readonly="true" />
												</td>
												<td colspan="5">&nbsp;</td>
											</tr>
											<tr>
												<td>
													<spring:message
														code="BzComposer.technicianinfo.name" />
												</td>
												<td>
													<form:input path="name" />
												</td>
												<td>
													<spring:message
														code="BzComposer.technicianinfo.phone" />
												</td>
												<td>
                                                    <form:input path="phone" />
												</td>
                                                <td colspan="3" style="width: 150px;">&nbsp;</td>
											</tr>
                                            <tr>
												<td>
													<spring:message
														code="BzComposer.technicianinfo.email" />
												</td>
												<td>
                                                    <form:input path="email" />
												</td>
                                                <td>
													<spring:message
														code="BzComposer.technicianinfo.specialization" />
												</td>
												<td>
                                                    <form:input path="specialization" />
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
									title="Save Job" onclick="saveTechnicianDetails();">
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

	function saveTechnicianDetails() {
		debugger;
		var technicianId = document.TechnicianForm.technicianID.value;
		var name = document.TechnicianForm.name.value;
		var phone = document.TechnicianForm.phone.value;
		var email = document.TechnicianForm.email.value;
		var specialization = document.TechnicianForm.specialization.value;

		if (name == "") {
			showNameDialog();
			return false;
		}
        else if (phone == "") {
			showDescriptionDialog();
			return false;
		}
		else if (!validate()) {
			return false;
		}
        else if(specialization == ""){
            showEmptySpecializationDialog();
            return false;
        }

		var technicianDetails ={
			"technicianId": technicianId,
			"clientvendorID": document.TechnicianForm.clientVendorID.value,
			"name": name,
			"phone": phone,
			"email": email,
			"specialization": specialization,
		};
		var obj = JSON.stringify(technicianDetails);
		$.ajax({
			type: "POST",
			url: "customerTechnician?tabid=updateTechnician",
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

	function showNameDialog() {
		event.preventDefault();
		$("#showNameDialog").dialog({
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
    function showphoneemptydialog() {
		event.preventDefault();
		$("#showphoneemptydialog").dialog({
			resizable : false,
			height : 200,
			width : 500,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function validate()
    {
        var email = document.TechnicianForm.email.value;
        var mail =String(email);
        var pattern=/^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
        if(email==""){
            return showEmptyEmailDialog();
        }
        else if (!pattern.test(email)) {
            document.TechnicianForm.email.focus();
            return showEmailValidationDialog();
            return false;
        }
        if(mail.length>=50){
            document.TechnicianForm.email.value="";
            document.TechnicianForm.email.focus();
            return showEmailLengthValidationDialog();
            return false;
        }
        return true;
    }
    function showEmptyEmailDialog() {
		event.preventDefault();
		$("#showEmptyEmailDialog").dialog({
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
    function showEmailValidationDialog() {
		event.preventDefault();
		$("#showEmailValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 450,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
    function showEmailLengthValidationDialog()
	{
		event.preventDefault();

		$("#enterEmailValidationDialog").dialog({
			resizable : false,
			height : 200,
			width : 450,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}

    function showEmptySpecializationDialog() {
		event.preventDefault();
		$("#showEmptySpecializationDialog").dialog({
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
<div id="showNameDialog" style="display:none;">
	<p>
		<spring:message code="BzComposer.technicianinfo.addNewTechnician.problem.name" />
	</p>
</div>
<div id="showphoneemptydialog" style="display: none;">
	<p><spring:message code="BzComposer.technicianinfo.addNewTechnician.problem.phone" /></p>
</div>

<div id="showEmptyEmailDialog" style="display:none;">
	<p>
		<spring:message code="AddEmployeeForm.email.problem" />
	</p>
</div>
<div id="showEmailValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entervalidemail" />
	</p>
</div>
<div id="showEmailLengthValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entervalidemaillength" />
	</p>
</div>
<div id="showEmptySpecializationDialog" style="display:none;">
	<p><spring:message code="BzComposer.technicianinfo.addNewTechnician.problem.specialization" /></p>
</div>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.technicianinfo.saveTechnician"/></p>
</div>