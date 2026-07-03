<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.vendorpurchaseordertitle" /></title>

<script type="text/javascript">
function toggleFunction() {
	
  var x = document.getElementById("divtoggle");
  var lftmenu = document.getElementById("leftMenu");
  if (x.style.display === "none") {
    x.style.display = "block";
    lftmenu.style.width = "180px";
    lftmenu.style.position = "relative";
  } else {
    x.style.display = "none";
    lftmenu.style.width = "0";
    lftmenu.style.position = "absolute";
  }
} 
$(function() {
    $( "#tabs" ).tabs();
    $( "#tabs1" ).tabs();
  });
$(document).ready(function()
{
	
});

function numbersonly(e,val)
{
	var temp=val.indexOf(".");
	var unicode=e.charCode? e.charCode : e.keyCode;

	if (unicode!=8)
	{
 		//if the key isn't the backspace key (which we should allow)
		if(unicode==46 && temp==-1)
		{
 			return true;
		} 
		else 
		if (unicode<48||unicode>57) //if not a number
			return false; //disable key press
	}
}


function disable() 
{
	var value = document.configurationForm.selectedCountryId.value;
	if(value == "2")
	{
		document.configurationForm.selectedStateId.disabled=false;
	}
	else
	{
		document.configurationForm.selectedStateId.disabled=true;
	}
}

function clearDescription(){
	document.getElementById("description").value = "";
}

let custTypeID = 0;
function setCustomerType(ctID){
    custTypeID = ctID;
    let mySelectBox = document.getElementById('customerType');
    document.getElementById('custTypeName').value = mySelectBox.options[mySelectBox.selectedIndex].text;
}


let prodList =[];

function setdeactivate() {
	
	var sel = document.getElementById("productListId");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;

	var sel1 = document.getElementById('InvoiceStyleId1');
	sel.remove(sel.selectedIndex);

	var opt = document.createElement('option');
	opt.appendChild( document.createTextNode(selectValue) );
	opt.value = selectValue1;
	sel1.appendChild(opt);
	prodList.push(selectValue1);
}

function setactivate() {
	
	var sel = document.getElementById("InvoiceStyleId1");
	var selectValue = sel.options[sel.selectedIndex].text;
	var selectValue1 = sel.options[sel.selectedIndex].value;

	var sel1 = document.getElementById('productListId');
	sel.remove(sel.selectedIndex);

	var opt = document.createElement('option');
	opt.appendChild( document.createTextNode(selectValue) );
	opt.value = selectValue1;
	sel1.appendChild(opt);
	removeElement(prodList, selectValue1);
}

