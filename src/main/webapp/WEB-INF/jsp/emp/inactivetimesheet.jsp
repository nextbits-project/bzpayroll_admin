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
    <!-- Timepicker Script -->
    <link rel='stylesheet'
        href='https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.css'>
    <link rel='stylesheet'
        href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css'>
    <script
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js'></script>
    <script src="${pageContext.request.contextPath}/scripts/timepiker.js"
        type="text/javascript"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
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

        #css1 {
            background-color: #C3C5C7;
        }

        div#cos {
            padding: 5px 0px 21px 0px;
        }
    </style>
    <style>
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
            font-family: "Philosopher", "Bitstream Vera Sans", "Lucida Grande", "Trebuchet MS", Arial, Helvetica, sans-serif !important;
        }

        .matchprent {
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
        // start here
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
        // close here
        $(document).ready(function () {

            const params = new URLSearchParams(window.location.search);


            function loadData(employeeId, workDate1, workDate2) {
                console.log("Employee ID:", employeeId);

                $('#custTableBody td').removeClass('selected-cell');




                if (!employeeId) {
                    console.warn("No employee ID found on row.");
                    return;
                }
                // Add class to clicked cell only
                $("tr[data-id='" + employeeId + "']").children()[0].classList.add("selected-cell");
                employeeIdForEdit = employeeId;
                employeeIdForDelete = employeeId;
                // Get hidden input value
                console.log("Hidden Work Date:", workDate2);
                //const apiUrl = `/api/timesheet/` + employeeId;
                const apiUrl = `/api/timesheet/` + employeeId + `/` + workDate1 + `/` + workDate2;
                console.log("Calling:", apiUrl);

                $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    success: function (data) {
                        console.log("Form Data1:", data);

                        if (data) {
                            $('input[name="employeeId"]').val(employeeId || '');
                            // Row 1 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 1
                            $('input[name="break1"]').val(data.break1 || '');
                            $('input[name="totalHoursCell1"]').val(data.totalHoursCell1 || '');
                            // Row 2 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 2
                            $('input[name="break2"]').val(data.break2 || '');
                            $('input[name="totalHoursCell2"]').val(data.totalHoursCell2 || '');
                            // Row 3 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 3
                            $('input[name="break3"]').val(data.break3 || '');
                            $('input[name="totalHoursCell3"]').val(data.totalHoursCell3 || '');
                            // Row 4 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 4
                            $('input[name="break4"]').val(data.break4 || '');
                            $('input[name="totalHoursCell4"]').val(data.totalHoursCell4 || '');
                            // Row 5 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 5
                            $('input[name="break5"]').val(data.break5 || '');
                            $('input[name="totalHoursCell5"]').val(data.totalHoursCell5 || '');
                            // Row 6 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 6
                            $('input[name="break6"]').val(data.break6 || '');
                            $('input[name="totalHoursCell6"]').val(data.totalHoursCell6 || '');
                            // Row 7 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 7
                            $('input[name="break7"]').val(data.break7 || '');
                            $('input[name="totalHoursCell7"]').val(data.totalHoursCell7 || '');


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


            }

            var urlEmployeeId = params.get("employeeId")
            var urlWorkDate1 = params.get("startDate")
            var urlWorkDate2 = params.get("endDate")


            if (urlEmployeeId && urlWorkDate1 && urlWorkDate2) {
                loadData(urlEmployeeId, urlWorkDate1, urlWorkDate2)
            }


            

        });
        function getSelectedEmployeeData(employeeId){
            console.log("Employee ID:", employeeId);

            if (!employeeId) {
                console.warn("No employee ID found on row.");
                return;
            }
            employeeIdForEdit = employeeId;
            employeeIdForDelete = employeeId;
            // Get hidden input value
            const workDate1 = $('#hiddenDate1').val();
            const workDate2 = $('#hiddenDate7').val();
            console.log("Hidden Work Date:", workDate2);
            //const apiUrl = `/api/timesheet/` + employeeId;
            const apiUrl = `/api/timesheet/` + employeeId + `/` + workDate1 + `/` + workDate2;
            console.log("Calling:", apiUrl);

            $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    success: function (data) {
                        console.log("Form Data1:", data);
                        // from date = last payment date from API
                        $('#fromDate').val(data.fromDate);

                        // today date
                        const today = new Date().toISOString().split('T')[0];
                        $('#toDate').val(today);
                        if (data) {
                            $('input[name="employeeId"]').val(employeeId || '');
                            // Row 1 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 1
                            $('input[name="break1"]').val(data.break1 || '');
                            $('input[name="totalHoursCell1"]').val(data.totalHoursCell1 || '');
                            // Row 2 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 2
                            $('input[name="break2"]').val(data.break2 || '');
                            $('input[name="totalHoursCell2"]').val(data.totalHoursCell2 || '');
                            // Row 3 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 3
                            $('input[name="break3"]').val(data.break3 || '');
                            $('input[name="totalHoursCell3"]').val(data.totalHoursCell3 || '');
                            // Row 4 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 4
                            $('input[name="break4"]').val(data.break4 || '');
                            $('input[name="totalHoursCell4"]').val(data.totalHoursCell4 || '');
                            // Row 5 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 5
                            $('input[name="break5"]').val(data.break5 || '');
                            $('input[name="totalHoursCell5"]').val(data.totalHoursCell5 || '');
                            // Row 6 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 6
                            $('input[name="break6"]').val(data.break6 || '');
                            $('input[name="totalHoursCell6"]').val(data.totalHoursCell6 || '');
                            // Row 7 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 7
                            $('input[name="break7"]').val(data.break7 || '');
                            $('input[name="totalHoursCell7"]').val(data.totalHoursCell7 || '');


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
        }
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
                const apiUrl = `/api/timesheet/` + employeeId;
                console.log("Calling:", apiUrl);

                $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    success: function (data) {
                        console.log("Form Data1:", data);

                        if (data) {
                            $('input[name="employeeId"]').val(employeeId || '');
                            // Row 1 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 1
                            $('input[name="break1"]').val(data.break1 || '');
                            $('input[name="totalHoursCell1"]').val(data.totalHoursCell1 || '');
                            // Row 2 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 2
                            $('input[name="break2"]').val(data.break2 || '');
                            $('input[name="totalHoursCell2"]').val(data.totalHoursCell2 || '');
                            // Row 3 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 3
                            $('input[name="break3"]').val(data.break3 || '');
                            $('input[name="totalHoursCell3"]').val(data.totalHoursCell3 || '');
                            // Row 4 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 4
                            $('input[name="break4"]').val(data.break4 || '');
                            $('input[name="totalHoursCell4"]').val(data.totalHoursCell4 || '');
                            // Row 5 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 5
                            $('input[name="break5"]').val(data.break5 || '');
                            $('input[name="totalHoursCell5"]').val(data.totalHoursCell5 || '');
                            // Row 6 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 6
                            $('input[name="break6"]').val(data.break6 || '');
                            $('input[name="totalHoursCell6"]').val(data.totalHoursCell6 || '');
                            // Row 7 — Start & End Times (Columns 1 to 8)
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

                            // Break & Total Hours for Row 7
                            $('input[name="break7"]').val(data.break7 || '');
                            $('input[name="totalHoursCell7"]').val(data.totalHoursCell7 || '');


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
            InActive Employee Timesheet
            <c:if test="${not empty message}">
                <br /> ${message}
            </c:if>
        </span>
        <br><br>
        <!-- Payroll Period Section -->

        <div class="row">
            <div style="text-align: right;"> </div>
            <div class="col-sm-3" style=" padding-right: 0px; ">
                <!-- <div class="panel"> -->
                    <div>
                        <div style="align-items:center; margin-bottom: 15px;" id="inlineCalendar"></div>
                        <div class="form-layout">
                            <table>
                                <tr>
                                    <td colspan="4">Payroll Period:</td>
                                </tr>
                                <tr>
                                    <td style="margin:0px; padding:0px;">&nbsp;From</td>
                                    <td style="margin:0px; padding:0px;"><input type="date"
                                            id="fromDate" name="from" style="width: 110px;" /></td>
                                    <td style="margin:0px; padding:0px;">&nbsp;To</td>
                                    <td style="margin:0px; padding:0px;"><input type="date" name="to"
                                            id="toDate" style="width: 110px;" /></td>
                                </tr>
                                </tr>
                            </table>
                        </div>
                        
                    </div>

                    <div id="formCustomization">
                        <!-- Inactive Employees (Static Data) -->
                        <div class="employee-list-container">
                                <input type="hidden" value="${employeeInfoDTOList.size()}" id="inActivelSize" />
                                <table>
                                    <table id="custTable" class="tabla-listados sortable" cellspacing="0"
                                    style="width: 100%; margin-top: 10px; border: 0; padding: 0; height: auto;"
                                    align="center">
                                    <thead>
                                        <tr valign="center">
                                            <th style="width: 25%;">Name</th>
                                            <th>SS#</th>
                                            <th>Pay Period</th>
                                            <th>Pay Rate</th>
                                            <th>Pay Date</th>
                                        </tr>
                                    </thead>
                                    <tbody id="custTableBody">
                                        <c:forEach items="${employeeInfoDTOList}" var="emp" varStatus="loop">
                                            <tr id='${loop.index}$$$$'
                                                onclick="setRowIdInActive(${emp.id}, ${loop.index}, true);"
                                                class="employee-row" data-id="${emp.id}">
                                                <td>${emp.firstName} ${emp.lastName}</td>
                                                <td>${emp.ssn}</td>
                                                <td>${emp.payPeriod}</td>
                                                <td>${emp.amount}</td>
                                                <td>${emp.toBePaidDate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                </table>
                            </div>
                    </div>

                    <%--< /div>--%>

            </div>

            <div class="col-sm-9">
                <div style="border: 1px solid #dee2e6;">
                    <div id="css1" style="text-align:center;">
                        <h4 style="font-size: 16px; padding-left: 10px;"><span class="date1"></span> to
                            <span class="date7"></span> InActive Employee Timesheet
                        </h4>
                    </div>
                    <form action="/save-timesheet" method="post" name="timesheet">
                        <input type="hidden" id="employeeid" name="employeeId" />
                        <div style="margin-bottom: 10px;">
                            <input type="submit" class="formbutton"
                                onclick="return manageCustomer('SAVE', event);"
                                style="padding: 7px 15px;" value="Submit" />
                            <input type="button"
                                value="<spring:message code='BzComposer.timesheet.printtimesheet'/>"
                                class="formbutton" onclick="printTheReport()">
                            <input type="button" style="margin: 5px 3px;"
                                value="<spring:message code='BzComposer.timesheet.cleardata'/>"
                                class="formbutton">
                        </div>
                        <div class="table-responsive">
                            <table width="100%" class="tabla-editables">
                                <thead>
                                    <tr>
                                        <th>
                                            <spring:message code="BzComposer.timesheet.weekday" />
                                        </th>
                                        <th>
                                            <spring:message code="BzComposer.timesheet.date" />
                                        </th>
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
                                <tbody>
                                    <tr id="row1">

                                        <td class="day" id="day1"></td>
                                        <input name="d1ay" type="hidden" id="hiddenDay1" />
                                        <td class="date date1"></td>
                                        <input name="w1orkDate" id="hiddenDate1" type="hidden" />

                                        <td><input type="time" id="s1" name="startRow1Col1"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e1" name="endRow1Col1"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s2" name="startRow1Col2"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e2" name="endRow1Col2"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s3" name="startRow1Col3"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e3" name="endRow1Col3"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s4" name="startRow1Col4"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e4" name="endRow1Col4"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s5" name="startRow1Col5"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e5" name="endRow1Col5"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s6" name="startRow1Col6"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e6" name="endRow1Col6"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s7" name="startRow1Col7"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e7" name="endRow1Col7"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="time" id="s8" name="startRow1Col8"
                                                oninput="calculateRowHours(1)" /></td>
                                        <td><input type="time" id="e8" name="endRow1Col8"
                                                oninput="calculateRowHours(1)" /></td>

                                        <td><input type="text" id="break1" name="break1" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell1"
                                                name="totalHoursCell1" readonly /></td>
                                    </tr>

                                    <tr id="row2">


                                        <td class="day" id="day2">Mon</td>
                                        <input name="d2ay" type="hidden" id="hiddenDay2" value="Mon" />

                                        <td class="date" id="date2"></td>
                                        <input name="w2orkDate" id="hiddenDate2" type="hidden" />

                                        <td><input type="time" id="s1_2" name="startRow2Col1"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e1_2" name="endRow2Col1"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s2_2" name="startRow2Col2"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e2_2" name="endRow2Col2"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s3_2" name="startRow2Col3"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e3_2" name="endRow2Col3"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s4_2" name="startRow2Col4"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e4_2" name="endRow2Col4"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s5_2" name="startRow2Col5"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e5_2" name="endRow2Col5"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s6_2" name="startRow2Col6"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e6_2" name="endRow2Col6"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s7_2" name="startRow2Col7"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e7_2" name="endRow2Col7"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="time" id="s8_2" name="startRow2Col8"
                                                oninput="calculateRowHours(2)" /></td>
                                        <td><input type="time" id="e8_2" name="endRow2Col8"
                                                oninput="calculateRowHours(2)" /></td>

                                        <td><input type="text" id="break2" name="break2" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell2"
                                                name="totalHoursCell2" readonly /></td>
                                    </tr>


                                    <tr id="row3">


                                        <td class="day" id="day3">Tue</td>
                                        <input name="d3ay" type="hidden" id="hiddenDay3" value="Tue" />

                                        <td class="date" id="date3"></td>
                                        <input name="w3orkDate" id="hiddenDate3" type="hidden" />

                                        <td><input type="time" id="s1_3" name="startRow3Col1"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e1_3" name="endRow3Col1"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s2_3" name="startRow3Col2"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e2_3" name="endRow3Col2"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s3_3" name="startRow3Col3"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e3_3" name="endRow3Col3"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s4_3" name="startRow3Col4"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e4_3" name="endRow3Col4"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s5_3" name="startRow3Col5"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e5_3" name="endRow3Col5"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s6_3" name="startRow3Col6"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e6_3" name="endRow3Col6"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s7_3" name="startRow3Col7"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e7_3" name="endRow3Col7"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="time" id="s8_3" name="startRow3Col8"
                                                oninput="calculateRowHours(3)" /></td>
                                        <td><input type="time" id="e8_3" name="endRow3Col8"
                                                oninput="calculateRowHours(3)" /></td>

                                        <td><input type="text" id="break3" name="break3" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell3"
                                                name="totalHoursCell3" readonly /></td>
                                    </tr>


                                    <tr id="row4">
                                        <td class="day">Wed</td>
                                        <input name="d4ay" type="hidden" id="hiddenDay4" value="Wed" />

                                        <td class="date" id="date4"></td>
                                        <input name="w4orkDate" type="hidden" id="hiddenDate4" />

                                        <td><input type="time" id="s1_4" name="startRow4Col1"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e1_4" name="endRow4Col1"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s2_4" name="startRow4Col2"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e2_4" name="endRow4Col2"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s3_4" name="startRow4Col3"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e3_4" name="endRow4Col3"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s4_4" name="startRow4Col4"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e4_4" name="endRow4Col4"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s5_4" name="startRow4Col5"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e5_4" name="endRow4Col5"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s6_4" name="startRow4Col6"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e6_4" name="endRow4Col6"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s7_4" name="startRow4Col7"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e7_4" name="endRow4Col7"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="time" id="s8_4" name="startRow4Col8"
                                                oninput="calculateRowHours(4)" /></td>
                                        <td><input type="time" id="e8_4" name="endRow4Col8"
                                                oninput="calculateRowHours(4)" /></td>

                                        <td><input type="text" id="break4" name="break4" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell4"
                                                name="totalHoursCell4" readonly /></td>
                                    </tr>



                                    <tr id="row5">
                                        <td class="day">Thu</td>
                                        <input name="d5ay" type="hidden" id="hiddenDay5" value="Thu" />

                                        <td class="date" id="date5"></td>
                                        <input name="w5orkDate" type="hidden" id="hiddenDate5" />

                                        <td><input type="time" id="s1_5" name="startRow5Col1"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e1_5" name="endRow5Col1"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s2_5" name="startRow5Col2"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e2_5" name="endRow5Col2"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s3_5" name="startRow5Col3"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e3_5" name="endRow5Col3"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s4_5" name="startRow5Col4"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e4_5" name="endRow5Col4"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s5_5" name="startRow5Col5"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e5_5" name="endRow5Col5"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s6_5" name="startRow5Col6"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e6_5" name="endRow5Col6"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s7_5" name="startRow5Col7"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e7_5" name="endRow5Col7"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="time" id="s8_5" name="startRow5Col8"
                                                oninput="calculateRowHours(5)" /></td>
                                        <td><input type="time" id="e8_5" name="endRow5Col8"
                                                oninput="calculateRowHours(5)" /></td>

                                        <td><input type="text" id="break5" name="break5" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell5"
                                                name="totalHoursCell5" readonly /></td>
                                    </tr>


                                    <tr id="row6">
                                        <td class="day" id="day6">Fri</td>
                                        <input name="d6ay" type="hidden" id="hiddenDay6" value="Fri" />

                                        <td class="date" id="date6"></td>
                                        <input name="w6orkDate" type="hidden" id="hiddenDate6" />

                                        <td><input type="time" id="s1_6" name="startRow6Col1"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e1_6" name="endRow6Col1"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s2_6" name="startRow6Col2"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e2_6" name="endRow6Col2"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s3_6" name="startRow6Col3"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e3_6" name="endRow6Col3"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s4_6" name="startRow6Col4"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e4_6" name="endRow6Col4"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s5_6" name="startRow6Col5"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e5_6" name="endRow6Col5"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s6_6" name="startRow6Col6"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e6_6" name="endRow6Col6"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s7_6" name="startRow6Col7"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e7_6" name="endRow6Col7"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="time" id="s8_6" name="startRow6Col8"
                                                oninput="calculateRowHours(6)" /></td>
                                        <td><input type="time" id="e8_6" name="endRow6Col8"
                                                oninput="calculateRowHours(6)" /></td>

                                        <td><input type="text" id="break6" name="break6" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell6"
                                                name="totalHoursCell6" readonly /></td>
                                    </tr>

                                    <tr id="row7">
                                        <td class="day">Sat</td>
                                        <input name="d7ay" type="hidden" value="Sat" />
                                        <td class="date date7"></td>
                                        <input name="w7orkDate" id="hiddenDate7" type="hidden" />

                                        <td><input type="time" id="s1_7" name="startRow7Col1"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e1_7" name="endRow7Col1"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s2_7" name="startRow7Col2"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e2_7" name="endRow7Col2"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s3_7" name="startRow7Col3"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e3_7" name="endRow7Col3"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s4_7" name="startRow7Col4"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e4_7" name="endRow7Col4"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s5_7" name="startRow7Col5"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e5_7" name="endRow7Col5"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s6_7" name="startRow7Col6"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e6_7" name="endRow7Col6"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s7_7" name="startRow7Col7"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e7_7" name="endRow7Col7"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="time" id="s8_7" name="startRow7Col8"
                                                oninput="calculateRowHours(7)" /></td>
                                        <td><input type="time" id="e8_7" name="endRow7Col8"
                                                oninput="calculateRowHours(7)" /></td>

                                        <td><input type="text" id="break7" name="break7" readonly
                                                style="width:70px" /></td>
                                        <td><input type="text" id="totalHoursCell7"
                                                name="totalHoursCell7" readonly /></td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                        <div id="tsheet">
                            <input type="hidden" name="tsdata" id="tsdata" value="">
                        </div>
                        <input type="hidden" name="empid" id="empid" value="" />
                        <input type="hidden" name="weeksdays" id="weekdays" value="">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <b>
                                            <spring:message code="BzComposer.timesheet.weeklytotal" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 150px">
                                        <spring:message code="BzComposer.timesheet.totalhours" />:
                                        <%--<br>
                                            <spring:message code="BzComposer.timesheet.regularhours" />:
                                            <br>
                                            <spring:message code="BzComposer.timesheet.overtimehours" />
                                            :--%>
                                    </td>
                                    <%--<td>
                                        <b><span id="totalHours">0.00</span></b>--%>
                                        <td class="total-hours-cell" id="totalHoursggg"> <span>
                                                <button onclick="sumTotalHours()"
                                                    title="Show Total Hours"
                                                    style="border: none; background: transparent; cursor: pointer;">
                                                    <i class="fas fa-eye" style="color: black;"></i>
                                                </button>
                                            </span></td>

                                        <%--<br>
                                            <b> 0.0</b>
                                            <br>
                                            <b> 0.0</b>
                                            </td>--%>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<div id="timessheetTimeError" style="display:none;font-size:12px;">
    <p>Time</p>
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
<script>
  

    function setRowId(rowid, rowIndex, flag) {
        let lSize = document.getElementById("lSize").value;
        for (i = 0; i < lSize; i++) {
            let currROW = document.getElementById(i + '$$');
            if (currROW == null) continue;
            if (i % 2 == 1) {
                currROW.className = "odd";
            } else {
                currROW.className = "even";
            }
        }
        if (flag) {
            itemID = rowid;
            itemIndex = rowIndex;
            if (rowIndex % 2 == 1) {
                ;
                document.getElementById(rowIndex + "$$").classList.remove('odd');
            }
            document.getElementById(rowIndex + '$$').classList.add('draft');
        }
        getSelectedEmployeeData(rowid);
    }
    function setRowIdInActive(rowid, rowIndex, flag) {
        let lSize = document.getElementById("inActivelSize").value;
        for (i = 0; i < lSize; i++) {
            let currROW = document.getElementById(i + '$$$$');
            if (currROW == null) continue;
            if (i % 2 == 1) {
                currROW.className = "odd";
            } else {
                currROW.className = "even";
            }
        }
        if (flag) {
            itemID = rowid;
            itemIndex = rowIndex;
            if (rowIndex % 2 == 1) {
                ;
                document.getElementById(rowIndex + "$$$$").classList.remove('odd');
            }
            document.getElementById(rowIndex + '$$$$').classList.add('draft');
        }
        getSelectedEmployeeData(rowid);
    }
    $(document).ready(function () {
        const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

        // Find Sunday for selected date
        function getSunday(d) {
            d = new Date(d);

            const day = d.getDay();

            // Make Monday the first day
            const diff = d.getDate() - day + (day === 0 ? -6 : 1);

            return new Date(d.setDate(diff));
        }

        // Update table when date selected (static fields for 7 days)
        function updateTable(selectedDate) {
            const sunday = getSunday(selectedDate);

            let updates = [
                { dayId: "#day1", hiddenDayId: "#hiddenDay1", dateId: ".date1", hiddenDateId: "#hiddenDate1" },
                { dayId: "#day2", hiddenDayId: "#hiddenDay2", dateId: "#date2", hiddenDateId: "#hiddenDate2" },
                { dayId: "#day3", hiddenDayId: "#hiddenDay3", dateId: "#date3", hiddenDateId: "#hiddenDate3" },
                { dayId: "#day4", hiddenDayId: "#hiddenDay4", dateId: "#date4", hiddenDateId: "#hiddenDate4" },
                { dayId: "#day5", hiddenDayId: "#hiddenDay5", dateId: "#date5", hiddenDateId: "#hiddenDate5" },
                { dayId: "#day6", hiddenDayId: "#hiddenDay6", dateId: "#date6", hiddenDateId: "#hiddenDate6" },
                { dayId: "#day7", hiddenDayId: "#hiddenDay7", dateId: ".date7", hiddenDateId: "#hiddenDate7" }

            ];

            updates.forEach((item, index) => {

                const newDate = new Date(sunday);

                newDate.setDate(sunday.getDate() + index);

                const dayName = weekDays[newDate.getDay()];

                const dateFormatted =
                    newDate.getFullYear() + "-" +
                    String(newDate.getMonth() + 1).padStart(2, "0") + "-" +
                    String(newDate.getDate()).padStart(2, "0");

                // Set values
                $(item.dayId).text(dayName);
                $(item.hiddenDayId).val(dayName);

                $(item.dateId).text(dateFormatted);
                $(item.hiddenDateId).val(dateFormatted);

                // ===== HIDE FUTURE ROWS =====

                const row = $("#row" + (index + 1));

                // Remove time from comparison
                const currentCheckDate = new Date(newDate);
                currentCheckDate.setHours(0, 0, 0, 0);

                const todayCheck = new Date(selectedDate);
                todayCheck.setHours(0, 0, 0, 0);

                if (currentCheckDate > todayCheck) {

                    row.hide();

                } else {

                    row.show();
                }
            });
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
            }
        });

        // Initialize table with this week
        const today = new Date();
        $("#inlineCalendar").datepicker("setDate", today);
        updateTable(today);
    });
</script>

<!-- ================== JAVASCRIPT ================== -->
<script>

    function calculateRowHours(rowIndex) {
        const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

        let starts = [];
        let ends = [];

        for (let i = 1; i <= 8; i++) {
            const s = document.getElementById("s" + i + suffix);
            const e = document.getElementById("e" + i + suffix);
            if (!s || !e)
                continue;

            if (s.value && e.value) {
                starts.push(s.value);
                ends.push(e.value);
            }
        }

        // No time entered → reset output
        if (starts.length === 0) {
            document.getElementById("totalHoursCell" + rowIndex).value = "0.00";
            document.getElementById("break" + rowIndex).value = "00:00";
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
        document.getElementById("totalHoursCell" + rowIndex).value = T.toFixed(2);

        // Break HH:mm
        const breakMin = Math.round(B * 60);
        const hh = String(Math.floor(breakMin / 60)).padStart(2, "0");
        const mm = String(breakMin % 60).padStart(2, "0");

        document.getElementById("break" + rowIndex).value = hh + ":" + mm;

        calculateTotalWeekHours();
    }

    function calculateTotalWeekHours() {
        let totalWeek = 0;

        for (let i = 1; i <= 7; i++) {
            const val = parseFloat(document.getElementById("totalHoursCell" + i).value) || 0;
            totalWeek += val;
        }

        // totalWeekHours is a <td>, so we must use innerText
        document.getElementById("totalWeekHours").innerText = totalWeek.toFixed(2);
    }

    // for print timesheet - make it globally accessible
    window.printTheReport = function () {
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
        // Get employee ID from form input
        var employeeIdInput = document.getElementById("employeeid");
        var employeeId = employeeIdInput ? employeeIdInput.value : (meta.employeeId || null);

        var employeeFullName = "Unknown Employee";
        var employeeRow = null;

        if (employeeId) {
            // Try to find employee row in active tab first
            employeeRow = document.querySelector("#custTableBody tr[data-id='" + employeeId + "']");
            // If not found, try inactive tab
            if (!employeeRow) {
                employeeRow = document.querySelector("#custTableBody2 tr[data-id='" + employeeId + "']");
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
                employeeId = selectedRow.getAttribute('data-id');
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

        // Fallback: Try to fetch employee name from API if still unknown
        if (employeeFullName === "Unknown Employee" && employeeId) {
            try {
                $.ajax({
                    url: '/api/employees/' + employeeId,
                    type: 'GET',
                    async: false,
                    success: function (empData) {
                        if (empData) {
                            var firstName = (empData.firstName || '').trim();
                            var lastName = (empData.lastName || '').trim();
                            var mi = (empData.mi || '').trim();
                            if (firstName || lastName) {
                                employeeFullName = (firstName + ' ' + (mi ? mi + ' ' : '') + lastName).trim();
                            }
                        }
                    },
                    error: function () {
                        console.error('Failed to fetch employee data for name');
                    }
                });
            } catch (e) {
                console.error('Error fetching employee name:', e);
            }
        }

        // Fallback to meta if still unknown
        if (employeeFullName === "Unknown Employee" && meta.employeeName) {
            employeeFullName = meta.employeeName;
        }

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

        var computedRegHours = (regHours === 0 && totalHours > 0) ? Math.min(totalHours, 40) : regHours;
        var computedOtHours = (otHours === 0 && totalHours > computedRegHours) ?
            (totalHours - computedRegHours) :
            otHours;

        // Get employee hourly rate if not provided
        if (!regRate && employeeId) {
            try {
                $.ajax({
                    url: '/api/employees/' + employeeId,
                    type: 'GET',
                    async: false,
                    success: function (empData) {
                        if (empData && empData.hourlyRate) {
                            regRate = parseFloat(empData.hourlyRate) || 0;
                            otRate = regRate * 1.5; // OT is typically 1.5x
                        }
                    }
                });
            } catch (e) {
                console.error('Error fetching employee rate:', e);
            }
        }

        var regTotal = computedRegHours * regRate;
        var otTotal = computedOtHours * otRate;
        var grossTotal = regTotal + otTotal;

        // Calculate taxes via API
        var taxData = null;
        if (employeeId && grossTotal > 0) {
            try {
                $.ajax({
                    url: '/api/timesheet/calculate-taxes',
                    type: 'GET',
                    async: false,
                    data: {
                        employeeId: employeeId,
                        grossWage: grossTotal
                    },
                    success: function (response) {
                        taxData = response;
                    },
                    error: function () {
                        console.error('Failed to calculate taxes');
                    }
                });
            } catch (e) {
                console.error('Error calculating taxes:', e);
            }
        }

        doc.text("Total Hours:", totalsX + 0.02, ty);
        doc.text(formatHoursDecimal(totalHours), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.text("Reg Hours:", totalsX + 0.02, ty);
        doc.text(String(formatHoursDecimal(computedRegHours)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.text("Reg Rate:", totalsX + 0.02, ty);
        doc.text(String(regRate), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.text("Reg Total:", totalsX + 0.02, ty);
        doc.text(String(regTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.text("OT Hours:", totalsX + 0.02, ty);
        doc.text(String(formatHoursDecimal(computedOtHours)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.text("OT Rate:", totalsX + 0.02, ty);
        doc.text(String(otRate), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.text("OT Total:", totalsX + 0.02, ty);
        doc.text(String(otTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        doc.setFont("helvetica", "bold");
        doc.text("GROSS PAY:", totalsX + 0.02, ty);
        doc.text(String(grossTotal.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
        ty += 0.16;

        // Tax Deductions Section
        if (taxData) {
            doc.setFont("helvetica", "normal");
            doc.text("Federal Tax:", totalsX + 0.02, ty);
            doc.text(String((taxData.federalTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
            ty += 0.16;

            doc.text("Social Security:", totalsX + 0.02, ty);
            doc.text(String((taxData.socialSecurityTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
            ty += 0.16;

            doc.text("Medicare Tax:", totalsX + 0.02, ty);
            doc.text(String((taxData.medicareTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
            ty += 0.16;

            doc.text("State Tax:", totalsX + 0.02, ty);
            doc.text(String((taxData.stateTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
            ty += 0.16;

            doc.text("State Disability:", totalsX + 0.02, ty);
            doc.text(String((taxData.stateDisabilityTax || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
            ty += 0.16;

            doc.setFont("helvetica", "bold");
            doc.text("Total Deductions:", totalsX + 0.02, ty);
            doc.text(String((taxData.totalDeduction || 0).toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });
            ty += 0.16;
        }

        doc.setFont("helvetica", "bold");
        doc.setFontSize(10);
        doc.text("NET PAY:", totalsX + 0.02, ty);
        var netPay = grossTotal - (taxData ? (taxData.totalDeduction || 0) : 0);
        doc.text(String(netPay.toFixed(2)), totalsX + totalsBoxWidth - 0.02, ty, { align: "right" });

        // --- Footer timestamp (current date/time) ---
        doc.setFontSize(8);
        doc.setFont("helvetica", "normal");
        var now = new Date();
        doc.text("Generated: " + now.toLocaleString(), margin, pageHeight - margin - 0.05);

        // Save file (JSP-safe concatenation)
        doc.save(employeeFullName.replace(/\s+/g, "_") + "_report.pdf");
    };
</script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/polyfills.umd.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/3.0.4/jspdf.umd.min.js"></script>
</body>

</html>