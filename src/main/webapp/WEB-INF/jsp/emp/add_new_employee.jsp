<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
            <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
                <%@ page errorPage="../include/sessionExpired.jsp"%>
                    <html>
                        <head>
                            <!-- <script> -->
                            <!-- 	self.moveTo(100,50); -->
                            <!-- </script> -->
                            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                                <%@include file="../include/header.jsp"%>
                                    <title>BzPayroll - Add New Employee</title>
                                    <link
                                    href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css"
                                    rel="stylesheet" media="screen" />
                                    <link rel="stylesheet"
                                    href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
                                    <script
                                    src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
                                </head>
                                <style>
                                    table th {
                                    font-size: 14px !important;
                                    }
                                </style>
                                <body onload="init();">
                                    <script type="text/javascript">
                                        $(function() {
                                        $("#tabs").tabs();
                                        });
                                        var funsequence = 0;
                                        var _1 = navigator.userAgent.toLowerCase();
                                        var ___ = (_1.indexOf("msie") != -1);
                                        var ___5 = (_1.indexOf("msie 5") != -1);
                                        var _io = (_1.indexOf("opera") != -1);
                                        var _im = (_1.indexOf("mac") != -1);
                                        var ____gi = (_1.indexOf("gecko") != -1);
                                        var i____s = (_1.indexOf("safari") != -1);
                                        var o = null;
                                        var o1 = null;
                                        var o2 = null;
                                        var o3 = null;
                                        var r = null;

                                        function c(r) {

                                        if (___) {
                                        var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
                                        try {
                                        o = new ActiveXObject(t);
                                        o.onreadystatechange = r;
                                        } catch (ex) {
                                        alert("<bean:message key='BzComposer.common.needToEnableActiveXObject'/> ts.."
                                        + ex);
                                        }
                                        } else {
                                        o = new XMLHttpRequest();
                                        o.onload = r;
                                        o.onerror = r;
                                        }
                                        return o;
                                        }
                                        function oGET(oo, url) {
                                        try {
                                        oo.open("GET", url, true);
                                        oo.send(null);
                                        } catch (ex) {
                                        }
                                        }
                                        function writeSelect() {
                                        if (o.readyState != 4 || o.status != 200) {
                                        return;
                                        }
                                        document.getElementById("t_statedata").innerHTML = o.responseText;
                                        }
                                        function refreshItemsNow(val) {
                                        o = c(writeSelect);
                                        oGET(o,
                                        '${pageContext.request.contextPath}/include/GetStates.jsp?st=state&Cid='
                                        + val)
                                        }
                                        function writeSelect1() {
                                        if (o1.readyState != 4 || o1.status != 200) {
                                        return;
                                        }
                                        document.getElementById("t_statedata1").innerHTML = o1.responseText;
                                        }
                                        function refreshItemsNow1(val) {
                                        o1 = c(writeSelect1);
                                        oGET(o1,
                                        '${pageContext.request.contextPath}/include/GetStates.jsp?st=bsstate&Cid='
                                        + val)

                                        }
                                        function writeSelect2() {
                                        if (o2.readyState != 4 || o2.status != 200) {
                                        return;
                                        }
                                        document.getElementById("t_statedata2").innerHTML = o2.responseText;
                                        }
                                        function refreshItemsNow12(val, sval) {
                                        o2 = c(writeSelect2);
                                        oGET(o2,
                                        '${pageContext.request.contextPath}/include/GetStates.jsp?st=shstate&Cid='
                                        + val + "&sval=" + sval)
                                        }
                                        function refreshItemsNow2(val) {
                                        o2 = c(writeSelect2);
                                        oGET(o2,
                                        '${pageContext.request.contextPath}/include/GetStates.jsp?st=shstate&Cid='
                                        + val)
                                        }
                                        function setState(state_id, name) {
                                        if (name == 'state') {
                                        document.VendorForm.state.value = state_id;
                                        } else if (name == 'bsstate') {
                                        document.VendorForm.bsstate.value = state_id;
                                        document.getElementById('bsst').value = state_id;
                                        } else if (name == 'shstate') {
                                        document.VendorForm.shstate.value = state_id;
                                        }
                                        }
                                    </script>
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

                                        var s = '';
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
                                        var s = '';
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
                                        }
                                        });
                                        });

                                        });
                                    </script>
                                    <script>
                                        // Optional client-side validation
                                        function validateFileSize() {
                                        const fileInput = document.getElementById("file");
                                        const file = fileInput.files[0];
                                        if (file && file.size > 50 * 1024) {
                                        alert("Passport photo must be under 50 KB!");
                                        fileInput.value = "";
                                        return false;
                                        }
                                        return true;
                                        }
                                    </script>
                                    <script>
                                        let finalUrl='';
                                        function uploadPhoto() {

                                        const fileInput = document.getElementById("file");
                                        const file = fileInput.files[0];

                                        if (!file) {
                                        alert("Please select a photo!");
                                        return;
                                        }

                                        let formData = new FormData();
                                        formData.append("file", file);

                                        fetch("/api/photo-upload", {
                                        method: "POST",
                                        body: formData
                                        })
                                        .then(response => response.text())
                                        .then(result => {

                                        if (result.startsWith("SUCCESS")) {
                                        const newPhotoPath = result.split(":")[1];
                                        const finalUrl = "https://bzcomposer.com/bucket" + newPhotoPath;

                                        document.getElementById("empPhoto").setAttribute("src", finalUrl);
                                          document.getElementById("passPhoto").value = newPhotoPath;
                                        alert("Photo uploaded successfully!");
                                        }
                                        else if (result === "SIZE_ERROR") {
                                        alert("Image must be under 50 KB!");
                                        }
                                        else if (result === "TYPE_ERROR") {
                                        alert("Only JPG/PNG image files are allowed!");
                                        }
                                        else if (result === "UPLOAD_ERROR") {
                                        alert("Image server not working. Please try again.");
                                        }
                                        else if (result === "EMPTY") {
                                        alert("No file selected. Please choose a photo.");
                                        }
                                        else {
                                        alert("Something went wrong while uploading!");
                                        }

                                        })
                                        .catch(error => {
                                        console.error("Upload error:", error);
                                        alert("Network error! Please try again.");
                                        });

                                        }
                                    </script>


                                    <!-- begin shared/header -->


                                    <form action="save-employee" method="post" name="employee" onsubmit="return validateFileSize()">
                                        <div id="cos">
                                            <div class="statusquo ok">
                                                <div id="hoja">
                                                    <div id="blanquito">

                                                        <div id="padding">
                                                            <!-- begin Contents -->
                                                            <!-- add the code for tab here -->
                                                            <div>
                                                                <span
                                                                style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">Add
                                                                New Employee</span>
                                                            </div>

                                                            <div>
                                                                <div id="tabs" style="height: 1130px; width:1200px;">

                                                                    <div id="General-1">

                                                                        <div id="content1" class="tabPage">
                                                                            <!-- BUTTONS MUST BE AFTER THE TABLE -->
                                                                            <div style="width:100%; overflow:hidden; padding: 0px 0px 0px 0px;">
                                                                                <div style="float:right;">
                                                                                    <input type="reset" class="formbutton" name="clear" value="Clear Data" />
                                                                                    <input type="submit" class="formbutton" name="save" value="Save" />
                                                                                </div>
                                                                            </div>

                                                                            <div id="table-negotiations" style="text-align:center;">

                                                                                <table class="tabla-listados" cellspacing="0" style="margin-top:-1px;">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th colspan="8">Employee Information</th>
                                                                                        </tr>
                                                                                    </thead>


                                                                                    <tr>
                                                                                        <td>Employee
                                                                                        ID:
                                                                                    </td>
                                                                                    <td width="100px;"><input type="text"
                                                                                    name="employeeId" class="form-control" readonly /></td>
                                                                                    <td colspan="6"></td>
                                                                                    <%--<td>Photo:</td>
                                                                                    <td>
                                                                                        <input type="file" name="file" id="file" accept="image/*" />
                                                                                            <br>
                                                                                                <small style="color: #666;">Note: Upload a passport-size photo in JPG, JPEG, or PNG format (under 50 KB).</small>
                                                                                                </td>--%>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>Title: </td>
                                                                                                <td><select
                                                                                                name="title" class="form-select">

                                                                                                <option value="Mr.">Mr.</option>
                                                                                                <option value="Mrs.">Mrs.</option>
                                                                                                <option value="Ms.">Ms.</option>
                                                                                                <option value="Dr.">Dr.</option>
                                                                                                <option value="Prof.">Prof.</option>
                                                                                                </select></td>

                                                                                                <td  padding: 0; >First
                                                                                                Name: <span class="inputHighlighted"><spring:message
                                                                                                code="BzComposer.CompulsoryField.Validation" /></span>
                                                                                            </td>
                                                                                            <td colspan="5">
                                                                                                <div style="display:flex; align-items:center; gap:8px;">
                                                                                                   <input type="text" style="width: 25%;"
                                                                                                   name="firstName" class="form-control" required />
                                                                                                   <label style="margin:0; white-space:nowrap;">
                                                                                                   M.I.:
                                                                                                   </label>
                                                                                                    <input type="text"
                                                                                                           name="mi"
                                                                                                           class="form-control"
                                                                                                           style="width:70px;" />

                                                                                                    <label style="margin:0; white-space:nowrap;">
                                                                                                        Last Name:
                                                                                                        <span class="inputHighlighted">
                                                                                                            <spring:message code="BzComposer.CompulsoryField.Validation" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input type="text"
                                                                                                    name="lastName" style="width: 180%;" class="form-control" required />
                                                                                                </div>
                                                                                            </td>

                                                                                    </tr>


                                                                                    <tr>

                                                                                        <td rowspan="7" colspan="3">
                                                                                            <img id="empPhoto"
                                                                                            src="/images/passport_Photo.png"
                                                                                            alt="Passport Photo"
                                                                                            style="width:360px;height:250px;border:1px solid #ccc;">
                                                                                        </td>

                                                                                        <td>SSN:<span
                                                                                        class="inputHighlighted"><spring:message
                                                                                        code="BzComposer.CompulsoryField.Validation" /></td>
                                                                                        <td><input type="text"
                                                                                        name="ssn" class="form-control" required /></td>

                                                                                        <td>Date Of Birth:</td>
                                                                                        <td  padding: 0;"><input type="date"
                                                                                        name="dateofBirth" class="form-control"
                                                                                        placeholder="dd-mm-yyyy" /></td>
                                                                                        <td></td>
                                                                                    </tr>


                                                                                    <tr>
                                                                                        <td>Job Title:</td>
                                                                                        <td><select style="width:100%;"
                                                                                        name="jobTitle" class="form-select">

                                                                                        <c:forEach var="bcpJobtitle" items="${bcpJobtitleList}">
                                                                                            <option value="${bcpJobtitle.jobTitle}">${bcpJobtitle.jobTitle}</option>
                                                                                        </c:forEach>
                                                                                        </select></td>

                                                                                        <td>Employee Status:</td>
                                                                                        <td><select style="width:100%;"
                                                                                        name="employeeStatus" class="form-select" >

                                                                                        <c:forEach var="employeeType"
                                                                                        items="${bcpEmployeetypeList}">
                                                                                        <option value="${employeeType.employeeType}">${employeeType.employeeType}</option>
                                                                                    </c:forEach>
                                                                                    </select></td>
                                                                                   <td></td>

                                                                                </tr>
                                                                                <tr>
                                                                                  <td>Job Type:
                                                                                </td>
                                                                                <td><select style="width:100%;"
                                                                                name="jobType" class="form-select">

                                                                                <c:forEach var="role" items="${employeeRoles}">
                                                                                    <option value="${role}">${role}</option>
                                                                                </c:forEach>
                                                                                </select>
                                                                                </td>
                                                                                <td colspan="3">
                                                                                <label> W-9 Field: <input
                                                                                type="checkbox" name="fieldw9" value="Yes" />
                                                                                </label>
                                                                                </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Company Name:</td>
                                                                                    <td colspan="2"><input type="text"
                                                                                    name="companyName" class="form-control" style="width:100%;" /></td>
                                                                                    <td colspan="2">
                                                                                    <div style="display:flex; align-items:center; gap:8px;">
                                                                                    <label style="margin:0; white-space:nowrap;">
                                                                                    DBA Name:
                                                                                    </label>
                                                                                    <input type="text"
                                                                                    name="dbaName" class="form-control" />
                                                                                    </div>
                                                                                    </td>

                                                                            </tr>
                                                                            <tr>
                                                                             <td>Address1:</td>
                                                                                        <td colspan="4">
                                                                                        <input
                                                                                        type="text" name="address1" class="form-control"
                                                                                        />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                    <td>
                                                                                    Address2:
                                                                                    </td>
                                                                                    <td colspan="4">
                                                                                    <input type="text" name="address2" class="form-control"/>

                                                                                    </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td >Zip Code:</td>
                                                                                       <td ><input type="text"
                                                                                       name="zipCode" class="form-control" onfocusout="loadAddressDetailsByZipcode(this.value, 1)"/></td>
                                                                                       <td colspan="2">
                                                                                       <div style="display:flex; align-items:center; gap:8px;">
                                                                                       <label style="margin:0; white-space:nowrap;">
                                                                                       City:
                                                                                       </label>
                                                                                           <select style="width:60%;"
                                                                                           name="cityId" id="sellectDistrict" class="form-select"
                                                                                           >
                                                                                           <c:forEach items="${cityList}"
                                                                                           var="mxObject">
                                                                                           <option
                                                                                           id="cityId${mxObject.cityId}"
                                                                                           value="${mxObject.cityId}">
                                                                                           ${mxObject.cityName}
                                                                                       </option>
                                                                                   </c:forEach>
                                                                                   </select>
                                                                                   </div>
                                                                                   </td>
                                                                                   <td></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                    <td colspan="3" style="text-align:center;">
                                                                                      <label for="file" class="formbutton" title="Note: Upload a passport-size photo in JPG, JPEG, or PNG format (under 50 KB).">Choose File</label>
                                                                                      <input type="file" name="file" id="file" accept="image/*" style="display:none;" onchange="uploadPhoto()" />
                                                                                       <input type="hidden" name="passportPhoto" id="passPhoto">
                                                                                       </td>
                                                                                    <td>State:</td>
                                                                                    <td>
                                                                                        <select name="stateId" id="sellectState">
                                                                                            <c:forEach items="${stateList}"
                                                                                            var="stateItem">
                                                                                            <option
                                                                                            value="${stateItem.stateId}">
                                                                                            ${stateItem.state}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                    </select></td>
                                                                                    <td colspan="2">
                                                                                    <div style="display:flex; align-items:center; gap:8px;">
                                                                                    <label style="margin:0; white-space:nowrap;">
                                                                                    Country:
                                                                                    </label>
                                                                                        <select
                                                                                        id="sellectCountry" name="countryId" class="form-select"
                                                                                        >
                                                                                        <option value="231">United States</option>
                                                                                        <c:forEach var="bcpcountries" items="${countries}">
                                                                                            <option value="${bcpcountries.id}">${bcpcountries.name}</option>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                    </div>
                                                                                </td>
                                                                                <td></td>
                                                                            </tr>


                                                                            <tr>
                                                                                <td >Phone:</td>
                                                                                <td colspan="2" >
                                                                                    <input type="tel" id="phone" name="phone" class="form-control"
                                                                                    placeholder="1(213)732-9638"
                                                                                    maxlength="14"
                                                                                    title="Format: 1(213)732-9638">
                                                                                </td>

                                                                                <td colspan="2"><label> Same as the mobile
                                                                                number: <input type="checkbox" id="sameAsPhone" />
                                                                                </label></td>
                                                                                <td colspan="3">
                                                                                <div style="display:flex; align-items:center; gap:8px;">
                                                                                <label style="margin:0; white-space:nowrap;">
                                                                                Mobile:
                                                                                </label>
                                                                                    <input
                                                                                    type="tel"
                                                                                    name="cellPhone"
                                                                                    id="mobile"
                                                                                    class="form-control"
                                                                                    placeholder="(555) 555-5555"
                                                                                    maxlength="14">
                                                                                </td>



                                                                            </tr>

                                                                            <tr>

                                                                                <!-- Wrap Email label input and Date of added in div flex box -->
                                                                                <td colspan="5">
                                                                                    <div style="display: flex; align-items: center; gap: 16px;">
                                                                                        <div style="display: flex; align-items: center; gap: 6px; width: 50%;">
                                                                                            <label style="margin-bottom: 0; width: 70px;">Email:</label>
                                                                                            <input
                                                                                                type="email"
                                                                                                name="email"
                                                                                                class="form-control"
                                                                                            />
                                                                                        </div>
                                                                                        <div style="display: flex; align-items: center; gap: 6px; width: 35%;">
                                                                                            <label style="margin-bottom: 0; width: 200px;">Date of Started:</label>
                                                                                            <input
                                                                                                type="date"
                                                                                                name="dateStarted"
                                                                                                class="form-control"
                                                                                            />
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                          
                                                                        </tr>


                                                                        <tr>
                                                                            <td >Memo:</td>
                                                                            <td colspan="3"><textarea name="memo" rows="3"
                                                                            class="form-control"></textarea></td>
                                                                            <td colspan="2">
                                                                                <div style="display:flex; align-items:center; gap:8px;">
                                                                                <label style="margin:0; white-space:nowrap;">
                                                                                Date Added:
                                                                                </label>
                                                                                <input type="date" name="dateAdded" class="form-control date-field"/>
                                                                                </div>
                                                                            </td>
                                                                            <td colspan="2">
                                                                            <div style="display:flex; align-items:center; gap:8px;">
                                                                            <label style="margin:0; white-space:nowrap;">
                                                                            Terminated Date:
                                                                            </label>
                                                                            <input type="date"
                                                                            name="dateTerminated" class="form-control" />
                                                                            </div>
                                                                            </td>
                                                                        </tr>
                                                                        </tr>
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="8">bzcomposer.com</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                    <td colspan="2" ><label>Website
                                                                                    Access: <input type="checkbox" checked
                                                                                    name="websiteAccess" value="Yes" />
                                                                                    </label></td>

                                                                                    <td colspan="3" style="padding-right: 10px; "><input
                                                                                    type="text" value="https://bzcomposer.com/" name=""
                                                                                    class="form-control" readonly /></td>
                                                                                     <td ><label>Allowed
                                                                                    URL: <input type="checkbox" checked name="allowedUrl"
                                                                                    value="Yes" />
                                                                                    </label></td>
                                                                                    <td colspan="2">
                                                                                    <div style="display:flex; align-items:center; gap:8px;">
                                                                                    <label style="margin:0; white-space:nowrap;">
                                                                                    Password:
                                                                                    </label>
                                                                                    <input
                                                                                    type="password" id="password" name="password"
                                                                                    class="form-control" />
                                                                                    </div>
                                                                                    </td>
                                                                                </tr>
                                                                        </tbody>
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="8">Time Clock</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                    <td colspan="2" ><label>Time
                                                                                    Clock Access: <input type="checkbox"
                                                                                    name="timeClockAccess" value="Yes" checked />
                                                                                    </label></td>
                                                                                    
                                                                                <td >
                                                                                    <div style="display:flex; align-items:center; gap:8px;">
                                                                                        <label style="margin:0; white-space:nowrap;">
                                                                                            Code Number:
                                                                                        </label>
                                                                                    <input type="text"
                                                                                name="codeNumber" class="form-control" />
                                                                                    </div>
                                                                                </td>
                                                                            
                                                                            </tr>
                                                                        </tbody>
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="8">PayRoll & Tax Info</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td >Filing Status:
                                                                            </td>
                                                                            <td><select
                                                                            name="filingStatus" class="form-control">
                                                                            <option value="Single">Single</option>
                                                                            <option value="Married">Married</option>
                                                                            <option value="Unmarried head of household">Unmarried head of household</option>
                                                                            <c:forEach var="filingstatuses"
                                                                            items="${bcpFilingstatuses}">
                                                                            <option value="${filingstatuses.filingStatusId}">${filingstatuses.filingStatus}</option>
                                                                        </c:forEach>
                                                                        </select></td>

                                                                        
                                                                    <td >
                                                                        <div style="display:flex; align-items:center; gap:8px;">
                                                                        <label style="margin:0; white-space:nowrap;">
                                                                        Allowance:
                                                                        </label>
                                                                        <input
                                                                    type="number" name="allowance" class="form-control"
                                                                    min="0" />
                                                                    </div>
                                                                    </td>
                                                                <td >
                                                                    <div style="display:flex; align-items:center; gap:8px;">
                                                                    <label style="margin:0; white-space:nowrap;">
                                                                    State Worked:
                                                                    </label>
                                                                    <input type="text"
                                                                    name="stateWorked" class="form-control" maxlength="2"
                                                                    />
                                                                    </div>
                                                                    </td>
                                                                <td colspan="2" >
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <label>
                                                                W-2 Submitted: <input type="checkbox" checked
                                                                name="w2Submitted" value="Yes" />
                                                                </label></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                            <td >Pay Period:</td>
                                                            <td>
                                                                <select style="width:100%;" name="payPeriod" class="form-select" >
                                                                    <c:forEach var="payPeriod"
                                                                        items="${bcpPayPeriodList}">
                                                                        <option value="${payPeriod.payPeriod}">${payPeriod.payPeriod}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
                                                            <td colspan="2">
                                                                <div style="display:flex; align-items:center; gap:8px;">Payroll Type:
                                                                <select style="width:50%;" name="payrollType" class="form-select">
                                                                    <c:forEach var="payrollType"
                                                                        items="${bcpPayrollTypeList}">
                                                                        <option value="${payrollType.payrollType}">${payrollType.payrollType}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                </div>
                                                            </td>
                                                        
                                                    <td>
                                                        <div style="display:flex; align-items:center; gap:8px;">
                                                        <label style="margin:0; white-space:nowrap;">
                                                        Amount:
                                                        </label>
                                                        <input type="number" name="amount" class="form-control"
                                                        />
                                                        </div>
                                                        </td>

                                                    <td colspan="2">
                                                        <label><input
                                                        type="checkbox" checked name="fullTime" value="Yes" onclick="toggleCheckbox(this, 'partTime')" />
                                                        Full Time</label>
                                                        <label><input
                                                        type="checkbox" name="partTime" value="Yes" onclick="toggleCheckbox(this, 'fullTime')" />
                                                        Part Time</label>
                                                    </td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td >Hourly Rate:
                                                </td>
                                                <td ><input
                                                type="number" name="hourlyRate" class="form-control"
                                                /></td>

                                                <td ><label><input
                                                type="checkbox" checked name="overtimeApplied" value="Yes" />
                                                Overtime Applied</label></td>
                                                
                                            <td >
                                                <div style="display:flex; align-items:center; gap:8px;">
                                                <label style="margin:0; white-space:nowrap;">
                                                Monthly Salary:
                                                </label>
                                                <input type="number" name="monthlySalary" class="form-control"
                                            type="number" name="monthlySalary" class="form-control"
                                            />
                                            </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                                                        </tr>
                                                                        <thead>
                                                                            <tr>
                                                                                <th colspan="8">Other Deductions</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td colspan="8">
                                                                                    <table class="table table-sm table-bordered" id="otherDeductionsTable">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <td>Deduction</td>
                                                                                                <td>Amount</td>
                                                                                                <td>Rate</td>
                                                                                                <td>Use Rate</td>
                                                                                                <td>Tax Exempt</td>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <!-- These rows should be generated dynamically based on company configuration -->
                                                                                            <tr>
                                                                                                <td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td style="text-align: center;"><input type="text" class="form-control" name="deductionType"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="amount"/></td>
                                                                                                <td style="text-align: center;"><input type="number" class="form-control" name="rate"/></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="useRate" /></td>
                                                                                                <td style="text-align: center;"><input type="checkbox" name="taxExempt"/></td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>

                                </table>
                            </div>
                        </div>
                    </div>







                </div>

    </div>
