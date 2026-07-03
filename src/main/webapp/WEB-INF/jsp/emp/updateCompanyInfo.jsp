<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<title>BzPayroll - Employee List</title>

<style>

        .container {
            width: 700px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
        }
        .header {
            text-align: center;
            font-size: 1.2em;
            margin-bottom: 20px;
            color: #555;
        }
        .section-title {
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 5px;
        }
        .separator {
            border-top: 2px solid #00bcd4; /* Light blue line */
            margin-bottom: 15px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .form-row label {
            width: 30%; /* Label column width */
            text-align: left;
        }
        .form-row input, .form-row select {
            width: 65%; /* Input column width */
            padding: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .required::after {
            content: " *";
            color: red;
        }
    </style>
    <script>
    		$(document)
    				.ready(
    						function() {

    							$('#sellectCountry')
    									.on(
    											'change',
    											function() {
    												var id = $(this).val();
    												console
    														.log("Selected Country ID: "
    																+ id);

    												$
    														.ajax({
    															type : 'GET',
    															url : '/api/states',
    															data : {
    																id : id
    															},
    															dataType : 'json', //  Important: Expecting JSON
    															success : function(result) {

    																var s;
    																 for (var i = 0; i < result.length; i++) { // use .length
                                                                            s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                                                                        }
                                                                        $('#sellectState').html(s);
    															},
    															error : function(
    																	xhr,
    																	status,
    																	error) {
    																console
    																		.error(
    																				"AJAX Error:",
    																				error);
    																console
    																		.log(
    																				"Response Text:",
    																				xhr.responseText);
    															}
    														});
    											});

    							$('#sellectState')
    									.on(
    											'change',
    											function() {
    												var id = $(this).val();
    												console
    														.log("Selected State ID: "
    																+ id);

    												$
    														.ajax({
    															type : 'GET',
    															url : '/api/cities',
    															data : {
    																id : id
    															}, // send as query param ?id=...
    															dataType : 'json', // expecting JSON from server
    															success : function(
    																	result) {
    																var s;
    																for (var i = 0; i < result.length; i++) {
    																	console
    																			.log("Loop ID: "
    																					+ i);
    																	s += '<option value="' + result[i].id + '">'
    																			+ result[i].name
    																			+ '</option>';
    																}
    																$(
    																		'#sellectDistrict')
    																		.html(s);
    															},
    															error : function(
    																	xhr,
    																	status,
    																	error) {
    																console
    																		.error(
    																				"AJAX Error:",
    																				error);
    																console
    																		.log(
    																				"Response Text:",
    																				xhr.responseText);
    															}
    														});

    											});
    						});
    	</script>
<body onload="initialize();">
	<!-- begin shared/header -->
	<div id="ddcolortabsline">&nbsp;</div>
	<div class="container">
            <div class="header">
                Company information
            </div>
           <span style="display: block; text-align: center; font-size: 1.2em; font-weight: normal; color: #00BCD4;">
               <c:if test="${not empty message}">
                   ${message}
               </c:if>
           </span>



            <form action="save-company-registration-data" method="post" name="companyRegistrationData">

                <div class="form-row">
                    <input type="hidden" name="id" value="${companyRegistrationData.id}">
                </div>

                <div class="form-row">
                    <label for="email" class="required">Email Address:</label>
                    <input type="email" id="email" name="emailAddress" value="${companyRegistrationData.emailAddress}" required>
                </div>

                <div class="form-row">
                    <label for="firstName" class="required">First Name:</label>
                    <input type="text" id="firstName" name="firstName" value="${companyRegistrationData.firstName}" required>
                </div>

                <div class="form-row">
                    <label for="lastName" class="required">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" value="${companyRegistrationData.lastName}" required>
                </div>

                <div class="form-row">
                    <label for="language">Language:</label>
                    <select id="language" name="language">
                        <option value="">Select Language</option>
                        <option value="en" ${companyRegistrationData.language == 'en' ? 'selected' : ''}>English</option>
                        <option value="es" ${companyRegistrationData.language == 'es' ? 'selected' : ''}>Spanish</option>
                    </select>
                </div>

                <div class="form-row">
                    <label for="companyName" class="required">Company Name:</label>
                    <input type="text" id="companyName" name="companyName" value="${companyRegistrationData.companyName}" required>
                </div>

                <div class="form-row">
                    <label for="dbaName">Company DBA name:</label>
                    <input type="text" id="dbaName" name="dbaName" value="${companyRegistrationData.dbaName}">
                </div>

                <div class="form-row">
                    <label for="businessType">Business Type:</label>
                    <select id="businessType" name="businessType">
                        <option value="contractor" ${companyRegistrationData.businessType == 'contractor' ? 'selected' : ''}>Contractor</option>
                        <option value="corp" ${companyRegistrationData.businessType == 'corp' ? 'selected' : ''}>Corporation</option>
                        <option value="llc" ${companyRegistrationData.businessType == 'llc' ? 'selected' : ''}>LLC</option>
                    </select>
                </div>

                <div class="form-row">
                    <label for="address1" class="required">Address1:</label>
                    <input type="text" id="address1" name="address1" value="${companyRegistrationData.address1}" required>
                </div>

                <div class="form-row">
                    <label for="address2">Address2:</label>
                    <input type="text" id="address2" name="address2" value="${companyRegistrationData.address2}">
                </div>

                <div class="form-row">
                    <label for="zipCode" class="required">Zip Code:</label>
                    <input type="text" id="zipCode" name="zipCode" value="${companyRegistrationData.zipCode}" required>
                </div>

                <div class="form-row">
                    <label for="city" class="required">City:</label>
                    <select
                    name="city" id="sellectDistrict" class="form-select"
                       required>
                       <option value="">--Select--</option>
                    </select>
                </div>

                <div class="form-row">
                    <label for="state" class="required">State:</label>
                    <select name="state" id="sellectState" required>
                       <option value="">--Select--</option>
                    </select>
                </div>

                <div class="form-row">
                    <label for="country">Country:</label>
                    <select
                      id="sellectCountry" name="country" class="form-select"
                       required>
                       <option value="">--Select--</option>
                            <c:forEach var="bcpcountries" items="${countries}">
                               <option value="${bcpcountries.id}">${bcpcountries.name}</option>
                                                                                        				</c:forEach>
                        </select>
                </div>

               <div class="form-row">
                   <label for="phone">Phone:</label>
                   <input type="text" id="phone" name="phone" value="${companyRegistrationData.phone}">
               </div>

               <div class="form-row">
                   <label for="mobileNumber" >Cell Phone:</label>
                   <input type="text" id="mobileNumber" name="mobileNumber" value="${companyRegistrationData.mobileNumber}">
                 </label>
               </div>


               <div class="form-row">
                   <label for="fax">Fax:</label>
                   <input type="text" id="fax" name="fax" value="${companyRegistrationData.fax}">
               </div>


                <div style="text-align: center;">
                    <button type="submit" class="formbutton">Update</button>
                </div>

            </form>

            </div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
		<script>
		// Get references
        const phoneInput = document.getElementById("phone");
        const mobileInput = document.getElementById("mobileNumber");
        const sameAsPhoneCheckbox = document.getElementById("sameAsPhone");

        // On checkbox change
        sameAsPhoneCheckbox.addEventListener("change", function() {
            if (this.checked) {
                mobileInput.value = phoneInput.value; // copy value
                mobileInput.readOnly = true;          // optional: make mobile read-only
            } else {
                mobileInput.readOnly = false;         // allow editing
            }
        });

        // Optional: update mobile number live if phone changes while checkbox is checked
        phoneInput.addEventListener("input", function() {
            if (sameAsPhoneCheckbox.checked) {
                mobileInput.value = phoneInput.value;
            }
        });

		</script>
</body>
</html>
