<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.customerinfotitle" /></title>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<link href="https://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">

<link href="https://cdn.datatables.net/v/bs/dt-2.2.2/datatables.min.css" rel="stylesheet" integrity="sha384-xd6yqpSXZRZVl62sBIxyT2i4xVlfaxWVjVQB7qsVte0qEr3iepsBrLi/awgmIoPV" crossorigin="anonymous">
 
<script src="https://cdn.datatables.net/v/bs/dt-2.2.2/datatables.min.js" integrity="sha384-KsmaH+vFCWsWkBqzoXM7HmafapkguLKrj9aRyWzIIaUDqRN99PP25wJUm7ZE+KP3" crossorigin="anonymous"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js">
	</script>

<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.15.35/css/bootstrap-datetimepicker.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/scripts/datetimepicker.js"></script>

	
<style type="text/css">
div#pie {
	padding: 10px 0px 20px 0px;
}

table.tabla-listados {
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
	margin: 20px 0px 20px 0px;
}

table.tabla-listados thead tr th {
	font-size: .7em;
	text-align: left;
	padding: 5px 10px;
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	text-shadow: #999 0px 1px 1px;
	white-space: nowrap;
}

table.tabla-listados tbody tr td {
	font-size: .8em;
	padding: 5px 0px 5px 14px;
	background: #fff;
	vertical-align: top;
}

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	min-width: 55%;
	min-height: 300px;
	height: auto;
	width: 200px;
	display: block;
	z-index: 101;
}

#highlight {
	background-color: red;
}

.highlight {
	background-color: #00CED1 !important;
	color: #fff
}

.switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 28px;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 20px;
	width: 20px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #17a2b8;
}

input:checked+.slider:before {
	-webkit-transform: translateX(20px);
	-ms-transform: translateX(20px);
	transform: translateX(20px);
}

/* --------- Rounded sliders ---------- */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.paddingLeft30PX {
	padding-left: 30px ! important;
}

.inactiveText {
	color: #ccc;
}
</style>

<style>
.dataTables_length {
	display: none;
}

.dataTables_filter {
	font-size: 14px;
	float: left !important;
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
<body onload="initialize();">
	<!-- begin shared/header -->

	<div id="ddcolortabsline">&nbsp;</div>
	<form:form name="timeActivityForm" method="post"
		modelAttribute="serviceDto">
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<!-- begin Contents -->
							<div>
								<div>
									<span
										style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
										<spring:message
											code="BzComposer.menu.service.timeexpenseactivity" /> <c:if
											test="${not empty actionMsg}">
											<br /> ${actionMsg}
	            <%
	            session.removeAttribute("actionMsg");
	            %>
										</c:if>
									</span>
								</div>
								<div class="btngroup2-fixed mt-3 text-center"
									style="position: relative;">
									<spring:message
										code="BzComposer.service.timeexpense.datarangeFrom" />

									<form:input path="fromDate" readonly="true" size="15" />
									<img src="${pageContext.request.contextPath}/images/cal.gif"
										onclick="displayCalendar(document.timeActivityForm.fromDate,'mm-dd-yyyy',this);">


									To
									<form:input path="toDate" readonly="true" size="15" />
									<img src="${pageContext.request.contextPath}/images/cal.gif"
										onclick="displayCalendar(document.timeActivityForm.toDate,'mm-dd-yyyy',this);">
									<button class="btn btn-info" style="font-size: 11px;">Search</button>

								</div>
							</div>
							<input type="hidden" id="lSize" value='${estimationList.size()}' />
							<table id="custTable" class="tabla-listados sortable"
								cellspacing="0"
								style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
								align="center">
								<thead>
									<tr valign="center">
										<th><spring:message
												code="BzComposer.service.timeexpense.select" /> ID</th>
										<th style="padding-right: 30px !important;"><spring:message
												code="BzComposer.service.timeexpense.customerjob" /></th>
										<th><spring:message code="BzComposer.service.Time" /></th>
										<th><spring:message code="BzComposer.service.Expenses" /></th>
										<th><spring:message code="BzComposer.service.Mileage" /></th>
										<th><spring:message code="BzComposer.service.Items" /></th>
										<th><spring:message
												code="BzComposer.service.timeexpense.total" /></th>
										<th><spring:message
												code="BzComposer.item.category.manager.action" /></th>
									</tr>
								</thead>
								<tbody id="custTableBody">
									<c:if test="${not empty estimationList}">
										<c:forEach items="${estimationList}" var="objList"
											varStatus="loop">
											<tr id='${loop.index}$$'
												onclick="setRowId(${objList.estimationID}, ${loop.index}, true);">
												<td class=""><input type="checkbox"
													id="custID${loop.index}" value="${objList.estimationID}"
													onchange="addRowIndex(${loop.index}, ${objList.estimationID})" />
													${objList.estimationID}</td>
												<td>${objList.clientVendorName}:${objList.companyName}</td>
												<td>${objList.timeTotal}</td>

												<td>${objList.expenseTotal}</td>
												<td>${objList.mileageTotal}</td>
												<td>${objList.itemTotal}</td>

												<td>${objList.timeCostTotal}<input type="hidden"
													id="estimatedcname${objList.estimationID}"
													value="${objList.companyName}"> <input
													type="hidden" id="estimatedcvname${objList.estimationID}"
													value="${objList.clientVendorName}">
												</td>
												<td><button class="btn btn-info"
														onclick="editServiceEstimation(${objList.clientVendorID},${objList.estimationID})"
														style="font-size: 11px;">Edit</button>
													<button class="btn btn-info"
														onclick="deleteServiceEstimation(${objList.estimationID})"
														style="font-size: 11px;">Delete</button></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>


							<table style="width: 100%">
								<tr align="center">
									<td>

										<div class="btngroup2-fixed mt-3 text-center"
											style="position: relative;">
											<button class="btn btn-info" style="font-size: 14px;"
												onclick="createInvoice()">
												<spring:message
													code="BzComposer.service.timeexpense.createInvoice" />
											</button>
											<button class="btn btn-info" style="font-size: 14px;"
												id="EditItemBtn">
												<spring:message code="BzComposer.global.close" />
											</button>

										</div>
									</td>
								</tr>


							</table>
						</div>
						<div>
							<input type="hidden" name="tabid" id="tabid" value="" />
						</div>
					</div>
				</div>
			</div>

		</div>
	</form:form>

	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

	<script>

let itemID = 0;
let itemIndex = 0;
let selectedRowIndexs = [];
let clientVendorID=0;
let estimationID=0;
let selectedTimeServiceCartIDs = [];

let selectedExpenseServiceCartIDs = [];
let selectedMileageServiceCartIDs = [];
let selectedItemServiceCartIDs = [];
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
    
	$('#datetimepicker1').datetimepicker({
		 format: 'YYYY-MM-DD HH:mm'
	    	
	});

	 $('#timepicker').datetimepicker({
		   format: 'HH:mm'
		  });

   
});

function initialize(){
	
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
    	if(document.getElementById('0$$') != null){
    		document.getElementById('0$$').className = "even";
    	}
    }
}

$(function() {
    $( "#tabs" ).tabs();
  });

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

$(document).ready(function () 
		{
    
	/*
    $('tr').click(function () 
    		{
         var selected = $(this).hasClass("highlight");
         $("tr").removeClass("highlight");
         if(!selected)
             $(this).addClass("highlight");
           });
   
	 
     */
     
  });

