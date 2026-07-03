<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>

<title><spring:message code="BzComposer.bankingtitle" /></title>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
 
<spring:url value="/cssresources/Myapp.css" var="mycss" />
<script>var ctx = "${pageContext.request.contextPath}";</script>
<style type="text/css">
div#pie { /* 	color:#05A9C5;; */
	padding: 5px 0px 5px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}

table.tabla-listados th thead tr {
	font-size: 12px;
	text-align: left;
	padding: 5px 10px;
	/* 	background: rgba(5, 169, 197, 0.11); */
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	/* 	color: #333; */
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}

table.tabla-listados tbody tr td th {
	font-size: 12px;
	/* 	color: #666; */
	padding: 5px 0px 5px 5px;
	/* 	border-bottom: 1px solid rgb(207, 207, 207); */
	background: #fff;
	vertical-align: top;
}

#popupWindow {
	/* width: 1500px;
    height: 900px;*/
	
}


.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	height: auto;
	width: 300px;
	display: block;
	z-index: 101;
}

#popupWindow {
	
}

.arrowButton {
	position: relative;
	padding: 15px 10px;
	background: #fff;
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 400;
	font-size: 0.6em;
	letter-spacing: 1px;
	transition: 0.55;
	clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%);
}

.NewArrowButton {
	position: relative;
	padding: 15px 10px;
	background: #2E8565;
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 400;
	font-size: 0.6em;
	letter-spacing: 1px;
	transition: 0.55;
	/* clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%); */
	clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%);
}

.ArrowButtonSelect {
	position: relative;
	padding: 15px 10px;
	background: #B6D0E2;
	color: #555;
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 400;
	font-size: 0.6em;
	letter-spacing: 1px;
	transition: 0.55;
	/* clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%); */
	clip-path: polygon(93% 0, 100% 49%, 93% 100%, 0% 100%, 6% 50%, 0% 0%);
}

.arrowButton a:link, a:visited {
	color: (internal value);
	text-decoration: underline;
	cursor: auto;
}

.horizontal_line {
	background-color: green;
	width: 90%;
	height: 5px;
	border-top: 5px dotted black;
	line-height: 80%;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff;
	padding: 5px;
}
/* .table tr:hover { cursor: pointer;} */
.bz_dialogTable tr td {
	padding: 5px;
}

.bz_dialogTable tr td label {
	font-size: 6px;
}

.bz_dialogTable tr td input {
	font-size: 12px;
}

.bz_dialogTable tr td select {
	font-size: 12px;
}

