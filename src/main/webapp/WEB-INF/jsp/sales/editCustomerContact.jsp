<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <title><spring:message code="BzComposer.addnewcustomertitle"/></title>
    <link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen"/>
    <script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
    <style>
        table.tabla-listados thead tr th {
            font-size: 14px;
        }

        table.tabla-listados tbody tr td {
            font-size: 12px;
        }

        #tabs ul li {
            font-size: 12px !important;
        }

        input, textarea, select {
            font-size: 12px !important;
        }
    </style>
    <script type="text/javascript">
        selectValidCountryMsg = "<spring:message code='BzComposer.register.selectvalidcountry'/>";
        selectValidStateMsg = "<spring:message code='BzComposer.register.selectvalidstate'/>";
        selectValidZipcodeMsg = "<spring:message code='BzComposer.register.selectvalidzipcode'/>";
        noRecordsFoundMsg = "<spring:message code='BzComposer.employee.norecordsfound'/>";

        $(function () {
            self.moveTo(100, 10);
            $("#tabs").tabs();
        });
    </script>
</head>
<body >
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<%-- <form:form action="Customer/AddCustomer" method="post" id="frmNewCustomer"> --%>
<form:form name="CustomerForm" method="post" id="frmNewCustomer" modelAttribute="customerContactDto">
    <input type="hidden" name="tabid" id="tabid" value=""/>
    <div id="cos">
        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">
                        <!-- begin Contents -->
                        <!-- add the code for tab here -->
                        <div>
		<span style="font-size: 1.2em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
			<spring:message code="BzComposer.customer.editContactTitle"/>
		</span>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" align=center style="width: 100%;">
                            <c:if test="${not empty Status}">
                                <tr>
                                    <td colspan="3">
                                        <span class="msgstyle">${Status}</span>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${not empty actionMsg}">
                                <tr>
                                    <td colspan="3">
                                        <span class="msgstyle">${actionMsg}</span>
                                        <% session.removeAttribute("actionMsg"); %>
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                        
                                    <div id="table-negotiations">
                                        <table class="tabla-listados" cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th colspan="7">
                                                    <spring:message code="BzComposer.customer.opportunity.contactDetails"/>
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr style="height:40px">
                                                <td><spring:message code="BzComposer.global.contactid"/></td>
                                                <td><form:input path="contactID" readonly="true"
                                                                style="width:100px;"/></td>
                                                <td colspan="5">&nbsp;</td>
                                            </tr>
                                            <tr style="height:40px">
                                                <td>
                                                    <spring:message code="BzComposer.global.titlename"/>
                                                </td>
                                                <td colspan="5">
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td>
                                                                <form:select path="title" style="width:100px;">
                                                                    <option value=""><spring:message
                                                                            code="BzComposer.ComboBox.Select"/></option>
                                                                    <c:forEach items="${titleList}" var="curObject">
                                                                        <option value="${curObject.value}" ${curObject.value==defaultCongurationData.custTitleID?'selected':''}>${curObject.label}</option>
                                                                    </c:forEach>
                                                                </form:select>
                                                            </td>
                                                            <td>
                                                                <spring:message code="BzComposer.global.firstname"/>
                                                                <span class="inputHighlighted"><spring:message
                                                                        code="BzComposer.CompulsoryField.Validation"/></span>
                                                            </td>
                                                            <td>
                                                                <form:input path="firstName" size="20"/>
                                                            </td>
                                                            <td>
                                                                <spring:message code="BzComposer.global.middlename"/>
                                                            </td>
                                                            <td>
                                                                <form:input path="middleName" size="15"/>
                                                            </td>
                                                            
                                                            
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr style="height:40px">
                                                <td>
                                                                <spring:message code="BzComposer.global.lastname"/>
                                                                <span class="inputHighlighted"><spring:message
                                                                        code="BzComposer.CompulsoryField.Validation"/></span>
                                                   </td>
                                                   <td>
                                                                <form:input path="lastName" size="20"/>
                                                     </td>
                                               
                                                <td><spring:message code="BzComposer.customer.ContactTitle"/><span class="inputHighlighted"><spring:message
                                                                        code="BzComposer.CompulsoryField.Validation"/></span></td>
                                                <td><form:input path="contactTitle"/></td>
                                                <td>&nbsp;</td>
                                            </tr>
                                         <tr style="height:40px">
                                                <td>
                                                    <spring:message code="BzComposer.global.email"/>
                                                    <span class="inputHighlighted"><spring:message
                                                            code="BzComposer.CompulsoryField.Validation"/></span>
                                                </td>
                                                <td colspan="3">
                                                    <form:input type="email" path="email" size="40"/>
                                                </td>
                                                <td>
                                                    <spring:message code="BzComposer.global.phone"/>
                                                </td>
                                                <td>
                                                    <form:input path="phone" size="40"/>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                             
                                           </tbody>
                                        </table>
                                    </div>           
                                </div>
                            </div>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" align=center
                               style="width: 100%;margin-top:5px;">
                            <script>
                                count = 0;
                                cnt = 0;
                                var exist = new Array(10);
                                for (i = 0; i < exist.length; i++) {
                                    exist[i] = -1;
                                }
                            </script>
                            <tr>
                                <td valign=top class="tabPage">
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                  
                                    <button type="button" class="formbutton" title="Edit Customer Contact"
                                            onclick="updateCustomerContact();"><spring:message
                                            code='BzComposer.global.update'/></button>
                                    <button type="button" class="formbutton" title="Close" onclick="CloseMe();">
                                        <spring:message code='BzComposer.global.close'/></button>
                                    <input type="hidden" name="stname" value="" id="stateId"/>
                                </td>
                            </tr>
                        </table>
                        
                        <div>
                            <input type="hidden" name="bst" id="bsst" value="0"/>
                            <form:hidden path="clientvendorID" />
                        </div>
                    </div>
                </div>
        
