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
<title><spring:message code="BzComposer.datamanagertitle" /></title>
<jsp:include page="customerInvoiceFunctionPage.jsp"></jsp:include>
<style>
.switch { position: relative;display: inline-block;width: 40px;height: 22px;margin-left:10px; }
.switch input { opacity: 0;width: 0;height: 0; margin-top: 15px; }
.slider {
  position: absolute;cursor: pointer;top: 0;left: 0;right: 0;bottom: 0;
  background-color: #ccc;-webkit-transition: .4s;transition: .4s;
}
.slider:before {
  position: absolute;content: "";height: 15px;width: 15px;left: 4px;bottom: 4px;
  background-color: white;-webkit-transition: .4s;transition: .4s;
}
input:checked + .slider { background-color: #2196F3; }

input:checked + .slider:before {
  -webkit-transform: translateX(15px);
  -ms-transform: translateX(15px);
  transform: translateX(15px);
}

/* Rounded sliders */
.slider.round { border-radius: 20px; }
.slider.round:before { border-radius: 50%; }

.parentImage {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}
.parentImage:hover {
    -moz-transform: scale(2);
	-webkit-transform: scale(2);
	-o-transform: scale(2);
	-ms-transform: scale(2);
	transform: scale(2);
}
</style>
</head>
<body onload="init1();">
	<!-- begin shared/header -->
	<%-- <form:form action="Configuration?" enctype="multipart/form-data" method="post" id="form"> --%>
	<form:form name="configurationForm" method="post" id="dmForm"
		modelAttribute="configDto">
		<div id="ddcolortabsline">&nbsp;</div>
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<div>
								<span
									style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<spring:message
										code="BzComposer.configuration.configurationtitle" />
								</span>
							</div>
							<div>
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
								<div id="table-negotiations"
									style="padding: 0; border: 1px solid #ccc;">
									<table cellspacing="0"
										style="border: 0; padding: 0; width: 100%; overflow-y: scroll;"
										class="section-border">
										<tr>
											<span
												style="font-size: 30px; cursor: pointer; margin-left: 20px;"
												onclick="toggleFunction()"> &#9776;</span>
											<td id="leftMenu" style="position: relative; width: 180px;"
												valign="top">
												<table>
													<tr>
														<td><jsp:include page="menuPage.jsp" /></td>
													</tr>
												</table>
											</td>
											<td valign="top">
												<!-- General -->
												<div></div> <!-- general page content starts -->
												<div id="NonProfitSetting"
													style="display: block; padding: 0; position: relative; left: 0;">
													<div id="tabs" style="height: auto;">
														<ul>
															<li style="font-size: 12px;"><a href="#GeneralData"><spring:message
																		code="BizComposer.Configuration.General" /></a></li>
															<li style="font-size: 12px;"><a href="#TemplatesData"><spring:message
																		code="BizComposer.Configuration.POS.Templates" /></a></li>

														</ul>
														<!-- Company-Information Start -->
														<div id="GeneralData">
															<div id="content" class="tabPage">
																<div id="table-negotiations" align="center"
																				class="section-border" style="width: 100%;">
																				<div id="Hidden">
																					<div id="CustTitle">
																						<c:if test="${not empty customerTitle}">
																							<input type="hidden" id="ctSize"
																								value='${customerTitle.size()}'>
																							<c:forEach items="${customerTitle}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.titleID}'
																									id='${loop.index}ctitleID' />
																								<input type="hidden" value='${curObject.title}'
																									id='${loop.index}ctitleNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="Rep">
																						<c:if test="${not empty SalesRep}">
																							<input type="hidden" id="rSize"
																								value='${SalesRep.size()}'>
																							<c:forEach items="${SalesRep}" var="curObject"
																								varStatus="loop">
																								<input type="hidden"
																									value='${curObject.salesRepID}'
																									id='${loop.index}repID' />
																								<input type="hidden"
																									value='${curObject.salesRepName}'
																									id='${loop.index}repNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="ShipCarrier">
																						<c:if test="${not empty Via}">
																							<input type="hidden" id="shSize"
																								value='${Via.size()}'>
																							<c:forEach items="${Via}" var="curObject"
																								varStatus="loop">
																								<input type="hidden"
																									value='${curObject.shipCarrierID}'
																									id='${loop.index}shipID' />
																								<input type="hidden"
																									value='${curObject.shipCarrierName}'
																									id='${loop.index}shipNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="Term">
																						<c:if test="${not empty salesTerms}">
																							<input type="hidden" id="tSize"
																								value='${salesTerms.size()}'>
																							<c:forEach items="${salesTerms}" var="curObject"
																								varStatus="loop">
																								<input type="hidden" value='${curObject.termId}'
																									id='${loop.index}termID' />
																								<input type="hidden"
																									value='${curObject.termName}'
																									id='${loop.index}termNm' />
																							</c:forEach>
																						</c:if>
																					</div>

																					<div id="Type">
																						<c:if test="${not empty SalesCatType}">
																							<input type="hidden" id="catSize"
																								value='${SalesCatType.size()}'>
																							<c:forEach items="${SalesCatType}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.cvCategoryID}'
																									id='${loop.index}typeID' />
																								<input type="hidden"
																									value='${curObject.cvCategoryName}'
																									id='${loop.index}typeNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="Source">
																						<c:if test="${not empty CustomerSource}">
																							<input type="hidden" id="SourceSize"
																								value='${CustomerSource.size()}'>
																							<c:forEach items="${CustomerSource}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.customerSourceID}'
																									id='${loop.index}sourceID' />
																								<input type="hidden"
																									value='${curObject.customerSourceName}'
																									id='${loop.index}sourceNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="Location">
																						<c:if test="${not empty SalesLocation}">
																							<input type="hidden" id="lSize"
																								value='${SalesLocation.size()}'>
																							<c:forEach items="${SalesLocation}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.locationId}'
																									id='${loop.index}locID' />
																								<input type="hidden"
																									value='${curObject.locationName}'
																									id='${loop.index}locNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="LeadSource">
																						<c:if test="${not empty LeadSource}">
																							<input type="hidden" id="leadSourceSize"
																								value='${LeadSource.size()}'>
																							<c:forEach items="${LeadSource}" var="curObject"
																								varStatus="loop">
																								<input type="hidden"
																									value='${curObject.leadSourceId}'
																									id='${loop.index}leadsID' />
																								<input type="hidden"
																									value='${curObject.leadSourceName}'
																									id='${loop.index}leadsNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="LeadCategory">
																						<c:if test="${not empty LeadCategory}">
																							<input type="hidden" id="leadCatSize"
																								value='${LeadCategory.size()}'>
																							<c:forEach items="${LeadCategory}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.leadCatID}'
																									id='${loop.index}leadcID' />
																								<input type="hidden"
																									value='${curObject.leadCatName}'
																									id='${loop.index}leadcNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="UnitOfMeasure">
																						<c:if test="${not empty UnitOfMeasure}">
																							<input type="hidden" id="UnitOfMeasureSize"
																								value='${UnitOfMeasure.size()}'>
																							<c:forEach items="${UnitOfMeasure}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.unitCategoryID}'
																									id='${loop.index}unitCategoryID' />
																								<input type="hidden"
																									value='${curObject.unitOfMeasureName}'
																									id='${loop.index}unitNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="NonProfitClassification">
																						<c:if test="${not empty Classification}">
																							<input type="hidden" id="ClassificationSize"
																								value='${Classification.size()}'>
																							<c:forEach items="${Classification}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.classificationID}'
																									id='${loop.index}classificationID' />
																								<input type="hidden"
																									value='${curObject.classificationName}'
																									id='${loop.index}classificationNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="PaymentType">
																						<c:if test="${not empty SalesPaymentMethod}">
																							<input type="hidden" id="pSize"
																								value='${SalesPaymentMethod.size()}'>
																							<c:forEach items="${SalesPaymentMethod}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.paymentTypeId}'
																									id='${loop.index}pmtID' />
																								<input type="hidden"
																									value='${curObject.paymentTypeName}'
																									id='${loop.index}pmtNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="ReceivedType">
																						<c:if test="${not empty SalesPaymentMethod}">
																							<input type="hidden" id="rcTypeSize"
																								value='${SalesReceivedType.size()}'>
																							<c:forEach items="${SalesReceivedType}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.paymentTypeId}'
																									id='${loop.index}rcTypeID' />
																								<input type="hidden"
																									value='${curObject.paymentTypeName}'
																									id='${loop.index}rcTypeNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="CreditCard">
																						<c:if test="${not empty CreditCardType}">
																							<input type="hidden" id="ccSize"
																								value='${CreditCardType.size()}'>
																							<c:forEach items="${CreditCardType}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.ccTypeID}'
																									id='${loop.index}ccTypeID' />
																								<input type="hidden"
																									value='${curObject.ccTypeName}'
																									id='${loop.index}ccTypeNm' />
																							</c:forEach>
																						</c:if>
																					</div>
																					<div id="STax">
																						<c:if test="${not empty SalesTax}">
																							<input type="hidden" id="txSize"
																								value='${SalesTax.size()}'>
																							<c:forEach items="${SalesTax}" var="curObject"
																								varStatus="loop">
																								<input type="hidden"
																									value='${curObject.salesTaxID}'
																									id='${loop.index}txID' />
																								<input type="hidden" value='${curObject.state}'
																									id='${loop.index}txNm' />
																								<input type="hidden"
																									value='${curObject.salesRate}'
																									id='${loop.index}txRate' />
																							</c:forEach>
																						</c:if>
																					</div>

																					<div id="MSG">
																						<c:if test="${not empty SalesMessage}">
																							<input type="hidden" id="mSize"
																								value='${SalesMessage.size()}'>
																							<c:forEach items="${SalesMessage}"
																								var="curObject" varStatus="loop">
																								<input type="hidden"
																									value='${curObject.messageID}'
																									id='${loop.index}msgID' />
																								<input type="hidden"
																									value='${curObject.messageName}'
																									id='${loop.index}msgNm' />
																							</c:forEach>
																						</c:if>
																					</div>

																				</div>

																				<table cellspacing="0" style="width: 100%;">
																					<tr>
																						<td align="left">
																							<table style="width: 100%;">
																								<tr>
																									<td>
																										<table width="130" height="180"
																											class="table-notifications">
																											<tr>
																												<th style="font-size: 14px;"><spring:message
																														code="BzComposer.nonprofit.classification" /></th>
																											</tr>
																											<tr>
																												<td style="font-size: 12px;"><select
																													name="classificationID" size="10"
																													style="width: 120px" id="16$$"
																													onchange="callClick(this.id,'<spring:message code="BzComposer.nonprofit.classification" />');"
																													onclick="callClick(this.id,'<spring:message code="BzComposer.nonprofit.classification" />');">
																														<c:if test="${not empty Classification}">
																															<c:forEach items="${Classification}"
																																var="curObject" varStatus="loop">
																																<option
																																	value='${curObject.classificationID}'
																																	${curObject.defaultItem==true?'selected':''}>${curObject.classificationName}</option>
																															</c:forEach>
																														</c:if>
																												</select></td>
																											</tr>
																											<tr>
																												<TD align="center" style="font-size: 14px;">
																													<input type="button" name="s_type"
																													class="formbutton"
																													onclick="buttonClick('16$$','<spring:message code="BzComposer.nonprofit.classification" />');"
																													value='<spring:message code="BzComposer.nonprofit.classification" />'>
																												</TD>
																											</tr>
																										</table>
																									</td>

																									<td colspan="4" align="center"
																										style="background-color: rgb(247, 247, 247);">
																										<table class="table-notifications">
																											<tr>
																												<td colspan="2" align="center"
																													style="font-size: 25px;">
																													<h4 id="selectedTitle">
																														<spring:message
																															code="BzComposer.datamanager.setvalues" />
																													</h4>
																												</td>
																											</tr>
																											<tr>
																												<td colspan="2" id="taxRate"
																													style="visibility: hidden"><spring:message
																														code="BzComposer.datamanager.taxrate" />
																													<input type="text" id="tax_rate"
																													name="taxRateVal"
																													onkeydown="return numbersonly(event,this.value)"
																													tabindex="2" /> <input type="hidden"
																													name="sTitleval" id="sTitleId" value="" />
																													<input type="hidden" name="sOldval"
																													id="sOldId" value="" /> <input
																													type="hidden" name="sNewval" id="sNewId"
																													value="" /> <input type="hidden"
																													name="sNewvalID" id="newIDD" value="" /></td>
																											</tr>
																											<tr>
																												<td colspan="2" align="center"
																													style="font-size: 14px; width: 70%; padding-left: 10px;">
																													<spring:message
																														code="BzComposer.datamanager.description" />
																													<input type="text" name="des"
																													id="descriptionId" tabindex="1">
																												</td>
																											</tr>
																											<tr>
																												<td colspan="2" align="center"
																													style="font-size: 14px;"><a
																													class="formbutton" name="save"
																													onclick="callSave();" tabindex="3"
																													style="font-size: 14px;"><spring:message
																															code="BzComposer.global.add" /></a> <a
																													class="formbutton" name="save"
																													onclick="callUpdate();" tabindex="3"
																													style="font-size: 14px;"><spring:message
																															code="BzComposer.global.update" /></a> <a
																													name="Delete" class="formbutton"
																													onclick="callDefault();" tabindex="4"
																													style="font-size: 14px;"><spring:message
																															code="BzComposer.global.default" /></a> <a
																													name="Delete" class="formbutton"
																													onclick="callDelete();" tabindex="4"
																													style="font-size: 14px;"><spring:message
																															code="BzComposer.global.delete" /></a> <a
																													name="Cancel" class="formbutton"
																													onclick="callClear();" tabindex="5"
																													style="font-size: 14px;"><spring:message
																															code="BzComposer.global.clear" /></a></td>
																											</tr>
																										</table>
																									</td>
																								</tr>
																							</table>
																						</td>
																					</tr>
																				</table>
																			</div>
															</div>
														</div>
														<!-- TemplatesData tab -->
														<div id="TemplatesData">
															<div id="nonprofitTab" class="tabPage">
																<table class="table-notifications" style="width:100%;max-height:1000px;">
																	<tr>
																		<th colspan="4" align="left" style="font-size:12px; padding:5px;">
																			<spring:message code="BzComposer.configuration.nonprofit" />
																		</th>
																	</tr>
																	<tr style="border-top: 1px solid grey;">
																		<td style="width:25%;padding-top:25px;font-size:12px;">
																			<label class="switch switchPO">
																			<input type="checkbox" name="poTemplateType" value="7" onchange="setTemplateValues(this, 'PO', 7);" ${configDto.poTemplateType==7?'checked':''} />
																			<span class="slider round"></span>
																			</label>
																			<strong>Donation Standard</strong><br/>
																			<img class="parentImage" src="${pageContext.request.contextPath}/images/new/PrintPO1.png" style="width:100%;" />
																		</td>
																		<td style="width:25%;padding-top:25px;font-size:12px;">
																			<label class="switch switchPO">
																			<input type="checkbox" name="poTemplateType" value="8" onchange="setTemplateValues(this, 'PO', 8);" ${configDto.poTemplateType==8?'checked':''} />
																			<span class="slider round"></span>
																			</label>
																			<strong>Donation Charcoal</strong><br/>
																			<img class="parentImage" src="${pageContext.request.contextPath}/images/new/PrintPO2.png" style="width:100%;" />
																		</td>
																		<td style="width:25%;padding-top:25px;font-size:12px;">
																			<label class="switch switchPO">
																			<input type="checkbox" name="poTemplateType" value="7" onchange="setTemplateValues(this, 'PO', 7);" ${configDto.poTemplateType==7?'checked':''} />
																			<span class="slider round"></span>
																			</label>
																			<strong>Pledge Standard</strong><br/>
																			<img class="parentImage" src="${pageContext.request.contextPath}/images/new/PrintPO1.png" style="width:100%;" />
																		</td>
																		<td style="width:25%;padding-top:25px;font-size:12px;">
																			<label class="switch switchPO">
																			<input type="checkbox" name="poTemplateType" value="8" onchange="setTemplateValues(this, 'PO', 8);" ${configDto.poTemplateType==8?'checked':''} />
																			<span class="slider round"></span>
																			</label>
																			<strong>Pledge Charcoal</strong><br/>
																			<img class="parentImage" src="${pageContext.request.contextPath}/images/new/PrintPO2.png" style="width:100%;" />
																		</td>
																		<td colspan="2">&nbsp;</td>
																	</tr>
																</table>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<form:hidden path="empStateID" />
				<form:hidden path="labelName" />
				<form:hidden path="fileName" />
					    <input type="hidden" name="tabid" id="tid" value="" />
	    <input type="hidden" id="tempValueIV" value="${configDto.invoiceTemplateType}" />
	    <input type="hidden" id="tempValueEST" value="${configDto.estTemplateType}" />
	    <input type="hidden" id="tempValueSO" value="${configDto.soTemplateType}" />
	    <input type="hidden" id="tempValuePO" value="${configDto.poTemplateType}" />
	    <input type="hidden" id="tempValuePS" value="${configDto.psTemplateType}" />
			</div>
			<div>
				<input type="hidden" name="tabid" id="tabid" value="" />
			</div>
		</div>
	</form:form>
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
<script type="text/javascript">

	function setTemplateValues(tempElement, tempName, tempVal){
	let isSelected =  tempElement.checked;
	if (isSelected && tempName === 'IV'){
	document.getElementById('tempValueIV').value = tempVal;
	$('.switchIV input').prop('checked', false);
	}
	else if (isSelected && tempName === 'EST'){
	document.getElementById('tempValueEST').value = tempVal;
	$('.switchEST input').prop('checked', false);
	}
	else if (isSelected && tempName === 'SO'){
	document.getElementById('tempValueSO').value = tempVal;
	$('.switchSO input').prop('checked', false);
	}
	else if (isSelected && tempName === 'PO'){
	document.getElementById('tempValuePO').value = tempVal;
	$('.switchPO input').prop('checked', false);
	}
	else if (isSelected && tempName === 'PS'){
	document.getElementById('tempValuePS').value = tempVal;
	$('.switchPS input').prop('checked', false);
	}
	tempElement.checked = isSelected;
	}
	function saveTemplateTypes(){
	let params = "invoiceTemplateType="+document.getElementById('tempValueIV').value
			+"&estTemplateType="+document.getElementById('tempValueEST').value
			+"&soTemplateType="+document.getElementById('tempValueSO').value
			+"&poTemplateType="+document.getElementById('tempValuePO').value
			+"&psTemplateType="+document.getElementById('tempValuePS').value
	$.ajax({
	type : "POST",
	url : "/ConfigurationAjaxTest?tabid=setPrintingTemplates",
	data : params,
	success : function(data) {
		if(data === true){
			showSuccessDialog();
		}else{
			errorOccureddialog();
		}
	},
	error : function(data) {
		alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	}
	});
	}

	sOldVal = "";
	function init1() {
		buttonClick('16$$','NonProfit - Classification');
		//document.getElementById("1$$").value = 4156;
		init();
	}
	function callClick(idVal, ttl) {
		sOldVal = "";
		//alert(idVal+"--"+ttl);
		document.getElementById("selectedTitle").innerHTML = ttl;
		document.getElementById("descriptionId").value = "";
		document.getElementById("tax_rate").value = "";
		if (idVal == "11$$")
			document.getElementById("taxRate").style.visibility = "visible";
		else
			document.getElementById("taxRate").style.visibility = "hidden";

		document.getElementById("16$$").style.background = '#ffffff'

		document.getElementById("" + idVal).style.background = '#AAAAAA';
		id = document.getElementById("" + idVal).value;
		var i = 0;
		var sval;
		if (ttl == "CUSTOMER TITLE") {
			size = document.getElementById('ctSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "ctitleID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "ctitleNm").value;
					sOldVal = document.getElementById(i + "ctitleNm").value;
					document.getElementById("newIDD").value = id;
					break;
				}
			}
		} else if (ttl == "REP") {
			size = document.getElementById('rSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "repID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "repNm").value;
					sOldVal = document.getElementById(i + "repNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "TERMS") {
			size = document.getElementById('tSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "termID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "termNm").value;
					sOldVal = document.getElementById(i + "termNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "MESSAGE") {
			size = document.getElementById('mSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "msgID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "msgNm").value;
					sOldVal = document.getElementById(i + "msgNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "BUSINESS TYPE") {
			size = document.getElementById('catSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "typeID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "typeNm").value;
					sOldVal = document.getElementById(i + "typeNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "Customer Source") {
			size = document.getElementById('SourceSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "sourceID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "sourceNm").value;
					sOldVal = document.getElementById(i + "sourceNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "LOCATION") {
			size = document.getElementById('lSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "locID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "locNm").value;
					sOldVal = document.getElementById(i + "locNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "PAYMENT TYPE") {
			size = document.getElementById('pSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "pmtID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "pmtNm").value;
					sOldVal = document.getElementById(i + "pmtNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "RECEIVED TYPE") {
			size = document.getElementById('rcTypeSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "rcTypeID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "rcTypeNm").value;
					sOldVal = document.getElementById(i + "rcTypeNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "CREDIT CARD") {
			size = document.getElementById('ccSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "ccTypeID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "ccTypeNm").value;
					sOldVal = document.getElementById(i + "ccTypeNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "SHIPPING VIA") {
			size = document.getElementById('shSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "shipID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "shipNm").value;
					sOldVal = document.getElementById(i + "shipNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "TAX") {
			size = document.getElementById('txSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "txID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "txNm").value;
					document.getElementById("tax_rate").value = document
							.getElementById(i + "txRate").value;
					sOldVal = document.getElementById(i + "txNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "LEAD SOURCE") {
			size = document.getElementById('leadSourceSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "leadsID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "leadsNm").value;
					sOldVal = document.getElementById(i + "leadsNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "LEAD CATEGORY") {
			size = document.getElementById('leadCatSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "leadcID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "leadcNm").value;
					sOldVal = document.getElementById(i + "leadcNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "Unit Of Measure") {
			size = document.getElementById('UnitOfMeasureSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "unitCategoryID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "unitNm").value;
					sOldVal = document.getElementById(i + "unitNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		} else if (ttl == "NonProfit - Classification") {
			size = document.getElementById('ClassificationSize').value;
			for (i = 0; i < size; i++) {
				idd = document.getElementById(i + "classificationID").value;
				if (id == idd) {
					document.getElementById("descriptionId").value = document
							.getElementById(i + "classificationNm").value;
					sOldVal = document.getElementById(i + "classificationNm").value;
					document.getElementById("newIDD").value = idd;
					break;
				}
			}
		}
		

	}

	function buttonClick(idVal, ttl) {
		sOldVal = "";
		document.getElementById("selectedTitle").innerHTML = ttl;
		document.getElementById("descriptionId").value = "";
		document.getElementById("tax_rate").value = "";
		if (idVal == "11$$")
			document.getElementById("taxRate").style.visibility = "visible";
		else
			document.getElementById("taxRate").style.visibility = "hidden";

		document.getElementById("16$$").style.background = '#ffffff'
		document.getElementById("16$$").selectedIndex = -1;

		document.getElementById("" + idVal).style.background = '#AAAAAA';
	}

	function callSave() {
		sType = document.getElementById("selectedTitle").innerHTML
		sOld = sOldVal;
		sNew = document.getElementById("descriptionId").value;
		newID = document.getElementById("newIDD").value;
		taxrate = document.getElementById("tax_rate").value;
		document.getElementById("sTitleId").value = sType;
		document.getElementById("sOldId").value = sOld;
		document.getElementById("sNewId").value = sNew;
		document.getElementById("newIDD").value = newID;
		if (sOld != "") {
			showemptynewDescriptionDialog();
			document.getElementById("descriptionId").focus();
			return false;
		}
		if (sType == "") {
			alert("<bean:message key='BzComposer.datamanager.selectitemvalidation'/>");
		} else {
			if (taxrate == "" && sType == "TAX") {
				return selectTaxRateDialog();
				document.getElementById("tax_rate").focus();
			}
			if (sNew == "") {
				document.getElementById("descriptionId").focus();
				return showBlankDiscriptionDialog();
			} else {
				event.preventDefault();
				$("#saveSelectedItemDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 400,
									modal : true,
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {
											$(this).dialog("close");
											document.getElementById("tabid").value = "DM_Save";
											document.forms['dmForm'].action = "Configuration?tabid=DM_Save&tab=tr29";
											document.forms['dmForm'].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
			}
		}
	}

	function callUpdate() {
		//
		sType = document.getElementById("selectedTitle").innerHTML
		sOld = sOldVal;
		sNew = document.getElementById("descriptionId").value;
		newID = document.getElementById("newIDD").value;
		taxrate = document.getElementById("tax_rate").value;
		document.getElementById("sTitleId").value = sType;
		document.getElementById("sOldId").value = sOld;
		document.getElementById("sNewId").value = sNew;
		document.getElementById("newIDD").value = newID;
		if (sOld == "") {
			showemptyupdateDescriptionDialog();
			return false;
		}
		if (sType == "") {
			alert("<bean:message key='BzComposer.datamanager.selectitemvalidation'/>");
		} else {
			if (taxrate == "" && sType == "TAX") {
				return selectTaxRateDialog();
				document.getElementById("tax_rate").focus();
			}
			if (sNew == "") {
				document.getElementById("descriptionId").focus();
				return showBlankDiscriptionDialog();
			} else {
				event.preventDefault();
				$("#saveSelectedItemDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 400,
									modal : true,
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {
											$(this).dialog("close");
											document.getElementById("tabid").value = "DM_Update";
											document.forms['dmForm'].action = "Configuration?tabid=DM_Update&tab=tr29";
											document.forms['dmForm'].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
			}
		}
	}

	function callDefault() {
		sType = document.getElementById("selectedTitle").innerHTML
		sOld = sOldVal;
		sNew = document.getElementById("descriptionId").value;
		newID = document.getElementById("newIDD").value;
		taxrate = document.getElementById("tax_rate").value;
		document.getElementById("sTitleId").value = sType;
		document.getElementById("sOldId").value = sOld;
		document.getElementById("sNewId").value = sNew;
		document.getElementById("newIDD").value = newID;
		if (sNew == "") {
			document.getElementById("descriptionId").focus();
			return showBlankDiscriptionDialog();
		} else {
			event.preventDefault();
			$("#defaultSelectedItemDialog")
					.dialog(
							{
								resizable : false,
								height : 200,
								width : 400,
								modal : true,
								buttons : {
									"<spring:message code='BzComposer.global.ok'/>" : function() {
											$(this).dialog("close");
											document.getElementById("tabid").value = "DM_SaveDefaultValues";
											document.forms['dmForm'].action = "Configuration?tabid=DM_SaveDefaultValues&tab=tr29";
											document.forms['dmForm'].submit();
									},
									"<spring:message code='BzComposer.global.cancel'/>" : function() {
										$(this).dialog("close");
										return false;
									}
								}
							});
		}
	}
	
	function callDelete() {
		sType = document.getElementById("selectedTitle").innerHTML
		sOld = sOldVal;
		newID = document.getElementById("newIDD").value;
		sNew = document.getElementById("descriptionId").value;
		document.getElementById("sTitleId").value = sType;
		document.getElementById("sOldId").value = sOld;
		document.getElementById("sNewId").value = sNew;
		document.getElementById("newIDD").value = newID;
		if (sNew == "") {
			document.getElementById("descriptionId").focus();
			return showBlankDiscriptionDialog();
		} else {
			event.preventDefault();
			$("#deleteSelectedItemDialog")
					.dialog(
							{
								resizable : false,
								height : 200,
								width : 400,
								modal : true,
								buttons : {
									"<spring:message code='BzComposer.global.ok'/>" : function() {
										$(this).dialog("close");
										window.location = "Configuration?tabid=DM_Delete&tab=tr29&sTitleval="
												+ sType + "&sNewvalID=" + sNew;
									},
									"<spring:message code='BzComposer.global.cancel'/>" : function() {
										$(this).dialog("close");
										return false;
									}
								}
							});
		}
	}

	function callClear() {
		document.getElementById("selectedTitle").innerHTML = "";
		document.getElementById("descriptionId").value = "";
		document.getElementById("tax_rate").value = "";
		document.getElementById("newIDD").value = "";
		sOldVal = "";
		document.getElementById("16$$").style.background = '#ffffff'
		document.getElementById("16$$").selectedIndex = -1;
	}

	function saveSelectedItemDialog() {
		event.preventDefault();
		$("#saveSelectedItemDialog")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 400,
							modal : true,
							buttons : {
								"<spring:message code='BzComposer.global.ok'/>" : function() {
									$(this).dialog("close");
									document.forms['dmForm'].action = "Configuration?tabid=DM_Save&tab=tr29";
									document.forms['dmForm'].submit();
								},
								"<spring:message code='BzComposer.global.cancel'/>" : function() {
									$(this).dialog("close");
									return false;
								}
							}
						});
		return false;
	}

	function SaveValues(form) {

		let custTitleID = form.custTitleID.value;
		let shippingViaID = form.shippingViaID.value;
		let salesRepId = form.salesRepId.value;
		let selectedTermId = form.selectedTermId.value;
		let businessTypeId = form.businessTypeId.value;
		let customerSourceId = form.customerSourceId.value;
		let paymentTypeId = form.paymentTypeId.value;
		let receivedTypeId = form.receivedTypeId.value;
		let creditCardTypeId = form.creditCardTypeId.value;
		let messageId = form.messageId.value;
		let locationID = form.locationID.value;
		let unitCategoryID = form.unitCategoryID.value;
		event.preventDefault();
		$("#showsaverecorddialog")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 400,
							modal : true,
							buttons : {
								"<spring:message code='BzComposer.global.ok'/>" : function() {
									$(this).dialog("close");
									document.getElementById("tabid").value = "DM_Save";
									document.forms['dmForm'].action = "Configuration?tabid=DM_SaveDefaultValues&tab=tr29";
									document.forms['dmForm'].submit();
								},
								"<spring:message code='BzComposer.global.cancel'/>" : function() {
									$(this).dialog("close");
									return false;
								}
							}
						});
	}
	function showemptynewDescriptionDialog() {
		event.preventDefault();
		$("#showemptynewDescriptionDialog").dialog({
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

	function showemptyupdateDescriptionDialog() {
		event.preventDefault();
		$("#showemptyupdateDescriptionDialog").dialog({
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

	function selectItemDialog() {
		event.preventDefault();
		$("#selectItemDialog")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 300,
							modal : true,
							buttons : {
								"<spring:message code='BzComposer.global.ok'/>" : function() {
									$(this).dialog("close");
								},
								"<spring:message code='BzComposer.global.cancel'/>" : function() {
									$(this).dialog("close");
									return false;
								}
							}
						});
		return false;
	}

	function selectTaxRateDialog() {
		event.preventDefault();
		$("#selectTaxRateDialog")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 300,
							modal : true,
							buttons : {
								"<spring:message code='BzComposer.global.ok'/>" : function() {
									$(this).dialog("close");
								},
								"<spring:message code='BzComposer.global.cancel'/>" : function() {
									$(this).dialog("close");
									return false;
								}
							}
						});
		return false;
	}

	function showBlankDiscriptionDialog() {
		event.preventDefault();
		$("#showBlankDiscriptionDialog")
				.dialog(
						{
							resizable : false,
							height : 200,
							width : 400,
							modal : true,
							buttons : {
								"<spring:message code='BzComposer.global.ok'/>" : function() {
									$(this).dialog("close");
								},
								"<spring:message code='BzComposer.global.cancel'/>" : function() {
									$(this).dialog("close");
									return false;
								}
							}
						});
		return false;
	}
</script>
</html>
<div id="showsaverecorddialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.configuration.saveconfirm" />
	</p>
</div>
<div id="selectItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.datamanager.selectitemvalidation" />
	</p>
</div>
<div id="selectTaxRateDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.datamanager.entertaxratevalidation" />
	</p>
</div>
<div id="showBlankDiscriptionDialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.datamanager.enterdescriptionvalidation" />
	</p>
</div>
<div id="saveSelectedItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.datamanager.saveselecteditem" />
	</p>
</div>
<div id="deleteSelectedItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.datamanager.deleteselecteditem" />
	</p>
</div>
<div id="defaultSelectedItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.datamanager.defaultselecteditem" />
	</p>
</div>
<!-- Dialog box used in this page -->
<div id="showemptynewDescriptionDialog" style="display: none;">
	<p>Please Enter Description Value First</p>
</div>
<div id="showemptyupdateDescriptionDialog" style="display: none;">
	<p>Please Select Update Description Vlaue First</p>
</div>