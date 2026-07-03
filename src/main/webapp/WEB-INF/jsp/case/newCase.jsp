<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%-- <title><spring:message code="BzComposer.addnewleadtitle" /></title> --%>
<title>${pageTitle }</title>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />

<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
<style>
table.tabla-listados thead tr th {
	font-size: 14px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}

.center {
	margin-left: auto;
	margin-right: auto;
} 

#tabs ul li {
	font-size: 12px !important;
}

input, textarea, select {
	font-size: 12px !important;
}
</style>
<script type="text/javascript">
selectValidCountryMsg = "<spring:message code='BzComposer.register.selectvalidcountry'/>";
selectValidStateMsg = "<spring:message code='BzComposer.register.selectvalidstate'/>";
selectValidZipcodeMsg = "<spring:message code='BzComposer.register.selectvalidzipcode'/>";
noRecordsFoundMsg = "<spring:message code='BzComposer.employee.norecordsfound'/>";



$(function() {
    self.moveTo(100, 10);
    $( "#tabs" ).tabs();
    
});
</script>
</head>
<body>
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<%-- <form:form action="Customer/AddCustomer" method="post" id="frmNewCustomer"> action="postNewLead"  --%>
	<form:form name="newCaseForm" method="post"
		id="frmNewCase" modelAttribute="customerCaseDto">
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
									<spring:message code="BzComposer.customer.case.addNewCase" />
								</span>
							</div>
							<div>
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									${pageHeading} </span>
							</div>
							<table class="center" style="width: 100%;">
								<c:if test="${not empty Status}">
									<tr>
										<td colspan="3"><span class="msgstyle">${Status}</span></td>
									</tr>
								</c:if>
								<c:if test="${not empty actionMsg}">
									<tr>
										<td colspan="3"><span class="msgstyle">${actionMsg}</span>
											<%
											session.removeAttribute("actionMsg");
											%></td>
									</tr>
								</c:if>
							</table>
							<div id="tabs" style="min-height: 550px;">
								<ul>
									<li><a href="#General-1"><spring:message
												code="BzComposer.addnewcustomer.tabs.general" /></a></li>

								</ul>
								<div id="General-1">
									<div id="content1" class="tabPage">
										<!-- add here the content of first tab -->
										<div id="table-negotiations">


											<table class="tabla-listados" cellspacing="0"
												style="width: 100%;">
												<thead>
													<tr>
														<th colspan="7"><spring:message
																code="BzComposer.customer.case.caseInfo" /></th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><spring:message
																code="BzComposer.customer.case.caseID" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>
														<td><form:input path="caseID" readonly="true"
																size="20" /></td>

													</tr>

													<tr>
														<td><spring:message
																code="BzComposer.customer.case.contactName" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>
														<td><form:select path="contactName"
																style="width:150px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>

															
															
															
															 <c:forEach items="${contacts}" var="currObject">
                                                            <form:option
                                                                    value="${currObject.contactID}">${currObject.firstName} ${currObject.lastName}
                                                               </form:option>
                                                        </c:forEach>
                                                        </form:select>
															
															</td>
														
														<td><spring:message
																code="BzComposer.customer.case.companyName" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span></td>
														<td align="left"><form:input type="text"
																path="companyName" /></td>
														<td>&nbsp;</td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message
																code="BzComposer.customer.case.owner" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>
														<td><form:select path="owner" style="width:200px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>

																<form:options items="${CaseOwnerList}"
																	itemValue="name" itemLabel="name" />
															</form:select>
															</td>
														<td><spring:message
																code="BzComposer.customer.case.priority" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>
														<td><form:select path="priority" style="width:150px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<form:option value="1">
																	<spring:message
																		code="BzComposer.customer.case.highPriority" />
																</form:option>
																<form:option value="2">
																	<spring:message
																		code="BzComposer.customer.case.mediumPriority" />
																</form:option>
																<form:option value="3">
																	<spring:message
																		code="BzComposer.customer.case.lowPriority" />
																</form:option>

															</form:select></td>

														<td><spring:message
																code="BzComposer.customer.case.caseType" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>
														<td align="left"><form:select path="caseType"
																style="width:150px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																 <c:forEach items="${caseType}" var="currObject">
                                                            <form:option
                                                                    value="${currObject.caseTypeID}">${currObject.name}
                                                               </form:option>
                                                        </c:forEach>
                                                        
                                                        
															</form:select></td>
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message
																code="BzComposer.customer.case.status" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>

														<td><form:select path="status" style="width:200px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<form:option value= "1">
																	<spring:message
																		code="BzComposer.customer.case.newStatus" />
																</form:option>

																<form:option value="2">
																	<spring:message
																		code="BzComposer.customer.case.workingStatus" />
																</form:option>
																<form:option value="3">
																	<spring:message
																		code="BzComposer.customer.case.escalatedStatus" />
																</form:option>
																<form:option value="4">
																	<spring:message
																		code="BzComposer.customer.case.closedStatus" />
																</form:option>
															</form:select></td>
														<td><spring:message
																code="BzComposer.customer.case.caseOrigin" /> <span
															class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /> </span></td>
														<td><form:select path="caseOrigin"
																style="width:200px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<form:option value="1">
																	<spring:message
																		code="BzComposer.customer.case.PhoneOrigin" />
																</form:option>

																<form:option value="2">
																	<spring:message
																		code="BzComposer.customer.case.mailOrigin" />
																</form:option>
																<form:option value="3">
																	<spring:message
																		code="BzComposer.customer.case.WebOrigin" />
																</form:option>

															</form:select></td>
													</tr>
												<thead>
													<tr>
														<th colspan="7"><spring:message
																code="BzComposer.customer.case.descriptioninfo" /></th>
													</tr>
												</thead>

												<tr>
													<td><spring:message
															code="BzComposer.customer.case.product" /> <span
														class="inputHighlighted"><spring:message
																code="BzComposer.CompulsoryField.Validation" /> </span></td>
													<td>
													<form:select path="product" style="width:200px">

															<form:option value="0">
																<spring:message code="BzComposer.ComboBox.Select" />
															</form:option>
															
												
														<c:forEach items="${ItemList}" var="itmList">
																		<c:if test="${itmList.isCategory == 0}">
																			<form:option value='${itmList.invID}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.invCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.isCategory == 1}">
																			<form:option value='01'>${itmList.invCode}
																			</form:option>
																		</c:if>
																	</c:forEach>
																	
														</form:select></td>
	</tr>
												<tr>
													<td><spring:message
															code="BzComposer.customer.case.subject" /> <span
														class="inputHighlighted"><spring:message
																code="BzComposer.CompulsoryField.Validation" /> </span></td>

													<td><form:input path="subject" size="50" /></td>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.customer.case.description" /> <span
														class="inputHighlighted"><spring:message
																code="BzComposer.CompulsoryField.Validation" /> </span></td>
													<td colspan="2"><form:textarea path="description"
															rows="5" style="width:90%;" /></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.customer.case.internalComments" /> <span
														class="inputHighlighted"><spring:message
																code="BzComposer.CompulsoryField.Validation" /> </span></td>
													<td colspan="2"><form:textarea path="internalComments"
															rows="2" style="width:90%;" /></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td><form:checkbox path="mailToContact" /> <spring:message
															code="BzComposer.customer.case.mailToContact" /></td>
												</tr>

												</tbody>
											</table>
										</div>
										<!-- Manage Address END here -->
									</div>
								</div>

							</div>
							<table cellpadding="0" cellspacing="0" border="0" align="center"
								style="width: 100%; margin-top: 5px;">
							
								<tr>
									<td valign=top class="tabPage"></td>
								</tr>
								<tr>
									<td align="center">
										<button type="button" class="formbutton"
											title="New Opportunity" onclick="NewCustomer();">
											<spring:message code='BzComposer.global.new' />
										</button>
										<button type="button" class="formbutton"
											title="Save Case" onclick="addCase()">
											<spring:message code='BzComposer.global.save' />
										</button>
										<button type="button" class="formbutton" title="Close"
											onclick="CloseMe();">
											<spring:message code='BzComposer.global.close' />
										</button> <input type="hidden" name="stname" value="" id="stateId" />
									</td>
								</tr>
							</table>
							<div>
								<input type="hidden" name="bst" id="bsst" value="0" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form:hidden path="clientVendorID"/>
	</form:form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<script>

