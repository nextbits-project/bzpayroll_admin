<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="../include/headlogo.jsp" %>
    <%@include file="../include/header.jsp" %>
    <%@include file="../include/menu.jsp" %>
    <title>BzPayroll - Created InActive Timesheet</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .main-container {
            padding: 20px;
            max-width: 1600px;
            margin: 0 auto;
        }
        .employee-list-container {
            border: 1px solid #ddd;
            border-radius: 4px;
            height: 600px;
            overflow-y: auto;
            background: #fff;
        }
        .employee-row {
            border-bottom: 1px solid #eee;
            cursor: pointer;
            padding: 10px;
        }
        .employee-row:hover {
            background-color: #f1f1f1;
        }
        .employee-row.selected {
            background-color: #808080;
            color: white;
            font-weight: bold;
        }
        .timesheet-table-container {
            border: 1px solid #ddd;
            border-radius: 4px;
            background: #fff;
            padding: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table thead {
            background-color: #C3C5C7;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
            font-size: 13px;
        }
        table tbody tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
        .timesheet-row.selected {
            background-color: #d4edda;
        }
        .modal-content {
            max-width: 900px;
        }
        .timesheet-detail-table {
            width: 100%;
            margin-top: 20px;
        }
        .timesheet-summary {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #ddd;
        }
        .summary-row:last-child {
            border-bottom: none;
            font-weight: bold;
            font-size: 16px;
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
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .form-layout td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            vertical-align: middle;
        }
        .form-layout input[type="time"],
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
        /* Tabs container */
        #formCustomization {
            margin: 10px 0;
        }
        /* Tab list */
        .tab-list {
            display: flex;
            justify-content: center;
            list-style: none;
            margin: 0;
            padding: 0;
            border-bottom: 1px solid #ccc;
        }
        .tab-item {
            flex: 1;
            text-align: center;
            padding: 10px 0;
            cursor: pointer;
            border: 1px solid #ccc;
            border-bottom: none;
            background: #f7f7f7;
            border-radius: 8px 8px 0 0;
            font-weight: normal;
        }
        .active-tab {
            background: #fff;
        }
        /* Tab content */
        .tab-pane {
            display: none;
        }
        .active-content {
            display: block;
        }
        /* Employee table */
        .employee-list-container {
            border: 1px solid #ccc;
            border-radius: 0 8px 8px 8px;
            background: #fff;
            height: 500px;
            overflow-y: auto;
            margin-top: -1px;
        }
    </style>
