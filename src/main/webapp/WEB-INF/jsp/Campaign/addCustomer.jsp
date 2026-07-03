<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@include file="/WEB-INF/jsp/include/header.jsp"%>

<title><spring:message code="BzComposer.campaign.addContactToCampaign" /></title>
<style>

.dataTables_filter {
	font-size: 12px;
}

.dataTables_info {
	font-size: 12px;
}

.dataTables_paginate {
	font-size: 12px;
}

table.sortable thead {
	background-color: #eee;
	color: #666666;
	font-weight: bold;
	cursor: default;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 0px 0px 0px 0px;
}

table.tabla-listados tbody tr.odd td {
	background: #e1e5e9;
}

table.tabla-listados thead tr th {
	font-size: 12px;
}

table.tabla-listados tbody tr td {
	font-size: 12px;
}
</style>
</head>
<body onload="initialize();" id="pageLoad">
<form:form action="AllLeads?tabid=leadList" method="post" id="" name="LeadBoardForm" modelAttribute="leadBoardDto">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div id="cos">
		<div class="statusquo ok">
			<div id="hoja">
				<div id="blanquito">
					<div id="padding">
						<!-- begin Contents -->
						<div align="center">
							<div style="float: center;">
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<spring:message code="BzComposer.campaign.addContactToCampaign" /> <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
            <%
            session.removeAttribute("actionMsg");
            %>
									</c:if>
								</span>
							</div>
							
							<table cellspacing="0" align="center" class="section-border" style="width: 100%;">
										<tbody><tr>
											<td style="width: 30%; padding: 10px;">
												<table style="width: 100%; font-size: 12px; border-right: 2px solid #dddddd;" cellpadding="5">
													<tbody><tr>
														<th colspan="2">Filter Option</th>
													</tr>
													<tr>
														<td colspan="2">Date Range</td>
													</tr>
													<tr>
														<td>Date Added From :</td>
														<td>Date Added To :</td>
													</tr>
													<tr>
														<td style="width: 50%;"><input id="orderDate1" name="orderDate1" style="width: 120px;" type="text" value="" size="20"> <img style="margin: 5;" src="/images/cal.gif" onclick="displayCalendar(document.LeadBoardForm.orderDate1,'mm-dd-yyyy',this);">
														</td>
														<td><input id="orderDate2" name="orderDate2" style="width: 120px;" type="text" value="" size="20"> <img style="margin: 5;" src="/images/cal.gif" onclick="displayCalendar(document.LeadBoardForm.orderDate2,'mm-dd-yyyy',this);">
														</td>
													</tr>
												</tbody></table>
											</td>
											<td style="width: 25%;">
												<table style="width: 100%; font-size: 12px;" cellpadding="5">
													<tbody><tr>
														<th colspan="2">&nbsp;</th>
													</tr>
													<tr>
														<td>Column</td>
														<td><select id="searchType" name="searchType" style="width: 150px;">
																
																<option value="1">Name</option>
																<option value="2">Company</option>
																<option value="3">Address1</option>
																<option value="3">Email</option>
															</select></td>
													</tr>
													<tr>
														<td>Text</td>
														<td><input id="searchTxt" name="searchTxt" style="width: 150px;" type="text" value=""></td>
													</tr>
													<tr>
														<td colspan="2">Date format :
															(MM-DD-YYYY)</td>
													</tr>
												</tbody></table>
											</td>
											<td style="width: 20%;">
												<div>
													<button type="button" class="formbutton" onclick="LeadSearch(1);" style="width: 70px;">
														Search
													</button>
												</div>
												<div>
													<button type="button" class="formbutton" onclick="LeadSearch(2);" style="width: 70px; margin-top: 10px;">
														Refresh
													</button>
												</div>
												<div>
													<button type="button" class="formbutton" onclick="LeadSearch(3);" style="width: 70px; margin-top: 10px; margin-right: 20px;">
														Clear
													</button>
												</div>
											</td>
										</tr>
									</tbody></table></br>
									
				
							<div style="float: right;">
								<table>
									<tr align="right">
										<td colspan="6">
											<div>
												<input type="button" class="formbutton"
											onclick="addNewCustomer();" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.global.new'/>" /> <input
											type="button" class="formbutton"
											onclick="manageCustomer('EDIT');" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.global.edit'/>" /> <input
											type="button" class="formbutton"
											onclick="manageCustomer('DELETE');" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.global.delete'/>" />
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<input type="hidden" id="lSize" value='${customerList.size()}' />
						<table id="custTable" class="tabla-listados sortable"
							cellspacing="0"
							style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
							align="center">
							<thead>
								<tr valign="center">
									<th style="padding-right: 30px !important;"><spring:message
											code="BzComposer.Customer.ID" /></th>
									<th><spring:message
											code="BzComposer.customerinfo.customer" /></th>
									<th><spring:message code="BzComposer.global.company" /></th>
									
									<th><spring:message code="BzComposer.global.email" /></th>
									<th><spring:message code="BzComposer.global.phone" /></th>
									<th><spring:message code="BzComposer.global.mobile" /></th>
								
									<th><spring:message code="BzComposer.global.dateadded" /></th>
									<th>Active</th>
								</tr>
							</thead>
							<tbody id="custTableBody">
								<c:if test="${not empty customerList}">
									<c:forEach items="${customerList}" var="objList"
										varStatus="loop">
										<tr id='${loop.index}$$'
											onclick="setRowId(${objList.clientVendorID}, ${loop.index}, true);">
											<td class="${objList.paymentUnpaid?'redColor':''}"><input
												type="checkbox" id="custID${loop.index}"
												value="${objList.clientVendorID}"
												onchange="addRowIndex(${loop.index}, ${objList.clientVendorID})" />
												
												${objList.clientVendorID}</td>
											<td>${objList.firstName}${objList.middleName}
												${objList.lastName}</td>
											<td>${objList.companyName}</td>
											
											
											<td>${objList.email}</td>
											<td>${objList.phone}</td>
											<td>${objList.cellPhone}</td>
										
											<td>${objList.dateAdded}</td>
											<td>Active</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div align="right">
						
						     <table>
									<tr >
										<td colspan="6">
											<div>
											<input type="button" class="formbutton"
													onclick="addNewLead();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.close'/>" />
												<input type="button" class="formbutton"
													onclick="gotoNext();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.next'/>" />
												
											</div>
										</td>
									</tr>
								</table>
								</div>
					</div>
					<div>
						<input type="hidden" name="tabid" id="tabid" value="" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
		</form:form>
