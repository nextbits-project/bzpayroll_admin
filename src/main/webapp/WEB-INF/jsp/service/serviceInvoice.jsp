<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.invoicetitle" /></title>
<style type="text/css">
/** Semibold */
@font-face {
	font-family: "SF Mono";
	font-weight: 600;
	src: url("https://sf.abarba.me/SFMono-Semibold.otf");
}

/** Semibold Italic */
@font-face {
	font-family: "SF Mono";
	font-weight: 600;
	font-style: italic;
	src: url("https://sf.abarba.me/SFMono-SemiboldItalic.otf");
}

body {
	/* font-family: "SF Mono"; */
	min-width: 1366px;
}

page-title {
	/* font-size: 18px;margin: 30px 0px 15px 0px;padding: 0 0 10px 0; */
	
}

.msgstyle {
	font-size: 18px;
	color: #3D9EAC;
}

.showCustomer {
	font: bold italic 100px;
}

table.cart tbody tr td {
	font-size: 14px;
}
</style>
<script type="text/javascript">

function isRealValue(obj)
{
 return obj && obj !== 'null' && obj !== 'undefined';
}

$(function()
	{
	
	 $('#custTable').DataTable({
	        "iDisplayLength": 20,
	        "ordering": true,
	        "order": [[0, 'desc']],
	        "fnDrawCallback": function( oSettings ) {
	            setRowId(0, 0, false);
	            hightlightROW();
	        }
	    });
	   
	
});




function calShippingCharges(form)
{
	
}


function saveOldValue()
{

  document.getElementById('oldValue').value = document.getElementById('unitPrice_id').value;

}
function saveNewUnitPrice()
{
	
	event.preventDefault();
	
	$("#SaveUnitPrice").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function ()
            {
                $(this).dialog("close");
                var price = document.getElementById('unitPrice_id').value;
				var item = document.getElementById('itemID');
				var itemId = item.options[item.selectedIndex].value;
				                                                        //item unit price update Permently Not required 
				//window.location.href = "Invoice?tabid=saveUnitPrice&price="+price+"&itemID="+itemId;
            },
            <spring:message code='BzComposer.global.cancel'/>: function ()
            {
            	 document.getElementById('unitPrice_id').value=document.getElementById('oldValue').value ;
            	 document.getElementById('oldValue').value="0";
                $(this).dialog("close");
                
            
                return false;
            }
        }
    });
    return false;
}


