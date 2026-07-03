<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>Credit Memo</title>
<style type="text/css">

.dhtmlgoodies_answer{ height: 600px !important; }
.height250 { height: 250px; }
.fht-tbody{ height: 180px !important; border-bottom: 1px solid rgb(207, 207, 207); }
#creditMemoTable {width: 100%;border: 1px solid rgb(207, 207, 207);margin: 0px 0px 0px 0px;}
#creditMemoTable thead th{ font-size:14px; border: 1px solid rgb(207, 207, 207); }
#creditMemoTable tbody td{ font-size:14px; border: 1px solid rgb(207, 207, 207); }
#creditMemoTable tbody tr:nth-child(even) td { background: #f2f2f2; }
</style>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            font-size: 14px;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 10px;
        }
        .col-50 {
            flex: 0 0 50%;
            padding: 5px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], input[type="email"], input[type="number"] {
            width: 95%;
            padding: 6px;
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 13px;
        }
        th, td {
            border: 1px solid #999;
            padding: 8px;
            text-align: center;
        }
        .total {
            text-align: right;
            margin-top: 10px;
            font-weight: bold;
        }
        button {
            padding: 5px 10px;
            margin-top: 10px;
        }
    </style>


</head>
<body>

<div class="container">
    <h2>CREDIT MEMO</h2>

    <form action="${pageContext.request.contextPath}/creditMemo/save" method="post">

        <div class="row">
            <div class="col-50">
                <label>Date:</label>
                <input type="date" name="date">
            </div>
            <div class="col-50">
                <label>Customer Invoice Number:</label>
                <input type="text" name="invoiceNumber">
            </div>
        </div>

        <div class="row">
            <div class="col-50">
                <h3>Bill To:</h3>
                <label>Address:</label>
                <input type="text" name="billAddress">
                <label>City:</label>
                <input type="text" name="billCity">
                <label>State/Province:</label>
                <input type="text" name="billState">
                <label>Zip/Postal Code:</label>
                <input type="text" name="billZip">
                <label>Phone:</label>
                <input type="text" name="billPhone">
                <label>Email:</label>
                <input type="email" name="billEmail">
            </div>

            <div class="col-50">
                <h3>Ship To:</h3>
                <label>Address:</label>
                <input type="text" name="shipAddress">
                <label>City:</label>
                <input type="text" name="shipCity">
                <label>State/Province:</label>
                <input type="text" name="shipState">
                <label>Zip/Postal Code:</label>
                <input type="text" name="shipZip">
                <label>Phone:</label>
                <input type="text" name="shipPhone">
                <label>Email:</label>
                <input type="email" name="shipEmail">
            </div>
        </div>

        <div class="row">
            <div class="col-50">
                <label>Reason for Credit:</label>
                <input type="text" name="reason">
            </div>
            <div class="col-50">
                <label>Approved By:</label>
                <input type="text" name="approvedBy">
            </div>
        </div>

        <table id="itemTable">
            <thead>
                <tr>
                    <th>Invoice</th>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="invoice1" /></td>
                    <td><input type="text" name="item1" /></td>
                    <td><input type="number" name="quantity1" /></td>
                    <td><input type="text" name="description1" /></td>
                    <td><input type="number" name="price1" step="0.01" /></td>
                    <td><input type="number" name="total1" step="0.01" /></td>
                </tr>
                <tr>
                    <td><input type="text" name="invoice2" /></td>
                    <td><input type="text" name="item2" /></td>
                    <td><input type="number" name="quantity2" /></td>
                    <td><input type="text" name="description2" /></td>
                    <td><input type="number" name="price2" step="0.01" /></td>
                    <td><input type="number" name="total2" step="0.01" /></td>
                </tr>
                <tr>
                    <td><input type="text" name="invoice3" /></td>
                    <td><input type="text" name="item3" /></td>
                    <td><input type="number" name="quantity3" /></td>
                    <td><input type="text" name="description3" /></td>
                    <td><input type="number" name="price3" step="0.01" /></td>
                    <td><input type="number" name="total3" step="0.01" /></td>
                </tr>
            </tbody>
        </table>

        <div class="total">
            Total Amount of Credit: $<span id="grandTotal">0.00</span>
        </div>

        <button type="submit">Save Credit Memo</button>
        <button type="button" onclick="addRow()">Add More Rows</button>

    </form>

</div>

<script>
    function addRow() {
        var table = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
        var newRow = table.rows[0].cloneNode(true);
        table.appendChild(newRow);
    }
</script>
</body>
</html>