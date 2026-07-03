<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
    <%@include file="/WEB-INF/jsp/include/header1.jsp"%>
    <c:if test="${not empty AdminURL && AdminURL=='administer'}">
    <%@include file="/WEB-INF/jsp/include/menuAdmin.jsp"%>
    </c:if>
    <c:if test="${empty AdminURL}">
    <%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    </c:if>
    <title>
      Job Booking
    </title>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
  crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/includeAll/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/includeAll/jquery-ui.css" />

<!-- Bootstrap JS must come after jQuery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
  crossorigin="anonymous"></script>


    <style>

/* Container padding */
#pie {
  padding: 10px 0 20px 0;
}

  /* Table base */
  table.tabla-listados {
    width: 100%;
    border: 1px solid #cfcfcf;
    margin: 20px 0;
    border-collapse: collapse;
  }

  /* Table header */
  table.tabla-listados thead th {
    font-size: 0.85rem;
    text-align: left;
    padding: 6px 10px;
    border-bottom: 1px solid rgba(5, 169, 197, 0.2);
    text-shadow: 0 1px 1px #999;
    white-space: nowrap;
    background: #f9f9f9;
  }

  /* Table body cells */
  table.tabla-listados tbody td {
    font-size: 0.9rem;
    padding: 6px 12px;
    background: #fff;
    vertical-align: top;
  }

  /* Hover highlight */
  table.tabla-listados tbody tr:hover {
    background: rgba(50, 58, 60, 0.1);
    cursor: pointer;
  }

  /* Selected row */
  table.tabla-listados tbody tr.selected {
    background: #C3C5C7;
    color: #fff;
  }

  /* Optional striped rows */
  table.tabla-listados tbody tr:nth-child(even) {
    background: #f9f9f9;
  }

  /* Tabs container */
  .tabs {
    display: flex;
    border-bottom: 1px solid #ccc;
    background: #f5f5f5;
  }

  /* Tab buttons */
  .tab {
    padding: 10px 20px;
    cursor: pointer;
    border: none;
    background: none;
    font-size: 14px;
    transition: background 0.2s ease;
  }

  /* Tab hover */
  .tab:hover {
    background: #e9e9e9;
  }

  /* Active tab */
  .tab.active {
    background: #fff;
    font-weight: bold;
  }

  /* Tab focus (for accessibility) */
  .tab:focus {
    background: #e0e0e0;
    outline: 2px solid #5aa9e6;
  }


  .draft {
    background-color: rgba(50, 58, 60, 0.2); /* highlight color */
  }

  tr.selected {
    background-color: #C3C5C7;
}
    </style>

 
<script>
var customerTable; // global

$(document).ready(function () {
  // Initialize DataTable once
  customerTable = $('#custTable').DataTable({
    paging: true,
    searching: false,
    info: true,
    columns: [
      { data: "clientVendorID", title: "ID" },
      { data: "cname", title: "Company Name" }
    ]
  });
$('#custTable tbody').on('click', 'tr', function () {
    $('#custTable tbody tr').removeClass('selected');
    $(this).addClass('selected');
});

  $('#custTable tbody').on('click', 'tr', function () {
    var customer = customerTable.row(this).data();
    var rowId = this.id; // optional, if you have row ids
    fillCustomerDetails(customer, rowId);
});

$('#custTable tbody').on('click', 'tr', function () {
    var customer = customerTable.row(this).data();
    fillCustomerDetails(customer); // <-- call the function here
});

  // Load active customers on page load
  fetchCustomers("/CustomerAjax?tabid=getActiveCustomers");

  // Tab click event
  $('#nav-tab a').on('click', function (e) {
    e.preventDefault();
    $(this).tab('show');

    let tabId = $(this).attr("id");

    if (tabId === "nav-home-tab") {
      fetchCustomers("/CustomerAjax?tabid=getActiveCustomers");
    } else if (tabId === "nav-profile-tab") {
      fetchCustomers("/CustomerAjax?tabid=getInActiveCustomers");
    }
  });

  // Sort dropdown event
  $('#sortBy').change(function () {
    const sortBy = $(this).val();
    console.log("[DEBUG] sortBy changed:", sortBy);

    fetchCustomers("CustomerAjax?tabid=sortInvoice&SortBy=" + encodeURIComponent(sortBy), { sortBy });
  });
});

// Function to fetch and populate table
function fetchCustomers(url, data = {}) {
  console.log("[DEBUG] fetchCustomers called. URL:", url);
  if (!customerTable) return;

  // Show loading row
  customerTable.clear().row.add({ clientVendorID: "", cname: "Loading..." }).draw(false);

  $.ajax({
    type: "POST",
    url: url,
    dataType: "json",
    data: data,
    success: function(responseData) {
      console.log("[DEBUG] Data received:", responseData);

      showPhoneCalls(responseData);
      customerTable.clear(); // remove loading

      if (Array.isArray(responseData) && responseData.length > 0) {
        customerTable.rows.add(responseData).draw(false);
      } else {
        customerTable.row.add({ clientVendorID: "", cname: "No records found" }).draw(false);
      }
    },
    error: function(xhr, status, error) {
      console.error("[ERROR] AJAX failed:", error);
      customerTable.clear().row.add({ clientVendorID: "", cname: "Error fetching data" }).draw(false);
    }
  });
}



