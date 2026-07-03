<%@ page contentType="text/html;charset=UTF-8"%>
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

<title><spring:message code="BzComposer.generaltitle" /></title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link
	href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
	rel="stylesheet" media="screen" />
<script
	src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#companyInfoTable tr th {
	font-size: 14px;
}


.card-body
{

height: 160px;
}
p {
  font-size: 14px;
}

h5
{
 font-size: 13px;
}
.btn btn-outline-info
{
height: 15px;
}
h6
{
font-size: 12px;
color:#355449;
font-weight: bold;
}
#companyInfoTable tr td {
	font-size: 14px;
}
.card-header
{
background: #05A9C5;
	color: #FFFFFF;
	font-weight: bold;
align-content: center;
vertical-align:center;
height: 35px;
}
.card-footer
{
height: 60px;
}
.card
{
background:#F8F8F8;
}
.modal {
	display: none;
}

.fonts {
	font-size: 1.2em;
}

.usersTblNew {
	vertical-align: top;
	width: 100%;
	border: 1px solid rgb(207, 207, 207);
}

.usersTblNew thead tr td {
	padding: 5px 0px 5px 5px;
	font-size: 12px;
}

.usersTblNew tbody tr td {
	padding: 5px 0px 5px 5px;
	font-size: 12px;
}

.draft td {
	color: #ffffff;
	background: rgba(50, 58, 60, 0.63);
}

