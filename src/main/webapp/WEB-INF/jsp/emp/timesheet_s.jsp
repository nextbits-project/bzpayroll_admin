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
        <title>BzPayroll - Timesheet</title>

        <%--    Timepicker Script--%>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.css'>
        <link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css'>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js'></script>
        <script src="${pageContext.request.contextPath}/scripts/timepiker.js" type="text/javascript"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
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
                box-shadow: 0 1px 3px rgba(0,0,0,0.1);
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
            .form-control, .custom-select {
                border: 1px solid #ced4da;
                border-radius: 4px;
                height: calc(2.25rem + 2px);
                padding: .375rem .75rem;
                font-size: 14px;
            }
            .form-control:focus, .custom-select:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
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
                height: 300px;
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
            #css1{
                background-color:#C3C5C7 ;
            }
        </style>
        <style>
            .form-layout {
                width: 100%;
                max-width: 100%;
                margin: 20px auto;
                font-family: Arial, sans-serif;
                box-sizing: border-box;
            }

            .form-layout table {
                width: 100%;
                max-width: 100%;
                border-collapse: collapse;
                background-color: #f9f9f9;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                border-radius: 8px;
                overflow: hidden;
                table-layout: fixed;
            }

            .form-layout td {
                padding: 12px 15px;
                border: 1px solid #ddd;
                vertical-align: middle;
            }

            /* Specific alignment for payroll period row */
            .form-layout table tr:nth-child(2) td {
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

            /* Specific styling for payroll period date inputs */
            .payroll-date-input {
                width: 100% !important;
                max-width: 100% !important;
                padding: 8px 10px !important;
                border: 1px solid #ced4da !important;
                border-radius: 4px !important;
                font-size: 13px !important;
                background-color: #fff !important;
                cursor: pointer;
                display: block;
                box-sizing: border-box;
                height: 38px;
            }

            .payroll-date-input:focus {
                border-color: #80bdff !important;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25) !important;
                outline: none !important;
            }

            /* Better alignment for payroll period table */
            .form-layout table tr:first-child td {
                background-color: #e0e0e0;
                font-weight: bold;
            }

            .form-layout table tr:last-child td {
                white-space: nowrap;
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

            table.tabla-editables tbody tr:hover td {
                background: #C3C5C7;
                color: black;
            }
        </style>
        <script>
            var funsequence = 0;
            var _1 = navigator.userAgent.toLowerCase();
            var ___ = (_1.indexOf("msie") != -1);
            var ___5 = (_1.indexOf("msie 5") != -1);
            var _io = (_1.indexOf("opera") != -1);
            var _im = (_1.indexOf("mac") != -1);
            var ____gi = (_1.indexOf("gecko") != -1);
            var i____s = (_1.indexOf("safari") != -1);
            var o = null;

            var r = null;
            var flag1 = false;
            var flag2 = false;

            function c(r) {

                if (___) {
                    var t = (___5) ? "Microsoft.XMLHTTP" : "Msxml2.XMLHTTP";
                    try {
                        o = new ActiveXObject(t);
                        o.onreadystatechange = r;
                    } catch (ex) {
                        alert("You need to enable active scripting and activeX ts.." + ex);
                    }
                } else {
                    o = new XMLHttpRequest();
                    o.onload = r;
                    o.onerror = r;
                }
            }
        </script>
        <style>
            body {
                /* 	background: #f1f1f1; */
                margin: 0px;
                padding: 0px;
                font-family: "Philosopher", "Bitstream Vera Sans", "Lucida Grande", "Trebuchet MS",Arial, Helvetica, sans-serif !important;
            }
            .matchprent{
                width: 100%;
                height: 100%;
            }
        </style>
        <style>
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

            table {
                width: 100%;
                border-collapse: collapse;
            }

            td {
                padding: 10px;
                font-size: 13px;
                border-bottom: 1px solid #ddd;
            }

            tr:hover {
                background-color: #f0f0f0;
            }
        </style>

        <script>
            function setActiveTab(tabElement, tabId) {
                document.querySelectorAll('.tab-item').forEach(tab => tab.classList.remove('active-tab'));
                document.querySelectorAll('.tab-pane').forEach(pane => pane.classList.remove('active-content'));
                tabElement.classList.add('active-tab');
                document.getElementById(tabId).classList.add('active-content');
            }
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
        <script>
            const printableObject = {
                meta: {},
                clocking: [],
            };

            // Helper function to populate a single row with data from DTO (global scope)
            function populateRowData(rowIndex, rowData) {
                if (!rowData) {
                    console.log("No row data for row", rowIndex);
                    return;
                }

                console.log("Populating row", rowIndex, "with data:", rowData);

                // Populate 8 work period columns
                for (let col = 1; col <= 8; col++) {
                    const startVal = rowData['startRow' + rowIndex + 'Col' + col];
                    const endVal = rowData['endRow' + rowIndex + 'Col' + col];

                    const startInput = $('input[name="startRow' + rowIndex + 'Col' + col + '"]');
                    const endInput = $('input[name="endRow' + rowIndex + 'Col' + col + '"]');

                    if (startInput.length > 0 && startVal) {
                        // Convert LocalTime to HH:mm format if needed
                        let startTimeStr = startVal;
                        if (typeof startVal === 'string' && startVal.includes('T')) {
                            startTimeStr = startVal.split('T')[1].substring(0, 5);
                        } else if (typeof startVal === 'object' && startVal.hour !== undefined) {
                            startTimeStr = String(startVal.hour).padStart(2, '0') + ':' + String(startVal.minute).padStart(2, '0');
                        }
                        startInput.val(startTimeStr);
                    }
                    if (endInput.length > 0 && endVal) {
                        // Convert LocalTime to HH:mm format if needed
                        let endTimeStr = endVal;
                        if (typeof endVal === 'string' && endVal.includes('T')) {
                            endTimeStr = endVal.split('T')[1].substring(0, 5);
                        } else if (typeof endVal === 'object' && endVal.hour !== undefined) {
                            endTimeStr = String(endVal.hour).padStart(2, '0') + ':' + String(endVal.minute).padStart(2, '0');
                        }
                        endInput.val(endTimeStr);
                    }
                }

                // Populate break and total hours
                const breakVal = rowData['break' + rowIndex];
                const totalHoursVal = rowData['totalHoursCell' + rowIndex];

                const breakInput = $('input[name="break' + rowIndex + '"]');
                const totalHoursInput = $('input[name="totalHoursCell' + rowIndex + '"]');

                if (breakInput.length > 0 && breakVal) {
                    let breakStr = breakVal;
                    if (typeof breakVal === 'string' && breakVal.includes('T')) {
                        breakStr = breakVal.split('T')[1].substring(0, 5);
                    } else if (typeof breakVal === 'object' && breakVal.hour !== undefined) {
                        breakStr = String(breakVal.hour).padStart(2, '0') + ':' + String(breakVal.minute).padStart(2, '0');
                    }
                    breakInput.val(breakStr);
                }
                if (totalHoursInput.length > 0 && totalHoursVal) {
                    let totalStr = totalHoursVal;
                    if (typeof totalHoursVal === 'string' && totalHoursVal.includes('T')) {
                        totalStr = totalHoursVal.split('T')[1].substring(0, 5);
                    } else if (typeof totalHoursVal === 'object' && totalHoursVal.hour !== undefined) {
                        totalStr = String(totalHoursVal.hour).padStart(2, '0') + ':' + String(totalHoursVal.minute).padStart(2, '0');
                    }
                    totalHoursInput.val(totalStr);
                }

                // Add to printable object
                const firstStart = rowData['startRow' + rowIndex + 'Col1'];
                const lastEnd = rowData['endRow' + rowIndex + 'Col8'];
                printableObject.clocking.push({
                    clockIn: firstStart || null,
                    clockOut: lastEnd || null,
                    breakTime: breakVal || null,
                    totalHrs: totalHoursVal || null
                });
            }

            // Helper function to update timesheet header (global scope)
            function updateTimesheetHeader() {
                const fromDate = $("#fromDate").val();
                const toDate = $("#toDate").val();

                let headerText = "Employee Timesheet";
                if (fromDate && toDate) {
                    headerText = fromDate + " to " + toDate + " Employee Timesheet";
                } else if (fromDate) {
                    headerText = fromDate + " Employee Timesheet";
                }

                $("#timesheetDateRange").text(headerText);
            }

            $(document).ready(function () {
                $('#custTableBody').on('click', '.employee-row', function () {
                    const employeeId = $(this).data('id');
                    console.log("Employee ID:", employeeId);

                    if (!employeeId) {
                        console.warn("No employee ID found on row.");
                        return;
                    }
                    employeeIdForEdit = employeeId;
                    employeeIdForDelete = employeeId;

                    // Get date range from form inputs
                    const fromDate = $("#fromDate").val();
                    const toDate = $("#toDate").val();

                    // Helper function to get Sunday of the week (local scope)
                    function getSunday(date) {
                        const d = new Date(date);
                        const day = d.getDay();
                        const diff = d.getDate() - day;
                        return new Date(d.setDate(diff));
                    }

                    // Use date range if available, otherwise use current week
                    let fromDateStr = fromDate;
                    let toDateStr = toDate;

                    if (!fromDateStr || !toDateStr) {
                        const today = new Date();
                        const sunday = getSunday(today);
                        fromDateStr = sunday.toISOString().split("T")[0];
                        const saturday = new Date(sunday);
                        saturday.setDate(sunday.getDate() + 6);
                        toDateStr = saturday.toISOString().split("T")[0];
                    }

                    // First, ensure rows are generated based on date range BEFORE making API call
                    if (fromDate && toDate) {
                        // Generate rows based on date range
                        const startDate = new Date(fromDate);
                        const endDate = new Date(toDate);

                        // Clear existing rows
                        $("#timesheetBody").empty();

                        // Generate rows for each day in the range
                        let rowIndex = 1;
                        const currentDate = new Date(startDate);
                        const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                        while (currentDate <= endDate) {
                            const dayName = weekDays[currentDate.getDay()];
                            const dateFormatted = currentDate.getFullYear() + "-" +
                                String(currentDate.getMonth() + 1).padStart(2, "0") + "-" +
                                String(currentDate.getDate()).padStart(2, "0");
                            const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                            let rowHTML = '<tr id="row' + rowIndex + '">';
                            rowHTML += '<td class="day" id="day' + rowIndex + '">' + dayName + '</td>';
                            rowHTML += '<input name="d' + rowIndex + 'ay" type="hidden" id="hiddenDay' + rowIndex + '" value="' + dayName + '" />';
                            rowHTML += '<td class="date" id="date' + rowIndex + '">' + dateFormatted + '</td>';
                            rowHTML += '<input name="w' + rowIndex + 'orkDate" id="hiddenDate' + rowIndex + '" type="hidden" value="' + dateFormatted + '" />';

                            // Generate 8 work period columns
                            for (let col = 1; col <= 8; col++) {
                                const inputIdS = "s" + col + suffix;
                                const inputIdE = "e" + col + suffix;
                                const nameS = "startRow" + rowIndex + "Col" + col;
                                const nameE = "endRow" + rowIndex + "Col" + col;
                                rowHTML += '<td><input type="time" id="' + inputIdS + '" name="' + nameS + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                                rowHTML += '<td><input type="time" id="' + inputIdE + '" name="' + nameE + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                            }

                            // Break and Total Hours
                            rowHTML += '<td><input type="text" id="break' + rowIndex + '" name="break' + rowIndex + '" readonly style="width:70px"/></td>';
                            rowHTML += '<td><input type="text" id="totalHoursCell' + rowIndex + '" name="totalHoursCell' + rowIndex + '" readonly/></td>';
                            rowHTML += '</tr>';

                            $("#timesheetBody").append(rowHTML);
                            currentDate.setDate(currentDate.getDate() + 1);
                            rowIndex++;
                        }

                        // Update header
                        updateTimesheetHeader();
                    } else {
                        // Fallback: generate current week
                        const today = new Date();
                        const sunday = getSunday(today);
                        const startDate = new Date(sunday);
                        const endDate = new Date(sunday);
                        endDate.setDate(sunday.getDate() + 6);

                        // Set date inputs
                        $("#fromDate").val(startDate.toISOString().split("T")[0]);
                        $("#toDate").val(endDate.toISOString().split("T")[0]);

                        // Generate rows
                        $("#timesheetBody").empty();
                        let rowIndex = 1;
                        const currentDate = new Date(startDate);
                        const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                        while (currentDate <= endDate) {
                            const dayName = weekDays[currentDate.getDay()];
                            const dateFormatted = currentDate.getFullYear() + "-" +
                                String(currentDate.getMonth() + 1).padStart(2, "0") + "-" +
                                String(currentDate.getDate()).padStart(2, "0");
                            const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                            let rowHTML = '<tr id="row' + rowIndex + '">';
                            rowHTML += '<td class="day" id="day' + rowIndex + '">' + dayName + '</td>';
                            rowHTML += '<input name="d' + rowIndex + 'ay" type="hidden" id="hiddenDay' + rowIndex + '" value="' + dayName + '" />';
                            rowHTML += '<td class="date" id="date' + rowIndex + '">' + dateFormatted + '</td>';
                            rowHTML += '<input name="w' + rowIndex + 'orkDate" id="hiddenDate' + rowIndex + '" type="hidden" value="' + dateFormatted + '" />';

                            for (let col = 1; col <= 8; col++) {
                                const inputIdS = "s" + col + suffix;
                                const inputIdE = "e" + col + suffix;
                                const nameS = "startRow" + rowIndex + "Col" + col;
                                const nameE = "endRow" + rowIndex + "Col" + col;
                                rowHTML += '<td><input type="time" id="' + inputIdS + '" name="' + nameS + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                                rowHTML += '<td><input type="time" id="' + inputIdE + '" name="' + nameE + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                            }

                            rowHTML += '<td><input type="text" id="break' + rowIndex + '" name="break' + rowIndex + '" readonly style="width:70px"/></td>';
                            rowHTML += '<td><input type="text" id="totalHoursCell' + rowIndex + '" name="totalHoursCell' + rowIndex + '" readonly/></td>';
                            rowHTML += '</tr>';

                            $("#timesheetBody").append(rowHTML);
                            currentDate.setDate(currentDate.getDate() + 1);
                            rowIndex++;
                        }

                        updateTimesheetHeader();
                        fromDateStr = startDate.toISOString().split("T")[0];
                        toDateStr = endDate.toISOString().split("T")[0];
                    }

                    const apiUrl = `/api/timesheet/` + employeeId + `/` + fromDateStr + `/` + toDateStr;
                    console.log("Calling:", apiUrl);

                    $.ajax({
                        url: apiUrl,
                        type: 'GET',
                        success: function (data) {
                            console.log("Form Data1:", data);

                            if (data) {
                                $('input[name="employeeId"]').val(employeeId || '');
                                printableObject.meta.employeeId = employeeId || '';
                                printableObject.clocking = []; // Reset clocking array

                                // Get number of rows from the table
                                const rowCount = $('#timesheetBody tr').length;
                                console.log("Row count:", rowCount);

                                // Dynamically populate all rows
                                for (let rowIndex = 1; rowIndex <= rowCount; rowIndex++) {
                                    populateRowData(rowIndex, data);
                                }

                                // Legacy code for backward compatibility (keeping for now)
                                // Row 1 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 1) {
                                    $('input[name="startRow1Col1"]').val(data.startRow1Col1 || '');
                                    $('input[name="endRow1Col1"]').val(data.endRow1Col1 || '');


                                $('input[name="startRow1Col2"]').val(data.startRow1Col2 || '');
                                $('input[name="endRow1Col2"]').val(data.endRow1Col2 || '');

                                $('input[name="startRow1Col3"]').val(data.startRow1Col3 || '');
                                $('input[name="endRow1Col3"]').val(data.endRow1Col3 || '');

                                $('input[name="startRow1Col4"]').val(data.startRow1Col4 || '');
                                $('input[name="endRow1Col4"]').val(data.endRow1Col4 || '');

                                $('input[name="startRow1Col5"]').val(data.startRow1Col5 || '');
                                $('input[name="endRow1Col5"]').val(data.endRow1Col5 || '');

                                $('input[name="startRow1Col6"]').val(data.startRow1Col6 || '');
                                $('input[name="endRow1Col6"]').val(data.endRow1Col6 || '');

                                $('input[name="startRow1Col7"]').val(data.startRow1Col7 || '');
                                $('input[name="endRow1Col7"]').val(data.endRow1Col7 || '');

                                $('input[name="startRow1Col8"]').val(data.startRow1Col8 || '');
                                $('input[name="endRow1Col8"]').val(data.endRow1Col8 || '');



                                }

                                // Break & Total Hours for Row 1
                                if (rowCount >= 1) {
                                    $('input[name="break1"]').val(data.break1 || '');
                                    $('input[name="totalHoursCell1"]').val(data.totalHoursCell1 || '');
                                }

                                // Row 2 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 2) {
                                $('input[name="startRow2Col1"]').val(data.startRow2Col1 || '');
                                $('input[name="endRow2Col1"]').val(data.endRow2Col1 || '');

                                $('input[name="startRow2Col2"]').val(data.startRow2Col2 || '');
                                $('input[name="endRow2Col2"]').val(data.endRow2Col2 || '');

                                $('input[name="startRow2Col3"]').val(data.startRow2Col3 || '');
                                $('input[name="endRow2Col3"]').val(data.endRow2Col3 || '');

                                $('input[name="startRow2Col4"]').val(data.startRow2Col4 || '');
                                $('input[name="endRow2Col4"]').val(data.endRow2Col4 || '');

                                $('input[name="startRow2Col5"]').val(data.startRow2Col5 || '');
                                $('input[name="endRow2Col5"]').val(data.endRow2Col5 || '');

                                $('input[name="startRow2Col6"]').val(data.startRow2Col6 || '');
                                $('input[name="endRow2Col6"]').val(data.endRow2Col6 || '');

                                $('input[name="startRow2Col7"]').val(data.startRow2Col7 || '');
                                $('input[name="endRow2Col7"]').val(data.endRow2Col7 || '');

                                $('input[name="startRow2Col8"]').val(data.startRow2Col8 || '');
                                $('input[name="endRow2Col8"]').val(data.endRow2Col8 || '');

                                }

                                // Break & Total Hours for Row 2
                                if (rowCount >= 2) {
                                    $('input[name="break2"]').val(data.break2 || '');
                                    $('input[name="totalHoursCell2"]').val(data.totalHoursCell2 || '');
                                }

                                // Row 3 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 3) {
                                $('input[name="startRow3Col1"]').val(data.startRow3Col1 || '');
                                $('input[name="endRow3Col1"]').val(data.endRow3Col1 || '');

                                $('input[name="startRow3Col2"]').val(data.startRow3Col2 || '');
                                $('input[name="endRow3Col2"]').val(data.endRow3Col2 || '');

                                $('input[name="startRow3Col3"]').val(data.startRow3Col3 || '');
                                $('input[name="endRow3Col3"]').val(data.endRow3Col3 || '');

                                $('input[name="startRow3Col4"]').val(data.startRow3Col4 || '');
                                $('input[name="endRow3Col4"]').val(data.endRow3Col4 || '');

                                $('input[name="startRow3Col5"]').val(data.startRow3Col5 || '');
                                $('input[name="endRow3Col5"]').val(data.endRow3Col5 || '');

                                $('input[name="startRow3Col6"]').val(data.startRow3Col6 || '');
                                $('input[name="endRow3Col6"]').val(data.endRow3Col6 || '');

                                $('input[name="startRow3Col7"]').val(data.startRow3Col7 || '');
                                $('input[name="endRow3Col7"]').val(data.endRow3Col7 || '');

                                $('input[name="startRow3Col8"]').val(data.startRow3Col8 || '');
                                $('input[name="endRow3Col8"]').val(data.endRow3Col8 || '');

                                }

                                // Break & Total Hours for Row 3
                                if (rowCount >= 3) {
                                    $('input[name="break3"]').val(data.break3 || '');
                                    $('input[name="totalHoursCell3"]').val(data.totalHoursCell3 || '');
                                }

                                // Row 4 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 4) {
                                $('input[name="startRow4Col1"]').val(data.startRow4Col1 || '');
                                $('input[name="endRow4Col1"]').val(data.endRow4Col1 || '');

                                $('input[name="startRow4Col2"]').val(data.startRow4Col2 || '');
                                $('input[name="endRow4Col2"]').val(data.endRow4Col2 || '');

                                $('input[name="startRow4Col3"]').val(data.startRow4Col3 || '');
                                $('input[name="endRow4Col3"]').val(data.endRow4Col3 || '');

                                $('input[name="startRow4Col4"]').val(data.startRow4Col4 || '');
                                $('input[name="endRow4Col4"]').val(data.endRow4Col4 || '');

                                $('input[name="startRow4Col5"]').val(data.startRow4Col5 || '');
                                $('input[name="endRow4Col5"]').val(data.endRow4Col5 || '');

                                $('input[name="startRow4Col6"]').val(data.startRow4Col6 || '');
                                $('input[name="endRow4Col6"]').val(data.endRow4Col6 || '');

                                $('input[name="startRow4Col7"]').val(data.startRow4Col7 || '');
                                $('input[name="endRow4Col7"]').val(data.endRow4Col7 || '');

                                $('input[name="startRow4Col8"]').val(data.startRow4Col8 || '');
                                $('input[name="endRow4Col8"]').val(data.endRow4Col8 || '');

                                }

                                // Break & Total Hours for Row 4
                                if (rowCount >= 4) {
                                    $('input[name="break4"]').val(data.break4 || '');
                                    $('input[name="totalHoursCell4"]').val(data.totalHoursCell4 || '');
                                }

                                // Row 5 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 5) {
                                $('input[name="startRow5Col1"]').val(data.startRow5Col1 || '');
                                $('input[name="endRow5Col1"]').val(data.endRow5Col1 || '');

                                $('input[name="startRow5Col2"]').val(data.startRow5Col2 || '');
                                $('input[name="endRow5Col2"]').val(data.endRow5Col2 || '');

                                $('input[name="startRow5Col3"]').val(data.startRow5Col3 || '');
                                $('input[name="endRow5Col3"]').val(data.endRow5Col3 || '');

                                $('input[name="startRow5Col4"]').val(data.startRow5Col4 || '');
                                $('input[name="endRow5Col4"]').val(data.endRow5Col4 || '');

                                $('input[name="startRow5Col5"]').val(data.startRow5Col5 || '');
                                $('input[name="endRow5Col5"]').val(data.endRow5Col5 || '');

                                $('input[name="startRow5Col6"]').val(data.startRow5Col6 || '');
                                $('input[name="endRow5Col6"]').val(data.endRow5Col6 || '');

                                $('input[name="startRow5Col7"]').val(data.startRow5Col7 || '');
                                $('input[name="endRow5Col7"]').val(data.endRow5Col7 || '');

                                $('input[name="startRow5Col8"]').val(data.startRow5Col8 || '');
                                $('input[name="endRow5Col8"]').val(data.endRow5Col8 || '');

                                }

                                // Break & Total Hours for Row 5
                                if (rowCount >= 5) {
                                    $('input[name="break5"]').val(data.break5 || '');
                                    $('input[name="totalHoursCell5"]').val(data.totalHoursCell5 || '');
                                }

                                // Row 6 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 6) {
                                $('input[name="startRow6Col1"]').val(data.startRow6Col1 || '');
                                $('input[name="endRow6Col1"]').val(data.endRow6Col1 || '');

                                $('input[name="startRow6Col2"]').val(data.startRow6Col2 || '');
                                $('input[name="endRow6Col2"]').val(data.endRow6Col2 || '');

                                $('input[name="startRow6Col3"]').val(data.startRow6Col3 || '');
                                $('input[name="endRow6Col3"]').val(data.endRow6Col3 || '');

                                $('input[name="startRow6Col4"]').val(data.startRow6Col4 || '');
                                $('input[name="endRow6Col4"]').val(data.endRow6Col4 || '');

                                $('input[name="startRow6Col5"]').val(data.startRow6Col5 || '');
                                $('input[name="endRow6Col5"]').val(data.endRow6Col5 || '');

                                $('input[name="startRow6Col6"]').val(data.startRow6Col6 || '');
                                $('input[name="endRow6Col6"]').val(data.endRow6Col6 || '');

                                $('input[name="startRow6Col7"]').val(data.startRow6Col7 || '');
                                $('input[name="endRow6Col7"]').val(data.endRow6Col7 || '');

                                $('input[name="startRow6Col8"]').val(data.startRow6Col8 || '');
                                $('input[name="endRow6Col8"]').val(data.endRow6Col8 || '');

                                }

                                // Break & Total Hours for Row 6
                                if (rowCount >= 6) {
                                    $('input[name="break6"]').val(data.break6 || '');
                                    $('input[name="totalHoursCell6"]').val(data.totalHoursCell6 || '');
                                }

                                // Row 7 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 7) {
                                $('input[name="startRow7Col1"]').val(data.startRow7Col1 || '');
                                $('input[name="endRow7Col1"]').val(data.endRow7Col1 || '');

                                $('input[name="startRow7Col2"]').val(data.startRow7Col2 || '');
                                $('input[name="endRow7Col2"]').val(data.endRow7Col2 || '');

                                $('input[name="startRow7Col3"]').val(data.startRow7Col3 || '');
                                $('input[name="endRow7Col3"]').val(data.endRow7Col3 || '');

                                $('input[name="startRow7Col4"]').val(data.startRow7Col4 || '');
                                $('input[name="endRow7Col4"]').val(data.endRow7Col4 || '');

                                $('input[name="startRow7Col5"]').val(data.startRow7Col5 || '');
                                $('input[name="endRow7Col5"]').val(data.endRow7Col5 || '');

                                $('input[name="startRow7Col6"]').val(data.startRow7Col6 || '');
                                $('input[name="endRow7Col6"]').val(data.endRow7Col6 || '');

                                $('input[name="startRow7Col7"]').val(data.startRow7Col7 || '');
                                $('input[name="endRow7Col7"]').val(data.endRow7Col7 || '');

                                $('input[name="startRow7Col8"]').val(data.startRow7Col8 || '');
                                $('input[name="endRow7Col8"]').val(data.endRow7Col8 || '');



                                }

                                // Break & Total Hours for Row 7
                                if (rowCount >= 7) {
                                    $('input[name="break7"]').val(data.break7 || '');
                                    $('input[name="totalHoursCell7"]').val(data.totalHoursCell7 || '');
                                }



                            } else {
                                console.warn("No data returned " + employeeId);
                                // Clear all input fields and checkboxes
                                $('input[name="employeeId"]').val(employeeId || '');
                            }
                        },
                        error: function (xhr) {
                            console.error("Failed to fetch data:", xhr.status, xhr.responseText);
                            alert('Form data not found.');
                        }
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#custTableBody2').on('click', '.employee-row', function () {
                    const employeeId = $(this).data('id');
                    console.log("Employee ID:", employeeId);

                    if (!employeeId) {
                        console.warn("No employee ID found on row.");
                        return;
                    }
                    employeeIdForEdit = employeeId;
                    employeeIdForDelete = employeeId;

                    // Helper function to get Sunday of the week (local scope)
                    function getSunday(date) {
                        const d = new Date(date);
                        const day = d.getDay();
                        const diff = d.getDate() - day;
                        return new Date(d.setDate(diff));
                    }

                    // Get date range from form inputs
                    const fromDate = $("#fromDate").val();
                    const toDate = $("#toDate").val();

                    // Use date range if available, otherwise use current week
                    let fromDateStr = fromDate;
                    let toDateStr = toDate;

                    if (!fromDateStr || !toDateStr) {
                        const today = new Date();
                        const sunday = getSunday(today);
                        fromDateStr = sunday.toISOString().split("T")[0];
                        const saturday = new Date(sunday);
                        saturday.setDate(sunday.getDate() + 6);
                        toDateStr = saturday.toISOString().split("T")[0];
                    }

                    // First, ensure rows are generated based on date range BEFORE making API call
                    if (fromDate && toDate) {
                        // Generate rows based on date range
                        const startDate = new Date(fromDate);
                        const endDate = new Date(toDate);

                        // Clear existing rows
                        $("#timesheetBody").empty();

                        // Generate rows for each day in the range
                        let rowIndex = 1;
                        const currentDate = new Date(startDate);
                        const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                        while (currentDate <= endDate) {
                            const dayName = weekDays[currentDate.getDay()];
                            const dateFormatted = currentDate.getFullYear() + "-" +
                                String(currentDate.getMonth() + 1).padStart(2, "0") + "-" +
                                String(currentDate.getDate()).padStart(2, "0");
                            const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                            let rowHTML = '<tr id="row' + rowIndex + '">';
                            rowHTML += '<td class="day" id="day' + rowIndex + '">' + dayName + '</td>';
                            rowHTML += '<input name="d' + rowIndex + 'ay" type="hidden" id="hiddenDay' + rowIndex + '" value="' + dayName + '" />';
                            rowHTML += '<td class="date" id="date' + rowIndex + '">' + dateFormatted + '</td>';
                            rowHTML += '<input name="w' + rowIndex + 'orkDate" id="hiddenDate' + rowIndex + '" type="hidden" value="' + dateFormatted + '" />';

                            // Generate 8 work period columns
                            for (let col = 1; col <= 8; col++) {
                                const inputIdS = "s" + col + suffix;
                                const inputIdE = "e" + col + suffix;
                                const nameS = "startRow" + rowIndex + "Col" + col;
                                const nameE = "endRow" + rowIndex + "Col" + col;
                                rowHTML += '<td><input type="time" id="' + inputIdS + '" name="' + nameS + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                                rowHTML += '<td><input type="time" id="' + inputIdE + '" name="' + nameE + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                            }

                            // Break and Total Hours
                            rowHTML += '<td><input type="text" id="break' + rowIndex + '" name="break' + rowIndex + '" readonly style="width:70px"/></td>';
                            rowHTML += '<td><input type="text" id="totalHoursCell' + rowIndex + '" name="totalHoursCell' + rowIndex + '" readonly/></td>';
                            rowHTML += '</tr>';

                            $("#timesheetBody").append(rowHTML);
                            currentDate.setDate(currentDate.getDate() + 1);
                            rowIndex++;
                        }

                        // Update header
                        updateTimesheetHeader();
                    } else {
                        // Fallback: generate current week
                        const today = new Date();
                        const sunday = getSunday(today);
                        const startDate = new Date(sunday);
                        const endDate = new Date(sunday);
                        endDate.setDate(sunday.getDate() + 6);

                        // Set date inputs
                        $("#fromDate").val(startDate.toISOString().split("T")[0]);
                        $("#toDate").val(endDate.toISOString().split("T")[0]);

                        // Generate rows
                        $("#timesheetBody").empty();
                        let rowIndex = 1;
                        const currentDate = new Date(startDate);
                        const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                        while (currentDate <= endDate) {
                            const dayName = weekDays[currentDate.getDay()];
                            const dateFormatted = currentDate.getFullYear() + "-" +
                                String(currentDate.getMonth() + 1).padStart(2, "0") + "-" +
                                String(currentDate.getDate()).padStart(2, "0");
                            const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                            let rowHTML = '<tr id="row' + rowIndex + '">';
                            rowHTML += '<td class="day" id="day' + rowIndex + '">' + dayName + '</td>';
                            rowHTML += '<input name="d' + rowIndex + 'ay" type="hidden" id="hiddenDay' + rowIndex + '" value="' + dayName + '" />';
                            rowHTML += '<td class="date" id="date' + rowIndex + '">' + dateFormatted + '</td>';
                            rowHTML += '<input name="w' + rowIndex + 'orkDate" id="hiddenDate' + rowIndex + '" type="hidden" value="' + dateFormatted + '" />';

                            for (let col = 1; col <= 8; col++) {
                                const inputIdS = "s" + col + suffix;
                                const inputIdE = "e" + col + suffix;
                                const nameS = "startRow" + rowIndex + "Col" + col;
                                const nameE = "endRow" + rowIndex + "Col" + col;
                                rowHTML += '<td><input type="time" id="' + inputIdS + '" name="' + nameS + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                                rowHTML += '<td><input type="time" id="' + inputIdE + '" name="' + nameE + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                            }

                            rowHTML += '<td><input type="text" id="break' + rowIndex + '" name="break' + rowIndex + '" readonly style="width:70px"/></td>';
                            rowHTML += '<td><input type="text" id="totalHoursCell' + rowIndex + '" name="totalHoursCell' + rowIndex + '" readonly/></td>';
                            rowHTML += '</tr>';

                            $("#timesheetBody").append(rowHTML);
                            currentDate.setDate(currentDate.getDate() + 1);
                            rowIndex++;
                        }

                        updateTimesheetHeader();
                        fromDateStr = startDate.toISOString().split("T")[0];
                        toDateStr = endDate.toISOString().split("T")[0];
                    }

                    const apiUrl = `/api/timesheet/` + employeeId + `/` + fromDateStr + `/` + toDateStr;
                    console.log("Calling:", apiUrl);

                    $.ajax({
                        url: apiUrl,
                        type: 'GET',
                        success: function (data) {
                            console.log("Form Data1:", data);

                            if (data) {
                                $('input[name="employeeId"]').val(employeeId || '');
                                printableObject.meta.employeeId = employeeId || '';
                                printableObject.clocking = []; // Reset clocking array

                                // Get number of rows from the table
                                const rowCount = $('#timesheetBody tr').length;
                                console.log("Row count:", rowCount);

                                // Dynamically populate all rows
                                for (let rowIndex = 1; rowIndex <= rowCount; rowIndex++) {
                                    populateRowData(rowIndex, data);
                                }

                                // Legacy code for backward compatibility
                                // Row 1 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 1) {
                                    $('input[name="startRow1Col1"]').val(data.startRow1Col1 || '');
                                    $('input[name="endRow1Col1"]').val(data.endRow1Col1 || '');

                                $('input[name="startRow1Col2"]').val(data.startRow1Col2 || '');
                                $('input[name="endRow1Col2"]').val(data.endRow1Col2 || '');

                                $('input[name="startRow1Col3"]').val(data.startRow1Col3 || '');
                                $('input[name="endRow1Col3"]').val(data.endRow1Col3 || '');

                                $('input[name="startRow1Col4"]').val(data.startRow1Col4 || '');
                                $('input[name="endRow1Col4"]').val(data.endRow1Col4 || '');

                                $('input[name="startRow1Col5"]').val(data.startRow1Col5 || '');
                                $('input[name="endRow1Col5"]').val(data.endRow1Col5 || '');

                                $('input[name="startRow1Col6"]').val(data.startRow1Col6 || '');
                                $('input[name="endRow1Col6"]').val(data.endRow1Col6 || '');

                                $('input[name="startRow1Col7"]').val(data.startRow1Col7 || '');
                                $('input[name="endRow1Col7"]').val(data.endRow1Col7 || '');

                                $('input[name="startRow1Col8"]').val(data.startRow1Col8 || '');
                                $('input[name="endRow1Col8"]').val(data.endRow1Col8 || '');

                                }

                                // Break & Total Hours for Row 1
                                if (rowCount >= 1) {
                                    $('input[name="break1"]').val(data.break1 || '');
                                    $('input[name="totalHoursCell1"]').val(data.totalHoursCell1 || '');
                                }

                                // Row 2 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 2) {
                                    $('input[name="startRow2Col1"]').val(data.startRow2Col1 || '');
                                    $('input[name="endRow2Col1"]').val(data.endRow2Col1 || '');

                                $('input[name="startRow2Col2"]').val(data.startRow2Col2 || '');
                                $('input[name="endRow2Col2"]').val(data.endRow2Col2 || '');

                                $('input[name="startRow2Col3"]').val(data.startRow2Col3 || '');
                                $('input[name="endRow2Col3"]').val(data.endRow2Col3 || '');

                                $('input[name="startRow2Col4"]').val(data.startRow2Col4 || '');
                                $('input[name="endRow2Col4"]').val(data.endRow2Col4 || '');

                                $('input[name="startRow2Col5"]').val(data.startRow2Col5 || '');
                                $('input[name="endRow2Col5"]').val(data.endRow2Col5 || '');

                                $('input[name="startRow2Col6"]').val(data.startRow2Col6 || '');
                                $('input[name="endRow2Col6"]').val(data.endRow2Col6 || '');

                                $('input[name="startRow2Col7"]').val(data.startRow2Col7 || '');
                                $('input[name="endRow2Col7"]').val(data.endRow2Col7 || '');

                                $('input[name="startRow2Col8"]').val(data.startRow2Col8 || '');
                                $('input[name="endRow2Col8"]').val(data.endRow2Col8 || '');

                                }

                                // Break & Total Hours for Row 2
                                if (rowCount >= 2) {
                                    $('input[name="break2"]').val(data.break2 || '');
                                    $('input[name="totalHoursCell2"]').val(data.totalHoursCell2 || '');
                                }

                                // Row 3 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 3) {
                                    $('input[name="startRow3Col1"]').val(data.startRow3Col1 || '');
                                $('input[name="endRow3Col1"]').val(data.endRow3Col1 || '');

                                $('input[name="startRow3Col2"]').val(data.startRow3Col2 || '');
                                $('input[name="endRow3Col2"]').val(data.endRow3Col2 || '');

                                $('input[name="startRow3Col3"]').val(data.startRow3Col3 || '');
                                $('input[name="endRow3Col3"]').val(data.endRow3Col3 || '');

                                $('input[name="startRow3Col4"]').val(data.startRow3Col4 || '');
                                $('input[name="endRow3Col4"]').val(data.endRow3Col4 || '');

                                $('input[name="startRow3Col5"]').val(data.startRow3Col5 || '');
                                $('input[name="endRow3Col5"]').val(data.endRow3Col5 || '');

                                $('input[name="startRow3Col6"]').val(data.startRow3Col6 || '');
                                $('input[name="endRow3Col6"]').val(data.endRow3Col6 || '');

                                $('input[name="startRow3Col7"]').val(data.startRow3Col7 || '');
                                $('input[name="endRow3Col7"]').val(data.endRow3Col7 || '');

                                $('input[name="startRow3Col8"]').val(data.startRow3Col8 || '');
                                $('input[name="endRow3Col8"]').val(data.endRow3Col8 || '');

                                }

                                // Break & Total Hours for Row 3
                                if (rowCount >= 3) {
                                    $('input[name="break3"]').val(data.break3 || '');
                                    $('input[name="totalHoursCell3"]').val(data.totalHoursCell3 || '');
                                }

                                // Row 4 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 4) {
                                    $('input[name="startRow4Col1"]').val(data.startRow4Col1 || '');
                                $('input[name="endRow4Col1"]').val(data.endRow4Col1 || '');

                                $('input[name="startRow4Col2"]').val(data.startRow4Col2 || '');
                                $('input[name="endRow4Col2"]').val(data.endRow4Col2 || '');

                                $('input[name="startRow4Col3"]').val(data.startRow4Col3 || '');
                                $('input[name="endRow4Col3"]').val(data.endRow4Col3 || '');

                                $('input[name="startRow4Col4"]').val(data.startRow4Col4 || '');
                                $('input[name="endRow4Col4"]').val(data.endRow4Col4 || '');

                                $('input[name="startRow4Col5"]').val(data.startRow4Col5 || '');
                                $('input[name="endRow4Col5"]').val(data.endRow4Col5 || '');

                                $('input[name="startRow4Col6"]').val(data.startRow4Col6 || '');
                                $('input[name="endRow4Col6"]').val(data.endRow4Col6 || '');

                                $('input[name="startRow4Col7"]').val(data.startRow4Col7 || '');
                                $('input[name="endRow4Col7"]').val(data.endRow4Col7 || '');

                                $('input[name="startRow4Col8"]').val(data.startRow4Col8 || '');
                                $('input[name="endRow4Col8"]').val(data.endRow4Col8 || '');

                                }

                                // Break & Total Hours for Row 4
                                if (rowCount >= 4) {
                                    $('input[name="break4"]').val(data.break4 || '');
                                    $('input[name="totalHoursCell4"]').val(data.totalHoursCell4 || '');
                                }

                                // Row 5 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 5) {
                                    $('input[name="startRow5Col1"]').val(data.startRow5Col1 || '');
                                $('input[name="endRow5Col1"]').val(data.endRow5Col1 || '');

                                $('input[name="startRow5Col2"]').val(data.startRow5Col2 || '');
                                $('input[name="endRow5Col2"]').val(data.endRow5Col2 || '');

                                $('input[name="startRow5Col3"]').val(data.startRow5Col3 || '');
                                $('input[name="endRow5Col3"]').val(data.endRow5Col3 || '');

                                $('input[name="startRow5Col4"]').val(data.startRow5Col4 || '');
                                $('input[name="endRow5Col4"]').val(data.endRow5Col4 || '');

                                $('input[name="startRow5Col5"]').val(data.startRow5Col5 || '');
                                $('input[name="endRow5Col5"]').val(data.endRow5Col5 || '');

                                $('input[name="startRow5Col6"]').val(data.startRow5Col6 || '');
                                $('input[name="endRow5Col6"]').val(data.endRow5Col6 || '');

                                $('input[name="startRow5Col7"]').val(data.startRow5Col7 || '');
                                $('input[name="endRow5Col7"]').val(data.endRow5Col7 || '');

                                $('input[name="startRow5Col8"]').val(data.startRow5Col8 || '');
                                $('input[name="endRow5Col8"]').val(data.endRow5Col8 || '');

                                }

                                // Break & Total Hours for Row 5
                                if (rowCount >= 5) {
                                    $('input[name="break5"]').val(data.break5 || '');
                                    $('input[name="totalHoursCell5"]').val(data.totalHoursCell5 || '');
                                }

                                // Row 6 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 6) {
                                    $('input[name="startRow6Col1"]').val(data.startRow6Col1 || '');
                                $('input[name="endRow6Col1"]').val(data.endRow6Col1 || '');

                                $('input[name="startRow6Col2"]').val(data.startRow6Col2 || '');
                                $('input[name="endRow6Col2"]').val(data.endRow6Col2 || '');

                                $('input[name="startRow6Col3"]').val(data.startRow6Col3 || '');
                                $('input[name="endRow6Col3"]').val(data.endRow6Col3 || '');

                                $('input[name="startRow6Col4"]').val(data.startRow6Col4 || '');
                                $('input[name="endRow6Col4"]').val(data.endRow6Col4 || '');

                                $('input[name="startRow6Col5"]').val(data.startRow6Col5 || '');
                                $('input[name="endRow6Col5"]').val(data.endRow6Col5 || '');

                                $('input[name="startRow6Col6"]').val(data.startRow6Col6 || '');
                                $('input[name="endRow6Col6"]').val(data.endRow6Col6 || '');

                                $('input[name="startRow6Col7"]').val(data.startRow6Col7 || '');
                                $('input[name="endRow6Col7"]').val(data.endRow6Col7 || '');

                                $('input[name="startRow6Col8"]').val(data.startRow6Col8 || '');
                                $('input[name="endRow6Col8"]').val(data.endRow6Col8 || '');

                                }

                                // Break & Total Hours for Row 6
                                if (rowCount >= 6) {
                                    $('input[name="break6"]').val(data.break6 || '');
                                    $('input[name="totalHoursCell6"]').val(data.totalHoursCell6 || '');
                                }

                                // Row 7 — Start & End Times (Columns 1 to 8)
                                if (rowCount >= 7) {
                                    $('input[name="startRow7Col1"]').val(data.startRow7Col1 || '');
                                $('input[name="endRow7Col1"]').val(data.endRow7Col1 || '');

                                $('input[name="startRow7Col2"]').val(data.startRow7Col2 || '');
                                $('input[name="endRow7Col2"]').val(data.endRow7Col2 || '');

                                $('input[name="startRow7Col3"]').val(data.startRow7Col3 || '');
                                $('input[name="endRow7Col3"]').val(data.endRow7Col3 || '');

                                $('input[name="startRow7Col4"]').val(data.startRow7Col4 || '');
                                $('input[name="endRow7Col4"]').val(data.endRow7Col4 || '');

                                $('input[name="startRow7Col5"]').val(data.startRow7Col5 || '');
                                $('input[name="endRow7Col5"]').val(data.endRow7Col5 || '');

                                $('input[name="startRow7Col6"]').val(data.startRow7Col6 || '');
                                $('input[name="endRow7Col6"]').val(data.endRow7Col6 || '');

                                $('input[name="startRow7Col7"]').val(data.startRow7Col7 || '');
                                $('input[name="endRow7Col7"]').val(data.endRow7Col7 || '');

                                $('input[name="startRow7Col8"]').val(data.startRow7Col8 || '');
                                $('input[name="endRow7Col8"]').val(data.endRow7Col8 || '');

                                }

                                // Break & Total Hours for Row 7
                                if (rowCount >= 7) {
                                    $('input[name="break7"]').val(data.break7 || '');
                                    $('input[name="totalHoursCell7"]').val(data.totalHoursCell7 || '');
                                }


                            } else {
                                console.warn("No data returned " + employeeId);
                                // Clear all input fields and checkboxes
                                $('input[name="employeeId"]').val(employeeId || '');
                            }
                        },
                        error: function (xhr) {
                            console.error("Failed to fetch data:", xhr.status, xhr.responseText);
                            alert('Form data not found.');
                        }
                    });
                });
            });
        </script>
    </head>
    <style>
        .selected-cell {
            background-color: #7b8081 !important;
            color: white !important;
        }
    </style>
    <body>
        <!-- begin shared/header -->
        <div id="ddcolortabsline">&nbsp;</div>
        <div id="cos">

            <span style="color: #05A9C5 !important;font-size: 1.6rem;">
                Employee Timesheet
                <c:if
                    test="${not empty message}">
                    <br /> ${message}
                </c:if>
            </span>
            <br><br>
            <!-- Payroll Period Section -->

            <div class="row">
                <div class="col-sm-3" style="padding-right: 15px; box-sizing: border-box;">
                    <%--<div class="panel">--%>
                    <div style="width: 100%; max-width: 100%; overflow: hidden;">
                        <div class="form-layout">
                            <table>
                                <tr>
                                    <td colspan="4" style="text-align: center; padding: 12px 10px; background-color: #e0e0e0;"><strong>Payroll Period:</strong></td>
                                </tr>
                                <tr>
                                    <td style="width: 20%; text-align: right; padding: 12px 5px 12px 10px; white-space: nowrap;"><strong>From:</strong></td>
                                    <td style="width: 30%; padding: 12px 5px;"><input type="date" id="fromDate" name="from" class="payroll-date-input"/></td>
                                    <td style="width: 15%; text-align: right; padding: 12px 5px; white-space: nowrap;"><strong>To:</strong></td>
                                    <td style="width: 35%; padding: 12px 10px 12px 5px;"><input type="date" id="toDate" name="to" class="payroll-date-input"/></td>
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

                            // Generate a single row HTML for a given row index and date
                            function generateRowHTML(rowIndex, dateObj) {
                                const dayName = weekDays[dateObj.getDay()];
                                const dateFormatted = dateObj.toISOString().split("T")[0];
                                const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                                let rowHTML = '<tr id="row' + rowIndex + '">';
                                rowHTML += '<td class="day" id="day' + rowIndex + '">' + dayName + '</td>';
                                rowHTML += '<input name="d' + rowIndex + 'ay" type="hidden" id="hiddenDay' + rowIndex + '" value="' + dayName + '" />';
                                rowHTML += '<td class="date" id="date' + rowIndex + '">' + dateFormatted + '</td>';
                                rowHTML += '<input name="w' + rowIndex + 'orkDate" id="hiddenDate' + rowIndex + '" type="hidden" value="' + dateFormatted + '" />';

                                // Generate 8 work period columns
                                for (let col = 1; col <= 8; col++) {
                                    const inputIdS = "s" + col + suffix;
                                    const inputIdE = "e" + col + suffix;
                                    const nameS = "startRow" + rowIndex + "Col" + col;
                                    const nameE = "endRow" + rowIndex + "Col" + col;
                                    rowHTML += '<td><input type="time" id="' + inputIdS + '" name="' + nameS + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                                    rowHTML += '<td><input type="time" id="' + inputIdE + '" name="' + nameE + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                                }

                                // Break and Total Hours
                                rowHTML += '<td><input type="text" id="break' + rowIndex + '" name="break' + rowIndex + '" readonly style="width:70px"/></td>';
                                rowHTML += '<td><input type="text" id="totalHoursCell' + rowIndex + '" name="totalHoursCell' + rowIndex + '" readonly/></td>';
                                rowHTML += '</tr>';

                                return rowHTML;
                            }

                            // Update table dynamically based on date range
                            function updateTable(selectedDate) {
                                const fromDate = $("#fromDate").val();
                                const toDate = $("#toDate").val();

                                let startDate, endDate;

                                if (fromDate && toDate) {
                                    startDate = new Date(fromDate);
                                    endDate = new Date(toDate);
                                } else if (fromDate) {
                                    startDate = new Date(fromDate);
                                    const sunday = getSunday(startDate);
                                    endDate = new Date(sunday);
                                    endDate.setDate(sunday.getDate() + 6);
                                } else {
                                    // Fallback to week starting from selected date
                                    const sunday = getSunday(selectedDate);
                                    startDate = new Date(sunday);
                                    endDate = new Date(sunday);
                                    endDate.setDate(sunday.getDate() + 6);
                                }

                                // Clear existing rows
                                $("#timesheetBody").empty();

                                // Generate rows for each day in the range
                                let rowIndex = 1;
                                const currentDate = new Date(startDate);

                                while (currentDate <= endDate) {
                                    const rowHTML = generateRowHTML(rowIndex, new Date(currentDate));
                                    $("#timesheetBody").append(rowHTML);
                                    currentDate.setDate(currentDate.getDate() + 1);
                                    rowIndex++;
                                }

                                // Update timesheet header with from/to dates
                                updateTimesheetHeader();
                            }

                            // Update timesheet header with payroll period dates
                            function updateTimesheetHeader() {
                                const fromDate = $("#fromDate").val();
                                const toDate = $("#toDate").val();

                                if (fromDate && toDate) {
                                    $("#timesheetDateRange").text(fromDate + " to " + toDate + " Employee Timesheet");
                                } else if (fromDate) {
                                    // If only from date is set, calculate Saturday of that week
                                    const sunday = getSunday(new Date(fromDate));
                                    const saturday = new Date(sunday);
                                    saturday.setDate(sunday.getDate() + 6);
                                    const saturdayFormatted = saturday.toISOString().split("T")[0];
                                    $("#timesheetDateRange").text(fromDate + " to " + saturdayFormatted + " Employee Timesheet");
                                } else {
                                    // Fallback to date1 and date7 if dates not set
                                    const date1 = $(".date1").text();
                                    const date7 = $(".date7").text();
                                    if (date1 && date7) {
                                        $("#timesheetDateRange").text(date1 + " to " + date7 + " Employee Timesheet");
                                    } else {
                                        $("#timesheetDateRange").text("Employee Timesheet");
                                    }
                                }
                            }

                            // ✅ When user selects a date manually from From date
                            $(document).on("change", "#fromDate", function () {
                                const val = $(this).val();
                                if (val) {
                                    const selectedDate = new Date(val);
                                    updateTable(selectedDate);
                                    // Auto-set to date to Saturday of the week if not set
                                    if (!$("#toDate").val()) {
                                        const sunday = getSunday(selectedDate);
                                        const saturday = new Date(sunday);
                                        saturday.setDate(sunday.getDate() + 6);
                                        const saturdayFormatted = saturday.toISOString().split("T")[0];
                                        $("#toDate").val(saturdayFormatted);
                                    }
                                    updateTimesheetHeader();
                                }
                            });

                            // ✅ When user selects to date manually
                            $(document).on("change", "#toDate", function () {
                                const toVal = $(this).val();
                                const fromVal = $("#fromDate").val();

                                console.log("To date changed:", toVal);

                                if (toVal) {
                                    // If to date is before from date, adjust from date
                                    if (fromVal && new Date(toVal) < new Date(fromVal)) {
                                        const sunday = getSunday(new Date(toVal));
                                        const sundayFormatted = sunday.toISOString().split("T")[0];
                                        $("#fromDate").val(sundayFormatted);
                                        updateTable(new Date(sundayFormatted));
                                    }

                                    // Always update the header when to date changes
                                    updateTimesheetHeader();
                                }
                            });

                            // ✅ Inline calendar with jQuery UI
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
                        <div id="tabs">
                            <ul class="tab-list">
                                <li class="tab-item active-tab" onclick="setActiveTab(this, 'active')">Active</li>
                                <li class="tab-item" onclick="setActiveTab(this, 'inactive')">Inactive</li>
                            </ul>
                        </div>

                        <!-- Active Employees -->
                        <div class="tab-pane active-content" id="active">
                            <div class="employee-list-container">
                                <table id="employeeTable">
                                    <tbody id="custTableBody">
                                        <c:forEach var="emp" items="${empList}">
                                            <tr class="employee-row" data-id="${emp.id}" data-name="${emp.firstName} ${emp.lastName}">
                                                <td class="employee-col" style="padding: 10px; font-size: 13px;">
                                                    Name: ${empty emp.firstName ? '' : emp.firstName}
                                                    ${empty emp.lastName ? '' : emp.lastName}, M.I:
                                                    ${empty emp.mi ? '' : emp.mi}, SSN:
                                                    ${empty emp.ssn ? '' : emp.ssn}, Pay Period:
                                                    ${empty emp.payPeriod ? '' : emp.payPeriod}, Pay Date:
                                                    ${"02-11-2025"}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Inactive Employees (Static Data) -->
                        <div class="tab-pane" id="inactive">
                            <div class="employee-list-container">
                                <table>
                                    <tbody id="custTableBody2">
                                        <c:forEach var="employeeInfo"
                                                   items="${employeeInfoDTOList}">
                                            <tr class="employee-row"
                                                data-id="${employeeInfo.id}"
                                                data-name="${emp.firstName} ${emp.lastName}"
                                                style="border-bottom: 1px solid #ccc; cursor: pointer;">
                                                <td style="padding: 10px; font-size: 13px;" class="employee-col-${employeeInfo.id}">
                                                    Name: ${empty employeeInfo.firstName ? '' : employeeInfo.firstName}
                                                    ${empty employeeInfo.lastName ? '' : employeeInfo.lastName}, M.I:
                                                    ${empty employeeInfo.mi ? '' : employeeInfo.mi}, SSN:
                                                    ${empty employeeInfo.ssn ? '' : employeeInfo.ssn}, Pay Period:
                                                    ${empty employeeInfo.payPeriod ? '' : employeeInfo.payPeriod}, Pay Date:
                                                    ${"02-11-2025"}</td>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <%--</div>--%>



                    <div style="text-align:center;" id="inlineCalendar"></div>

                </div>

                <div class="col-sm-9" style="padding-left: 15px; box-sizing: border-box;">
                    <div  style="border: 1px solid #dee2e6; width: 100%;" >
                        <div id="css1" style="text-align:center;">
                            <h4 style="font-size: 16px; padding-left: 10px;"><span id="timesheetDateRange">Employee Timesheet</span></h4>
                        </div>
                        <form action="/save-timesheet" method="post" name="timesheet">
                            <input type="hidden" id="employeeid" name="employeeId" />
                            <div class="table-responsive">
                                <table width="100%" class="tabla-editables">
                                    <thead>
                                        <tr>
                                            <th> <spring:message code="BzComposer.timesheet.weekday"/></th>
                                    <th><spring:message code="BzComposer.timesheet.date"/></th>
                                    <th>Start Work 1</th>
                                    <th>End Work 1</th>
                                    <th>Start Work 2</th>
                                    <th>End Work 2</th>
                                    <th>Start Work 3</th>
                                    <th>End Work 3</th>
                                    <th>Start Work 4</th>
                                    <th>End Work 4</th>
                                    <th>Start Work 5</th>
                                    <th>End Work 5</th>
                                    <th>Start Work 6</th>
                                    <th>End Work 6</th>
                                    <th>Start Work 7</th>
                                    <th>End Work 7</th>
                                    <th>Start Work 8</th>
                                    <th>End Work 8</th>
                                    <th>Break</th>
                                    <th>Total Hours</th>

                                    </tr>
                                    </thead>
                                    <tbody id="timesheetBody">
                                        <!-- Rows will be generated dynamically based on date range -->
                                    </tbody>
                                </table>
                            </div>
                            <div id="tsheet">
                                <input type="hidden" name="tsdata" id="tsdata" value="">
                            </div>
                            <input type="hidden" name="empid" id="empid" value=""/>
                            <input type="hidden" name="weeksdays" id="weekdays" value="">
                            </div>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td colspan="2">
                                            <b><spring:message code="BzComposer.timesheet.weeklytotal"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                <spring:message code="BzComposer.timesheet.totalhours"/>:
                                <%--<br>
                                    <spring:message code="BzComposer.timesheet.regularhours"/>:
                                    <br>
                                        <spring:message code="BzComposer.timesheet.overtimehours"/>:--%>
                                </td>
                                <%--<td >
                                    <b><span id="totalHours" >0.00</span></b>--%>
                                <td class="total-hours-cell" id="totalHoursggg"> <span>
                                        <button onclick="sumTotalHours()"  title="Show Total Hours" style="border: none; background: transparent; cursor: pointer;">
                                            <i class="fas fa-eye" style="color: black;"></i>
                                        </button>
                                    </span></td>

                                <%--<br>
                                    <b> 0.0</b>
                                    <br>
                                        <b> 0.0</b>
                                    </td>--%>
                                </tr>
                                <td colspan="2" align="center" style="font-size:1em;">
                                    <input type="button" value="<spring:message code='BzComposer.timesheet.cleardata'/>" class="formbutton">
                                    <input type="submit" class="formbutton"
                                           onclick="return manageCustomer('SAVE', event);"
                                           style="padding: 7px 15px;"
                                           value="Submit" />
                                    <input type="button" value="<spring:message code='BzComposer.timesheet.printtimesheet'/>" class="formbutton" onclick="printTheReport()">
                                </td>
                                </tbody>
                            </table>
                    </div>
                    </form>
                </div>

            </div>





            <%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
            <div id="timessheetTimeError" style="display:none;font-size:12px;">
                <p>Time</p>
            </div>
            <script>
                $(document).ready(function () {
                    const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

                    // Find Sunday for selected date
                    function getSunday(d) {
                        d = new Date(d);
                        const day = d.getDay();
                        const diff = d.getDate() - day;
                        return new Date(d.setDate(diff));
                    }

                    // Generate a single row HTML for a given row index and date (duplicate for document.ready scope)
                    function generateRowHTML(rowIndex, dateObj) {
                        const dayName = weekDays[dateObj.getDay()];
                        const dateFormatted = dateObj.getFullYear() + "-" +
                            String(dateObj.getMonth() + 1).padStart(2, "0") + "-" +
                            String(dateObj.getDate()).padStart(2, "0");
                        const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                        let rowHTML = '<tr id="row' + rowIndex + '">';
                        rowHTML += '<td class="day" id="day' + rowIndex + '">' + dayName + '</td>';
                        rowHTML += '<input name="d' + rowIndex + 'ay" type="hidden" id="hiddenDay' + rowIndex + '" value="' + dayName + '" />';
                        rowHTML += '<td class="date" id="date' + rowIndex + '">' + dateFormatted + '</td>';
                        rowHTML += '<input name="w' + rowIndex + 'orkDate" id="hiddenDate' + rowIndex + '" type="hidden" value="' + dateFormatted + '" />';

                        // Generate 8 work period columns
                        for (let col = 1; col <= 8; col++) {
                            const inputIdS = "s" + col + suffix;
                            const inputIdE = "e" + col + suffix;
                            const nameS = "startRow" + rowIndex + "Col" + col;
                            const nameE = "endRow" + rowIndex + "Col" + col;
                            rowHTML += '<td><input type="time" id="' + inputIdS + '" name="' + nameS + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                            rowHTML += '<td><input type="time" id="' + inputIdE + '" name="' + nameE + '" oninput="calculateRowHours(' + rowIndex + ')"/></td>';
                        }

                        // Break and Total Hours
                        rowHTML += '<td><input type="text" id="break' + rowIndex + '" name="break' + rowIndex + '" readonly style="width:70px"/></td>';
                        rowHTML += '<td><input type="text" id="totalHoursCell' + rowIndex + '" name="totalHoursCell' + rowIndex + '" readonly/></td>';
                        rowHTML += '</tr>';

                        return rowHTML;
                    }

                    // Update table dynamically based on date range (duplicate for document.ready scope)
                    function updateTable(selectedDate) {
                        const fromDate = $("#fromDate").val();
                        const toDate = $("#toDate").val();

                        let startDate, endDate;

                        if (fromDate && toDate) {
                            startDate = new Date(fromDate);
                            endDate = new Date(toDate);
                        } else if (fromDate) {
                            startDate = new Date(fromDate);
                            const sunday = getSunday(startDate);
                            endDate = new Date(sunday);
                            endDate.setDate(sunday.getDate() + 6);
                        } else {
                            // Fallback to week starting from selected date
                            const sunday = getSunday(selectedDate);
                            startDate = new Date(sunday);
                            endDate = new Date(sunday);
                            endDate.setDate(sunday.getDate() + 6);
                        }

                        // Clear existing rows
                        $("#timesheetBody").empty();

                        // Generate rows for each day in the range
                        let rowIndex = 1;
                        const currentDate = new Date(startDate);

                        while (currentDate <= endDate) {
                            const rowHTML = generateRowHTML(rowIndex, new Date(currentDate));
                            $("#timesheetBody").append(rowHTML);
                            currentDate.setDate(currentDate.getDate() + 1);
                            rowIndex++;
                        }

                        // Update timesheet header with from/to dates
                        updateTimesheetHeader();
                    }

                    // Update timesheet header with payroll period dates
                    function updateTimesheetHeader() {
                        const fromDate = $("#fromDate").val();
                        const toDate = $("#toDate").val();

                        if (fromDate && toDate) {
                            $("#timesheetDateRange").text(fromDate + " to " + toDate + " Employee Timesheet");
                        } else if (fromDate) {
                            // If only from date is set, calculate Saturday of that week
                            const sunday = getSunday(new Date(fromDate));
                            const saturday = new Date(sunday);
                            saturday.setDate(sunday.getDate() + 6);
                            const saturdayFormatted = saturday.getFullYear() + "-" +
                                    String(saturday.getMonth() + 1).padStart(2, "0") + "-" +
                                    String(saturday.getDate()).padStart(2, "0");
                            $("#timesheetDateRange").text(fromDate + " to " + saturdayFormatted + " Employee Timesheet");
                        } else {
                            // Fallback to date1 and date7 if dates not set
                            const date1 = $(".date1").text();
                            const date7 = $(".date7").text();
                            if (date1 && date7) {
                                $("#timesheetDateRange").text(date1 + " to " + date7 + " Employee Timesheet");
                            } else {
                                $("#timesheetDateRange").text("Employee Timesheet");
                            }
                        }
                    }

                    // Inline calendar
                    $("#inlineCalendar").datepicker({
                        showOtherMonths: true,
                        selectOtherMonths: true,
                        dateFormat: "yy-mm-dd",
                        firstDay: 0, // Week starts Sunday
                        onSelect: function () {
                            const selectedDate = $(this).datepicker("getDate");
                            updateTable(selectedDate);
                            // Auto-set from and to dates if not set
                            const dateText = $(this).datepicker("getDate");
                            if (dateText) {
                                const dateStr = dateText.getFullYear() + "-" +
                                    String(dateText.getMonth() + 1).padStart(2, "0") + "-" +
                                    String(dateText.getDate()).padStart(2, "0");
                                if (!$("#fromDate").val()) {
                                    $("#fromDate").val(dateStr);
                                }
                                // Auto-set to date to Saturday of the week if not set
                                if (!$("#toDate").val()) {
                                    const sunday = getSunday(dateText);
                                    const saturday = new Date(sunday);
                                    saturday.setDate(sunday.getDate() + 6);
                                    const saturdayFormatted = saturday.getFullYear() + "-" +
                                        String(saturday.getMonth() + 1).padStart(2, "0") + "-" +
                                        String(saturday.getDate()).padStart(2, "0");
                                    $("#toDate").val(saturdayFormatted);
                                }
                                updateTimesheetHeader();
                            }
                        }
                    });

                    // Event listeners for from/to date changes (using event delegation)
                    $(document).on("change", "#fromDate", function () {
                        const val = $(this).val();
                        if (val) {
                            const selectedDate = new Date(val);
                            updateTable(selectedDate);
                            // Auto-set to date to Saturday of the week if not set
                            if (!$("#toDate").val()) {
                                const sunday = getSunday(selectedDate);
                                const saturday = new Date(sunday);
                                saturday.setDate(sunday.getDate() + 6);
                                const saturdayFormatted = saturday.getFullYear() + "-" +
                                    String(saturday.getMonth() + 1).padStart(2, "0") + "-" +
                                    String(saturday.getDate()).padStart(2, "0");
                                $("#toDate").val(saturdayFormatted);
                            }
                            updateTimesheetHeader();
                        }
                    });

                    // Use event delegation to ensure it works even if element is added dynamically
                    // Note: This is a duplicate handler - the first one above should handle it
                    // Keeping this for compatibility but it should work with the first handler
                    $(document).off("change", "#toDate").on("change", "#toDate", function () {
                        const toVal = $(this).val();
                        const fromVal = $("#fromDate").val();

                        console.log("To date changed (second handler):", toVal);

                        if (toVal) {
                            // If to date is before from date, adjust from date
                            if (fromVal && new Date(toVal) < new Date(fromVal)) {
                                const sunday = getSunday(new Date(toVal));
                                const sundayFormatted = sunday.getFullYear() + "-" +
                                    String(sunday.getMonth() + 1).padStart(2, "0") + "-" +
                                    String(sunday.getDate()).padStart(2, "0");
                                $("#fromDate").val(sundayFormatted);
                                updateTable(new Date(sundayFormatted));
                            }

                            // Always update the header when to date changes
                            updateTimesheetHeader();
                        }
                    });

                    // Initialize table with this week
                    const today = new Date();
                    $("#inlineCalendar").datepicker("setDate", today);

                    // Initialize date inputs with current week if not already set
                    if (!$("#fromDate").val()) {
                        const sunday = getSunday(today);
                        const sundayFormatted = sunday.getFullYear() + "-" +
                            String(sunday.getMonth() + 1).padStart(2, "0") + "-" +
                            String(sunday.getDate()).padStart(2, "0");
                        $("#fromDate").val(sundayFormatted);
                    }
                    if (!$("#toDate").val()) {
                        const sunday = getSunday(today);
                        const saturday = new Date(sunday);
                        saturday.setDate(sunday.getDate() + 6);
                        const saturdayFormatted = saturday.getFullYear() + "-" +
                            String(saturday.getMonth() + 1).padStart(2, "0") + "-" +
                            String(saturday.getDate()).padStart(2, "0");
                        $("#toDate").val(saturdayFormatted);
                    }

                    // Generate initial rows based on date range
                    updateTable(today);

                    // Initialize header
                    updateTimesheetHeader();
                });
            </script>

            <!-- ================== JAVASCRIPT ================== -->
            <script>

                function decimalToHHMM(decimal) {
                    const hours = Math.floor(decimal);
                    const minutes = Math.round((decimal - hours) * 60);
                    return String(hours).padStart(2, '0') + ':' + String(minutes).padStart(2, '0');
                }

                console.log(decimalToHHMM(1.5));   // 01:30
                console.log(decimalToHHMM(2.75));  // 02:45


                function calculateRowHours(rowIndex) {

                    const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

                    let starts = [];
                    let ends = [];

                    for (let i = 1; i <= 8; i++) {
                        const s = document.getElementById("s" + i + suffix);
                        const e = document.getElementById("e" + i + suffix);
                        console.log(`s${i}${suffix} e${i}${suffix}`)
                        console.log("TABDI", s, e);

                        if (!s || !e)
                            continue;

                        if (s.value && e.value) {
                            starts.push(s.value);
                            ends.push(e.value);
                        }
                    }

                    // No time entered → reset output
                    if (starts.length === 0) {
                        document.getElementById(`totalHoursCell${rowIndex}`).value = "0.00";
                        document.getElementById(`break${rowIndex}`).value = "00:00";
                        calculateTotalWeekHours();
                        return;
                    }

                    const toMin = t => {
                        const [h, m] = t.split(":").map(Number);
                        return h * 60 + m;
                    };

                    let T = 0; // Total Working Hours

                    for (let i = 0; i < starts.length; i++) {
                        const diff = (toMin(ends[i]) - toMin(starts[i])) / 60;
                        if (diff > 0)
                            T += diff;
                    }

                    const O = (toMin(ends[ends.length - 1]) - toMin(starts[0])) / 60; // Overall shift time

                    let B = O - T;  // Break time
                    if (B < 0)
                        B = 0;

                    // Set Total Hours to input field
                    document.getElementById(`totalHoursCell` + rowIndex).value = decimalToHHMM(T.toFixed(2));

                    // Break HH:mm
                    const breakMin = Math.round(B * 60);
                    const hh = String(Math.floor(breakMin / 60)).padStart(2, "0");
                    const mm = String(breakMin % 60).padStart(2, "0");

                    document.getElementById(`break` + rowIndex).value = hh + ":" + mm;

                    calculateTotalWeekHours();
                }

                function calculateTotalWeekHours() {
                    let totalWeek = 0;

                    // Find all total hours cells dynamically
                    const totalHoursCells = document.querySelectorAll('[id^="totalHoursCell"]');

                    totalHoursCells.forEach(function(cell) {
                        const val = parseFloat(cell.value) || 0;
                        totalWeek += val;
                    });

                    // totalWeekHours is a <td>, so we must use innerText
                    const totalHoursElement = document.getElementById("totalHoursggg");
                    if (totalHoursElement) {
                        totalHoursElement.innerText = totalWeek.toFixed(2);
                    }
                }


                function printTheReport() {
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
                        var m = dt.getMonth() + 1;
                        var d = dt.getDate();
                        var y = dt.getFullYear();
                        return m + "/" + d + "/" + y;
                    }

                    function parseHMStoHours(hms) {
                        if (!hms)
                            return 0;
                        var parts = String(hms).split(":");
                        if (parts.length < 2)
                            return 0;
                        var h = parseInt(parts[0] || "0", 10) || 0;
                        var m = parseInt(parts[1] || "0", 10) || 0;
                        var s = parseInt(parts[2] || "0", 10) || 0;
                        return h + (m / 60) + (s / 3600);
                    }

                    function formatHMS(hms) {
                        if (!hms)
                            return "00:00:00";
                        return hms;
                    }

                    function formatHoursDecimal(hours) {
                        return hours.toFixed(2);
                    }

                    // --- Data & defaults ---
                    var meta = printableObject.meta || {};
                    var employeeId = meta.employeeId;

                    var employeeRow = document.querySelector("tr[data-id='" + employeeId + "']");
                    var employeeFullName = (employeeRow && employeeRow.dataset && employeeRow.dataset.name) ?
                            employeeRow.dataset.name :
                            (meta.employeeName ? meta.employeeName : "Unknown Employee");

                    // Get date range from form inputs
                    var fromDateInput = document.getElementById("fromDate");
                    var toDateInput = document.getElementById("toDate");
                    var startDate, endDate;

                    if (fromDateInput && fromDateInput.value && toDateInput && toDateInput.value) {
                        startDate = new Date(fromDateInput.value);
                        endDate = new Date(toDateInput.value);
                    } else {
                        // Fallback to current week
                        var today = new Date();
                        startDate = today;
                        endDate = addDays(startDate, 6);
                    }

                    // Collect all rows from the form dynamically
                    var rows = [];
                    var rowIndex = 1;
                    var currentDate = new Date(startDate);

                    while (currentDate <= endDate) {
                        var rowData = {
                            clockIn: null,
                            clockOut: null,
                            breakTime: null,
                            totalHrs: null,
                            clockInDate: formatDateMMDDYYYY(currentDate),
                            clockOutDate: formatDateMMDDYYYY(currentDate)
                        };

                        // Get first start time and last end time for this row
                        var firstStart = document.getElementById("s1" + (rowIndex === 1 ? "" : "_" + rowIndex));
                        var lastEnd = document.getElementById("e8" + (rowIndex === 1 ? "" : "_" + rowIndex));
                        var breakInput = document.getElementById("break" + rowIndex);
                        var totalHoursInput = document.getElementById("totalHoursCell" + rowIndex);

                        if (firstStart && firstStart.value) {
                            rowData.clockIn = firstStart.value + ":00";
                        }
                        if (lastEnd && lastEnd.value) {
                            rowData.clockOut = lastEnd.value + ":00";
                        }
                        if (breakInput && breakInput.value) {
                            rowData.breakTime = breakInput.value + ":00";
                        }
                        if (totalHoursInput && totalHoursInput.value) {
                            rowData.totalHrs = totalHoursInput.value + ":00";
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

                        // Use dates from row data (already set from form)
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

                    // --- Totals block moved to LEFT under the table ---
                    var totalsBoxWidth = 2.6;
                    var totalsX = tableStartX; // left side instead of right
                    var ty = cursorY;

                    doc.setFont("helvetica", "bold");
                    doc.text("Hours", totalsX + 0.05, ty);

                    doc.setFont("helvetica", "normal");
                    ty += 0.18;

                    var regHours = (typeof meta.regHours !== "undefined") ? meta.regHours : 0;
                    var regRate = (typeof meta.regRate !== "undefined") ? meta.regRate : 0;
                    var otHours = (typeof meta.otHours !== "undefined") ? meta.otHours : 0;
                    var otRate = (typeof meta.otRate !== "undefined") ? meta.otRate : 0;

                    var computedRegHours = (regHours === 0 && totalHours > 0) ? Math.min(totalHours, 80) : regHours;
                    var computedOtHours = (otHours === 0 && totalHours > computedRegHours) ?
                            (totalHours - computedRegHours) :
                            otHours;

                    var regTotal = computedRegHours * regRate;
                    var otTotal = computedOtHours * otRate;
                    var grossTotal = regTotal + otTotal;

                    doc.text("Total Hours:", totalsX + 0.02, ty);
                    doc.text(formatHoursDecimal(totalHours), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("Reg Hours:", totalsX + 0.02, ty);
                    doc.text(String(formatHoursDecimal(computedRegHours)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("Reg Rate:", totalsX + 0.02, ty);
                    doc.text(String(regRate), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("Reg Total:", totalsX + 0.02, ty);
                    doc.text(String(regTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("OT Hours:", totalsX + 0.02, ty);
                    doc.text(String(formatHoursDecimal(computedOtHours)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("OT Rate:", totalsX + 0.02, ty);
                    doc.text(String(otRate), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.text("OT Total:", totalsX + 0.02, ty);
                    doc.text(String(otTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});
                    ty += 0.16;

                    doc.setFont("helvetica", "bold");
                    doc.text("TOTAL AMOUNT:", totalsX + 0.02, ty);
                    doc.text(String(grossTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, {align: "right"});

                    // --- Footer timestamp (current date/time) ---
                    doc.setFontSize(8);
                    doc.setFont("helvetica", "normal");
                    var now = new Date();
                    doc.text("Generated: " + now.toLocaleString(), margin, pageHeight - margin - 0.05);

                    // Save file (JSP-safe concatenation)
                    doc.save(employeeFullName.replace(/\s+/g, "_") + "_report.pdf");
                }




            </script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/polyfills.umd.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/jspdf.umd.min.js"></script>

    </body>

</html>