<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%@include file="../include/headlogo.jsp" %>
    <%@include file="../include/header.jsp" %>
    <%@include file="../include/menu.jsp" %>

    <title>BzPayroll - Timesheet</title>

    <!-- Timepicker & Icons -->
       <!-- Timepicker & Icons -->
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.css">
       <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.js"></script>
       <script src="${pageContext.request.contextPath}/scripts/timepiker.js"></script>

       <link rel="stylesheet"
             href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
            table, td, th {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 4px;
            }
            input[type="time"] {
                width: 90px;
            }
        </style>
</head>

<body>

<h2>Daily Working Hours</h2>

<table border="1" cellspacing="0" cellpadding="6">

    <!-- === ROW 1 === -->
    <tr>
        <td><input type="time" id="s1" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e1" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s2" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e2" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s3" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e3" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s4" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e4" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s5" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e5" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s6" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e6" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s7" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e7" oninput="calculateRowHours(1)"/></td>

        <td><input type="time" id="s8" oninput="calculateRowHours(1)"/></td>
        <td><input type="time" id="e8" oninput="calculateRowHours(1)"/></td>

        <td><input type="text" id="break1" readonly style="width:70px"/></td>
        <td id="totalHoursCell1">0.00</td>
    </tr>

    <!-- === ROW 2 === -->
    <tr>
        <td><input type="time" id="s1_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e1_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s2_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e2_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s3_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e3_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s4_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e4_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s5_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e5_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s6_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e6_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s7_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e7_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="time" id="s8_2" oninput="calculateRowHours(2)"/></td>
        <td><input type="time" id="e8_2" oninput="calculateRowHours(2)"/></td>

        <td><input type="text" id="break2" readonly style="width:70px"/></td>
        <td id="totalHoursCell2">0.00</td>
    </tr>

    <!-- === ROW 3 === -->
    <tr>
        <td><input type="time" id="s1_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e1_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s2_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e2_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s3_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e3_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s4_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e4_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s5_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e5_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s6_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e6_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s7_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e7_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="time" id="s8_3" oninput="calculateRowHours(3)"/></td>
        <td><input type="time" id="e8_3" oninput="calculateRowHours(3)"/></td>

        <td><input type="text" id="break3" readonly style="width:70px"/></td>
        <td id="totalHoursCell3">0.00</td>
    </tr>

    <!-- === ROW 4 === -->
    <tr>
        <td><input type="time" id="s1_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e1_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s2_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e2_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s3_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e3_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s4_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e4_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s5_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e5_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s6_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e6_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s7_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e7_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="time" id="s8_4" oninput="calculateRowHours(4)"/></td>
        <td><input type="time" id="e8_4" oninput="calculateRowHours(4)"/></td>

        <td><input type="text" id="break4" readonly style="width:70px"/></td>
        <td id="totalHoursCell4">0.00</td>
    </tr>

    <!-- === ROW 5 === -->
    <tr>
        <td><input type="time" id="s1_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e1_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s2_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e2_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s3_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e3_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s4_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e4_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s5_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e5_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s6_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e6_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s7_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e7_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="time" id="s8_5" oninput="calculateRowHours(5)"/></td>
        <td><input type="time" id="e8_5" oninput="calculateRowHours(5)"/></td>

        <td><input type="text" id="break5" readonly style="width:70px"/></td>
        <td id="totalHoursCell5">0.00</td>
    </tr>

    <!-- === ROW 6 === -->
    <tr>
        <td><input type="time" id="s1_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e1_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s2_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e2_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s3_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e3_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s4_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e4_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s5_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e5_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s6_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e6_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s7_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e7_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="time" id="s8_6" oninput="calculateRowHours(6)"/></td>
        <td><input type="time" id="e8_6" oninput="calculateRowHours(6)"/></td>

        <td><input type="text" id="break6" readonly style="width:70px"/></td>
        <td id="totalHoursCell6">0.00</td>
    </tr>

    <!-- === ROW 7 === -->
    <tr>
        <td><input type="time" id="s1_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e1_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s2_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e2_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s3_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e3_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s4_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e4_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s5_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e5_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s6_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e6_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s7_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e7_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="time" id="s8_7" oninput="calculateRowHours(7)"/></td>
        <td><input type="time" id="e8_7" oninput="calculateRowHours(7)"/></td>

        <td><input type="text" id="break7" readonly style="width:70px"/></td>
        <td id="totalHoursCell7">0.00</td>
    </tr>

</table>
<table style="margin-top:10px;">
    <tr>
        <td><b>Total Week Hours:</b></td>
        <td id="totalWeekHours" style="font-weight:bold;">0.00</td>
    </tr>
</table>


<!-- ================== JAVASCRIPT ================== -->
<script>

function calculateRowHours(rowIndex) {

    const suffix = rowIndex === 1 ? "" : "_" + rowIndex;

    let starts = [];
    let ends = [];

    for (let i = 1; i <= 8; i++) {
        const s = document.getElementById(`s${i}${suffix}`);
        const e = document.getElementById(`e${i}${suffix}`);
        if (!s || !e) continue;

        if (s.value && e.value) {
            starts.push(s.value);
            ends.push(e.value);
        }
    }

    if (starts.length === 0) {
        document.getElementById(`totalHoursCell${rowIndex}`).innerText = "0.00";
        document.getElementById(`break${rowIndex}`).value = "00:00";
        calculateTotalWeekHours();
        return;
    }

    const toMin = t => {
        const [h, m] = t.split(":").map(Number);
        return h * 60 + m;
    };

    let T = 0;

    for (let i = 0; i < starts.length; i++) {
        const diff = (toMin(ends[i]) - toMin(starts[i])) / 60;
        if (diff > 0) T += diff;
    }

    const O = (toMin(ends[ends.length - 1]) - toMin(starts[0])) / 60;

    let B = O - T;
    if (B < 0) B = 0;

    document.getElementById(`totalHoursCell${rowIndex}`).innerText = T.toFixed(2);

    const breakMin = Math.round(B * 60);
    const hh = String(Math.floor(breakMin / 60)).padStart(2, "0");
    const mm = String(breakMin % 60).padStart(2, "0");

    document.getElementById(`break${rowIndex}`).value = `${hh}:${mm}`;

    calculateTotalWeekHours();
}

function calculateTotalWeekHours() {
    let totalWeek = 0;

    for (let i = 1; i <= 7; i++) {
        const val = parseFloat(document.getElementById(`totalHoursCell${i}`).innerText) || 0;
        totalWeek += val;
    }

    document.getElementById("totalWeekHours").innerText = totalWeek.toFixed(2);
}

</script>

</body>
</html>
