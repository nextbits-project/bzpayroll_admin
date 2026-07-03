<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
	<%@include file="/WEB-INF/jsp/include/header.jsp" %>
	<%@include file="/WEB-INF/jsp/include/menu.jsp" %>
	<title>
		<spring:message code="BzComposer.nonprofit.pledgetitle" />
	</title>
	<style type="text/css">
		table.cart tbody tr td {
			font-size: 14px;
		}

		.msgstyle {
			font-size: 18px;
			color: #3D9EAC;
		}

		.cellboder {
			border-bottom: 1px solid rgb(207, 207, 207);
		}
		#itemList tbody tr td{
			padding: 4px 0px 5px 9px;
		}
	</style>
</head>

<body onload="Init();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<form:form name="InvoiceForm" id="pledgeForm" method="post"
							modelAttribute="pledgeDto">
							<input type="hidden" id="oldValue" value="0">
							<input type="hidden" id="oldpname_id" value="">
							<input type="hidden" name="serviceName" value="">
							<form:hidden path="clientVendorID" />
							<form:hidden path="unitOfMeasureName" value="" />
							<form:hidden path="isBillToAddressChange" id="isBillToAddressChange" value="" />
							<form:hidden path="isNextTimeAppear" id="isNextTimeAppear" value="" />
							<form:hidden path="billToAddress" id="billToAddress" value="" />
                            <form:hidden path="billToCity" id="billToCity" value="" />
							<form:hidden path="subtotal" value="" />
							
							<form:errors />
							<div>
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<spring:message code="BzComposer.nonprofit.pledge" />
								</span>
							</div>
							<div
								style="width: 855; margin-left: auto; margin-right: auto; float: right;">
							</div>
							<div id="fullPageDetails"
								style="margin-left: auto; margin-right: auto;">
								<section>
									<div id="table-negotiations">
										<div id="CustomerDtailsInfo">
											<input type="hidden" name="CustDetails" id="custSize"
												value='${CustDetails.size()}'>
											<c:forEach items="${CustDetails}" var="objList"
												varStatus="loop">
												<input type="hidden" name='${loop.index}clientID'
													value='${objList.clientVendorID}'
													id='a${loop.index}clvndid' />
											</c:forEach>
										</div>
										<div id="BillShipAddrDetails">
											<input type="hidden" name="BLSize" id="bSize"
												value='${BillAddr.size()}'>
											<c:forEach items="${BillAddr}" var="objList" varStatus="loop">
												<input type="hidden" value='${objList.clientVendorID}'
													id='${loop.index}clvid' />
												<input type="hidden" value='${objList.billTo}'
													id='${loop.index}bl' />
												<input type="hidden" value='${CID}' id='${loop.index}cid' />
												<input type="hidden" value='${objList.bsAddressID}'
													id='${loop.index}bsaddr' />
											</c:forEach>
										</div>
										<div id="ItemDetails">
											<input type="hidden" name="ItemSize" id="itemSize"
												value='${ItemList.size()}'>
											<c:forEach items="${ItemList}" var="objList"
												varStatus="loop">
												<input type="hidden" value='${objList.invID}'
													id='${loop.index}inv' />
												
												<input type="hidden" value='${objList.invCode}'
													id='${loop.index}code' />
												<input type="hidden" value='${objList.invDesc}'
													id='${loop.index}desc' />
												<input type="hidden" value='${objList.categoryName}'
													id='${loop.index}categoryName' />
												<input type="hidden"
													value='${objList.inventoryName}'
													id='${loop.index}pname' />
												<input type="hidden" value='${objList.salePrice}'
													id='${loop.index}price' />
												
												<input type="hidden" value='${objList.isCategory}'
													id='${loop.index}cat' />
												<input type="hidden" value='${objList.itemTypeID}'
													id='${loop.index}itmId' />
												<input type="hidden" value='${objList.serialNo}'
													id='${loop.index}serial' />
												<input type="hidden"
													value='${objList.unitOfMeasure}'
													id='${loop.index}unitOfMeasure' />
											</c:forEach>
										</div>
										<table class="tabla-listados" cellspacing="0"
											style="margin-top: -1px;">
											<thead>
												<tr>
													<th colspan="3" style="font-size: 14px;">
														<spring:message
															code="BzComposer.salesorder.customerinfo" />
													</th>
												</tr>
											</thead>
											<c:if test="${not empty Status}">
												<tr>
													<td colspan="3"><span
															class="msgstyle">*${Status}</span>
													</td>
												</tr>
											</c:if>
											<c:if test="${not empty SaveStatus}">
												<tr>
													<td colspan="3"><span
															class="msgstyle">*${SaveStatus}</span>
														<% session.removeAttribute("SaveStatus"); %>
													</td>
												</tr>
											</c:if>
											<tr>
												<td style="width: 30%;">
													<table>
														<tr>
															<td colspan="2"
																style="font-size: 14px;">
																<spring:message
																	code="BzComposer.salesorder.customertitle" />
															</td>
															<td colspan="4" style="font-size: 14px;"
																align="left" width="50%">
																<!-- Sort By -->
																<spring:message
																	code="BzComposer.salesorder.sortby" />
															</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td colspan="2"
																style="font-size: 14px;">
																<div id="custDiv">
																	<div id="custDiv">
																		<form:select path="custID"
																			onchange="Assignment(this.value, this.form);"
																			style="width: 300px;">
																			<form:option value="0">
																				<spring:message
																					code="BzComposer.ComboBox.Select" />
																			</form:option>
																			<form:options
																				items="${CDetails}"
																				itemValue="value"
																				itemLabel="label" />
																		</form:select>
																	</div>
																</div>
															</td>
															<td style="font-size: 14px;"><input
																	type="checkbox"
																	id="sortByLastName"
																	name="sortByLastName"
																	value="sortByLastName" /></td>
															<td colspan="3" style="font-size: 14px;"
																width="50%">
																<spring:message
																	code="BzComposer.salesorder.lastname" />
															</td>
															<td>&nbsp;</td>
														</tr>
													</table>
												</td>
												<td align="center"
													style="font-size: 14px; width: 35%;">
													<input type="button" class="formbutton"
														onclick="getSalesOrderDetailsByBtnName(this.form, 'FirstPledge');"
														style="padding: 8px 10px 8px 10px; font-size: 16px;"
														value='<spring:message code="BzComposer.global.first" />' />
													<input type="button" class="formbutton"
														onclick="getSalesOrderDetailsByBtnName(this.form, 'LastPledge');"
														style="padding: 8px 10px 8px 10px; font-size: 16px;"
														value='<spring:message code="BzComposer.global.last" />' />
													<input type="button" class="formbutton"
														onclick="getSalesOrderDetailsByBtnName(this.form, 'PreviousPledge');"
														style="padding: 8px 10px 8px 10px; font-size: 16px;"
														value='<spring:message code="BzComposer.global.previous" />' />
													<input type="button" class="formbutton"
														onclick="getSalesOrderDetailsByBtnName(this.form, 'NextPledge');"
														style="padding: 8px 10px 8px 10px; font-size: 16px;"
														value='<spring:message code="BzComposer.global.next" />' />
													<input type="button" id="newSalesOrder"
														title="New Invoice" class="formbutton"
														onclick="NewPledge();"
														style="padding: 8px 10px 8px 10px; font-size: 16px;"
														value='<spring:message code="BzComposer.global.new" />' />
													<br>
													<c:if test="${not empty Enable}">
														<input type="button" class="formbutton"
															title="Send Mail to..."
															onclick="SendMail(this.form);"
															style="padding: 8px 30px 8px 30px; font-size: 16px;"
															value='<spring:message code="BzComposer.global.sendmail" />' />
													</c:if>
													<c:if test="${empty Enable}">
														<input type="button" class="formbutton"
															title="Send Mail to..."
															onclick="SendMailDisabled(this.form);"
															style="padding: 8px 30px 8px 30px; font-size: 16px;"
															value='<spring:message code="BzComposer.global.sendmail" />' />
													</c:if> <input type="button" class="formbutton"
														onclick="printCustomerOrder(this.form);"
														style="padding: 8px 30px 8px 30px; font-size: 16px;"
														value="<spring:message code='BzComposer.global.Print' />" />
												</td>
												<td align="right" style="width: 35%;">
													<table>
														<tr>
															<td style="font-size: 14px;">
																<spring:message
																	code="BzComposer.common.template" />
															</td>
															<td align="left"
																style="font-size: 14px;">
																<spring:message
																	code="BzComposer.salesorder.date" />
															</td>
															<td align="left"
																style="font-size: 14px;">
																<spring:message
																	code="BzComposer.nonprofit.pledge.pledgeNo" />
															</td>
														</tr>
														<tr>
															<td style="font-size: 14px;">
																<form:select path="templateType">
																	<form:option value="1">Pledge Standard</form:option>
																	<form:option value="2">Pledge Charcoal</form:option>
																</form:select>
															</td>

															<td style="font-size: 14px;">
																<form:input path="orderDate"
																	readonly="true" size="9" />
																<!-- &nbsp; -->
																<img src="${pageContext.request.contextPath}/images/cal.gif"
																	onclick="displayCalendar(document.InvoiceForm.orderDate,'mm-dd-yyyy',this);">
															</td>
															<td align="right"
																style="font-size: 14px;">
																<form:input path="pledgeNo"
																	style="text-align: right;"
																	id="pledgeNo" size="10"
																	readonly="true" />
															</td>
														</tr>
													</table>
												</td>
											</tr>

											<tr>
												<td align="left">
													<table>
														<tr>
															<td id="bill_id"
																style="font-size: 14px;">
																<spring:message
																	code="BzComposer.nonprofit.pledge.donor" />
																<br />
																<form:textarea path="billTo"
																	rows="6" cols="25"
																	oninput="EditBillingAddressPage(this.form);"
																	style="resize: none; width: 300px;" />
															</td>
															<td id="td2" align="center"></td>
														</tr>
													</table>
												</td>
												<td>&nbsp;</td>
												<td align="right">

												</td>
											</tr>
										</table>
									</div>
									<div id="product">
										<table class="tabla-listados" cellspacing="0">
											<thead>
												<tr>
													<th colspan="7" style="font-size: 14px;">
														<spring:message
															code="BzComposer.salesorder.iteminfo" />
													</th>
												</tr>
											</thead>
											<tr>
												<td id="td1" style="font-size: 14px;padding-left: 8px;">
													<spring:message code="BzComposer.nonprofit.pledge.item" />
												</td>
												<td colspan="3" style="font-size: 14px;">
													<spring:message code="BzComposer.nonprofit.pledge.description" />
												</td>
												<td style="font-size: 14px;">
													<spring:message code="BzComposer.nonprofit.pledge.classification" />
												</td>
												<td style="font-size: 14px;">
													<spring:message code="BzComposer.nonprofit.pledge.Amount" />
												</td>
												<td style="font-size: 14px;width: 133px;"></td>
											</tr>
											<tr>
												<!-- Select Item -->
												<td style="font-size: 14px;width: 18%;">
													<div id="itemDiv">
														<form:select path="itemID" style="width: 90%;"
															onchange="ItemChange(this.value);"
															id="itemID">
															<form:option value="0">
																<spring:message
																	code="BzComposer.ComboBox.Select" />
															</form:option>
															<c:forEach items="${ItemList}"
																var="itmList">
																<c:if
																	test="${itmList.isCategory == 0}">
																	<form:option
																		value='${itmList.invID}'>
																		&nbsp;&nbsp;&nbsp;&nbsp;
																		${itmList.invCode}
																	</form:option>
																</c:if>
																<c:if
																	test="${itmList.isCategory == 1}">
																		<form:option value='01'>
																			${itmList.invCode}
																		</form:option>
																</c:if>
															</c:forEach>
														</form:select>
													</div>
												</td>
												<!-- Description -->
												<td colspan="3" style="font-size: 14px;width: 241px;">
													<div style="display: block;">
														<textarea rows="2" style="width: 97%;" id="descriptionData"></textarea>
													</div>
												</td>
												<!-- Classification -->
												<td style="font-size: 14px;">
													<div style="padding-top: 0px;" id="td18">
														<form:select id="classificationId"
															path="unitOfMeasure" style="width: 90%;">
															<form:option value="0">
																<spring:message
																	code="BzComposer.ComboBox.Select" />
															</form:option>
															<c:forEach items="${classificationList}"
																var="data">
																<form:option
																	value="${data.classificationID}">
																	${data.name}
																</form:option>
															</c:forEach>
														</form:select>
													</div>
												</td>
												<!-- Amount -->
												<td style="font-size: 14px;">
													<div style="display: block;">
														<input type="text" style="text-align: right;width: 55%;" id="amount_id" size="10" />
													</div>
												</td>
												<!-- Add item button -->
												<td style="padding-right: 5px; font-size: 14px;">
													<div>
														<input type="button" class="formbutton"
															name="addItem"
															title="To add item click it"
															onclick="AddItem(this.form);"
															value='<spring:message code="BzComposer.salesorder.additem"/>'
															style="padding: 8px 10px 8px 10px; font-size: 16px;" />
													</div>
												</td>
											</tr>
										</table>
										<table class="tabla-listados" cellspacing="0" id="itemList">
											<thead>
												<tr>
													<th style="font-size: 14px;width: 238px">
														<div id="it3">
															<spring:message
																code="BzComposer.nonprofit.donation.item" />
														</div>
													</th>
													
													<th style="font-size: 14px;width: 545px;">
														<div id="it4">
															<spring:message
																code="BzComposer.nonprofit.pledge.description" />
														</div>
													</th>
													<th style="font-size: 14px;width: 218px;">
														<div id="it5">
															<spring:message
																code="BzComposer.nonprofit.pledge.classification" />
														</div>
													</th>
													<th style="font-size: 14px;width: 231px;">
														<div id="it5">
															<spring:message
																code="BzComposer.salesorder.amount" />
														</div>
													</th>
													
													<th style="font-size: 14px;">
														<spring:message
															code="BzComposer.salesorder.deleteoption" />
													</th>
												</tr>
											</thead>
											<c:if test="${not empty Cart}">
												<input type="hidden" name="hdncsize" id="CartSize"
													value='${Cart.size()}'>
												<c:forEach items="${Cart}" var="cart"
													varStatus="loop">
													<tr id='${loop.index}row'>
														<td style="font-size: 14px;">
															<div id='${loop.index}icode'
																style="font-size: 14px;">
																${cart.invCode}</div>
														</td>
														<td align="left" style="font-size: 14px;">
															<div id='${loop.index}desc'>
																${cart.invDesc}</div>
														</td>
														<td align="left" style="font-size: 14px;">
															<div id='${loop.index}iclassification'>
																${cart.classification}</div>
														</td>
														<td align="left" style="font-size: 14px;">
															<div id='${loop.index}iprice'>${cart.uprice}
															</div>
														</td>
														<td align="left" colspan="3"><img
																onclick="DeleteRow('${loop.index}row',this.form);"
																src="${pageContext.request.contextPath}/images/delete.png"
																title="Delete this Item" size="8"
																width="12" /></td>
													</tr>
													<input type="hidden" id='${loop.index}delt'
														value="0" />
													<input type="hidden" id='${loop.index}rowVal'
														value='${loop.index}row' />
													<input type="hidden" id='${loop.index}invCode'
														value='${cart.invCode}' />
													
													<input type="hidden" id='${loop.index}invDesc'
														value='${cart.invDesc}' />
													<input type="hidden" id='${loop.index}pname'
														value='${cart.inventoryName}' />
													<input type="hidden" id='${loop.index}uprice'
														value='${cart.uprice}' />
													<input type="hidden" id='${loop.index}serial'
														value='${cart.serialNo}' />
													<input type="hidden" id='${loop.index}itId11'
														value='${cart.itemTypeID}' />
													<input type="hidden" id='${loop.index}invID11'
														value='${cart.inventoryID}' />
												</c:forEach>
											</c:if>
											<c:if test="${empty Cart}">
												<input type="hidden" name="hdncsize" id="CartSize"
													value="0">
											</c:if>
											<tr id="tr##">
												<td align="center"></td>
												<td align="center"></td>
												<td align="center"></td>
												<td align="center"></td>
												<td align="center"></td>
											</tr>
										</table>
									</div>

							</div>
							<div>
								<input type="hidden" name="LstSize" id="tSize"
									value='${TaxRates.size()}'>
								<c:forEach items="${TaxRates}" var="objList" varStatus="loop">
									<input type="hidden" value='${objList.salesTaxID}'
										id='${loop.index}tx_id' />
									<input type="hidden" value='${objList.state}'
										id='${loop.index}tx' />
									<input type="hidden" value='${objList.rate}'
										id='${loop.index}tx_rt' />
								</c:forEach>
							</div>
							<table class="tabla-listados" cellspacing="0">
								<thead>
									<tr>
										<th colspan="12" style="font-size: 14px;">
											<spring:message code="BzComposer.salesorder.summary" />
										</th>
									</tr>
								</thead>
								<tr>
									<td>
										<table style="width: 100%;">
											<tr>
												<td style="padding-top: 5px;">
													<spring:message
														code="BzComposer.salesorder.message" />
												</td>
												<td>
													<form:select path="message"
														style="width: 100%;">
														<form:option value="0">
															<spring:message
																code="BzComposer.ComboBox.Select" />
														</form:option>
														<form:options items="${Message}"
															itemValue="value" itemLabel="label" />
													</form:select>
												</td>
											</tr>
											<tr>
												<td>
													<spring:message
														code="BzComposer.salesorder.memo" />
												</td>
												<td>
													<form:textarea path="memo" rows="3" cols="40"
														style="width: 100%;" />
												</td>
											</tr>
										</table>
									</td>

									<td style="font-size: 14px;" colspan="3">
										<table>

										</table>
									</td>
									<td style="font-size: 14px;" colspan="3">
										<table align="right">
											<tr>
												<td align="right" style="font-size: 14px;">
													<spring:message
														code="BzComposer.salesorder.totalindollers" />
												</td>
												<td style="font-size: 14px;">
													<form:input path="total" id="total"
														style="text-align: right;" readonly="true"
														onkeypress="return numbersOnlyFloat(event,this.value);" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<!-- <hr> -->
							<div>
								<input type="hidden" value="0" id="hidn" /> <input type="hidden"
									value="" id="code11" />
								<input type="hidden" value="0" id="hidn" /> 
								<input type="hidden" value="" id="itemCategory1" />
									<input type="hidden" value=""
									id="invStyle" /> <input type="hidden" value="0" id="amt_id" />
								<input type="hidden" value="0" id="tax_val" />
								<input type="hidden" value="0" id="itmId" /> <input type="hidden"
									value="0" id="itmVal" /> <input type="hidden" value=""
									id="cid" /> <input type="hidden" value="0" name="wt" id="wt" />
								<form:hidden path="companyID" value='${CID}' />
								<form:hidden path="bsAddressID" />
								<form:hidden path="shAddressID" />
							</div>
							<div>
								<form:hidden path="size" value="" />
								<form:hidden path="item" value="" />
								<form:hidden path="serialNo" value="" />
								<form:hidden path="itemCategory" value="" />
								<form:hidden path="desc" value="" />
								<input type="hidden" name="pname" id="pname" value="" />
								
								<form:hidden path="wgt" value="" />
								<form:hidden path="uprice" value="" />
								<form:hidden path="code" value="" />
								<form:hidden path="classification" value="" />
								<form:hidden path="isTaxable" value="" />
								<form:hidden path="itemTypeID" value="" />
								<form:hidden path="itemOrder" value="" />
							</div>
							<!-- end Contents -->
							</section>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-md-12" style="font-size: 16px;" align="center">
								<input type="button" id="btnSaveSalesOrder" class="formbutton"
									onclick="onSave(this.form);" title="Save Sales Order"
									style="padding: 8px 20px 8px 20px;"
									value='<spring:message code="BzComposer.global.saveUpdate" />' />

							</div>
						</div>
					</div>
					<div>
						<input type="hidden" id="tabid" name="tabid" value="" />
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>