function fillCustomerDetails(data, rowId) {
    if (!data) return;

    console.log("[DEBUG] Filling details for customer:", data);

    // Basic info
    $('#customerID').html(data.clientVendorID || '');
    $('#customerName').html([data.firstName, data.middleName, data.lastName].filter(Boolean).join(' '));
    $('#cname').html(data.cname || '');
    $('#customerCompanyName').html(data.cname || '');
    $('#dbaName').html(data.dbaName || '');
    $('#customerType').val(data.cvCategoryTypeID || '');
    $('#billingAddress').html(data.billTo|| '');
    $('#shippingAddress').html(data.shipTo || '');
    $('#country').val(data.countryID || 0);
    $('#activeCustomer').html(data.active ? 'Yes' : 'No');

    // Contact info
    $('#phone').html(data.phone || '');
    $('#cellPhone').html(data.cellPhone || '');
    $('#fax').html(data.fax || '');
    $('#email').html(data.email || '');
    $('#dateAdded').html(data.dateAdded || '');
    $('#lastOrderDate').html(data.lastOrderDate || '');

    // Financial info
    $('#last3MonthAmt').html(data.last3MonthAmt || 0);
    $('#last1YearAmt').html(data.last1YearAmt || 0);
    $('#totalOverdueAmt').html(data.totalOverdueAmt || 0);
    $('#openingUB').html(data.openingUB || 0);
    $('#extCredit').html(data.extCredit || 0);

    // Highlight selected row if rowId is provided
    if (rowId !== undefined) {
        let size = document.getElementById("lSize")?.value || 0;
        for (let i = 0; i < size; i++) {
            let el = document.getElementById(i + "$$");
            if (el) el.classList.remove('draft');
        }
        let selectedRow = document.getElementById(rowId + "$$");
        if (selectedRow) selectedRow.classList.add('draft');
    }

    // Call additional fetch functions
    if (data.clientVendorID) {
        lookUpHistory();
        getContactData(data.clientVendorID);
        getOpportunityData(data.clientVendorID);
        getOpportunityEventData(data.clientVendorID);
        getCaseData(data.clientVendorID);
        getJobData(data.clientVendorID);
    }
}


  function setCutomerDataById(vendorID, rowId) {
    $.ajax({
        type: "POST",
        url: "CustomerAjax?tabid=getCustomerDetails&cvId=" + vendorID,
        data: { clientVendorID: vendorID },
        success: function(data) {
            fillCustomerDetails(data, rowId); // <-- just call our new function
        },
        error: function(error) {
            alert("<bean:message key='BzComposer.common.erroroccurred'/>");
        }
    });
}

</script>

<script>

//showing phone cals list
let phoneCallData = [];
let currentPage = 1;
let pageSize = 5;

// Render phone calls from the given list of customers
function showPhoneCalls(customers) {
    console.log("[DEBUG] showPhoneCalls called. Records:", customers);

    phoneCallData = customers.map(c => ({
        phone: c.phone && c.phone.trim() !== "" ? c.phone : "N/A",
        name: c.fullName && c.fullName.trim() !== "" ? c.fullName : (c.cname || "Unknown"),
        address: c.address1 && c.address1.trim() !== "" ? c.address1 : (c.billTo || "")
    }));

    console.log("[DEBUG] Transformed phoneCallData:", phoneCallData);

    currentPage = 1;
    renderPhoneCalls();
}


function renderPhoneCalls() {
    const container = $('#phoneCallList');
    container.empty();

    if (phoneCallData.length === 0) {
        container.html(`<div style="text-align:center;">No phone calls found</div>`);
        return;
    }

    let start = (currentPage - 1) * pageSize;
    let end = start + pageSize;
    let pageRecords = phoneCallData.slice(start, end);

    let html = pageRecords.map(call => `
        <div class="customer-card">
          <div class="customer-number-container">
            <div class="customer-number">\${call.phone}</div>
            <a href="tel:\${call.phone}" class="formbutton">Call</a>
          </div>
          <div class="customer-name">\${call.name}</div>
          <div class="customer-address">\${call.address}</div>
        </div>
    `).join("");

    container.html(html);
}


function renderPagination() {
    const totalPages = Math.ceil(phoneCallData.length / pageSize);
    if (totalPages <= 1) return;

    let paginationHtml = `<div class="pagination">`;

    if (currentPage > 1) {
        paginationHtml += `<button class="formbutton" onclick="changePage(${currentPage - 1})">Prev</button>`;
    }

    paginationHtml += ` Page ${currentPage} of ${totalPages} `;

    if (currentPage < totalPages) {
        paginationHtml += `<button class="frombutton" onclick="changePage(${currentPage + 1})">Next</button>`;
    }

    paginationHtml += `</div>`;

    $('#phoneCallList').append(paginationHtml);
}

function changePage(page) {
    currentPage = page;
    renderPhoneCalls();
}

// Allow user to change page size
function changePageSize(newSize) {
    pageSize = parseInt(newSize, 10);
    currentPage = 1;
    renderPhoneCalls();
}


</script>

  </head>

  <body >
    <!-- begin shared/header -->
    <div id="ddcolortabsline">&nbsp;</div>
    <form:form name="CustomerForm" method="post" modelAttribute="customerDto">



      <div class="dashboard-wrapper" style = "background-color:#ffffff">

        <div class="sidebar"style = "background-color:#ffffff">
          <h3>Customer</h3>

          <div class="sidebar-tabs" >
            <nav>
              <div class=" nav nav-tabs nav-fill" id="nav-tab" role="tablist" style="background-color:rgb(195, 197, 199)">
                <a class=" nav-item nav-link active" id="phoneTab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Phone Calls</a>
                <a class=" nav-item nav-link" id="searchTab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">List</a>


              </div>
            </nav>

          </div>

          <div class="customer-list" id="phoneCallList">
          </div>

          <div class="customer-list" id="searchList" style="display:none;">
                       <section id="tabs" class=" sidebar-tab project-tab">
              <div class="">
                <div class="row">
                  <div class="col-md-12">
                    <nav>
                      <div class=" nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                        <a class=" nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Active</a>
                        <a class=" nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Inactive</a>


                      </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent" style="background-color: white">
                   

<!-- Sort dropdown -->
<div class="mt-3 mb-3">
  <label for="sortBy">Sort By:</label>
  <select id="sortBy" class="form-control" style="width: 200px; display:inline-block;">
    <option value="1">First Name</option>
    <option value="2">Last Name</option>
    <option value="3">Company Name</option>
  </select>
