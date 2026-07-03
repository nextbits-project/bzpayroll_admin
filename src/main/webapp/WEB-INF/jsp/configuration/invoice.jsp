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
  -moz-transform: scale(1.7);
  -webkit-transform: scale(1.7);
  -o-transform: scale(1.7);
  -ms-transform: scale(1.7);
  transform: scale(1.7);
}
  </style>
  </head>
  <!-- <body onload="init1();"> -->
  <body onload="init();" style="min-width: 1366px;">
    <!-- begin shared/header -->
    <form:form name="configurationForm" enctype="MULTIPART/FORM-DATA" method="post" id="frmcust" modelAttribute="configDto">
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
                                <li style="font-size: 12px;"><a href="#invoiceTab"><spring:message code="BzComposer.invoice.invoicetitle"/></a></li>
                                <li style="font-size: 12px;"><a href="#estimationTab"><spring:message code="BzComposer.estimation.estimationtitle"/></a></li>
                                <li style="font-size: 12px;"><a href="#salesOrderTab"><spring:message code="BzComposer.salesorder.salesordertitle"/></a></li>
                                
                              </ul>
                              <!-- invoiceTab Starts -->
                              <div id="invoiceTab" class="tabPage">
                                <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                  <spring:message code="BzComposer.invoice.invoicetitle" />
                                </div>
                                <div style="display: flex; justify-content: start; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">


                                  <!-- Invoice Standard -->
                                  <div style="flex: none; font-size: 12px; text-align: left;">
                                    <div style="display: flex; justify-content: start; align-items: center; gap: 4px;">
                                      <label class="switch switchIV" style="display: flex; align-items: center;">
                                        <input type="checkbox" value="1" onchange="setTemplateValues(this, 'IV', 3);" ${configDto.invoiceTemplateType==3?'checked':''} />
                                        <span class="slider round"></span>
                                      </label>
                                      <div style="font-weight: bold;">Invoice Standard</div>
                                    </div>

                                    <img class="parentImage"
                                         src="${pageContext.request.contextPath}/images/new/invoice_light.png"
                                         style="max-width: 500px; margin-top: 6px;" />
                                  </div>



                                  <!-- Invoice Charcoal -->
                                  <div style="flex: none; font-size: 12px; text-align: left;">
                                    <div style="display: flex; justify-content: start; align-items: center; gap: 4px;">
                                      <label class="switch switchIV" style="display: flex; align-items: center;">
                                        <input type="checkbox" value="2" onchange="setTemplateValues(this, 'IV', 4);" ${configDto.invoiceTemplateType==4?'checked':''} />
                                        <span class="slider round"></span>
                                      </label>
                                      <div style="font-weight: bold;">Invoice Charcoal</div>
                                    </div>

                                    <img class="parentImage"
                                         src="${pageContext.request.contextPath}/images/new/invoice_charcoal.png"
                                         style="max-width: 500px; margin-top: 6px;" />
                                  </div>

                                </div>
                              </div>
                              <!-- invoiceTab Ends -->

                              <div id="estimationTab" class="tabPage">
                                <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                  <spring:message code="BzComposer.estimation.estimationtitle" />
                                </div>
                                <div style="display: flex; justify-content: start; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">


                                  <div style="flex: none; font-size: 12px; text-align: left;">
                                    <div style="display: flex; justify-content: start; align-items: center; gap: 4px;">
                                      <label class="switch switchIV" style="display: flex; align-items: center;">
                                        <input type="checkbox" value="1" onchange="setTemplateValues(this, 'IV', 3);" ${configDto.invoiceTemplateType==3?'checked':''} />
                                        <span class="slider round"></span>
                                      </label>
                                      <div style="font-weight: bold;">Estimation Standard</div>
                                    </div>

                                    <img class="parentImage"
                                         src="${pageContext.request.contextPath}/images/new/estimation_light.png"
                                         style="max-width: 500px; margin-top: 6px;" />
                                  </div>

                                  <div style="flex: none; font-size: 12px; text-align: left;">
                                    <div style="display: flex; justify-content: start; align-items: center; gap: 4px;">
                                      <label class="switch switchIV" style="display: flex; align-items: center;">
                                        <input type="checkbox" value="2" onchange="setTemplateValues(this, 'IV', 4);" ${configDto.invoiceTemplateType==4?'checked':''} />
                                        <span class="slider round"></span>
                                      </label>
                                      <div style="font-weight: bold;">Estimation Charcoal</div>
                                    </div>

                                    <img class="parentImage"
                                         src="${pageContext.request.contextPath}/images/new/estimation_charcoal.png"
                                         style="max-width: 500px; margin-top: 6px;" />
                                  </div>

                                </div>
                              </div>


                              <!-- estimationTab Ends -->


                              <!--Sales Reciet Start-->
                              <div id="salesOrderTab" class="tabPage">
                                <div class="flex text-left text-sm px-2 py-1" style="font-size: 12px;background:#C3C5C7;">
                                  <spring:message code="BzComposer.salesorder.salesordertitle" />
                                </div>

                                <div style="display: flex; justify-content: start; gap: 8px; border-top: 1px solid grey; padding-top: 15px;">

                                  <div style="flex: none; font-size: 12px; text-align: left;">
                                    <label class="switch switchIV">
                                      <input type="checkbox" value="1"
                                                             onchange="setTemplateValues(this, 'IV', 3);"
                                                             ${configDto.invoiceTemplateType==3?'checked':''} />
                                      <span class="slider round"></span>
                                    </label>
                                    <div style="margin-top: 6px; font-weight: bold;">Standard Sales Receipts</div>
                                    <img class="parentImage"
                                         src="${pageContext.request.contextPath}/images/new/receipt_light.png"
                                         style="max-width: 500px;" />
                                  </div>

                                  <div style="flex: none; font-size: 12px; text-align: left;">
                                    <label class="switch switchIV">
                                      <input type="checkbox" value="2"
                                                             onchange="setTemplateValues(this, 'IV', 4);"
                                                             ${configDto.invoiceTemplateType==4?'checked':''} />
                                      <span class="slider round"></span>
                                    </label>
                                    <div style="margin-top: 6px; font-weight: bold;">Sales Receipts Charcoal</div>
                                    <img class="parentImage"
                                         src="${pageContext.request.contextPath}/images/new/receipt_charcoal.png"
                                         style="max-width: 500px;" />
                                  </div>

                                </div>
                              </div>
                              <!-- estimationTab Ends -->



                            </div>
                          </div>
                        </td>
                      </tr>
                    </table>
                    <div>
                      <form:hidden path="empStateID" />
                        <form:hidden path="labelName" />
                          <form:hidden path="fileName" />
                            <input type="hidden" name="tabid" id="tid" value="" />
                            <input type="hidden" id="tempValueIV" value="${configDto.invoiceTemplateType}" />
                            <input type="hidden" id="tempValueEST" value="${configDto.estTemplateType}" />
                            <input type="hidden" id="tempValueSO" value="${configDto.soTemplateType}" />
                            <input type="hidden" id="tempValuePO" value="${configDto.poTemplateType}" />
                            <input type="hidden" id="tempValuePS" value="${configDto.psTemplateType}" />
                    </div>
                  </div>
                  <div>
                    <div align="center">
                      <input type="button" class="bottomButton formButton" onclick="saveTemplateTypes();" value="<spring:message code='BzComposer.global.save'/>" />
                      <input type="reset" class="bottomButton formButton" name="Cancel" value="<spring:message code='BzComposer.global.cancel'/>" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
                          </form:form>
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
                                  height: 100,
                                  width: 200,
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
                                  height: 100,
                                  width: 200,
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
                                  height: 100,
                                  width: 200,
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
