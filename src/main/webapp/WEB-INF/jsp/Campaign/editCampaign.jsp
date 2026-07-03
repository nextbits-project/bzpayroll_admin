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
	<%-- <form:form action="Customer/AddCustomer" method="post" id="frmNewCampaign"> action="postNewLead"  --%>
	<form:form name="CampaignForm" method="post" id="frmNewCampaign"
		modelAttribute="campaignDto">
		<input type="hidden" name="tabid" id="tabid" value="" />
	
	    <input type="hidden" name="purpose" value="${ purpose }"/>
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
								<spring:message code="BzComposer.campaign.edittitle" />
								</span>
							</div>
							<div>
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									${pageHeading}
								</span>
							</div>
							<table cellpadding="0" cellspacing="0" border="0" align=center
								style="width: 100%;">
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
							<div id="tabs" style="min-height: 450px;">
								<ul>
									<li><a href="#General-1"><spring:message
												code="BzComposer.addnewcustomer.tabs.general" /></a></li>
								
								</ul>
								<div id="General-1">
									<div id="content1" class="tabPage">
										<!-- add here the content of first tab -->
										<div id="table-negotiations">
											<table class="tabla-listados" cellspacing="30px">
												<thead>
													<tr>
														<th colspan="7"><spring:message
																code="BzComposer.campaign.info" />
																</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><spring:message code="BzComposer.campaign.id" /></td>
														<td><form:input path="campaignID" readonly="true"
																style="width:100px;" /></td>
														<td colspan="5">&nbsp;</td>
													</tr>
													
												
													<tr>
														<td><spring:message code="BzComposer.campaign.name" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span>
																	</td>
														<td colspan="3"><form:input path="campaignName"
																style="width:90%;" /></td>
														<td><spring:message
																code="BzComposer.campaign.owner" /></td>
															<td><form:select path="owner" style="width:200px;">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<form:options items="${OwnerList}"
																	itemValue="name" itemLabel="name" />
															</form:select>
															</td>
																
				
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.campaign.active" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span></td>
														<td colspan="3"><form:checkbox path="isActive"/></td>
														<td colspan="3">&nbsp;</td>
													<tr>
													</tr>
													<td><spring:message code="BzComposer.campaign.type" />
													</td>
													<td><form:select path="campaignType"  style="width:200px;">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																
																<form:option value="Webinar">
																	Webinar
																</form:option>
																<form:option value="Mail">
																	Mail
																</form:option>
																<form:option value="Direct Mail">
																	Direct Mail
																</form:option>
																
																</form:select>
																
																
															
													<td colspan="3">&nbsp;</td>
													</tr>
													<tr>
														<td style="color: #black !important;">
															<div class="lblZipcodeShow float-left">
																<spring:message code="BzComposer.campaign.startDate" />
															</div>
															
															</div>&nbsp; <span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span>
														</td>
														<td><form:input path="startDate" readonly="true" />
															<img
															src="${pageContext.request.contextPath}/images/cal.gif"
															onclick="displayCalendar(document.CampaignForm.startDate,'mm-dd-yyyy',this);">
														</td>
														<td><spring:message code="BzComposer.campaign.endDate" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span></td>
														<td><form:input path="closeDate" readonly="true" />
															<img
															src="${pageContext.request.contextPath}/images/cal.gif"
															onclick="displayCalendar(document.CampaignForm.closeDate,'mm-dd-yyyy',this);">
														</td>
														
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td id="t_country"><spring:message
																code="BzComposer.campaign.status" /></td>
														<td><form:select path="status" 
																style="width:150px">
																
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<form:option value="Planned ">
																	  Planned
																</form:option>
																<form:option value="In Progress">
																	In Progress
																</form:option>
																<form:option value="Complete">
																	Complete
																</form:option>			
															</form:select></td>
														<td colspan="5">&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.campaign.expectedRevenue" />
														</td>
														<td><form:input path="expectedRevenue" maxlength="16"
																
																/></td>
													
														
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.campaign.actualCost" />
														</td>
														<td><form:input path="actualCost" maxlength="16"
																
																/></td>
													
														
														<td>&nbsp;</td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.campaign.budgetedCost" />
														</td>
														<td><form:input path="budgetedCost" maxlength="16"
																onkeypress="return numbersonly(event,this.value)"
																 /></td>
													
														
														<td>&nbsp;</td>
														</tr>
														<tr>
														<td><spring:message code="BzComposer.campaign.expectedResponse" />
														</td>
														<td><form:input path="expectedResponse" maxlength="16" 
																
																/></td>
													
														
														<td>&nbsp;</td>
														</tr>
														
														<tr>
														<td><spring:message code="BzComposer.campaign.numSentinCampaign" />
														</td>
														<td><form:input path="numSentInCampaign" maxlength="16"
																
																 /></td>
													
														
														<td>&nbsp;</td>
														</tr>
													<tr>
													
													
														<td><spring:message
																code="BzComposer.campaign.parentCampaign" />
														</td>
													
															<td>
															<form:select path="parentCampaign" style="width:200px;">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<c:forEach items="${campaignList}" var="currObject">
																	<form:option value="${currObject.campaignID}">${currObject.campaignName}</form:option>
																</c:forEach>
															</form:select>
															</td>
														
														
																
														<td colspan="2">&nbsp;</td>
														</tr>
														
														<tr>
														<td><spring:message code="BzComposer.campaign.createby" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span>
																	</td>
														<td colspan="2"><form:input path="lastModifiedDate"
																style="width:200px;" readonly="true" /></td>
													<td><spring:message code="BzComposer.campaign.lastModifityby" />
													</td>
														<td colspan="2"><form:input path="lastModifiedDateBy"
																style="width:200px;" readonly="true" /></td>
													</tr>
													
												</tbody>
											</table>
										</div>

										
							</div>
							<table cellpadding="0" cellspacing="0" border="0" align=center
								style="width: 100%; margin-top: 5px;">
								
								<tr>
									<td valign=top class="tabPage"></td>
								</tr>
								<tr>
									<td align="center">
										<button type="button" class="formbutton" title="New Campaign"
											onclick="NewCustomer();">
											<spring:message code='BzComposer.global.new' />
										</button>
										<button type="button" class="formbutton" title="Update Campaign" onclick="updateCampaign();">
											<spring:message code='BzComposer.global.update' />
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
	</form:form>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<script>