function init(){

    //let row1ID = $('.hideShowSubCatItems')[0].cells[0].innerText;
/*
    if($("#CategoryListTbl tr").length>2){
        $("#CategoryListTbl tr")[2].cells[0].click();
    }
    */
}

function closeCategoryDialog(){
    //$('#AddEditCategoryDlg').dialog('close');
}
function closeItemDialog(){
   // $('#AddEditItemDlg').dialog('close');
}

function setRowIdTimeService(rowid, rowIndex, flag){
    let lSize = document.getElementById("timeServicelSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'ts$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
        tsID = rowid;
           
        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"e$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'e$$').classList.add('draft');
    }
}


function selectAllDialog(){
	event.preventDefault();
	$("#selectAllDialog").dialog({
		
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#custTableBody"
        } ,
     
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}



function updatedSucessdia()
{
	
	 event.preventDefault();
	 $("#updatesuccess").dialog({
 	 	title:'updated',
 	    resizable: false,
 	    height: 200,
 	    width: 500,
 	    modal: true,
 	    buttons: {
 	        "<spring:message code='BzComposer.global.ok' />": function ()
 	        {
 	  
 	            $(this).dialog("close");
 	            return false;
 	        }
 	    }
 	});
		
}
function updateServiceDetails()
{
	

	var timeTotal=document.serviceForm.timeTotal.value;
	
	var expenseTotal=document.serviceForm.expenseTotal.value;
	var mileageTotal=document.serviceForm.mileageTotal.value;
	var itemTotal =document.serviceForm.itemTotal.value;
	var timeCostTotal =document.serviceForm.timeCostTotal.value;
	
	if(timeCostTotal==""||timeCostTotal=="0.00"||expenseAmount=="0.0")
		{
		selectAllDialog();
		}
	

	
	var timeData={
		         "timeTotal":timeTotal,
		         "expenseTotal":expenseTotal,
		         "mileageTotal":mileageTotal,
		          "itemTotal":itemTotal,
		          "timeCostTotal":timeCostTotal
		         
	           };
	
	 var obj=JSON.stringify(timeData);
	//alert("case Event event loaded ..");
  
    $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=updateService&cvId="+clientVendorID+"&TimeIDs="+selectedTimeServiceCartIDs+
        		                                                 "&MileageIDs="+selectedMileageServiceCartIDs+
        		                                                 "&ExpenseIDs="+selectedExpenseServiceCartIDs+
        		                                                 "&ItemIDs="+selectedItemServiceCartIDs,
        data:"data=" + obj+"&estimationID="+estimationID,
        success : function(data)
        {
        	  
        	updatedSucessdia();
        	getTimeServiceData(clientVendorId,estimationID);
            getExpenseServiceData(clientVendorId,estimationID);
            getMileageServiceData(clientVendorId,estimationID);
            getItemServiceData(clientVendorId,estimationID);
            
       },
        error : function(error) 
        {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

	
	
}

function deleteTimeServiceItems()
{
	
	
	
	 $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=deleteTimeServiceItems&cvId="+clientVendorID,
	        data:"data=" + selectedTimeServiceCartIDs,
	        success : function(data)
	        {
	        	getTimeServiceData(clientVendorID,estimationID);
	             
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
	
}


function deleteExpenseServiceItems()
{
	
	//alert("expense Selected =");//+selectedExpenseServiceCartIDs());
			
	
	 $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=deleteExpenseServiceItems&cvId="+clientVendorID,
	        data:"data=" + selectedExpenseServiceCartIDs,
	        success : function(data)
	        {
	        	getExpenseServiceData(clientVendorID,estimationID);
	             
	        	
	             
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
	
}


function getSelectItemsCost(serviceType,selectedServiceCartIDs)
{
	
	if(selectedServiceCartIDs.length>=0)
		{
		
		$.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=CostSelectedServiceItems&cvId="+clientVendorID,
	        data:"data=" + selectedServiceCartIDs,
	        success : function(data)
	        {
	        	if(serviceType==1)
	        		{
	        		var workhours=document.serviceForm.timeTotal.value=data;
	        		 
	        		
	        		}
	        	if(serviceType==2)
        		{
        	document.serviceForm.expenseTotal.value=data;
        		 
        		
        		}
	        	if(serviceType==3)
        		{
        	document.serviceForm.mileageTotal.value=data;
        		 
        		
        		}
	        	if(serviceType==4)
        		{
        	   document.serviceForm.itemTotal.value=data;
        		 
        		}
	        	let timeCost= parseFloat(document.serviceForm.timeTotal.value);
	        	let expenseCost= parseFloat(document.serviceForm.expenseTotal.value);
	        	let mileageCost= parseFloat(document.serviceForm.mileageTotal.value);
	        	let itemCost= parseFloat(document.serviceForm.itemTotal.value);
	        	document.serviceForm.timeCostTotal.value=timeCost+expenseCost+mileageCost+itemCost;
	        
	        },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
		}
}


function deleteMileageServiceItems()
{
	
	 $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=deleteMileageServiceItems&cvId="+clientVendorID,
	        data:"data=" + selectedMileageServiceCartIDs,
	        success : function(data)
	        {
	        	getMileageServiceData(clientVendorID,estimationID);
			        	
	        
	             
	        	
	             
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
	
}

function deleteItemServiceItems()
{
	
	
	
	 $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=deleteItemServiceItems&cvId="+clientVendorID,
	        data:"data=" + selectedItemServiceCartIDs,
	        success : function(data)
	        {
	           	
	        	
	        	getItemServiceData(clientVendorID,estimationID);
	              
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
	
}
/**************************************** Delete Service Items  END ************************************/ 




function getSelectedEmployeeData()
{
	

	  $.ajax({
        type: "GET",
        url:"/employeeData?tabid=getEmpDataEmpid&empId="+document.newCaseForm.companyName.value,
        success:function(data)
        {
        	 document.getElementById("rate").innerHTML = catOptions;	 
        }
	,
    error:function(){
        alert("<bean:message key='BzComposer.common.erroroccurred'/>");
    }
});
}
// cost calculation 


function getAllTimeServiceIDs()
	{
		
		
		selectedTimeServiceCartIDs = [];
	 
	    let tslsize = document.getElementById("timeServicelSize").value;
	  
	        for(i=0; i<tslsize; i++)
	        {
	        	document.getElementById('Time'+i).checked=true;
	        	selectedTimeServiceCartIDs.push(document.getElementById("Time"+i).value);
	        	
	        }
	        
	       
	 
	        getSelectItemsCost(1,selectedTimeServiceCartIDs);
	}
	
	
	function getAllExpenseServiceIDs()
	{
		
		
		selectedExpenseServiceCartIDs = [];
	 
	    let eslsize = document.getElementById("expenseServicelSize").value;
	   
	  
	        for(i=0; i<eslsize; i++)
	        {
	        	document.getElementById('Expense'+i).checked=true;
	        	selectedExpenseServiceCartIDs.push(document.getElementById("Expense"+i).value);
	        	
	        }
	      
	        getSelectItemsCost(2,selectedExpenseServiceCartIDs);
	}
	
	function addRowIndexExpense(rowId,cartID)
	{
		   let isChecked = document.getElementById('Expense'+rowId).checked;
		
		let isFound = false;
	 
	    
	    if(isChecked)
	    	{
					    for(let x=0; x<selectedExpenseServiceCartIDs.length; x++)
					    {
					        if(selectedExpenseServiceCartIDs[x] == cartID)
					        {
					            isFound = true;
					            break;
					        }
					    }
							    if(!isFound)
							    {
							    	selectedExpenseServiceCartIDs.push(cartID);
							    }
	    	}
	    if(!isChecked)
	    {
	        const index = selectedExpenseServiceCartIDs.indexOf(cartID);
	        if (index > -1) 
	        {
	        	selectedExpenseServiceCartIDs.splice(index, 1);
	        
	        }
	    }
	
	    getSelectItemsCost(2,selectedExpenseServiceCartIDs);
	}
	
	
	function getAllMileageServiceIDs()
	{
		
		
		selectedMileageServiceCartIDs = [];
	 
	    let mslsize = document.getElementById("mileageServicelSize").value;
	   
	  
	        for(i=0; i<mslsize; i++)
	        {
	        	document.getElementById('Mileage'+i).checked=true;
	        	selectedMileageServiceCartIDs.push(document.getElementById("Mileage"+i).value);
	        	
	        }
	      
	        getSelectItemsCost(3,selectedMileageServiceCartIDs);
	}
	
	function addRowIndexMileage(rowId,cartID)
	{
		   let isChecked = document.getElementById('Mileage'+rowId).checked;
		
		let isFound = false;
	 
	    
	    if(isChecked)
	    	{
					    for(let x=0; x<selectedMileageServiceCartIDs.length; x++)
					    {
					        if(selectedMileageServiceCartIDs[x] == cartID)
					        {
					            isFound = true;
					            break;
					        }
					    }
							    if(!isFound)
							    {
							    	selectedMileageServiceCartIDs.push(cartID);
							    }
	    	}
	    if(!isChecked)
	    {
	        const index = selectedMileageServiceCartIDs.indexOf(cartID);
	        if (index > -1) 
	        {
	        	selectedMileageServiceCartIDs.splice(index, 1);
	        
	        }
	    }
	    getSelectItemsCost(3,selectedMileageServiceCartIDs);
	}
	

	function getAllItemServiceIDs()
	{
		
		
		selectedItemServiceCartIDs = [];
	 
	    let islsize = document.getElementById("itemServicelSize").value;
	   
	  
	        for(i=0; i<islsize; i++)
	        {
	        	document.getElementById('Item'+i).checked=true;
	        	selectedItemServiceCartIDs.push(document.getElementById("Item"+i).value);
	        	
	        }
	        getSelectItemsCost(4,selectedItemServiceCartIDs);
	}
	
	function addRowIndexItem(rowId,cartID)
	{
		   let isChecked = document.getElementById('Item'+rowId).checked;
		
		let isFound = false;
	 
	    
	    if(isChecked)
	    	{
					    for(let x=0; x<selectedItemServiceCartIDs.length; x++)
					    {
					        if(selectedItemServiceCartIDs[x] == cartID)
					        {
					            isFound = true;
					            break;
					        }
					    }
							    if(!isFound)
							    {
							    	selectedItemServiceCartIDs.push(cartID);
							    }
	    	}
	    if(!isChecked)
	    {
	        const index = selectedItemServiceCartIDs.indexOf(cartID);
	        if (index > -1) 
	        {
	        	selectedItemServiceCartIDs.splice(index, 1);
	        
	        }
	    }
	    getSelectItemsCost(4,selectedItemServiceCartIDs);
	
	}
	function addRowIndexTime(rowId,cartID)
	{
		  
		   let isChecked = document.getElementById('Time'+rowId).checked;
		
		
		let isFound = false;
	 
	    
	    if(isChecked)
	    	{
	    	
	    	
					    for(let x=0; x<selectedTimeServiceCartIDs.length; x++)
					    {
					        if(selectedTimeServiceCartIDs[x] == cartID)
					        {
					            isFound = true;
					            break;
					        }
					    }
							    if(!isFound)
							    {
							    	selectedTimeServiceCartIDs.push(cartID);
							    }
	    	}
	    if(!isChecked)
	    {
	        const index = selectedTimeServiceCartIDs.indexOf(cartID);
	        if (index > -1) 
	        {
	        	selectedTimeServiceCartIDs.splice(index, 1);
	        
	        }
	    }
	   
	    getSelectItemsCost(1,selectedTimeServiceCartIDs);
	
	}





// end cost cal
//get all service tables data

function getTimeServiceData(clientVendorID,estimationID)
{
	
	  $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=getEstimatedTimeservice&cvId="+clientVendorID,
	        data:"estimationID="+estimationID,
	        success : function(data)
	        {
	        	
	        	
	        	$('#timeServiceTableBody').html('');
	        	var timeServiceTable = "<input type='hidden' name='timeServicelistSize' id='timeServicelSize' value='"+data.length+"'>";
	            for(var i=0; i<data.length; i++)
	            {
	                var objList = data[i];
	               if(objList.estimationID==estimationID)
	                {
	            	  
	            	   
	            	   timeServiceTable =  timeServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
	                    +"<td><input type=checkbox id=Time"+i+" value='"+ objList.cartID+"' onchange='addRowIndexTime("+i+","+objList.cartID+")' checked /> "
	                    +objList.cartID+"</td>"+"<td>"+objList.cartID+"</td><td>"+objList.empName+"</td><td>"+objList.empServiceID+"</td><td>"+objList.emphours+"</td><td>"+objList.emprate+"</td><td>"
	                    +objList.emptotal+"</td><td>"+objList.empdescription+"</td></tr>";
	                  
	                    selectedTimeServiceCartIDs.push(objList.cartID);
	                    getSelectItemsCost(1,selectedTimeServiceCartIDs);
	              
	                }
	               else
	            	   {
	            	 //  alert(" time:in chart Sandip Here"+objList.cartID);
	            	   timeServiceTable =  timeServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
	                    +"<td><input type=checkbox id=Time"+i+" value='"+ objList.cartID+"' onchange='addRowIndexTime("+i+","+objList.cartID+")'/> "
	                    +objList.cartID+"</td>"+"<td>"+objList.cartID+"</td><td>"+objList.empName+"</td><td>"+objList.empServiceID+"</td><td>"+objList.emphours+"</td><td>"+objList.emprate+"</td><td>"
	                    +objList.emptotal+"</td><td>"+objList.empdescription+"</td></tr>";
	                    
	            	   }
	               
	            }
	            
	            $('#timeServiceTableBody').html(timeServiceTable);
	          
	       },
	        error : function(error) {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	       }
	   });
	
	
}

function getExpenseServiceData(clientVendorID,estimationID)
{


	  $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=getEstimatedExpenseservice&cvId="+clientVendorID,
	        data:"estimationID="+estimationID,
	        success : function(data)
	        {
	        	//alert("expense="+data.length);
	
		        	$('#expenseServiceTableBody').html('');
		        	var ServiceTable = "<input type='hidden' name='expenseServicelistSize' id='expenseServicelSize' value='"+data.length+"'>";
		            for(var i=0; i<data.length; i++)
		            {
		                var objList = data[i];
		                     
		              //  alert(objList.expenseAmount);
		                // alert(objList.expenseMemo);
		                 if(objList.estimationID==estimationID)
	                {
		                ServiceTable=  ServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowId("+objList.cartID+", "+i+",true)' >"
		                    +"<td><input type=checkbox id=Expense"+i+" value='"+ objList.cartID+"' onchange='addRowIndexExpense("+i+","+objList.cartID+")' checked /> "
		                    +objList.cartID+"</td><td>"+objList.expenseDate+"</td><td>"+objList.accName+"</td><td>"+objList.expenseMemo+"</td><td>"
		                    +objList.expenseAmount+"</td></tr>";
		                
	                    selectedExpenseServiceCartIDs.push(objList.cartID);
	                    getSelectItemsCost(2,selectedExpenseServiceCartIDs);
		              
	                }else
	                	{
	                	ServiceTable=  ServiceTable + "<tr id='"+i+"ts$$'   onclick='setRowId("+objList.cartID+", "+i+",true)' >"
	                    +"<td><input type=checkbox id=Expense"+i+" value='"+ objList.cartID+"' onchange='addRowIndexExpense("+i+","+objList.cartID+")'/> "
	                    +objList.cartID+"</td><td>"+objList.expenseDate+"</td><td>"+objList.accName+"</td><td>"+objList.expenseMemo+"</td><td>"
	                    +objList.expenseAmount+"</td></tr>";
	                	
	                	}
		                 
		            }
		            
		            $('#expenseServiceTableBody').html(ServiceTable);	
		        	
	       },
	        error : function(error)
	        {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	        }
	    });
	  }
	
function getMileageServiceData(clientVendorID,estimationID)
{


	  $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=getEstimatedMileageService&cvId="+clientVendorID,
	        data:"estimationID="+estimationID,
	        success : function(data)
	        {
	        	
	        	
	           	
			   	$('#mileageServiceTableBody').html('');
			   	var ServiceTable = "<input type='hidden' name='mileageServicelistSize' id='mileageServicelSize' value='"+data.length+"'>";
			       for(var i=0; i<data.length; i++){
			           var objList = data[i];
			          
			           if(objList.estimationID==estimationID)
		                {
			           ServiceTable=  ServiceTable + "<tr id='"+i+"ms$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
			               +"<td><input type=checkbox id=Mileage"+i+" value='"+ objList.cartID+"' onchange='addRowIndexMileage("+i+","+objList.cartID+")' checked/> "
			               +objList.cartID+"</td><td>"+objList.mileageDate+"</td><td>"+objList.invName+"</td><td>"+objList.miles+"</td><td>"+objList.milesRate+"</td><td>"
			     +objList.mileageAmount+"</td><td>"+objList.mileageMemo+"</td></tr>";
			           selectedMileageServiceCartIDs.push(objList.cartID);
	                    getSelectItemsCost(3,selectedMileageServiceCartIDs);
			           
		                }
			           else
			        	   {
			        	   ServiceTable=  ServiceTable + "<tr id='"+i+"ms$$'   onclick='setRowIdTimeService("+objList.cartID+", "+i+",true)' >"
			               +"<td><input type=checkbox id=Mileage"+i+" value='"+ objList.cartID+"' onchange='addRowIndexMileage("+i+","+objList.cartID+")'/> "
			               +objList.cartID+"</td><td>"+objList.mileageDate+"</td><td>"+objList.invName+"</td><td>"+objList.miles+"</td><td>"+objList.milesRate+"</td><td>"
			     +objList.mileageAmount+"</td><td>"+objList.mileageMemo+"</td></tr>";
			        	   
			        	   }
			       }
			       
			       $('#mileageServiceTableBody').html(ServiceTable);
			        
		   
	       },
	        error : function(error)
	        {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	        }
	    });
	  }
	
	