</div>
</div>
</div>
</div>
</div>
<!--</div>-->
<!--</div></div>-->
<!--</div>-->
<!--</div>-->


</form>
    <%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"></script>


    <script>
        function loadAddressDetailsByZipcode(zipCode, indexNo){
        console.log(zipCode)
        indexNo = indexNo==1?"":indexNo;
        if(zipCode.length < 4 || zipCode.length > 6){
        alert(selectValidZipcodeMsg);
        }
        else{
        $.ajax({
        type: "POST",
        url:"/cities/"+zipCode,
        success : function(data) {
        console.log(data)
        if(data){
        //$("#countryID"+indexNo).val(data.country).change();
        setTimeout(function(){
        console.log("MARKERXYZ",data);
        $("#sellectState").val(data.state).change();
        setTimeout(function(){
        $("#sellectDistrict").val(data.cityId);
        }, 1000);
        }, 1000);
        }else{
        alert(noRecordsFoundMsg);
        }
        },
        error : function(data) {
        alert('ERROR');
        }
        });
        }
        }

    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Initialize intl-tel-input for phone fields
            const phoneInputField = document.querySelector("#phone");
            if (phoneInputField && window.intlTelInput) {
                window.phoneInput = window.intlTelInput(
                    phoneInputField,
                    {
                        initialCountry : "us",
                        preferredCountries : [ "us", "in", "gb" ],
                        separateDialCode : true,
                        nationalMode : false,
                        utilsScript : "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
                    });
            }

            // Function to format phone number as (555) 555-5555
            function formatPhoneNumber(value) {
                // Remove all non-digit characters
                const digits = value.replace(/\D/g, '');
                
                // Limit to 10 digits
                const limitedDigits = digits.substring(0, 10);
                
                // Format as (XXX) XXX-XXXX
                if (limitedDigits.length === 0) {
                    return '';
                } else if (limitedDigits.length <= 3) {
                    return '(' + limitedDigits;
                } else if (limitedDigits.length <= 6) {
                    return '(' + limitedDigits.substring(0, 3) + ') ' + limitedDigits.substring(3);
                } else {
                    return '(' + limitedDigits.substring(0, 3) + ') ' + limitedDigits.substring(3, 6) + '-' + limitedDigits.substring(6);
                }
            }

            // Apply formatting to phone field
            const phoneField = document.getElementById("phone");
            if (phoneField) {
                // Format on input
                phoneField.addEventListener('input', function(e) {
                    const cursorPosition = e.target.selectionStart;
                    const oldValue = e.target.value;
                    const newValue = formatPhoneNumber(e.target.value);
                    
                    // Only update if formatting changed
                    if (oldValue !== newValue) {
                        e.target.value = newValue;
                        // Adjust cursor position
                        const lengthDiff = newValue.length - oldValue.length;
                        e.target.setSelectionRange(cursorPosition + lengthDiff, cursorPosition + lengthDiff);
                    }
                });
            }

            // Apply formatting to mobile field
            const mobileField = document.getElementById("mobile");
            if (mobileField) {
                // Format on input
                mobileField.addEventListener('input', function(e) {
                    const cursorPosition = e.target.selectionStart;
                    const oldValue = e.target.value;
                    const newValue = formatPhoneNumber(e.target.value);
                    
                    e.target.value = newValue;
                    
                    // Adjust cursor position
                    const lengthDiff = newValue.length - oldValue.length;
                    e.target.setSelectionRange(cursorPosition + lengthDiff, cursorPosition + lengthDiff);
                });
            }

            // Set up phone sync functionality
            const checkbox = document.getElementById("sameAsPhone");

            if (checkbox && phoneField && mobileField) {
                checkbox.addEventListener("change", function() {
                    if (this.checked) {
                        // Copy phone to mobile and format it
                        mobileField.value = formatPhoneNumber(phoneField.value);
                        mobileField.readOnly = true; // Make mobile read-only
                    } else {
                        mobileField.readOnly = false; // Remove read-only
                        mobileField.value = ""; // Clear mobile field
                    }
                });

                // Update mobile when phone changes while checkbox is checked
                phoneField.addEventListener("input", function() {
                    if (checkbox.checked) {
                        mobileField.value = formatPhoneNumber(phoneField.value);
                    }
                });
            }

            // Set default date for date fields
            let today = new Date().toISOString().split('T')[0];
            document.querySelectorAll(".date-field").forEach(function(el) {
                el.value = today;
            });
        });
    </script>
    <script>
    function toggleCheckbox(selected, otherName) {
    if (selected.checked) {
        document.getElementsByName(otherName)[0].checked = false;
    }
    }
    </script>
</body>
</html>