function removeElement(prodList, elementToRemove) {
    prodList.forEach((item, index) => {
        if (item === elementToRemove) {
            prodList.splice(index, 1);
        }
    });
    return prodList;
}
</script>
</head>
<!-- <body onload="init1();"> -->
<body onload="init();">
<!-- begin shared/header -->
<form:form name="configurationForm" id="frmPOS"  enctype="MULTIPART/FORM-DATA" method="post" modelAttribute="configDto">
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">

	<div>
		<span style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<spring:message code="BzComposer.configuration.configurationtitle"/>
		</span>
	</div>
	<div>
		<div>
			<c:if test="${not empty Labels}">
                <input type="hidden" name="lsize" id="lblsize" value='${Labels.size()}' />
                <c:forEach items="${Labels}" var="lbl" varStatus="loop">
                    <input type="hidden" id='${loop.index}lid' name='${loop.index}lidname' value='${lbl.value}' />
                    <input type="hidden" id='${loop.index}lname' name='${loop.index}lnm' value='${lbl.label}' />
                </c:forEach>
			</c:if>
		</div>
		<div id="table-negotiations" style="padding: 0; border: 1px solid #ccc;">
		<span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span>
			<table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
				<tr>
					<td id="leftMenu" style="position: relative; width: 180px;">
						<table>
							<tr>
								<td>
									<jsp:include page="menuPage.jsp" />
								</td>
							</tr>
						</table>
					</td>
					<td valign="top" >
					    <div id="tabs" style="height:auto;">
                            <ul>
                                <li style="font-size: 12px;"><a href="#designTab"><spring:message code="BizComposer.Configuration.POS.Design" /></a></li>
                                <li style="font-size: 12px;"><a href="#featuresTab"><spring:message code="BizComposer.Configuration.POS.Features" /></a></li>
								<li style="font-size: 12px;"><a href="#templatesTab"><spring:message code="BizComposer.Configuration.POS.Templates" /></a></li>
                            </ul>
                            <!-- designTab Starts -->
                            <div id="designTab" style="display:none;">
                                <table class="table-notifications" width="100%">
                                    <tr>
                                        <th colspan="4" style="font-size:12px; padding: 5px;"><spring:message code="BizComposer.Configuration.POS.Design.Header" /></th>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-size:12px;">
                                            <input type="checkbox" id="productIcons" name="productIcons" ${productIcons=='true'?'checked':''}/>
                                            <spring:message code="BzComposer.configuration.POS.producticons"/>
                                        </td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-size: 12px;">
                                            <input type="checkbox" id="gridsSalesSlip" name="gridsSalesSlip" ${gridsSalesSlip=='true'?'checked':''}/>
                                            <spring:message code="BzComposer.configuration.POS.gridsslip"/>
                                        </td>
                                        <td colspan="2">&nbsp;</td>
                                    <tr>
                                        <td colspan="2" style="font-size:12px;">
                                            <input type="checkbox" id="calculatorDisplay" name="calculatorDisplay" ${calculatorDisplay=='true'?'checked':''}/>
                                            <spring:message code="BzComposer.configuration.POS.calpage"/>
                                        </td>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                    					<td style="font-size:12px;">
                        				<spring:message code="BzComposer.customer.CustomerType"/> :
                    					</td>
                    					<td style="font-size:12px;" id="customerTypeId">
                        					<form:select path="customerType" onchange="setCustomerType(this.value);">
                            				<form:options items="${customerTypeList}" itemValue="value" itemLabel="label"/>
                        				</form:select>
                    					</td>
                    					<td colspan="2">
                        					<div style="float:left;"><input id="custTypeName" value="${custTypeName}"/></div>
                        				</td>
                					</tr>
                                    <tr>
                                        <th colspan="4" style="font-size:12px; padding: 5px;"><spring:message code="BzComposer.configuration.POS.prodlist" /></th>
                                    </tr>
                                    <tr>
                                    <td style="width:60px;font-size:12px;">
                                        <select id="productListId" name="productListId" style="display:block; width: 200px; height: 200px;" multiple="multiple">
                                            <c:forEach items="${bcaItemcategory}" var="ItemCategoryObj">
                                    			<option value="${ItemCategoryObj.itemCategoryId}">${ItemCategoryObj.name}</option>
                                			</c:forEach>
                                        </select>
                                    </td>

                                    <td align="center" style="font-size:12px;width: 100px;">
                                        <br><br><br><br>
                                        <input type="button" id="addL2R" class="formButton" name="addL2R" onclick="setdeactivate()"  value="<spring:message code="BzComposer.configuration.lefttorightbtn"/>" style="width: 40px;">
                                        <br><br>
                                        <input type="button" id="addR2L" style="width:40px;" class="formButton" name="addR2L" onclick="setactivate()"  value="<spring:message code="BzComposer.configuration.righttoleftbtn"/>">
                                    </td>
                                    <td style="font-size:12px;">
                                    <select id="InvoiceStyleId1" name="InvoiceStyleId1" style="display:block; width: 200px; height: 200px;" multiple="multiple">
                                        <c:if test="${not empty selectedItemcategory}">
                                            <c:forEach items="${selectedItemcategory}" var="selectedObjList">
                                                <option value="${selectedObjList.itemCategoryId}">${selectedObjList.name}</option>
                                            </c:forEach>
                                        </c:if>
                                        </select>
                                    </td>
                                </tr>
                                    </table>
                            </div>
							<!-- ==================== features-Tab =================== -->
							<div id="featuresTab" style="display:none;">
							<table class="table-notifications" width="100%">
								<tr>
									<th colspan="4" align="left" style="font-size:12px; padding: 5px;"><spring:message code="BizComposer.Configuration.POS.Features.Header" />
									</th>
								</tr>
								<tr>
									<td colspan="2" style="font-size:12px;">
										<spring:message code="BizComposer.Configuration.POS.Features.SalesRate"/> : &nbsp;&nbsp;
										<input id="salesTaxRate" align="left" value="${salesTaxRate}" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<th colspan="4" align="left" style="font-size:12px; padding: 5px;">
										<spring:message code="BizComposer.Configuration.POS.Features.SpecialPrice" />
									</th>
								</tr>
								<tr>
									<td style="font-size:12px;">
										<spring:message code="BizComposer.Configuration.POS.Features.Police"/> : &nbsp;&nbsp;
										<input id="spPolice" value="${spPolice}" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
									</td>
								</tr>
								<tr>
									<td style="font-size:12px;">
										<spring:message code="BizComposer.Configuration.POS.Features.Retailer"/> : &nbsp;&nbsp;
										<input id="spRetailer" value="${spRetailer}" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
									</td>
								</tr>
								<tr>
									<td style="font-size:12px;">
										<spring:message code="BizComposer.Configuration.POS.Features.Wholesaler"/> : &nbsp;&nbsp;
										<input id="spWholesaler" value="${spWholesaler}" onkeydown="return numbersonly(event, this.value)" style="width:100px;text-align: right;vertical-align: middle;" />%
									</td>
								</tr>
							</table>
							</div>
							<!-- ==================== Template-Tab =================== -->
							<div id="templatesTab" style="display:none;">
								<table class="table-notifications" style="width:100%">
									<tr>
										<th colspan="4" align="left" style="font-size:12px; padding:5px;">
											<spring:message code="BizComposer.Configuration.POS.Design.Header" />
										</th>
									</tr>
									<tr style="border-top: 1px solid grey;">
										<td style="padding-top:25px;font-size:12px;">
											<label class="switch switchIV">
												<input type="radio" value="1" name="templateId" onchange="changePosTemplateTypeValue(1)" ${posTemplateType==1?'checked':''} />
											</label>
											<strong>1 POS Design</strong><br/>
											<img class="parentImage" src="${pageContext.request.contextPath}/images/new/pos/3-pos-design.png" style="width:95%;" />
										</td>
										<td style="padding-top:25px;font-size:12px;">
											<label class="switch switchIV">
												<input type="radio" name="templateId" value="2" onchange="changePosTemplateTypeValue(2)" ${posTemplateType==2?'checked':''} />
											</label>
											<strong>2 POS Design</strong><br/>
											<img class="parentImage" src="${pageContext.request.contextPath}/images/new/pos/1-pos-design.png" style="width:95%;" />
										</td>
										<td style="padding-top:25px;font-size:12px;">
											<label class="switch switchIV">
												<input type="radio" value="3" name="templateId" onchange="changePosTemplateTypeValue(3)" ${posTemplateType==3?'checked':''} />
											</label>
											<strong>3 POS Design</strong><br/>
											<img class="parentImage" src="${pageContext.request.contextPath}/images/new/pos/2-pos-design.png" style="width:95%;" />
										</td>


									</tr>
								</table>
							</div>
			</div>
			<div align="center">
			<input type="submit" name="Submit" class="bottomButton formButton" value="<spring:message code='BzComposer.global.save'/>"/>
			<input type="reset" name="Cancel" class="bottomButton formButton" onclick="RevokeValues()" value="<spring:message code='BzComposer.global.cancel'/>"/>
			</div>

			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<input type="hidden" value="${posTemplateType}" id="posTemplateType"/>
