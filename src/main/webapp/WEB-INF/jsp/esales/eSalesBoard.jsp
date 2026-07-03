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
		<spring:message code="BzComposer.eSales.eSalesBoard" />
	</title>
	<style type="text/css">
	body {
    	min-width: 1366px;
    }
        .fht-tbody {
        	height: 180px !important; /*  change table height*/
        	border-bottom: 1px solid rgb(207, 207, 207);
        }

        .dataTables_length {
        	font-size: 14px;
        }

        .dataTables_filter {
        	font-size: 14px;
        }

        .dataTables_info {
        	font-size: 14px;
        }

        .dataTables_paginate {
        	font-size: 14px;
        }

        table.tabla-listados {
        	width: 100%;
        	border: 1px solid rgb(207, 207, 207);
        	margin: 0px 0px 0px 0px;
        }

        table.tabla-listados tbody tr.odd td {
        	background: #e1e5e9;
        }

        .errorMsg {
        	color: #D8000C;
        	background-color: #FFD2D2;
        }

        table.tabla-listados thead tr th {
        	font-size: 14px;
        }

        table.tabla-listados tbody tr td {
        	font-size: 12px;
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
						<div>
							<div id="errorDiv" class="bg-danger" align="center">
								<div align="center" class="errorMsg">
									<FONT COLOR="Green"> ${successMsg} </FONT COLOR="Green">
								</div>
							</div>
							<span
								style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
								<spring:message
									code="BzComposer.eSales.eSalesBoard" />
									<c:if test="${not empty msg}">
										<div>
											<span class="msgstyle">*${msg}</span>
										</div>
									</c:if>
									<c:if test="${not empty SaveStatus}">
										<div>
											<span class="msgstyle">*${SaveStatus}</span>
											<%
											session.removeAttribute("SaveStatus");
											%>
										</div>
									</c:if>
							</span>
						</div>
						<div>
							<div id="table-negotiations">
								<table cellspacing="0" align="center" class="section-border"
									style="width: 100%;">
									<tr>
										<td style="width: 30%; padding: 10px;">
											<table
												style="width: 100%; font-size: 14px; border-right: 2px solid #dddddd;"
												cellpadding="5">
												<tr>
													<th colspan="2"><spring:message
															code="BzComposer.estimationboard.filteroption" /></th>
												</tr>
												<tr>
													<td colspan="2"><spring:message
															code="BzComposer.salesorderboard.daterange" /></td>
												</tr>
												<tr>
													<td width="50%"><spring:message
															code="BzComposer.additem.datefrom" />
														</td>
													<td width="50%"><spring:message
															code="BzComposer.additem.dateto" />
														</td>
												</tr>
												<tr>
													<td><input size="20"
															style="width: 120px;" /> <img style="margin: 5;"
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.EstimationBoardForm.orderDate1,'mm-dd-yyyy',this);" />
													</td>
													<td><input size="20"
															style="width: 120px;" /> <img style="margin: 5;"
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.EstimationBoardForm.orderDate2,'mm-dd-yyyy',this);">
													</td>
												</tr>
											</table>
										</td>

										<td style="width: 25%;">
											<table style="width: 100%; font-size: 14px;"
												cellpadding="5">
												<tr>
													<th colspan="2">&nbsp;</th>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.estimationboard.column" /></td>
													<td><select
															style="width: 150px;">
															<option value="1"><spring:message
																	code="BzComposer.estimationboard.name" /></option>
															<option value="2"><spring:message
																	code="BzComposer.estimationboard.order" /></option>
															<option value="3"><spring:message
																	code="BzComposer.estimationboard.orderid" /></option>
															<option value="4"><spring:message
																	code="BzComposer.estimationboard.address" /></option>
															<option value="5"><spring:message
																	code="BzComposer.estimationboard.productname" /></option>
															<option value="6"><spring:message
																	code="BzComposer.estimationboard.email" /></option>
														</select></td>
												</tr>
												<tr>
													<td><spring:message
															code="BzComposer.estimationboard.text" /></td>
													<td><input type="text"
															style="width: 150px;" /></td>
												</tr>
												<tr>
													<td colspan="2"><spring:message
															code="BzComposer.salesorderboard.dateformat" /> :
														(MM-DD-YYYY)</td>
												</tr>
											</table>
										</td>
										<td style="width: 20%;">
											<div>
												<button type="button" class="formbutton"
													onclick="SaleSearch(1);" style="width: 70px;">
													<spring:message code='BzComposer.estimationboard.search' />
												</button>
											</div>
											<div>
												<button type="button" class="formbutton"
													onclick="SaleSearch(2);"
													style="width: 70px; margin-top: 10px;">
													<spring:message code='BzComposer.estimationboard.refresh' />
												</button>
											</div>
											<div>
												<button type="button" class="formbutton"
													onclick="SaleSearch(3);"
													style="width: 70px; margin-top: 10px; margin-right: 20px;">
													<spring:message code='BzComposer.estimationboard.clear' />
												</button>
												<button type="button" class="formbutton"
													onclick="downloadEstimationBoardReport();"
													style="width: 110px; margin-top: 10px;">
													<spring:message code='BzComposer.global.MultiPrint' />
												</button>
											</div>
										</td>
									</tr>
								</table>
								<div>
									<br />

									<table style="width: 100%">
										<tr align="center">

											<td style="width: 40%" align="left"><span
												style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
													
											</span></td>
											<td style="width: 60%" align="left">
												<input type="button" class="formbutton" id=""
												onclick="sendToInvoice()" style="padding: 10px;"
												value='<spring:message code="BzComposer.sales.Lookup" />' />
												<input type="button" class="formbutton" id=""
												onclick="sendToCreateRMA();" style="padding: 10px;"
												value='<spring:message code="BzComposer.invoiceboard.createRMA" />' />
												<input type="button" class="formbutton" id=""
												onclick="SendMail(this.form);" style="padding: 10px;"
												value='<spring:message code="BzComposer.global.sendmail" />' />
												<input type="button" class="formbutton" id=""
												onclick="addToRefundList(this.form);" style="padding: 10px;"
												value='<spring:message code="BzComposer.accountreceivable.addToRefundList" />' />
												<input type="hidden" name="ONum" id="ONumId" /> <input
												type="hidden" name="sEmail" id="sEmailID" /> <input
												type="hidden" name="rNum" id="rowONum" /> <input
												type="hidden" name="senderEmail" id="EID" /></td>
										</tr>
									</table>
									<br />

									<div>
										<div class="grid_8 tabla-listados" id="estimationList">
											<section>
												<c:forEach items="${EstimationBoardDetails}"
													var="currObject" varStatus="loop">
													<input type="hidden" id="selectedEstID${loop.index}"
														value="${currObject.est_no}" />
													<input type="hidden"
														id="selectedESInvoiceID${loop.index}"
														value="${currObject.invoiceID}" />
												</c:forEach>
												<input type="hidden" name="sListSize" id="lSize"
													value='${eSalesBoardDtoList.size()}'>
												<table id="eSalesList" class="tabla-listados"
													cellpadding="0" cellspacing="0">
													<thead style="font-weight: bold;">
														<tr>
															<th style="font-size: 14px;"><input
																type="checkbox" id="allRecordsChkHead"
																onchange="getAllRecordsIDs(this)" /> <spring:message
																	code="eSalesInvoiceDetails.All" />
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.order" />
															</th>
															<!-- <th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.Market" />
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.Store" /> -->
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.OrderDate" />
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.SaleDate" />
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.Name" />
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.Address" />
															</th>
															<th style="font-size: 14px;"><spring:message
																	code="BzComposer.eSales.ProductName" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.Amount" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.ShippingCost" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.TotalAmount" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.EmailAddr" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.Printed" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.Shipped" />
															</th>
															<th style="font-size: 14px;"><spring:message
																code="BzComposer.eSales.Email" />
															</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${eSalesBoardDtoList}"
															var="objList" varStatus="loop">
															<tr id='${loop.index}$$'
																onclick="setRowId(${objList.invoiceID}, ${objList.invoice_no}, '${objList.email}', ${loop.index}, true);">
																<td>
																    <input type="hidden" class="invoiceID" value="${objList.invoiceID}" />
																	<input type="checkbox" class="allRecordsCLS" id="allRecordsChk${loop.index}"
                                                                        onchange="getRecordID(this, ${loop.index}, ${objList.invoiceID});"
                                                                        value="${objList.invoice_no}" />
																</td>
																<td style="font-size: 14px;">${objList.invoice_no}</td>
																<td style="font-size: 14px;">${objList.dateAdded}</td>
																<td style="font-size: 14px;">${objList.saleDate}</td>
																<td style="font-size: 14px;">${objList.firstName} ${objList.lastName}</td>
																<td style="font-size: 14px;">${objList.address1} ${objList.address2} ${objList.city} ${objList.state} ${objList.country}</td>
																<td style="font-size: 14px;">${objList.itemName}</td>
																<td style="font-size: 14px;">${objList.amount}</td>
																<td style="font-size: 14px;">${objList.shippingCost}</td>
																<td style="font-size: 14px;">${objList.totalAmount}</td>
																<td style="font-size: 14px;">${objList.email}</td>
																<td style="font-size: 14px;">
																	<input type="checkbox" name="isPrintedCHK" id="isPrintedId"
																	title="isPrinted"
																	${objList.printed == true?'checked':''} />
																</td>
																<td style="font-size: 14px;">
																	<input type="checkbox" name="isShippedCHK" id="IsShippedId"
																	title="IsShipped"
																	${objList.shipped == 1?'checked':''} />
																</td>
																<td style="font-size: 14px;">
																	<input type="checkbox" name="isEmailedCHK" id="isEmailedId"
																	title="isEmailed"
																	${objList.emailed == true ?'checked':''} />
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</section>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<input type="hidden" id="ord_value" />
	<input type="hidden" id="invoice_id" />
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
<script>
let selectedRowIDs = [];
let invoiceRowIDs = [];
let itemID = 0;
let itemIndex = 0;
$(document).ready(function() {
    $('#eSalesList').DataTable({
        "iDisplayLength": 20,
        "ordering": false,
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, null, 0, false);
            hightlightROW();
        }
    });
});
function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
    getAllRecordsIDs2();
}
function getAllRecordsIDs2() {
    $('.allRecordsCLS').prop('checked', false);
    let size = document.getElementById("lSize").value;
    for(i=0; i<size; i++){
         let currChkBox = document.getElementById('allRecordsChk'+i);
         if(currChkBox){
            for(j=0; j<selectedRowIDs.length; j++){
                if(selectedRowIDs[j] == currChkBox.value){
                    currChkBox.checked = true;
                    break;
                }
            }
         }
    }
}
function setRowId(invoiceID, rowId, email, rowIndex, flag){
	document.getElementById("ord_value").value=rowId;
	document.getElementById("invoice_id").value=invoiceID;
	size=document.getElementById("lSize").value;
    for(i=0;i<size;i++){
		 let currROW = document.getElementById(i+'$$');
         if(currROW == null) continue;
         if(i%2 == 1){
             currROW.className = "odd";
         }else{
             currROW.className = "even";
         }
	}
	if(flag){
        itemID = rowId;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }else{
            document.getElementById(rowIndex+"$$").classList.remove('even');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
	document.getElementById("sEmailID").value = email;
	document.getElementById("rowONum").value = rowId;
}
function getRecordID(currChkBox, rowIndex, invoiceID) {
    if(currChkBox.checked){
        selectedRowIDs.push(currChkBox.value);
        invoiceRowIDs.push(invoiceID);
    }else{
        const index = selectedRowIDs.indexOf(currChkBox.value);
        if (index > -1) {
          selectedRowIDs.splice(index, 1);
        }

        const index2 = invoiceRowIDs.indexOf(invoiceID);
        if (index > -1) {
          invoiceRowIDs.splice(index2, 1);
        }
    }
    if(document.getElementById("lSize").value == selectedRowIDs.length){
        document.getElementById('allRecordsChkHead').checked = true;
    }else{
        document.getElementById('allRecordsChkHead').checked = false;
    }
}
function sendToInvoice(){
	order_no = document.getElementById("ord_value").value;
	window.location = "Invoice?tabid=SBLU&order_no="+order_no;
}
function sendToCreateRMA(){
    order_no = document.getElementById("ord_value").value;
    window.location = "RMA?tabid=CreateRMA&orderNumber="+order_no;
}
function SendMail(form){
	 if(selectedRowIDs.length !=1){
		 $("#warningDialogSendmail").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function ()
                {
                     $(this).dialog("close");
                     return true;

                }
            }
        });
	} else {
        order_no = document.getElementById("ord_value").value;
        window.open("Invoice?tabid=ShowEmail&OrderType=invoice&OrderNo="+order_no,null,"scrollbars=yes,height=500,width=900,status=yes,toolbar=no,menubar=no,location=no" );
	}
}
function addToRefundList(form){
    invoice_id = document.getElementById("invoice_id").value;

    $.ajax({
        type: "POST",
        url:"eSalesAjax?tabid=AddToRefundList&invoiceID="+invoice_id,
        data:{invoiceID : invoice_id},
        success : function(data)
        {
             console.log(invoice_id);
        },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}
</script>
</html>
							