function getItemServiceData(clientVendorID,estimationID)
{

	  $.ajax({
	        type: "POST",
	        url:"ServiceAjax?tabid=getEstimatedItemService&cvId="+clientVendorID,
	        data:"estimationID="+estimationID,
	        success : function(data)
	        {
	        	
	        
			   	$('#itemServiceTableBody').html('');
			   	var ServiceTable = "<input type='hidden' name='itemServicelistSize' id='itemServicelSize' value='"+data.length+"'>";
			       for(var i=0; i<data.length; i++)
			       {
			           var objList = data[i];
			           if(objList.estimationID==estimationID)
			        	   {
			           ServiceTable=  ServiceTable + "<tr id='"+i+"is$$'   onclick='setRowIdItemService("+objList.cartID+", "+i+",true)' >"
		               +"<td><input type=checkbox id=Item"+i+" value='"+ objList.cartID+"' onchange='addRowIndexItem("+i+","+objList.cartID+")'  checked/> "
		               +objList.cartID+"</td><td>"+objList.itemDate+"</td><td>"+objList.invName+"</td><td>"+objList.itemMemo+"</td><td>"+objList.itemQty+"</td><td>"+objList.itemUnitPrice+"</td><td>"
		           +objList.itemAmount+"</td></tr>";
			           selectedItemServiceCartIDs.push(objList.cartID);
	                    getSelectItemsCost(4,selectedItemServiceCartIDs);
			          
			        	   }
			           else
			        	   {
			        	   ServiceTable=  ServiceTable + "<tr id='"+i+"is$$'   onclick='setRowIdItemService("+objList.cartID+", "+i+",true)' >"
			               +"<td><input type=checkbox id=Item"+i+" value='"+ objList.cartID+"' onchange='addRowIndexItem("+i+","+objList.cartID+")' /> "
			               +objList.cartID+"</td><td>"+objList.itemDate+"</td><td>"+objList.invName+"</td><td>"+objList.itemMemo+"</td><td>"+objList.itemQty+"</td><td>"+objList.itemUnitPrice+"</td><td>"
			           +objList.itemAmount+"</td></tr>";
			        	   }
			       }
			       
			       $('#itemServiceTableBody').html(ServiceTable);
			        
		        	
	       },
	        error : function(error)
	        {
	            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
	        }
	    });
	  }
	
	
	



