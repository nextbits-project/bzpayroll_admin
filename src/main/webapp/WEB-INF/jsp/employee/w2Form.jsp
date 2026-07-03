<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
    <%@include file="/WEB-INF/jsp/include/header.jsp"%>
    <%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    <title><spring:message code="BzComposer.payroll.title.createPayroll" /></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

     <script>$(document).ready(function () {
                let successMessage = '<%= request.getAttribute("successMessage") %>';
                if (successMessage && successMessage !== "null") {
                    alert(successMessage);
                }
            }); </script>
             <script>
            		$(document).ready(function(){
            			$("#myInput").on("keyup", function() {
            				var value = $(this).val().toLowerCase();
            				$("#custTableBody tr").filter(function() {

            					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            				});
            			});
            		});
            	</script>
            	<script>
                  $(document).ready(function() {
                    $('.table_class td').click(function() {
                      let obj = $(this).data("obj");
                      $('#employerName').val(obj.fname+" "+obj.lname);
                        $('#employerAddress').val(obj.address1);
                        $('#employerName_2').val(obj.fname+" "+obj.lname);
                        $('#ssn').val(obj.ssn);
                        $('#employerStateId').val(obj.state);
                      console.log(obj);
                    });
                  });
                </script>
                <script>
                                                                                $(document).ready(function () {
                                                                                    $('#custTableBody').on('click', 'td', function () {
                                                                                        // Remove selection from all other td cells
                                                                                        $('#custTableBody td').removeClass('selected-cell');

                                                                                        // Add class to clicked cell only
                                                                                        $(this).addClass('selected-cell');
                                                                                    });
                                                                                });
                                                                                </script>
                                                                                <style>
                                                                                .selected-cell {
                                                                                    background-color: #7b8081 !important;
                                                                                    color: white !important;
                                                                                }
                                                                                #css{
                                                                                           background: linear-gradient(135deg, #00ACC1, #00ACC1);
                                                                                                    padding: 16px 24px;
                                                                                                    border-radius: 8px;
                                                                                                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                                                                                                    color: #ffffff;
                                                                                                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                                                                                                    font-size: 1.25rem;
                                                                                                    font-weight: bold;
                                                                                                    display: flex;
                                                                                                    align-items: center;
                                                                                                    justify-content: center;
                                                                                        }
                                                                                        #css1{
                                                                                                           background: linear-gradient(135deg, #00ACC1, #00ACC1);
                                                                                                                    padding: 6px 12px;
                                                                                                                    border-radius: 8px;
                                                                                                                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                                                                                                                    color: #ffffff;
                                                                                                                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                                                                                                                    font-size: 1.25rem;
                                                                                                                    font-weight: bold;
                                                                                                                    display: flex;
                                                                                                                    align-items: center;
                                                                                                                    justify-content: center;
                                                                                                        }
                                                                                </style>

</head>
<body>
<div class="container mt-4">
    <div class="container">
       <div>
       <table style="margin:5px;">
       								<tr>
       									<td>
       										<spring:message code="BzComposer.searchbuttontext" />
       									</td>
       									<td>
       										<input type="text" id="myInput">
       									</td>
       									<td colspan="4">&nbsp;</td>
       								</tr>
       							</table>

       											<table class="tabla-listados" cellspacing="0" style="padding: 0; margin: 0;">


       												<tr>
       													<!-- <td colspan="4" style="padding: 6px 0px 3px 3px"> -->
       													<td colspan="4" style="margin: 0; padding:0;">
<div class="card-header text-white text-center font-weight-bold" id="css">
                    Employee List
                </div>

       														<!-- <div style="overflow: auto; height:340; width: 300px;"> -->
       														<div style="overflow: auto;height: 135vh; width:300px;">


       															<table class="table table-hover mb-0">
       																<tbody id="custTableBody">
       																<c:if test="${not empty empList}">
       																	<%int ndx = 0;%>
       																	<c:forEach items="${empList}" var="objList">
       																	    <c:if test="${objList.terminated == null}">

                                                                                       <tr id='<%=ndx%>$$' class='row-employee'>
                                                                                               <% ndx++; %>
                                                                                               <td colspan="2" style="font-size: 14px; width: 300px;" data-obj='{"fname":"${objList.fname}","lname":"${objList.lname}","address1":"${objList.address1}","ssn":"${objList.ssn}","state":"${objList.state}"}'>
                                                                                                       ${objList.fname} ${objList.lname}
                                                                                               </td>
                                                                                       </tr>
       																	    </c:if>

       																	</c:forEach>
       																	<input type="hidden" name="listSize" id="lSize" value='<%=ndx%>'>
       																</c:if>
       																</tbody>
       															</table>
       														</div>
       														</td>