window.onunload = refreshParent;
function refreshParent() {
    window.opener.location.reload();
}
function validate() {
    var email = document.CampaignForm.email.value;
    var mail =String(email);
    var pattern=/^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
    if(email==""){
        //return enterEmailValidationDialog();
        return true;
    }
    else if (!pattern.test(email)) {
        document.CampaignForm.email.focus();
        return showEmailValidationDialog();
        return false;
    }
    if(mail.length>=50){
        document.CampaignForm.email.value="";
        document.CampaignForm.email.focus();
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



function CheckMambership() {
	var membershipLevel = "<%=request.getAttribute("membershipLevel")%>";
	var size = "<%=request.getAttribute("CustomerSize")%>";
		var st = "Standared";
		var pf = "Professional";
		if (membershipLevel.toLowerCase() === st.toLowerCase()) {
			if (size >= 1000) {
				return maxnumberofuserdialog();
			} else {
				return AddLead();
			}
		} else if (membershipLevel.toLowerCase() == pf.toLowerCase()) {
			if (size >= 10000) {

				return maxnumberofuserdialog();
			} else {
				return AddLead();
			}
		}
	}

	function updateCampaign()
	{
		event.preventDefault();
		
				
				$("#addNewCustomerDialog")
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
											// document.forms["frmNewCampaign"].action = "Customer?tabid=AddCustomer" ;
											//document.forms["frmNewCampaign"].action = "/postNewLead";
											document.forms["frmNewCampaign"].action = "Campaign?tabid=SaveEditCampaign";
							
											document.forms["frmNewCampaign"].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
				return false;
			//}
		//}
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
	function hideother(form)
	{
		chbox = document.getElementById('chk_useind');
		if (chbox.checked) {
			document.CampaignForm.annualIntrestRate.disabled = false;
			document.CampaignForm.minFCharges.disabled = false;
			document.CampaignForm.gracePrd.disabled = false;
			document.getElementById('chk1').disabled = false;
			document.getElementById('chk2').disabled = false;
		} else {
			document.CampaignForm.annualIntrestRate.disabled = true;
			document.CampaignForm.minFCharges.disabled = true;
			document.CampaignForm.gracePrd.disabled = true;
			document.getElementById('chk1').disabled = true;
			document.getElementById('chk2').disabled = true;
		}
	}
	
	function addToTable(form) {
		flag = 0;
		flag1 = 0;
		invID = form.serviceID.value;
		SIDSize = document.getElementById('sIDSize').value;

		SLSize = document.getElementById('sSize').value;
		InvSize = document.getElementById('iSize').value;
		DetailSize = document.getElementById('dSize').value;

		var serviceName;
		var InvoiceStyle;
		var ServiceBalance = "0.0";
		var DefaultService;

		for (t = 0; t < exist.length; t++) { //limit=cnt
			if (invID == exist[t]) {
				flag = 1;
				break;
			}
		}

		if (flag == 1) {

			return showServiceValidationDialog();
			return;
		} else {
			flagx = 0;
			for (i = 0; i < SLSize; i++) {
				iinvID = document.getElementById(i + 'sid').value;
				isID = document.getElementById(i + 'isid').value;
				if (invID == iinvID) {

					serviceName = document.getElementById(i + 'sname').value;

					for (j = 0; j < InvSize; j++) {
						isID2 = document.getElementById(j + 'invid').value;
						if (isID == isID2) {
							for (k = 0; k < exist.length; k++) {
								if (exist[k] == -1) {
									exist[k] = invID;
									break;
								}
							}
							InvoiceStyle = document.getElementById(j + 'iname').value;
							flagx = 1;
						}
					}
				}
			}

			if (flagx == 0) {
				InvoiceStyle = "";
				for (k = 0; k < exist.length; k++) {
					if (exist[k] == -1) {
						exist[k] = invID;
						break;
					}
				}
			}

			hidn_val = document.getElementById('hidn').value;
			hidn_val1 = hidn_val;

			var tr = document.createElement("tr");
			tr.setAttribute("id", "row" + invID);

			var tr2 = document.getElementById('tr$$');
			var parentTr = tr2.parentNode;
			parentTr.insertBefore(tr, tr2);

			var td1 = document.createElement("td");
			td1.setAttribute("align", "left");
			tr.appendChild(td1);
			td1.innerHTML = serviceName;

			var td2 = document.createElement("td");
			td2.setAttribute("align", "left");
			tr.appendChild(td2);
			td2.innerHTML = InvoiceStyle;

			var td3 = document.createElement("td");
			td3.setAttribute("align", "left");
			tr.appendChild(td3);
			td3.innerHTML = ServiceBalance;

			var td4 = document.createElement("td");
			td4.setAttribute("align", "left");
			tr.appendChild(td4);
			var rd = "<input type=radio id=setdisable name=defaultService onclick=setDefault("
					+ invID + ",this.form); />";
			td4.innerHTML = rd;
			var button = '<img src="${pageContext.request.contextPath}/images/delete.png" alt="Deletable" onclick=removeFromTable('
					+ invID + '); >';

			var td5 = document.createElement("td");
			td5.setAttribute("align", "left");
			tr.appendChild(td5);
			td5.innerHTML = button;

			document.CampaignForm.table_size.value++;
			document.CampaignForm.table_serID.value += invID + ";";
			document.CampaignForm.table_serviceName.value += serviceName + ";";
			document.CampaignForm.table_bal.value += ServiceBalance + ";";
			if (InvoiceStyle == "") {
				form.table_invId.value += "0;";
			} else {
				for (p = 0; p < InvSize; p++) {
					invoiceName = document.getElementById(p + 'iname').value;
					if (invoiceName == InvoiceStyle) {
						document.CampaignForm.table_invId.value += document
								.getElementById(p + 'invid').value + ";";
					}
				}
			}
			count = ((count) / 1 + 1);
			document.getElementById('hidn').value = ((hidn_val) / 1 + 1);
		}
		name = document.CampaignForm.table_serviceName.value;
	}
	function setDefault(invID1, form) {
		//form.table_defaultVal.value+=1+":"+invID1+";";
		document.CampaignForm.table_defaultVal.value = invID1;
		//document.getElementById('setdisable').disabled=true;
	}
	function removeFromTable(idV) {
		var str;
		var trid;
		//	removeStringValues(document.forms[0].table_serID.value,idV);
		trid = "row" + idV;
		for (i = 0; i < exist.length; i++) {
			if (idV == exist[i]) {
				//document.getElementById(trid).style.display='none';
				var ttt = document.getElementById(trid);
				ttt.parentNode.removeChild(ttt);
				exist[i] = -1;
				cnt--;

				//str=removeStringValues(document.forms[0].table_serID.value,idV);
				removeStringValues(idV);

				//do same for other two strings
				break;
			}
		}
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
<div id="addNewCustomerDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.campaign.message.updateCampaign" />
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