</html>
<script>
    const classificationList = [
        <c:forEach var="data" items="${classificationList}" varStatus="loop">
            {
                id: '${data.classificationID}',
                name: '${data.name}'
            }<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    function getClassificationNameById(id) {
        for (let i = 0; i < classificationList.length; i++) {
            if (classificationList[i].id === id.toString()) {
                return classificationList[i].name;
            }
        }
        return 'Unknown';
    }

	document.addEventListener("DOMContentLoaded", function() {
        var size = parseInt(document.getElementById("CartSize").value);
		var i;
        for(i=0;i<size;i++){
            var classificationId = document.getElementById(i+"iclassification").innerText;
			const name = getClassificationNameById(classificationId);
			document.getElementById(i+"iclassification").innerText = name;
        }
    });
</script>

<script type="text/javascript">

	isItemExist = 0;
	var wghtArr = new Array(100);
	var itemArr = new Array(100);
	var upriceArr = new Array(100);
	var codeArr = new Array(100);
	var taxArr = new Array(100);
	var descArr = new Array(100);
	var categoryArr = new Array(100);
	var uwghtArr = new Array(100);
	var serialArr = new Array(100);
	var classArr = new Array(100);
	var itmIDArr = new Array(100);
	var itmOrdArr = new Array(100);
	var unitOfMeasureArr = new Array(100);

	deleted = 0;
	index1 = 0;
	cnt = 0;
	count = 0;
	yestax = 0;
	tax_rate = 0;

	$(function () {
		$("#sortByLastName").change(function () {

			var checked = $("#sortByLastName").prop('checked');

			if (checked == true) {

				$.ajax({
					type: "POST",
					url: "Invoice?tabid=SortCustomerOfSalesOrder&SortBy=LastName",
					data: { sortBy: "LastName" },
				}).done(function (data) {
					$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
				});
			}
			else {
				$.ajax({
					type: "POST",
					url: "Invoice?tabid=SortCustomerOfSalesOrder&SortBy=Name",
					data: { sortBy: "Name" },
				}).done(function (data) {
					$(document).find('div#custDiv').replaceWith($(data).find('div#custDiv').html());
				});
			}
		});
	});




	function toggle_visibility(id) {
		var e = document.getElementById(id);
		e.style.display = ((e.style.display != 'none') ? 'none' : 'block');
	}
	function ConfirmDelete() {

		$("#SaveItemName").dialog({
			resizable: false,
			height: 200,
			width: 500,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.yes'/>": function () {
					$(this).dialog("close");
					//$('form').submit();

					// var itemName = $.trim(document.getElementById('pname_id').value);            	
					//var item = document.getElementById('itemID');            	
					//var itemId = item.options[item.selectedIndex].value;

					//window.location.href = "Invoice?pageType=SO&tabid=saveItemName&itemName="+itemName+"&itemID="+itemId;
					//window.location.href = "Invoice?tabid=saveItemName&itemName="+itemName+"&itemID="+itemId;
					//window.location.href = "SalesOrder?tabid=saveItemNameForSalesOrder&itemName="+itemName+"&itemID="+itemId;
				},
				"<spring:message code='BzComposer.global.no'/>": function () {
					document.getElementById('pname_id').value = document.getElementById('oldpname_id').value;
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}
	function saveNewUnitPrice() {

		$("#SaveUnitPrice").dialog({
			resizable: false,
			height: 200,
			width: 500,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
					//$('form').submit();
					var price = document.getElementById('amount_id').value;
					var item = document.getElementById('itemID');
					var itemId = item.options[item.selectedIndex].value;
					// item unit price not updated permanently
					//			window.location.href = "Invoice?pageType=SO&tabid=saveUnitPrice&price="+price+"&itemID="+itemId;
					//			window.location.href = "SalesOrder?tabid=saveUnitPriceForSalesOrder&price="+price+"&itemID="+itemId;
				},
				"<spring:message code='BzComposer.global.cancel'/>": function () {
					document.getElementById('amount_id').value = document.getElementById('oldValue').value;
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}
	function showValidationDialog() {
		event.preventDefault();
		$("#showValidationDialog").dialog({
			resizable: false,
			height: 200,
			width: 300,
			modal: true,
			buttons: {
				"Ok": function () {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showSelectItemDialog() {
		event.preventDefault();
		$("#showSelectItemDialog").dialog({
			resizable: false,
			height: 200,
			width: 300,
			modal: true,
			buttons: {
				"Ok": function () {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}
	function showItemOrderNumberDialog() {
		event.preventDefault();
		$("#showItemOrderNumberDialog").dialog({
			resizable: false,
			height: 200,
			width: 300,
			modal: true,
			buttons: {
				"Ok": function () {
					$(this).dialog("close");
				}
			}
		});
		return false;
	}

	function sendInvoioceDialog() {
		event.preventDefault();
		$("#sendInvoiceDialog").dialog({
			resizable: false,
			height: 200,
			width: 400,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");
					salesorder_no = document.getElementById("salesorder_no").value;
					document.forms[0].action = "Invoice?tabid=IBLU&order_no=" + salesorder_no;
					document.forms[0].submit();
				},
				"<spring:message code='BzComposer.global.cancel'/>": function () {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function EditBillingAddressPage(form) {
		custID = form.custID.value;
		if(custID == 0){
			document.getElementById('billTo').value = "";
			showValidationDialog();
			return;
		}
		document.getElementById('isBillToAddressChange').value = "true";
		let addressID = form.bsAddressID.value;
		var billTo = document.getElementById('billTo').value;
		var lines = billTo.split('\n').map(line => line.trim()).filter(line => line !== '');
		var addressDB = '';
		var cityDB = '';
		if (lines.length > 0) {
			cityDB = lines[lines.length - 1];
			if (lines.length > 1) {
				addressDB = lines.slice(0, -1).join('\n');
			}
		}
		document.getElementById('billToAddress').value = addressDB;
		document.getElementById('billToCity').value = cityDB;
		console.log('Address (for DB):', addressDB);
		console.log('City (for DB):', cityDB);
	}



	function Assignment(value, form) {
		if (value == 0) {
			document.InvoiceForm.billTo.value = "";
			document.InvoiceForm.taxable.checked = false;
		}
		else {
			sz = document.getElementById('custSize').value;
			if (value == 0) {
				
			}else{
				size = document.getElementById("bSize").value;
				var i;
				for(i=0;i<size;i++){
					var field1 = document.getElementById(i+"clvid").value;
					if(value==field1){

						document.getElementById('cid').value = value;
						form.custID.value = document.getElementById('cid').value;
						form.companyID.value = document.getElementById(i+"cid").value;
						form.bsAddressID.value = document.getElementById(i+"bsaddr").value;
						form.billTo.value = document.getElementById(i+"bl").value;
						break;
					}
				}
			}
			for (i = 0; i < sz; i++) {
				var field11 = document.getElementById("a" + i + "clvndid").value;
				if (value == field11) {
					break;
				}
			}
		}
	}

	function service() {
		/* hidden field for ship to */
		document.getElementById('ship_label').style.visibility = "hidden";
		document.getElementById('ship_id').style.visibility = "hidden";


		/* hidden field for P.O. Num */
		/* commented on 25-09-2019 */
		/* document.getElementById('po_num_label').style.visibility="hidden";
		document.getElementById('po_num_id').style.visibility="hidden"; */

		/* hidden field for ship date */
		document.getElementById('sh_date_label').style.visibility = "hidden";

		/* hidden field for  rep */
		document.getElementById('rep_label').style.visibility = "hidden";

		/* hidden field for via */
		document.getElementById('via_label').style.visibility = "hidden";
		document.getElementById('via_id').style.visibility = "hidden";

		/* Visible field for bill to */
		document.getElementById('bill_label').style.visibility = "visible";
		document.getElementById('bill_id').style.visibility = "visible";

		/* Visible field for Term & Payment */
		document.getElementById('td2').style.visibility = "visible";
	}

	function AddItem(form) {
		classificationId = document.getElementById('classificationId').value;
		if(classificationId == 0){
			alert("Please select classificationId first");
			return;
		}
		if (form.itemID.value == 0 || form.itemID.value === '01') {
			document.getElementById('amount_id').value = "";
			return showSelectItemDialog();
		} else {
			debugger;
			isItemExist++;
			style = document.getElementById('invStyle').value;
			hidn_val = document.getElementById('hidn').value;

			var tr = document.createElement("tr");
			tr.setAttribute("id", "tr" + hidn_val);

			var tr2 = document.getElementById('tr##');
			var parentTr = tr2.parentNode;
			parentTr.insertBefore(tr, tr2);

			// item category
			// itemCategory = document.getElementById('itemCategory1').value;		
			// var td1 = document.createElement("td");
			// td1.setAttribute("align", "left");
			// td1.setAttribute("id", hidn_val + "1");
			// tr.appendChild(td1);
			// td1.innerHTML = itemCategory;

			// Item name
			ivcode = document.getElementById('code11').value;
			var td4 = document.createElement("td");
			td4.setAttribute("align", "left");
			td4.setAttribute("id", hidn_val + "4");
			tr.appendChild(td4);
			td4.innerHTML = ivcode;

			description = document.getElementById('descriptionData').value;
			var td5 = document.createElement("td");
			td5.setAttribute("align", "left");
			td5.setAttribute("id", hidn_val + "5");
			tr.appendChild(td5);
			td5.innerHTML = description;

			const classificationName = getClassificationNameById(classificationId);
			var td2 = document.createElement("td");
			td2.setAttribute("align", "left");
			td2.setAttribute("id", hidn_val + "2");
			tr.appendChild(td2);
			td2.innerHTML = classificationName;
			
			uprice = document.getElementById('amount_id').value;
			amt = (uprice / 1);
			document.getElementById('amount_id').value = amt.toFixed(2);
			
			var td6 = document.createElement("td");
			td6.setAttribute("align", "left");
			td6.setAttribute("id", hidn_val + "6");
			tr.appendChild(td6);
			td6.innerHTML = amt.toFixed(2);

			subtotal = document.getElementById("subtotal").value;
			subtotal = ((subtotal / 1)+(amt / 1)).toFixed(2);
			total = ((subtotal / 1)).toFixed(2);
			form.total.value = total;
			document.getElementById("subtotal").value = subtotal;
			document.getElementById('amt_id').value = subtotal;

			var td9 = document.createElement("td");
			td9.setAttribute("align", "left");
			td9.setAttribute("colspan", "4");
			tr.appendChild(td9);
			td9.innerHTML = '<img onclick="DeleteRow1(' + hidn_val + ',this.form);" width="12"  src="${pageContext.request.contextPath}/images/delete.png" title="Delete" size="8"/>';

			itemVal = document.getElementById('itmVal').value;
			itemArr[index1] = itemVal;
			upriceArr[index1] = uprice;
			codeArr[index1] = ivcode;
			categoryArr[index1] = itemCategory;
			descArr[index1] = description;
			classArr[index1] = classificationId;
			itmIDArr[index1] = document.getElementById('itmId').value;

			index1++;

			if (style == 0 || style == 4) {
				productItem(hidn_val);
			}
			if (style == 1) {
				serviceItem(hidn_val);
			}
			if (style == 2 || style == 6) {
				quickItem(hidn_val);
			}
			if (style == 3) {
				manufactureItem(hidn_val);
			}
			if (style == 5) {
				financeItem(hidn_val);
			}
			if (style == 7) {
				ebusinessItem(hidn_val);
			}

			hidn_val = ((hidn_val / 1) + 1);
			document.getElementById('hidn').value = hidn_val;
		}

		document.getElementById('amount_id').value = "";
		document.getElementById('classificationId').value = "0";
		document.getElementById('descriptionData').value = "";
		document.getElementById('itemID').value = "0";
	}

	function productItem(hidn_val) {
		
		document.getElementById(hidn_val + "2").style.visibility = 'visible';
		document.getElementById(hidn_val + "4").style.visibility = 'visible';
		document.getElementById(hidn_val + "5").style.visibility = 'visible';
		document.getElementById(hidn_val + "6").style.visibility = 'visible';

		document.getElementById("it3").style.visibility = 'visible';
		document.getElementById("it4").style.display = 'block';
		document.getElementById("it5").style.visibility = 'visible';
	}

	function serviceItem(hidn_val) {
		document.getElementById(hidn_val + "3").style.visibility = 'hidden';
		
		document.getElementById(hidn_val + "2").style.visibility = 'visible';
		document.getElementById(hidn_val + "4").style.visibility = 'visible';
		document.getElementById(hidn_val + "5").style.visibility = 'visible';
		document.getElementById(hidn_val + "6").style.visibility = 'hidden';
		document.getElementById(hidn_val + "7").style.visibility = 'hidden';
		document.getElementById(hidn_val + "8").style.visibility = 'visible';

		document.getElementById("it2").style.display = 'block';
		document.getElementById("it3").style.visibility = 'visible';
		document.getElementById("it4").style.display = 'block';
		document.getElementById("it5").style.visibility = 'hidden';
		document.getElementById("it8").style.visibility = 'hidden';
		document.getElementById("it22").style.display = 'none';
		//document.getElementById("it42").style.display='block';
	}

	function quickItem(hidn_val) {
		document.getElementById(hidn_val + "3").style.visibility = 'hidden';
		
		document.getElementById(hidn_val + "2").style.visibility = 'visible';
		document.getElementById(hidn_val + "4").style.visibility = 'visible';
		document.getElementById(hidn_val + "5").style.visibility = 'visible';
		document.getElementById(hidn_val + "6").style.visibility = 'visible';
		document.getElementById(hidn_val + "7").style.visibility = 'hidden';
		document.getElementById(hidn_val + "8").style.visibility = 'visible';

		document.getElementById("it2").style.display = 'block';
		document.getElementById("it3").style.visibility = 'visible';
		document.getElementById("it4").style.display = 'block';
		document.getElementById("it5").style.visibility = 'visible';
		document.getElementById("it8").style.visibility = 'hidden';
		document.getElementById("it22").style.display = 'none';
		//document.getElementById("it42").style.display='none';
	}

	function manufactureItem(hidn_val) {
		document.getElementById(hidn_val + "3").style.visibility = 'visible';
		
		document.getElementById(hidn_val + "2").style.visibility = 'visible';
		document.getElementById(hidn_val + "4").style.visibility = 'visible';
		document.getElementById(hidn_val + "5").style.visibility = 'visible';
		document.getElementById(hidn_val + "6").style.visibility = 'visible';
		document.getElementById(hidn_val + "7").style.visibility = 'hidden';
		document.getElementById(hidn_val + "8").style.visibility = 'visible';

		document.getElementById("it2").style.display = 'block';
		document.getElementById("it3").style.visibility = 'visible';
		document.getElementById("it4").style.display = 'block';
		document.getElementById("it5").style.visibility = 'visible';
		document.getElementById("it8").style.visibility = 'visible';

		document.getElementById("it22").style.display = 'none';
		//document.getElementById("it42").style.display='none';
	}

	function financeItem(hidn_val) {
		document.getElementById(hidn_val + "3").style.visibility = 'hidden';
		
		document.getElementById(hidn_val + "2").style.visibility = 'hidden';
		document.getElementById(hidn_val + "4").style.visibility = 'visible';
		document.getElementById(hidn_val + "5").style.visibility = 'hidden';
		document.getElementById(hidn_val + "6").style.visibility = 'visible';
		document.getElementById(hidn_val + "7").style.visibility = 'hidden';
		document.getElementById(hidn_val + "8").style.visibility = 'visible';

		document.getElementById("it2").style.display = 'none';
		document.getElementById("it3").style.visibility = 'visible';
		document.getElementById("it4").style.display = 'none';
		document.getElementById("it5").style.visibility = 'visible';
		document.getElementById("it8").style.visibility = 'hidden';

		document.getElementById("it22").style.display = 'none';
		//document.getElementById("it42").style.display='none';
	}

	function ebusinessItem(hidn_val) {
		document.getElementById(hidn_val + "3").style.visibility = 'hidden';
		
		document.getElementById(hidn_val + "2").style.visibility = 'visible';
		document.getElementById(hidn_val + "4").style.visibility = 'visible';
		document.getElementById(hidn_val + "5").style.visibility = 'hidden';
		document.getElementById(hidn_val + "6").style.visibility = 'visible';
		document.getElementById(hidn_val + "7").style.visibility = 'hidden';
		document.getElementById(hidn_val + "8").style.visibility = 'hidden';

		document.getElementById("it2").style.display = 'block';
		document.getElementById("it3").style.visibility = 'visible';
		document.getElementById("it4").style.display = 'none';
		document.getElementById("it5").style.visibility = 'visible';
		document.getElementById("it8").style.visibility = 'hidden';

		document.getElementById("it22").style.display = 'none';
		//document.getElementById("it42").style.display='none';

	}


	function ItemChange(value) {
		if (value == '01') {
			document.getElementById('unitPrice_id').value = "";
			document.getElementById('amount_id').value = "";
			document.getElementById('unitPrice_id').readonly = "true";
			document.getElementById('code11').value = document.getElementById(count + 'code').value;


		}
		var size = document.getElementById('itemSize').value;
		var count;
		for (count = 0; count < size; count++) {
			var invID = document.getElementById(count + 'inv').value;
			if (value == invID) {
				var category = document.getElementById(count + 'cat').value;
				if (category == 1) {
					document.getElementById('amount_id').value = "";
					document.getElementById('code11').value = document.getElementById(count + 'code').value;
				}
				else {


					//	You can not enter more then your available stock using this function
					var uprice = document.getElementById(count + 'price').value;
					var udesc = document.getElementById(count + 'desc').value;

					document.getElementById('oldpname_id').value = document.getElementById(count + 'pname').value;
					amt = ((uprice / 1)).toFixed(2);;
					document.getElementById('amount_id').value = amt;
					document.getElementById('descriptionData').value = udesc;
					document.getElementById('itemCategory1').value = document.getElementById(count + 'categoryName').value;;
					
					document.getElementById('code11').value = document.getElementById(count + 'code').value;
					document.getElementById('itmId').value = document.getElementById(count + 'itmId').value;
					document.getElementById('itmVal').value = value;
				}
			}
		}
	}

	function Multiplication() {
		var uprice = document.getElementById('amount_id').value;

		var amount = uprice;
		document.getElementById('amount_id').value = amount.toFixed(2);

	}


	function Init() {
debugger;
		var sortId = '<%= request.getAttribute("sortById")%>';
		$('select[id="itemID"]').find('option[value="0"]').attr("selected", true);
		isItemExist = document.getElementById('CartSize').value;
		var initPending = '${InvoiceForm.isPending}';
		if (initPending == 'true') {
			toggle_visibility('pending');
		}
		var i;
		for (i = 0; i < 100; i++) {
			deleted[i] = 0;
		}
		for (j = 0; j < 100; j++) {
			wghtArr[j] = 0;
			itemArr[j] = 0;
			upriceArr[j] = 0;
			codeArr[j] = 0;
			taxArr[j] = 0;
			descArr[j] = 0;
			uwghtArr[j] = 0;
			serialArr[j] = 0;
			itmIDArr[j] = 0;

		}
		var readOnly = <%= request.getAttribute("readData") %>

if (readOnly) {

			$('#newSalesOrder').prop('disabled', true);
			$('#btnNewSalesOrder').prop('disabled', true);
			$('#btnSaveSalesOrder').prop('disabled', true);
			$('#btnUpdateCustomer').prop('disabled', true);
			$(':input[type="text"]').prop('disabled', false);
			$('input[type=text],textarea').prop('readonly', true);
			$('#custID').prop('readonly', true);
		}
		else {

			$('#newSalesOrder').prop('disabled', false);
			$('#btnNewSalesOrder').prop('disabled', false);
			$('#btnSaveSalesOrder').prop('disabled', false);
			$('#btnUpdateCustomer').prop('disabled', false);
			$('input[type=text],textarea').prop('readonly', false);
			$('#custID').prop('readonly', true);
		}
	}



	function onSave(form) {
		No = form.pledgeNo.value;
		cid = form.custID.value;
		if (cid == 0) {
			return showValidationDialog();
		} else if (isItemExist <= 0) {
			return showSelectItemDialog();
		} else {
			if (No.length == 0 || No == 0) {
				return showItemOrderNumberDialog();
			} else {
				event.preventDefault();
				$("#savePledge").dialog({
					resizable: false,
					height: 200,
					width: 500,
					modal: true,
					buttons: {
						"<spring:message code='BzComposer.global.ok'/>": function () {
							$(this).dialog("close");
							subtotal = form.subtotal.value;
							total = ((subtotal / 1)).toFixed(2);
							form.total.value = total;

							val1 = document.getElementById('hidn').value;
							val = ((val1) / 1 - (deleted) / 1);
							form.size.value = val / 1;
debugger;
							var x;
							var idV = 0;
							for (x = 0; x < val1; x++) {
								value = itemArr[x];
								if (value != -1) {
									form.item.value += itemArr[x] + ";";
									form.uprice.value += upriceArr[x] + ";";
									// item name
									form.code.value += codeArr[x] + ";";
									form.classification.value += classArr[x] + ";";
									form.itemTypeID.value += itmIDArr[x] + ";";
									form.itemCategory.value += categoryArr[x] + ";";
									form.desc.value += descArr[x] + ";";
									form.itemOrder.value += idV + ";";
									idV++;
								}
							}
debugger;
							csize = document.getElementById('CartSize').value;
							if (csize != 0) {
								val = ((csize / 1) + (val) / 1);
								var i;
								ordVal = (((document.getElementById('hidn').value) / 1) + 1);
								for (i = 0; i < csize; i++) {
									rowid = document.getElementById(i + 'delt').value
									if (rowid == "del") {
										cnt++;
									} else if (rowid == "0") {
										form.code.value += document.getElementById(i + "invCode").value + ";";
										form.desc.value += document.getElementById(i + "invDesc").value + ";";
										form.uprice.value += document.getElementById(i + "uprice").value + ";";
										form.serialNo.value += document.getElementById(i + "serial").value + ";";
										itid = document.getElementById(i + 'itId11').value;
										form.itemTypeID.value += itid + ";";
										form.itemOrder.value += idV + ";";
										// Removed: isTaxable check
										idV++;
										itemVal = document.getElementById(i + 'invID11').value;
										form.item.value += itemVal + ";";
									}
								}
								val = ((((val) / 1 - (cnt) / 1)));
								form.size.value = val;
							}

							document.getElementById('tabid').value = "SavePledge";
							document.forms['pledgeForm'].action = "NonProfit?tabid=SavePledge";
							document.forms['pledgeForm'].submit();
						},
						"<spring:message code='BzComposer.global.cancel'/>": function () {
							$(this).dialog("close");
							return false;
						}
					}
				});
				return false;
			}
		}
	}

	function NewPledge() {
		window.location.href = "NonProfit?tabid=Pledge";
	}
	function SendMail(form) {
		cid = form.pledgeNo.value;
		window.open("Invoice?tabid=ShowEmail&OrderType=Pledge&OrderNo=" + cid, null, "scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no");
	}
	function SendMailDisabled(form) {
		return showItemOrderNumberDialog();
	}

	function DeleteRow(d, form) {
		event.preventDefault();
		$("#deleteRowDialog").dialog({
			resizable: false,
			height: 200,
			width: 300,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {

					$(this).dialog("close");
					size = document.getElementById('CartSize').value;
					isItemExist--;
					for (jj = 0; jj < size; jj++) {

						rowId = document.getElementById(jj + 'rowVal').value;
						if (d == rowId) {
							var rt = 0;
							document.getElementById(d).style.display = 'none';

							document.getElementById(jj + 'delt').value = "del";

							uprice1 = document.getElementById(jj + 'uprice').value;

							amt = ((uprice1) / 1);
							sze = document.getElementById("tSize").value;
							
							total = ( (amt / 1));
							document.InvoiceForm.total.value = total.toFixed(2);

							break;
						}
					}
				},
				"<spring:message code='BzComposer.global.cancel'/>": function () {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function DeleteRow1(d, form) {
		event.preventDefault();
		$("#deleteRowDialog").dialog({
			resizable: false,
			height: 200,
			width: 350,
			modal: true,
			buttons: {
				"<spring:message code='BzComposer.global.ok'/>": function () {
					$(this).dialog("close");

					document.getElementById('tr' + d).style.display = 'none';
					isItemExist--;
					for (jj = 0; jj <= index1; jj++) {
						if (d == jj) {
							itemArr[jj] = -1;

							uprice1 = upriceArr[jj];
							t = taxArr[jj];
							upriceArr[jj] = -1;
							codeArr[jj] = -1;
							unitOfMeasureArr[jj] = -1;
							taxArr[jj] = -1;
							descArr[jj] = -1;
							wegt = uwghtArr[jj];
							uwghtArr[jj] = -1;
							serialArr[jj] = -1;
							itmIDArr[jj] = -1;

							total = (amt / 1);
							document.getElementById("total").value = total.toFixed(2);;
							deleted++;
						}
					}
				},
				"<spring:message code='BzComposer.global.cancel'/>": function () {
					$(this).dialog("close");
					return false;
				}
			}
		});
		return false;
	}

	function printCustomerOrder(form) {
		let cid = form.custID.value;
		let pledgeNo = form.pledgeNo.value;

		if (cid == 0 || cid === "") {
			return showValidationDialog(); // Make sure this function is defined elsewhere
		} else {
			let url = "NonProfit?tabid=PrintPledge&custID=" + encodeURIComponent(cid) + "&pledgeNo=" + encodeURIComponent(pledgeNo);
			window.open(
				url,
				"_blank", // Opens in a new tab or window depending on browser settings
				"scrollbars=yes,height=900,width=900,status=yes,toolbar=no,menubar=no,location=no"
			);
		}
	}


	function getSalesOrderDetailsByBtnName(form, url) {
		No = form.pledgeNo.value;
		$.ajax({
			type: "GET",
			url: "/NonProfitAjax?tabid=" + url + "&index=" + No,
			success: function (data) {
				window.location = "NonProfit?tabid=DBLU&donationNo="+data;
			},
			error: function (data) {
				alert("<bean:message key='BzComposer.categorydetail.erroroccurred'/>");
			}
		});
	}

</script>
<!-- Dialog box used in sales order page -->
<div id="showValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.salesorder.namevalidation" />
	</p>
</div>
<div id="showSelectItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.salesorder.itemvalidation" />
	</p>
</div>
<div id="showItemOrderNumberDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.salesorder.ordernumbernotblankorzero" />
	</p>
</div>
<div id="deleteRowDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.salesorder.deleteitem" />
	</p>
</div>
<div id="savePledge" style="display: none;">
	<p>
		<spring:message code="BzComposer.nonprofit.saveorupdatePledge" />
	</p>
</div>
<div id="sendInvoiceDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.salesorder.createinvoice" />
	</p>
</div>