<td>

        <div class="card">
            <div class="card-header" id="css1">
                <h3 class="card-title">W2 Form</h3>
            </div>
            <div class="card-body">
    <form action="/submitW2Form" method="post">
               <h5 class="mb-3 font-weight-bold">Employer Information</h5>
               <div class="row mb-3">
                   <div class="col-md-6">
                       <label class="form-label">Employer's Name</label>
                       <input type="text" class="form-control" name="employerName" id="employerName" required>
                   </div>
                   <div class="col-md-6">
                       <label class="form-label">EIN (Employer Identification Number)</label>
                       <input type="text" class="form-control" name="employerEIN" required>
                   </div>
                   <div class="col-md-6 mt-2">
                       <label class="form-label">Employer's Address</label>
                       <input type="text" class="form-control" name="employerAddress" id="employerAddress" required>
                   </div>
                    <div class="col-md-6 mt-2">
                        <label class="form-label">Employer's State ID Number</label>
                        <input type="text" class="form-control" name="employerStateId" id="employerStateId" required>
                    </div>
               </div>

               <h5 class="mb-3 mt-4 font-weight-bold">Employee Information</h5>
               <div class="row mb-3">
                   <div class="col-md-6">
                       <label class="form-label">Employee Name</label>
                       <input type="text" class="form-control" name="employeeName" id="employerName_2" required>
                   </div>
                   <div class="col-md-6">
                       <label class="form-label">Social Security Number (SSN)</label>
                       <input type="text" class="form-control" name="ssn" required>
                   </div>
               </div>

               <h5 class="mb-3 mt-4 font-weight-bold">Income & Withholding</h5>
               <div class="row mb-3">
                   <div class="col-md-4">
                       <label class="form-label">Wages, Tips, & Other Compensation</label>
                       <input type="number" class="form-control" name="wages" required>
                   </div>
                   <div class="col-md-4">
                       <label class="form-label">Federal Income Tax Withheld</label>
                       <input type="number" class="form-control" name="federalTax" required>
                   </div>
                   <div class="col-md-4">
                       <label class="form-label">Social Security Tax Withheld</label>
                       <input type="number" class="form-control" name="ssTax" required>
                   </div>
                   <div class="col-md-4 mt-2">
                           <label class="form-label">Social Security Wages</label>
                           <input type="text" class="form-control" name="socialSecurityWages" required>
                      </div>
            <div class="col-md-4 mt-2">
                   <label class="form-label">Medicare Wages</label>
          <input type="text" class="form-control" name="medicareWages" required>
       </div>
     <div class="col-md-4 mt-2">
                          <label class="form-label">Medicare tax withheld</label>
                             <input type="text" class="form-control" name="medicareTaxWithheld" required>
                        </div>
            <div class="col-md-4 mt-2">
                    <label class="form-label">State Wages</label>
                   <input type="text" class="form-control" name="stateWages" required>
            </div>
                      <div class="col-md-4 mt-2">
                          <label class="form-label">State tax withheld</label>
                            <input type="text" class="form-control" name="stateTaxWithheld" required>
                       </div>
                   <div class="col-md-4 mt-2">
                      <label class="form-label">Local Wages</label>
                         <input type="text" class="form-control" name="localWages" required>
                    </div>
       <div class="col-md-4 mt-2">
                            <label class="form-label">Local tax withheld</label>
                               <input type="text" class="form-control" name="localTaxWithheld" required>
                          </div>
               </div>

               <div class="text-center">
                   <button type="submit" class="btn btn-info">
                       <i class="bi bi-save"></i> Submit W-2 Form
                   </button>
               </div>
           </form>
       </div>
       	</td>
              </tr>
              </table>
        </div>
    </div>

</div>
</body>
</html>
