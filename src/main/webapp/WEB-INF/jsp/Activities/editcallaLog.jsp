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
        table.tabla-listados thead tr th
         {
            font-size: 14px;
         }

        table.tabla-listados tbody tr td 
        {
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

        
    </script>
</head>
<body>
<!-- begin shared/header -->
<div id="ddcolortabsline">&nbsp;</div>
<%-- <form:form action="Customer/AddCustomer" method="post" id="frmNewCustomer"> --%>
<form:form name="TaskForm" method="post" id="frmNewCustomer" modelAttribute="logCallDto">
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
			<spring:message code="BzComposer.crmCustomer.logaCall.edit"/>
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
                                                    <spring:message code="BzComposer.crmCustomer.logaCall.Details"/>
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr >
                                                <td><spring:message code="BzComposer.crmCustomer.logaCall.id"/>
                                                
                                                </td>
                                                <td><form:input path="logCallID" readonly="true"
                                                                style="width:100px;"/></td>
                                                <td colspan="5">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <spring:message code="BzComposer.CustomerBoard.subject"/>
                                                </td>
                                                
                                                 <td><form:input path="subject" readonly="true"
                                                                style="width:100px;"/></td>
                                                
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                                <spring:message code="BzComposer.crmCustomer.logaCall.comment"/>
                                                                <span class="inputHighlighted"><spring:message
                                                                        code="BzComposer.CompulsoryField.Validation"/></span>
                                                   </td>
                                                   
                                                   		
														<td><form:textarea path="comment"   rows="5" style="width:200px;"   />
														
														 
															
														</td>
                                                </tr>
                                                <tr>
                                               
                                                <td><spring:message code="BzComposer.CustomerBoard.contactName"/><span class="inputHighlighted"><spring:message
                                                                        code="BzComposer.CompulsoryField.Validation"/></span></td>
                                               	<td><form:select path="contactName"
																style="width:150px">

																<form:option value="0">
																	<spring:message code="BzComposer.ComboBox.Select" />
																</form:option>

															
															
															
															 <c:forEach items="${contacts}" var="currObject">
                                                            
                                                                      <form:option
                                                                  value="${currObject.contactID}">${currObject.firstName} ${currObject.lastName}
                                                               </form:option>
                                                               
                                                        </c:forEach>
                                                        </form:select>
															
															</td>
                                                <td>&nbsp;</td>
                                                
                                            </tr>
                                            
                                            <tr>
                                        <td >
                                                    <spring:message code="BzComposer.CustomerBoard.RelatedTo"/>
                                                     <span class="inputHighlighted"><spring:message
                                                            code="BzComposer.CompulsoryField.Validation"/></span>
                                                </td>
                                                
                                                 <td><form:input path="relatedTo"/></td>
                                                    
                                                
                                                <td colspan="5">&nbsp;</td>
                                           </tr>
                                                
                                            
                                       <tr>
                                               
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
                                   
                                    <button type="button" class="formbutton" title="Save Task"
                                            onclick="updateLogaCall();"><spring:message
                                            code='BzComposer.global.update'/></button>
                                    <button type="button" class="formbutton" title="Close" onclick="CloseMe();">
                                        <spring:message code='BzComposer.global.close'/></button>
                                    <input type="hidden" name="stname" value="" id="stateId"/>
                                </td>
                            </tr>
                        </table>
                        
                        <div>
                            <form:hidden path="clientVendorID" />
                           
                            
                            
                        </div>
                    </div>
                </div>
        
</form:form>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</body>
</html>
<script>
    window.onunload = refreshParent;

    function refreshParent() 
    {
    window.opener.location.reload();
    }
    function updateLogaCall()
    {

    	var  logCallID=document.TaskForm.logCallID.value;
    	var  subject=document.TaskForm.subject.value;
    	var contactID=document.TaskForm.contactName.value;
    	var comment=document.TaskForm.comment.value;
    	var clientVendorID=document.TaskForm.clientVendorID.value;
    	
    	var relatedTo=document.TaskForm.relatedTo.value;
    	 
    	type="customer";
    	
	    	
    	
    	
    	
    	 
    	 if(subject==""||comment==""||contactID==""||relatedTo=="")
    		 {
    			showErrorDialog();
    		 return false ;
    		 }
    
    	 
    	 var taskDetails= 
  	   {
    			  "logCallID":logCallID,
    		       "subject":subject,
    			     "contactID":contactID,
    			    "comment":comment,
    			      "clientVendorID":clientVendorID,
    			      	"relatedTo":relatedTo,
    			    	
    			    	"type":type
	    	
	   };
    
    	
    
    	
	 var obj=JSON.stringify(taskDetails);
	 
	 $.ajax({
	 		type : "POST",
	 		url : "manageActivity?tabid=updateLogaCall",
	 	    data :"data="+ obj,
	 	    success : function(data)
	 	    {
	 	    
	 	    	taskSaved();
	 	    	
	 		}
	 		,
	 		 error : function(data) 
	 		 {
	 			 
	 			 return showerrordialog();
	 		  }
	 	});
    }
    
  
    
    function showErrorDialog() {

        event.preventDefault();
        $("#errorOccurred").dialog({
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
  
    function taskSaved()
    {
        event.preventDefault();
        $("#taskSaved").dialog({
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

    
    function validateMail() {
        var email = document.TaskForm.email.value;
        var mail = String(email);
        var pattern = /^[_0-9a-zA-z]+(\.[_A-Za-z0-9]+)*@[A-Za-z0-9]+(\.[A-Za-z]+)+$/;
        if (email == "") {
            return enterEmailValidationDialog();
            return false;
        } else if (!pattern.test(email)) {
            document.TaskForm.email.focus();
            return showEmailValidationDialog();
            return false;
        }
        if (mail.length >= 50) {
            document.TaskForm.email.value = "";
            document.TaskForm.email.focus();
            return showEmailLengthValidationDialog();
            return false;
        }
        return true;
    }

    
    function saveCustomerConact()
    {

    	var  cid=document.TaskForm.contactID.value;
    	var  phone=document.TaskForm.phone.value;
    	var firstName=document.TaskForm.firstName.value;
    	var middleName=document.TaskForm.middleName.value;
    	var lastName=document.TaskForm.lastName.value;
    	 var title= document.TaskForm.contactTitle.value;
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
          "conactID":document.TaskForm.contactID.value,
    "clientvendorID": document.TaskForm.clientvendorID.value,
	     "firstName": document.TaskForm.firstName.value,
	    "middleName":document.TaskForm.middleName.value,
	      "lastName":document.TaskForm.lastName.value,
	      	"title":document.TaskForm.contactTitle.value,
	    	"email":document.TaskForm.email.value,
	    	"phone":document.TaskForm.phone.value
	   };
    	 
    
	 var obj=JSON.stringify(conactDetails);
	 
	 $.ajax({
	 		type : "POST",
	 		url : "customerContacts?tabid=add",
	 	    data :"data=" + obj,
	 	    success : function(data)
	 	    {
	 	    
	 		 	     showNameDialog();
	 	    	
	 		}
	 		,
	 		 error : function(data) 
	 		 {
	 			 
	 			 //return showerrordialog();
	 		  }
	 	});
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

/*
    function AddCustomer() {

         if (document.TaskForm.firstName.value == "") 
         {
            document.TaskForm.firstName.focus();
            return showFirstNameDialog();
        } 
         else if (document.TaskForm.lastName.value == "") 
        {
            document.TaskForm.lastName.focus();
            return showLastNameDialog();
        }  if (validate()) {

                event.preventDefault();
                $("#addNewCustomerDialog").dialog({
                    resizable: false,
                    height: 200,
                    width: 500,
                    modal: true,
                    buttons: {
                        "<spring:message code='BzComposer.global.ok'/>": function () {

                            $(this).dialog("close");
                            document.getElementById('tabid').value = "AddCustomer";
                            document.forms["frmNewCustomer"].action = "Customer?tabid=AddCustomer";
                            document.forms["frmNewCustomer"].submit();
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
    }
*/

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
            var field = document.TaskForm[fieldName];
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


    function CloseMe() 
    {
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
<div id="taskSaved" style="display:none;font-size:12px;">
    <p><spring:message code="BzComposer.CustomerBoard.taskSaved"/></p>
</div>