</body>
</html>
<script>
let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];

$(document).ready(function() {
    $('#custTable').DataTable({
        "iDisplayLength": 5,
        "ordering": true,
        "order": [[0, 'desc']],
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
        }
    });
});
function addNewCustomer(){
	//window.location = "Customer?tabid=NewCustomer";
	window.open("Customer?tabid=NewContact", null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
}


function manageCustomer(cmd){
    
	if (itemID == 0) {
		return showCustomerValidationDialog();
	} else {
		if (cmd=="EDIT") {
			//window.location = "Customer?tabid=editCustomer&cvId="+itemID+"&itemIndex="+itemIndex;
			window.open("Customer?tabid=editContact&cvId="+itemID, null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
		}
		else if (cmd=="DELETE") {
			if(confirm("<spring:message code='BzComposer.customerinfo.deleteselectedcustomer'/>")==true) {
				//window.location = "Customer?tabid=Customer&customerAction=DELETE&cvID="+clientVendorID;
				$.ajax({
                    type : "GET",
                    url : "Customer?tabid=Customer&customerAction=DELETE&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
		else if (cmd=="CONVERT") {
			if(confirm("<spring:message code='BzComposer.customerinfo.converttocustomer'/>")==true) {
				$.ajax({
                    type : "GET",
                    url : "Customer?tabid=Customer&customerAction=CONVERT&cvTypeId=2&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
		else if (cmd=="CONVERTCUSTOMERtoLEAD") {
			if(confirm("<spring:message code='BzComposer.customerinfo.convertltolead'/>")==true) {
				$.ajax({
                    type : "GET",
                    url : "CustomerConvertToLead?tabid=Customer&customerAction=CONVERT&cvTypeId=Lead&cvID="+itemID,
                    success : function(data) {
                        location.reload();
                    },
                    error : function(error) {
                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                    }
                });
			}
			return false;
		}
	}
}

function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
    	if(document.getElementById('0$$') != null){
    		document.getElementById('0$$').className = "even";
    	}
    }
}

function setRowId(rowid, rowIndex, flag){
    let lSize = document.getElementById("lSize").value;
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
        if(rowIndex%2 == 1){ ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
}
function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}



function goToCustomerBoard(clientVendorID){
    window.location = "/Customer?tabid=CustomerBoard&selectedCvID="+clientVendorID;
}

function addNewLead(){
	//window.location = "Customer?tabid=NewCustomer";
	//window.open("Lead?tabid=NewLead", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
	window.open("/newLead", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showCustomerValidationDialog(){
	event.preventDefault();
	$("#showCustomerValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function gotoNext()
{
	  let CustIDs = "";
      for(let x=0; x<selectedRowIndexs.length; x++){
          CustIDs = CustIDs + selectedRowIndexs[x] +":";
      }
      CustIDs = CustIDs.substring(0, CustIDs.length-1);
              
	window.location="/Campaign?tabid=addCustomerCampaign&CustIDs="+CustIDs;	
}


//for send email, email template, send through outlook, transform to Customer, import & export functions


function addRowIndex(rowId, custID){
    let isFound = false;
    let isChecked = document.getElementById('custID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == custID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(custID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(custID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}

function LeadSearch(filterType)
{
	if(filterType > 1){
        location.reload();
    }
    let searchType = $("#searchType").val();
    let searchTxt = $("#searchTxt").val();
    let orderDate1 = $("#orderDate1").val();
    let orderDate2 = $("#orderDate2").val();
    $.ajax({
        type : "POST",
        url : "AllLeads?tabid=FilterList",
        data:"searchType=" + searchType + "&searchTxt=" +searchTxt+ "&orderDate1=" +orderDate1+ "&orderDate2=" +orderDate2,
        success : function(data){
            //$(document).find('div#custTableBody section').replaceWith($(data).find('div#custTableBody').html());
            let orderDate1 = document.getElementById('orderDate1').value;
            let orderDate2 = document.getElementById('orderDate2').value;
            let searchType = document.getElementById('searchType').value;
            let searchTxt = document.getElementById('searchTxt').value;
            document.getElementById('pageLoad').innerHTML = data;
            document.getElementById('menubar2').style.display='block';
            document.getElementById('orderDate1').value = orderDate1;
            document.getElementById('orderDate2').value = orderDate2;
            document.getElementById('searchType').value = searchType;
            document.getElementById('searchTxt').value = searchTxt;
            selectedRowIDs = [];
        },
         error : function(data) {
             alert("<spring:message code='BzComposer.billingboard.someerroroccurred'/>");
        }
    });
}

function openMailSender(){
    if (selectedRowIndexs.length == 0){
        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
        return false;
    }else{
        let CustIDs = "";
        for(let x=0; x<selectedRowIndexs.length; x++){
            CustIDs = CustIDs + selectedRowIndexs[x] +":";
        }
        CustIDs = CustIDs.substring(0, CustIDs.length-1);
        window.open("Customer?tabid=ShowEmailOnLeadList&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function transferToCustomer(){
    if (selectedRowIndexs.length == 0){
        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
        return false;
    }else{
        let CustIDs = "";
        for(let x=0; x<selectedRowIndexs.length; x++){
            CustIDs = CustIDs + selectedRowIndexs[x] +":";
        }
        CustIDs = CustIDs.substring(0, CustIDs.length-1);
        window.open("Customer?tabid=transferToCustomer&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function openMailTemplates(){
	window.open("MailTemplates?tabid=getMailTemplates", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
}
</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectleadfirst" />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedcustomer" />
	</p>
</div>