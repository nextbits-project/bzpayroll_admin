<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<c:if test="${not empty AdminURL && AdminURL=='administer'}">
    <%@include file="/WEB-INF/jsp/include/menuAdmin.jsp"%>
</c:if>
<c:if test="${empty AdminURL}">
    <%@include file="/WEB-INF/jsp/include/menu.jsp"%>
</c:if>
<title><spring:message code="BzComposer.sales.ContactBoard" /></title>
<style>
/* .redColor{color: red;} */
.dataTables_filter{font-size: 14px;}
.dataTables_info{font-size: 14px;}
.dataTables_paginate{font-size: 14px;}
</style>
<script type="text/javascript">
flag_state = 0;
var funsequence = 0;
var _1 = navigator.userAgent.toLowerCase();
var ___ = (_1.indexOf("msie") != -1);
var ___5 = (_1.indexOf("msie 5") != -1);
var _io = (_1.indexOf("opera") != -1);
var _im = (_1.indexOf("mac") != -1);
var ____gi = (_1.indexOf("gecko") != -1);
var i____s = (_1.indexOf("safari") != -1);
var o = null;
var o22 = null;
var o33 = null;
var oT = null;
var r = null;
function c(r) 
{
	console.log("c");
	if (___) {
    	var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    	try {
      		o = new ActiveXObject(t);
      		o.onreadystatechange = r;
    	} 
    	catch (ex) {
      		alert("<spring:message code='BzComposer.common.needToEnableActiveXObject'/> ts.." + ex);
    	}
  	} else {
    	o = new XMLHttpRequest();
    	o.onload = r;
    	o.onerror = r;
  	}
  	return o;
}
function oGET(oo, url) {
	console.log("00"+oo);
	try {
    	oo.open("GET", url, true);	
    	oo.send(null);
  	} 
	catch (ex) 
	{}
}
function writeSelectTH(){
	console.log("writeSelectTH");
	if (oT.readyState != 4 || oT.status != 200) {
		return;
   	}
   	document.getElementById("t_history").innerHTML = o.responseText ;
}
function refreshTransationNow(radio_val,custid,dfrom,dto){
	console.log("refreshTransationNow");
	 oT = c(writeSelectTH); 
	oGET(oT,'${pageContext.request.contextPath}/sales/addTransactionHistory.jsp?custId=' + custid+'&cond='+radio_val+'&pfrom='+dfrom+'&pto='+dto)
}

$(document).ready(function() {
	console.log("inside default function");
$('#custTable').DataTable({
    "iDisplayLength": 20,
    "ordering": true,
    "order": [[0, 'desc']]
});
$("#custTable_length").hide();

$('#sortBy').change(function(){
	var sortBy = $(this).val();
	$.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=contactSortInvoice&SortBy="+sortBy,
        data:{sortBy : sortBy},
    }).done(function(data){
        $('#custTableBody').html('');
        var custDetails = "<input type='hidden' name='listSize' id='lSize' value='"+data.length+"'>";
        for(var i=0; i<data.length; i++)
        {
            var objList = data[i];
            custDetails = custDetails + "<tr id='"+i+"$$' onclick='setCutomerDataById("+objList.clientVendorID+", "+i+")'>"
                +"<td colspan='2' style='font-size:12px;'>"+objList.clientVendorID+" : "+objList.cname+" ("+objList.firstName+" "+objList.lastName+")</td></tr>";
        }
        $('#custTableBody').html(custDetails);
    });
});
});
var $j = jQuery.noConflict();
$j(function () {
    $j("#tabs").tabs();
});

$(document).ready(function() {
	console.log("inside default function");
    $('#contactTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "paging": true,

        "order": [[0, 'desc']] ,
        drawCallback: function (settings) {
            setRowId(0, 0, false);
        }
    });
    $('#opportunityTable').DataTable({
    "iDisplayLength": 10,
    "ordering": true,
    "order": [[0, 'desc']]
    });
    $('#eventTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [[0, 'desc']]
    });

    $('#caseTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [[0, 'desc']]
    });
    $('#jobTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [[0, 'desc']]
    });
    $('#technicianTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [[0, 'desc']]
    });
    $('#dispatchTable').DataTable({
        "iDisplayLength": 10,
        "ordering": true,
        "order": [[0, 'desc']]
    });

});

