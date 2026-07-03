<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.customer.opportunityBoard" /></title>
<style>
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
	font-size: 14px;
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
						<div>
							<div style="float: left;">
								<span
									style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<spring:message code="BzComposer.customer.opportunityBoard" /> <c:if
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
												<table style="width: 100%; font-size: 14px; border-right: 2px solid #dddddd;" cellpadding="5">
													<tbody><tr>
														<th colspan="2">Filter Option</th>
													</tr>
													<tr>
														<td colspan="2">Date Range</td>
													</tr>
													<tr>
														<td>Date Start From :</td>
														<td>Date Start To :</td>
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
												<table style="width: 100%; font-size: 14px;" cellpadding="5">
													<tbody><tr>
														<th colspan="2">&nbsp;</th>
													</tr>
													<tr>
														<td>Column</td>
														<td><select id="searchType" name="searchType" style="width: 150px;">
																
																<option value="1">Name</option>
																<option value="2">Stage</option>
																<option value="3">Opportunity Owner</option>
																
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
													<button type="button" class="formbutton" onclick="OpportunitySearch(1);" style="width: 70px;">
														Search
													</button>
												</div>
												<div>
													<button type="button" class="formbutton" onclick="OpportunitySearch(2);" style="width: 70px; margin-top: 10px;">
														Refresh
													</button>
												</div>
												<div>
													<button type="button" class="formbutton" onclick="OpportunitySearch(3);" style="width: 70px; margin-top: 10px; margin-right: 20px;">
														Clear
													</button>
												</div>
											</td>
										</tr>
									</tbody></table></br>
							
							
							
							<div style="width: 100%;">
								<table style="width: 100%;">
									<tr>
										<td align="center"><input type="button"
											class="formbutton" onclick="openCustomerMailSender();"
											style="padding: 7 15px;"
											value="<spring:message code='BzComposer.Email.SendMail'/>" />
											<input type="button" class="formbutton"
											onclick="openCustomerMailTemplates();" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.Email.MailTemplates'/>" />
											
											
											
											<input type="button"
											class="formbutton" onclick="customerImport()"
											style="padding: 7 15px;"
											value="<spring:message code='menu.file.Import'/>" /> <input
											type="button" class="formbutton" onclick="exportCustomer()"
											style="padding: 7 15px;"
											value="<spring:message code='menu.file.ExportTo'/>" />
										</td>
									</tr>
									
								</table>
							</div>
							<div style="float: right;">
								<table>
									<tr align="right">
										<td colspan="6">
											<div>
												<input type="button" class="formbutton"
													onclick="addNewOpportunity();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.new'/>" />
												
												
												<input type="button" class="formbutton"
													onclick="deleteOpportunity()"
													style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.delete'/>" />
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<input type="hidden" id="lSize" value='${opportunityList.size()}' />
						<table id="custTable" class="tabla-listados sortable"
							cellspacing="0"
							style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
							align="center">
							<thead>
								<tr valign="center">
									<th style="padding-right: 30px !important;"><spring:message
											code="BzComposer.Customer.opportunities.id" /></th>
									<th><spring:message
											code="BzComposer.Customer.opportunities.name" /></th>

									<th><spring:message
											code="BzComposer.Customer.opportunities.stage" /></th>
									<th><spring:message
											code="BzComposer.Customer.opportunities.amount" /></th>
											
											<th><spring:message
											code="BzComposer.Customer.opportunities.opportunityOwner" />
											</th>	
											<th><spring:message
											code="BzComposer.customer.opportunity.sourceID" />
											</th>	
											<th><spring:message
											code="BzComposer.Customer.opportunities.startdate" /></th>
									<th><spring:message
											code="BzComposer.Customer.opportunities.closedate" /></th>
											<th><spring:message
											code="BzComposer.customer.opportunity.active" /></th>
											
								</tr>
							</thead>
							<tbody id="custTableBody">
								<c:if test="${not empty opportunityList}">
									<c:forEach items="${opportunityList}" var="objList"
										varStatus="loop">
										<tr  id='${loop.index}$$'
											onclick="setRowId(${objList.opportunityID},${objList.clientVendor.clientVendorId}, ${loop.index}, true);"
											ondblclick="goToManageOpportunity(${objList.opportunityID});">
											
											<td> <input type="checkbox" id="opportunityId${loop.index}"
												value="${objList.opportunityID}"
												onchange="addRowIndex(${loop.index},${objList.opportunityID}, ${objList.clientVendor.clientVendorId})" />
												${objList.opportunityID}
											   </td>
											     <td>${objList.opportunityName} </td>
											     <td>${objList.stage} </td>
											     <td>${objList.amount} </td>
											     <td>${objList.opportunityOwner} </td>
											     <td>${objList.sourceID} </td>
											     <td>${objList.startDate} </td>
											     <td>${objList.closedDate} </td>
											     	<td>Yes</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
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
let cvID;
let selectedRowIndexs = [];
$(document).ready(function() {
    $('#custTable').DataTable({
        "iDisplayLength": 25,
        "ordering": true,
        "order": [[0, 'desc']],
        "fnDrawCallback": function( oSettings ) {
            setRowId(0, 0, false);
            hightlightROW();
        }
    });
});

