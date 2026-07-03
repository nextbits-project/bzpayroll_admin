<%@ page contentType="text/html;charset=UTF-8" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
                        <%@include file="/WEB-INF/jsp/include/header.jsp" %>
                            <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
                                <title>
                                    Create Employee Role
                                </title>
                                <link rel="stylesheet"
                                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

                                <style>
                                    body {
                                        background-color: #f8f9fa;
                                        font-family: Arial, sans-serif;
                                    }

                                    .main-container {
                                        padding: 20px;
                                        max-width: 1400px;
                                        margin: 0 auto;
                                    }

                                    .panel {
                                        background-color: white;
                                        border-radius: 8px;
                                        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                                        margin-bottom: 20px;
                                        border: 1px solid #ddd;
                                    }

                                    .panel-header {
                                        padding: 15px 20px;
                                        border-bottom: 1px solid #eee;
                                        font-size: 18px;
                                        font-weight: 500;
                                        color: #333;
                                    }

                                    .panel-body {
                                        padding: 20px;
                                    }

                                    .form-section {
                                        margin-bottom: 30px;
                                    }

                                    .section-title {
                                        font-size: 18px;
                                        font-weight: 500;
                                        margin-bottom: 15px;
                                        color: #333;
                                        border-bottom: 1px solid #eee;
                                        padding-bottom: 10px;
                                    }

                                    .form-control,
                                    .custom-select {
                                        border: 1px solid #ced4da;
                                        border-radius: 4px;
                                        height: calc(2.25rem + 2px);
                                        padding: .375rem .75rem;
                                        font-size: 14px;
                                    }

                                    .form-control:focus,
                                    .custom-select:focus {
                                        border-color: #80bdff;
                                        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, .25);
                                    }

                                    label {
                                        font-size: 14px;
                                        font-weight: 500;
                                        color: #444;
                                        margin-bottom: 5px;
                                    }

                                    .btn-info {
                                        background-color: #17a2b8;
                                        border-color: #17a2b8;
                                    }

                                    .btn-info:hover {
                                        background-color: #138496;
                                        border-color: #117a8b;
                                    }

                                    .salary-section {
                                        background-color: #f8f9fa;
                                        border-radius: 4px;
                                        padding: 15px;
                                        margin-bottom: 15px;
                                    }

                                    .input-group-text {
                                        font-size: 14px;
                                        background-color: #f8f9fa;
                                        border: 1px solid #ced4da;
                                    }

                                    .employee-list-container {
                                        border: 1px solid #ddd;
                                        border-radius: 4px;
                                        height: 712px;
                                        overflow-y: auto;
                                    }

                                    #employeeTable {
                                        width: 100%;
                                    }

                                    #employeeTable th {
                                        background-color: #f8f9fa;
                                        padding: 10px;
                                        font-size: 14px;
                                        font-weight: 500;
                                        border-bottom: 1px solid #ddd;
                                    }

                                    #employeeTable td {
                                        padding: 10px;
                                        font-size: 14px;
                                        border-bottom: 1px solid #eee;
                                    }

                                    #employeeTable tr:hover {
                                        background-color: #f1f1f1;
                                        cursor: pointer;
                                    }

                                    .alert {
                                        margin-bottom: 20px;
                                    }

                                    .form-layout {
                                        display: flex;
                                        flex-wrap: wrap;
                                    }

                                    .form-group {
                                        margin-bottom: 1rem;
                                    }

                                    .form-column {
                                        flex: 1;
                                        min-width: 250px;
                                        padding: 0 10px;
                                    }

                                    .action-buttons {
                                        text-align: right;
                                        padding: 15px;
                                        border-top: 1px solid #eee;
                                    }

                                    .form-layout {
                                        width: 100%;
                                        margin: 20px auto;
                                        font-family: Arial, sans-serif;
                                    }

                                    .form-layout table {
                                        width: 100%;
                                        border-collapse: collapse;
                                        background-color: #f9f9f9;
                                        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                                        border-radius: 8px;
                                        overflow: hidden;
                                    }

                                    .form-layout td {
                                        padding: 12px 15px;
                                        border: 1px solid #ddd;
                                        vertical-align: middle;
                                    }

                                    .form-layout input[type="text"],
                                    .form-layout input[type="number"],
                                    .form-layout input[type="date"],
                                    .form-layout select {
                                        width: 100%;
                                        padding: 6px 10px;
                                        border: 1px solid #ccc;
                                        border-radius: 4px;
                                        font-size: 14px;
                                    }

                                    .form-layout tr:nth-child(even) {
                                        background-color: #f0f0f0;
                                    }

                                    .form-layout strong {
                                        display: block;
                                        font-size: 16px;
                                        background-color: #e0e0e0;
                                        padding: 8px 12px;
                                        border-left: 5px solid #00ACC1;
                                    }

                                    .text-right {
                                        text-align: right;
                                        padding: 15px;
                                    }

                                    .btn-success {
                                        background-color: #4CAF50;
                                        color: white;
                                        padding: 10px 16px;
                                        border: none;
                                        border-radius: 4px;
                                        font-size: 14px;
                                        cursor: pointer;
                                    }

                                    .btn-success:hover {
                                        background-color: #45a049;
                                    }

                                    .panel-header {
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
                                </style>
                                <style>
                               .role-table thead th {
                                    background-color: #808080 !important; /* Bootstrap green */
                                    color: white;
                                    text-align: center;
                                  }
                                </style>
                </head>

      <body>
        <div id="ddcolortabsline">&nbsp;</div>

        <div class="main-container">
          <div class="row">
            <!-- Form Column -->
            <div class="col-md-12">
              <form action="/dashboard/add-new-employee" method="post">
                <!-- Panel Start -->
                <div class="panel">
                  <div class="panel-header">
                    <strong>Create Employee Role</strong>
                  </div>
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
                      <table class="table table-bordered">
                        <tr>
                          <td>Role Name:</td>
                          <td colspan="3"><input type="text" class="form-control" name="roleName" placeholder="Enter here" required /></td>
                          <td colspan="2"></td>

                        <!-- Time Clock Settings -->
                        <tr>
                          <td colspan="6"><strong>Time Clock Settings</strong></td>
                        </tr>
                        <tr>
                          <td>Time Clock Required:</td>
                          <td><input type="checkbox" name="timeClockRequired" value="Y" /></td>
                          <td>Password Required:</td>
                          <td><input type="checkbox" name="passwordRequired" value="Y" /></td>
                          <td>Time Shifts Allowed:</td>
                          <td><input type="checkbox" name="timeShiftsAllowed" value="Y" /></td>

                        </tr>

                        <!-- Bzcomposer Access -->
                        <tr>
                          <td colspan="6"><strong>Bzcomposer Access</strong></td>
                        </tr>
                        <tr>
                          <td>Bzcomposer Access:</td>
                          <td><input type="checkbox" name="bzcomposerAccess" value="Y" /></td>
                          <td>ID/Password Required:</td>
                          <td><input type="checkbox" name="idPasswordRequired" value="Y" /></td>
                          <td colspan="4"></td>
                        </tr>
                         <tr>
                                  <td>Feature Access:</td>
                                  <td colspan="5">
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="FILE" /> FILE</label>
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="CUSTOMER" /> CUSTOMER</label>
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="ITEM" /> ITEM</label>
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="REPORTS" /> REPORTS</label>
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="SETTINGS" /> SETTINGS</label>
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="ACCOUNTS" /> ACCOUNTS</label>
                                    <label class="me-3"><input type="checkbox" name="accessFeatures" value="INVENTORY" /> INVENTORY</label>
                                  </td>

                                </tr>
                        <!-- Buttons -->
                        <tr>
                          <td colspan="6" style="text-align: right;">
                            <button type="submit" class="btn btn-info" name="Submit" value="submit">Save Role</button>
                          </td>
                        </tr>
                      </table>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>


           <div class="panel">
            <div class="panel-header">
               <strong>
                  Role Table
                </strong>
              </div>

               <div class="form-layout">
               <table class="table table-bordered role-table">
                <thead class="bg-success text-white">
                  <tr>
                    <th>Role Name</th>
                    <th>Time Clock Required</th>
                    <th>PW Required</th>
                    <th>Time Shifts Allowed</th>
                    <th>Bzcomposer Access</th>
                    <th>ID/PW Required</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${roleList}" var="role" varStatus="loop">
                    <tr>
                      <td>${role.ruleName}</td>
                      <td><c:if test="${role.timeClockRequired == 'Y'}"><span class="checkmark">&#10003;</span></c:if></td>
                      <td><c:if test="${role.passwordRequired == 'Y'}"><span class="checkmark">&#10003;</span></c:if></td>
                      <td><c:if test="${role.timeShiftsAllowed == 'Y'}"><span class="checkmark">&#10003;</span></c:if></td>
                      <td><c:if test="${role.bzcomposerAccess == 'Y'}"><span class="checkmark">&#10003;</span></c:if></td>
                      <td><c:if test="${role.idPasswordRequired == 'Y'}"><span class="checkmark">&#10003;</span></c:if></td>
                      <td>
                        <a href="/dashboard/role/edit/${role.id}" class="btn btn-sm btn-warning text-white no-underline">Edit</a>
                        <a href="/dashboard/role/delete/${role.id}" class="btn btn-sm btn-danger text-white no-underline">Delete</a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              </div>
            </div>
          </div>
      </body>


</html>