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

    <script>
            $(document).ready(function () {
                let successMessage = '<%= request.getAttribute("successMessage") %>';
                if (successMessage && successMessage !== "null") {
                    alert(successMessage);
                }
            });
        </script>
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
                                                    padding: 6px 8px;
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
           														<div style="overflow: auto;height: 145vh; width:300px;">


           															<table class="table table-hover mb-0">
           																<tbody id="custTableBody">
           																<c:if test="${not empty empList}">
           																	<%int ndx = 0;%>
           																	<c:forEach items="${empList}" var="objList">
           																	    <c:if test="${objList.terminated == null}">
                                                                                           <tr id='<%=ndx%>$$' class='row-employee' style="cursor:pointer" onclick="setRowId(this, ${objList.employeeID},<%=ndx%>);">
                                                                                                   <% ndx++; %>
                                                                                                   <td colspan="2" style="font-size: 14px; width: 300px;">
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
                <h3 class="card-title">Form 1099 </h3>
            </div>
            <div class="card-body">
        <form action="/submit1099Form" method="post">

                            <h5 class="font-weight-bold">Payer Information</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Payer's Name</label>
                                    <input type="text" class="form-control" name="payerName" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Payer's TIN</label>
                                    <input type="text" class="form-control" name="payerTIN" required>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="form-label">Payer's Address</label>
                                    <input type="text" class="form-control" name="payerAddress" required>
                                </div>

                            </div>

                            <h5 class="mt-4 font-weight-bold" >Recipient Information</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Recipient's Name</label>
                                    <input type="text" class="form-control" name="recipientName" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Recipient's TIN</label>
                                    <input type="text" class="form-control" name="recipientTIN" required>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="form-label">Recipient's Address</label>
                                    <input type="text" class="form-control" name="recipientAddress" required>
                                </div>
                            </div>

                            <h5 class="mt-4 font-weight-bold">Income & Payments</h5>
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="form-label">Non-Employee Compensation</label>
                                    <input type="number" step="0.01" class="form-control" name="nonEmployeeCompensation">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Other Income</label>
                                    <input type="number" step="0.01" class="form-control" name="otherIncome">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Dividends Paid</label>
                                    <input type="number" step="0.01" class="form-control" name="dividendsPaid">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <label class="form-label">Interest Income</label>
                                    <input type="number" step="0.01" class="form-control" name="interestIncome">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">State Income</label>
                                    <input type="number" step="0.01" class="form-control" name="stateIncome">
                                </div>

                            </div>

                            <h5 class="mt-4 font-weight-bold">Tax Withholding</h5>
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="form-label">Federal Tax Withheld</label>
                                    <input type="number" step="0.01" class="form-control" name="federalTaxWithheld">
                                </div>
                                <div class="col-md-4">
                                                 <label class="form-label">State Tax Withheld</label>
                                                  <input type="number" step="0.01" class="form-control" name="stateTaxWithheld">
                                                                </div>
                            </div>

                            <div class="mt-4 text-center">
                                <button type="submit" class="btn btn-info">Submit Form 1099</button>
                            </div>

        </form>
    </div>
        </div>
        </td>
                      </tr>
                      </table>
    </div>
</div>
</body>
</html>