</div>

<!-- Table -->
 <table id="custTable" class="display" style="width:100%;background-color:white;">
    <thead  style="width:100%;background-color:#C3C5C7;">
      <tr>
        <th>ID</th>
        <th>Company Name</th>
      </tr>
    </thead>
    <tbody style="width:100%;background-color:white;">
      <!-- Data will be filled by DataTables -->
    </tbody>
  </table>





                    </div>
                  </div>
                </div>
              </div>
            </section>

          </div>
        </div>

        </td>
        <div class="main-panel">
          <div class="top-search">
            <input type="button" class="formbutton"
                                 onclick="" style="padding: 7 15px;"
                                            value="Search" />

            <input type="text" class="search-input" placeholder="Company">
            <input type="text" class="search-input" placeholder="Address">
            <input type="text" class="search-input" placeholder="City">
            <input type="text" class="search-input" placeholder="State">
            <input type="text" class="search-input" placeholder="Zip">
            <input type="text" class="search-input" placeholder="Phone/Mobile">
            <input type="button" class="formbutton"
                                 style="padding: 7 15px;"
                                 value="Go" />

          </div>

          <div class="customer-info">
            <h2>John Doe</h2>
            <div>(213) 987-6543</div>
            <div>789 Pine St, Hometman, CA 12345</div>

          </div>

          <td colspan="10" style="vertical-align: 0;">

            <div id="table-negotiations" style="height:auto;">
              <!-- ================== Customer Information =============== -->
              <table cellspacing="0" class="tabla-listados" style="margin-top: 0; margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <td align="left">
                      <img src="/ConfigurationImages/customerCompany.png" height="30" width="60">
                      <label id="customerCompanyName" align="left" style="font-size:15px; font-weight:bold;  color:#05A9C5 ">
                    </td>



                  </tr>
                  <tr>
                    <th colspan="3" style="font-size:12px;">
                      <spring:message code="BzComposer.customerinfo.customerinformation" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style="width: 40%;">
                      <table cellspacing="0" class="tabla-listados">
                        <tr>
                          <td style="width: 50%;"><strong>
                              <spring:message code="BzComposer.global.customerid" />:
                            </strong></td>
                            <td style="width: 50%;" id="customerID"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.Employee.Name" />:
                            </strong></td>
                            <td id="customerName"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.Customer.CompanyName" />:
                            </strong></td>
                            <td id="cname"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.register.dbaName" />:
                            </strong></td>
                            <td id="dbaName"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.Customer.Type" />:
                            </strong></td>
                            <td>
                              <select id="customerType" disabled="true">
                                <option value="0">
                                <spring:message code="BzComposer.ComboBox.Select" />
                                </option>
                                <c:forEach items="${VendorCategoryList}" var="item">
                                <option value="${item.value}">${item.label}</option>
                                </c:forEach>
                              </select>
                            </td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.updatevendor.billingAddress" />:
                            </strong></td>
                            <td id="billingAddress"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.updatevendor.shippingAddress" />:
                            </strong></td>
                            <td id="shippingAddress"></td>
                        </tr>
                      </table>
                    </td>
                    <td style="width: 30%;">
                      <table cellspacing="0" class="tabla-listados">
                        <tr>
                          <td style="width: 50%;"><strong>
                              <spring:message code="BzComposer.global.phone" />:
                            </strong></td>
                            <td style="width: 50%;" id="phone"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.mobile" />:
                            </strong></td>
                            <td id="cellPhone"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.fax" />:
                            </strong></td>
                            <td id="fax"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.email" />:
                            </strong></td>
                            <td id="email"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.dateadded" />:
                            </strong></td>
                            <td id="dateAdded"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.orderimport.lastorderdate" />:
                            </strong></td>
                            <td id="lastOrderDate"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.country" />:
                            </strong></td>
                            <td>
                              <select id="country" disabled="true" style="width:170px;">
                                <option value="0">
                                <spring:message code="BzComposer.ComboBox.Select" />
                                </option>
                                <c:forEach items="${countryList}" var="item">
                                <option value="${item.countryId}">${item.countryName}</option>
                                </c:forEach>
                              </select>
                            </td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="Bizcomposer.active" />:
                            </strong></td>
                            <td id="activeCustomer"></td>
                        </tr>
                      </table>
                    </td>
                    <td style="width: 30%;">
                      <table cellspacing="0" class="tabla-listados">
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.common.totalOverdueAmount" />:
                            </strong></td>
                            <td id="totalOverdueAmt"></td>
                        </tr>
                        <tr>
                          <td style="width: 60%;"><strong>
                              <spring:message code="BzComposer.sales.SalesAmount" />
                            </strong></td>
                            <td style="width: 40%;"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.common.last3MonthsAmount" />:
                            </strong></td>
                            <td id="last3MonthAmt"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.common.last1YearAmount" />:
                            </strong></td>
                            <td id="last1YearAmt"></td>
                        </tr>

                        <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.oppeningunpaidbalance" />:
                            </strong></td>
                            <td id="openingUB"></td>
                        </tr>
                        <tr>
                          <td><strong>
                              <spring:message code="BzComposer.global.existingcredits" />:
                            </strong></td>
                            <td id="extCredit"></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>

              <!-- =============== Contact Details ================ -->
              <input type="hidden" name="clistSize" id="cSize" value='${customerContactList.size()}' />
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20;margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.customer.opportunity.contactDetails" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr align="right">
                    <td style="padding-right: 12px ! important;">
                      <table>
                        <tr align="left">
                          <td colspan="6">
                            <div>
                              <input type="button" class="formbutton" onclick="addNewContact();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                              <input type="button" class="formbutton" onclick="editContact();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                              <input type="button" class="formbutton" onclick="deleteContact();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr>
                    <td>

                      <table id="contactTable" class="tabla-listados sortable" cellspacing="0" style="margin-top: 10px; border: 0; padding: 0; height: auto;">
                        <thead>
                          <tr valign="center">
                            <th style="padding-right: 30px !important;">
                              <spring:message code="BzComposer.global.contactid" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.contactName" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.global.titlename" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.global.email" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.global.phone" />
                            </th>

                          </tr>
                        </thead>
                        <tbody id="contactTableBody">
                          <c:if test="${not empty customerContactList}">
                          <c:forEach items="${customerContactList}" var="objList" varStatus="loop">
                          <tr id='${loop.index}c$$' onclick="setRowId(${objList.contactID}, ${loop.index}, true);">
                            <td><input type="checkbox" id="custID${loop.index}" value="${objList.contactID}" onchange="addRowIndex(${loop.index}, ${objList.contactID})" />

                              ${objList.contactID}</td>
                            <td>${objList.firstName}${objList.middleName}
                              ${objList.lastName}</td>
                          </tr>
                          </c:forEach>
                          </c:if>
                        </tbody>
                      </table>

                    </td>
                  </tr>

                </tbody>

                <tr>
              </table>

              <!-- =============== Opportunity Details ================ -->
              <input type="hidden" name="plistSize" id="pSize" value='${opportunityList.size()}' />
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20;margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.customer.opportunity.opportunityDetails" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr align="right">
                    <td style="padding-right: 12px ! important;">
                      <table>
                        <tr align="left">
                          <td colspan="6">
                            <div>
                              <input type="button" class="formbutton" onclick="addOpportunity();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                              <input type="button" class="formbutton" onclick="updateOpportunity();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                              <input type="button" class="formbutton" onclick="deleteOpportunity();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr>
                    <td>

                      <table id="opportunityTable" class="tabla-listados sortable" cellspacing="0" style="margin-top: 10px; border: 0; padding: 0; height: auto;">
                        <thead>
                          <tr valign="center">
                            <th style="padding-right: 30px !important;">
                              <spring:message code="BzComposer.Customer.opportunities.id" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.Customer.opportunities.name" />
                            </th>

                            <th>
                              <spring:message code="BzComposer.Customer.opportunities.stage" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.Customer.opportunities.amount" />
                            </th>

                            <th>
                              <spring:message code="BzComposer.Customer.opportunities.opportunityOwner" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.opportunity.sourceID" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.Customer.opportunities.startdate" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.Customer.opportunities.closedate" />
                            </th>
                          </tr>
                        </thead>
                        <tbody id="opportunityTableBody">
                          <c:if test="${not empty opportunityList}">
                          <c:forEach items="${opportunityList}" var="objList" varStatus="loop">
                          <tr id='${loop.index}p$$' onclick="setRowIdOpportunity(${objList.opportunityID}, ${loop.index}, true);" ondblclick="goToManageOpportunity(${objList.opportunityID});">

                            <td><input type="checkbox" id="opportunityId${loop.index}" value="${objList.opportunityID}" onchange="addRowIndex(${loop.index}, ${objList.opportunityID})" />
                              ${objList.opportunityID}</td>
                            <td>${objList.opportunityName}</td>
                            <td>${objList.stage}</td>
                            <td>${objList.amount}</td>
                            <td>${objList.opportunityOwner}</td>
                            <td>${objList.sourceID}</td>
                            <td>${objList.startDate}</td>
                            <td>${objList.closedDate}</td>
                            <td>Yes</td>
                          </tr>
                          </c:forEach>
                          </c:if>
                        </tbody>
                      </table>

                    </td>
                  </tr>

                </tbody>

                <tr>
              </table>

              <!-- =============== Case Details ================ -->
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20; margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.customer.case.caseDetails" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr align="right">
                    <td style="padding-right: 12px ! important;">
                      <table>
                        <tr align="left">
                          <td colspan="6">
                            <div>
                              <input type="button" class="formbutton" onclick="addNewCase();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                              <input type="button" class="formbutton" onclick="editCase()" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                              <input type="button" class="formbutton" onclick="deleteCase();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr>
                    <td>

                      <table id="caseTable" class="tabla-listados sortable" cellspacing="0" style="margin-top: 10px; border: 0; padding: 0; height: auto;">
                        <thead>
                          <tr valign="center">
                            <th style="padding-right: 30px !important;">
                              <spring:message code="BzComposer.customer.case.caseID" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.case.contactName" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.case.subject" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.case.product" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.case.caseType" />
                            </th>

                            <th>
                              <spring:message code="BzComposer.customer.case.priority" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.case.dateOpened" />
                            </th>

                            <th>
                              <spring:message code="BzComposer.customer.case.status" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.case.owner" />
                            </th>

                          </tr>
                        </thead>
                        <tbody id="caseTableBody">
                          <c:if test="${not empty caseList}">
                          <c:forEach items="${caseList}" var="objList" varStatus="loop">
                          <tr id='${loop.index}case$$' onclick="setRowIdCase(${objList.caseID}, ${loop.index}, true);">

                            <td><input type="hidden" id="caseId${loop.index}" value="${objList.caseID}" onchange="addRowIndex(${loop.index}, ${objList.caseID})" />
                              ${objList.caseId}</td>
                            <!-- 	<td>${objList.opportunity.opportunityId}</td> -->
                            <td>${objList.contactName}</td>
                            <td>${objList.subject}</td>
                            <td>${objList.product}</td>
                            <td>${objList.caseType}</td>
                            <td>${objList.priority}</td>


                            <td>${objList.status}</td>
                            <td>${objList.dateOpened}</td>
                            <td>${objList.owner}</td>
                          </tr>
                          </c:forEach>
                          </c:if>
                        </tbody>
                      </table>

                    </td>
                  </tr>

                </tbody>

                <tr>
              </table>

              <!-- =============== Technician Details ================ -->
              <input type="hidden" name="tlistSize" id="tSize" value='${bcaTechnicianList.size()}' />
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20; margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.technicianinfo.techniciandetails" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr align="right">
                    <td style="padding-right: 12px! important;">
                      <table>
                        <tr align="left">
                          <td colspan="6">
                            <div>
                              <input type="button" class="formbutton" onclick="addNewTechnician();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                              <input type="button" class="formbutton" onclick="editTechnician()" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                              <input type="button" class="formbutton" onclick="deleteTechnician();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table id="technicianTable" class="tabla-listados sortable" cellspacing="0" style=" margin-top: 10px; border: 0; padding: 0; height: auto;">
                        <thead>
                          <tr valign="center">
                            <th style="padding-right: 30px !important;">
                              <spring:message code="BzComposer.technicianinfo.technicianid" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.technicianinfo.name" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.technicianinfo.phone" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.technicianinfo.email" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.technicianinfo.specialization" />
                            </th>
                          </tr>
                        </thead>
                        <tbody id="technicianTableBody">
                          <c:if test="${not empty bcaTechnicianList}">
                          <c:forEach items="${bcaTechnicianList}" var="objList" varStatus="loop">
                          <tr id='${loop.index}technician$$' onclick="setRowIdCase(${objList.technicianID}, ${loop.index}, true);">
                            <td>
                              <input type="checkbox" id="technicianID${loop.index}" value="${objList.technicianID}" onchange="addRowTechnicianIndex(${loop.index}, ${objList.technicianID})" />
                              ${objList.technicianID}
                            </td>
                            <td>${objList.name}</td>
                            <td>${objList.phone}</td>
                            <td>${objList.email}</td>
                            <td>${objList.specialization}</td>
                          </tr>
                          </c:forEach>
                          </c:if>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
                <tr>
              </table>
              <!-- =============== Dispatch Board Information  ================ -->
              <input type="hidden" name="dblistSize" id="dbSize" value='${customerDispatchBoardDtoList.size()}' />
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20; margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.DispatchBoard.DispatchBoardInfo" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr align="right">
                    <td style="padding-right: 12px! important;">
                      <table>
                        <tr align="left">
                          <td colspan="6">
                            <div>
                              <input type="button" class="formbutton" onclick="addNewDispatchBoard();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                              <input type="button" class="formbutton" onclick="editDispatchBoard()" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                              <input type="button" class="formbutton" onclick="deleteDispatch();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table id="dispatchTable" class="tabla-listados sortable" cellspacing="0" style=" margin-top: 10px; border: 0; padding: 0; height: auto;">
                        <thead>
                          <tr valign="center">
                            <th style="padding-right: 30px !important;">
                              <spring:message code="BzComposer.jobinfo.jobid" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.Report.VendorContactList.Contact" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.DispatchBoard.BusinessDivision" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.DispatchBoard.Technician" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.DispatchBoard.Status" />
                            </th>
                          </tr>
                        </thead>
                        <tbody id="dispatchTableBody">
                          <c:if test="${not empty customerDispatchBoardDtoList}">
                          <c:forEach items="${customerDispatchBoardDtoList}" var="objList" varStatus="loop">
                          <tr id='${loop.index}DispatchBoard$$' onclick="setRowIdCase(${objList.dispatchBoardID}, ${loop.index}, true);">
                            <td>
                              <input type="checkbox" id="dispatchBoardID${loop.index}" value="${objList.dispatchBoardID}" onchange="addRowDispatchBoardIndex(${loop.index}, ${objList.dispatchBoardID})" />
                              ${objList.jobID}
                            </td>
                            <td>${objList.clientVendorName}</td>
                            <td>${objList.businessDivision}</td>
                            <td>${objList.technicianName}</td>
                            <td>${objList.status}</td>
                          </tr>
                          </c:forEach>
                          </c:if>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
                <tr>
              </table>

              <!-- =============== Event Details ================ -->
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20; margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.customer.opportunity.EventDetails" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr align="right">
                    <td style="padding-right: 12px ! important;">
                      <table>
                        <tr align="left">

                          <td>
                            <spring:message code="BzComposer.customer.eventType" />
                          </td>
                          <td>
                            <form:select path="eventType" id="eventTypeID" style="width:200px;" onchange="loadEventList()">
                              <form:option value="0">
                                <spring:message code="BzComposer.customer.opportunity" />
                              </form:option>
                              <form:option value="1">
                                <spring:message code="BzComposer.customer.case" />
                              </form:option>

                            </form:select>
                          </td>

                          <td colspan="6">
                            <div>
                              <input type="button" class="formbutton" onclick="addEvent();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                              <input type="button" class="formbutton" onclick="editEvent()" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                              <input type="button" class="formbutton" onclick="deleteEvent();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>

                  <tr>
                    <td>

                      <table id="eventTable" class="tabla-listados sortable" cellspacing="0" style="margin-top: 10px; border: 0; padding: 0; height: auto;">

                        <colgroup>
                          <col span="1" style="width: 10%;">
                          <col span="1" style="width: 15%;">
                          <col span="1" style="width: 20%;">
                          <col span="1" style="width: 25%;">
                          <col span="1" style="width: 15%;">
                          <col span="1" style="width: 15%;">

                        </colgroup>
                        <thead id="eventthead">
                          <tr valign="center">
                            <th style="padding-right: 30px !important;">
                              <spring:message code="BzComposer.customer.opportunity.eventId" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.event.opportunity" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.opportunity.eventName" />
                            </th>

                            <th>
                              <spring:message code="BzComposer.customer.opportunity.eventMemo" />
                            </th>
                            <th>
                              <spring:message code="BzComposer.customer.opportunity.eventStartDate" />
                            </th>

                            <th>
                              <spring:message code="BzComposer.customer.opportunity.eventEndDate" />
                            </th>

                          </tr>
                        </thead>
                        <tbody id="eventTableBody">
                          <c:if test="${not empty eventList}">
                          <c:forEach items="${eventList}" var="objList" varStatus="loop">
                          <tr id='${loop.index}e$$' onclick="setRowIdEvent(${objList.eventId}, ${loop.index}, true);">

                            <td><input type="hidden" id="eventId${loop.index}" value="${objList.eventId}" onchange="addRowIndex(${loop.index}, ${objList.eventId})" />
                              ${objList.eventId}</td>
                            <!-- 	<td>${objList.opportunity.opportunityId}</td> -->
                            <td>${objList.opportunityID}</td>
                            <td>${objList.eventName}</td>
                            <td>${objList.eventMemo}</td>
                            <td>${objList.eventStartDate}</td>
                            <td>${objList.eventEndDate}</td>
                          </tr>
                          </c:forEach>
                          </c:if>
                        </tbody>
                      </table>

                    </td>
                  </tr>

                </tbody>

                <tr>
              </table>
              <!-- =============== Transaction History ================ -->
              <table class="tabla-listados" cellspacing="0" style="margin-top: 20;margin-left: 10px;margin-right: 10px;">
                <thead>
                  <tr>
                    <th style="font-size: 14px;">
                      <spring:message code="BzComposer.updatecustomer.tabs.transactionhistory" />
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style="padding-right: 12px ! important;">
                      <table class="tabla-listados" cellspacing="0">
                        <thead>
                          <tr>
                            <th colspan="4">
                              <spring:message code="BzComposer.updatecustomer.displayoption" />
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td colspan="4">
                              <form:radiobutton path="dispay_info" value="ShowAll" onclick="hide_details(this.value);" />
                                <spring:message code="BzComposer.updatecustomer.showall" />
                                <script type="text/javascript">
                                        radio_val = document.CustomerForm.dispay_info.value;
                                </script>
                            </td>
                          </tr>
                          <tr>
                            <td>
                              <form:radiobutton path="dispay_info" value="ByVal" onclick="hide_details(this.value);" />
                                <spring:message code="BzComposer.updatecustomer.byval" />
                            </td>
                            <td>
                              <spring:message code="BzComposer.updatecustomer.from" />
                              <form:input path="periodFrom" readonly="true" size="15" disabled="true" />
                                <img src="${pageContext.request.contextPath}/images/cal.gif" id="imgfrm" onclick="displayCalendar(document.CustomerForm.periodFrom,'mm-dd-yyyy',this);" />
                            </td>
                            <td>
                              <spring:message code="BzComposer.updatecustomer.to" />
                              <form:input path="periodTo" readonly="true" size="15" disabled="true" /> <img src="${pageContext.request.contextPath}/images/cal.gif" id="imgto" onclick="displayCalendar(document.CustomerForm.periodTo,'mm-dd-yyyy',this);" />
                            </td>
                            <td><input type="button" class="formbutton" value="<spring:message code='BzComposer.updatecustomer.lookhistory'/>" id="lookBtn" onclick="lookUpHistory();" /></td>
                          </tr>
                        </tbody>
                      </table>
                      <div id="t_history"></div>
                    </td>
                  </tr>
                </tbody>
              </table>

            </div>
          </td>


          <!-- Added on 26-04-2019 -->
          <td colspan="10" style="vertical-align: 0; display: none;">



            <!-- =============== opportunity  Details ================ -->

            <!-- =============== Event  Details  ================ -->
            <!--              -->
            <!--                              Case Details ...........            -->


            <!-- =============== Technician Details  ================ -->
            <input type="hidden" name="tlistSize" id="tSize" value='${bcaTechnicianList.size()}' />
            <table class="tabla-listados" cellspacing="0" style="margin-top: 0; margin-left: 10px;margin-right: 10px;">
              <thead>
                <tr>
                  <th style="font-size: 14px;">
                    <spring:message code="BzComposer.technicianinfo.techniciandetails" />
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr align="right">
                  <td style="padding-right: 12px ! important;">
                    <table>
                      <tr align="left">
                        <td colspan="6">
                          <div>
                            <input type="button" class="formbutton" onclick="addNewTechnician();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.new'/>" />
                            <input type="button" class="formbutton" onclick="editTechnician()" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.edit'/>" />
                            <input type="button" class="formbutton" onclick="deleteTechnician();" style="padding: 7 15px;" value="<spring:message code='BzComposer.global.delete'/>" />
                          </div>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                          </td>
              </tr>
              </table>
              </td>
                </tr>
                </table>
      </div>
      <div>
        <input type="hidden" name="tabid" id="tabid" value="" /> <input type="hidden" id="selectedCvID" value="${selectedCvID}" />

        <c:forEach items="${CustomerDetails}" var="objList" varStatus="loop">
        <input type="hidden" id="selectedCvIndex${objList.clientVendorID}" value="${loop.index}" />
        </c:forEach>

      </div>
      </div>
      </div>
      </div>
      </div>

      <style>
