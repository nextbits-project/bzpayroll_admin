<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<title><spring:message
		code="BzComposer.customer.opportunity" /></title>
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


input, textarea, select {
	font-size: 12px !important;
}
</style>
<script type="text/javascript">
	
	
	
	function loadValues()
	{

  const stages=["prospecting", "qualification","needAnalysis", "valueProposition","decisionMakers",
    	"proposalPriceQuote","negotiationReview","perceptionAnalysis","closedWon","closedLoss"];
    
  let select = document.getElementById("selectStage");
    for (let i = 0; i < stages.length; i++) {
        let optn = stages[i];
        let el = document.createElement("option");
        el.textContent = optn;
        el.value = optn;
        select.appendChild(el);
    }
  
	}
	  function CloseMe() {
	        window.close();
	        
	    }
	

	function validate()
	{

		var amount=document.OpportunityForm.amount.value;
		var startDate=	document.OpportunityForm.startDate.value;
		var stage=document.OpportunityForm.stage.value;
		var opportunityName=document.OpportunityForm.opportunityName.value;
		
    
		if(amount=="0.0"||startDate==""||stage==""||opportunityName==""||amount=="")
			
			 return false;
		  
	   return true ;
	
	}
	
	 function refreshParent() {
		    window.opener.location.reload();
		    }
	 
    function saveOpportunity()
    {

    	if(validate()==false)
    		{
    		alert ("please Enter All Fields ");
    	return false ;
    		}
var cvid=document.OpportunityForm.clientVendorID.value;

document.forms["OpportunityForm"].action ="Customer?tabid=saveOpportunity&cvID="+cvid;
document.forms["OpportunityForm"].submit();
    
refreshParent();
    }
</script>
</head>
<body onload="loadValues();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<%-- <form action="Vendor?tabid=AOVODO" method="post"> --%>
	<form:form method="post"  name="OpportunityForm" modelAttribute="opportunityDto">
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
									<spring:message code="BzComposer.customer.opportunity.add" />
								</span>
							</div>
							<table cellpadding="0" cellspacing="0" border="0" align="center"
								style="width: 50%;">
								<tr>
									<td class="pageWin">
										<table cellpadding="0" cellspacing="0" border="0"
											style="width: 100%;">
											<c:if test="${not empty Status}">
												<tr>
													<td colspan="3"><span class="msgstyle">${Status}</span></td>
												</tr>
											</c:if>
											<c:if test="${not empty actionMsg}">
												<tr>
													<td colspan="3"><span class="msgstyle">${actionMsg}</span></td>
													<%
													session.removeAttribute("actionMsg");
													%>
												</tr>
											</c:if>
										</table>
									</td>
								</tr>
							</table>


							<div id="table-negotiations" align="center" > 
								<table class="tabla-listados" style="width: 80%; height=60%;"  >
									<thead>
										<tr  >
											<th colspan="7"><spring:message
													code="BzComposer.customer.opportunity.opportunityDetails" /></th>
										</tr>
									</thead>

									<tbody>
										

<tr>
											<td align="center">  <spring:message code="BzComposer.customer.opportunityid" /> 
											<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" />
												</span> 
												</td>
												 <td colspan="3"><form:input type="text"  readonly="true"  path="opportunityID"
													style="width:90%;" /></td>
											  </td>
											
									   </tr>
									    
										<tr>
											<td align="center">  <spring:message code="BzComposer.customer.opportunity.name" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" />
												</span> 
												 <td colspan="3"><form:input type="text" path="opportunityName"
													style="width:90%;" /></td>
											  </td>
											
									   </tr>
								


										<tr>
											<td align="center"><spring:message
													code="BzComposer.customer.opportunity.stage" /></td>
											<td>
											<form:select  id="selectStage" path="stage" style="width:300px;">
													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													<!--  form:options items="${VendorCategoryList}"
														itemValue="value" itemLabel="label" /-->
												</form:select >
											
											</td>
										</tr>
										
										<tr  >
										<td align="center" ><spring:message code="BzComposer.lead.source" /></td>
												<td><form:select path="SourceID"
																style="width:150px;">
																<option value="0"><spring:message
																		code="BzComposer.ComboBox.Select" />
																	</option>
																<c:forEach items="${leadSource}" var="curObject">
																	<option value="${curObject.leadSourceId}" ${curObject.leadSourceId==customerDto.leadSource?'selected':''}>${curObject.name}</option>
																</c:forEach>
															
												</form:select></td>
											
										</tr>
										<tr>
											<td align="center"><spring:message
													code="BzComposer.customer.opportunity.owner" />
														
														<td>
															<form:select path="opportunityOwner">
											
													<form:option value="0">
														<spring:message code="BzComposer.ComboBox.Select" />
													</form:option>
													
							
														
														<form:options items="${opportunityOwnerList}" itemValue="name"
																	itemLabel="name" />
													</form:select>
													</td>
											
										</tr>
										<tr>
											<td align="center"><spring:message code="BzComposer.customer.opportunity.amount" />
												<span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											 <td colspan="3"><form:input type="text" path="amount"
													style="width:90%;" /></td>

										</tr>
										
									<tr>
									
															<td  align="center"><spring:message code="BzComposer.campaign.selectCampaign" />
															
															</td>
									
									<td>
															<form:select path="campaignID" style="width:200px;">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<c:forEach items="${campaignList}" var="currObject">
																	<form:option value="${currObject.campaignID}">${currObject.campaignName}</form:option>
																</c:forEach>
																
															</form:select>
															
															</td>
									</tr>

										<tr>
											<td align="center"><spring:message code="BzComposer.customer.opportunity.startDate" /><span class="inputHighlighted"><spring:message
														code="BzComposer.CompulsoryField.Validation" /></span></td>
											<td><form:input type="text" path="startDate"
													readonly="true" /> <img
												src="${pageContext.request.contextPath}/images/cal.gif"
												onclick="displayCalendar(document.OpportunityForm.startDate,'mm-dd-yyyy',this);">
											</td>
											<td>&nbsp;</td>

										</tr>
									</tbody>
								</table>
							</div>
<div>
					<table cellpadding="0" cellspacing="0" border="0" align=center  style="width: 100%;margin-top:5px;">
			
				<tr>
					<td align="center">
						<button type="button" class="formbutton" title="New Opportunity" onclick="NewCustomer();"><spring:message code='BzComposer.global.new'/></button>
						<button type="button" class="formbutton" title="Save Opportunity" onclick="saveOpportunity()"><spring:message code='BzComposer.global.save'/></button>
						<button type="button" class="formbutton" title="Close" onclick="CloseMe();"><spring:message code='BzComposer.global.close'/></button>
						<input type="hidden" name="stname" value="" id="stateId" />
						<form:hidden path="clientVendorID"/>
						
						<input type="hidden" name="tabid" id="tabid" value="" />
					</td>
				</tr>
			</table>
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


