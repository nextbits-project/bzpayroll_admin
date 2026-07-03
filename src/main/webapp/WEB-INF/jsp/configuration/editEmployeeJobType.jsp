<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page errorPage="/include/sessionExpired.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/emp/headlogo3.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.formcustomizationtitle" /></title>
<script src="${pageContext.request.contextPath}/dist/js/custom.js"></script>
<link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
</head>

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
                            <table cellspacing="0"  style="border: 0;width: 100%;overflow-y:scroll;" class="section-border">
                              <tr>

                                <td valign="top" style="padding-right: 20px; padding-bottom: 20px;">
                                  <div id="formCustomization" style="padding: 0; position: relative; left:0;">
                                    <div id="tabs" style="height: auto;">

                                      <!-- invoiceTab Starts -->
                                      <div id="invoiceTab" class="tabPage">
                                        <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                          Edit Employee Job Type
                                        </div>

                                        <div style="display: flex; justify-content: center; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">
<!-- Job Type Start -->
<form action="/settings/employee/update-employee-type" method="post">
                                         <div class="panel-body">
                                                                                     <!-- Success Message -->
                                                                                     <c:if test="${status == true}">
                                                                                       <c:if test="${not empty message}">
                                                                                         <div class="alert alert-primary alert-dismissible fade show" role="alert">
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
                                                                                         <div class="alert alert-danger alert-dismissible fade show" role="alert">
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
                                                                                           <td colspan="3"><input type="text" class="form-control" name="jobType" placeholder="Enter here" value="${employeeRole.jobType}"  required /></td>
                                                                                           <td colspan="2"><input type="hidden" name="id" value="${employeeRole.id}" /></td>

                                                                                         <!-- Time Clock Settings -->
                                                                                         <tr style="background-color: #D3D3D3;">
                                                                                           <td colspan="6" class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">Time Clock Settings</td>
                                                                                         </tr>
                                                                                         <tr>
                                                                                           <td>Time Clock Required:</td>
                                                                                           <td>
                                                                                             <input type="checkbox" name="timeClockRequired" value="YES"
                                                                                                    <c:if test="${employeeRole.timeClockRequired == 'YES'}">checked</c:if> />
                                                                                           </td>

                                                                                           <td>Password Required:</td>
                                                                                           <td>
                                                                                             <input type="checkbox" name="passwordRequired" value="YES"
                                                                                                    <c:if test="${employeeRole.passwordRequired == 'YES'}">checked</c:if> />
                                                                                           </td>

                                                                                           <td>Time Shifts Allowed:</td>
                                                                                           <td>
                                                                                             <input type="checkbox" name="timeShiftsAllowed" value="YES"
                                                                                                    <c:if test="${employeeRole.timeShiftsAllowed == 'YES'}">checked</c:if> />
                                                                                           </td>
                                                                                         </tr>
                                                                                         <!-- Bzcomposer Access -->
                                                                                         <tr style="background-color: #D3D3D3;">
                                                                                           <td colspan="6" class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">Bzcomposer Access</td>
                                                                                         </tr>
                                                                                         <tr>
                                                                                          <td>Bzcomposer Access:</td>
                                                                                          <td>
                                                                                            <input type="checkbox" name="bzcomposerAccess" value="YES"
                                                                                                   <c:if test="${employeeRole.bzcomposerAccess == 'YES'}">checked</c:if> />
                                                                                          </td>

                                                                                          <td>ID/Password Required:</td>
                                                                                          <td>
                                                                                            <input type="checkbox" name="idPasswordRequired" value="YES"
                                                                                                   <c:if test="${employeeRole.idPasswordRequired == 'YES'}">checked</c:if> />
                                                                                          </td>

                                                                                           <td colspan="4"></td>
                                                                                         </tr>

                                                                                         <tr>
                                                                                           <td>Only Selected Feature Access:</td>
                                                                                           <td colspan="5">
                                                                                             <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                                                                                             <label class="me-3">
                                                                                               <input type="checkbox" class="featureAccess" name="featureAccess" value="CUSTOMER"
                                                                                                 <c:if test="${grantedFeatures.contains('CUSTOMER')}">checked</c:if> />
                                                                                               CUSTOMER
                                                                                             </label>

                                                                                             <label class="me-3">
                                                                                               <input type="checkbox" class="featureAccess" name="featureAccess" value="ITEM"
                                                                                                 <c:if test="${grantedFeatures.contains('ITEM')}">checked</c:if> />
                                                                                               ITEM
                                                                                             </label>

                                                                                             <label class="me-3">
                                                                                               <input type="checkbox" class="featureAccess" name="featureAccess" value="SERVICE"
                                                                                                 <c:if test="${grantedFeatures.contains('SERVICE')}">checked</c:if> />
                                                                                               SERVICE
                                                                                             </label>

                                                                                             <label class="me-3">
                                                                                               <input type="checkbox" class="featureAccess" name="featureAccess" value="SALES"
                                                                                                 <c:if test="${grantedFeatures.contains('SALES')}">checked</c:if> />
                                                                                               SALES
                                                                                             </label>

                                                                                             <label class="me-3">
                                                                                               <input type="checkbox" class="featureAccess" name="featureAccess" value="PURCHASE"
                                                                                                 <c:if test="${grantedFeatures.contains('PURCHASE')}">checked</c:if> />
                                                                                               PURCHASE
                                                                                             </label>

                                                                                             <label class="me-3">
                                                                                               <input type="checkbox" class="featureAccess" name="featureAccess" value="POS"
                                                                                                 <c:if test="${grantedFeatures.contains('POS')}">checked</c:if> />
                                                                                               POS
                                                                                             </label>
                                                                                           </td>
                                                                                         </tr>
                                                                                         <!-- Buttons -->
                                                                                         <tr>
                                                                                           <td colspan="6" style="text-align: center;">
                                                                                             <button type="submit" class="formbutton" name="Submit" value="submit">Update</button>
                                                                                           </td>
                                                                                         </tr>
                                                                                       </table>
                                                                                     </div>
                                                                                   </div>

                                        </div>
                                        </form>

                                      </div>
                                      <!-- Job Type Ends -->
                                      <!-- invoiceTab Ends -->







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