</script>
<style type="text/css">
div#pie { padding: 10px 0px 20px 0px; }
table.tabla-listados { width: 100%; border: 1px solid rgb(207, 207, 207); margin: 20px 0px 20px 0px; }
table.tabla-listados thead tr th {
    font-size: .7em; text-align: left; padding: 5px 10px;
	border-bottom: 1px solid rgba(5, 169, 197, 0.2);
	text-shadow: #999 0px 1px 1px; white-space: nowrap;
}
table.tabla-listados tbody tr td {
	font-size: .8em; padding: 5px 0px 5px 12px; background: #fff; vertical-align: top; }
</style>
</head>
<body onload="initialize();">
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<form:form name="CustomerForm"  method="post" modelAttribute="customerDto">
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
<!-- begin Contents -->
<div>
<div style="float: left;">
	<span style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
		<spring:message code="BzComposer.sales.ContactBoard" />
	</span>
	<br>
	<table>
		<tr>
			<td><spring:message code="BzComposer.customer.sortby" /></td>
			<td>
				<select id="sortBy">
					<option value="1"><spring:message code="BzComposer.customerinfo.companyname"/></option>
					<option value="2"><spring:message code="BzComposer.global.firstname"/></option>
					<option value="3"><spring:message code="BzComposer.global.lastname"/></option>
				</select>
			</td>
		</tr>
	</table>
</div>
<div style="float: right;">
	<table>
		<tr align="right">


				<td align="right" style="position: absolute; right: 25px;">
											<input type="button" class="formbutton"
											onclick="addNewCustomer();" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.global.new'/>" /> <input
											type="button" class="formbutton"
											onclick="manageCustomer('EDIT');" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.global.edit'/>" /> <input
											type="button" class="formbutton"
											onclick="manageCustomer('DELETE');" style="padding: 7 15px;"
											value="<spring:message code='BzComposer.global.delete'/>" />
										</td>

		</tr>
	</table>
</div>
</div>
<table style="width: 100%; apdding: 0;">
	<tr>
		<td>
			<table style="padding: 0;width: 100%; margin-top: 10px;" align="center">
                <tr>
                    <td valign="top" colspan="1" style="width: 350px; padding: 0; height: 75vh; border: 1px solid #ccc;">
                        <input type="hidden" name="listSize" id="lSize" value='${CustomerDetails.size()}' />
                        <table id="custTable" class="tabla-listados" cellspacing="0" style=" border: 0; padding: 0;margin: 0; height: auto;">
                            <thead>
                                <tr valign="top">
                                    <th class="emblem" style="font-size:12px;">
                                        <div align="center">
                                            <spring:message code="BzComposer.configuration.version.contact" />
                                        </div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="custTableBody">
                                <c:forEach items="${CustomerDetails}" var="objList" varStatus="loop">
                                    <tr id='${loop.index}$$' onclick="setCutomerDataById(${objList.clientVendorID}, ${loop.index})">
                                        <td colspan="2" style="font-size:12px;" class="${objList.paymentUnpaid?'redColor':''}">
                                            ${objList.clientVendorID} : ${objList.cname}
                                            <span style="display: none;">:${objList.firstName}:${objList.lastName}:${objList.zipCode}:${objList.phone}:${objList.cellPhone}:${objList.zipCode}:${objList.city}:${objList.address1}:${objList.address2}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </td>
                    <td colspan="10" style="vertical-align: 0;">
                        <div id="table-negotiations" style="height:auto;">
                            <table cellspacing="0" class="tabla-listados" style="margin-top: 0; margin-left: 20px;">
                                <thead>
                                <tr>
                                <td align="left">
                                <img src="/ConfigurationImages/contactboard.png" height="30" width="40" >
                                    <label id="customerCompanyName"  align="left" style="font-size:15px; font-weight:bold;  color:#05A9C5 ">
                                </td>
                                </tr>
                                </thead>
                                <tbody>
                                    <td style="padding: 0;">
                                    <div id="customerInvoice"  style="padding: 0; position: relative; left: 0;" >
                                        <div id="tabs" style="height:auto;">
                                            <ul>
                                                <li style="font-size:12px;"><a href="#Customer"><spring:message code="BzComposer.customerinfo.customerinformation"/></a></li>
                                                <li style="font-size:12px;"><a href="#Contact"><spring:message code="BzComposer.customerinfo.contactinformation"/></a></li>
                                                <li style="font-size:12px;"><a href="#Opportunity"><spring:message code="BzComposer.customer.opportunity.opportunityDetails"/></a></li>
                                                <li style="font-size:12px;"><a href="#Event"><spring:message code="BzComposer.customer.opportunity.EventDetails"/></a></li>
                                                <li style="font-size:12px;"><a href="#Case"><spring:message code="BzComposer.customer.case.caseDetails"/></a></li>
                                                <li style="font-size:12px;"><a href="#Jobs"><spring:message code="BzComposer.jobinfo.jobinformation"/></a></li>
                                                <li style="font-size:12px;"><a href="#Technician"><spring:message code="BzComposer.technicianinfo.technicianinformation"/></a></li>
                                                <li style="font-size:12px;"><a href="#DispatchBoard"><spring:message code="BzComposer.DispatchBoard.DispatchBoard"/></a></li>
                                                <li style="font-size:12px;"><a href="#Transaction"><spring:message code="BzComposer.updatecustomer.tabs.transactionhistory"/></a></li>
                                            </ul>
                                            <div id="Customer">
                                                <div id="content1" class="tabPage">
                                                        <table class="table-notifications" width="100%">
                                                            <tr>
                                                                <th colspan="5" align="left" style="font-size:12px; padding: 5px;">
                                                                    <spring:message code="BzComposer.customerinfo.customerinformation"/>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 40%;">
                                                                    <table cellspacing="0" class="tabla-listados">
                                                                        <tr>
                                                                            <td style="width: 50%;"><strong><spring:message code="BzComposer.global.customerid" />:</strong></td>
                                                                            <td style="width: 50%;" id="customerID"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.Employee.Name" />:</strong></td>
                                                                            <td id="customerName"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.Customer.CompanyName"/>:</strong></td>
                                                                            <td id="cname"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.register.dbaName"/>:</strong></td>
                                                                            <td id="dbaName"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.Customer.Type" />:</strong></td>
                                                                            <td>
                                                                                <select id="customerType" disabled="true">
                                                                                    <option value="0"><spring:message code="BzComposer.ComboBox.Select" /></option>
                                                                                    <c:forEach items="${VendorCategoryList}" var="item">
                                                                                        <option value="${item.value}">${item.label}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.address1" />:</strong></td>
                                                                            <td id="address1""></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.address2" />:</strong></td>
                                                                            <td id="address2"s"></td>
                                                                        </tr>
                                                                         <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.city" />:</strong></td>
                                                                            <td id="city"></td>
                                                                        </tr>
                                                                         <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.state" />:</strong></td>
                                                                            <td id="state"></td>
                                                                        </tr>

                                                                         <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.country" />:</strong></td>
                                                                            <td>
                                                                                <select id="country" disabled="true" style="width:170px;">
                                                                                    <option value="0"><spring:message code="BzComposer.ComboBox.Select" /></option>
                                                                                    <c:forEach items="${countryList}" var="item">
                                                                                        <option value="${item.countryId}">${item.countryName}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                         <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.zipcode" />:</strong></td>
                                                                            <td id="zipcode"></td>
                                                                        </tr>

                                                                    </table>
                                                                </td>
                                                                <td style="width: 30%;">
                                                                    <table cellspacing="0" class="tabla-listados">
                                                                        <tr>
                                                                            <td style="width: 50%;"><strong><spring:message code="BzComposer.global.phone" />:</strong></td>
                                                                            <td style="width: 50%;" id="phone"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.mobile" />:</strong></td>
                                                                            <td id="cellPhone"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.fax" />:</strong></td>
                                                                            <td id="fax"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.email" />:</strong></td>
                                                                            <td id="email"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.dateadded" />:</strong></td>
                                                                            <td id="dateAdded"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.orderimport.lastorderdate" />:</strong></td>
                                                                            <td id="lastOrderDate"></td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td><strong><spring:message code="Bizcomposer.active" />:</strong></td>
                                                                            <td id="activeCustomer"></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td style="width: 30%;">
                                                                    <table cellspacing="0" class="tabla-listados">
                                                                    <tr>
                                                                            <td><strong><spring:message code="BzComposer.common.totalOverdueAmount" />:</strong></td>
                                                                            <td id="totalOverdueAmt"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>&nbsp;</td>
                                                                            <td>&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.oppeningunpaidbalance" />:</strong></td>
                                                                            <td id="openingUB"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><strong><spring:message code="BzComposer.global.existingcredits" />:</strong></td>
                                                                            <td id="extCredit"></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </div>
                                            </div>
                                            <input type="hidden" name="clistSize" id="cSize" value='${customerContactList.size()}' />
                                            <div id="Contact">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.customer.opportunity.contactDetails"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right"><td style="padding-right: 12px! important;">
                                                            <table>
                                                                                            <tr align="left">
                                                                                                <td colspan="6">
                                                                                                    <div>
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="addNewContact();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.new'/>" />
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="editContact();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.edit'/>" />
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="deleteContact();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.delete'/>" />
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                        <td>

                                                                        <table id="contactTable" class="tabla-listados sortable"
                                                                        cellspacing="0"
                                                                        style=" margin-top: 10px; border: 0; padding: 0; height: auto;"
                                                                    >
                                                                        <thead>
                                                                            <tr valign="center">
                                                                                <th style="padding-right: 30px !important;"><spring:message
                                                                                        code="BzComposer.global.contactid" /></th>
                                                                                <th><spring:message
                                                                                        code="BzComposer.customer.contactName" /></th>
                                                                                <th><spring:message code="BzComposer.global.titlename" /></th>
                                                                                <th><spring:message code="BzComposer.global.email" /></th>
                                                                                <th><spring:message code="BzComposer.global.phone" /></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="contactTableBody">
                                                                            <c:if test="${not empty customerContactList}">
                                                                                <c:forEach items="${customerContactList}" var="objList"
                                                                                    varStatus="loop">
                                                                                    <tr id='${loop.index}c$$'
                                                                                        onclick="setRowId(${objList.contactID}, ${loop.index}, true);">
                                                                                        <td ><input
                                                                                            type="checkbox" id="contactID${loop.index}"
                                                                                            value="${objList.contactID}"
                                                                                            onchange="addContactRowIndex(${loop.index}, ${objList.contactID})" />

                                                                                        ${objList.contactID} </td>
                                                                                        <td>${objList.firstName}${objList.middleName}
                                                                                         ${objList.lastName}</td>
                                                                                         <td>${objList.title}</td>
                                                                                         <td>${objList.email}</td>
                                                                                         <td>${objList.phone}</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </tbody>
                                                                    </table>

                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        <tr>
                                                </table>
                                            </div>
                                            <!-- =============== opportunity  Details ================ -->
                                            <div id="Opportunity">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.customer.opportunity.opportunityDetails"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right"><td style="padding-right: 12px! important;">
                                                              <table >
                                                                                            <tr align="left">
                                                                                                <td colspan="6">
                                                                                                    <div>
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="addOpportunity();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.new'/>" />
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="updateOpportunity();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.edit'/>" />
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="deleteOpportunity();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.delete'/>" />
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                        <td>

                                                                        <table id="opportunityTable" class="tabla-listados sortable"
                                                                        cellspacing="0"
                                                                        style=" margin-top: 10px; border: 0; padding: 0; height: auto;"
                                                                    >
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
                                                                                        code="BzComposer.customer.opportunity.sourceID" /></th>
                                                                                <th><spring:message
                                                                                        code="BzComposer.Customer.opportunities.startdate" /></th>
                                                                                <th><spring:message
                                                                                        code="BzComposer.Customer.opportunities.closedate" /></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="opportunityTableBody">
                                                                            <c:if test="${not empty opportunityList}">
                                                                                <c:forEach items="${opportunityList}" var="objList"
                                                                                    varStatus="loop">
                                                                                    <tr id='${loop.index}p$$'
                                                                                    onclick="setRowIdOpportunity(${objList.opportunityID}, ${loop.index}, true);"
                                                                                        ondblclick="goToManageOpportunity(${objList.opportunityID});">

                                                                                        <td><input type="checkbox"
                                                                                            id="opportunityId${loop.index}"
                                                                                            value="${objList.opportunityID}"
                                                                                            onchange="addRowIndex(${loop.index}, ${objList.opportunityID})" />
                                                                                            ${objList.opportunityID}</td>
                                                                                        <td>${objList.opportunityName}</td>
                                                                                        <td>${objList.stage}</td>
                                                                                        <td>${objList.amount}</td>
                                                                                        <td>${objList.opportunityOwner}</td>
                                                                                        <td>${objList.sourceID}</td>
                                                                                        <td>${objList.startDate}</td>
                                                                                        <td>${objList.closedDate}</td>
                                                                                        <td>Yes</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </tbody>
                                                                    </table>

                                                                    </td>
                                                            </tr>

                                                            </tbody>

                                                        <tr>

                                                </table>
                                            </div>
                                            <!-- =============== Event  Details  ================ -->
                                            <div id="Event">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.customer.opportunity.EventDetails"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right">
                                                            <td style="padding-right: 12px! important;">
                                                                <table>
                                                                    <tr align="left">
                                                                        <td><spring:message code="BzComposer.customer.eventType" /></td>
                                                                        <td><form:select path="eventType" id="eventTypeID"
                                                                            style="width:200px;" onchange="loadEventList()">
                                                                            <form:option value="0">
                                                                                <spring:message code="BzComposer.customer.opportunity" />
                                                                            </form:option>
                                                                            <form:option value="1">
                                                                                <spring:message code="BzComposer.customer.case" />
                                                                            </form:option>
                                                                            </form:select>
                                                                        </td>
                                                                        <td colspan="6">
                                                                            <div>
                                                                                <input type="button" class="formbutton"
                                                                                    onclick="addEvent();"
                                                                                    style="padding: 7 15px;"
                                                                                    value="<spring:message code='BzComposer.global.new'/>" />
                                                                                <input type="button" class="formbutton"
                                                                                    onclick="editEvent()"
                                                                                    style="padding: 7 15px;"
                                                                                    value="<spring:message code='BzComposer.global.edit'/>" />
                                                                                <input type="button" class="formbutton"
                                                                                    onclick="deleteEvent();"
                                                                                    style="padding: 7 15px;"
                                                                                    value="<spring:message code='BzComposer.global.delete'/>" />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table id="eventTable" class="tabla-listados sortable"
                                                                cellspacing="0"
                                                                style=" margin-top: 10px; border: 0; padding: 0; height: auto;">
                                                                    <colgroup>
                                                                        <col span="1" style="width: 10%;">
                                                                        <col span="1" style="width: 15%;">
                                                                        <col span="1" style="width: 20%;">
                                                                        <col span="1" style="width: 25%;">
                                                                        <col span="1" style="width: 15%;">
                                                                        <col span="1" style="width: 15%;">
                                                                    </colgroup>
                                                                    <thead id="eventthead">
                                                                            <tr valign="center">
                                                                            <th style="padding-right: 30px !important;"><spring:message
                                                                                        code="BzComposer.customer.opportunity.eventId" /></th>
                                                                                        <th><spring:message
                                                                                        code="BzComposer.customer.event.opportunity"/></th>
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
                                                                        <tbody id="eventTableBody">
                                                                            <c:if test="${not empty eventList}">
                                                                                <c:forEach items="${eventList}" var="objList"
                                                                                    varStatus="loop">
                                                                                    <tr id='${loop.index}e$$' onclick="setRowIdEvent(${objList.eventId}, ${loop.index}, true);">

                                                                                        <td><input type="hidden" id="eventId${loop.index}"
                                                                                            value="${objList.eventId}"
                                                                                            onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
                                                                                            ${objList.eventId}</td>
                                                                                    <!-- 	<td>${objList.opportunity.opportunityId}</td> -->
                                                                                    <td>${objList.opportunityID}</td>
                                                                                        <td>${objList.eventName}</td>
                                                                                        <td>${objList.eventMemo}</td>
                                                                                        <td>${objList.eventStartDate}</td>
                                                                                        <td>${objList.eventEndDate}</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </tbody>
                                                                    </table>

                                                                    </td>
                                                                        </tr>

                                                            </tbody>

                                                        <tr>
                                                      </table>
                                            </div>
                                            <!-- =============== Case Details  ================ -->
                                            <div id="Case">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0; margin-left: 20px;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.customer.case.caseDetails"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right"><td style="padding-right: 12px! important;">
                                                            <table>
                                                                                            <tr align="left">
                                                                                                <td colspan="6">
                                                                                                    <div>
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="addNewCase();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.new'/>" />
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="editCase()"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.edit'/>" />
                                                                                                        <input type="button" class="formbutton"
                                                                                                            onclick="deleteCase();"
                                                                                                            style="padding: 7 15px;"
                                                                                                            value="<spring:message code='BzComposer.global.delete'/>" />
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                        <td>

                                                                        <table id="caseTable" class="tabla-listados sortable"
                                                                        cellspacing="0"
                                                                        style=" margin-top: 10px; border: 0; padding: 0; height: auto;"
                                                                    >
                                                                        <thead>
                                                                            <tr valign="center">
                                                                            <th style="padding-right: 30px !important;"><spring:message
                                                                                        code="BzComposer.customer.case.caseID" /></th>
                                                                                        <th><spring:message
                                                                                        code="BzComposer.customer.case.contactName" /></th>
                                                                                        <th><spring:message
                                                                                        code="BzComposer.customer.case.subject" /></th>
                                                                                        <th><spring:message
                                                                                        code="BzComposer.customer.case.product" /></th>
                                                                                <th><spring:message
                                                                                        code="BzComposer.customer.case.caseType" /></th>

                                                                                <th><spring:message
                                                                                        code="BzComposer.customer.case.priority" /></th>
                                                                                <th><spring:message
                                                                                        code="BzComposer.customer.case.dateOpened" /></th>

                                                                                <th><spring:message
                                                                                        code="BzComposer.customer.case.status" /></th>
                                                                                        <th><spring:message
                                                                                        code="BzComposer.customer.case.owner" /></th>

                                                                            </tr>
                                                                        </thead>
                                                                        <tbody id="caseTableBody">
                                                                            <c:if test="${not empty caseList}">
                                                                                <c:forEach items="${caseList}" var="objList"
                                                                                    varStatus="loop">
                                                                                    <tr id='${loop.index}case$$' onclick="setRowIdCase(${objList.caseID}, ${loop.index}, true);">

                                                                                        <td><input type="hidden" id="caseId${loop.index}"
                                                                                            value="${objList.caseID}"
                                                                                            onchange="addRowIndex(${loop.index}, ${objList.caseID})" />
                                                                                            ${objList.caseId}</td>
                                                                                    <!-- 	<td>${objList.opportunity.opportunityId}</td> -->
                                                                                    <td>${objList.contactName}</td>
                                                                                        <td>${objList.subject}</td>
                                                                                        <td>${objList.product}</td>
                                                                                        <td>${objList.caseType}</td>
                                                                                        <td>${objList.priority}</td>


                                                                                        <td>${objList.status}</td>
                                                                                        <td>${objList.dateOpened}</td>
                                                                                        <td>${objList.owner}</td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </tbody>
                                                                    </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        <tr>
                                                </table>
                                            </div>
                                             <!-- =============== Jobs Details  ================ -->
                                             <input type="hidden" name="jlistSize" id="jSize" value='${customerJobList.size()}' />
                                            <div id="Jobs">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0; margin-left: 20px;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.jobinfo.jobdetails"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right"><td style="padding-right: 12px! important;">
                                                            <table>
                                                                <tr align="left">
                                                                    <td colspan="6">
                                                                        <div>
                                                                            <input type="button" class="formbutton"
                                                                                onclick="addNewJob();"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.new'/>" />
                                                                            <input type="button" class="formbutton"
                                                                                onclick="editJob()"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.edit'/>" />
                                                                            <input type="button" class="formbutton"
                                                                                onclick="deleteJob();"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.delete'/>" />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table id="jobTable" class="tabla-listados sortable"
                                                                    cellspacing="0"
                                                                    style=" margin-top: 10px; border: 0; padding: 0; height: auto;">
                                                                    <thead>
                                                                        <tr valign="center">
                                                                            <th style="padding-right: 30px !important;"><spring:message
                                                                                    code="BzComposer.jobinfo.jobid" /></th>
                                                                            <th><spring:message code="BzComposer.jobinfo.jobtitle" /></th>
                                                                            <th><spring:message code="BzComposer.jobinfo.jobdescription" /></th>
                                                                            <th><spring:message code="BzComposer.jobinfo.jobstatus" /></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="jobTableBody">
                                                                        <c:if test="${not empty customerJobList}">
                                                                            <c:forEach items="${customerJobList}" var="objList"
                                                                                varStatus="loop">
                                                                                <tr id='${loop.index}job$$' onclick="setRowIdCase(${objList.jobID}, ${loop.index}, true);">
                                                                                        <td>
                                                                                            <input type="checkbox" id="jobID${loop.index}"
                                                                                            value="${objList.jobID}"
                                                                                            onchange="addRowJobIndex(${loop.index}, ${objList.jobID})" />
                                                                                        ${objList.jobID}
                                                                                    </td>
                                                                                    <td>${objList.title}</td>
                                                                                    <td>${objList.description}</td>
                                                                                    <td>${objList.status}</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        <tr>
                                                </table>
                                            </div>
                                            <!-- =============== Technician Details  ================ -->
                                            <input type="hidden" name="tlistSize" id="tSize" value='${bcaTechnicianList.size()}' />
                                            <div id="Technician">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0; margin-left: 20px;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.technicianinfo.techniciandetails"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right"><td style="padding-right: 12px! important;">
                                                            <table>
                                                                <tr align="left">
                                                                    <td colspan="6">
                                                                        <div>
                                                                            <input type="button" class="formbutton"
                                                                                onclick="addNewTechnician();"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.new'/>" />
                                                                            <input type="button" class="formbutton"
                                                                                onclick="editTechnician()"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.edit'/>" />
                                                                            <input type="button" class="formbutton"
                                                                                onclick="deleteTechnician();"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.delete'/>" />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table id="technicianTable" class="tabla-listados sortable"
                                                                    cellspacing="0"
                                                                    style=" margin-top: 10px; border: 0; padding: 0; height: auto;">
                                                                    <thead>
                                                                        <tr valign="center">
                                                                            <th style="padding-right: 30px !important;"><spring:message
                                                                                    code="BzComposer.technicianinfo.technicianid" /></th>
                                                                            <th><spring:message code="BzComposer.technicianinfo.name" /></th>
                                                                            <th><spring:message code="BzComposer.technicianinfo.phone" /></th>
                                                                            <th><spring:message code="BzComposer.technicianinfo.email" /></th>
                                                                            <th><spring:message code="BzComposer.technicianinfo.specialization" /></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="technicianTableBody">
                                                                        <c:if test="${not empty bcaTechnicianList}">
                                                                            <c:forEach items="${bcaTechnicianList}" var="objList"
                                                                                varStatus="loop">
                                                                                <tr id='${loop.index}technician$$' onclick="setRowIdCase(${objList.technicianID}, ${loop.index}, true);">
                                                                                        <td>
                                                                                            <input type="checkbox" id="technicianID${loop.index}"
                                                                                            value="${objList.technicianID}"
                                                                                            onchange="addRowTechnicianIndex(${loop.index}, ${objList.technicianID})" />
                                                                                        ${objList.technicianID}
                                                                                    </td>
                                                                                    <td>${objList.name}</td>
                                                                                    <td>${objList.phone}</td>
                                                                                    <td>${objList.email}</td>
                                                                                    <td>${objList.specialization}</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                    </tbody>
                                                        <tr>
                                                </table>
                                            </div>
                                            <!-- =============== Dispatch Board  ================ -->
                                            <input type="hidden" name="dblistSize" id="dbSize" value='${customerDispatchBoardDtoList.size()}' />
                                            <div id="DispatchBoard">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0; margin-left: 20px;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.DispatchBoard.DispatchBoardInfo"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr align="right"><td style="padding-right: 12px! important;">
                                                            <table>
                                                                <tr align="left">
                                                                    <td colspan="6">
                                                                        <div>
                                                                            <input type="button" class="formbutton"
                                                                                onclick="addNewDispatchBoard();"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.new'/>" />
                                                                            <input type="button" class="formbutton"
                                                                                onclick="editDispatchBoard()"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.edit'/>" />
                                                                            <input type="button" class="formbutton"
                                                                                onclick="deleteDispatch();"
                                                                                style="padding: 7 15px;"
                                                                                value="<spring:message code='BzComposer.global.delete'/>" />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table id="dispatchTable" class="tabla-listados sortable"
                                                                    cellspacing="0"
                                                                    style=" margin-top: 10px; border: 0; padding: 0; height: auto;">
                                                                    <thead>
                                                                        <tr valign="center">
                                                                            <th style="padding-right: 30px !important;"><spring:message
                                                                                    code="BzComposer.jobinfo.jobid" /></th>
                                                                            <th><spring:message code="BzComposer.Report.VendorContactList.Contact" /></th>
                                                                            <th><spring:message code="BzComposer.DispatchBoard.BusinessDivision" /></th>
                                                                            <th><spring:message code="BzComposer.DispatchBoard.Technician" /></th>
                                                                            <th><spring:message code="BzComposer.DispatchBoard.Status" /></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="dispatchTableBody">
                                                                        <c:if test="${not empty customerDispatchBoardDtoList}">
                                                                            <c:forEach items="${customerDispatchBoardDtoList}" var="objList"
                                                                                varStatus="loop">
                                                                                <tr id='${loop.index}DispatchBoard$$' onclick="setRowIdCase(${objList.dispatchBoardID}, ${loop.index}, true);">
                                                                                        <td>
                                                                                            <input type="checkbox" id="dispatchBoardID${loop.index}"
                                                                                            value="${objList.dispatchBoardID}"
                                                                                            onchange="addRowDispatchBoardIndex(${loop.index}, ${objList.dispatchBoardID})" />
                                                                                        ${objList.jobID}
                                                                                    </td>
                                                                                    <td>${objList.clientVendorName}</td>
                                                                                    <td>${objList.businessDivision}</td>
                                                                                    <td>${objList.technicianName}</td>
                                                                                    <td>${objList.status}</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                    </tbody>
                                                        <tr>
                                                </table>
                                            </div>
                                            <!-- =============== Transaction History ================ -->
                                            <div id="Transaction">
                                                <table class="tabla-listados" cellspacing="0" style="margin-top: 0;">
                                                    <thead>
                                                        <tr>
                                                            <th style="font-size: 14px;">
                                                                <spring:message code="BzComposer.updatecustomer.tabs.transactionhistory"/>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr><td style="padding-right: 12px! important;">
                                                        <table class="tabla-listados" cellspacing="0">
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="4">
                                                                        <spring:message code="BzComposer.updatecustomer.displayoption" />
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <form:radiobutton path="dispay_info" value="ShowAll" onclick="hide_details(this.value);" />
                                                                    <spring:message code="BzComposer.updatecustomer.showall" />
                                                                    <script type="text/javascript">
                                                                        radio_val = document.CustomerForm.dispay_info.value;
                                                                    </script>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <form:radiobutton path="dispay_info" value="ByVal" onclick="hide_details(this.value);" />
                                                                    <spring:message code="BzComposer.updatecustomer.byval" /></td>
                                                                <td>
                                                                    <spring:message code="BzComposer.updatecustomer.from"/>
                                                                    <form:input path="periodFrom" readonly="true" size="15" disabled="true" />
                                                                    <img src="${pageContext.request.contextPath}/images/cal.gif"  id="imgfrm" onclick="displayCalendar(document.CustomerForm.periodFrom,'mm-dd-yyyy',this);" />
                                                                    </td>
                                                                <td>
                                                                    <spring:message code="BzComposer.updatecustomer.to"/>
                                                                    <form:input path="periodTo" readonly="true" size="15" disabled="true" />
                                                                    <img src="${pageContext.request.contextPath}/images/cal.gif" id="imgto" onclick="displayCalendar(document.CustomerForm.periodTo,'mm-dd-yyyy',this);" />
                                                                </td>
                                                                <td><input type="button" class="formbutton" value="<spring:message code='BzComposer.updatecustomer.lookhistory'/>" id="lookBtn" onclick="lookUpHistory();" /></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        <div id="t_history" ></div>
                                                        </td></tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                </tbody>
                            </table>

                        </div>
                    </td>
                </tr>
            </table>
		</td>
	</tr>
</table>
</div>
<div>
	<input type="hidden" name="tabid" id="tabid" value="" />
	<input type="hidden" id="selectedCvID" value="${selectedCvID}" />
	<c:forEach items="${CustomerDetails}" var="objList" varStatus="loop">
        <input type="hidden" id="selectedCvIndex${objList.clientVendorID}" value="${loop.index}" />
    </c:forEach>
</div>
</div>
</div>
</div>
</div>
</form:form>
<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<script src="${pageContext.request.contextPath}/includeAll/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/includeAll/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/includeAll/jquery-ui.css" />
<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
</body>
</html>
<script>
let clientVendorID = 0;
let jobId = 0;
let selectedRowIndexs = [];
let cID=0;
let oppID=0;
let eventID=0;
let caseID=0;
let technicianId = 0;
let dispatchBoardId = 0;
function initialize()
{
	console.log("initialize");
	document.getElementById("dispay_info1").checked = true;
	let selectedCvID = document.getElementById("selectedCvID").value;
	let selectedCvIndex = document.getElementById("selectedCvIndex"+selectedCvID).value;
    setCutomerDataById(selectedCvID, selectedCvIndex)
}

function lookUpHistory(){
	console.log("lookUpHistory");
    let radio_val = $('input[name="dispay_info"]:checked').val();
    var dfrom = document.CustomerForm.periodFrom.value;
    var dto = document.CustomerForm.periodTo.value;
    refreshTransationNow(radio_val, clientVendorID, dfrom, dto);
}
function writeSelectTH(){
   if (oT.readyState != 4 || oT.status != 200) {
     return;
   }
   console.log("history items "+o.responseText);
   document.getElementById("t_history").innerHTML = o.responseText ;
}
function refreshTransationNow(radio_val, custid, dfrom, dto){
	 console.log("refreshTransationNow1");
       oT = c(writeSelectTH);
       console.log("oT "+oT);
       oGET(oT,'Customer?tabid=addTransactionHistory&custId=' + custid+'&cond='+radio_val+'&pfrom='+dfrom+'&pto='+dto)
}



function setCutomerDataById(vendorID, rowId){
	console.log("setCutomerDataById");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data) {
            $('#customerID').html(data.clientVendorID);
            $('#customerName').html(data.firstName +' '+ data.middleName +' '+ data.lastName);
            $('#cname').html(data.cname);
            $('#customerCompanyName').html(data.firstName +' '+ data.middleName +' '+ data.lastName+' ('+ data.cname + ')');
            $('#dbaName').html(data.dbaName);
            $('#customerType').html(data.type);
            $('#address1').html(data.address1);


            $('#address2').html(data.address2);
            $('#city').html(data.city);
            $('#state').html(data.state);
            $('#country').val(data.countryID);
            $('#zipcode').html(data.zipCode);
            $('#activeCustomer').html(data.active);

            $('#phone').html(data.phone);
            $('#cellPhone').html(data.cellPhone);
            $('#fax').html(data.fax);
            $('#email').html(data.email);
            $('#dateAdded').html(data.dateAdded);
            $('#lastOrderDate').html(data.lastOrderDate);

            $('#last3MonthAmt').html(data.last3MonthAmt);
            $('#last1YearAmt').html(data.last1YearAmt);
            $('#totalOverdueAmt').html(data.totalOverdueAmt);
            $('#openingUB').html(data.openingUB);
            $('#extCredit').html(data.extCredit);

            let size = document.getElementById("lSize").value;
            for(i=0; i<size; i++){
                if(document.getElementById(i+"$$"))
                    document.getElementById(i+"$$").classList.remove('draft');
            }
            document.getElementById(rowId+'$$').classList.add('draft');
            lookUpHistory();
            getJobData(vendorID);
            getTechnicianData(vendorID);
            getDispatchData(vendorID);
        },
        error : function(error) {
             alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
}
function manageCustomer(cmd){

	if (clientVendorID == 0) {
		return showCustomerValidationDialog();
	} else {
		if (cmd=="EDIT") {
			//window.location = "Customer?tabid=editCustomer&cvId="+itemID+"&itemIndex="+itemIndex;
			window.open("Customer?tabid=editContact&cvId="+clientVendorID, null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
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
function addNewCustomer(){
	//window.location = "Customer?tabid=NewCustomer";
	window.open("Customer?tabid=NewContact", null,"scrollbars=yes,height=620,width=1200,status=yes,toolbar=no,menubar=no,location=no");
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
function addRowJobIndex(rowId, jobID){
    jobId = jobID;
    let isFound = false;
    let isChecked = document.getElementById('jobID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == jobID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(jobID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(jobID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}
function addRowDispatchBoardIndex(rowId, dispatchBoardID){
    dispatchBoardId = dispatchBoardID;
    let isFound = false;
    let isChecked = document.getElementById('dispatchBoardID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == dispatchBoardID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(dispatchBoardID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(dispatchBoardID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}
function addRowTechnicianIndex(rowId, technicianID){
    technicianId = technicianID;
    let isFound = false;
    let isChecked = document.getElementById('technicianID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == technicianID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(technicianID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(technicianID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
    }
}
function addContactRowIndex(rowId, contactID){
    cID = contactID;
    let isFound = false;
    let isChecked = document.getElementById('contactID'+rowId).checked;
    for(let x=0; x<selectedRowIndexs.length; x++){
        if(selectedRowIndexs[x] == contactID){
            isFound = true;
            break;
        }
    }
    if(!isFound){
        selectedRowIndexs.push(contactID);
    }
    if(!isChecked){
        const index = selectedRowIndexs.indexOf(contactID);
        if (index > -1) {
          selectedRowIndexs.splice(index, 1);
        }
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
        window.open("Customer?tabid=ShowEmailOnContactBoard&CustIDs="+CustIDs, null,"scrollbars=yes,height=450,width=800,status=yes,toolbar=no,menubar=no,location=no");
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

function exportContact(){
	window.open("File?tabid=ExportContact",null,"scrollbars=no,height="+screenHeight+",width ="+screenWidth+",left = "+left+",top = "+top+",status=yes,toolbar=no,menubar=no,location=no");
}
function showCustomerValidationDialog(){
	console.log("showCustomerValidationDialog");
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
function addNewJob()
{
	window.open("Job?tabid=newJob&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editJob()
{
	if(jobId==0){
        if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true){
            return false;
        }
	} else{
        window.open("Job?tabid=editJob&cvId="+clientVendorID+"&jobID="+jobId, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function deleteJob(){
    if(jobId==0){
        selectJobRecordDialog();
        return false;
    } else {
        deleteJobValidationDialog();
    }
}
function selectJobRecordDialog(){
    event.preventDefault();
    $("#selectJobRecordDialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
            my: "center",
            at: "center",
            of: "#jobTable"
        } ,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function deleteJobValidationDialog(){
	event.preventDefault();
	$("#deleteJob").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
            my: "center",
            at: "center",
            of: "#jobTable"
        },
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                $.ajax({
                    type : "POST",
                    url : "customerJob?tabid=deleteJob",
                    data :"jobID=" + jobId,
                    success : function(data){
                        selectRecordDeletedDialog();
                        getJobData(clientVendorID);
                    },
                    error : function(data) {
             			 //return showerrordialog();
                    }
                });
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}
function addNewTechnician()
{
	window.open("Technician?tabid=NewTechnician&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editTechnician()
{
	if(technicianId==0){
        if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true){
            return false;
        }
	} else{
        window.open("Technician?tabid=EditTechnician&cvId="+clientVendorID+"&technicianID="+technicianId, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
    }
}
function deleteTechnician(){
    if(technicianId==0)
    {
        selectRecordDialog();
        return false;
    } else {
        deleteTechnicianIdValidationDialog();
    }
}
function deleteTechnicianIdValidationDialog(){
    event.preventDefault();

    $("#deleteTechnician").dialog({

        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
            my: "center",
            at: "center",
            of: "#caseTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                $.ajax({
                type : "POST",
                url : "customerTechnician?tabid=deleteTechnician",
                data :"technicianID=" + technicianId,
                success : function(data)
                {
                    selectRecordDeletedDialog();
                    getTechnicianData(clientVendorID);
                },
                error : function(data)
                {
                    //return showerrordialog();
                }
                });

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}

function addNewDispatchBoard()
{
	window.open("DispatchBoard?tabid=NewDispatchBoard&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editDispatchBoard()
{
	if(dispatchBoardId==0){
        if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true){
            return false;
        }
	} else{
        window.open("DispatchBoard?tabid=EditDispatchBoard&cvId="+clientVendorID+"&dispatchBoardID="+dispatchBoardId, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
    }
}

function deleteDispatch(){
    if(dispatchBoardId==0)
    {
        selectRecordDialog();
        return false;
    } else {
        deleteDispatchIdValidationDialog();
    }
}
function deleteDispatchIdValidationDialog(){
    event.preventDefault();

    $("#deleteDispatch").dialog({

        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
            my: "center",
            at: "center",
            of: "#caseTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                $.ajax({
                type : "POST",
                url : "customerDispatchBoard?tabid=deleteDispatch",
                    data :"dispatchBoardID=" + dispatchBoardId,
                success : function(data)
                {
                    selectRecordDeletedDialog();
                    getDispatchData(clientVendorID);
                },
                error : function(data)
                {
                    //return showerrordialog();
                }
                });

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}


function addNewCase()
{
	window.open("Case?tabid=newCase&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}
function editCase()
{
	if(caseID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
       window.open("Case?tabid=editCase&cvId="+clientVendorID+"&caseID="+caseID, null,"scrollbars=yes,height=700,width=1250,status=yes,toolbar=no,menubar=no,location=no");
}

function deleteCase(){
    if(caseID==0)
    {
        selectRecordDialog();
        return false;
    } else {
        deleteCaseValidationDialog();
    }
}

function selectRecordDialog(){

	event.preventDefault();

	$("#selectRecordDialog").dialog({

    	resizable: false,

        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#opportunityTable"
        } ,

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function deleteCaseValidationDialog(){

	event.preventDefault();

	$("#deleteCase").dialog({

    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position:
        {
        	my: "center",
        	  at: "center",
        	  of: "#caseTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                $.ajax({
             		type : "POST",
             		url : "Case?tabid=deleteCase",
             	    data :"caseID=" + caseID,
             	    success : function(data)
             	    {

             	    selectRecordDeletedDialog();
             	    getOpportunityData(clientVendorID);
             	     getContactData(clientVendorID);

             	    getOpportunityEventData(clientVendorID);
             	    getCaseData(clientVendorID);

             	    }
             		,
             		 error : function(data)
             		 {

             			 //return showerrordialog();
             		  }
             	});

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}

function getJobData(vendorID)
{
    debugger;
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"JobAjax?tabid=getCustomerJobDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
            $('#jobTableBody').html('');
            //alert("data lenth="+data.length);
            if(data.length != 0){
                var jobTable = "<input type='hidden' name='jlistSize' id='jSize' value='"+data.length+"'>";
                for(var i=0; i<data.length; i++){
                    var objList = data[i];
                    jobTable = jobTable + "<tr id='"+i+"c$$' onclick='setRowIdContact("+objList.jobID+", "+i+",true)'>"
                        +"<td><input type=checkbox id=jobID"+i+" value='"+ objList.jobID+"' onchange='addRowJobIndex("+i+","+objList.jobID+")'/> "
                        +objList.jobID+"</td>"+"<td>"+objList.title+"</td><td>"+objList.description+"</td><td>"
                        +objList.status+"</td></tr>";
                }
                $('#jobTableBody').html(jobTable);
            }else{
                var jobTable = "<tr></td colspan='4'>No record found</td></tr>";
                $('#jobTableBody').html(jobTable);
            }
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}

function getTechnicianData(vendorID)
{
    debugger;
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"TechnicianAjax?tabid=getCustomerTechnicianDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
       {
            $('#technicianTableBody').html('');
            //alert("data lenth="+data.length);
            if(data.length != 0){
                var technicianTable = "<input type='hidden' name='tlistSize' id='tSize' value='"+data.length+"'>";
                for(var i=0; i<data.length; i++){
                    var objList = data[i];
                    technicianTable = technicianTable + "<tr id='"+i+"technician$$' onclick='addRowTechnicianIndex("+objList.technicianID+", "+i+",true)'>"
                        +"<td><input type=checkbox id=technicianID"+i+" value='"+ objList.technicianID+"' onchange='addRowTechnicianIndex("+i+","+objList.technicianID+")'/> "
                        +objList.technicianID+"</td>"+"<td>"+objList.name+"</td><td>"+objList.phone+"</td><td>"
                        +objList.email+"<td>"+objList.specialization+"</td></td></tr>";
                }
                $('#technicianTableBody').html(technicianTable);
            }else{
                var technicianTable = "<tr></td colspan='4'>No record found</td></tr>";
                $('#technicianTableBody').html(technicianTable);
            }
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}
function getDispatchData(vendorID)
{
    debugger;
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"DispatchBoardAjax?tabid=getCustomerDispatchDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
       {
            $('#dispatchTableBody').html('');
            //alert("data lenth="+data.length);
            if(data.length != 0){
                var dispatchTable = "<input type='hidden' name='dblistSize' id='dbSize' value='"+data.length+"'>";
                for(var i=0; i<data.length; i++){
                    var objList = data[i];
                    dispatchTable = dispatchTable + "<tr id='"+i+"DispatchBoard$$' onclick='addRowDispatchBoardIndex("+objList.dispatchBoardID+", "+i+",true)'>"
                        +"<td><input type=checkbox id=dispatchBoardID"+i+" value='"+ objList.dispatchBoardID+"' onchange='addRowDispatchBoardIndex("+i+","+objList.dispatchBoardID+")'/> "
                        +objList.jobID+"</td>"+"<td>"+objList.clientVendorName+"</td><td>"+objList.businessDivision+"</td><td>"
                        +objList.technicianName+"<td>"+objList.status+"</td></tr>";
                }
                $('#dispatchTableBody').html(dispatchTable);
            }else{
                var dispatchTable = "<tr></td colspan='4'>No record found</td></tr>";
                $('#dispatchTableBody').html(dispatchTable);
            }
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}
function getContactData(vendorID)
{
//alert("Data of Conacts="+vendorID);
	console.log("setCutomerContactsDataById");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerContactsDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
            //alert("data lenth="+data.length);
        	$('#contactTableBody').html('');
            var contactTable = "<input type='hidden' name='clistSize' id='cSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                contactTable = contactTable + "<tr id='"+i+"c$$' onclick='setRowIdContact("+objList.contactID+", "+i+",true)'>"
                    +"<td><input type=checkbox id=contactID"+i+" value='"+ objList.contactID+"' onchange='addRowIndex("+i+","+objList.contactID+")'/> "
                    +objList.contactID+"</td>"+"<td>"+objList.firstName+" "+objList.middleName+" "+objList.lastName+"</td><td>"+objList.contactTitle+"</td><td>"
                    +objList.email+"</td><td>"+objList.phone+"</td></tr>";
            }
            $('#contactTableBody').html(contactTable);
       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });
}
function selectRecordDeletedDialog(){
	event.preventDefault();
	$("#selectRecordDeletedDialog").dialog({

    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#opportunityTable"
        } ,

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function loadEventList()
{
	var eventtype=document.CustomerForm.eventType.value;
	//alert( "clientVendorID"+clientVendorID+"EventType="+eventtype);
	if(eventtype==0)
		getOpportunityEventData(clientVendorID);

	if(eventtype==1)
		getCaseEventData(clientVendorID);
}

function getOpportunityEventData(vendorID)
{

	var eventthead=	"<tr valign='center'><th style='padding-right: 30px !important;'><spring:message code='BzComposer.customer.opportunity.eventId' /></th>"

		+"<th><spring:message code='BzComposer.customer.event.opportunity'/></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventName' /></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventMemo' /></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventStartDate' /></th>"
		+"<th><spring:message code='BzComposer.customer.opportunity.eventEndDate' /></th>"+"</tr>";

	//alert("OpportunityEvent event loaded ..");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerOpportunityEventsDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        	$('#eventthead').html('');
        	$('#eventthead').html(eventthead);
        	$('#eventTableBody').html('');

            var eventTable = "<input type='hidden' name='elistSize' id='eSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                eventTable =  eventTable + "<tr id='"+i+"e$$'   onclick='setRowIdEvent("+objList.eventId+", "+i+",true)' >"
                    +"<td><input type=checkbox id=eventId"+i+" value='"+ objList.eventId+"' onchange='addRowIndex("+i+","+objList.eventId+")'/> "
                    +objList.eventId+"</td>"+"<td>"+objList.opportunityID+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.eventStartDate+"</td><td>"
                    +objList.eventEndDate+"</td></tr>";
            }



            $('#eventTableBody').html(eventTable);

            var element = document.getElementById("eventTable");
  		  element.classList.add("tabla-listados sortable");


       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}

function getCaseEventData(vendorID)
{

var eventthead=	"<tr valign='center'><th style='padding-right: 30px !important;'><spring:message code='BzComposer.customer.opportunity.eventId' /></th>"
+"<th><spring:message code='BzComposer.customer.case.caseID'/></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventName' /></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventMemo' /></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventStartDate' /></th>"
	+"<th><spring:message code='BzComposer.customer.opportunity.eventEndDate' /></th>"

+"</tr>";



	//alert("case Event event loaded ..");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerCaseEventsDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
        $('#eventthead').html('');
        	$('#eventthead').html(eventthead);
        	$('#eventTableBody').html('');
            var eventTable = "<input type='hidden' name='elistSize' id='eSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                eventTable =  eventTable + "<tr id='"+i+"e$$'   onclick='setRowIdEvent("+objList.eventId+", "+i+",true)' >"
                    +"<td><input type=checkbox id=eventId"+i+" value='"+ objList.eventId+"' onchange='addRowIndex("+i+","+objList.eventId+")'/> "
                    +objList.eventId+"</td>"+"<td>"+objList.caseID+"</td><td>"+objList.eventName+"</td><td>"+objList.eventMemo+"</td><td>"+objList.eventStartDate+"</td><td>"
                    +objList.eventEndDate+"</td></tr>";
            }

            $('#eventTableBody').html(eventTable);
            var element = document.getElementById("eventTable");
            element.classList.add("tabla-listados sortable");

       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}
function getOpportunityData(vendorID)
{
	console.log("setCutomerContactsDataById");
    clientVendorID = vendorID;
    $.ajax({
        type: "POST",
        url:"CustomerAjax?tabid=getCustomerOpportunityDetails&cvId="+vendorID,
        data:{clientVendorID : vendorID},
        success : function(data)
        {
           //alert(" opportunity data lenth="+data.length);
        	$('#opportunityTableBody').html('');
            var opportunityTable = "<input type='hidden' name='plistSize' id='pSize' value='"+data.length+"'>";
            for(var i=0; i<data.length; i++){
                var objList = data[i];
                opportunityTable =  opportunityTable + "<tr id='"+i+"p$$'   onclick='setRowIdOpportunity("+objList.opportunityID+", "+i+",true)' ondblclick='goToManageOpportunity("+objList.opportunityID+")' >"
                    +"<td><input type=checkbox id=opportunityID"+i+" value='"+ objList.opportunityID+"' onchange='addRowIndex("+i+","+objList.opportunityID+")'/> "
                    +objList.opportunityID+"</td>"+"<td>"+objList.opportunityName+"</td><td>"+objList.stage+"</td><td>"+objList.amount+"</td><td>"+objList.opportunityOwner+"</td><td>"
                    +objList.sourceID+"</td><td>"+objList.startDate+"</td><td>"+objList.closedDate+"</td></tr>";
            }
            $('#opportunityTableBody').html(opportunityTable);

       },
        error : function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
       }
   });

}
function setRowId(rowid, rowIndex, flag)
{
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
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'$$').classList.add('draft');
    }
}
function setRowIdContact(rowid, rowIndex, flag){
    let lSize = document.getElementById("cSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'c$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
    	cID = rowid;

        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"c$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'c$$').classList.add('draft');
    }
}
function setRowIdOpportunity(rowid, rowIndex, flag){
    let lSize = document.getElementById("pSize").value;
    for (i=0; i<lSize; i++) {
        let currROW = document.getElementById(i+'p$$');
        if(currROW == null) continue;
        if(i%2 == 1){
            currROW.className = "odd";
        }else{
            currROW.className = "even";
        }
    }
    if(flag){
         oppID = rowid;

        itemIndex = rowIndex;
        if(rowIndex%2 == 1)
        { ;
            document.getElementById(rowIndex+"p$$").classList.remove('odd');
        }
        document.getElementById(rowIndex+'p$$').classList.add('draft');
    }
}


function addNewContact()
{

   console.log("addNewConact");
	window.open("Customer?tabid=addNewCustomerContact&cvID="+clientVendorID, null,"scrollbars=yes,height=420,width=900,status=yes,toolbar=no,menubar=no,location=no");

}

function editContact()
{

	console.log("editConact");

	if(cID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
	window.open("Customer?tabid=editCustomerContact&cvID="+clientVendorID+"&contactID="+cID, null,"scrollbars=yes,height=420,width=900,status=yes,toolbar=no,menubar=no,location=no");
}
function deleteCustomerValidationDialog(){
	console.log("showCustomerValidationDialog");
	event.preventDefault();


	$("#deleteCustomer").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#customerName"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

				                $.ajax({
				                    type : "GET",
				                    url : "Customer?tabid=Customer&customerAction=DELETE&cvID="+clientVendorID,
				                    success : function(data) {
				                        location.reload();
				                    },
				                    error : function(error) {
				                         alert("<bean:message key='BzComposer.common.erroroccurred'/>");
				                    }
				                });
            }
            ,
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function deleteContactValidationDialog(){

	event.preventDefault();


	$("#deleteContact").dialog({
    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#contactTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                       var conactDetails=
					         	   {
					         			 "contactID":cID,

					              };

					          var obj=JSON.stringify(conactDetails);

					          $.ajax({
					          		type : "POST",
					          		url : "customerContacts?tabid=delete",
					          	    data :"data=" + obj,
					          	    success : function(data)
					          	    {
					          	    selectRecordDeletedDialog();
					          	    getContactData(clientVendorID);
					          	    getOpportunityData(clientVendorID);
					          	    getOpportunityEventData(clientVendorID);

					          	    }
					          		,
					          		 error : function(data)
					          		 {

					          			 //return showerrordialog();
					          		  }
					          	});
            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function addOpportunity()
{

	window.open("Customer?tabid=addOpportunity&cvID="+clientVendorID, null,"scrollbars=yes,height=520,width=900,status=yes,toolbar=no,menubar=no,location=no");

}


function deleteOpportunity()
{

	if(oppID==0)
	{
		selectRecordDialog();
	 return false;
	}
	else
		{
		deleteOpportunityValidationDialog();

		}

}

function updateOpportunity()
{
	if(oppID==0)
	{
	if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
	 return false;
	}
	else
	window.open("Customer?tabid=editCustomerOpportunity&cvID="+clientVendorID+"&opportunityID="+oppID, null,"scrollbars=yes,height=420,width=900,status=yes,toolbar=no,menubar=no,location=no");


}

function addEvent()
	{
		window.open("Customer?tabid=customerOpportunityEvent&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");

	}

	function editEvent()
	{
		if(eventID==0)
		{
		if(confirm("<spring:message code='BzComposer.customer.selectAtOneEle'/>")==true)
		 return false;
		}
		else
		window.open("Customer?tabid=customerOpportunityEvent&cvId="+clientVendorID, null,"scrollbars=yes,height=700,width=1000,status=yes,toolbar=no,menubar=no,location=no");

	}

	function deleteEvent()
	{

		if(eventID==0)
		{
			selectRecordDialog();
		 return false;
		}
		else
			{
			deleteEventValidationDialog();


		  }

	}
function deleteOpportunityValidationDialog(){

	event.preventDefault();

	$("#deleteOpportunity").dialog({

    	resizable: false,
        height: 200,
        width: 400,
        modal: true,
        position: {
        	my: "center",
        	  at: "center",
        	  of: "#opportunityTable"
        },

        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");

                $.ajax({
             		type : "POST",
             		url : "customerOpportunity?tabid=deleteOpportunity",
             	    data :"opportunityId=" + oppID,
             	    success : function(data)
             	    {
             	    selectRecordDeletedDialog();
                    getContactData(vendorID);
             	    getOpportunityData(clientVendorID);
             	     getContactData(clientVendorID);

             	    getOpportunityEventData(clientVendorID);


             	    }
             		,
             		 error : function(data)
             		 {

             			 //return showerrordialog();
             		  }
             	});

            },
            "<spring:message code='BzComposer.global.cancel'/>": function () {
                $(this).dialog("close");
            }

        }
    });
    return false;
}
</script>
<!-- Dialog box used in sales order page -->
<div id="showCustomerValidationDialog" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.selectcustomerfirst"/></p>
</div>
<div id="deleteCustomer" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.deleteselectedcustomer"/></p>
</div>


<div id="deleteOpportunity" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.deleteselectedOpportunity"/></p>
</div>
<div id="selectRecordDialog" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.selectrecordfirst"/></p>
</div>
<div id="selectJobRecordDialog" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.selectrecordfirst"/></p>
</div>
<div id="deleteCase" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.deleteselectedCase"/></p>
</div>
<div id="deleteTechnician" style="display:none;">
	<p><spring:message code="BzComposer.technicianinfo.deleteselectedTechnician"/></p>
</div>
<div id="deleteDispatch" style="display:none;">
	<p><spring:message code="BzComposer.deleteRecord"/></p>
</div>

<div id="deleteJob" style="display:none;">
	<p><spring:message code="BzComposer.jobinfo.deleteselectedJob"/></p>
</div>
<div id="selectRecordDeletedDialog" style="display:none;">
	<p><spring:message code="BzComposer.customerinfo.selectedRecordDeleted"/></p>
</div>