</form:form>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>
<script>
    window.onunload = refreshParent;

    function refreshParent() {
       window.opener.location.reload();
    }

    function validate() {
        var email = document.CustomerForm.email.value;
        var mail = String(email);
        var pattern = /^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
        if (email == "") {
            return enterEmailValidationDialog();
            return false;
        } else if (!pattern.test(email)) {
            document.CustomerForm.email.focus();
            return showEmailValidationDialog();
            return false;
        }
        if (mail.length >= 50) {
            document.CustomerForm.email.value = "";
            document.CustomerForm.email.focus();
            return showEmailLengthValidationDialog();
            return false;
        }
        return true;
    }


    function numbersonly(e, val) 
    {
        var temp = val.indexOf(".");
        var unicode = e.charCode ? e.charCode : e.keyCode;
        if (unicode != 8) {
            //if the key isn't the backspace key (which we should allow)
            if (unicode == 46 && temp == -1) {
                return true;
            } else if (unicode < 48 || unicode > 57) {
                return false; //disable key press
            }
        }
    }

    function validateMail() {
        var email = document.CustomerForm.email.value;
        var mail = String(email);
        var pattern = /^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
        if (email == "") {
            return enterEmailValidationDialog();
            return false;
        } else if (!pattern.test(email)) {
            document.CustomerForm.email.focus();
            return showEmailValidationDialog();
            return false;
        }
        if (mail.length >= 50) {
            document.CustomerForm.email.value = "";
            document.CustomerForm.email.focus();
            return showEmailLengthValidationDialog();
            return false;
        }
        return true;
    }

    