</form:form>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
<script type="text/javascript">

$("#frmPOS").submit(function(event) {
    var productIcons='';
    var gridsSalesSlip='';
    var calculatorDisplay='';
    var customerTypeId='';
    var productListId='';

    var salesTaxRate='';
    var spPolice='';
    var spRetailer='';
    var spWholesaler='';
    var tabName='';
	var posTemplateType = '';
	debugger;
    if(document.getElementById('designTab').getAttribute('aria-hidden') == 'false'){
    	productIcons =document.getElementById('productIcons').checked;
    	gridsSalesSlip = document.getElementById('gridsSalesSlip').checked;
    	calculatorDisplay =document.getElementById('calculatorDisplay').checked;
    	customerTypeId = document.getElementById('customerType').value;

    	var allOptions = document.getElementById("InvoiceStyleId1");
    	var productList = "";
    	var i;
    	for (i = 0; i < allOptions.length; i++) {
    		if (productList==''){
    			productList =  allOptions.options[i].value;
    		} else {
    			productList = productList + "," + allOptions.options[i].value;
    		}
    	}
    	console.log("productList-----------"+productList);
    	productListId = productList;
    	tabName='designTab';
    }else if(document.getElementById('templatesTab').getAttribute('aria-hidden') == 'false'){
		posTemplateType = document.getElementById("posTemplateType").value;
		tabName='templatesTab';
	}else {
    	salesTaxRate =document.getElementById('salesTaxRate').value;
		spPolice = document.getElementById('spPolice').value;
    	spRetailer =document.getElementById('spRetailer').value;
    	spWholesaler =document.getElementById('spWholesaler').value;
    	tabName='featuresTab';
    }

	event.preventDefault();
	$("#showsaverecorddialog").dialog({
	    	resizable: false,
	        height: 200,
	        width: 500,
	        modal: true,
	        buttons: {
	        	"<spring:message code='BzComposer.global.ok'/>": function () {

					//$('form').submit();
					var formData = $('frmPOS').serialize();
	        		$.ajax({
	        			type:"POST",
	        			url:"ConfigurationPOSAjax/SaveConfiguration?tabid=DesignFeature&tabName="+tabName+
	        			"&posTemplateType="+posTemplateType+
						"&productIcons="+productIcons+
	        			"&gridsSalesSlip="+gridsSalesSlip+"&calculatorDisplay="+calculatorDisplay+
	        			"&customerTypeId="+customerTypeId+"&productListId="+productListId+"&salesTaxRate="+salesTaxRate+
	        			"&spPolice="+spPolice+"&spRetailer="+spRetailer+"&spWholesaler="+spWholesaler,
	        			data:formData,
	        			success:function(data) {
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
	        			error:function(data) {
	        			    $("#showsaverecorddialog").dialog("close");
	        				alert("<spring:message code='BzComposer.common.erroroccurred'/>");
	        			}
	        		});
	            },
	            "<spring:message code='BzComposer.global.cancel'/>": function () {
	                $(this).dialog("close");
	                /* stop form from submitting normally */
	                event.preventDefault();
	                return false;
	            }
	        }
	    });
	    return false;

  });


function changePosTemplateTypeValue(value){
	document.getElementById("posTemplateType").value = value;
}
</script>
</html>
<!-- Dialog box used in this page -->
<div id="showsaverecorddialog" style="display:none;">
	<p><spring:message code="BzComposer.configuration.saveconfirm"/></p>
</div>
<div id="showsuccessdialog" style="display:none;">
    <p><spring:message code="BzComposer.common.recordUpdated"/></p>
</div>