.bzbtn {
	position: relative;
	top: 10px;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

.titl1 {
	color: #373D3F;
}

label {
	display: inline-block;
	margin-bottom: 0;
}

.nav {
	padding-left: 15px;
}

.nav-item {
	border-color: #dee2e6 ! important;
}

.nav-item.active {
	border-color: 2px solid #dee2e6 ! important;
}

.errorField {
	color: red ! important;
}

.customSearch {
	display: none;
}
</style>
</head>
<body>
	<div id="ddcolortabsline">&nbsp;</div>


	<form:form name="opportunityDetails" id="caseManagerForm"
		method="post" modelAttribute="customerCaseDto">


		<div class="content1 clearfix">
		
		<p>
        <a href="Customer?tabid=caseBoard" class="btn btn-info btn-md">
          <span class="glyphicon glyphicon-arrow-left"></span> &#129152; CASEBOARD
        </a>
      </p> 
			<h3 class="title1">
				<img style="margin: 0;"
					src="${pageContext.request.contextPath}/images/Case.png"
					height='48' width='58'>
				  <spring:message code="BzComposer.customer.case" />
			</h3>
			<h5 class="titl1">${customerCaseDto.subject}</td> </h5>
			<div class="filterbar filterbar1">

				<table style="width: 50%;">
					<tr class="title1" style="font-size: 13px">
						<td><spring:message
								code="BzComposer.customer.case.priority" /></td>

						<td><spring:message
								code="BzComposer.customer.case.status" /></td>
						<td><spring:message
								code="BzComposer.customer.case.caseID" /></td>


						<td><spring:message
								code="BzComposer.customer.case.caseOwner" /></td>
					</tr>
					<tr>
					        <td>${priority}</td>



						<td rowspan="2" style="border-color: #96D4D4;">

							${status}</td>
						<td rowspan="2" style="border-color: #96D4D4;">

							${customerCaseDto.caseID}</td>

						

						<td>${customerCaseDto.owner}</td>
					</tr>

				</table>

			</div>
			<div class="filterbar filterbar1">
				<table style="width: 50%;">
					<tr>

						<td><a id="S1" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.case.newStatus" /></a></td>
						<td><a id="S2" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.case.workingStatus" /></a></td>
						<td><a id="S3" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"><spring:message
									code="BzComposer.customer.case.escalatedStatus" /></a></td>
						<td><a id="S4" class="arrowButton" style="float: right;"
							href="#" onclick="chooseStage(this.className,this.id)"> <spring:message
									code="BzComposer.customer.case.closedStatus" /></a></td>
						
						<td>
							<button type="button" class="btn btn-info"
								style="font-size: 12px; margin: 20px 0px 20px 0px;" onclick="markStageCompleted()">
								Mark
								<spring:message
									code="BzComposer.customer.opportunity.markStageCompleted" />


							</button>
                   
							<button type="button" class="btn btn-info"
								style=" font-size: 12px ; margin: 20px 0px 20px 0px;" onclick="saveStage()">

								<spring:message
									code="BzComposer.customer.opportunity.saveChanges" />
							</button>

						</td>
					</tr>
				</table>
			</div>

			<div class="row">
				<div class="col-md-12 d-flex flex-column full-height">
					<div id="selectedAccount" style="width: 100%;">
						<h4 class="title2"></h4>
						<!-- <h4 class="title2">Personal Checking 5423</h4> -->
					</div>

				</div>
			</div>



			<div id="table-negotiations"
				style="padding: 0; border: 1px solid #ccc;">
				<table cellspacing="0"
					style="border: 0; width: 100%; overflow-y: scroll;"
					class="section-border">

					<tr>

						<td valign="top">
							<div id="tabs" style="height: auto;">
								<ul>
									<li style="font-size: 12px;"><a href="#activityTab"><spring:message
												code="BzComposer.customer.opportunity.activity" /></a>
												</li>
												
												<li style="font-size: 12px;"><a
										href="#CommentsTab"><spring:message
												code="BzComposer.customer.case.comments" /></a></li>
												
									<li style="font-size: 12px;"><a
										href="#opportunityDetailsTab"><spring:message
												code="BzComposer.customer.opportunity.details" /></a></li>
								</ul>
								
								
								
								<!-- activityTab Starts   -->
								<div id="activityTab" style="display: none;">
									<table class="table-notifications" width="100%">
										<tr>
											<td colspan="4"><a href="#"
												class="btn btn-primary btn-sm active" role="button"
												aria-pressed="true" onclick="openCalendar()"><spring:message
														code="BzComposer.customer.opportunity.calendar" /> <i
													class="fa fa-calendar" aria-hidden="true"
													style="font-size: 18px; color: red"></i> </a> <a href="#"
												class="btn btn-primary btn-sm active" role="button"
												aria-pressed="true" onclick="addEvent()"> <spring:message
														code="BzComposer.customer.opportunity.manageEvent" /> <svg
														xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														fill="currentColor" class="bi bi-calendar4-event"
														viewBox="0 0 16 16">
  <path
															d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z" />
  <path
															d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z" />
</svg>
											</a></td>
										</tr>
									</table>

									<div style="width: 80%;" align="center">
										<img
											src="${pageContext.request.contextPath}/images/EventsIcon.png">
										<label for="css" style="color: #05A9C5">
											<h5>Upcoming Events</h5>
										</label><br>
										<table id="custTable" class="tabla-listados sortable"
											cellspacing="0"
											style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
											align="center">
											<thead>
												<tr valign="center" style="width: 80%;">

													<th style="padding-right: 30px !important;"><spring:message
															code="BzComposer.Customer.opportunities.id" /></th>
													<th><spring:message
															code="BzComposer.customer.opportunity.eventName" /></th>

													<th><spring:message
															code="BzComposer.customer.opportunity.eventMemo" /></th>
													<th><spring:message
															code="BzComposer.customer.opportunity.eventStartDate" /></th>

													<th><spring:message
															code="BzComposer.customer.opportunity.eventEndDate" /></th>
												</tr>
											</thead>

											<tbody id="custTableBody">
												<c:if test="${not empty eventList}">
													<c:forEach items="${eventList}" var="objList"
														varStatus="loop">
														<tr id='${loop.index}$$'
															onclick="setRowId(${objList.eventId}, ${loop.index}, true);">

															<td><input type="checkbox" id="eventId${loop.index}"
																value="${objList.eventId}"
																onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
																${objList.eventId}</td>
															<td>${objList.eventName}</td>
															<td>${objList.eventMemo}</td>
															<td>${objList.eventStartDate}</td>
															<td>${objList.eventEndDate}</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

									</div>


								</div>
							


								<!--       activity end  -->
								
								
								<!--  -->
								
								
								
								
								<div id="commentsTab" style="display: none;">
									<table class="table-notifications" width="100%">
										<tr>
											<td colspan="4"><a href="#"
												class="btn btn-primary btn-md active" role="button"
												aria-pressed="true" id="AddItemBtn">
												<spring:message
														code="BzComposer.customer.case.comments.new" />  </a>
														
														 <a href="#"
												class="btn btn-primary btn-md active" role="button"
												aria-pressed="true"  id="editCommentBtn"> <spring:message
														code="BzComposer.customer.case.comments.edit" /> 

											</a>
											 <a href="#"
												class="btn btn-primary btn-md active" role="button"
												aria-pressed="true" id="deleteCommentBtn"> <spring:message
														code="BzComposer.customer.case.comments.delete" /> 

											</a>
											</td>
										</tr>
									</table>
                                        <input type="hidden" name="clistSize" id="cSize" value='${commentList.size()}' />
									<div style="width: 80%;" align="center">
										<img
											src="${pageContext.request.contextPath}/images/EventsIcon.png">
										<label for="css" style="color: #05A9C5">
											<h5> Case Comments</h5>
										</label><br>
										<table id="commentTable" class="tabla-listados sortable"
											cellspacing="0"
											style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
											align="center">
											
											 <colgroup>
                                       <col span="1" style="width: 15%;">
                                         <col span="1" style="width: 15%;">
                                         <col span="1" style="width: 15%;">
                                          <col span="1" style="width: 55%;">
                                          
                                                    </colgroup>
											<thead>
												<tr valign="center" style="width: 80%;">

													<th style="padding-right: 30px !important;"><spring:message
															code="BzComposer.customer.case.commentsID" /></th>
															<th><spring:message
															code="BzComposer.customer.case.comment.addedBy" /></th>
													<th><spring:message
															code="BzComposer.customer.case.createdDate" /></th>
															

													<th><spring:message
															code="BzComposer.customer.case.comment" /></th>
													
												</tr>
											</thead>

                  
											<tbody id="commentTableBody" >
												<c:if test="${not empty commentList}">
													<c:forEach items="${commentList}" var="objList"
														varStatus="loop">
														<tr id='${loop.index}$$'
															onclick="setRowId(${objList.commentID}, ${loop.index}, true);">

															<td><input type="checkbox" id="commentId${loop.index}"
																value="${objList.commentID}"
																onchange="addRowIndex(${loop.index}, ${objList.commentID})" />
																${objList.commentID}</td>
															<td> ${objList.addedby}</td>
															<td>${objList.createdDate}</td>
															<td>${objList.comment}</td>
															
															
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

									</div>


								</div>
								<!--   -->
								
								
								
								
								<!--  opportunity details start  -->
								<div id="opportunityDetailsTab">
	                                   <div id="content1" class="tabPage">
										<div align="right">
											<input type="button" class="formbutton"
												style="padding: 7 15px;" onclick="editOpportunity()"
												value="<spring:message code='BzComposer.global.edit'/>" />
											<input type="button" class="formbutton"
												style="padding: 7 15px;" onclick="updateCase()"
												value="<spring:message code='BzComposer.global.save'/>" />
										 </div>
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
										</div>
				
								</div>
							
					
								
							</div>
					     	</td>
					</tr>
				</table>
			</div>


		</div>
	

		<input type="hidden" id="tabid" name="tabid" value="" />
			<form:hidden path="clientVendorID"/>
	</form:form>
	
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js">
	</script>
	<script type="text/javascript">                            
	const stages=["New", "Working", "Escalated", "Closed" ];
	let stageArray = new Array(4).fill(false);
	var selectedStage="";
	<!-- Javascript Begins Here -->
	
	$(function() {
	    $( "#tabs" ).tabs();
	  });
	
	$(document).ready(function () {

		 $("#AddEditItemDlg").hide();
		 $("#editComment").hide();
		 
		 $( "#AddItemBtn").on("click", function(){
	          $( "#AddEditItemDlg").dialog({
	             modal: true,
	             title: 'Add Comment'
	          });
	          $("#itemID").val('0');
	          $("#itemName").val('');
	          $("#itemDescription").val('');
	          if($("#categoryTypeA").val()==1){
	            $("#itemCategoryID").val($("#categoryIDA").val());
	          }
	     });
		 
		 $( "#editCommentBtn").on("click", function()
				 {
			 showUpdateCommentDialog();
	        
	     });
		 
		 $( "#deleteCommentBtn").on("click", function()
				 {
			 
			 showDeleteCommentDialog();
	        
	     });
	
		 var stage='${status}';

	
let j;
let  currentStage;


for ( j = 0; j < 4; j++)
{
   if(stage==stages[j])
	{
	   currentStage=j;
	   break;
	}
}
for (k = 0;k <=currentStage; k++)
{
 stageArray[k]=true;
 selectedStage="S"+(k+1);
 
  markStageCompleted(); 
}
	});
	
	function updateCase() 
	{

		
		
				event.preventDefault();
				$("#addNewCaseDialog")
						.dialog(
								{
									resizable : false,
									height : 200,
									width : 500,
									modal : true,
									position: 
						            {
						            	my: "center",
						            	  at: "center",
						            	  of: "#content1"
						            },
									buttons : {
										"<spring:message code='BzComposer.global.ok'/>" : function() {

											$(this).dialog("close");
											//document.getElementById('tabid').value = "AddCustomer";
											// document.forms["frmNewCustomer"].action = "Customer?tabid=AddCustomer" ;
											//document.forms["frmNewCustomer"].action = "/postNewLead";

											document.forms["caseManagerForm"].action = "/Case?tabid=updateCase";
											document.forms["caseManagerForm"].submit();
										},
										"<spring:message code='BzComposer.global.cancel'/>" : function() {
											$(this).dialog("close");
											return false;
										}
									}
								});
				return false;
				
		
	}
	
	
	function loadCaseCommentsData()
	{
	   
		console.log("setCutomerCasesDataById");
	   // clientVendorID = vendorID;
	    $.ajax({
	        type: "POST",
	        url:"CustomerAjax?tabid=getCustomerCaseCommentsDetails&caseId="+${customerCaseDto.caseID},
	       // data:{clientVendorID : vendorID},
	        success : function(data)
	        {

	           //alert(" opportunity data lenth="+data.length);
	        	$('#commentTableBody').html('');
	            var caseTable = "";//"<input type='hidden' name='plistSize' id='caseSize' value='"+data.length+"'>";
	            for(var i=0; i<data.length; i++){
	                var objList = data[i];
	                caseTable =  caseTable + "<tr id='"+i+"$$'   onclick='setRowId("+objList.commentID+", "+i+",true)' >"
	                    +"<td><input type=checkbox id=commentId"+i+" value='"+ objList.commentID+"' onchange='addRowIndex("+i+","+objList.commentID+")'/> "
	                    +objList.commentID+"</td>"+"<td>"+objList.addedby+"</td><td>"+objList.createdDate+"</td><td>"+objList.comment+"</td></tr>";
	            }
	            $('#commentTableBody').html(caseTable);           
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });

	}
	
	

function saveStage()
	{
   let i;

	 for ( i = 0; i <4; i ++)
	  {
         if(stageArray[i]==false)
        	 break;
	  } 
	   
	 const intstages=["1", "2", "3", "4" ];
	    

	 var updateCaseDetails= 
	   {
	     "caseID": '${customerCaseDto.caseID}',
	     "stage": intstages[i-1],
	    };
	 
	 var obj=JSON.stringify(updateCaseDetails);

	 $.ajax({
	 		type : "POST",
	 		url : "caseStageUpdate?tabid=updateStatus",
	 	    data :"data=" + obj,
	 	    success : function(data)
	 	    {	 	    
	 	      alert("Case   Status updated  Successfully !!");
	 	    	location.reload();
	 		}
	 		,
	 		 error : function(data) 
	 		 {
	 			 
	 			 //return showerrordialog();
	 		}
	 	});
         
	}

 function validateStage(index)
 {
	 let i;
	 
	 for(i=index;i>=0;i--)
		 {
		 if(stageArray[i]==false)
			 return false;		 
		 
		 }
	 return  true; 
 }
	
	function openCalendar()
	{
	window.open("Case?tabid=caseEventCalendar&caseID="+${customerCaseDto.caseID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function addEvent()
	{
		window.open("Case?tabid=manageCaseEvent&caseID="+${customerCaseDto.caseID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	
	function editComment()
	{
		window.open("Case?tabid=manageCaseEvent&caseID="+${customerCaseDto.caseID}, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");
		
	}
	function stageSelected(selectedStage)
	{
		 document.getElementById(selectedStage).classList.remove("NewArrowButton");
		  document.getElementById(selectedStage).classList.add("ArrowButtonSelect");
		  document.getElementById(selectedStage).style.color ="white";
	
	}
	
	function getcommentData(commentID)
	{
	 
	    $.ajax({
	        type: "POST",
	        url:"CustomerAjax?tabid=getCaseCommentDetails&commentID="+commentID,
	        data:{clientVendorID : vendorID},
	        success : function(data)
	        {
	           
	        	//alert(" case Comment"+data.comment);
	        	
	                    
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });

	}
	
	
	function showDeleteCommentDialog()
	{

		if(itemID==0)
			showSelectOneDialog();
		
		else
			{
			$("#confirmDialog").dialog({
	            resizable: false,
	            height:180,
	            width: 400,
	            modal: true,
	           
	            buttons: 
	            {
	                "<spring:message code='BzComposer.global.ok'/>": function ()
	                {
	                    $(this).dialog("close");
	                    

	        			$.ajax({
	        				type : "POST",
	        				url : "caseComment?tabid=deleteComment&commentID="+itemID,
	        				success : function(data)
	        				{
	        					loadCaseCommentsData();
	        				  // location.reload();
	        				 //window.opener.location.reload();
	        				},
	        				error : function(data) {

	        					return showerrordialog();
	        				}
	        			});
	        			
	        			}
	                    
	               
	                ,
	                "<spring:message code='BzComposer.global.cancel'/>": function ()
	                {
	                    $(this).dialog("close");
	                    
	                }
	      
	            }
	        });
			}
			
			

		
	}
	
	
	function showUpdateCommentDialog()
	{

		
		
		if(itemID==0)
			showSelectOneDialog();
		else
			{

		$.ajax({
		        type: "POST",
		        url:"CustomerAjax?tabid=getCaseCommentDetails&commentID="+itemID,
		        data:{clientVendorID : itemID},
		        success : function(data)
		        {
		          
		        	
		        	 $("#commentBox2").val(data.comment);
		        	 
		        	 document.getElementById('commentID').innerHTML=data.commentID;
		        	 
		        	 document.getElementById('createdDateData').innerHTML=data.createdDate;
		        	// document.getElementById('createdDateData').innerHTML=data.createdDate;
		        	 
		        	 
		        	 
		    
		        	
		       },
		        error : function(error) {
		            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
		       }
		   });
		
		  $( "#editComment").dialog({
	             modal: true,
	             title: 'Edit Comment',
	             
	             
	          });
			}
		
	}
	function updateComment()

	{
	 var caseComment =document.getElementById("commentBox2").value;
	
	 var caseID='${customerCaseDto.caseID}';
	 var addedby='${customerCaseDto.owner}'
		if ( caseComment == "") 
		{
			$('#fieldError').modal('toggle'); 
			
		}

		var commentDetail = {
			"comment" : caseComment,
			"commentID" : itemID,
			"addedby" :addedby,
			
		};
		var obj = JSON.stringify(commentDetail);
		     
		$.ajax({
			type : "POST",
			url : "caseComment?tabid=updateComment",
			data : "data=" + obj,
			success : function(data)
			{
				
				
				
			// location.reload();
			 //window.opener.location.reload();
				loadCaseCommentsData();
				$('#editComment').dialog('close');
			},
			error : function(data) {

				return showerrordialog();
			}
		});
		
	
	}

	function chooseStage(className,id)
	{
	
		if(id=="S1"&& stageArray[0]==false )
			{
			 selectedStage="S1";
			 stageSelected(selectedStage);
			
			}
	   
		   if(id=="S2"&& stageArray[1]==false)
			   {
			   selectedStage="S2";
			   stageSelected(selectedStage);
			   }	
	   
		   if(id=="S3"&& stageArray[2]==false)
			   {
			   selectedStage="S3";
			   stageSelected(selectedStage);
			   }
		   if(id=="S4")
			   {
			   selectedStage="S4";
			   stageSelected(selectedStage);
			   }
		   
		   

	}
	
	
	function saveOpportunity()
	{
		$("#saveOpportunityDialog").dialog({
            resizable: false,
            height:180,
            width: 400,
            modal: true,
            position: 
            {
            	my: "center",
            	  at: "center",
            	  of: "#content1"
            },
            buttons: 
            {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                    $(this).dialog("close");
                    
                    
                	document.forms["caseManagerForm"].action = "/Case?tabid=updateCase";
					document.forms["caseManagerForm"]
							.submit();
                    
                    
                    /*
                    $.ajax({
            	 		type : "POST",
            	 		url : "Opportunity?tabid=updateOpportunity",
            	 	    success : function(data)
            	 	    {
            	 	    
            	 	      alert("opportunity  updated  Successfully !!");
            	 	    	location.reload();
            	 		}
            	 		,
            	 		 error : function(data) 
            	 		 {
            	 			 
            	 			 //return showerrordialog();
            	 		}
            	 	});
                    */
                    
                },
                
                "<spring:message code='BzComposer.global.cancel'/>": function ()
                {
                    $(this).dialog("close");
                    
                }
            }
        });
	
	
	
	}
	
	function  showSelectOneDialog()
	{
		$("#selectOneDialog").dialog({
            resizable: false,
            height:180,
            width: 400,
            modal: true,
           
            buttons: 
            {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                    $(this).dialog("close");
                    
                }
            }
        });
	
	}
	

	
	function  showErrorDialog()
	{
		$("#showErrorDialog").dialog({
            resizable: false,
            height:180,
            width: 400,
            modal: true,
            position: 
            {
            	my: "center",
            	  at: "center",
            	  of: "#content1"
            },
            buttons: 
            {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                    $(this).dialog("close");
                    
                }
            }
        });
	
	}
	
	function changeStageClass()
	{
		  document.getElementById(selectedStage).classList.remove("ArrowButtonSelect");
		  document.getElementById(selectedStage).classList.add("NewArrowButton");
		  document.getElementById(selectedStage).style.color ="white";
	}
	
	let itemID=0;
	
	function setRowId(rowid, rowIndex, flag)
	{
	    let lSize = document.getElementById("cSize").value;
	    for (i=0; i<lSize; i++) {
	        let currROW = document.getElementById(i+'$$');
	        if(currROW == null) continue;
	        if(i%2 == 1){
	            currROW.className = "odd";
	        }else{
	            currROW.className = "even";
	        }
	    }
	    if(flag){
	         itemID = rowid;
	         itemIndex = rowIndex;
	        if(rowIndex%2 == 1)
	        { ;
	            document.getElementById(rowIndex+"$$").classList.remove('odd');
	        }
	        document.getElementById(rowIndex+'$$').classList.add('draft');
	    }
	}
	
function saveComment()

	{
	 var caseComment =document.getElementById("commentBox").value;
	// alert(caseComment);
	 var caseID='${customerCaseDto.caseID}';
	 var addedby='${customerCaseDto.owner}'
		if ( caseComment == "") 
		{
			$('#fieldError').modal('toggle'); 
			
		}

		var commentDetail = {
			"comment" : caseComment,
			"caseID" : caseID,
			"addedby" :addedby,
			
		};
		var obj = JSON.stringify(commentDetail);
		     //  alert(obj);
		$.ajax({
			type : "POST",
			url : "caseComment?tabid=saveComment",
			data : "data=" + obj,
			success : function(data)
			{
				
				$('#AddEditItemDlg').dialog('close');
				loadCaseCommentsData();
			// location.reload();
			// window.opener.location.reload();
			},
			error : function(data) {

				return showerrordialog();
			}
		});
	
	}
	
function closeNewCommentDialog()
{

	
	$('#AddEditItemDlg').dialog('close');
	
}

function closeCommentDialog()
{
	

	$('#editComment').dialog('close');
}

	function markStageCompleted()
	{

		  if(selectedStage=="S1")
			  {
			  changeStageClass();
			  document.getElementById("S1").innerHTML="&#10003;<spring:message code="BzComposer.customer.case.newStatus"/>" ;
		     stageArray[0]=true;
			  }
		  if(selectedStage=="S2")
			  { 

						if(validateStage(0)==true)
						{
					 changeStageClass();
						 document.getElementById("S2").innerHTML="&#10003;<spring:message code="BzComposer.customer.case.workingStatus"/>";
						 stageArray[1]=true;
						}
						else
					   { 
					 	showErrorDialog();				
					 
					   }
			  }
		  if(selectedStage=="S3")
			  {

				if(validateStage(1)==true)
				{
					 changeStageClass();
					  document.getElementById("S3").innerHTML="&#10003;<spring:message code="BzComposer.customer.case.escalatedStatus"/>";
			          stageArray[2]=true;
			          
				}
				 else
					{
					showErrorDialog();
					}
			  }
		  if(selectedStage=="S4")
			  {

					  if(validateStage(2)==true)
						{
							  changeStageClass();
							  document.getElementById("S4").innerHTML="&#10003;<spring:message code="BzComposer.customer.case.closedStatus"/>";
							  stageArray[3]=true;
						}
					  else
						{
						showErrorDialog();
						}
			  }
		   
	}
</script>


</body>
</html>

<div id="saveOpportunityDialog" title="Warning  .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.saveOpportunity"/>
	</p>
</div>
<div id="editOpportunityDialog" title="Warning .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.editOpportunity" />
	</p>
</div>
<div id="showErrorDialog" title="Invalid Stage .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.invalidStage" />
	</p>
</div>
<div id="addNewCaseDialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.customer.opportunity.updateCase"/>
	</p>
</div>

<div id="selectOneDialog" title="Please Select one record .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.case.selectOne" />
	</p>
</div>


<div id="confirmDialog" title="Confirm  .."
	style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.case.confirm" />
	</p>
</div>


<div class="container-fluid" id="AddEditItemDlg">
	<div class="table-responsive" style="padding:10 20px;font-size: 14px;border: 1px solid #ced4da;border-radius: .25rem;min-height: 220px">
         <h6><spring:message code="BzComposer.customer.case.commentInfo"/></h6>
         
         <span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									
									 <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
									</c:if>
								</span>
         <hr/>
	   
	       <div class="row">
			    <div class="col-md-1"></div>
				<label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.commentsID"/> 
				
				</label>
				
				<div class="col-md-5">:${customerCaseDto.nextCommentID}</div>
				
			 <div class="col-md-3"></div>
		     	</div>
	        <div class="row">
                <div class="col-md-1"></div>
                <label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.comment"/></label>
                <div class="col-md-6">
                    <textarea   class="form-control" id="commentBox"  rows="4" cols="80"> </textarea>
                </div>
                <div class="col-md-3">  </div>
            </div>
			<div class="row">
			    <div class="col-md-1"></div>
				<label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.addedBy"/></label>
				<div class="col-md-5">
                 : ${customerCaseDto.owner}
				</div>
			 
			 	<div class="col-md-3"></div>
		     	</div>
			<div>
           
            <div class="row">
                <div class="col-md-4"></div>
               
          <div class="col-md-8 pt-2" style="font-size: 14px;">
                    <button type="button" class="btn btn-info"  onclick="saveComment();" ><spring:message code="BzComposer.global.save"/></button>
                    <button type="button" class="btn btn-info" onclick="closeNewCommentDialog();"><spring:message code="BzComposer.global.close"/></button>
         </div>
            </div>
	</div>
</div>
</div>


<div class="container-fluid"  id="editComment">
	<div class="table-responsive" style="padding:10 20px;font-size: 14px;border: 1px solid #ced4da;border-radius: .25rem;min-height: 220px">
         <h6><spring:message code="BzComposer.customer.case.commentInfo"/></h6>
         
          <span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									
									 <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
									</c:if>
								</span>
         <hr/>
	   
	       <div class="row">
			    <div class="col-md-1"></div>
				<label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.commentsID"/>:
				
				</label>
				
				<div class="col-md-5">
				<label class="col-md-3 text-center" id="commentID"> 
				
				</label>
				</div>
				
<div class="col-md-3"></div>
		     	</div>
	        <div class="row">
                <div class="col-md-1"></div>
                <label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.comment"/>:</label>
                <div class="col-md-8">
                    <textarea   class="form-control" id="commentBox2"  rows="4" cols="80">
                    
                     </textarea>
                </div>
                <div class="col-md-3">  </div>
            </div>
			<div class="row">
			    <div class="col-md-1"></div>
				<label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.addedBy"/>:</label>
				<div   class="col-md-5">
				
 <label class="row-md-3 text-center" id="createdBy">  ${customerCaseDto.owner} </label>
				</div>
			 	<div class="col-md-3"></div>
		     	</div>
		     	<div class="row">
			    <div class="col-md-1"></div>
				<label class="col-md-3 text-right"><spring:message code="BzComposer.customer.case.createdDate"/>:</label>
				<div   class="col-md-5">
			
                <label class="row-md-5 text-center" id="createdDateData">  
                </label>
        
				</div>
			 	<div class="col-md-3"></div>
		     	</div>
			<div>
           
            <div class="row">
                <div class="col-md-4"></div>
               
          <div class="col-md-8 pt-2" style="font-size: 14px;">
                    <button type="button" class="btn btn-info"  onclick="updateComment();" ><spring:message code="BzComposer.global.update"/></button>
                    <button type="button" class="btn btn-info" onclick="closeCommentDialog();"><spring:message code="BzComposer.global.close"/></button>
         </div>
            </div>
	</div>
</div>
</div>