window.onunload = refreshParent;
function refreshParent() {
  window.opener.location.reload();

}

$(document).ready(function(){

	var zipvalue=document.newOpportunityForm.zipCode.value;

	loadAddressDetailsByZipcode(zipvalue, 1);
} );
function validate() {
    var email = document.newOpportunityForm.email.value;
    var mail =String(email);
    var pattern=/^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
    if(email==""){
        //return enterEmailValidationDialog();
        return true;
    }
    else if (!pattern.test(email)) {
        document.newOpportunityForm.email.focus();
        return showEmailValidationDialog();
        return false;
    }
    if(mail.length>=50){
        document.newOpportunityForm.email.value="";
        document.newOpportunityForm.email.focus();
        return showEmailLengthValidationDialog();
        return false;
    }
    return true;
}


function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;
	if (unicode!=8){
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1){
 			return true;
		} 
		else 
		if (unicode<48||unicode>57){
			return false; //disable key press
		}
	}
}





	function addCase() 
	{

		
				event.preventDefault();
				$("#addNewCaseDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 500,
									modal : true,
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {

											$(this).dialog("close");
											//document.getElementById('tabid').value = "AddCustomer";
											// document.forms["frmNewCustomer"].action = "Customer?tabid=AddCustomer" ;
											//document.forms["frmNewCustomer"].action = "/postNewLead";

											document.forms["frmNewCase"].action = "/createCase";
											document.forms["frmNewCase"].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
				return false;
	
	}
	function maxnumberofuserdialog() {
		event.preventDefault();
		$("#maxnumberofuserdialog").dialog({
			resizable : false,
			height : 250,
			width : 800,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	
	
	

	function removeStringValues(key) { //from one string('str'), a substring 'key' will be removed
		var str, str2, str3;
		var temp = new Array(20);
		var temp2 = new Array(20);
		var temp3 = new Array(20);

		str = document.forms[0].table_serID.value;
		str2 = document.forms[0].table_bal.value;
		str3 = document.forms[0].table_invId.value;

		temp = str.split(";");
		temp2 = str2.split(";");
		temp3 = str3.split(";");

		str = str2 = str3 = "";
		for (i = 0; i < temp.length; i++) {
			if (temp[i] != key) {
				k = 0;
				for (k = 0; k < i; k++) {
					if (temp[i] == temp[k]) {
						k = -1;
						break;
					}
				}
				if (k != -1) {
					str = str + temp[i] + ";";
					str2 = str2 + temp2[i] + ";"
					str3 = str3 + temp3[i] + ";"
				}
			}
		}
		str = str.substring(0, str.length - 1); //removes last semi-colon
		str2 = str2.substring(0, str2.length - 1); //removes last semi-colon
		str3 = str3.substring(0, str3.length - 1); //removes last semi-colon

		if (key == document.forms[0].table_defaultVal.value) {
			document.forms[0].table_defaultVal.value = "0"; //reset if no service is set to default
		}

		//		"\n\ntable_bal="+document.forms[0].table_bal.value+"\nstr2="+str2+
		//	"\n\ntable_invId="+document.forms[0].table_invId.value+"\nstr3="+str3+
		//"\n\ndefault service="+document.forms[0].table_defaultVal.value);

		document.forms[0].table_serID.value = str;
		document.forms[0].table_bal.value = str2;
		document.forms[0].table_invId.value = str3;
	}



	function CloseMe() {
		window.close();
	}
	function showNameDialog() {
		event.preventDefault();
		$("#showNameDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function enterEmailValidationDialog() {
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
	function showEmailLengthValidationDialog() {
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
	function showFirstNameDialog() {
		event.preventDefault();
		$("#showFirstNameDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showLastNameDialog() {
		event.preventDefault();
		$("#showLastNameDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showAddress1Dialog() {
		event.preventDefault();
		$("#showAddress1Dialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showCityDialog() {
		event.preventDefault();
		$("#showCityDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showZipCodeDialog() {
		event.preventDefault();
		$("#showZipCodeDialog").dialog({
			resizable : false,
			height : 200,
			width : 350,
			modal : true,
			buttons : {
				"<spring:message code='BzComposer.global.ok'/>" : function() {
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
	function showCellPhoneLengthDialog() {
		event.preventDefault();
		$("#showCellPhoneLengthDialog").dialog({
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
	function showServiceValidationDialog() {

		event.preventDefault();
		$("#showServiceValidationDialog").dialog({
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
</script>

<!-- Dialog box used in this page -->
<div id="enterEmailValidationDialog" style="display: none;">
	<p>
		<spring:message code="Bzcomposer.updatevendor.enteremailaddress" />
	</p>
</div>
<div id="showEmailLengthValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entervalidemaillength" />
	</p>
</div>
<div id="showNameDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entercompanyname" />
	</p>
</div>
<div id="showFirstNameDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enterfirstname" />
	</p>
</div>
<div id="showLastNameDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enterlastname" />
	</p>
</div>
<div id="showAddress1Dialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enteradderss1" />
	</p>
</div>
<div id="showCityDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entercity" />
	</p>
</div>
<div id="showZipCodeDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.enterzipcode" />
	</p>
</div>
<div id="showEmailValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.entervalidemail" />
	</p>
</div>
<div id="showCellPhoneLengthDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.cellphonelength" />
	</p>
</div>
<div id="showphoneemptydialog" style="display: none;">
	<p>Please Enter Phone First</p>
</div>
<div id="addNewOpportunityDialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.customer.opportunity.insertOpportunity" />
	</p>
</div>

<div id="addNewCaseDialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.customer.opportunity.addCase"/>
	</p>
</div>

<div id="showServiceValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.addnewcustomer.serviceexist" />
	</p>
</div>
<div id="errorOccurred" style="display: none; font-size: 12px;">
	<p>
		<spring:message code="BzComposer.common.erroroccurred" />
	</p>
</div>
<!-- Dialog box used in this page -->
<div id="maxnumberofuserdialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.configuration.networksecurity.maxnumberofuser" />
	</p>
</div>