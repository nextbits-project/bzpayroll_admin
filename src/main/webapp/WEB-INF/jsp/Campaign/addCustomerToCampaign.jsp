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

.dataTables_paginate
 {
	font-size: 12px;
}

table.sortable thead
 {
	background-color: #eee;
	color: #666666;
	font-weight: bold;
	cursor: default;
}

table.tabla-listados 
{
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
<form:form action="AllLeads?tabid=leadList" method="post" id="frmNewCustomer" name="frmNewCustomer" modelAttribute="campaignMemberDto">
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
									<spring:message code="BzComposer.campaign.addLeadCampaign" /> <c:if
										test="${not empty actionMsg}">
										<br /> ${actionMsg}
								            <%
								              session.removeAttribute("actionMsg");
								            %>
									</c:if>
								</span>
							</div>
								<br>
							<div style="float: right;">
							</div>
						</div>
					
					<div id="table-negotiations"  style="padding: 10px 10px; border: 1px solid #ccc; width:100%;"  align="center">
					
						<table cellspacing="0"  class="tabla-listados"
							style="width: 100%; margin-top: 10px; border: 0; padding: 10px 10px; height: auto;"
							align="center"> 
							<tbody id="custTableBody">
							<tr >
							<td colspan="2" style="text-align: center">
							 <b> ${campaignMemberDto.selectedMembers} Customers  Selected </b>
							 </td>
							</tr>
							
							<tr>
													
													<td colspan="2"><spring:message code="BzComposer.sales.campaign" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span>
																	</td>
															<td>
															<form:select path="campaignID" 
																
																style="width:250px">
															<c:forEach items="${campaignList}" var="currObject">
																	<form:option value="${currObject.campaignID}">${currObject.campaignName}</form:option>
																</c:forEach>
																</form:select>
							</tr>
								
									<tr>
													
													<td colspan="2"><spring:message code="BzComposer.campaign.memberStatus" />
															<span class="inputHighlighted"><spring:message
																	code="BzComposer.CompulsoryField.Validation" /></span>
																	</td>
															<td><form:select path="status" 
																
																style="width:250px">
																
																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>
																
																<form:option value="Sent">
																	Sent
																</form:option>
																<form:option value="In Progress">
																	In Progress
																</form:option>
																<form:option value="Complete">
																	Complete
																</form:option>
																
																			</form:select>
																			</td>
								  </tr>
								  
								  <tr>
								  
								 	<th> 
								 	<b>
								 	            <spring:message code="BzComposer.campaign.exitingCampaign" />
								 	</b> 
								 	
								 	
								 	</th>
								 
								  </tr>
								   <tr>
								  <td>
								  <form:radiobutton path="updateStatus" value="false" />
								   <spring:message code="BzComposer.campaign.keepexistingMemberStatus" /><br>
								  </td>
								  </tr>
								  
								   <tr>
								  
								  <td>
                                        
                                      <form:radiobutton path="updateStatus" value="true"/> <spring:message code="BzComposer.campaign.updateexistingMemberStatus" /><br>
                                       
								  </td>
								  
			
								  </tr>
								  
								  <tr>
								  
								  <td rowspan="5">&nbsp;</td>
								  
								  </tr>
						
							</tbody>
						</table>
						
						<div align="right">
						
						     <table>
									<tr >
										<td colspan="6">
											<div>
											<input type="button" class="formbutton"
													onclick="closeWindow();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.close'/>" />
												<input type="button" class="formbutton"
													onclick="addCustomer();" style="padding: 7 15px;"
													value="<spring:message code='BzComposer.global.submit'/>" />
												
											</div>
										</td>
									</tr>
								</table>
								</div>
						</div>
						<form:hidden path="SelectedMemberIDs"/>
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

$(document).ready(function() 
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

function closeWindow()
{
	// window.location.reload()
	  window.close();
	
}

function addCustomer() 
{
	
		document.forms["frmNewCustomer"].action = "Campaign?tabid=saveCustomerToCampaign";
		
		document.forms["frmNewCustomer"].submit();
		

	
}
function initialize(){
	
	//window.resizeTo(1000, 800);
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


function goToCustomerBoard(clientVendorID)
{
    window.location = "/Customer?tabid=CustomerBoard&selectedCvID="+clientVendorID;
    
}

function addNewLead()
{
	//window.location = "Customer?tabid=NewCustomer";
	//window.open("Lead?tabid=NewLead", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
	window.open("/newLead", null,"scrollbars=yes,height="+screen.height+",width=1300,status=yes,toolbar=no,menubar=no,location=no");
}

function showCustomerValidationDialog()
{
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