</head>
<body>
    <div id="ddcolortabsline">&nbsp;</div>
    <div id="cos">
        <span style="color: #05A9C5 !important;font-size: 1.6rem;">
            Created InActive Timesheet
            <c:if test="${not empty message}">
                <br /> ${message}
            </c:if>
        </span>
        <br><br>
        
        <div class="row">
            <div style="text-align: right;"> </div>
            <!-- Left Side: Employee List -->
            <div class="col-sm-3">
                <%--<div class="panel">--%>
                    <div >
                        <div style="align-items:center; margin-bottom: 15px;" id="inlineCalendar"></div>
                        <div class="form-layout">
                                   <table>
                                       <tr>
                                           <td colspan="4">Payroll Period:</td>
                                           </tr>
                                           <tr>
                                           <td style="margin:0px; padding:0px;">&nbsp;From</td>
                                           <td style="margin:0px; padding:0px;"><input type="date" id="fromDate" name="from" style="width: 110px;"/></td>
                                          <td style="margin:0px; padding:0px;">&nbsp;To</td>
                                          <td style="margin:0px; padding:0px;"><input type="date" name="to" style="width: 110px;"/></td>
                                          </tr>
                                       </tr>
                                       </table>
                                       </div>
                        <script>
                           const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                           // Get Sunday of the selected date's week
                           function getSunday(date) {
                             const d = new Date(date);
                             const day = d.getDay();
                             const diff = d.getDate() - day; // go back to Sunday
                             return new Date(d.setDate(diff));
                           }

                           // Update table for the week starting from Sunday
                           function updateTable(selectedDate) {
                             const sunday = getSunday(selectedDate);

                             for (let i = 0; i < 7; i++) {
                               const newDate = new Date(sunday);
                               newDate.setDate(sunday.getDate() + i);

                               const dayName = weekDays[newDate.getDay()];
                               const dateFormatted = newDate.toISOString().split("T")[0]; // yyyy-mm-dd
                               if (i === 0 || i === 6) {
                                 $(".date" + (i + 1)).text(dateFormatted);
                               }
                               $("#day" + (i + 1)).text(dayName);
                               $("#date" + (i + 1)).text(dateFormatted);
                             }
                           }

                           // When user selects a date manually
                           $("#fromDate").on("change", function () {
                             const val = $(this).val();
                             if (val) {
                               updateTable(new Date(val));
                             }
                           });

                           // Inline calendar with jQuery UI
                           $("#inlineCalendar").datepicker({
                             showOtherMonths: true,
                             selectOtherMonths: true,
                             dateFormat: "yy-mm-dd",
                             firstDay: 0, // Week starts Sunday
                             onSelect: function (dateText) {
                               const selectedDate = $(this).datepicker("getDate");
                               $("#fromDate").val(dateText);
                               updateTable(selectedDate);
                             }
                           });
                         </script>
                    </div>

                <div id="formCustomization">
                  <!-- Inactive Employees -->
                  <div class="employee-list-container">
                      <table>
                        <tbody id="custTableBody2">
                        <c:forEach var="employeeInfo"
                            items="${employeeInfoDTOList}">
                            <tr class="employee-row"
                                data-id="${employeeInfo.id}"
                                style="border-bottom: 1px solid #ccc; cursor: pointer;">
                               <td style="padding: 10px; font-size: 13px;" class="employee-col-${employeeInfo.id}">
                                   ${empty employeeInfo.firstName ? '' : employeeInfo.firstName}
                                   ${empty employeeInfo.lastName ? '' : employeeInfo.lastName}
                                   ${empty employeeInfo.mi ? '' : employeeInfo.mi}
                                   ${empty employeeInfo.ssn ? '' : employeeInfo.ssn} <br />
                                   <strong>To be Paid Date:</strong> ${empty inactiveEmployeePayDate[employeeInfo.id] ? '' : inactiveEmployeePayDate[employeeInfo.id]} <br />
                                   <strong>Hours to be Paid:</strong> ${empty inactiveEmployeeHours[employeeInfo.id] ? '0.00' : inactiveEmployeeHours[employeeInfo.id]} <br />
                                   ${empty employeeInfo.payPeriod ? '' : employeeInfo.payPeriod}
                                </td>
                                </tr>
                        </c:forEach>
                    </tbody>
                      </table>
                    </div>
                </div>

            </div>
            
            <!-- Right Side: Timesheet List -->
            <div class="col-sm-9">
                <div class="timesheet-table-container">
                    <div id="css1" style="text-align:center; padding: 10px; background-color: #C3C5C7;">
                        <h4 style="font-size: 16px; margin: 0;">Saved Timesheets</h4>
                    </div>
                    <div style="overflow-x: auto;">
                        <table id="timesheetTable">
                            <thead>
                                <tr>
                                    <th>Employee Name</th>
                                    <th>Employee Status</th>
                                    <th>Employee Job</th>
                                    <th>SSN</th>
                                    <th>Submitted Date</th>
                                    <th>Expected Pay Date</th>
                                    <th>Starting Date</th>
                                    <th>End Date</th>
                                    <th>Total Hours</th>
                                    <th>Regular Hours</th>
                                    <th>Over Time Hours</th>
                                </tr>
                            </thead>
                            <tbody id="timesheetTableBody">
                                <c:forEach var="ts" items="${timesheetList}">
                                    <tr class="timesheet-row" 
                                        data-employee-id="${ts.employeeId}"
                                        data-timesheet-id="${ts.timesheetId}"
                                        data-start-date="${ts.startingDate}"
                                        data-end-date="${ts.endDate}">
                                        <td>${ts.employeeName}</td>
                                        <td>${ts.employeeStatus}</td>
                                        <td>${ts.employeeJob}</td>
                                        <td>${ts.ssn}</td>
                                        <td>${ts.submittedDate}</td>
                                        <td>${ts.expectedPayDate}</td>
                                        <td>${ts.startingDate}</td>
                                        <td>${ts.endDate}</td>
                                        <td><fmt:formatNumber value="${ts.totalHours}" pattern="#0.00" /></td>
                                        <td><fmt:formatNumber value="${ts.regularHours}" pattern="#0.00" /></td>
                                        <td><fmt:formatNumber value="${ts.overtimeHours}" pattern="#0.00" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Timesheet Detail Modal -->
    <div class="modal fade" id="timesheetDetailModal" tabindex="-1" aria-labelledby="timesheetDetailModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="timesheetDetailModalLabel">Timesheet Details</h5>
                    <button type="button" class="btn-close" onclick="hideModal(); return false;" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="timesheetDetailContent">
                    <!-- Content will be loaded dynamically -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="hideModal(); return false;">Close</button>
                    <button type="button" class="btn btn-primary" onclick="editTimesheet(); return false;">Edit</button>
                    <button type="button" class="btn btn-danger" onclick="deleteTimesheet(); return false;">Delete</button>
                    <button type="button" class="btn btn-info" onclick="printTimesheet(); return false;">Print</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Helper function to safely remove elements (avoiding Prototype.js conflicts)
        function safeRemoveElement(element) {
            if (!element) return;
            
            // Prefer jQuery if available (works better with Prototype.js)
            if (typeof jQuery !== 'undefined' && jQuery && jQuery.fn && jQuery.fn.remove) {
                try {
                    jQuery(element).remove();
                    return;
                } catch (e) {
                    console.warn('jQuery remove failed, trying fallback:', e);
                }
            }
            
            // Fallback: Use parentNode.removeChild to avoid Prototype.js conflicts
            if (element.parentNode) {
                try {
                    element.parentNode.removeChild(element);
                    return;
                } catch (e) {
                    console.warn('parentNode.removeChild failed:', e);
                }
            }
            
            // Last resort: try to hide it instead
            if (element.style) {
                element.style.display = 'none';
            }
        }
        
        // Function to hide modal (avoiding Prototype.js conflicts)
        function hideModal() {
            const modalElement = document.getElementById('timesheetDetailModal');
            if (modalElement) {
                modalElement.style.display = 'none';
                modalElement.classList.remove('show');
                modalElement.setAttribute('aria-hidden', 'true');
                modalElement.setAttribute('aria-modal', 'false');
            }
            
            // Remove backdrop by ID first (most reliable) - using safe removal
            const backdropById = document.getElementById('timesheetModalBackdrop');
            if (backdropById) {
                safeRemoveElement(backdropById);
            }
            
            // Remove ALL backdrops (Bootstrap might create multiple) - using safe removal
            const backdrops = document.querySelectorAll('.modal-backdrop');
            for (let i = backdrops.length - 1; i >= 0; i--) {
                safeRemoveElement(backdrops[i]);
            }
            
            // Also remove any backdrop that might have different class names
            const allBackdrops = document.querySelectorAll('[class*="backdrop"]');
            for (let i = allBackdrops.length - 1; i >= 0; i--) {
                const backdrop = allBackdrops[i];
                if (backdrop.classList && (backdrop.classList.contains('modal-backdrop') || backdrop.classList.contains('fade') || backdrop.classList.contains('show'))) {
                    safeRemoveElement(backdrop);
                }
            }
            
            // Remove any elements with fade class that might be backdrops
            const fadeElements = document.querySelectorAll('.fade');
            for (let i = fadeElements.length - 1; i >= 0; i--) {
                const element = fadeElements[i];
                if (element.classList && (element.classList.contains('modal-backdrop') || element.classList.contains('show'))) {
                    safeRemoveElement(element);
                }
            }
            
            // Clean up body classes and styles
            if (document.body.classList) {
                document.body.classList.remove('modal-open');
            } else {
                // Fallback for older browsers
                document.body.className = document.body.className.replace(/\bmodal-open\b/g, '');
            }
            document.body.style.overflow = '';
            document.body.style.paddingRight = '';
            document.body.style.overflowX = '';
            document.body.style.overflowY = '';
            document.body.style.position = '';
            
            // Force a reflow to ensure changes take effect
            void document.body.offsetHeight;
        }
        
        // Close modal when clicking outside
        document.addEventListener('click', function(e) {
            const modal = document.getElementById('timesheetDetailModal');
            if (modal && e.target === modal) {
                hideModal();
            }
        });
        
        // Also handle ESC key to close modal
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' || e.keyCode === 27) {
                const modalElement = document.getElementById('timesheetDetailModal');
                if (modalElement && modalElement.style.display === 'block') {
                    hideModal();
                }
            }
        });
    </script>
    
    <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
    
    <script>
        // Wait for Bootstrap to be fully loaded
        $(document).ready(function() {
            console.log("Bootstrap available:", typeof bootstrap !== 'undefined');
            console.log("Modal element exists:", document.getElementById('timesheetDetailModal') !== null);
        });
        
        let selectedEmployeeId = null;
        let selectedTimesheetId = null;
        let selectedStartDate = null;
        let selectedEndDate = null;
        
        // Employee selection
        $(document).on('click', '.employee-row', function() {
            $('.employee-row').removeClass('selected');
            $(this).addClass('selected');
            selectedEmployeeId = $(this).data('id');
            
            // Filter timesheets by employee
            filterTimesheetsByEmployee(selectedEmployeeId);
        });
        
        function filterTimesheetsByEmployee(employeeId) {
            if (employeeId) {
                $('#timesheetTableBody tr').each(function() {
                    const rowEmployeeId = $(this).data('employee-id');
                    if (rowEmployeeId == employeeId) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            } else {
                $('#timesheetTableBody tr').show();
            }
        }
        
        // Timesheet selection
        $(document).on('click', '.timesheet-row', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            console.log("Timesheet row clicked");
            
            $('.timesheet-row').removeClass('selected');
            $(this).addClass('selected');
            
            selectedTimesheetId = $(this).data('timesheet-id');
            selectedEmployeeId = $(this).data('employee-id');
            selectedStartDate = $(this).data('start-date');
            selectedEndDate = $(this).data('end-date');
            
            console.log("Selected timesheet:", {
                timesheetId: selectedTimesheetId,
                employeeId: selectedEmployeeId,
                startDate: selectedStartDate,
                endDate: selectedEndDate
            });
            
            // Load timesheet details
            if (selectedEmployeeId && selectedStartDate && selectedEndDate) {
                loadTimesheetDetails(selectedEmployeeId, selectedStartDate, selectedEndDate);
            } else {
                console.error("Missing data attributes:", {
                    employeeId: selectedEmployeeId,
                    startDate: selectedStartDate,
                    endDate: selectedEndDate
                });
                alert('Missing timesheet information. Please ensure the timesheet row has all required data attributes.');
            }
        });
        
        function loadTimesheetDetails(employeeId, startDate, endDate) {
            console.log("Loading timesheet details for:", employeeId, startDate, endDate);
            
            if (!employeeId || !startDate || !endDate) {
                alert('Missing required information. Please select a timesheet.');
                return;
            }
            
            $.ajax({
                url: '/api/timesheet/' + employeeId + '/' + startDate + '/' + endDate,
                type: 'GET',
                success: function(data) {
                    console.log("Timesheet data received:", data);
                    if (data) {
                        displayTimesheetDetails(data, employeeId, startDate, endDate);
                        // Show modal using direct DOM manipulation to avoid Prototype.js conflicts
                        const modalElement = document.getElementById('timesheetDetailModal');
                        if (modalElement) {
                            // Small delay to ensure DOM is updated
                            setTimeout(function() {
                                try {
                                    // Remove any existing backdrop using safe removal
                                    const existingBackdrop = document.querySelector('.modal-backdrop');
                                    if (existingBackdrop) {
                                        safeRemoveElement(existingBackdrop);
                                    }
                                    
                                    // Remove any existing backdrops first using safe removal
                                    const existingBackdrops = document.querySelectorAll('.modal-backdrop');
                                    for (let i = existingBackdrops.length - 1; i >= 0; i--) {
                                        safeRemoveElement(existingBackdrops[i]);
                                    }
                                    
                                    // Show modal using direct style manipulation
                                    modalElement.style.display = 'block';
                                    modalElement.classList.add('show');
                                    modalElement.setAttribute('aria-hidden', 'false');
                                    modalElement.setAttribute('aria-modal', 'true');
                                    
                                    // Add backdrop
                                    const backdrop = document.createElement('div');
                                    backdrop.className = 'modal-backdrop fade show';
                                    backdrop.setAttribute('data-bs-dismiss', 'modal');
                                    backdrop.id = 'timesheetModalBackdrop'; // Add ID for easier removal
                                    backdrop.onclick = function() {
                                        hideModal();
                                    };
                                    document.body.appendChild(backdrop);
                                    document.body.classList.add('modal-open');
                                    document.body.style.overflow = 'hidden';
                                    document.body.style.paddingRight = '0px';
                                    
                                    console.log("Modal shown using direct DOM manipulation");
                                } catch (e) {
                                    console.error("Error showing modal:", e);
                                    alert('Error displaying modal. Please check console.');
                                }
                            }, 100);
                        } else {
                            console.error("Modal element not found");
                            alert('Modal element not found.');
                        }
                    } else {
                        alert('No timesheet data found.');
                    }
                },
                error: function(xhr) {
                    console.error("Failed to fetch timesheet:", xhr.status, xhr.responseText);
                    alert('Failed to load timesheet details. Status: ' + xhr.status + '. Please check console for details.');
                }
            });
        }
        
        function displayTimesheetDetails(data, employeeId, startDate, endDate) {
            // Get employee name from the selected timesheet row (more reliable than searching employee list)
            let employeeFullName = "Unknown Employee";
            
            // First try: Get from the selected timesheet row
            const selectedTimesheetRow = document.querySelector(".timesheet-row.selected");
            if (selectedTimesheetRow) {
                const nameCell = selectedTimesheetRow.querySelector("td:first-child");
                if (nameCell) {
                    const nameText = (nameCell.textContent || nameCell.innerText || '').trim();
                    if (nameText) {
                        employeeFullName = nameText;
                    }
                }
            }
            
            // Fallback: Try to get from employee list
            if (employeeFullName === "Unknown Employee") {
                const employeeRow = document.querySelector("#custTableBody tr[data-id='" + employeeId + "'], #custTableBody2 tr[data-id='" + employeeId + "']");
                if (employeeRow) {
                    const employeeTd = employeeRow.querySelector("td.employee-col, td");
                    if (employeeTd) {
                        const textContent = employeeTd.textContent || employeeTd.innerText;
                        const lines = textContent.split('\n');
                        if (lines.length > 0) {
                            let firstLine = lines[0].trim();
                            // Remove SSN if present
                            firstLine = firstLine.replace(/\d{3}[-\s]?\d{2}[-\s]?\d{4}/g, '').trim();
                            firstLine = firstLine.replace(/\s+\d{9}$/, '').trim();
                            firstLine = firstLine.replace(/\s+\d{8,10}$/, '').trim();
                            if (firstLine) {
                                employeeFullName = firstLine;
                            }
                        }
                    }
                }
            }
            
            // Format dates
            function formatDateMMDDYYYY(dateStr) {
                if (!dateStr) return '';
                // Handle both YYYY-MM-DD and other formats
                let date;
                if (typeof dateStr === 'string' && dateStr.includes('-')) {
                    // Parse YYYY-MM-DD format
                    date = new Date(dateStr + 'T00:00:00'); // Add time to avoid timezone issues
                } else {
                    date = new Date(dateStr);
                }
                
                // Check if date is valid
                if (isNaN(date.getTime())) {
                    return '';
                }
                
                const m = date.getMonth() + 1;
                const d = date.getDate();
                const y = date.getFullYear();
                return m + "/" + d + "/" + y;
            }
            
            function formatHMS(timeStr) {
                if (!timeStr) return "00:00:00";
                // Handle LocalTime object format (from JSON serialization)
                if (typeof timeStr === 'object' && timeStr.hour !== undefined) {
                    return String(timeStr.hour).padStart(2, '0') + ':' + String(timeStr.minute).padStart(2, '0') + ':00';
                }
                if (typeof timeStr === 'string') {
                    return timeStr.length >= 8 ? timeStr.substring(0, 8) : timeStr + ':00';
                }
                return "00:00:00";
            }
            
            function parseHMStoHours(hms) {
                if (!hms) return 0;
                const parts = String(hms).split(":");
                if (parts.length < 2) return 0;
                const h = parseInt(parts[0] || "0", 10) || 0;
                const m = parseInt(parts[1] || "0", 10) || 0;
                const s = parseInt(parts[2] || "0", 10) || 0;
                return h + (m / 60) + (s / 3600);
            }
            
            let html = '<div class="timesheet-detail-content" style="font-family: Arial, sans-serif;">';
            
            // Header: Employee Name (left) and Date Range (right) - matching PDF design
            html += '<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #333;">';
            html += '<h4 style="margin: 0; font-weight: bold; font-size: 18px;">' + employeeFullName + '</h4>';
            html += '<span style="font-size: 14px;">' + formatDateMMDDYYYY(startDate) + ' - ' + formatDateMMDDYYYY(endDate) + '</span>';
            html += '</div>';
            
            // Table matching PDF design: Employee Name, Clock In Date, Clock In Time, Clock Out Date, Clock Out Time, Hours
            html += '<table class="table table-bordered" style="width: 100%; border-collapse: collapse; margin-bottom: 20px;">';
            html += '<thead style="background-color: #f0f0f0;">';
            html += '<tr>';
            html += '<th style="padding: 10px; text-align: left; border: 1px solid #ddd; font-weight: bold;">Employee Name</th>';
            html += '<th style="padding: 10px; text-align: left; border: 1px solid #ddd; font-weight: bold;">Clock In Date</th>';
            html += '<th style="padding: 10px; text-align: left; border: 1px solid #ddd; font-weight: bold;">Clock In Time</th>';
            html += '<th style="padding: 10px; text-align: left; border: 1px solid #ddd; font-weight: bold;">Clock Out Date</th>';
            html += '<th style="padding: 10px; text-align: left; border: 1px solid #ddd; font-weight: bold;">Clock Out Time</th>';
            html += '<th style="padding: 10px; text-align: left; border: 1px solid #ddd; font-weight: bold;">Hours</th>';
            html += '</tr>';
            html += '</thead>';
            html += '<tbody>';
            
            let totalHours = 0;
            const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            
            // Helper function to add days to a date
            function addDays(dateStr, days) {
                if (!dateStr) return '';
                // Handle YYYY-MM-DD format
                let date;
                if (typeof dateStr === 'string' && dateStr.includes('-')) {
                    date = new Date(dateStr + 'T00:00:00'); // Add time to avoid timezone issues
                } else {
                    date = new Date(dateStr);
                }
                if (isNaN(date.getTime())) return '';
                date.setDate(date.getDate() + days);
                return date.toISOString().split('T')[0]; // Return YYYY-MM-DD format
            }
            
            // Parse start date to ensure proper format
            let parsedStartDate = null;
            if (startDate) {
                // Handle YYYY-MM-DD format
                if (typeof startDate === 'string' && startDate.includes('-')) {
                    parsedStartDate = new Date(startDate + 'T00:00:00');
                } else {
                    parsedStartDate = new Date(startDate);
                }
                if (isNaN(parsedStartDate.getTime())) {
                    parsedStartDate = null;
                }
            }
            
            for (let row = 1; row <= 7; row++) {
                // Try to get work date from API response (field names: w1orkDate, w2orkDate, etc.)
                const dateField = 'w' + row + 'orkDate';
                let workDate = data[dateField] || '';
                
                // If workDate is not available, calculate it from startDate
                if (!workDate && parsedStartDate) {
                    workDate = addDays(startDate, row - 1);
                }
                
                // Debug: log workDate for troubleshooting
                if (row <= 2) {
                    console.log('Row ' + row + ' workDate:', workDate, 'startDate:', startDate);
                }
                
                // Get first start time and last end time
                let firstStartTime = null;
                let lastEndTime = null;
                
                for (let col = 1; col <= 8; col++) {
                    const startField = 'startRow' + row + 'Col' + col;
                    const endField = 'endRow' + row + 'Col' + col;
                    let startTime = data[startField];
                    let endTime = data[endField];
                    
                    // Handle LocalTime object format (from JSON serialization)
                    if (startTime && typeof startTime === 'object' && startTime.hour !== undefined) {
                        startTime = String(startTime.hour).padStart(2, '0') + ':' + String(startTime.minute).padStart(2, '0') + ':00';
                    }
                    if (endTime && typeof endTime === 'object' && endTime.hour !== undefined) {
                        endTime = String(endTime.hour).padStart(2, '0') + ':' + String(endTime.minute).padStart(2, '0') + ':00';
                    }
                    
                    if (startTime && !firstStartTime) {
                        firstStartTime = startTime;
                    }
                    if (endTime) {
                        lastEndTime = endTime;
                    }
                }
                
                // Get total hours for this row
                let totalHoursCell = data['totalHoursCell' + row];
                let rowHours = 0;
                if (totalHoursCell) {
                    if (typeof totalHoursCell === 'string') {
                        const parts = totalHoursCell.split(':');
                        if (parts.length >= 2) {
                            rowHours = parseFloat(parts[0]) + (parseFloat(parts[1]) / 60);
                        } else {
                            rowHours = parseFloat(totalHoursCell) || 0;
                        }
                    } else {
                        rowHours = parseFloat(totalHoursCell) || 0;
                    }
                }
                
                // If no total hours, calculate from first start and last end
                if (rowHours === 0 && firstStartTime && lastEndTime) {
                    const startStr = typeof firstStartTime === 'string' ? firstStartTime.substring(0, 5) : '';
                    const endStr = typeof lastEndTime === 'string' ? lastEndTime.substring(0, 5) : '';
                    if (startStr && endStr) {
                        rowHours = calculateHours(startStr, endStr);
                        // Subtract break time if available
                        let breakTime = data['break' + row];
                        if (breakTime) {
                            const breakStr = typeof breakTime === 'string' ? breakTime.substring(0, 5) : '00:00';
                            const breakHours = calculateHours('00:00', breakStr);
                            rowHours = Math.max(0, rowHours - breakHours);
                        }
                    }
                }
                
                totalHours += rowHours;
                
                // Only show rows with hours > 0
                if (rowHours > 0 || firstStartTime || lastEndTime) {
                    html += '<tr>';
                    html += '<td style="padding: 8px; border: 1px solid #ddd;">' + employeeFullName + '</td>';
                    html += '<td style="padding: 8px; border: 1px solid #ddd;">' + formatDateMMDDYYYY(workDate) + '</td>';
                    html += '<td style="padding: 8px; border: 1px solid #ddd;">' + formatHMS(firstStartTime) + '</td>';
                    html += '<td style="padding: 8px; border: 1px solid #ddd;">' + formatDateMMDDYYYY(workDate) + '</td>';
                    html += '<td style="padding: 8px; border: 1px solid #ddd;">' + formatHMS(lastEndTime) + '</td>';
                    html += '<td style="padding: 8px; border: 1px solid #ddd;">' + rowHours.toFixed(2) + '</td>';
                    html += '</tr>';
                }
            }
            
            html += '</tbody>';
            html += '</table>';
            
            // Summary section below table (matching PDF design) - Regular Hours, OT Hours, Total Hours
            const regularHours = Math.min(totalHours, 40.0);
            const overtimeHours = Math.max(0, totalHours - 40.0);
            
            html += '<div style="margin-top: 20px; padding: 15px; background-color: #f8f9fa; border: 1px solid #ddd; border-radius: 4px;">';
            html += '<div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #ddd;">';
            html += '<span style="font-weight: bold;">Regular Hours:</span>';
            html += '<span>' + regularHours.toFixed(2) + '</span>';
            html += '</div>';
            html += '<div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #ddd;">';
            html += '<span style="font-weight: bold;">Overtime Hours:</span>';
            html += '<span>' + overtimeHours.toFixed(2) + '</span>';
            html += '</div>';
            html += '<div style="display: flex; justify-content: space-between; padding: 8px 0; font-weight: bold; font-size: 16px;">';
            html += '<span>Total Hours:</span>';
            html += '<span>' + totalHours.toFixed(2) + '</span>';
            html += '</div>';
            html += '</div>';
            
            html += '</div>';
            
            $('#timesheetDetailContent').html(html);
        }
        
        function calculateHours(startTime, endTime) {
            // Handle time format HH:mm or HH:mm:ss
            const startParts = startTime.split(':');
            const endParts = endTime.split(':');
            
            const startHours = parseInt(startParts[0]) || 0;
            const startMinutes = parseInt(startParts[1]) || 0;
            const endHours = parseInt(endParts[0]) || 0;
            const endMinutes = parseInt(endParts[1]) || 0;
            
            let totalStartMinutes = startHours * 60 + startMinutes;
            let totalEndMinutes = endHours * 60 + endMinutes;
            
            // Handle case where end time is next day
            if (totalEndMinutes < totalStartMinutes) {
                totalEndMinutes += 24 * 60;
            }
            
            const diffMinutes = totalEndMinutes - totalStartMinutes;
            return diffMinutes / 60.0;
        }
        
        function editTimesheet() {
            if (selectedEmployeeId && selectedStartDate && selectedEndDate) {
                window.location.href = '/create-employee-timesheet?employeeId=' + selectedEmployeeId + '&startDate=' + selectedStartDate + '&endDate=' + selectedEndDate;
            } else {
                alert('Please select a timesheet to edit.');
            }
        }
        
        function deleteTimesheet() {
            if (!selectedTimesheetId || !selectedEmployeeId || !selectedStartDate || !selectedEndDate) {
                alert('Please select a timesheet to delete.');
                return;
            }
            
            if (confirm('Are you sure you want to delete this timesheet?')) {
                $.ajax({
                    url: '/api/timesheet/delete',
                    type: 'POST',
                    data: {
                        employeeId: selectedEmployeeId,
                        startDate: selectedStartDate,
                        endDate: selectedEndDate
                    },
                    success: function(response) {
                        alert('Timesheet deleted successfully.');
                        hideModal();
                        location.reload();
                    },
                    error: function(xhr) {
                        console.error("Failed to delete timesheet:", xhr.status, xhr.responseText);
                        alert('Failed to delete timesheet: ' + (xhr.responseText || 'Unknown error'));
                    }
                });
            }
        }
        
        function printTimesheet() {
            if (!selectedEmployeeId || !selectedStartDate || !selectedEndDate) {
                alert('Please select a timesheet to print.');
                return;
            }
            
            // Get employee name from the selected timesheet row (more reliable)
            var employeeFullName = "Unknown Employee";
            
            // First try: Get from the selected timesheet row
            var selectedTimesheetRow = document.querySelector(".timesheet-row.selected");
            if (selectedTimesheetRow) {
                var nameCell = selectedTimesheetRow.querySelector("td:first-child");
                if (nameCell) {
                    var nameText = (nameCell.textContent || nameCell.innerText || '').trim();
                    if (nameText) {
                        employeeFullName = nameText;
                    }
                }
            }
            
            // Fallback: Try to get from employee list
            if (employeeFullName === "Unknown Employee") {
                var employeeRow = null;
                
                if (selectedEmployeeId) {
                    // Try to find employee row in active tab first
                    employeeRow = document.querySelector("#custTableBody tr[data-id='" + selectedEmployeeId + "']");
                    // If not found, try inactive tab
                    if (!employeeRow) {
                        employeeRow = document.querySelector("#custTableBody2 tr[data-id='" + selectedEmployeeId + "']");
                    }
                }
                
                // Fallback: check for selected/highlighted row
                if (!employeeRow) {
                    var selectedRow = document.querySelector("#custTableBody tr.selected-row, #custTableBody2 tr.selected-row");
                    if (!selectedRow) {
                        // Check for highlighted row (gray background)
                        var highlightedRows = document.querySelectorAll("#custTableBody tr, #custTableBody2 tr");
                        for (var i = 0; i < highlightedRows.length; i++) {
                            var style = window.getComputedStyle(highlightedRows[i]);
                            if (style.backgroundColor && (style.backgroundColor.includes('128') || style.backgroundColor.includes('808080'))) {
                                selectedRow = highlightedRows[i];
                                break;
                            }
                        }
                    }
                    if (selectedRow) {
                        employeeRow = selectedRow;
                        selectedEmployeeId = selectedRow.getAttribute('data-id');
                    }
                }
                
                if (employeeRow) {
                    // Get the td element containing the employee info
                    var employeeTd = employeeRow.querySelector("td.employee-col");
                    if (!employeeTd) {
                        // Try to get first td if class not found
                        employeeTd = employeeRow.querySelector("td");
                    }
                    if (employeeTd) {
                        // Extract first line which contains firstName lastName
                        var textContent = employeeTd.textContent || employeeTd.innerText;
                        var lines = textContent.split('\n');
                        if (lines.length > 0) {
                            // First line contains firstName lastName (and possibly SSN)
                            var firstLine = lines[0].trim();
                            // Remove SSN if present (it's usually at the end after the name)
                            // SSN format: XXX-XX-XXXX or XXX XX XXXX or just 9 digits
                            firstLine = firstLine.replace(/\d{3}[-\s]?\d{2}[-\s]?\d{4}/g, '').trim();
                            // Remove any trailing 9-digit number (SSN without dashes/spaces)
                            firstLine = firstLine.replace(/\s+\d{9}$/, '').trim();
                            // Remove any trailing numbers that might be SSN (8-10 digits)
                            firstLine = firstLine.replace(/\s+\d{8,10}$/, '').trim();
                            if (firstLine) {
                                employeeFullName = firstLine;
                            }
                        }
                    }
                }
            }
            
            // Load timesheet data and generate PDF
            $.ajax({
                url: '/api/timesheet/' + selectedEmployeeId + '/' + selectedStartDate + '/' + selectedEndDate,
                type: 'GET',
                success: function(data) {
                    if (data) {
                        printTheReport(data, employeeFullName, selectedStartDate, selectedEndDate);
                    } else {
                        alert('No timesheet data found to print.');
                    }
                },
                error: function(xhr) {
                    console.error("Failed to fetch timesheet:", xhr.status, xhr.responseText);
                    alert('Failed to load timesheet data for printing.');
                }
            });
        }
        
        function printTheReport(data, employeeFullName, startDateStr, endDateStr) {
            var doc = new jsPDF({
                orientation: "portrait",
                unit: "in",
                format: "a4"
            });

            // --- Date utilities ---
            function addDays(dateObj, days) {
                var d = new Date(dateObj.getTime());
                d.setDate(d.getDate() + days);
                return d;
            }

            function formatDateMMDDYYYY(dt) {
                if (typeof dt === 'string') {
                    dt = new Date(dt);
                }
                var m = dt.getMonth() + 1;
                var d = dt.getDate();
                var y = dt.getFullYear();
                return m + "/" + d + "/" + y;
            }

            function parseHMStoHours(hms) {
                if (!hms) return 0;
                // Handle LocalTime object
                if (typeof hms === 'object' && hms.hour !== undefined) {
                    return hms.hour + (hms.minute / 60) + ((hms.second || 0) / 3600);
                }
                var parts = String(hms).split(":");
                if (parts.length < 2) return 0;
                var h = parseInt(parts[0] || "0", 10) || 0;
                var m = parseInt(parts[1] || "0", 10) || 0;
                var s = parseInt(parts[2] || "0", 10) || 0;
                return h + (m / 60) + (s / 3600);
            }

            function formatHMS(hms) {
                if (!hms) return "00:00:00";
                // Handle LocalTime object
                if (typeof hms === 'object' && hms.hour !== undefined) {
                    return String(hms.hour).padStart(2, '0') + ':' + 
                           String(hms.minute).padStart(2, '0') + ':00';
                }
                if (typeof hms === 'string') {
                    return hms.length >= 8 ? hms.substring(0, 8) : hms + ':00';
                }
                return "00:00:00";
            }

            function formatHoursDecimal(hours) {
                return hours.toFixed(2);
            }

            // Parse dates
            var startDate = new Date(startDateStr);
            var endDate = new Date(endDateStr);

            // Collect all rows from API data
            var rows = [];
            var currentDate = new Date(startDate);
            var rowIndex = 1;

            while (currentDate <= endDate && rowIndex <= 7) {
                var rowData = {
                    clockIn: null,
                    clockOut: null,
                    breakTime: null,
                    totalHrs: null,
                    clockInDate: formatDateMMDDYYYY(currentDate),
                    clockOutDate: formatDateMMDDYYYY(currentDate)
                };

                // Get first start time and last end time for this row
                var firstStart = null;
                var lastEnd = null;
                
                for (var col = 1; col <= 8; col++) {
                    var startField = 'startRow' + rowIndex + 'Col' + col;
                    var endField = 'endRow' + rowIndex + 'Col' + col;
                    var startTime = data[startField];
                    var endTime = data[endField];
                    
                    if (startTime && !firstStart) {
                        firstStart = startTime;
                    }
                    if (endTime) {
                        lastEnd = endTime;
                    }
                }
                
                var breakField = 'break' + rowIndex;
                var totalHoursField = 'totalHoursCell' + rowIndex;
                
                if (firstStart) {
                    rowData.clockIn = formatHMS(firstStart);
                }
                if (lastEnd) {
                    rowData.clockOut = formatHMS(lastEnd);
                }
                if (data[breakField]) {
                    rowData.breakTime = formatHMS(data[breakField]);
                }
                if (data[totalHoursField]) {
                    var totalHrs = data[totalHoursField];
                    if (typeof totalHrs === 'object' && totalHrs.hour !== undefined) {
                        rowData.totalHrs = String(totalHrs.hour).padStart(2, '0') + ':' + 
                                           String(totalHrs.minute).padStart(2, '0') + ':00';
                    } else if (typeof totalHrs === 'string') {
                        // If it's already a decimal number string, convert to HH:mm:ss
                        var numHrs = parseFloat(totalHrs);
                        if (!isNaN(numHrs)) {
                            var hrs = Math.floor(numHrs);
                            var mins = Math.round((numHrs - hrs) * 60);
                            rowData.totalHrs = String(hrs).padStart(2, '0') + ':' + 
                                              String(mins).padStart(2, '0') + ':00';
                        } else {
                            rowData.totalHrs = totalHrs.length >= 8 ? totalHrs.substring(0, 8) : totalHrs + ':00';
                        }
                    } else {
                        rowData.totalHrs = String(totalHrs) + ':00';
                    }
                }

                rows.push(rowData);
                currentDate.setDate(currentDate.getDate() + 1);
                rowIndex++;
            }

            // Layout
            var margin = 0.5;
            var pageWidth = doc.internal.pageSize.getWidth();
            var pageHeight = doc.internal.pageSize.getHeight();

            var colWidths = {
                name: 2.2,
                dateIn: 1.1,
                timeIn: 1.1,
                dateOut: 1.1,
                timeOut: 1.1,
                hours: 0.9
            };

            var tableStartX = margin;
            var cursorY = margin;

            // --- Header (name + date range on the right) ---
            doc.setFontSize(12);
            doc.setFont("helvetica", "bold");
            doc.text(employeeFullName, tableStartX, cursorY + 0.1);

            var dateRangeText = formatDateMMDDYYYY(startDate) + " - " + formatDateMMDDYYYY(endDate);
            doc.setFontSize(10);
            doc.setFont("helvetica", "normal");
            // place date range near the right of header but inside margin
            doc.text(dateRangeText, pageWidth - margin - 2.0, cursorY + 0.1);

            cursorY += 0.3;

            // --- Column headers ---
            doc.setFontSize(9);
            doc.setFont("helvetica", "bold");
            var headerY = cursorY + 0.1;
            var x = tableStartX;
            doc.text("Employee Name", x + 0.02, headerY);
            x += colWidths.name;
            doc.text("Clock In Date", x + 0.02, headerY);
            x += colWidths.dateIn;
            doc.text("Clock In Time", x + 0.02, headerY);
            x += colWidths.timeIn;
            doc.text("Clock Out Date", x + 0.02, headerY);
            x += colWidths.dateOut;
            doc.text("Clock Out Time", x + 0.02, headerY);
            x += colWidths.timeOut;
            doc.text("Hours", x + 0.02, headerY);

            cursorY += 0.18;
            doc.setLineWidth(0.005);
            doc.line(tableStartX, cursorY, pageWidth - margin, cursorY);

            // --- Rows rendering ---
            doc.setFont("helvetica", "normal");
            doc.setFontSize(9);
            cursorY += 0.12;

            var rowHeight = 0.18;
            var rowsPerPage = Math.floor((pageHeight - cursorY - 2.0) / rowHeight);
            var rowCountOnPage = 0;
            var totalHours = 0;

            for (var i = 0; i < rows.length; i++) {
                var r = rows[i] || {};

                // Use dates from row data
                var clockInDate = r.clockInDate && r.clockInDate !== "" ? r.clockInDate : formatDateMMDDYYYY(addDays(startDate, i));
                var clockOutDate = r.clockOutDate && r.clockOutDate !== "" ? r.clockOutDate : formatDateMMDDYYYY(addDays(startDate, i));

                var clockInTime = r.clockIn || "00:00:00";
                var clockOutTime = r.clockOut || "00:00:00";
                var breakTime = r.breakTime || "00:00:00";

                var hoursForRow = 0;
                if (r.totalHrs && r.totalHrs !== "00:00:00") {
                    hoursForRow = parseHMStoHours(r.totalHrs);
                } else {
                    if (clockInTime !== "00:00:00" && clockOutTime && clockOutTime !== "00:00:00") {
                        (function () {
                            var toSeconds = function (t) {
                                var p = t.split(":");
                                var hh = parseInt(p[0] || "0", 10);
                                var mm = parseInt(p[1] || "0", 10);
                                var ss = parseInt(p[2] || "0", 10);
                                return hh * 3600 + mm * 60 + ss;
                            };
                            var inS = toSeconds(clockInTime);
                            var outS = toSeconds(clockOutTime);
                            var diff = outS - inS;
                            if (diff < 0)
                                diff += 86400;
                            var bS = toSeconds(breakTime);
                            diff = Math.max(0, diff - bS);
                            hoursForRow = diff / 3600;
                        })();
                    } else {
                        hoursForRow = 0;
                    }
                }

                totalHours += hoursForRow;

                // Handle page break
                if (rowCountOnPage >= rowsPerPage) {
                    doc.addPage();
                    cursorY = margin + 0.2;
                    rowCountOnPage = 0;

                    // redraw header on new page
                    doc.setFont("helvetica", "bold");
                    doc.text(employeeFullName, tableStartX, margin + 0.05);

                    doc.setFont("helvetica", "bold");
                    var hx = tableStartX;
                    doc.text("Employee Name", hx + 0.02, cursorY);
                    hx += colWidths.name;
                    doc.text("Clock In Date", hx + 0.02, cursorY);
                    hx += colWidths.dateIn;
                    doc.text("Clock In Time", hx + 0.02, cursorY);
                    hx += colWidths.timeIn;
                    doc.text("Clock Out Date", hx + 0.02, cursorY);
                    hx += colWidths.dateOut;
                    doc.text("Clock Out Time", hx + 0.02, cursorY);
                    hx += colWidths.timeOut;
                    doc.text("Hours", hx + 0.02, cursorY);

                    cursorY += 0.18;
                    doc.setLineWidth(0.005);
                    doc.line(tableStartX, cursorY, pageWidth - margin, cursorY);
                    cursorY += 0.12;
                    doc.setFont("helvetica", "normal");
                }

                // Row text (left aligned)
                var rx = tableStartX;
                var nameText = r.employeeName ? r.employeeName : employeeFullName;

                doc.text(String(nameText), rx + 0.02, cursorY);
                rx += colWidths.name;

                doc.text(String(clockInDate), rx + 0.02, cursorY);
                rx += colWidths.dateIn;

                doc.text(formatHMS(clockInTime), rx + 0.02, cursorY);
                rx += colWidths.timeIn;

                doc.text(String(clockOutDate), rx + 0.02, cursorY);
                rx += colWidths.dateOut;

                doc.text(formatHMS(clockOutTime), rx + 0.02, cursorY);
                rx += colWidths.timeOut;

                doc.text(formatHoursDecimal(hoursForRow), rx + 0.02, cursorY);

                cursorY += rowHeight;
                rowCountOnPage++;
            }

            cursorY += 0.1;

            // --- Totals block moved to LEFT under the table (without tax calculations) ---
            var totalsBoxWidth = 2.6;
            var totalsX = tableStartX; // left side instead of right
            var ty = cursorY;

            doc.setFont("helvetica", "bold");
            doc.text("Hours", totalsX + 0.05, ty);

            doc.setFont("helvetica", "normal");
            ty += 0.18;

            // Calculate Regular and OT Hours
            var computedRegHours = Math.min(totalHours, 40.0);
            var computedOtHours = Math.max(0, totalHours - 40.0);

            // Get employee hourly rate and calculate gross wage
            var hourlyRate = 0;
            var regRate = 0;
            var otRate = 0;
            var regTotal = 0;
            var otTotal = 0;
            var grossTotal = 0;
            var taxData = null;

            if (selectedEmployeeId) {
                try {
                    $.ajax({
                        url: '/api/employees/' + selectedEmployeeId,
                        type: 'GET',
                        async: false,
                        success: function(empData) {
                            if (empData && empData.hourlyRate) {
                                hourlyRate = parseFloat(empData.hourlyRate) || 0;
                                regRate = hourlyRate;
                                otRate = hourlyRate * 1.5; // OT is typically 1.5x
                                regTotal = computedRegHours * regRate;
                                otTotal = computedOtHours * otRate;
                                grossTotal = regTotal + otTotal;

                                // Calculate taxes
                                if (grossTotal > 0) {
                                    $.ajax({
                                        url: '/api/timesheet/calculate-taxes',
                                        type: 'GET',
                                        async: false,
                                        data: {
                                            employeeId: selectedEmployeeId,
                                            grossWage: grossTotal
                                        },
                                        success: function(response) {
                                            taxData = response;
                                        },
                                        error: function() {
                                            console.error('Failed to calculate taxes');
                                        }
                                    });
                                }
                            }
                        },
                        error: function() {
                            console.error('Failed to fetch employee data');
                        }
                    });
                } catch (e) {
                    console.error('Error fetching employee rate:', e);
                }
            }

            doc.text("Total Hours:", totalsX + 0.02, ty);
            doc.text(formatHoursDecimal(totalHours), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
            ty += 0.16;

            doc.text("Reg Hours:", totalsX + 0.02, ty);
            doc.text(String(formatHoursDecimal(computedRegHours)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
            ty += 0.16;

            if (regRate > 0) {
                doc.text("Reg Rate:", totalsX + 0.02, ty);
                doc.text(String(regRate.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                ty += 0.16;

                doc.text("Reg Total:", totalsX + 0.02, ty);
                doc.text(String(regTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                ty += 0.16;
            }

            doc.text("OT Hours:", totalsX + 0.02, ty);
            doc.text(String(formatHoursDecimal(computedOtHours)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
            ty += 0.16;

            if (otRate > 0) {
                doc.text("OT Rate:", totalsX + 0.02, ty);
                doc.text(String(otRate.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                ty += 0.16;

                doc.text("OT Total:", totalsX + 0.02, ty);
                doc.text(String(otTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                ty += 0.16;
            }

            if (grossTotal > 0) {
                doc.setFont("helvetica", "bold");
                doc.text("GROSS PAY:", totalsX + 0.02, ty);
                doc.text(String(grossTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                ty += 0.16;

                // Tax Deductions Section
                if (taxData) {
                    doc.setFont("helvetica", "normal");
                    doc.text("Federal Tax:", totalsX + 0.02, ty);
                    doc.text(String((taxData.federalTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("Social Security:", totalsX + 0.02, ty);
                    doc.text(String((taxData.socialSecurityTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("Medicare Tax:", totalsX + 0.02, ty);
                    doc.text(String((taxData.medicareTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("State Tax:", totalsX + 0.02, ty);
                    doc.text(String((taxData.stateTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("State Disability:", totalsX + 0.02, ty);
                    doc.text(String((taxData.stateDisabilityTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.setFont("helvetica", "bold");
                    doc.text("Total Deductions:", totalsX + 0.02, ty);
                    doc.text(String((taxData.totalDeduction || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;
                }

                doc.setFont("helvetica", "bold");
                doc.setFontSize(10);
                doc.text("NET PAY:", totalsX + 0.02, ty);
                var netPay = grossTotal - (taxData ? (taxData.totalDeduction || 0) : 0);
                doc.text(String(netPay.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                ty += 0.16;
            }

            // --- Footer timestamp (current date/time) ---
            doc.setFontSize(8);
            doc.setFont("helvetica", "normal");
            var now = new Date();
            doc.text("Generated: " + now.toLocaleString(), margin, pageHeight - margin - 0.05);

            // Save file (JSP-safe concatenation)
            doc.save(employeeFullName.replace(/\s+/g, "_") + "_report.pdf");
        }
        
        function setActiveTab(tabElement, tabId) {
            document.querySelectorAll('.tab-item').forEach(tab => tab.classList.remove('active-tab'));
            document.querySelectorAll('.tab-pane').forEach(pane => pane.classList.remove('active-content'));
            tabElement.classList.add('active-tab');
            document.getElementById(tabId).classList.add('active-content');
        }
        
        // Employee selection for inactive tab
        $(document).on('click', '#custTableBody2 .employee-row', function() {
            $('.employee-row').removeClass('selected');
            $(this).addClass('selected');
            selectedEmployeeId = $(this).data('id');
            
            // Filter timesheets by employee
            filterTimesheetsByEmployee(selectedEmployeeId);
        });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/polyfills.umd.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/jspdf.umd.min.js"></script>
</body>
</html>