function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
        document.getElementById('0$$').className = "even";
    }
}



function OpportunitySearch(filterType)
{
	if(filterType > 1)
	{
        location.reload();
    }
	

	 
	
    let searchType = $("#searchType").val();
    let searchTxt = $("#searchTxt").val();
    let openDate1 = $("#orderDate1").val();
    let openDate2 = $("#orderDate2").val();
    
    var OpportunitySearchDetails= 
	   {
	     "searchType":searchType,
	     "searchTxt": searchTxt,
	     "OpenDate1": openDate1,
	     "OpenDate2": openDate2,
	    };
    var obj=JSON.stringify(OpportunitySearchDetails);
    
   
    
    $.ajax({
        type : "POST",
        url : "/AllOpportunity?tabid=FilterList",
        data:"data=" +obj,
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

function setRowId(rowid,cvId, rowIndex, flag){
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
            cvID=cvId;
        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
}


function addRowIndex(rowId,opportunityID, custID){
    let isFound = false;
    let isChecked = document.getElementById('opportunityId'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == opportunityID){
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

function hightlightROW(){
    let currROW2 = document.getElementById(itemIndex+'$$');
    if(currROW2 != null){
        currROW2.className = "draft";
    }
}


function goToManageOpportunity(opportunityID)
{

	
	window.location="Opportunity?tabid=ManageOpportunity&opportunityID="+opportunityID;
}





function addNewOpportunity(){
	//window.location = "Customer?tabid=NewCustomer";
	window.open("Opportunity?tabid=newOpportunity", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showCustomerValidationDialog(){
	event.preventDefault();
	$("#showOpportunityValidationDialog").dialog({
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

function openCustomerMailSender()
{

    if (selectedRowIndexs.length == 0){
        alert("<spring:message code='BzComposer.printlabels.selectcustomer'/>");
        return false;
    }else{
        let CustIDs = "";
        for(let x=0; x<selectedRowIndexs.length; x++)
        {
            CustIDs = CustIDs + selectedRowIndexs[x] +":";
        }
        CustIDs = CustIDs.substring(0, CustIDs.length-1);
        window.open("Opportunity?tabid=ShowEmailOnOpportunityBoard&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
    }
}



function deleteOpportunity()
{
	if (itemID == 0) {
		return showCustomerValidationDialog();
	}
		
		
		event.preventDefault();
		$("#deleteOpportunity").dialog({
	    	resizable: false,
	        height: 200,
	        width: 400,
	        modal: true,
	        buttons: {
	            "<spring:message code='BzComposer.global.ok'/>": function () {
	                $(this).dialog("close");
	                
	                window.location = "/Opportunity?tabid=delete&opportunityId="+itemID;
	                
	            }
	        }
	    });
	    return false;

}
function openCustomerMailTemplates(){
	window.open("MailTemplates?tabid=getMailTemplates", null,"scrollbars=yes,height=500,width=1000,status=yes,toolbar=no,menubar=no,location=no");
}

</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectcustomerfirst" />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselectedcustomer" />
	</p>
</div>

<div id="deleteOpportunity" style="display: none;">
	<p>
		<spring:message code="BzComposer.customer.opportunity.deleteselectedOpportunity" />
	</p>
</div>
<div id="showOpportunityValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectOpportunityfirst" />
	</p>
</div>