function updateCustomerContact()
{


	var  cid=document.CustomerForm.contactID.value;
	var  phone=document.CustomerForm.phone.value;
	var firstName=document.CustomerForm.firstName.value;
	var middleName=document.CustomerForm.middleName.value;
	var lastName=document.CustomerForm.lastName.value;
	 var title= document.CustomerForm.contactTitle.value;
	 var phoneNum=String(phone);
	 
	 
	 if(firstName=="")
		 {
		 showFirstNameDialog();
		 return false ;
		 }
	 else if(lastName=="")
		 {
		 showLastNameDialog();
		 return false ;
		 }
	 else if(title=="")
	 {
	showTitleDialog();
	 return false ;
	 }
	 else if(phoneNum==""||phoneNum.length>=16)
		 {
		    showCellPhoneLengthDialog();
		    return false ;
		 }
	  else if(validateMail()==false)
		{
		 enterEmailValidationDialog();
		  return false ;
		}
	
	
	 var conactDetails= 
	   {
      "contactID":document.CustomerForm.contactID.value,
"clientvendorID": document.CustomerForm.clientvendorID.value,
     "firstName": document.CustomerForm.firstName.value,
    "middleName":document.CustomerForm.middleName.value,
      "lastName":document.CustomerForm.lastName.value,
      	"title":document.CustomerForm.contactTitle.value,
    	"email":document.CustomerForm.email.value,
    	"phone":document.CustomerForm.phone.value
   };
	 
	
 
 var obj=JSON.stringify(conactDetails);
 
 $.ajax({
 		type : "POST",
 		url : "customerContacts?tabid=update",
 	    data :"data=" + obj,
 	    success : function(data)
 	    {
 	    	 showNameDialog();
 		}
 		,
 		 error : function(data) 
 		 {
 			 
 			 return showerrordialog();
 		  }
 	});

}
    

    function maxnumberofuserdialog() {
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

    function toggleFields(form) {
        var chbox = document.getElementById('chk_useind');

        // Define the fields to be toggled
        var fieldsToToggle = ['annualIntrestRate', 'minFCharges', 'gracePrd', 'chk1', 'chk2'];

        fieldsToToggle.forEach(function (fieldName) {
            var field = document.CustomerForm[fieldName];
            if (chbox.checked) {
                field.removeAttribute('readonly');
            } else {
                field.setAttribute('readonly', 'true');
            }
        });
    }

   function removeStringValues(key) {	//from one string('str'), a substring 'key' will be removed
        var str, str2, str3;
        var temp = new Array(20);
        var temp2 = new Array(20);
        var temp3 = new Array(20);

        str = document.forms[0].table_serID.value;
        str2 = document.forms[0].table_bal.value;
        str3 = document.forms[0].table_invId.value;

        temp = str.split(";");
        temp2 = str2.split(";");
        temp3 = str3.split(";");

        str = str2 = str3 = "";
        for (i = 0; i < temp.length; i++) {
            if (temp[i] != key) {
                k = 0;
                for (k = 0; k < i; k++) {
                    if (temp[i] == temp[k]) {
                        k = -1;
                        break;
                    }
                }
                if (k != -1) {
                    str = str + temp[i] + ";";
                    str2 = str2 + temp2[i] + ";"
                    str3 = str3 + temp3[i] + ";"
                }
            }
        }
        str = str.substring(0, str.length - 1);	//removes last semi-colon
        str2 = str2.substring(0, str2.length - 1);	//removes last semi-colon
        str3 = str3.substring(0, str3.length - 1);	//removes last semi-colon

        if (key == document.forms[0].table_defaultVal.value) {
            document.forms[0].table_defaultVal.value = "0";	//reset if no service is set to default
        }


        //		"\n\ntable_bal="+document.forms[0].table_bal.value+"\nstr2="+str2+
        //	"\n\ntable_invId="+document.forms[0].table_invId.value+"\nstr3="+str3+
        //"\n\ndefault service="+document.forms[0].table_defaultVal.value);

        document.forms[0].table_serID.value = str;
        document.forms[0].table_bal.value = str2;
        document.forms[0].table_invId.value = str3;
    }

    function NewCustomer() {
//billing addressres/*
        document.CustomerForm.bscname.value = "";
        document.CustomerForm.bsfirstName.value = "";
        document.CustomerForm.bslastName.value = "";
        document.CustomerForm.bsaddress1.value = "";
        document.CustomerForm.bsaddress2.value = "";
        document.CustomerForm.bscity.value = "0";
        //document.CustomerForm.bszipCode.value="";
        document.CustomerForm.bsprovince.value = "";
        document.CustomerForm.bscountry.value = "0";
//shipping addresses
        document.CustomerForm.shcname.value = "";
        document.CustomerForm.shfirstName.value = "";
        document.CustomerForm.shlastName.value = "";
        document.CustomerForm.shaddress1.value = "";
        document.CustomerForm.shaddress2.value = "";
        document.CustomerForm.shcity.value = "0";
        //document.CustomerForm.shzipCode.value = "";
        document.CustomerForm.shprovince.value = "";
        document.CustomerForm.shcountry.value = "0";
//genaral Tab
        document.CustomerForm.firstName.value = "";
        document.CustomerForm.lastName.value = "";
        document.CustomerForm.address1.value = "";
        document.CustomerForm.address2.value = "";
        document.CustomerForm.city.value = "0";
        //document.CustomerForm.stateName.value="";
//	document.CustomerForm.zipCode.value="";
        document.CustomerForm.phone.value = "";
        document.CustomerForm.cellPhone.value = "";
        document.CustomerForm.fax.value = "";
        document.CustomerForm.email.value = "";
//	document.CustomerForm.title.value="";
        document.CustomerForm.province.value = "";
//	document.CustomerForm.country.value="0";
        document.CustomerForm.homePage.value = "www.";
//	document.CustomerForm.type.value="";
        document.CustomerForm.texID.value = "";
        document.CustomerForm.openingUB.value = "";
        document.CustomerForm.extCredit.value = "";
        document.CustomerForm.memo.value = "";
        document.CustomerForm.ccType.value = "";
        document.CustomerForm.cardNo.value = "";
        document.CustomerForm.expDate.value = "";
        document.CustomerForm.cw2.value = "";
        document.CustomerForm.cardHolderName.value = "";
        document.CustomerForm.cardBillAddress.value = "";
        document.CustomerForm.cardZip.value = "";
        //document.CustomerForm.dateAdded.value="";
        document.CustomerForm.cname.value = "";
        document.CustomerForm.chk_alsovendor.checked = false;
        document.CustomerForm.chk_useind.checked = false;

        $("#countryID").val(231).change();
        $("#countryID2").val(231).change();
        $("#countryID3").val(231).change();
    }

    function CloseMe() {
        window.close();
        
    }

    function showNameDialog() {
        event.preventDefault();
        $("#showNameDialog").dialog({
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

    function enterEmailValidationDialog() {
        event.preventDefault();
        $("#enterEmailValidationDialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }

    function showEmailLengthValidationDialog() {
        event.preventDefault();
        $("#enterEmailValidationDialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }

    function showFirstNameDialog() {
        event.preventDefault();
        $("#showFirstNameDialog").dialog({
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

    function showLastNameDialog() {
        event.preventDefault();
        $("#showLastNameDialog").dialog({
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

    function showAddress1Dialog() {
        event.preventDefault();
        $("#showAddress1Dialog").dialog({
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

    function showTitleDialog() {
        event.preventDefault();
        $("#showTitleDialog").dialog({
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

    function showZipCodeDialog() {
        event.preventDefault();
        $("#showZipCodeDialog").dialog({
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

    function showphoneemptydialog() {
        event.preventDefault();
        $("#showphoneemptydialog").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }

    function showCellPhoneLengthDialog() {
        event.preventDefault();
        $("#showCellPhoneLengthDialog").dialog({
            resizable: false,
            height: 200,
            width: 500,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }

    function showEmailValidationDialog() {
        event.preventDefault();
        $("#showEmailValidationDialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
            modal: true,
            buttons: {
                "<spring:message code='BzComposer.global.ok'/>": function () {
                    $(this).dialog("close");
                }
            }
        });
        return false;
    }

    function showServiceValidationDialog() {

        event.preventDefault();
        $("#showServiceValidationDialog").dialog({
            resizable: false,
            height: 200,
            width: 450,
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
<!-- Dialog box used in this page -->
<div id="enterEmailValidationDialog" style="display:none;">
    <p><spring:message code="Bzcomposer.updatevendor.enteremailaddress"/></p>
</div>
<div id="showEmailLengthValidationDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.entervalidemaillength"/></p>
</div>
<div id="showNameDialog" style="display:none;">
    <p><spring:message code="BzComposer.customer.saveContact"/></p>
</div>
<div id="showFirstNameDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.enterfirstname"/></p>
</div>
<div id="showLastNameDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.enterlastname"/></p>
</div>
<div id="showAddress1Dialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.enteradderss1"/></p>
</div>
<div id="showTitleDialog" style="display:none;">
    <p><spring:message code="BzComposer.customer.contactTitle"/></p>
</div>
<div id="showZipCodeDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.enterzipcode"/></p>
</div>
<div id="showEmailValidationDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.entervalidemail"/></p>
</div>
<div id="showCellPhoneLengthDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.cellphonelength"/></p>
</div>
<div id="showphoneemptydialog" style="display:none;">
    <p>Please Enter Phone First</p>
</div>
<div id="addNewCustomerDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.insertnewcustomer"/></p>
</div>
<div id="showServiceValidationDialog" style="display:none;">
    <p><spring:message code="BzComposer.addnewcustomer.serviceexist"/></p>
</div>
<div id="errorOccurred" style="display:none;font-size:12px;">
    <p><spring:message code="BzComposer.common.erroroccurred"/></p>
</div>
<!-- Dialog box used in this page -->
<div id="maxnumberofuserdialog" style="display:none;">
    <p><spring:message code="BzComposer.configuration.networksecurity.maxnumberofuser"/></p>
</div>