// updation edit delete 



function editServiceEstimation(clientVendorId,estimationId)
{

	 event.preventDefault();
	 $("#editdialogbox").dialog({
	 	title:'Edit Service Activity',
	    resizable: false,
	    height: 200,
	    width: 500,
	    modal: true,
	    buttons: {
	        "<spring:message code='BzComposer.global.ok' />": function ()
	        { $(this).dialog("close");
	        	
	        	
	              clientVendorID=clientVendorId;
	              estimationID=estimationId;
	              
	        	getTimeServiceData(clientVendorId,estimationID);
	             getExpenseServiceData(clientVendorId,estimationID);
	             getMileageServiceData(clientVendorId,estimationID);
	              getItemServiceData(clientVendorId,estimationID);
	              
	              
	              var cname = document.getElementById('estimatedcname'+estimationID).value;
	              var cvname = document.getElementById('estimatedcvname'+estimationID).value;
	             $("#serviceCustomerName").html("   :"+cname+"("+cvname+")");              
	        	
	             $( "#editServiceItemDlgId").dialog({
	                 height: 810,
	                 width: 1250,
	                 modal: true,
	                 title: 'Update Time & Expense Activity'
	              });	
	        	
	       
	            
	        },
	        "<spring:message code='BzComposer.global.cancel' />": function () {
	            $(this).dialog("close");
	            return false;
	        }
	    }
	});
	
}