function updateQuantityOfSelectedItem()
{ 
	event.preventDefault();
	$("#saveQuantity").dialog({
    	resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                var quantity = document.getElementById('qty_id').value;
				var item = document.getElementById('itemID');
				var itemId = item.options[item.selectedIndex].value;
				//window.location.href = "Invoice?tabid=saveQuantity&quantity="+price+"&itemID="+itemId;
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function showItemOrderNumberDialog(){
	event.preventDefault();
	$("#showItemOrderNumberDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showValidationDialog(){
	event.preventDefault();
	$("#showValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function showSelectItemDialog(){
	event.preventDefault();
	$("#showSelectItemDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function deleteInvoiceDialog(){
	event.preventDefault();
	$("#deleteInvoiceDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                window.location="Invoice?tabid=DeleteInvoice&&CustomerID="+cid;
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function ShowBillingAddressPage(form){
    custID = form.custID.value;
    let addressID = form.bsAddressID.value;
    window.open("Invoice?tabid=getBillingAddress&addressType=bill&cvID="+custID+"&addressID="+addressID, null,"scrollbars=yes,height=600,width=700,status=yes,toolbar=no,menubar=no,location=no");
}

function ShowShippingAddressPage(form){
    custID = form.custID.value;
    let addressID = form.shAddressID.value;
    window.open("Invoice?tabid=getBillingAddress&addressType=ship&cvID="+custID+"&addressID="+addressID, null,"scrollbars=yes,height=600,width=700,status=yes,toolbar=no,menubar=no,location=no");
}
</script>
</head>
<body onload="Init();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<form:form name="InvoiceForm" id="frmInvoice" method="post"
							modelAttribute="invoiceDto">

							<input type="hidden" name="isInvoice" value="1">
							<input type="hidden" id="oldpname_id" value="">
							<input type="hidden" id="oldvalue" value="0">
							<input type="hidden" id="holdUnitWeight" value="0">
							<input type="hidden" name="isSalestype" value="1">
							<form:errors />
							<div style="float: left; width: 100%;">
								<span class="page-title" style="font-size: 1.2em;"> <spring:message
										code="BzComposer.invoice.invoicetitle" />
								</span>
							</div>
							<!-- <div> <h3 class="page-title" style="color: #05A9C5;">Invoice</h3> </div> -->
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
												<input type="hidden" name='${loop.index}v'
													value='${objList.via}' id='${loop.index}va' />
												<input type="hidden" name='${loop.index}pa'
													value='${objList.payMethod}' id='${loop.index}paym' />
												<input type="hidden" name='${loop.index}tm'
													value='${objList.term}' id='${loop.index}trm' />
												<input type="hidden" name='${loop.index}rp'
													value='${objList.rep}' id='${loop.index}rp' />
												<input type="hidden" name='${loop.index}tx'
													value='${objList.taxable}' id='a${loop.index}txable' />
												<input type="hidden" name='${loop.index}fn'
													value='${objList.firstName}' id='${loop.index}firstName' />
												<input type="hidden" name='${loop.index}ln'
													value='${objList.lastName}' id='${loop.index}lastName' />
												<input type="hidden" id='${loop.index}custBalance'
													value='${objList.customerHasBalance}' />
											</c:forEach>
										</div>
										
										
										<div id="customerJobListInfo">
											<input type="hidden" name="EstimationDetails" id="estimationlSize"
												value='${customerJobList.size()}'>
											<c:forEach items="${customerJobList}" var="objList"
												varStatus="loop">
												<input type="hidden" name='${loop.index}clientVendorID'
													value='${objList.clientVendorID}'
													id='${loop.index}clientVendorID' />
												<input type="hidden" name='${loop.index}estimationID'
													value='${objList.estimationID}' id='${loop.index}estimationID' />
												
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

										
										</div>

										<table class="tabla-listados" cellspacing="0"
											style="margin-top: -1px;">
											<thead>
												<tr>
													<th colspan="3" style="font-size: 14px;"><spring:message
															code="BzComposer.invoice.customerinfo" /></th>
												</tr>
											</thead>

											<c:if test="${not empty Status}">
												<tr>
													<td colspan="3" align="left"><span class="msgstyle">*${Status}</span>
													</td>
												</tr>
											</c:if>
											<c:if test="${not empty SaveStatus}">
												<tr>
													<td colspan="3"><span class="msgstyle">*${SaveStatus}</span>
														<% session.removeAttribute("SaveStatus"); %></td>
												</tr>
											</c:if>
											<tr>
												<td style="width: 30%;">
													<table>
														<tr>
															<td colspan="2" style="font-size: 14px;"><spring:message
																	code="BzComposer.service.CustomerJob" /></td>
															<td colspan="4" style="font-size: 14px;" align="left">
																<!-- Sort By --> <spring:message
																	code="BzComposer.invoice.sortby" />
															</td>
															<td>&nbsp;</td>
															<td style="font-size: 14px;"><spring:message
																	code="BzComposer.invoice.taxable" /></td>
															<td style="font-size: 14px;"><spring:message
																	code="BzComposer.invoice.pending" /></td>
														</tr>
														<tr>
															<td colspan="2" style="font-size: 14px;">
																<div id="custDiv">
																	<div id="custDiv">
																		<form:select  path="serviceID"
																			onchange="Assignment(this.value);"
																			style="width: 300px;">
																			
																			<form:option value="0">
																				<spring:message code="BzComposer.ComboBox.Select" />
																			</form:option>
																			
																			<c:forEach items="${customerJobList}" var="objlist">

																		<form:option value='${objlist.estimationID}'>${objlist.estimationID}: ${objlist.clientVendorName}
																		
																		</form:option>

																	     </c:forEach>
																	     
																	     </form:select>
																			
																	</div>
																</div>
															</td>
															<td style="font-size: 14px;"><input type="checkbox"
																id="sortByLastName" name="sortByLastName"
																value="sortByLastName" /></td>
															<td colspan="3" style="font-size: 14px;"><spring:message
																	code="BzComposer.invoice.sortbylastname" /></td>
															<td>&nbsp;</td>
															<!-- <td align="center" style="font-size: 14px;">
											<input type="checkbox" id="sortByCompanyName" name="sortByCompanyName" value="sortByCompanyName"/>
										</td>
										<td colspan="3" style="font-size:14px;">
											Company Name
										</td> -->
															<td align="center" style="font-size: 14px;"><input
																type="checkbox" id="taxable" name="taxable"
																onclick="TaxaValue(this.form);"
																value="${invoiceDto.taxable}"
																${invoiceDto.taxable?'checked':''} /></td>
															<td align="center" style="font-size: 14px;"><input
																type="checkbox" id="isPending" name="isPending"
																onclick="Pending_Value(this.form);"
																value="${invoiceDto.isPending}"
																${invoiceDto.isPending?'checked':''} /></td>
														</tr>
													</table>
												</td>
												<td align="center" style="font-size: 14px; width: 35%;">
													<input type="button" class="formbutton"
													onclick="getInvoiceDetailsByBtnName(this.form, 'FirstInvoice');"
													style="padding: 8px 10px 8px 10px; font-size: 16px;"
													value="<spring:message code='BzComposer.invoice.first' />" />
													<input type="button" class="formbutton"
													onclick="getInvoiceDetailsByBtnName(this.form, 'LastInvoice');"
													style="padding: 8px 10px 8px 10px; font-size: 16px;"
													value="<spring:message code='BzComposer.invoice.last' />" />
													<input type="button" class="formbutton"
													onclick="getInvoiceDetailsByBtnName(this.form, 'PreviousInvoice');"
													style="padding: 8px 10px 8px 10px; font-size: 16px;"
													value="<spring:message code='BzComposer.Invoice.Previous' />" />
													<input type="button" class="formbutton"
													onclick="getInvoiceDetailsByBtnName(this.form, 'NextInvoice');"
													style="padding: 8px 10px 8px 10px; font-size: 16px;"
													value="<spring:message code='BzComposer.Invoice.Next' />" />
													<input type="button" id="newInvoice" class="formbutton"
													onclick="NewInvoice();"
													style="padding: 8px 10px 8px 10px; font-size: 16px;"
													value="<spring:message code='BzComposer.global.new' />" />
													<br> <input type="button" class="formbutton"
													id="CustomerBalanceBtn"
													onclick="paymentHistory(this.form);"
													style="padding: 8px 20px 8px 20px; font-size: 16px;"
													value="<spring:message code='BzComposer.Invoice.balance' />" />
													<c:if test="${not empty Enable}">
														<input type="button" id="sendMailEnabled"
															class="formbutton" title="Send Mail to..."
															onclick="SendMail(this.form);"
															style="padding: 8px 20px 8px 20px; font-size: 16px;"
															value="<spring:message code='BzComposer.Invoice.SendMail' />" />
													</c:if> <c:if test="${empty Enable}">
														<input type="button" id="sendMailDisabled"
															class="formbutton" title="Send Mail to..."
															onclick="SendMailDisabled(this.form);"
															style="padding: 8px 20px 8px 20px; font-size: 16px;"
															value="<spring:message code='BzComposer.Invoice.SendMail' />" />
													</c:if> <input type="button" class="formbutton"
													onclick="printCustomerOrder(this.form);"
													style="padding: 8px 20px 8px 20px; font-size: 16px;"
													value="<spring:message code='BzComposer.global.print' />" />
												</td>
												<td align="right" style="font-size: 14px; width: 35%;">
													<table>
														<tr>
															<td style="font-size: 14px;"><spring:message
																	code="BzComposer.common.template" /></td>
															<td style="font-size: 14px;"><spring:message
																	code="BzComposer.Orders.OrderStyle" /> <input
																type="hidden" name="Ivhidden" id="InvStyle" /></td>
															<td align="left" style="font-size: 14px;" colspan="3">
																<spring:message code="BzComposer.Invoice.Date" />
															</td>
															<td align="left" style="font-size: 14px;"><spring:message
																	code="BzComposer.Invoice.InvoiceNo" /></td>
														</tr>
														<tr>
															<td style="font-size: 14px;"><form:select
																	path="templateType">
																	<!-- <form:option value="1">Sales Order Standard</form:option> -->
																	<!-- <form:option value="2">Sales Order Charcoal</form:option> -->
																	<form:option value="7">Time & Expense Standard</form:option>
																	<form:option value="8">Time & Expense Charcoal</form:option>
																	
																</form:select></td>
															<td style="font-size: 14px;">
															<form:select
																	id="inoiceStyle" path="invoiceStyle"
																	onchange="StyleChange(this.value);">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<form:options items="${InvoiceStyle}" itemValue="value"
																		itemLabel="label" />
																</form:select></td>
															<td style="font-size: 14px;" colspan="3"><form:input
																	path="orderDate" readonly="true" size="10" /> <!-- &nbsp; -->
																<img
																src="${pageContext.request.contextPath}/images/cal.gif"
																onclick="displayCalendar(document.InvoiceForm.orderDate,'mm-dd-yyyy',this);">
															</td>
															<td align="right" style="font-size: 14px;"><form:input
																	path="orderNo" style="text-align: right;" size="10"
																	readonly="true" /></td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<!-- <script type="text/javascript"></script> -->
												<td align="center" colspan="3">
													<div id="pending" style="display: none;">
														<font size="10"> <spring:message
																code="BizComposer.Invoice.Pending" />
														</font>
													</div>
												</td>
											</tr>
											<tr align="left">
												<td align="center" colspan="2">
													<table style="width: 100%;">
														<tr>
															<td id="bill_label"></td>
														</tr>
													</table>
												</td>
												<td id="ship_label"></td>
											</tr>
											<tr>
												<td align="left">
													<table>
														<tr>
															<td id="bill_id" style="font-size: 14px;"><spring:message
																	code="BzComposer.Invoice.BillTo" /> <br />
																	 <form:textarea
																	path="billTo" rows="6" cols="25"
																	onclick="ShowBillingAddressPage(this.form);"
																	style="resize: none; width: 300px;" /></td>
															<td id="td2" align="center"></td>
														</tr>
													</table>
												</td>
												<td>&nbsp;</td>
												
											</tr>
											
											<tr>
												<td colspan="3"></td>
											</tr>
										</table>
										
										<table align="left">
														<tr>
															
															<td id="rep_label" style="font-size: 14px;"><spring:message
																	code="BzComposer.Invoice.Rep" /></td>
															<td style="font-size: 14px;"><spring:message
																	code="BzComposer.Invoice.Term" /></td>
															<td style="font-size: 14px;"><spring:message
																	code="BzComposer.Invoice.PayMethod" /></td>
															
														</tr>
														<tr>
															
															<td id="rep_id" style="font-size: 14px;"><form:select
																	path="rep" style="width:150px;">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<form:options items="${Rep}" itemValue="value"
																		itemLabel="label" />
																	<td style="font-size: 14px;"><form:select
																			path="term" style="width:150px;">
																			<form:option value="0">
																				<spring:message code="BzComposer.ComboBox.Select" />
																			</form:option>
																			<form:options items="${Term}" itemValue="value"
																				itemLabel="label" />
																		</form:select></td>
																	<td style="font-size: 14px;" style="font-size: 14px;">
																		<form:select path="payMethod" style="width:150px;">
																			<c:if test="${not empty PayMethod}">
																				<form:option value="0">
																					<spring:message code="BzComposer.ComboBox.Select" />
																				</form:option>
																				<form:options items="${PayMethod}" itemValue="value"
																					itemLabel="label" />
																			</c:if>
																		</form:select>
																	</td>
																</form:select></td>
															
														</tr>
													</table>
												<div id="product">
											<table id="custTable" class="tabla-listados"  cellspacing="0">
												
													<thead>
													<tr>
													<th style="font-size: 14px;width: 20%">
															<div id="it3">
																<spring:message code="BzComposer.Invoice.ItemName" />
															</div>
													</th>
													<th style="font-size: 14px;width:10%">
														<div id="td3">
															<spring:message code="BzComposer.Invoice.Qty" />
														</div> <%-- <div id="td4"><spring:message code="BzComposer.Invoice.Rate" /></div> --%>
													</th>
											
											    <th style="font-size: 14px; width:20%;">
														
														<div id="td11" ">
															<spring:message code="BzComposer.Item.ItemDescription" />
														</div>
													</th>
													<th style="font-size: 14px;width:10%">
														
														<div id="td11" ">
															<spring:message code="BzComposer.Invoice.Rate" />
														</div>
													</th>
													
													
													<th style="font-size: 14px;width:10%">
														<div id="td13" style="display: block;">
															<spring:message code="BzComposer.Invoice.Amt" />
														</div>
													</th>
													
													<th style="font-size: 14px;width:10%">
														<div id="td17" style="display: block;">
															<spring:message code="BzComposer.Invoice.Tax" />
														</div>
													</th>
													
											
												</tr>	
													</thead>
													
													<tbody id="itemServiceTableBody">
												  </tbody>
												
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
												<th colspan="12" style="font-size: 14px;"><spring:message
														code="BzComposer.Invoice.Summary" /></th>
											</tr>
										</thead>
										<tr>
											<td>
												<table style="width: 100%;">
													<tr>
														<td style="padding-top: 5px;"><spring:message
																code="BzComposer.Invoice.Message" /></td>
														<td><form:select path="message" style="width: 100%;">
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																<form:options items="${Message}" itemValue="value"
																	itemLabel="label" />
															</form:select></td>
													</tr>
													<tr>
														<td><spring:message code="BzComposer.Invoice.Memo" />
														</td>
														<td><form:textarea path="memo" rows="3" cols="40"
																style="width: 100%;" /></td>
													</tr>
												</table>
											</td>
											<td align="right" style="font-size: 14px;" colspan="3">
												<table>
													<tr>
														<td align="right" style="font-size: 14px;"><spring:message
																code="BzComposer.Invoice.TxRate" /></td>
														<td style="font-size: 14px;"><form:select
																path="taxID" onchange="TaxValue(this.value,this.form);"
																id="taxID" style="width: 120px;">
																<!-- <form:option value="0"><spring:message code="BzComposer.ComboBox.Select" /></form:option> -->
																<form:options items="${TaxRates}" itemValue="salesTaxID"
																	itemLabel="state" />
															</form:select> <c:if test="${not empty Tax}">
																<input type="hidden" value="" />
															</c:if></td>
													</tr>
													
													<tr>
														<td style="font-size: 14px;"><input type="checkbox"
															name="paid" id="paid" onclick="PaidItem();"
															value="${invoiceDto.paid}"
															${invoiceDto.paid?'checked':''} /> &nbsp;<spring:message
																code="BizComposer.Invoice.Paid" /></td>
														
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
														<td align="right" style="font-size: 14px;"><spring:message
																code="BzComposer.Invoice.Subtotal" /></td>
														<td style="font-size: 14px;"><form:input
																path="subtotal" style="text-align: right;"
																readonly="true"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</td>
													</tr>
													<tr>
														<td align="right" style="font-size: 14px;">
															<div id="tax_field">
																<spring:message code="BizComposer.Invoice.TaxField" />
															</div>
														</td>
														<td style="font-size: 14px;"><form:input path="tax"
																style="text-align: right;" readonly="true"
																onkeypress="return numbersOnlyFloat(event,this.value);" />

														</td>
													</tr>
													

													<tr>
														<td align="right" style="font-size: 14px;"><spring:message
																code="BzComposer.Invoice.Discount" /></td>
														<td style="font-size: 14px;"><form:input
																path="discount" style="text-align: right;"
																onclick="clearDiscountCol()"
																oninput="calDiscountTotal()"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</td>
													</tr>
													<tr>
														<td align="right" style="font-size: 14px;"><spring:message
																code="BzComposer.Invoice.Tot" /></td>
														<td style="font-size: 14px;"><form:input path="total"
																style="text-align: right;" readonly="true"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</td>
													</tr>
													<tr>
														<td align="right" style="font-size: 14px;"><spring:message
																code="BzComposer.Invoice.AdjustedTotal" /></td>
														<td style="font-size: 14px;"><form:input
																path="adjustedtotal" id="adjustedtotal_TextField"
																style="text-align: right;" readonly="true"
																oninput="calTotalDiscount();"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</td>
														<td><input type="hidden" size="15" /></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<br>
									<div>
									
										<form:hidden path="companyID" value="${CID}" />
										<form:hidden path="bsAddressID" />
										<form:hidden path="shAddressID" />
										<input type="hidden" value="" id="cid" /> 
									</div>
									
									<!-- end Contents -->
								</section>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-md-12" style="font-size: 16px;" align="center">
										<!-- <input type="button" id="btnNewInvoice" class="formbutton" onclick="NewInvoice();" title="New Invoice" style="padding: 8px 20px 8px 20px;" value="<spring:message code='BzComposer.global.new' />" />-->
										<input type="button" id="btnSaveInvoice" class="formbutton"
											onclick="onSave(this.form);" title="Save Invoice"
											style="padding: 8px 20px 8px 20px;"
											value="<spring:message code='BzComposer.global.saveUpdate' />" />
										<!-- <input type="button" id="btnUpdateInvoice" class="formbutton" onclick="ShowUpdate(this.form);" title="Update Customer information" style="padding: 8px 20px 8px 20px;" value="<spring:message code='BzComposer.updatecustomer.updatecustomer' />" />-->
										<!-- <input type="button" id="btnDeleteInvoice" title="Delete Invoice" class="formbutton" onclick="onDelete(this.form);"  style="padding: 8px 20px 8px 20px;" value="<spring:message code='BzComposer.Invoice.DeleteBtn' />" /> -->
									</div>
								</div>
							</div>
							<div>
								<input type="hidden" id="tabid" name="tabid" value="" /> <input
									type="hidden" id="request_locale" name="request_locale"
									value="" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</body>
</html>
<script type="text/javascript">


deleted = 0;
index1=0;
cnt=0;
count=0;
yestax=0;
tax_rate=0;
rate = 0;

var clientVendorID;


// this function sum Shipping value in total



//this function clear input value, 
function clearDiscountCol()
{
		

	document.InvoiceForm.adjustedtotal.value =parseFloat(document.InvoiceForm.total.value).toFixed(2);
	document.InvoiceForm.discount.value = "0.00";
	
}

//this function for calculat discount amount 
function calDiscountTotal()
{
	if( parseFloat(document.InvoiceForm.discount.value)>0)
	{
	     var convertSubData  =  parseFloat(document.InvoiceForm.total.value) -  parseFloat(document.InvoiceForm.discount.value);
	     document.InvoiceForm.adjustedtotal.value =parseFloat(convertSubData).toFixed(2);
	    document.getElementById('adjustedtotal_TextField').innerHTML=""+document.InvoiceForm.adjustedtotal.value;
	}
}

function calTotalDiscount()
{
	if( parseFloat(document.InvoiceForm.adjustedtotal.value)>0)
	{
		var convertSubData=parseFloat(document.InvoiceForm.total.value)-parseFloat(document.InvoiceForm.adjustedtotal.value);
		document.InvoiceForm.discount.value=parseFloat(convertSubData).toFixed(2);
	}
}
function Pending_Value(form)
{
    if(form.isPending.checked==true)
    {
        form.isPending.value="on";
    }
    else 
    {
        form.isPending.value="off";
    }
}

function TaxaValue(form)
{
    if(form.taxable.checked==true)
    {
        form.taxable.value="on";
    }else
    {
        form.taxable.value="off";
    }
}


function PaidItem()
{
    if(document.InvoiceForm.paid.checked==true)
    {
        document.InvoiceForm.paid.value="on";
    } 
    else
    {
        document.InvoiceForm.paid.value="off";
    }
}

function selectElement(id, valueToSelect)
{    
    let element = document.getElementById(id);
    element.value = valueToSelect;
}

function addItemDetails(clientVendorID,estimationID)
{
	
	//alert(" get data ");
	  $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=getAllItemDetails&cvId="+clientVendorID,
	        data:"estimationID="+estimationID,
	        success : function(data)
	        {
	        	
	        	//alert("data.length"+data.length);
	         	$('#itemServiceTableBody').html('');
			   	var ServiceTable = "<input type='hidden' name='itemServicelistSize' id='itemServicelSize' value='"+(data.length-1)+"'>";
			       for(var i=0; i<data.length-1; i++)
			       {
			           var objList = data[i];
			          
			        	  
			           ServiceTable=  ServiceTable + "<tr><td>"+objList.item+"</td><td>"+objList.qty+"</td><td>"+objList.itemMemo+"</td><td>"+objList.itemUnitPrice+"</td><td>"
		           +objList.itemTotal+"</td><td>"+objList.itemtax+"</td></tr>";
		           
			       }
			       
			       //alert("done");
			       $('#itemServiceTableBody').html(ServiceTable);
		           
			       var index=data.length-1;
		         // alert("Sub total "+data[index].itemTotal);
		         
		         document.InvoiceForm.subtotal.value=data[index].itemTotal;
		         var subtotal=document.InvoiceForm.subtotal.value;
		         
		         document.InvoiceForm.tax.value=((subtotal*tax_rate)/100).toFixed(2);
		         var tax=document.InvoiceForm.tax.value;
		         document.InvoiceForm.total.value=(subtotal/1)+parseFloat(tax);
		         document.InvoiceForm.adjustedtotal.value=(subtotal/1)+parseFloat(tax);
		           
	          
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
	
	
}


function onSave(form)
{
    
	//alert("save invocie");
	  
	//removeSessionData();
	
    var   No = document.InvoiceForm.orderNo.value;
     var estimationId=document.InvoiceForm.serviceID.value;
    var bill = document.InvoiceForm.billTo.value;
  //  alert("sid="+document.InvoiceForm.serviceID.value)
    if(document.InvoiceForm.serviceID.value==0)
    {
        return showValidationDialog();
    }
    
 //  alert("save invocie");
   //alert("save invocie cv="+clientVendorID);
   
    event.preventDefault();
            $("#saveInvoice").dialog({
                    resizable: false,
                    height: 200,
                    width: 500,
                    modal: true,
                    buttons: {
                        "<spring:message code='BzComposer.global.ok'/>": function ()
                        {

                            $(this).dialog("close");
                            
                      
                            document.forms["frmInvoice"].action ="serviceInvoice?tabid=saveServiceInvoice&clientVendorID="+clientVendorID+"&estimationID="+estimationId;
                            document.forms["frmInvoice"].submit();
                        },
                        <spring:message code='BzComposer.global.cancel'/>: function () {
                            $(this).dialog("close");
                            return false;
                        }
                    }
                });
                return false;
}
function Assignment(value)
{
	var size=0,estimationlsize=0;
	
    debugger;
    
    if(value==0)
    {
        document.InvoiceForm.billTo.value="";
        document.InvoiceForm.via.value="0"
        document.InvoiceForm.payMethod.value="0";
        document.InvoiceForm.rep.value="0";
        document.InvoiceForm.term.value="0";
        document.InvoiceForm.taxable.checked=false;
    }
    else
    { 
        size = document.getElementById("bSize").value;
        
        estimationlsize = document.getElementById("estimationlSize").value;
        var i;
        for(i=0;i<estimationlsize;i++)
        {
        	 var estimationID = document.getElementById(i+"estimationID").value;
        	 if(value==estimationID)
        		 {
        		 
        		 clientVendorID=document.getElementById(i+"clientVendorID").value;
        		  
        		 }
        	  }       
        
        var i;
       
        for(i=0;i<size;i++)
        {
			            var field1 = document.getElementById(i+"clvid").value;
			            if(clientVendorID==field1)
			            {
			            	  
			                document.InvoiceForm.companyID.value = document.getElementById(i+"cid").value;
			                document.InvoiceForm.bsAddressID.value = document.getElementById(i+"bsaddr").value;
			                document.InvoiceForm.billTo.value = document.getElementById(i+"bl").value;
			                 
			                break;
			            }
        }
   	      
					      var   sz = document.getElementById('custSize').value;
					        for(i=0;i<sz;i++)
					        {
					            var field11 = document.getElementById("a"+i+"clvndid").value;
					            if(clientVendorID==field11)
					            {
					                let custBalance = document.getElementById(i+"custBalance").value;
					                if(custBalance == "true") document.getElementById("CustomerBalanceBtn").style.backgroundColor = "red";
					                else document.getElementById("CustomerBalanceBtn").style.backgroundColor = "#05A9C5";
					                let viaItem = document.getElementById(i+"va").value;
					                
					            }
					        }
				    addItemDetails(clientVendorID,value);
                
                
}
   // calTax();
                   
}



function TaxValue1(value)
{
    
    size=document.getElementById("tSize").value;
    if(value==0){
        document.getElementById('tax_field').innerHTML="0.00 %";
        rate = 0;
        tax_rate=0;
        document.getElementById('tax_val').value=rate;
    }
    else
    {
        for(i=0;i<size;i++){
            var field = document.getElementById(i+"tx_id").value;
            if(value==field){
                rt = document.getElementById(i+"tx_rt").value;
             document.getElementById('tax_field').innerHTML="Tax ("+rt+" %)";
                rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);
               
                tax_rate=rt;
                break;
            }
        }
    }
}

function TaxValue(value,form)
{
    tot = document.InvoiceForm.shipping.value;
    subtotal = document.InvoiceForm.subtotal.value;
    size=document.getElementById("tSize").value;
    if(value==0){
        document.getElementById('tax_field').innerHTML="0.00 %";
        rate = 0;
        tax_rate=0;
        document.getElementById('tax_val').value=rate;
}
    else
    {
        for(i=0;i<size;i++)
        {
            var field = document.getElementById(i+"tx_id").value;
            if(value==field){
                rt = document.getElementById(i+"tx_rt").value;
              document.getElementById('tax_field').innerHTML="Tax ("+rt+" %)";
                rate = ( ((yestax/1 ) * (rt/1)) / 100 ).toFixed(2);
                document.getElementById('tax_val').value=rate;
                tax_rate=rt;
                break;
            }
        }
    }
    document.InvoiceForm.tax.value=rate;
    total = ((tot/1) + (subtotal/1)+(rate)/1);
    document.InvoiceForm.total.value=total.toFixed(2);
    document.InvoiceForm.adjustedtotal.value = total.toFixed(2);
}




function Init()
{
	
var serviceId=document.InvoiceForm.serviceID.value;
TaxValue1(1);
	Assignment(serviceId);
}
	












function paymentHistory(form){
    cid=form.custID.value;
    if(cid==0){
        return showValidationDialog();
    }
    else{
        window.open("Invoice?tabid=PaymentHistory&Type=Invoice&CustId="+cid,null,"scrollbars=yes,height=500,width=1300,status=yes,toolbar=no,menubar=no,location=no" );
    }
}

function SendMail(form){
    cid=form.orderNo.value;
      window.open("Invoice?tabid=ShowEmail&OrderType=invoice&OrderNo="+cid,null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no" );
}

function SendMailDisabled(form)
{
	return showItemOrderNumberDialog();
}


	
function PrintInvoice22(form)
{
    orderNo=document.InvoiceForm.orderNo.value;
    if(orderNo=="")
    {
        return showItemOrderNumberDialog();
    }
    else{
        window.open("Invoice?tabid=ShowPrint&OrderNo="+orderNo,null,"scrollbars=yes,height=500,width=800,status=yes,toolbar=no,menubar=yes,location=no" );
    }
}

</script>
<!-- dialog box that used in this page -->
<div id="saveInvoice" style="display: none;">
	<p>
		<spring:message code="BizComposer.Invoice.SaveUpdate" />
	</p>
</div>
<div id="showValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Estimaion.cName.Validation" />
	</p>
</div>

<div id="showSelectItemDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.invoice.selectItemFirst" />
	</p>
</div>
<div id="showItemOrderNumberDialog" style="display: none;">
	<p>
		<spring:message code="BizComposer.Invoice.OrderNo.Validation" />
	</p>
</div>
<div id="deleteInvoiceDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Invoice.Delete" />
	</p>
</div>
<div id="updateBillingAddressDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.invoice.saveBillingAddress" />
	</p>
</div>
<div id="updateShippingAddressDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.invoice.saveShippingAddress" />
	</p>
</div>
<div id="deleteRowDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Estimaion.DeleteItem" />
	</p>
</div>
<div id="printInvoiceDialog" style="display: none;">
	<div style="margin-bottom: 10px;">
		<strong>Please select what would you like to print</strong>
	</div>
	<div>
		<input type="checkbox" id="PrintInvoiceCbx" /> <span><spring:message
				code="BzComposer.invoice.invoicetitle" /></span>
	</div>
	<div>
		<input type="checkbox" id="PrintPackingSlipCbx" /> <span><spring:message
				code="BzComposer.configuration.packingslips" /></span>
	</div>
</div>