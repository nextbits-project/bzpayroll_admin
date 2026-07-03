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
<title>BZPayroll - Form Templates</title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
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

.settings-page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 16px;
	margin: 30px 0px 15px 0px;
	border-bottom: 1px dotted #333;
	padding: 0 0 .3em 0;
}

.settings-page-title {
	font-size: 1.1em;
	font-weight: normal;
	color: #838383;
}

.settings-page-actions {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	gap: 8px;
}

.settings-page-actions .formbutton[disabled] {
	opacity: 0.5;
	cursor: not-allowed;
}

.settings-tab-toolbar {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	gap: 8px;
	margin: 0 0 12px;
}

.settings-selectable-row {
	cursor: pointer;
}

.settings-selectable-row.is-selected td {
	background-color: #808080 !important;
	color: #fff;
	font-weight: bold;
}

.settings-inline-form-table td,
.settings-inline-form-table th,
.settings-data-table td,
.settings-data-table th {
	font-size: 13px !important;
}

.settings-form-layout,
.settings-list-wrap,
.settings-tab-section,
.settings-tab-form-wrap {
	width: 100%;
}

.settings-tab-section {
	display: block;
	border-top: 1px solid grey;
	padding-top: 15px;
}

.settings-inline-form-table,
.settings-data-table {
	width: 100% !important;
}

.settings-inline-form-table input[type="text"],
.settings-inline-form-table .form-control {
	width: 100% !important;
	max-width: none;
}

.settings-inline-form-table td:first-child {
	width: 180px;
	min-width: 180px !important;
}

.settings-inline-form-table td:last-child {
	width: auto;
	min-width: 0 !important;
}

.settings-list-wrap {
	display: block;
	margin-top: 10px;
}

.settings-data-table th,
.settings-data-table td {
	width: auto !important;
}
</style>
<script>
  $(document).ready(function () {
      let jobtype = `${employeeRoleStatus != null ? employeeRoleStatus : false}`; // dynamically set this
      let jobtypevalue=`${employeeRoleStatusValue != null ? employeeRoleStatusValue : 0}`;
      console.log(jobtype);
      if (jobtype) {
          // Keep the employee settings focused on status when the legacy job type tab is hidden.
          $("#tabs").tabs({ active: jobtypevalue });
      } else {
          // Default first tab (Employee Status)
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

	<div class="settings-page-header">
		<span class="settings-page-title">SETTINGS</span>
		<div class="settings-page-actions">
			<input type="button" class="formbutton" value="<spring:message code='BzComposer.global.save'/>" onclick="handleEmployeeSettingsSave()">
			<input type="button" class="formbutton" value="<spring:message code='BzComposer.global.edit'/>" onclick="handleEmployeeSettingsEdit()">
			<input type="button" class="formbutton" value="<spring:message code='BzComposer.global.cancel'/>" onclick="handleEmployeeSettingsCancel()">
			<input type="button" class="formbutton" value="<spring:message code='BzComposer.global.delete'/>" onclick="handleEmployeeSettingsDelete()">
		</div>
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
                           <!-- <span style="font-size:30px;cursor:pointer; margin-left: 20px;" onclick="toggleFunction()">&#9776;</span> -->
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
                                        <li style="font-size: 12px;"><a href="#salesOrderTab">Employee Status</a></li>
                                      </ul>
                                      <!--Sales Reciet Start-->
                                      <div id="salesOrderTab" class="tabPage">
                                        <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                          Employee Status
                                        </div>

                                        <div class="settings-tab-section">

                                        <!-- start employee status -->
                                        <form id="employeeStatusForm" action="/settings/employee/save-employee-status" method="post">
                                                                                 <input type="hidden" name="employeeTypeId" id="selectedEmployeeStatusId" />
                                                                                 <div class="panel-body settings-tab-form-wrap">
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
                                                                                                                             <div class="form-layout settings-form-layout">
                                                                                                                               <table class="table table-bordered settings-inline-form-table" style="font-size: 13px;">
                                                                                                                                 <tr>
                                                                                                                                   <td style="min-width: 200px;">Employee Status:</td>
                                                                                                                                   <td colspan="2"><input type="text" class="form-control" name="employeeType" placeholder="Enter here" required /></td>
                                                                                                                                 </tr>
                                                                                                                               </table>
                                                                                                                             </div>
                                                                                                                           </div>

                                                                                </div>
                                                                                </form>
                                                                                <div class="form-layout settings-list-wrap">
                                                                                                                       <table id="employeeStatusTable" class="table tabla-listados sortable devItemList settings-data-table"
                                                                                                                                                  cellspacing="0"
                                                                                                                                                  style="margin-top: 10px; border: 0; padding: 0; height: auto; font-size: 13px;">
                                                                                                                           <thead style="background-color: red; color: white; font-weight: bold;">
                                                                                                                          <tr>
                                                                                                                            <th>Employee Status</th>

                                                                                                                          </tr>
                                                                                                                        </thead>
                                                                                                                        <tbody>
                                                                                                                          <c:forEach items="${empStatusList}" var="empStatusObject" varStatus="loop">
                                                                                                                            <tr class="settings-selectable-row employee-status-row" data-id="${empStatusObject.employeeTypeId}" data-name="${empStatusObject.employeeType}">
                                                                                                                              <td>${empStatusObject.employeeType}</td>
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
<script>
function getActiveEmployeeSettingsTabIndex() {
    return $("#tabs").tabs("option", "active");
}

function selectEmployeeStatusRow(row) {
    selectedEmployeeStatusId = row.dataset.id;
    $("#employeeStatusTable .employee-status-row").removeClass("is-selected");
    $(row).addClass("is-selected");
    $("#selectedEmployeeStatusId").val(selectedEmployeeStatusId);
    $("#employeeStatusForm input[name='employeeType']").val(row.dataset.name || "");
}

function resetEmployeeStatusSelection() {
    selectedEmployeeStatusId = null;
    $("#employeeStatusTable .employee-status-row").removeClass("is-selected");
    $("#selectedEmployeeStatusId").val("");
    $("#employeeStatusForm")[0].reset();
}

function handleEmployeeSettingsSave() {
    document.getElementById("employeeStatusForm").action = "${pageContext.request.contextPath}/settings/employee/save-employee-status";
    document.getElementById("employeeStatusForm").submit();
}

function handleEmployeeSettingsEdit() {
    if (!selectedEmployeeStatusId) {
        alert("Please select an employee status to edit.");
        return;
    }
    document.getElementById("employeeStatusForm").action = "${pageContext.request.contextPath}/settings/employee/update-employee-status";
    document.getElementById("employeeStatusForm").submit();
}

function handleEmployeeSettingsDelete() {
    if (!selectedEmployeeStatusId) {
        alert("Please select an employee status to delete.");
        return;
    }
    if (confirm("Are you sure you want to delete this employee status?")) {
        window.location.href = "${pageContext.request.contextPath}/settings/employee/delete-employee-status/" + selectedEmployeeStatusId;
    }
}

function handleEmployeeSettingsCancel() {
    resetEmployeeStatusSelection();
}

$(document).ready(function () {
    $(document).on("click", ".employee-status-row", function () {
        selectEmployeeStatusRow(this);
    });
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