function createInvoice()
{
	
	event.preventDefault();
	if(itemID==0)
		{
		alert("First Select Customer Job");
		return false;
		}
	
	window.location = "serviceInvoice?tabid=createInvoice&estimationID="+itemID;
	
}
function deleteServiceEstimation(estimationID)
{
	//selectcategorydialog();
	
	 event.preventDefault();
	 $("#deletedialogbox").dialog({
 	 	title:'Delete Item',
 	    resizable: false,
 	    height: 200,
 	    width: 500,
 	    modal: true,
 	    buttons: {
 	        "<spring:message code='BzComposer.global.ok' />": function ()
 	        {
 	           

 	 		  $.ajax({
 	 		        type: "POST",
 	 		        url:"ServiceAjax?tabid=deleteEstimation&estimationID="+estimationID,
 	 		        data:"clientVendorID="+estimationID,
 	 		        success : function(data)
 	 		        {
 	 		        	
 	 		        	 location.reload();
 	 		          
 	 		       },
 	 		        error : function(error) {
 	 		            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
 	 		       }
 	 		   });
 	 		
 	            
 	        },
 	        "<spring:message code='BzComposer.global.cancel' />": function () {
 	            $(this).dialog("close");
 	            return false;
 	        }
 	    }
 	});
	
		
	
}

function ItemChange(value)
{
	

var size = document.getElementById('itemSize').value;
var count;
for(count=0;count<size;count++)
{
    var invID = document.getElementById(count+'inventoryId').value;
			    if(value==invID)
			    	{
				 var qty = 1;
				 var amt;
							var uprice = document.getElementById(count+'itemprice').value;
							var desc = document.getElementById(count+'itemdesc').value;
							
							document.serviceForm.itemMemo.value=desc;
							
							document.serviceForm.itemQty.value=qty;				
							document.serviceForm.itemUnitPrice.value=uprice;
							
							amt=((qty/1)*(uprice/1)).toFixed(2);
							document.serviceForm.itemAmount.value=amt;
				
			      }
}

}

function  empChange(value)
{


	var size = document.getElementById('EmpSize').value;
	
	var count;
	for(count=0;count<size;count++)
	{
	    var employeeIndexId= document.getElementById(count+'employeeIndexId').value;
				    if(value==employeeIndexId)
				    	{
				    
					 var qty = "01:00";
					 var amt;
								var uprice = document.getElementById(count+'empamount').value;
								var desc = document.getElementById(count+'empdesc').value;
								
								document.serviceForm.empdescription.value=desc;
								
								document.serviceForm.emphours.value=qty;				
								document.serviceForm.emprate.value=uprice;
								
								
								document.serviceForm.emptotal.value=uprice;
				      }
	}

	
}


function mileageItemChange(value)
{
	
	var size = document.getElementById('itemSize').value;
	var count;
	for(count=0;count<size;count++)
	{
	    var invID = document.getElementById(count+'inventoryId').value;
				    if(value==invID)
				    	{
					 var qty = 1;
					 var amt;
								var uprice = document.getElementById(count+'itemprice').value;
								var desc = document.getElementById(count+'itemdesc').value;
								
								document.serviceForm.mileageMemo.value=desc;
								
								document.serviceForm.miles.value=qty;				
								document.serviceForm.milesRate.value=uprice;
								
								amt=((qty/1)*(uprice/1)).toFixed(2);
								document.serviceForm.mileageAmount.value=amt;
					
				      }
	}

	}
	
	
	
	function mileageMultiplication()
	{
		var amt,qty,rate;
		qty=document.serviceForm.miles.value;
	    rate=document.serviceForm.milesRate.value;
		document.serviceForm.mileageAmount.value=qty*rate;
		
	}
	function empMultiplication()
	{
		let amt=0.0,qty,rate;
		qty=document.serviceForm.emphours.value;
		const myArray = qty.split(':');
		var hr=Number(myArray[0]).toString();
		let min=myArray[1];
		var min2=parseInt(min);
		
		let totalmin=(hr*60.00);
		totalmin=totalmin+min2;
	     rate=document.serviceForm.emprate.value;
	      let permin=(rate/60.00);
	     amt=permin*totalmin;
		document.serviceForm.emptotal.value=amt.toFixed(2);
	}
	function itemMultiplication()
	{	
		var amt,qty,rate;
		qty=document.serviceForm.itemQty.value;
	    rate=document.serviceForm.itemAmount.value;
		document.serviceForm.itemAmount.value=qty*rate;
		
	}
	
	
	function accountChange(value)
	{
		
		
		var size = document.getElementById('accountItemSize').value;


		var count;
		for(count=0;count<size;count++)
		{
		    var accountId = document.getElementById(count+'accountId').value;
					    if(value==accountId)
					    	{
					    	
					    	var desc = document.getElementById(count+'accountdesc').value;
					    	document.serviceForm.expenseMemo.value=desc;
					    	}
		}
	}
	
	
//////////////////////// add  new item in estimation /////////////////////////////////////////


function saveExpenseServiceData()
{	
	
	let cartsize=0;
	var ServiceTable2="";
	var ServiceTable="";
	var expenseMemo=document.serviceForm.expenseMemo.value;
	
	var expenseItemID=document.serviceForm.expenseItemID.value;
	var expenseDate=document.serviceForm.expenseDate.value;
	var expenseAmount =document.serviceForm.expenseAmount.value;
	
	if(expenseItemID==""||expenseDate==""||expenseAmount=="")
		{
		selectAllDialog();
		
		}
	
	var timeData={
		         "expenseItemID":expenseItemID,
		         "expenseDate":expenseDate,
		        
		          "expenseAmount":expenseAmount,
		          "expenseMemo":expenseMemo
	      
	           };
	 var obj=JSON.stringify(timeData);
	//alert("case Event event loaded ..");
	
	
	
  
    $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=saveExpenseService&cvId="+clientVendorID,
        data:"data=" + obj,
        success : function(data)
        {
        	getExpenseServiceData(clientVendorID,estimationID);
            
            
         
       },
        
       error : function(error)
        {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
       
   });
    
   

}