.dashboard-wrapper {
  display: flex;
  height: 100vh;
  font-family: Arial, sans-serif;
  background: #f2f2f2;
}

            .sidebar {
              width: 350px;
              background: #e0e0e0;
              padding: 20px;
              box-sizing: border-box;
              display: flex;
              flex-direction: column;
              gap: 20px;
            }

            .main-panel {
              flex: 1;
              padding: 20px;
              display: flex;
              flex-direction: column;
              gap: 20px;
              overflow-y: hidden;
              width: 100%;
              box-sizing: border-box;
            }

            .top-search {
              display: flex;
              gap: 10px;
              align-items: center;
              width: 100%;
            }

            .search-input,
            .search-btn,
            .go-btn {
              height: 40px;
              padding: 0 12px;
              border: 1px solid #ccc;
              border-radius: 5px;
              font-size: 14px;
              flex: 1;
              min-width: 120px;
              box-sizing: border-box;
            }

            /* Make State & Zip smaller */
            .search-input[placeholder="State"],
            .search-input[placeholder="Zip"] {
              flex: 0 0 80px;
            }

            /* Make Go button bigger */
            .go-btn,
            .search-btn {
              flex: 0 0 120px;
              /* same size for both */
              background-color: #007bff;
              color: white;
              cursor: pointer;
            }


            .sidebar-tabs {
              display: flex;
              gap: 8px;
              flex-flow:column;
            }

            .sidebar-tab {
              padding: 10px;
              border: none;
              border-radius: 6px;
              background: #f5f5f5;
              cursor: pointer;
              font-weight: 500;
            }

            .sidebar-tab.active {
              background: #1976d2;
              color: #fff;
            }

            .status-btn-wrapper {
              display: flex;
              justify-content: center;
              align-items: center;
              width: 100%;
              margin-top: 5px;
              background: #f9f9f9;
              border-bottom: 2px solid #ddd;
              padding: 5px;
              gap: 0;
              /* no space, tabs sit next to each other */
            }

            .status-btn-wrapper button {
              flex: 1;
              background: #f1f1f1;
              border: none;
              outline: none;
              padding: 10px 15px;
              cursor: pointer;
              font-size: 14px;
              font-weight: 500;
              color: #555;
              border-top-left-radius: 8px;
              border-top-right-radius: 8px;
              transition: all 0.3s ease;
            }

            .status-btn-wrapper button:hover {
              background: #e6e6e6;
              color: #000;
            }

            .status-btn-wrapper button.active {
              background: #fff;
              /* active tab looks raised */
              color: #000;
              border-bottom: 2px solid #fff;
              /* blend with wrapper bg */
              box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.1);
              /* subtle lift */
            }


            .customer-list {
              display: flex;
              flex-direction: column;
              gap: 10px;
            }

            .customer-card {
              padding: 10px;
              border-radius: 8px;
              background: #fff;
              box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
              cursor: pointer;
            }

            .customer-card:hover {
              background: #f0f0f0;
            }

            .customer-number-container {
              display: flex;
              justify-content: space-between;
              align-items: center;
            }

            .customer-number {
              font-weight: bold;
            }

            .customer-name {
              font-size: 14px;
              color: #555;
            }

            .customer-address {
              font-size: 13px;
              color: #777;
            }

            .customer-call-btn {
              background: #4CAF50;
              color: #fff;
              padding: 4px 8px;
              border-radius: 4px;
              text-decoration: none;
              font-size: 12px;
            }

            .top-search {
              display: flex;
              flex-wrap: wrap;
              gap: 12px;
            }

            .search-input {
              flex: 1;
              min-width: 120px;
              padding: 10px;
              border: 1px solid #ccc;
              border-radius: 8px;
            }


            td {
              border: none;
              /* removes the box borders */
              padding: 6px 12px;
              /* keeps spacing clean */
              vertical-align: top;
              /* aligns text at the top */
              background: transparent;
              /* no background color */
              font-size: 13px;
              /* adjust text size like screenshot */
            }

            /* Search button (blue style) */
            .search-btn {
              padding: 8px 16px;
              background: #007bff;
              /* Blue */
              color: #fff;
              border: none;
              border-radius: 4px;
              cursor: pointer;
              font-size: 14px;
            }

            .search-btn:hover {
              background: #0056b3;
            }

            /* Go button (green style) */
            .go-btn {
              padding: 8px 16px;
              background: #28a745;
              /* Green */
              color: #fff;
              border: none;
              border-radius: 4px;
              cursor: pointer;
              font-size: 14px;
            }

            .go-btn:hover {
              background: #1e7e34;
            }


            .action-btn {
              padding: 7px 12px;
              border: none;
              border-radius: 4px;
              margin: 0 4px;
              cursor: pointer;
            }

            .action-btn.primary {
              background: #1976d2;
              color: #fff;
            }

            .action-btn.danger {
              background: #d32f2f;
              color: #fff;
            }


      </style>

      <script>
                                                                           // ---------- Tab switching ----------
                                                                           function switchTab(showId, hideId, activeBtnId, inactiveBtnId) {
                                                                           console.log("[DEBUG] Switching tab - showing:", showId, "hiding:", hideId);

                                                                           document.getElementById(showId).style.display = 'flex';
                                                                           document.getElementById(hideId).style.display = 'none';

                                                                           document.getElementById(activeBtnId).classList.add('active');
                                                                           document.getElementById(inactiveBtnId).classList.remove('active');
                                                                           }

                                                                           document.getElementById('phoneTab').onclick = () => switchTab('phoneCallList', 'searchList', 'phoneTab', 'searchTab');
                                                                           document.getElementById('searchTab').onclick = () => switchTab('searchList', 'phoneCallList', 'searchTab', 'phoneTab');

                                                                           // ---------- Customer data ----------
                                                                           const customers = {
                                                                           "(213) 987-6543": {
                                                                           name: "John Doe",
                                                                           phone: "(213) 987-6543",
                                                                           address: "123 Main St, Hometown, CA 12345",
                                                                           company: "ABC Service",
                                                                           email: "john.doe@example.com",
                                                                           billing: "789 Pine St, Hometman, CA 12345",
                                                                           shipping: "789 Pine St, Hometman, CA 12345"
                                                                           },
                                                                           "(213) 555-7890": {
                                                                           name: "Bob Smith",
                                                                           phone: "(213) 555-7890",
                                                                           address: "456 Oak St, Hometown, CA 12345",
                                                                           company: "XYZ Corp",
                                                                           email: "bob.smith@example.com",
                                                                           billing: "456 Oak St, Hometman, CA 12345",
                                                                           shipping: "456 Oak St, Hometman, CA 12345"
                                                                           },
                                                                           "(213) 222-3333": {
                                                                           name: "Alice Johnson",
                                                                           phone: "(213) 222-3333",
                                                                           address: "789 Pine St, Hometown, CA 12345",
                                                                           company: "LMN Inc",
                                                                           email: "alice.johnson@example.com",
                                                                           billing: "789 Pine St, Hometman, CA 12345",
                                                                           shipping: "789 Pine St, Hometman, CA 12345"
                                                                           }
                                                                           };

                                                                           // ---------- Load customer info ----------
                                                                           function loadCustomerInfo(phone) {
                                                                           console.log("[DEBUG] loadCustomerInfo() called with phone:", phone);

                                                                           const c = customers[phone];
                                                                           if (!c) {
                                                                           console.warn("[WARN] No customer found for phone:", phone);
                                                                           return;
                                                                           }

                                                                           // Update customer-info section
                                                                           const infoBox = document.querySelector('.customer-info');
                                                                           if (infoBox) {
                                                                           infoBox.querySelector('h2').textContent = c.name;
                                                                           infoBox.querySelector('.customer-phone').textContent = c.phone;
                                                                           infoBox.querySelector('.customer-address').textContent = c.address;
                                                                           console.log("[DEBUG] Updated .customer-info for", c.name);
                                                                           }

                                                                           // Update first info-box-section
                                                                           const firstBox = document.querySelector('.info-box-section .box:nth-child(1)');
                                                                           if (firstBox) {
                                                                           firstBox.querySelector('table tr:nth-child(1) td:nth-child(2)').textContent = '101'; // static ID
                                                                           firstBox.querySelector('table tr:nth-child(2) td:nth-child(2)').textContent = c.name;
                                                                           firstBox.querySelector('table tr:nth-child(3) td:nth-child(2)').textContent = c.company;
                                                                           firstBox.querySelector('table tr:nth-child(6) td:nth-child(2)').textContent = c.billing;
                                                                           firstBox.querySelector('table tr:nth-child(7) td:nth-child(2)').textContent = c.shipping;
                                                                           console.log("[DEBUG] Updated first info-box for", c.name);
                                                                           }

                                                                           // Update second info-box-section
                                                                           const secondBox = document.querySelector('.info-box-section .container .box:nth-child(2)');
                                                                           if (secondBox) {
                                                                           secondBox.querySelector('table tr:nth-child(1) td:nth-child(2)').textContent = c.phone;
                                                                           secondBox.querySelector('table tr:nth-child(4) td:nth-child(2)').textContent = c.email;
                                                                           console.log("[DEBUG] Updated second info-box for", c.name);
                                                                           }
                                                                           }

                                                                               </script>


      <script>
                                                                           let clientVendorID = 0; // Global state

                                                                           // -------------------- Load Customer Data --------------------
                                                                           function setCutomerDataById(vendorID, rowId) {
                                                                           console.log(`[CUSTOMER] Fetching details for vendorID=${vendorID}, rowId=${rowId}`);
                                                                           clientVendorID = vendorID;
                                                                           // remove highlight from all rows
                                                                           document.querySelectorAll("#custTableBody tr").forEach(row => {
                                                                           row.classList.remove("draft");
                                                                           });

                                                                           // add highlight to selected row
                                                                           document.getElementById(rowId + "$$").classList.add("draft");

                                                                           console.log("Calling backend with cvId =", vendorID);

                                                                           $.ajax({
                                                                           type: "POST",
                                                                           url: "CustomerAjax?tabid=getCustomerDetails",
                                                                           data: { cvId: vendorID },
                                                                           success: function (data) {
                                                                           console.log("[CUSTOMER] Data received:", data);

                                                                           // Fill customer details
                                                                           $('#customerID').html(data.clientVendorID);
                                                                           $('#customerName').html(`${data.firstName} ${data.middleName} ${data.lastName}`);
                                                                           $('#cname').html(data.cname);
                                                                           $('#customerCompanyName').html(data.cname);
                                                                           $('#dbaName').html(data.dbaName);
                                                                           $('#customerType').val(data.cvCategoryTypeID);
                                                                           $('#billingAddress').html(data.billTo);
                                                                           $('#shippingAddress').html(data.shipTo);
                                                                             $('#country').val(data.countryID);
                                                                             $('#activeCustomer').html(data.active);

                                                                             $('#phone').html(data.phone);
                                                                             $('#cellPhone').html(data.cellPhone);
                                                                             $('#fax').html(data.fax);
                                                                             $('#email').html(data.email);
                                                                             $('#dateAdded').html(data.dateAdded);
                                                                             $('#lastOrderDate').html(data.lastOrderDate);

                                                                             $('#last3MonthAmt').html(data.last3MonthAmt);
                                                                             $('#last1YearAmt').html(data.last1YearAmt);
                                                                             $('#totalOverdueAmt').html(data.totalOverdueAmt);
                                                                             $('#openingUB').html(data.openingUB);
                                                                             $('#extCredit').html(data.extCredit);

                                                                             // Highlight the selected row
                                                                             let size = document.getElementById("lSize").value;
                                                                             for (let i = 0; i < size; i++) {
                                                                           const row = document.getElementById(i + "$$");
                                                                           if (row) row.classList.remove('draft');
                                                                           }
                                                                           document.getElementById(rowId + "$$").classList.add('draft');

                                                                           // Fetch history
                                                                           lookUpHistory();
                                                                           },
                                                                           error: function (error) {
                                                                           console.error("[CUSTOMER] Error fetching details:", error);
                                                                           alert("<bean:message key='BzComposer.common.erroroccurred'/>");
                                                                           }
                                                                           });
                                                                           }

                                                                                </script>


                              </form:form>
                              <%@ include file="/WEB-INF/jsp/include/footer.jsp"%>


                              <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