.switch {
	position: relative;
	display: inline-block;
	width: 40px;
	height: 22px;
	margin-left: 10px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
	margin-top: 15px;
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
	height: 15px;
	width: 15px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(15px);
	-ms-transform: translateX(15px);
	transform: translateX(15px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 20px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</head>

<script>
var membershipLevel1 = "<%=request.getAttribute("membershipLevel")%>";
if(membershipLevel1 == "Standard"){
	$("#userlistlable11").hide();
	$("#userandpasswordheading").hide();
	$("#userandpassworddata").hide();
}

var Role = "<%=request.getAttribute("Role")%>";
if(Role=='User'){
	$("#userlistlable").hide();
}
function toggleFunction() {
	
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
    /* document.getElementById("togglebtn").value = "+"; */
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
    /* document.getElementById("togglebtn").value = "-"; */
  }
}
</script>
<script type="text/javascript">
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
var oEmail = null;
var oT = null;
var nm="";
var r = null;

function c(r) {
  if (___) {
	var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
    try {
	  o = new ActiveXObject(t);
      o.onreadystatechange = r;
	} catch (ex) {
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
  try {
	oo.open("GET", url, true);
    oo.send(null);
  }
  catch (ex) {
  }
}

function showLocale(lang){
	//var lang = document.getElementById("locale").value;
	window.location = "./changeLocale?requestPage=ConfigPage&lang="+lang;
}
function showLanguageDialog()
{
	event.preventDefault();
	$("#showLanguageDialog").dialog({
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
$(function() {
    $("#tabs").tabs();
    $("#tabs1").tabs();
});
$(document).ready(function()
{
	
	var isSOBChecked = "<%=request.getAttribute("isSOBChecked")%>";
	var isISBChecked = "<%=request.getAttribute("isISBChecked")%>";
	var isIRBChecked = "<%=request.getAttribute("isIRBChecked")%>";
	var isPOBChecked = "<%=request.getAttribute("isPOBChecked")%>";
	var isSelectedWeightID = "<%=request.getAttribute("isSelectedWeightID")%>";

	if($("#countryID").find("option:selected").text().trim() == 'Canada'){
        $('.lblProvinceShow').show();
        $('.lblPostalcodeShow').show();
        $('.lblStateShow').hide();
        $('.lblZipcodeShow').hide();
    }else{
        $('.lblProvinceShow').hide();
        $('.lblPostalcodeShow').hide();
        $('.lblStateShow').show();
        $('.lblZipcodeShow').show();
    }

	$('select[id="weightID"]').find('option[value="'+isSelectedWeightID+'"]').attr("selected",true);
	$('#salesOrderBoard').change(function(){
		var isChecked = isSOBChecked;
		if($(this).prop("checked") == true){
	        $("#salesOrderBoard").attr('checked', true);
	        isChecked = "on";
		}
	    else if($(this).prop("checked") == false){
	        $("#salesOrderBoard").attr('checked', false);
	        isChecked = "off";
		}else{
	        $("#salesOrderBoard").attr('checked', isChecked);
	    }
		document.configurationForm.salesOrderBoard.value = isChecked;
		$("#salesOrderBoard").val(isChecked);
	});

	$('#itemReceivedBoard').change(function(){
		var isChecked = isIRBChecked;
		if($(this).prop("checked") == true){
	        $("#itemReceivedBoard").attr('checked', true);
	        isChecked = "on";
		}
	    else if($(this).prop("checked") == false){
	        $("#itemReceivedBoard").attr('checked', false);
	        isChecked = "off";
		}else{
	        $("#itemReceivedBoard").attr('checked', isChecked);
	    }
		document.configurationForm.itemReceivedBoard.value = isChecked;
		$("#itemReceivedBoard").val(isChecked);
	});

	$('#poboard').change(function(){
		var isChecked = isPOBChecked;
		if($(this).prop("checked") == true){
	        $("#poboard").attr('checked', true);
	        isChecked = "on";
		}
	    else if($(this).prop("checked") == false){
	        $("#poboard").attr('checked', false);
	        isChecked = "off";
		}else{
	        $("#poboard").attr('checked', isChecked);
	    }
    	document.configurationForm.poboard.value = isChecked;
		$("#poboard").val(isChecked);
	});

	$('#itemShippedBoard').change(function(){
		var isChecked = isISBChecked;
		if($(this).prop("checked") == true){
	        $("#itemShippedBoard").attr('checked', true);
	        isChecked = "on";
		}
	    else if($(this).prop("checked") == false){
	        $("#itemShippedBoard").attr('checked', false);
	        isChecked = "off";
		}else{
	        $("#itemShippedBoard").attr('checked', isChecked);
	    }
    	document.configurationForm.itemShippedBoard.value = isChecked;
		$("#itemShippedBoard").val(isChecked);
	});
});

function TestConnection()
{
    pleaseWaitDialog();
    var authType = 'false';
	var host = document.configurationForm.mailServer.value;
	var userEmail = document.configurationForm.mailUserName.value;
	var password = document.configurationForm.mailPassword.value;
	if(document.configurationForm.mailAuth.checked){
        if(userEmail.length < 5 || !userEmail.includes('@')){
            alert("<spring:message code='BzComposer.configuration.invalidEmail' />");
            return;
        }
        else if(password.length < 3){
            alert("<spring:message code='BzComposer.configuration.invalidPassword' />");
            return;
        }
        authType = 'true';
    }
    $.ajax({
        type : "POST",
        url :  "ConfigurationAjax/SaveConfiguration?tabid=testMailServer&HostName="+host+"&authType="+authType+"&userEmail="+userEmail+"&password="+password,
        success : function(data) {
            $('#pleaseWaitDialog').dialog("close");
            if(data == "true"){
                serverConnectedSeccessDialog();
            }else{
                serverConnectedErrorDialog();
            }
        },
        error : function(data) {
            alert("<spring:message code='BzComposer.common.erroroccurred'/>");
        }
    });

}

function CheckEmailConnection()
{
    $('#pleaseWaitDialog').dialog("close");
	if (oEmail.readyState != 4 || oEmail.status != 200) {
	  	return;
	}
	response = parseInt(trim(oEmail.responseText));
	if(response == 1)
	{
		return serverConnectedSeccessDialog();
		document.configurationForm.mailAuth.disabled=false;
		EnableDisableFields2();
	}
	else
	{
		return serverConnectedErrorDialog();
		document.configurationForm.mailAuth.disabled=true;
		EnableDisableFields2();
	}
}

function EnableDisableFields2(){
	if(document.configurationForm.mailAuth.checked==true){
		document.configurationForm.mailUserName.disabled=false;
		document.configurationForm.mailPassword.disabled=false;
	}
	else{
		document.configurationForm.mailUserName.disabled=true;
		document.configurationForm.mailPassword.disabled=true;
	}
}
function trim(inputString) {
   // Removes the spaces  return from the passed string.
   var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == "\n" || ch == "\r" || ch==" " || ch=="\t" ) {
  retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
   }
   return retValue;
}
function serverConnectedErrorDialog(){
	event.preventDefault();
	$("#serverConnectedErrorDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
function serverConnectedSeccessDialog(){
	event.preventDefault();
	$("#serverConnectedSeccessDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}

function professionalServiceExplore()
{

	 window.open("Configuration?tabid=professionalServiceExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}
function manufacturerExplore()
{

	 window.open("Configuration?tabid=manufacturerExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}
function employeeManagementExplore()
{

	 window.open("Configuration?tabid=employeeManagementExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}



function eCommerceExplore()
{

	 window.open("Configuration?tabid=eCommerceExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );
	
}
function crmExplore()
{

	 window.open("Configuration?tabid=crmExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}
function  nonProfitOrganizationExplore()
{

	 window.open("Configuration?tabid=nonProfitOrganizationExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}
function  accountantExplore()
{

	 window.open("Configuration?tabid=accountantExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}
function retailExplore()

{

	
	 window.open("Configuration?tabid=retailExplore",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );

}
function pleaseWaitDialog(){
	event.preventDefault();
	$("#pleaseWaitDialog").dialog({
    	resizable: false,
        height: 200,
        width: 350,
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
<body onload="init();">
	<form:form name="configurationForm" id="configurationForm"
		enctype="MULTIPART/FORM-DATA" method="post" modelAttribute="configDto">
		<div id="ddcolortabsline">&nbsp;</div>
		<div id="cos">
			<div class="statusquo ok">
				<div id="hoja">
					<div id="blanquito">
						<div id="padding">
							<div>
								<span
									style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
									<spring:message
										code="BzComposer.configuration.version&membership" />
								</span>
							</div>
							<div>
								<div>
									<c:if test="${not empty Labels}">
										<input type="hidden" name="lsize" id="lblsize"
											value='${Labels.size()}' />
										<c:forEach items="${Labels}" var="lbl" varStatus="loop">
											<input type="hidden" id='${loop.index}lid'
												name='${loop.index}lidname' value='${lbl.value}' />
											<input type="hidden" id='${loop.index}lname'
												name='${loop.index}lnm' value='${lbl.label}' />
										</c:forEach>
									</c:if>
								</div>
								<div id="table-negotiations"
									style="padding: 0; border: 1px solid #ccc;">
									<table cellspacing="0"
										style="border: 0; padding: 0; width: 100%; overflow-y: scroll;"
										class="section-border">
											<!-- <tr>
					<td>
					<span style="font-size:30px;cursor:pointer; margin-left: 30px;" onclick="toggleFunction()">&#9776;</span>
				</td>
				<td></td>
			</tr> -->
										<tr>
											<span
												style="font-size: 30px; cursor: pointer; margin-left: 20px;"
												onclick="toggleFunction()"> &#9776;</span>
											<td id="leftMenu" style="position: relative; width: 180px;"
												valign="top">
												<table>
													<tr>
														<td><jsp:include page="versionMembershipMenuPage.jsp" /></td>
													</tr>
												</table>
											</td>
											<td valign="top">
												<!-- General -->
												<div></div> <!-- general page content starts -->
												<div id="general"
													style="display: none; padding: 0; position: relative; left: 0;">
													<div id="tabs" style="height: auto;">
														<ul>
														<!--  
															<li style="font-size: 12px;"><a href="#companyinfo"><spring:message
																		code="BzComposer.companyinfo.title" /></a></li>

															<li style="font-size: 12px;"><a
																href="#GeneralSetting"><spring:message
																		code="BzComposer.configuration.tab.generalsettings" /></a>
															</li>

															<li style="font-size: 12px;"><a href="#security">
																	<spring:message code="BzComposer.register.security" />

															</a></li>
															<!-- <li style="font-size: 12px;"><a href="#modules"><spring:message code="BzComposer.common.modules" /></a></li> -->
															<!--  
															<li style="font-size: 12px;"><a href="#reminder"><spring:message
																		code="BizComposer.Configuration.Reminders" /> </a></li>
															<li style="font-size: 12px;"><a href="#emailSetup">
																	<spring:message code="BzComposer.tab.eMailSetup" />
															</a></li>
															-->
															<li style="font-size: 12px;"><a href="#Version"><spring:message
																		code="BzComposer.customization" /></a></li>
														</ul>
														
														
														

														<div id="Version">
															<div id="VersionContent" class="tabPage">
															
															<div>
															<div align="left">
															
															   <span
																				style="font-size: 1.2em; font-weight: normal; color:#838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
																				<spring:message
																				code="BzComposer.products"/>
															</span>
															 </div>
															
															<table class="table-notifications" width="80%">
															
															
															<tr>
															<td>
															<div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>Retailer</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Provide service  to the retail Customer </h6>
														    
														    <p class="card-text">selling the products ,functions of warehousing and storing,buying and assembling of goods
														    , delivering quality products</p>
														  
								  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm"  onclick="retailExplore()">Explore -></button>
                                                                </div>
														</div>
															
															</td>
															
																													  
						
															<td>
															<div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>Service & Professional</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Provide professional service to the customer  </h6>
														    
														    <p class="card-text"> Help them manage or improve a specific area of their businesses,professional services may have expertise . digital marketing, and provide services to a business to improve their digital marketing efforts.</p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="professionalServiceExplore()">Explore -></button>
                                                                </div>
														</div>
															
															
															
															
															</td>
															<td>
															<div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>CRM</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title"> Manage and analyze customer interactions  </h6>
														    
														    <p class="card-text">managing all of your company’s interactions with current and potential customers,
														    helps companies stay connected to customers, streamline processes, and improve profitability</p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="crmExplore()">Explore -></button>
                                                                </div>
														</div>
															
															
															</td>
															<td>
															<div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>Wholesaler/Manufacturer</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Provide  service to the Wholesaler and Manufacturer </h6>
														    
														    <p class="card-text">Help in the Marketing Function The wholesalers take care of the distribution of goods to a number of retailers </p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="manufacturerExplore()">Explore -></button>
                                                                </div>
														</div>
															</td>
															</tr>
															
																<tr>
															<td>
															
														
														
														<div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>Emp Management & Payroll</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Helps the businesses manage employee wages and payroll</h6>
														    
														    <p class="card-text">Manage employee payments, including salaries, bonuses, benefits, 
														   , tax deductions.  track hours worked, issue payments, and keep records.</p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="employeeManagementExplore()">Explore -></button>
                                                                </div>
														</div>
															
															</td>
															
															<td>
														
															 <div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>eCommerce</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Helps the businesses to sell products online </h6>
														    
														    <p class="card-text">Supply chain e-commerce management,Inventory management,Data collection and security,Electronic funds transfer,Shipping services</p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="eCommerceExplore()">Explore -></button>
                                                                </div>
														</div>
															
															</td>
															<td>
																 <div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>Non-Profit Organization</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Providing Service to the Non-Profit Organization(NPO)</h6>
														    <p class="card-text">Donations made to a Non Profit organization(NOP) are typically tax-deductible and the nonprofit itself pays no tax on
														     donations </p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="nonProfitOrganizationExplore()">Explore -></button>
                                                                </div>
														</div>
															
															</td>
															<td>
															 <div class="card" style="width: 18rem;">
															  <div class="card-header" align="center"> <h5>Accountant</h5> </div>
														   <div class="card-body" align="center">
														    <h6 class="card-title">Provides Accounting Solutions </h6>
														    
														    <p class="card-text">Bill paying services,Payroll and sales taxes,Monthly, quarterly, and annual financial reporting statements,Income tax planning and consulting</p>
														  
														   
														  </div>
														   <div class="card-footer" align="center">
                                                                         <button type="button" class="btn btn-outline-info btn-sm" onclick="accountantExplore()">Explore -></button>
                                                                </div>
														</div>
															
															</td>
															</tr>
															
															
															
															</table>
													
															
															</div>
																
															</div>
														</div>
														
												

														<!--  Reminders Starts -->
														

														<!-- Company-Information Start -->
													
														<!-- Company-Information End -->
														<!-- Security Start here -->
												
														<!-- Company-Security End -->
													</div>
												</div> <!-- general page content ends -->
											</td>
										</tr>
									</table>
									<div>
										<form:hidden path="empStateID" />
										<form:hidden path="labelName" />
										<form:hidden path="fileName" />
									</div>
									<div>
										<input type="hidden" name="tabid" id="tabid" value="" /> <input
											type="hidden" name="salesOrderBoard" value="" /> <input
											type="hidden" name="itemReceivedBoard" value="" /> <input
											type="hidden" name="itemShippedBoard" value="" /> <input
											type="hidden" name="poboard" value="" />
									</div>
									<div align="center" id="generalButtons" style="display: block;">
										<input type="button" class="bottomButton formButton"
											name="Save" id="Save" onclick="updateComapany()"
											value="<spring:message code='BzComposer.global.save'/>" /> <input
											type="reset" class="bottomButton formButton" id="Cancel"
											name="Cancel" onclick="RevokeValues()"
											value="<spring:message code='BzComposer.global.cancel'/>" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
<script type="text/javascript">
EnableDisableFields2();

function updateComapany()
{
    var showReminder = document.getElementById('showReminder').value;
    
    if (document.getElementById('invoiceMemoRemindMe').checked) {
      var invoiceMemo = document.getElementById('invoiceMemoRemindMe').value;
    }
    if (document.getElementById('invoiceMenoDontRemindMe').checked) {
      var invoiceMemo = document.getElementById('invoiceMenoDontRemindMe').value;
    }
    var invoiceMemoDays = document.getElementById('invoiceMemoDays').value;
    if (document.getElementById('memorizeRemindMe').checked) {
      var EstimationMemo = document.getElementById('memorizeRemindMe').value;
    }
    if (document.getElementById('memorizeDontRemindMe').checked) {
      var EstimationMemo = document.getElementById('memorizeDontRemindMe').value;
    }
    var memorizeEstimationDays = document.getElementById('memorizeEstimationDays').value;
    if (document.getElementById('overdueInvoice').checked) {
      var overdueInvoice = document.getElementById('overdueInvoice').value;
    }
    if (document.getElementById('overdueInvoiceDontRemindMe').checked) {
      var overdueInvoice = document.getElementById('overdueInvoiceDontRemindMe').value;
    }
    var overdueInvoiceDays = document.getElementById('overdueInvoiceDays').value;
    if (document.getElementById('inventoryOrderRemindMe').checked) {
      var inventoryOrder = document.getElementById('inventoryOrderRemindMe').value;
    }
    if (document.getElementById('inventoryOrderDontRemindme').checked) {
      var inventoryOrder = document.getElementById('inventoryOrderDontRemindme').value;
    }
    var inventoryOrderDays = document.getElementById('inventoryOrderDays').value;
    if (document.getElementById('serviceBillingRemindMe').checked) {
      var serviceBilling = document.getElementById('serviceBillingRemindMe').value;
    }
    if (document.getElementById('serviceBillingDontRemindMe').checked) {
      var serviceBilling = document.getElementById('serviceBillingDontRemindMe').value;
    }
    var serviceBillingDays = document.getElementById('serviceBillingDays').value;
    if (document.getElementById('billsToPayRemindMe').checked) {
      var billsToPay = document.getElementById('billsToPayRemindMe').value;
    }
    if (document.getElementById('billsToPayDontRemindMe').checked) {
      var billsToPay = document.getElementById('billsToPayDontRemindMe').value;
    }
    var billsToPayDays = document.getElementById('billsToPayDays').value;
    if (document.getElementById('memorizePurchaseOrderRemindMe').checked) {
      var memorizePurchaseOrder = document.getElementById('memorizePurchaseOrderRemindMe').value;
    }
    if (document.getElementById('memorizePurchaseOrderDontRemindMe').checked) {
      var memorizePurchaseOrder = document.getElementById('memorizePurchaseOrderDontRemindMe').value;
    }
    var memorizePurchaseOrderDays = document.getElementById('memorizePurchaseOrderDays').value;
    if (document.getElementById('memorizeBillRemindMe').checked) {
      var memorizeBill = document.getElementById('memorizeBillRemindMe').value;
    }
    if (document.getElementById('memorizeBillDontRemindMe').checked) {
      var memorizeBill = document.getElementById('memorizeBillDontRemindMe').value;
    }

    var memorizeBillDays = document.getElementById('memorizeBillDays').value;
	var sel = document.getElementById("businessTypeId");
    var businessTypeId = sel.options[sel.selectedIndex].value;
	var email = document.getElementById("email").value;
	var fName = document.getElementById("firstName").value;
	var lName = document.getElementById("lastName").value;
	var companyName = document.getElementById("companyName").value;
	var nickName = document.getElementById("nickName").value;
	var address1 = document.getElementById("address1").value;
	var address2 = document.getElementById("address2").value;
	var zip = document.getElementById("zip").value;
	var stateID = document.getElementById("stateID").value;
	var cityID = document.getElementById("cityID").value;
	var countryId = document.getElementById("countryID").value;
	var phone = document.getElementById("phone").value;
	var province = document.getElementById("province").value;
	var cellphone = document.getElementById("cellPhone").value;
	var fax = document.getElementById("fax").value;
	var membershipLevel = document.getElementById("membershipLevel").value;
	var sameAsPhoneNumber = document.getElementById("sameAsPhoneNumber1").checked;
	var taxID = document.getElementById("taxID").value;
	var jobPosition = document.getElementById("jobPosition").value;

	var errorMessage="";
	if(email == "" && fName == "" && lName == "" && companyName == "" && address1 == "" && cityID == "")
	{
		errorMessage = "<spring:message code='MultiUserForm'/>";
	}
	else
	{
		if(email == "" || email == null){
			errorMessage = "<h3><spring:message code='BzComposer.companyinfo.enteremailaddress'/></h3>";
		}
		else if (!ValidateEmail(email)) {
	        errorMessage = "<h3><spring:message code='err.Email'/></h3>";
	    }
		else if(fName == "" || fName == null){
			errorMessage = "<h3><spring:message code='err.Firstname'/></h3>";
		}
		else if(lName == "" || lName == null){
			errorMessage = "<h3><spring:message code='err.LastName'/></h3>";
		}
		else if(companyName == "" || companyName == null){
			errorMessage = "<h3><spring:message code='BzComposer.companyinfo.enterCompanyName'/></h3>";
		}
		else if(address1 == "" || address1 == null){
			errorMessage = "<h3><spring:message code='BzComposer.companyinfo.enterAddress'/></h3>";
		}
		else if(zip == "" || zip == null){
			errorMessage = "<h3><spring:message code='err.Zip'/></h3>";
		}
	}
	if(errorMessage !="")
	{
		document.getElementById("errors").innerHTML = errorMessage;
		return false;
		event.preventDefault();
	}
	else
	{
		$.ajax({
			type: "POST",
			url:"updateEditedCompanyinfo?tabid=edit&companyName="+companyName+"&nickName="+nickName+"&businessTypeId="+businessTypeId
                    +"&fName="+fName+"&lName="+lName+"&add1="+address1+"&add2="+address2+"&cityID="+cityID+"&zip="+zip+"&province="+province
                    +"&countryId="+countryId+"&phone="+phone+"&cellphone="+cellphone+"&fax="+fax+"&email="+email+"&stateID="+stateID
                    +"&membershipLevel="+membershipLevel+"&sameAsPhoneNumber="+sameAsPhoneNumber+"&taxID="+taxID+"&jobPosition="+jobPosition
                    +"&invoiceMemo="+invoiceMemo
                    +"&invoiceMemoDays="+invoiceMemoDays
                    +"&EstimationMemo="+EstimationMemo
                    +"&memorizeEstimationDays="+memorizeEstimationDays
                    +"&overdueInvoice="+overdueInvoice
                    +"&overdueInvoiceDays="+overdueInvoiceDays
                    +"&inventoryOrder="+inventoryOrder
                    +"&inventoryOrderDays="+inventoryOrderDays
                    +"&serviceBilling="+serviceBilling
                    +"&serviceBillingDays="+serviceBillingDays
                    +"&billsToPay="+billsToPay
                    +"&billsToPayDays="+billsToPayDays
                    +"&memorizePurchaseOrder="+memorizePurchaseOrder
                    +"&memorizePurchaseOrderDays="+memorizePurchaseOrderDays
                    +"&memorizeBill="+memorizeBill
                    +"&memorizeBillDays="+memorizeBillDays,
 			success : function() {
				$("#stateID").find('option[value="'+stateID+'"]').attr("selected",true);
				document.getElementById("errors").innerHTML = "<h3>Record updated</h3>";
				SaveValues();
				//SaveSecurityValues();
	   		},
			error : function(data) {
				event.preventDefault();
				alert("<spring:message code='BzComposer.common.erroroccurred'/>");
			}
		});
	}
}

function SaveValues()
{
	
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<spring:message code='BzComposer.global.ok'/>": function () {

	        	    // document.configurationForm.currencyID.value = parseInt(document.configurationForm.currencyID.value);
	        		// var currencyValue = $.trim($("#currencyID option:selected").text());

	        		var currencyID=document.getElementById("currencyID").value;
	        		var weightID=document.getElementById("weightID").value;
	        		var defaultLabelID=document.getElementById("defaultLabelID").value;
	        		var filterOption=document.getElementById("filterOption").value;
	        		var moduleID=document.getElementById("moduleID").value;
	        		var salesOrderBoard = $("#salesOrderBoard").val();
	        		var itemReceivedBoard = $("#itemReceivedBoard").val();
	        		var poboard = $("#poboard").val();
	        		var itemShippedBoard = $("#itemShippedBoard").val();
	        		document.getElementById('salesOrderBoard').value = salesOrderBoard;
	        		document.getElementById('itemReceivedBoard').value = itemReceivedBoard;
	        		document.getElementById('itemShippedBoard').value = itemShippedBoard;
	        		document.getElementById('poboard').value = poboard;

	        		var mailServer = document.getElementById("mailServer").value;
	        		var senderEmail = document.getElementById("senderEmail").value;
	        		var mailUserName = document.getElementById("mailUserName").value;
	        		var mailPassword = document.getElementById("mailPassword").value;
	        		let showUSAInBillShipAddress = document.getElementById("showUSAInBillShipAddress").checked;
	        		
	        		let multiUserConnection = 0;
	        		
	        		
	        		if(document.getElementById("multiUserConnection2").checked)
	        		{
	        		    multiUserConnection = 1;
	        		}
	        		
	        		var leads="off",invoice="off",estimation="off",salesOrder="off";
	        		var rma="off",dataManagar="off",contact="off",events="off",calendar="off",opportunities="off",pos="off";
	        		
	        		if(document.getElementById("leads").checked)
	        			 leads="on";
	        		
	        		if(document.getElementById("invoice").checked)
	        			{
	        		    invoice="on";
	        		    document.configurationForm.invoice.value="on";
	        			}
	        		
	        		if(document.getElementById("estimation").checked)
	        			 estimation="on";
	        		
	        		if(document.getElementById("salesOrder").checked)
	        		 salesOrder="on";
	        		if(document.getElementById("rma").checked)
	        			 rma="on";  
	        		
	        		if(document.getElementById("dataManagar").checked)
	        			dataManagar="on";
	        		if(document.getElementById("contact").checked)
	        			  contact="on";
	        		
	        		if(document.getElementById("events").checked)
	        			 events="on";
	        		if(document.getElementById("calendar").checked)
	        			calendar="on";
	        		
	        		if(document.getElementById("opportunities").checked)
	        			  opportunities="on";
	        		if(document.getElementById("pos").checked)
	        			  pos="on";
	        		
	        		//alert("pos value"+pos);
	        	    /* document.getElementById('tabid').value="SaveConfigurationGeneral";
	        		document.forms[0].action = "Configuration";
	        		document.forms[0].submit(); */
	        		window.location.href= "${pageContext.request.contextPath}/Configuration?tabid=SaveConfigurationGeneral&salesOrderBoard="+salesOrderBoard
	        		    +"&itemReceivedBoard="+itemReceivedBoard+"&itemShippedBoard="+itemShippedBoard+"&poboard="+poboard+"&currencyID="+currencyID+"&weightID="+weightID
	        			+"&defaultLabelID="+defaultLabelID+"&filterOption="+filterOption+"&moduleID="+moduleID+"&mailServer="+mailServer+"&senderEmail="+senderEmail
	        			+"&mailUserName="+mailUserName+"&mailPassword="+mailPassword+"&showUSAInBillShipAddress="+showUSAInBillShipAddress+"&multiUserConnection="+multiUserConnection
	        		 +"&leads="+leads+"&invoice="+invoice+"&estimation="+estimation+"&salesOrder="+salesOrder+"&rma="+rma+"&dataManagar="+dataManagar+"&contact="+contact
	            	+"&calendar="+calendar+"&events="+events+"&opportunities="+opportunities+"&pos="+pos;
	        		 $(this).dialog("close");
	            },
	            "<spring:message code='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                return false;
	            }
	        }
	});
	return false;
}
function SaveSecurityValues(){
	
	event.preventDefault();
	$("#showsaverecorddialog").dialog({
        resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                var multiUserConnection = 0;
                if(document.getElementById("multiUserConnection2").checked){
                    multiUserConnection = 1;
                }
                var formData = $('form').serialize();
                $.ajax({
                    type : "POST",
                    url :  "ConfigurationAjax/SaveConfiguration?tabid=SaveConfiguration&multiUserConnection="+multiUserConnection,
                    data : formData,
                    success : function(data) {
                        $("#showsaverecorddialog").dialog("close");
                        $("#showsuccessdialog").dialog({
                            resizable: false,
                            height: 200,
                            width: 500,
                            modal: true,
                            buttons: {
                                "<spring:message code='BzComposer.global.ok'/>": function () {
                                    $(this).dialog("close");
                                    return false;
                                },
                                "<spring:message code='BzComposer.global.cancel'/>": function () {
                                    $(this).dialog("close");
                                    return false;
                                }
                            }
                        });
                    },
                    error : function(data) {
                        alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                    }
                });
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
    return false;
}

function SaveValuesFeatures()
{
	if(confirm('<spring:message code="BzComposer.configuration.saveconfirm"/>'))
	{
		event.preventDefault();
		$("#showsaverecorddialog").dialog({
		    	resizable: false,
		        height: 200,
		        width: 500,
		        modal: true,
		        buttons: {
		        	"<spring:message code='BzComposer.global.ok'/>": function () {
		            	document.configurationForm.selectedModules.value = document.configurationForm.selectedModules.value;
		        		document.configurationForm.selectedModuleId.value = document.configurationForm.selectedModuleId.value;

		        		var x = document.getElementById("selectedModules");
		        	    var txt = "";
		        	    var i;
		        	    for (i = 0; i < x.length; i++)
		        	    {
		        	        txt = txt + "\n" + x.options[i].text;
		        	    }
		        	    document.configurationForm.selectedModules.value = txt;

		        	    var x = document.getElementById("selectedModuleId");
		        	    var txt1 = "";
		        	    var i;
		        	    for (i = 0; i < x.length; i++)
		        	    {
		        	        txt1 = txt1 + "\n" + x.options[i].text;
		        	    }

						//$('form').submit();
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
function RevokeValues(){
	//document.getElementById('tid').value="config";
	//document.forms['configurationForm'].action = "/Configuration?tabid=config";
	//document.forms['configurationForm'].submit();
	window.location = "/Configuration?tabid=config";
}

function SetLabelName(lblid){
	size = document.getElementById('lblsize').value;
	for(cnt=0;cnt<size;cnt++){
		lid = document.getElementById(cnt+'lid').value;
		if(lblid == lid){
			document.configurationForm.labelName.value =  document.getElementById(cnt+'lname').value;
			break;
		}
	}
}

function updateComapanySecurity()
{
    
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;

	var errorMessage="";
	if(password == "" || password == null || confirmPassword == "" || confirmPassword == null){
        errorMessage = "<h3><spring:message code='BzComposer.signin.pleaseenterpassword'/></h3>";
    }
    else if(password != confirmPassword){
        errorMessage = "<h3><spring:message code='BzComposer.common.bothPwdsNotMatch'/></h3>";
    }
	if(errorMessage !=""){
		document.getElementById("errorsPWD").innerHTML = errorMessage;
		return false;
		event.preventDefault();
	}
	else
	{
		$.ajax({
			type: "POST",
			url:"updateEditedCompanyinfo?tabid=editSecurity&password="+password,
 			success : function() {
 			    document.getElementById("errorsPWD").innerHTML = "<h3>Record updated</h3>";
	   		},
			error : function(data) {
				event.preventDefault();
				$("#errorOccurred").dialog({
			    	resizable: false,
			        height: 200,
			        width: 500,
			        modal: true,
			        buttons: {
			            "Ok": function () {
			                $(this).dialog("close");
			            }
			        }
			    });
			    return false;
			}
		});
	}
}

function ValidateEmail(email) {
    var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return expr.test(email);
}
function copyPhoneNumber(form){
    if(form.sameAsPhoneNumber.checked){
        form.cellPhone.value = form.phone.value
    }
}
function setPhonePattern(phoneItem){
    phone = phoneItem.value;
	if(phone.length < 10 || phone.length > 14){
		event.preventDefault();
		$("#enterPhoneNumber").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	            "Ok": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	    return false;
	}
	let cleaned = ('' + phone).replace(/\D/g, '');
	let match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
	if (match) {
		phoneItem.value = '('+ match[1] +') '+ match[2] +'-'+ match[3];
  	}
}

// form fields description structure
var a_fields = {
	'uname' : {
		'l': 'Login Name',  // label
		'r': true,    // required
		'f': 'alphanum',  // format (see below)
		't': 't_uname',// id of the element to highlight if input not validated
		'm': null,     // must match specified form field
		'mn': 4,       // minimum length
		'mx': 16       // maximum length
	},
	'pass' : {'l':'Password','r':true,'f':'alphanum','t':'t_password','m':'pass_con','mn':'6','mx':'16'},
	'pass_con' : {'l':'Password confirm','r':true,'f':'alphanum','t':'t_password_copy','mn':'6','mx':'16'},
	'email' : {'l':'E-mail','r':true,'f':'email','t':'t_email','m':'email_con'},
	'email_con' : {'l':'E-mail confirm','r':true,'f':'email','t':'t_emailcon'},
	'question' : {'l':'Password Reminder Question','r':true,'f':'alphanum','t':'t_question'},
	'answer' : {'l':'Answer','r':true,'f':'alphanum','t':'t_answer'}
},
o_config = {
	'to_disable' : ['Submit'],
	'alert' : 1
}
// validator constructor call
var v = new validator('login', a_fields, o_config);
//========================================== Security-Module-JS =================================================
function updateUser(){
    $('#updateUser').modal('show');
    }
function adduser1() {

	var membershipLevel = "<%=request.getAttribute("membershipLevel")%>";
	var size = "<%=request.getAttribute("userSize")%>";
	if(membershipLevel == "Standard" || membershipLevel == "standard"){
		if(size>=1){
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	}else if(membershipLevel == "Professional" || membershipLevel == "professional"){
		if(size>=5){
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	}else if(membershipLevel == "Enterprise" || membershipLevel == "enterprise"){
		if(size>=10){
			return maxnumberofuserdialog();
		}else{
			$('#AddUser').modal('show');
		}
	}
}
function Deleteuser() {
    if($('#selectedUserId').val() == ''){
        alert("<spring:message code='BzComposer.common.selectUserFirst'/>");
        return false;
    }
    $("#showDeleteGroupConfirmDialog").dialog({
        resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                window.location.href = "Configuration?tabid=deleteUser&selectedUserId="+$('#selectedUserId').val()+"&userGroupId="+$('#userGroupId').val();
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
}
function updateUserValues(){

    var selectedUserId = $("#selectedUserId").val();
    var userEmail = $("#userEmail1").val();
    var password1 = $("#userPassword1").val();
    var password2 = $("#cpwd1").val();
    var groupID = $("#groupID1").val();
    var adminPWD = $("#adminpassword1").val();
    var AdminPassword = '<%=request.getAttribute("AdminPassword")%>';
    var checkEmailAddress = (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(userEmail));
    if (checkEmailAddress == false){
        alert("<spring:message code='BzComposer.common.enterValidEmail'/>");
        return;
    }
    else if(userEmail == ""){
        alert("<spring:message code='BzComposer.common.emailCantBlank'/>");
        return;
    }
    else if(password1.length < 6){
        alert("<spring:message code='BzComposer.common.passwordHint'/>");
        return;
    }
    else if(password1 != password2){
         alert("<spring:message code='BzComposer.common.bothPwdsNotMatch'/>");
         alert(password1+'\n'+password2);
         return;
    }
    else if(adminPWD != AdminPassword){
         alert("<spring:message code='BzComposer.common.enterValidAdminPwd'/>");
         return;
    }
    else if(groupID == "" || groupID == 0){
        alert("<spring:message code='BzComposer.common.selectGroupFirst'/>");
        return;
    }
    else{
        var formData = $('addnewuser1').serialize();
        $.ajax({
            type : "POST",
            url : "ConfigurationAjax/SaveConfiguration?tabid=updateUser&selectedUserId="+selectedUserId+"&userEmail="+userEmail+"&userpassword="+password1+"&groupID="+groupID,
            data : formData,
            success : function(data) {
                if(data == 'emailExists'){
                    $("#showEmailAlreadyExistsDialog").dialog({
                        resizable: false,
                        height: 200,
                        width: 500,
                        modal: true,
                        buttons: {
                            "<spring:message code='BzComposer.global.ok'/>": function () {
                                $(this).dialog("close");
                                return false;
                            }
                        }
                    });
                }else{
                    $("#showsuccessdialog").dialog({
                        resizable: false,
                        height: 200,
                        width: 500,
                        modal: true,
                        buttons: {
                            "<spring:message code='BzComposer.global.ok'/>": function () {
                                $(this).dialog("close");
                                window.location.href= "Configuration?tabid=config&tab=tr2";
                                return false;
                            },
                            "<spring:message code='BzComposer.global.cancel'/>": function () {
                                $(this).dialog("close");
                                window.location.href= "Configuration?tabid=config&tab=tr2";
                                return false;
                            }
                        }
                    });
                }
            },
            error : function(data) {
                alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                return false;
            }
        });
    }
}
function checkValidation(){
    
    var userEmail = $("#userEmail").val();
    var password1 = $("#userPassword").val();
    var password2 = $("#cpwd").val();
    var groupID = $("#groupID").val();
    var adminPWD = $("#adminpassword").val();
    var AdminPassword = '<%=request.getAttribute("AdminPassword")%>';
    var checkEmailAddress = (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(userEmail));
    if (checkEmailAddress == false){
        alert("<spring:message code='BzComposer.common.enterValidEmail'/>");
        return;
    }
    else if(userEmail == ""){
        alert("<spring:message code='BzComposer.common.emailCantBlank'/>");
        return;
    }
    else if(password1.length < 6){
        alert("<spring:message code='BzComposer.common.passwordHint'/>");
        return;
    }
    else if(password1 != password2){
         alert("<spring:message code='BzComposer.common.bothPwdsNotMatch'/>");
         alert(password1+'\n'+password2);
         return;
    }
    else if(adminPWD != AdminPassword){
         alert("<spring:message code='BzComposer.common.enterValidAdminPwd'/>");
         return;
    }
    else if(groupID == "" || groupID == 0){
        alert("<spring:message code='BzComposer.common.selectGroupFirst'/>");
        return;
    }
    else{
        var formData = $('addnewuser1').serialize();
        $.ajax({
            type : "POST",
            url : "ConfigurationAjax/SaveConfiguration?tabid=addNewUser&userName="+userEmail+"&userpassword="+password1+"&groupID="+groupID,
            data : formData,
            success : function(data) {
                if(data == 'emailExists'){
                    $("#showEmailAlreadyExistsDialog").dialog({
                        resizable: false,
                        height: 200,
                        width: 500,
                        modal: true,
                        buttons: {
                            "<spring:message code='BzComposer.global.ok'/>": function () {
                                $(this).dialog("close");
                                return false;
                            }
                        }
                    });
                }else{
                    $("#showsuccessdialog").dialog({
                        resizable: false,
                        height: 200,
                        width: 500,
                        modal: true,
                        buttons: {
                            "<spring:message code='BzComposer.global.ok'/>": function () {
                                $(this).dialog("close");
                                window.location.href= "Configuration?tabid=config&tab=tr2";
                                return false;
                            },
                            "<spring:message code='BzComposer.global.cancel'/>": function () {
                                $(this).dialog("close");
                                window.location.href= "Configuration?tabid=config&tab=tr2";
                                return false;
                            }
                        }
                    });
                }
            },
            error : function(data) {
                alert("<spring:message code='BzComposer.common.erroroccurred'/>");
                return false;
            }
        });
    }
}

function getData(){
    var modalNewPassword = document.getElementById('modalNewPassword').value;
    var modalConfirmPassword = document.getElementById('modalConfirmPassword').value;
    window.location.href= "Configuration?tabid=ChangeAdministratorPassword&modalNewPassword="+modalNewPassword;
}

function viewGroupPermissions(){
    if($('#groupID').val() == ''){
        alert("<spring:message code='BzComposer.common.selectGroupFirst'/>");
    }else{
        window.open("Configuration?tabid=addNewGroup&selectedGroupId="+$('#groupID').val()+"&isViewGroupPermissions=true",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );
    }
}

function addNewGroup(){
    window.open("Configuration?tabid=addNewGroup",null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );
}
function editGroup(){
    if($('#selectedGroupId').val()>0){
        window.open("Configuration?tabid=addNewGroup&selectedGroupId="+$('#selectedGroupId').val(),null,"scrollbars=yes,height=600,width=1200,status=yes,toolbar=no,menubar=no,location=no" );
    }else{
        alert("<spring:message code='BzComposer.common.selectGroupFirst'/>");
    }
}

function selectUserData(selectedUserId, userGroupId, emailAddress, password, groupName, status, rID){
    var size = document.getElementById('usersSize').value;
    for(i=0; i<size; i++){
        if(document.getElementById(i+"usrIndex").classList.contains('draft')){
            document.getElementById(i+"usrIndex").classList.remove('draft');
        }
    }
    document.getElementById(rID).className = "draft";
    document.getElementById('selectedUserId').value = selectedUserId;
    document.getElementById('userGroupId').value = userGroupId;
    // set value for update user
    document.getElementById('userEmail1').value = emailAddress;
    document.getElementById('userPassword1').value = password;
    document.getElementById('cpwd1').value = password;
    $('select[id="groupID1"]').find('option[value="'+userGroupId+'"]').attr("selected",true);
}

function selectGroupData(selectedGroupId, rID){
    var size = document.getElementById('groupSize').value;
    for(i=0; i<size; i++){
        if(document.getElementById(i+"gpIndex").classList.contains('draft')){
            document.getElementById(i+"gpIndex").classList.remove('draft');
        }
    }
    document.getElementById(rID).className = "draft";
    document.getElementById('selectedGroupId').value = selectedGroupId;
}

function deleteGroup(){
    if($('#selectedGroupId').val() == '' || $('#selectedGroupId').val() == 0){
        alert("<spring:message code='BzComposer.common.selectGroupFirst'/>");
        return false;
    }
    $("#showDeleteGroupConfirmDialog").dialog({
        resizable: false,
        height: 200,
        width: 500,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                window.location.href = "Configuration?tabid=deleteGroup&selectedGroupId="+$('#selectedGroupId').val();
            },
            <spring:message code='BzComposer.global.cancel'/>: function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
}

function maxnumberofuserdialog()
{
	event.preventDefault();
	$("#maxnumberofuserdialog").dialog({
    	resizable: false,
        height: 250,
        width: 800,
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
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.configuration.saveconfirm" />
	</p>
</div>
<div id="serverConnectedErrorDialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.configuration.manageservicetype.serverconnectederror" />
	</p>
</div>
<div id="serverConnectedSeccessDialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.configuration.manageservicetype.serverconnectedsuccess" />
	</p>
</div>
<div id="pleaseWaitDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.configuration.pleaseWait" />
	</p>
</div>
<div id="errorOccurred" style="display: none; font-size: 1em;">
	<p>
		<spring:message code="BzComposer.common.erroroccurred" />
	</p>
</div>
<div id="enterPhoneNumber" style="display: none; font-size: 1em;">
	<p>
		<spring:message code="BzComposer.companyinfo.enterphonenumber" />
	</p>
</div>
<div id="enterZip" style="display: none; font-size: 1em;">
	<p>
		<spring:message code="err.Zip" />
	</p>
</div>
<div id="showsuccessdialog" style="display: none;">
	<p>
		<spring:message code='BzComposer.common.recordUpdated' />
	</p>
</div>
<div id="maxnumberofuserdialog" style="display: none;">
	<p>
		<spring:message
			code="BzComposer.configuration.networksecurity.maxnumberofuser" />
	</p>
</div>
<div id="showDeleteGroupConfirmDialog" style="display: none;">
	<p>
		<spring:message code="BizComposer.PurchaseOrder.Delete.Validation" />
	</p>
</div>
<div id="showEmailAlreadyExistsDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.common.emailAlreadyExists" />
	</p>
</div>
