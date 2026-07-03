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
<title><spring:message code="BzComposer.formcustomizationtitle" /></title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
</head>
<script>
$(function() {
    $("#tabs").tabs();
});
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
<style>
.switch { position: relative;display: inline-block;width: 40px;height: 22px;margin-left:10px; }
.switch input { opacity: 0;width: 0;height: 0; margin-top: 15px; }
.slider {
  position: absolute;cursor: pointer;top: 0;left: 0;right: 0;bottom: 0;
  background-color: #ccc;-webkit-transition: .4s;transition: .4s;
}
.slider:before {
  position: absolute;content: "";height: 15px;width: 15px;left: 4px;bottom: 4px;
  background-color: white;-webkit-transition: .4s;transition: .4s;
}
input:checked + .slider { background-color: #2196F3; }

input:checked + .slider:before {
  -webkit-transform: translateX(15px);
  -ms-transform: translateX(15px);
  transform: translateX(15px);
}

/* Rounded sliders */
.slider.round { border-radius: 20px; }
.slider.round:before { border-radius: 50%; }

.parentImage {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}
.parentImage:hover {
    -moz-transform: scale(2);
	-webkit-transform: scale(2);
	-o-transform: scale(2);
	-ms-transform: scale(2);
	transform: scale(2);
}
</style>
<script>
  $(document).ready(function () {
      let jobtype = `${employeeRoleStatus != null ? employeeRoleStatus : false}`; // dynamically set this
      let jobtypevalue=`${employeeRoleStatusValue != null ? employeeRoleStatusValue : 0}`;
      console.log(jobtype);
      if (jobtype) {
          // Initialize jQuery UI tabs and set active index = 2 (Job Type is 3rd tab)
          $("#tabs").tabs({ active: jobtypevalue });
      } else {
          // Default first tab (Job Title)
          $("#tabs").tabs({ active: 0 });
      }
  });
</script>

</head>
<!-- <body onload="init1();"> -->
<body onload="init();" style="min-width: 1366px;">
<!-- begin shared/header -->

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
                                <td id="leftMenu" valign="top" style="position: relative; width: 180px;">
                                  <table>
                                    <tr><td><jsp:include page="menuPage.jsp" /></td></tr>
                                  </table>
                                </td>
                                <td valign="top" style="padding-right: 20px; padding-bottom: 20px;">
                                  <div id="formCustomization" style="padding: 0; position: relative; left:0;">
                                    <div id="tabs" style="height: auto;">
                                      <ul>

                                        <li style="font-size: 12px;"><a href="#estimationTab">Job Title</a></li>
                                        <li style="font-size: 12px;"><a href="#salesOrderTab">Employee Status</a></li>
                                         <li style="font-size: 12px;"><a href="#invoiceTab">Job Type</a></li>
                                      </ul>
                                      <!-- invoiceTab Starts -->
                                      <div id="invoiceTab" class="tabPage">
                                        <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                          Employee Job Type
                                        </div>

                                        <div style="display: flex; justify-content: center; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">
<!-- Job Type Start -->
<form action="/configuration/save-job-type" method="post">
                                         <div class="panel-body">
                                                                                     <!-- Success Message -->
                                                                                     <c:if test="${status2 == true}">
                                                                                       <c:if test="${not empty message}">
                                                                                         <div class="alert alert-primary alert-dismissible fade show" role="alert" style="font-size: 12px;">
                                                                                           <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                             <span aria-hidden="true">&times;</span>
                                                                                           </button>
                                                                                           ${message}
                                                                                         </div>
                                                                                       </c:if>
                                                                                     </c:if>
                                                                                     <!-- Error Message -->
                                                                                     <c:if test="${status2 == false}">
                                                                                       <c:if test="${not empty message}">
                                                                                         <div class="alert alert-danger alert-dismissible fade show" role="alert" style="font-size: 12px;">
                                                                                           <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                             <span aria-hidden="true">&times;</span>
                                                                                           </button>
                                                                                           ${message}
                                                                                         </div>
                                                                                       </c:if>
                                                                                     </c:if>

                                                                                     <!-- Form Layout -->
                                                                                     <div class="form-layout">
                                                                                       <table class="table table-bordered" style="font-size: 12px;">
                                                                                         <tr>
                                                                                           <td>Job Type:</td>
                                                                                           <td colspan="5"><input type="text" class="form-control" name="jobType" placeholder="Enter here" required /></td>


                                                                                         <!-- Time Clock Settings -->
                                                                                         <tr style="background-color: #D3D3D3;">
                                                                                           <td colspan="6" class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">Time Clock Settings</td>
                                                                                         </tr>
                                                                                         <tr>
                                                                                           <td>Time Clock Required:</td>
                                                                                           <td><input type="checkbox" name="timeClockRequired" value="YES" checked /></td>
                                                                                           <td>Password Required:</td>
                                                                                           <td><input type="checkbox" name="passwordRequired" value="YES" checked /></td>
                                                                                           <td>Time Shifts Allowed:</td>
                                                                                           <td><input type="checkbox" name="timeShiftsAllowed" value="YES" checked /></td>

                                                                                         <!-- Bzcomposer Access -->
                                                                                         <tr style="background-color: #D3D3D3;">
                                                                                           <td colspan="6" class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">Bzcomposer Access</td>
                                                                                         </tr>
                                                                                         <tr>
                                                                                           <td>Bzcomposer Access:</td>
                                                                                           <td><input type="checkbox" name="bzcomposerAccess" id="bzcomposerAccess" value="YES" checked /></td>
                                                                                           <td>ID/Password Required:</td>
                                                                                           <td><input type="checkbox" name="idPasswordRequired" value="YES" checked /></td>
                                                                                           <td colspan="4"></td>
                                                                                         </tr>

                                                                                         <tr>
                                                                                           <td>Only Selected Feature Access:</td>
                                                                                           <td colspan="5">
                                                                                             <label class="me-3"><input type="checkbox" class="featureAccess" name="featureAccess" value="CUSTOMER" /> CUSTOMER</label>
                                                                                             <label class="me-3"><input type="checkbox" class="featureAccess" name="featureAccess" value="ITEM" /> ITEM</label>
                                                                                             <label class="me-3"><input type="checkbox" class="featureAccess" name="featureAccess" value="SERVICE" /> SERVICE</label>
                                                                                             <label class="me-3"><input type="checkbox" class="featureAccess" name="featureAccess" value="SALES" /> SALES</label>
                                                                                             <label class="me-3"><input type="checkbox" class="featureAccess" name="featureAccess" value="PURCHASE" /> PURCHASE</label>
                                                                                             <label class="me-3"><input type="checkbox" class="featureAccess" name="featureAccess" value="POS" /> POS</label>
                                                                                           </td>
                                                                                         </tr>
                                                                                         <!-- Buttons -->
                                                                                         <tr>
                                                                                           <td colspan="6" style="text-align: right;">
                                                                                             <button type="submit" class="formbutton" name="Submit" value="submit">Save Role</button>
                                                                                           </td>
                                                                                         </tr>
                                                                                       </table>
                                                                                     </div>
                                                                                   </div>

                                        </div>
                                        </form>
                                        <div class="form-layout">
                                                                               <table id="custTable" class="table tabla-listados sortable devItemList"
                                                                                                          cellspacing="0"
                                                                                                          style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto; font-size: 12px;"
                                                                                                          align="center">
                                                                                   <thead style="background-color: red; color: white; font-weight: bold;">
                                                                                  <tr>
                                                                                    <th style="width: 500px;">Job Type</th>
                                                                                    <th>Time Clock Required</th>
                                                                                    <th>PW Required</th>
                                                                                    <th>Time Shifts Allowed</th>
                                                                                    <th>Bzcomposer Access</th>
                                                                                    <th>ID/PW Required</th>
                                                                                    <th>Feature Access</th>
                                                                                    <th style="min-width: 125px;">Action</th>

                                                                                  </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                  <c:forEach items="${employeeRoleList}" var="role" varStatus="loop">
                                                                                    <tr>
                                                                                      <td>${role.jobType}</td>
                                                                                      <td>${role.timeClockRequired}</td>
                                                                                      <td>${role.passwordRequired}</td>
                                                                                      <td>${role.timeShiftsAllowed}</td>
                                                                                      <td>${role.bzcomposerAccess}</td>
                                                                                     <td>${role.idPasswordRequired}</td>
                                                                                     <td>${role.featureAccess}</td>
                                                                                      <td>
                                                                                        <a href="${pageContext.request.contextPath}/configuration/edit-job-type/${role.id}" class="btn btn-sm btn-info text-white">Edit</a>
                                                                                        <a href="${pageContext.request.contextPath}/configuration/delete-job-type/${role.id}" class="btn btn-sm btn-info text-white"  onclick="return confirm('Are you sure you want to delete this role?');">Delete</a>
                                                                                      </td>
                                                                                    </tr>
                                                                                  </c:forEach>
                                                                                </tbody>
                                                                              </table>
                                                                              </div>
                                      </div>
                                      <!-- Job Type Ends -->
                                      <!-- invoiceTab Ends -->

                                      <div id="estimationTab" class="tabPage">
                                        <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                          Job Title
                                        </div>
                                        <div style="display: flex; justify-content: center; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">

<!-- start job title -->

<form action="/configuration/save-job-title" method="post">
                                         <div class="panel-body">
                                                                                     <!-- Success Message -->
                                                                                     <c:if test="${status == true}">
                                                                                       <c:if test="${not empty message}">
                                                                                         <div class="alert alert-primary alert-dismissible fade show" role="alert" style="font-size: 12px;">
                                                                                           <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                             <span aria-hidden="true">&times;</span>
                                                                                           </button>
                                                                                           ${message}
                                                                                         </div>
                                                                                       </c:if>
                                                                                     </c:if>
                                                                                     <!-- Error Message -->
                                                                                     <c:if test="${status == false}">
                                                                                       <c:if test="${not empty message}">
                                                                                         <div class="alert alert-danger alert-dismissible fade show" role="alert" style="font-size: 12px;">
                                                                                           <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                             <span aria-hidden="true">&times;</span>
                                                                                           </button>
                                                                                           ${message}
                                                                                         </div>
                                                                                       </c:if>
                                                                                     </c:if>

                                                                                     <!-- Form Layout -->
                                                                                     <div class="form-layout">
                                                                                       <table class="table table-bordered" style="font-size: 12px;">
                                                                                         <tr>
                                                                                           <td style="min-width: 200px;">Job Title:</td>
                                                                                           <td colspan="2" style="min-width: 300px;"><input type="text" class="form-control" name="jobTitle" placeholder="Enter here" required /></td>
                                                                                          <td style="text-align: center; min-width: 125px;">
                                                                                              <button type="submit" class="formbutton" name="Submit" value="submit">Save</button>
                                                                                           </td>
                                                                                          </tr>

                                                                                       </table>
                                                                                     </div>
                                                                                   </div>

                                        </div>
                                        </form>
                                        <div class="form-layout" style="display: flex; justify-content: center;">
                                                                               <table id="custTable" class="table tabla-listados sortable devItemList"
                                                                                                          cellspacing="0"
                                                                                                          style="width: 25%; margin-top: 10px; border: 0; padding: 0; height: auto; font-size: 12px;"
                                                                                                          align="center" >
                                                                                   <thead style="background-color: red; color: white; font-weight: bold;">
                                                                                  <tr>
                                                                                    <th style="min-width: 500px;">Job Title</th>
                                                                                    <th style="min-width: 125px;">Action</th>

                                                                                  </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                  <c:forEach items="${bcpJobtitleList}" var="empJobTitle" varStatus="loop">
                                                                                    <tr>
                                                                                      <td>${empJobTitle.jobTitle}</td>

                                                                                      <td>
                                                                                        <a href="${pageContext.request.contextPath}/configuration/edit-job-title/${empJobTitle.jobTitleId}" class="btn btn-sm btn-info text-white">Edit</a>
                                                                                        <a href="${pageContext.request.contextPath}/configuration/delete-job-title/${empJobTitle.jobTitleId}" class="btn btn-sm btn-info text-white"  onclick="return confirm('Are you sure you want to delete this role?');">Delete</a>
                                                                                      </td>
                                                                                    </tr>
                                                                                  </c:forEach>
                                                                                </tbody>
                                                                              </table>
                                                                              </div>

<!-- end job title -->
                                        </div>



                                      <!-- estimationTab Ends -->


                                      <!--Sales Reciet Start-->
                                      <div id="salesOrderTab" class="tabPage">
                                        <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                          Employee Status
                                        </div>

                                        <div style="display: flex; justify-content: center; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">

                                        <!-- start employee status -->
                                        <form action="/configuration/save-employee-status" method="post">
                                                                                 <div class="panel-body">
                                                                                                                             <!-- Success Message -->
                                                                                                                             <c:if test="${status1 == true}">
                                                                                                                               <c:if test="${not empty message}">
                                                                                                                                 <div class="alert alert-primary alert-dismissible fade show" role="alert" style="font-size: 12px;">
                                                                                                                                   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                                                                     <span aria-hidden="true">&times;</span>
                                                                                                                                   </button>
                                                                                                                                   ${message}
                                                                                                                                 </div>
                                                                                                                               </c:if>
                                                                                                                             </c:if>
                                                                                                                             <!-- Error Message -->
                                                                                                                             <c:if test="${status1 == false}">
                                                                                                                               <c:if test="${not empty message}">
                                                                                                                                 <div class="alert alert-danger alert-dismissible fade show" role="alert" style="font-size: 12px;">
                                                                                                                                   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                                                                     <span aria-hidden="true">&times;</span>
                                                                                                                                   </button>
                                                                                                                                   ${message}
                                                                                                                                 </div>
                                                                                                                               </c:if>
                                                                                                                             </c:if>

                                                                                                                             <!-- Form Layout -->
                                                                                                                             <div class="form-layout">
                                                                                                                               <table class="table table-bordered" style="font-size: 12px;">
                                                                                                                                 <tr>
                                                                                                                                   <td style="min-width: 200px;">Employee Status:</td>
                                                                                                                                   <td colspan="2" style="min-width: 300px;"><input type="text" class="form-control" name="employeeType" placeholder="Enter here" required /></td>

                                                                                                                                   <td colspan="4" style="text-align: center; min-width: 125px;">
                                                                                                                                     <button type="submit" class="formbutton" name="Submit" value="submit">Save</button>
                                                                                                                                   </td>
                                                                                                                                 </tr>
                                                                                                                               </table>
                                                                                                                             </div>
                                                                                                                           </div>

                                                                                </div>
                                                                                </form>
                                                                                <div class="form-layout" style="display: flex; justify-content: center;">
                                                                                                                       <table id="custTable" class="table tabla-listados sortable devItemList"
                                                                                                                                                  cellspacing="0"
                                                                                                                                                  style="width: 25%; margin-top: 10px; border: 0; padding: 0; height: auto; font-size: 12px;"
                                                                                                                                                  align="center">
                                                                                                                           <thead style="background-color: red; color: white; font-weight: bold;">
                                                                                                                          <tr>
                                                                                                                            <th style="min-width: 500px;">Employee Status</th>
                                                                                                                            <th style="min-width: 125px;">Action</th>

                                                                                                                          </tr>
                                                                                                                        </thead>
                                                                                                                        <tbody>
                                                                                                                          <c:forEach items="${empStatusList}" var="empStatusObject" varStatus="loop">
                                                                                                                            <tr>
                                                                                                                              <td>${empStatusObject.employeeType}</td>

                                                                                                                              <td>
                                                                                                                                <a href="${pageContext.request.contextPath}/configuration/edit-employee-status/${empStatusObject.employeeTypeId}" class="btn btn-sm btn-info text-white">Edit</a>
                                                                                                                                <a href="${pageContext.request.contextPath}/configuration/delete-employee-status/${empStatusObject.employeeTypeId}" class="btn btn-sm btn-info text-white"  onclick="return confirm('Are you sure you want to delete this role?');">Delete</a>
                                                                                                                              </td>
                                                                                                                            </tr>
                                                                                                                          </c:forEach>
                                                                                                                        </tbody>
                                                                                                                      </table>
                                                                                                                      </div>


                                                                                </div>
                                        <!-- end employee status -->

                                        </div>
                                      </div>
                                      <!-- estimationTab Ends -->



                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </table>
                            <div>
                                    </div>
                                  </div>
					    <%--////////--%>
			           </td>
		                  </tr>
	</table>

	</div>
	<div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>

<script type="text/javascript">
function setTemplateValues(tempElement, tempName, tempVal){
    let isSelected =  tempElement.checked;
    if (isSelected && tempName === 'IV'){
        document.getElementById('tempValueIV').value = tempVal;
        $('.switchIV input').prop('checked', false);
    }
    else if (isSelected && tempName === 'EST'){
        document.getElementById('tempValueEST').value = tempVal;
        $('.switchEST input').prop('checked', false);
    }
    else if (isSelected && tempName === 'SO'){
        document.getElementById('tempValueSO').value = tempVal;
        $('.switchSO input').prop('checked', false);
    }
    else if (isSelected && tempName === 'PO'){
        document.getElementById('tempValuePO').value = tempVal;
        $('.switchPO input').prop('checked', false);
    }
    else if (isSelected && tempName === 'PS'){
        document.getElementById('tempValuePS').value = tempVal;
        $('.switchPS input').prop('checked', false);
    }
    tempElement.checked = isSelected;
}
function saveTemplateTypes(){
    let params = "invoiceTemplateType="+document.getElementById('tempValueIV').value
                +"&estTemplateType="+document.getElementById('tempValueEST').value
                +"&soTemplateType="+document.getElementById('tempValueSO').value
                +"&poTemplateType="+document.getElementById('tempValuePO').value
                +"&psTemplateType="+document.getElementById('tempValuePS').value
    $.ajax({
        type : "POST",
        url : "/ConfigurationAjaxTest?tabid=setPrintingTemplates",
        data : params,
        success : function(data) {
            if(data === true){
                showSuccessDialog();
            }else{
                errorOccureddialog();
            }
        },
        error : function(data) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
}

function showSuccessDialog(){
    $("#showSuccessDialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
}
function errorOccureddialog(){
    $("#errorOccureddialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
}
function selectAnyTemplateDialog(){
    $("#selectAnyTemplateDialog").dialog({
        resizable: false,
        height: 200,
        width: 400,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                return false;
            }
        }
    });
}
</script>
<!-- JavaScript to control checkbox behavior -->
                                                <script>
                                                  document.addEventListener("DOMContentLoaded", function () {
                                                    const bzAccessCheckbox = document.getElementById("bzcomposerAccess");
                                                    const featureCheckboxes = document.querySelectorAll(".featureAccess");

                                                    function toggleFeatureAccess() {
                                                      const disabled = bzAccessCheckbox.checked;
                                                      featureCheckboxes.forEach(cb => {
                                                        cb.disabled = disabled;
                                                        if (disabled) cb.checked = false;
                                                      });
                                                    }

                                                    bzAccessCheckbox.addEventListener("change", toggleFeatureAccess);
                                                    toggleFeatureAccess();
                                                  });
                                                </script>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>
<!-- Dialog box used in this page -->
<div id="showSuccessDialog" style="display:none;">
	<p><spring:message code='BzComposer.common.recordUpdated'/></p>
</div>
<div id="errorOccureddialog" style="display:none;">
	<p><spring:message code='BzComposer.common.erroroccurred'/></p>
</div>
<div id="selectAnyTemplateDialog" style="display:none;">
	<p><spring:message code='BzComposer.common.selectAtleast1Template'/></p>
</div>