function saveMileageServiceData()
{
	
   var mileageMemo=document.serviceForm.mileageMemo.value;
     var miles=document.serviceForm.miles.value;
     var milesRate=document.serviceForm.milesRate.value;
	var mileageItemID=document.serviceForm.mileageItemID.value;
	var mileageDate=document.serviceForm.mileageDate.value;
	var mileageAmount =document.serviceForm.mileageAmount.value;
	
	if(milesRate==""||miles==""||mileageItemID==""||mileageAmount=="")
		{
		selectAllDialog();
		
		}
	
	
	var timeData={
	         "mileageItemID":mileageItemID,
	         "mileageDate":mileageDate,
	          "miles":miles,
	         "milesRate":milesRate,
	          "mileageAmount":mileageAmount,
	          "mileageMemo":mileageMemo
     
          };
var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

				$.ajax({
				   type: "POST",
				   url:"ServiceAjax?tabid=saveMileageService&cvId="+clientVendorID,
				   data:"data=" + obj,
				   success : function(data)
				   {
				   	
					   getMileageServiceData(clientVendorID,estimationID);
				        
				  },
				   error : function(error) 
				   {
				       alert("<bean:message key='BzComposer.common.erroroccurred'/>");
				  }
				});
				

}
function saveTimeServiceData()
{
	
var description=document.serviceForm.empdescription.value;
	
	var workhours=document.serviceForm.emphours.value;			
	var emprate=document.serviceForm.emprate.value;
	var empServiceID=document.serviceForm.empServiceID.value;
	var empID=document.serviceForm.empID.value;
	var empWorkDate=document.serviceForm.empWorkDate.value;
	var emptotal =document.serviceForm.emptotal.value;
	
	if(empWorkDate==""||workhours==""||empID==""||emprate=="")
		{
		selectAllDialog();
		
		}
	
	var timeData={
		         "empID":empID,
		         "empWorkDate":empWorkDate,
		         "empServiceID":empServiceID,
		         "workhours":workhours,
		         "emprate":emprate,
		          "emptotal":emptotal,
		          "description":description
	      
	           };
	 var obj=JSON.stringify(timeData);
	//alert("case Event event loaded ..");
  
    $.ajax({
        type: "POST",
        url:"ServiceAjax?tabid=saveTimeservice&cvId="+clientVendorID,
        data:"data=" + obj,
        success : function(data)
        {
        	
        	getTimeServiceData(clientVendorID,estimationID);
        	
        	
             
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}
function saveItemServiceData()
{
	
	var itemDate=document.serviceForm.itemDate.value;	 	
   
     var itemQty=document.serviceForm.itemQty.value;
     var itemUnitPrice=document.serviceForm.itemUnitPrice.value;
	var itemID=document.serviceForm.itemID.value;
	var itemAmount =document.serviceForm.itemAmount.value;

	var itemMemo=document.serviceForm.itemMemo.value;

	
	
	if(itemID==""|| itemDate==""||itemQty==""||itemAmount=="")
		{
		selectAllDialog();
		
		}
	
	
	var timeData={
	         "itemDate":itemDate,
	         "itemID":itemID,
	          "itemQty":itemQty,
	         "itemUnitPrice":itemUnitPrice,
	          "itemAmount":itemAmount,
	          "itemMemo":itemMemo,
	          
	          
	          
     
          };
var obj=JSON.stringify(timeData);
//alert("case Event event loaded ..");

				$.ajax({
				   type: "POST",
				   url:"ServiceAjax?tabid=saveItemService&cvId="+clientVendorID,
				   data:"data=" + obj,
				   success : function(data)
				   {
				   	
				   	
					   getItemServiceData(clientVendorID,estimationID);
				        
				  },
				   error : function(error) {
				       alert("<bean:message key='BzComposer.common.erroroccurred'/>");
				  }
				});

}

function closeAddDialog()
{
	$("#editServiceItemDlgId").hide();
	location.reload();
	
	}


	///end  new item in Estimation ////////////////////////////////////////////////
	
function selectcategorydialog(){
    event.preventDefault();
    $("#selectcategorydialog").dialog({
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
function selectitemdialog(){
    event.preventDefault();
    $("#selectitemdialog").dialog({
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

</script>

</body>
</html>
<script>
function initialize(){
    let lSize = document.getElementById("lSize").value;
    if(lSize > 0){
        document.getElementById('0$$').className = "even";
    }
}
</script>


<!--  Edit time Cost  -->
<div class="container-fluid" id="editServiceItemDlgId"
	style="display: none;">
	<div class="form1">

		<h5 style="color: #05A9C5;">
			<b> <spring:message code="BzComposer.service.timeandcostfor" /></b>
			<label id="serviceCustomerName"></label>
		</h5>

		<form:form name="serviceForm" method="post"
			modelAttribute="serviceDto">
			<div class="form-horizontal">

				<div id="product">
					<table class="tabla-listados" cellspacing="0">
						<thead>
							<tr>

								<td>
									<div id="tabs" style="height: auto;">
										<ul>
											<li style="font-size: 12px;"><a href="#timeTab"><spring:message
														code="BzComposer.service.Time" /> <form:input
														style="font-weight:bold ; font-size:12px" path="timeTotal"
														value="0.00" /></a></li>
											<li style="font-size: 12px;"><a href="#expensesTab"><spring:message
														code="BzComposer.service.Expenses" /> <form:input
														style="font-weight:bold ; font-size:12px"
														path="expenseTotal" value="0.00" /></a></li>
											<li style="font-size: 12px;"><a href="#mileageTab"><spring:message
														code="BzComposer.service.Mileage" /> <form:input
														style="font-weight:bold ; font-size:12px "
														path="mileageTotal" value="0.00" /></a></li>
											<li style="font-size: 12px;"><a href="#itemsTab"><spring:message
														code="BzComposer.service.Items" /> <form:input
														style="font-weight:bold ; font-size:12px" path="itemTotal"
														value="0.00" /></a></li>
										</ul>


										<!--         Time dialog tab start  -->



                                                  <div id="EmpDetails">
											<input type="hidden" name="EmpSize" id="EmpSize"
												value='${empList.size()}'>
											<c:forEach items="${empList}" var="objList" varStatus="loop">
												<input type="hidden" value='${objList.employeeIndexId}'
													id='${loop.index}employeeIndexId' />
												<input type="hidden" value='${objList.firstName}'
													id='${loop.index}firstName' />
												<input type="hidden" value='${objList.lastName}'
													id='${loop.index}lastName' />
													<input type="hidden" value='${objList.amount}'
													id='${loop.index}empamount' />

												<input type="hidden" value='${objList.detail}'
													id='${loop.index}empdesc' />
												
												
											</c:forEach>
										</div>
										<div id="timeTab" style="display: none;">
											<table class="table-notifications" width="100%">
												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.time.info" /></th>
													</tr>
												</thead>
												<tr valign="center" style="width: 100%;">


													<td style="font-size: 12px; width: 10%"><spring:message
															code="BzComposer.service.time.date" /></td>

													<td style="font-size: 12px; width: 20%"><spring:message
															code="BzComposer.service.time.employee" /></td>
															
															
															<td style="font-size: 12px; width: 20%"><spring:message
																	code="BzComposer.service.time.serviceName" /></td>

													<td style="font-size: 12px; width: 10%"><spring:message
															code="BzComposer.service.time.hours" /></td>


													<td style="font-size: 12px; width: 5%"><spring:message
															code="BzComposer.service.time.rate" /></td>
													<td style="font-size: 12px; width: 5%"><spring:message
															code="BzComposer.service.time.amount" /></td>
													<td style="font-size: 12px; width: 20%"><spring:message
															code="BzComposer.service.time.description" /></td>
													<td></td>

												</tr>

												<tr>
													<td style="font-size: 12px;"><form:input
															path="empWorkDate" readonly="true"  size="10px"/> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.empWorkDate,'mm-dd-yyyy',this);">
													</td>

													<td>
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="empID"
																	onchange="empChange(this.value);" >
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${empList}" var="empList">
																		<c:if test="${not empty empList}">
																			<form:option value='${empList.employeeIndexId}'>&nbsp;&nbsp;&nbsp;&nbsp;${empList.firstName} ${empList.lastName}</form:option>
																		</c:if>

																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>
													
													<td>
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="empServiceID"
																	>
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${ServiceItemList}" var="itmList">
																		<c:if test="${itmList.iscategory == false}">
																			<form:option value='${itmList.inventoryId}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.itemCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.iscategory == true}">
																			<form:option value='01'>${itmList.itemCode}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>
													<td>

														<div class='input-group date' id='timepicker'>
															<form:input path="emphours" size="10px" oninput="empMultiplication()"  onchange="empMultiplication() "  onmouseup="empMultiplication()" />
															<span class="input-group-addon" onclick="empMultiplication()" ><span
																class="glyphicon glyphicon-time" onclick="empMultiplication()"></span>
															</span>
														</div>
													</td>

													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" id="td12">
															<form:input path="emprate" 
																style="text-align: right;" size="10px" />
														</div>
														<div id="SaveUnitPrice" title="Update unit price"
															style="display: none;" size="10px">
															<p>
																<spring:message
																	code="BzComposer.invoice.saveItemUnitPrice" />
															</p>
														</div>
													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="emptotal" size="10px" readonly="true"
																style="text-align: right;" id="amount_id" />
														</div>
													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="empdescription" size="10px"
																readonly="false" style="text-align: left;" />
														</div>
													</td>

													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveTimeServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>

											</table>

											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllTimeServiceIDs();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteTimeServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>

											</table>

											<div style="width: 100%;" align="center">

												<table id="timeServiceTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">
													<thead>
														<tr valign="center" style="width: 100%;">

															<th
																style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																	code="BzComposer.service.time.use" /></th>
															<th style="font-size: 12px; width: 15%"><spring:message
																	code="BzComposer.service.time.date" /></th>

															<th style="font-size: 12px; width: 20%"><spring:message
																	code="BzComposer.service.time.employee" /></th>
																	<th style="font-size: 12px; width: 20%"><spring:message
																	code="BzComposer.service.time.serviceName" /></th>

															<th style="font-size: 12px; width: 10%"><spring:message
																	code="BzComposer.service.time.hours" /></th>


															<th style="font-size: 12px; width: 10%"><spring:message
																	code="BzComposer.service.time.rate" /></th>
															<th style="font-size: 12px; width: 10%"><spring:message
																	code="BzComposer.service.time.amount" /></th>
															<th style="font-size: 12px; width: 30%"><spring:message
																	code="BzComposer.service.time.description" /></th>

														</tr>
													</thead>

													<tbody id="timeServiceTableBody">
														
													</tbody>
												</table>

											</div>


										</div>


										<!--         Time tab end  -->


										<!--   items  start  -->
										<div id="ItemDetails">
											<input type="hidden" name="ItemSize" id="itemSize"
												value='${ServiceItemList.size()}'>
											<c:forEach items="${ServiceItemList}" var="objList"
												varStatus="loop">
												<input type="hidden" value='${objList.inventoryId}'
													id='${loop.index}inventoryId' />
												<input type="hidden" value='${objList.qty}'
													id='${loop.index}q' />
												<input type="hidden" value='${objList.itemCode}'
													id='${loop.index}itemCode' />

												<input type="hidden" value='${objList.inventoryDescription}'
													id='${loop.index}itemdesc' />
												<input type="hidden" value='${objList.salePrice}'
													id='${loop.index}itemprice' />

											</c:forEach>
										</div>
										<div id="itemsTab" style="display: none;">
											<table class="table-notifications" width="100%">


												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.item.info" /></th>
													</tr>
												</thead>

												<tr>
													<td><spring:message
															code="BzComposer.service.time.date" /></td>

													<td><spring:message
															code="BzComposer.service.items.item" /></td>
													<td><spring:message
															code="BzComposer.service.time.description" /></td>
													<td><spring:message
															code="BzComposer.service.items.qty" /></td>


													<td><spring:message
															code="BzComposer.service.time.rate" /></td>
													<td><spring:message
															code="BzComposer.service.time.amount" /></td>

													<td></td>
												</tr>
												<tr>
													<td style="font-size: 12px;"><form:input
															path="itemDate" readonly="true" size="15" /> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.itemDate,'mm-dd-yyyy',this);">
													</td>

													<td>
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="itemID"
																	onchange="ItemChange(this.value);" id="itemID">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${ServiceItemList}" var="itmList">
																		<c:if test="${itmList.iscategory == false}">
																			<form:option value='${itmList.inventoryId}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.itemCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.iscategory == true}">
																			<form:option value='01'>${itmList.itemCode}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>
													<td><form:input path="itemMemo" size="20px" /></td>
													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" style="display:block;"
															id="td5">
															<form:input path="itemQty" class="minutesInput"
																style="text-align: right;" min="1" size="10" id="qty_id"
																oninput="itemMultiplication();"
																onkeypress="return numbersonly(event,this.value);" />
														</div>
														<div id=ReceivableListDto title="Update quantity"
															style="display: none;">
															<p>
																<spring:message
																	code="BzComposer.invoice.saveItemQuantity" />
															</p>
														</div>
													</td>

													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" id="td12">
															<form:input path="itemUnitPrice" size="10"
																style="text-align: right;" onclick="saveOldValue();"
																onchange="return saveNewUnitPrice();"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>

													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="itemAmount" size="10" readonly="true"
																style="text-align: right;" id="amount_id"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>
													</td>

													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveItemServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>
											</table>



											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllItemServiceIDs()();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteItemServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>
											</table>

											<div style="width: 100%;" align="center">

												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">


													<tr valign="center" style="width: 100%;">


														<th
															style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																code="BzComposer.service.time.use" /></th>
														<th><spring:message
																code="BzComposer.service.time.date" /></th>

														<th><spring:message
																code="BzComposer.service.items.item" /></th>
														<th><spring:message
																code="BzComposer.service.time.description" /></th>
														<th><spring:message
																code="BzComposer.service.items.qty" /></th>


														<th><spring:message
																code="BzComposer.service.time.rate" /></th>
														<th><spring:message
																code="BzComposer.service.time.amount" /></th>

													</tr>


													<tbody id="itemServiceTableBody">

													</tbody>
												</table>

											</div>


										</div>


										<!--   items   end  -->


										<!-- expense start -->
										<div id="accountDetails">
											<input type="hidden" name="accountItemSize"
												id="accountItemSize" value='${acclist.size()}'>
											<c:forEach items="${acclist}" var="objList" varStatus="loop">
												<input type="hidden" value='${objList.accountId}'
													id='${loop.index}accountId' />
												<input type="hidden" value='${objList.description}'
													id='${loop.index}accountdesc' />

											</c:forEach>
										</div>

										<div id="expensesTab" style="display: none;">
											<table class="table-notifications" width="100%">

												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.expense.info" /></th>
													</tr>
												</thead>
												<tr valign="center" style="width: 100%;">



													<td><spring:message
															code="BzComposer.service.time.date" /></td>

													<td><spring:message
															code="BzComposer.service.expense.payee" /></td>
													<td><spring:message
															code="BzComposer.service.expense.memo" /></td>

													<td><spring:message
															code="BzComposer.service.time.amount" /></td>

												</tr>

												<tr>


													<td style="font-size: 12px;"><form:input
															path="expenseDate" readonly="true" size="15" /> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.expenseDate,'mm-dd-yyyy',this);">
													</td>

													<td>
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="expenseItemID"
																	onchange="accountChange(this.value);">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${acclist}" var="accListobj">

																		<form:option value='${accListobj.accountId}'>&nbsp;&nbsp;&nbsp;&nbsp;${accListobj.name}</form:option>

																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>


													<td><form:input path="expenseMemo" size="20px" /></td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="expenseAmount" size="10"
																readonly="false" style="text-align: right;"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>
													</td>


													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveExpenseServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>
											</table>
											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllExpenseServiceIDs();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteExpenseServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>

											</table>
											<div style="width: 100%;" align="center">

												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">

													<tr valign="center" style="width: 100%;">


														<th
															style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																code="BzComposer.service.time.use" /></th>
														<th><spring:message
																code="BzComposer.service.time.date" /></th>

														<th><spring:message
																code="BzComposer.service.expense.payee" /></th>
														<th><spring:message
																code="BzComposer.service.expense.memo" /></th>

														<th><spring:message
																code="BzComposer.service.time.amount" /></th>

													</tr>


													<tbody id="expenseServiceTableBody">

													</tbody>
												</table>

											</div>


										</div>

										<!--  expense  end-->



										<!--  Mileage  start -->
										<div id="mileageTab" style="display: none;">
											<table class="table-notifications" width="100%">
												<thead>
													<tr>
														<th colspan="14" style="font-size: 14px;"><spring:message
																code="BzComposer.service.mileage.info" /></th>
													</tr>
												</thead>

												<tr valign="center" style="width: 100%;">




													<td><spring:message
															code="BzComposer.service.time.date" /></td>
													<td><spring:message
															code="BzComposer.service.items.item" /></td>
													<td><spring:message
															code="BzComposer.service.mileage.miles" /></td>
													<td><spring:message
															code="BzComposer.service.time.rate" /></td>
													<td><spring:message
															code="BzComposer.service.time.amount" /></td>
													<td><spring:message
															code="BzComposer.service.mileage.notes" /></td>


												</tr>
												<tr>

													<td style="font-size: 12px;"><form:input
															path="mileageDate" readonly="true" size="15" /> <img
														src="${pageContext.request.contextPath}/images/cal.gif"
														onclick="displayCalendar(document.serviceForm.mileageDate,'mm-dd-yyyy',this);">
													</td>

													<td style="font-size: 12px;">
														<div id="itemDiv">
															<div id="itemDiv">
																<form:select path="mileageItemID"
																	onchange="mileageItemChange(this.value);">
																	<form:option value="0">
																		<spring:message code="BzComposer.ComboBox.Select" />
																	</form:option>
																	<c:forEach items="${ServiceItemList}" var="itmList">
																		<c:if test="${itmList.iscategory == false}">
																			<form:option value='${itmList.inventoryId}'>&nbsp;&nbsp;&nbsp;&nbsp;${itmList.itemCode}</form:option>
																		</c:if>
																		<c:if test="${itmList.iscategory == true}">
																			<form:option value='01'>${itmList.itemCode}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</td>

													<td style="font-size: 12px;">
														<div style="padding-top: 0px;" style="display:block;"
															id="td5">
															<form:input path="miles" class="minutesInput"
																style="text-align: right;" min="1" type="text" size="10"
																id="qty_id" oninput="mileageMultiplication();"
																onkeypress="return numbersonly(event,this.value);" />
														</div>

													</td>

													<td style="font-size: 14px;">
														<div style="padding-top: 0px;" id="td12">
															<form:input path="milesRate" size="10"
																style="text-align: right;" onclick="saveOldValue();"
																onchange="return saveNewUnitPrice();"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>

													</td>
													<td style="font-size: 14px;">
														<div id="td14" style="display: block;">
															<form:input path="mileageAmount" size="10"
																readonly="true" style="text-align: right;"
																id="amount_id"
																onkeypress="return numbersOnlyFloat(event,this.value);" />
														</div>
													</td>
													<td><form:input path="mileageMemo" size="30px" /></td>

													<td style="padding-right: 5px; font-size: 12px;">
														<div>
															<input type="button" class="formbutton" name="addItem"
																title="To add item click it"
																onclick="saveMileageServiceData();"
																value='<spring:message code="BzComposer.Invoice.AddItem"/>'
																style="padding: 4px 10px 4px 10px; font-size: 12px; margin-top: 0;" />
														</div>
													</td>
												</tr>
											</table>
											<table style="width: 100%">
												<tr>
													<td align="left"><input type="button"
														class="formbutton" onclick="getAllMileageServiceIDs();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.service.selectall'/>" />

													</td>
													<td align="right"><input type="button"
														class="formbutton" onclick="deleteMileageServiceItems();"
														style="padding: 7 15px;"
														value="<spring:message code='BzComposer.global.delete'/>" />

													</td>

												</tr>

											</table>
											<div style="width: 100%;" align="center">

												<table id="custTable" class="tabla-listados sortable"
													cellspacing="0"
													style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
													align="center">
													<thead>
														<tr valign="center" style="width: 100%;">


															<th
																style="padding-right: 10px; font-size: 12px; width: 5% !important;"><spring:message
																	code="BzComposer.service.time.use" /></th>
															<th><spring:message
																	code="BzComposer.service.time.date" /></th>
															<th><spring:message
																	code="BzComposer.service.items.item" /></th>
															<th><spring:message
																	code="BzComposer.service.mileage.miles" /></th>
															<th><spring:message
																	code="BzComposer.service.time.rate" /></th>
															<th><spring:message
																	code="BzComposer.service.time.amount" /></th>
															<th><spring:message
																	code="BzComposer.service.mileage.notes" /></th>


														</tr>
													</thead>

													<tbody id="mileageServiceTableBody">

													</tbody>
												</table>

											</div>


										</div>

										<!--   Mileage tab end       -->

									</div>
								</td>

							</tr>
					</table>






				</div>
				<div align="right">
					<table>
						<tr>
							<td><spring:message code="BzComposer.service.timecostTotal" />
								<form:input readonly="true" path="timeCostTotal" size="15px" />
							</td>
						</tr>
					</table>

				</div>

			</div>
			<div class="text-center row pb-2">
				<label class="col-md-3">&nbsp;</label>
				<div class="col-md-6" style="font-size: 14px;">

					<button type="button" class="btn btn-info"
						onclick="return updateServiceDetails()" id="saveNewcategory">
						<spring:message code="BzComposer.global.update" />
					</button>
					<button type="button" class="btn btn-info"
						onclick="closeAddDialog();">
						<spring:message code="BzComposer.global.close" />
					</button>
				</div>
			</div>
		</form:form>
	</div>

</div>


<!-- Dialog box used in this page -->
<div id="selectcategorydialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.selectcategory' />
	</p>
</div>
<div id="selectitemdialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.selectitemrow' />
	</p>
</div>
<div id="showerrordialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.reconciliation.someerroroccurred' />
	</p>
</div>
<div id="deletedialogbox" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.wanttodelete' />
	</p>
</div>
<div id="editdialogbox" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.wanttoeditEstimation' />
	</p>
</div>
<div id="createInvoicedialogbox" style="display: none;">
	<p>
		<spring:message code='BzComposer.categorymanager.wanttocreateInvoice' />
	</p>
</div>
<div id="deleteCustomer" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.deleteselecteditem" />
	</p>
</div>

<div id="selectAllDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.customerinfo.selectedAlldlg" />
	</p>
</div>

<div id="updatesuccess" style="display: none;">
	<p>
		<spring:message code="BzComposer.service.updatesuccess" />
	</p>
</div>