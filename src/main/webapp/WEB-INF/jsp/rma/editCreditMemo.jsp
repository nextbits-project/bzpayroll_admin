<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <title>
        <spring:message code='BzComposer.CreditMemo.edit.title'/>
    </title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .credit-memo-header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            font-weight: bold;
            text-align: center;
        }

        .table th,
        .table td {
            vertical-align: middle;
        }
        .form-select:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow:none;
        }
        .form-control:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow:none;
        }
    </style>
</head>

<body>
    <div id="ddcolortabsline">&nbsp;</div>

    <div id="cos">
        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">
                        <div class="pt-3 pb-3">
                            <span style="font-size: 1.2em;">
                                <spring:message code="BzComposer.CreditMemo.edit" />
                            </span>
                        </div>


                        <div class="container-fluid border p-4">
                            <!-- Header Info -->
                            <div class="row mt-3">
                                <div class="col-md-3">
                                    <label for="date" class="form-label fw-bold">Date:</label>
                                    <input type="date" id="date" class="form-control" value="">
                                </div>
                            </div>

                            <!-- Customer/Invoice -->
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Invoice Number:</label>
                                    <select class="form-select" id="orderNum" onchange="onChangeInvoiceNumber()">
                                        <option value="0">Select Invoice</option>
                                        <c:forEach items="${SalesBoardDetails}" var="objList" varStatus="loop">
                                            <option value="${objList.orderNum}">
                                                ${objList.orderNumStr}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Customer:</label>
                                    <select class="form-select" id="cvID">
                                        <option>Select Customer</option>
                                        <c:forEach items="${CustDetails}" var="objList" varStatus="loop">
                                            <option value="${objList.clientVendorID}"
                                            <c:if test="${objList.clientVendorID == creditMemoDto.clientVendorID}">selected</c:if>>
                                                ${objList.companyName} ( ${objList.lastName}, ${objList.firstName})
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <!-- CustDetails -->
                                </div>
                            </div>

                            <!-- Bill/Ship -->
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Bill to:</h6>
                                    <textarea class="form-control mb-2"
                                        id="billto" rows="4"
                                        placeholder="Enter billing address">${creditMemoDto.billingAddr}</textarea>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Ship to:</h6>
                                    <textarea class="form-control mb-2"
                                        id="shipto" rows="4"
                                        placeholder="Enter shipping address">${creditMemoDto.shippingAddr}</textarea>
                                </div>
                            </div>

                            <!-- Reason/Terms -->
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="form-label">Reason for Credit:</label>
                                    <input type="text" class="form-control" value="${creditMemoDto.reason}" id="creditReason">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Terms:</label>
                                    <input type="text" class="form-control" value="${creditMemoDto.terms}" id="terms">
                                </div>
                            </div>

                            <!-- Item Input Form -->
                            <div class="table-responsive mt-4">
                                <table class="table table-bordered align-middle text-center">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Item Code</th>
                                            <th>Item Name</th>
                                            <th>Unit Price</th>
                                            <th>Qty</th>
                                            <th>Amount</th>
                                            <th>Exchange/Refund</th>
                                            <th>Memo</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <select id="itemName" class="form-select" onchange="itemOnchange(this)">
                                                    <option value="0">Select Item Code</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="hidden" id="invId"/>
                                                <input id="itemCode" class="form-control" type="text">
                                            </td>
                                            
                                            <td><input id="unitPrice" class="form-control" type="number"
                                                    step="0.01"></td>
                                            <td><input id="qty" class="form-control" type="number"></td>
                                            <td><input id="amount" class="form-control" type="number"
                                                    step="0.01" readonly></td>
                                            <td>
                                                <select id="exchange" class="form-select">
                                                    <option>Exchange</option>
                                                    <option>Refund</option>
                                                </select>
                                            </td>
                                            <td><input id="memo" class="form-control" type="text"></td>
                                            <td><button id="addItemBtn"
                                                    class="btn btn-success btn-sm">Add Item</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Display Added Rows -->
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="itemTable">
                                    <thead class="table-secondary">
                                        <tr>
                                            <th>#</th>
                                            <th>Item Code</th>
                                            <th>Item Name</th>
                                            <th>Unit Price</th>
                                            <th>Qty</th>
                                            <th>Amount</th>
                                            <th>Exchange/Refund</th>
                                            <th>Memo</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>

                            <!-- Total + Buttons -->
                            <div class="text-end mb-3">
                                <strong>Total Amount of Credit: $<span
                                        id="totalAmount">0.00</span></strong>
                            </div>
                            <div class="d-flex justify-content-end gap-2">
                                <button class="btn btn-primary">Print</button>
                                <button class="btn btn-primary" onclick="onUpdate()">Update Credit Memo</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="creditMemoId" value="${creditMemoDto.creditMemoId}"/>
    </div>
<script>
cartlist = [];
var items = [];
let rowCount = 0;

function onChangeInvoiceNumber(){
    items = [];
    orderNum = document.getElementById("orderNum").value;
    $.ajax({
        type: "POST",
        url:"SalesAjax?tabid=GetInvoiceDetails&order_no="+orderNum,
        success : function(data) {
            console.log(data);
            items = [];
            document.getElementById("billto").value = data.billTo;
            document.getElementById("shipto").value = data.shipTo;
            document.getElementById("cvID").value = data.custID;
            cartlist = [];
            cartlist = data.cart;
            // Clear existing options except the default one
            var itemNameSelect = document.getElementById("itemName");
            itemNameSelect.innerHTML = '<option value="0">Select Item Code</option>';

            // Populate new options from cartlist
            cartlist.forEach(function(item) {
                var option = document.createElement("option");
                option.value = item.inventoryID; // item ID
                option.text = item.invDesc;      // item name
                itemNameSelect.appendChild(option);
            });
        },
        error : function(data) {
            alert("Error occurred");
        }
    });
}
function itemOnchange(selectElement) {
        debugger;
        var selectedId = selectElement.value;

        var selectedItem = cartlist.find(function(item) {
            return item.inventoryID === selectedId;
        });

        var selectedItemAdded = items.find(function(item) {
            return item.invId === selectedId;
        });

        var isExiting = checkExiting(selectedId);

        if(selectedItemAdded != undefined || isExiting != undefined){
            alert("This item already added");
            document.getElementById("itemName").value = "0";
            return;
        }
        if (selectedItem) {
            console.log("Selected Item:", selectedItem);
            

            document.getElementById("invId").value = selectedItem.inventoryID || "";
            document.getElementById("itemCode").value = selectedItem.invDesc || "";
            document.getElementById("unitPrice").value = selectedItem.uprice || "";
            document.getElementById("qty").value = selectedItem.qty || "";
            const price = parseFloat(selectedItem.uprice) || 0;
            const quantity = parseInt(selectedItem.qty) || 0;
            var amount = (price * quantity).toFixed(2);
            document.getElementById("amount").value = amount;
            // Add more fields as needed
        } else {
            console.log("Item not found.");
        }
    }

document.getElementById("date").value = new Date().toISOString().split('T')[0];

const itemTableBody = document.getElementById("itemTable").querySelector("tbody");

const itemCode = document.getElementById("itemCode");
const invId = document.getElementById("invId");
const itemName = document.getElementById("itemName");
const unitPrice = document.getElementById("unitPrice");
const qty = document.getElementById("qty");
const amount = document.getElementById("amount");
const exchange = document.getElementById("exchange");
const memo = document.getElementById("memo");

const addItemBtn = document.getElementById("addItemBtn");

// Auto-calculate amount
[unitPrice, qty].forEach(el => {
    el.addEventListener("input", () => {
    const price = parseFloat(unitPrice.value) || 0;
    const quantity = parseInt(qty.value) || 0;
    amount.value = (price * quantity).toFixed(2);
    });
});


addItemBtn.addEventListener("click", () => {
    if (!itemCode.value || !itemName.value || !qty.value || !unitPrice.value) {
        alert("Please fill out all item fields.");
        return;
    }

    const newItem = {
        invId: invId.value,
        code: itemCode.value,
        name: itemName.value,
        price: parseFloat(unitPrice.value).toFixed(2),
        qty: qty.value,
        amount: amount.value,
        exchange: exchange.value,
        memo: memo.value
    };

    items.push(newItem); // Add to global array
    addItemToTable(newItem);

    // Clear inputs
    invId.value = "";
    itemCode.value = "";
    itemName.value = "";
    unitPrice.value = "";
    qty.value = "";
    amount.value = "";
    exchange.value = "Exchange";
    memo.value = "";
});

// Function to add item row
function addItemToTable(item) {
    debugger;
    rowCount++;
    const row = document.createElement("tr");
    row.innerHTML =
        '<td>' + rowCount + '</td>' +
        '<td>' + item.code + '</td>' +
        '<td>' + item.name + '</td>' +
        '<td>' + item.price + '</td>' +
        '<td>' + item.qty + '</td>' +
        '<td>' + item.amount + '</td>' +
        '<td>' + item.exchange + '</td>' +
        '<td>' + item.memo + '</td>' +
        '<td><button class="btn btn-danger btn-sm deleteRowBtn">Delete</button></td>';

    itemTableBody.appendChild(row);
    updateTotal();
}

itemTableBody.addEventListener("click", (e) => {
    if (e.target.classList.contains("deleteRowBtn")) {
        const row = e.target.closest("tr");
        if (row && row.parentNode) {
            row.parentNode.removeChild(row);
            updateTotal();
        }
    }
});

// Update total amount
function updateTotal() {
    let total = 0;
    itemTableBody.querySelectorAll("tr").forEach(row => {
    const amt = parseFloat(row.cells[5].textContent) || 0;
    total += amt;
    });
    document.getElementById("totalAmount").textContent = total.toFixed(2);
}

function onUpdate(){
    debugger;
    var cdate = document.getElementById("date").value;
    var orderNum = document.getElementById("orderNum").value;
    var cvID = document.getElementById("cvID").value;
    var billto = document.getElementById("billto").value;
    var shipto = document.getElementById("shipto").value;
    var creditReason = document.getElementById("creditReason").value;
    var terms = document.getElementById("terms").value;
    var creditMemoId = document.getElementById("creditMemoId").value;

    var data ={
        "creditMemoId": creditMemoId,
        "cdate": cdate,
        "orderNum": orderNum,
        "cvID": cvID,
        "billTo": billto,
        "shipTo": shipto,
        "creditReason": creditReason,
        "terms": terms,
        "items": items
    };
    if(orderNum == "0"){
        alert("Please select invoice number");
        return;
    }
    if(items.length == 0){
        alert("Please at least add 1 product for Exchange/Refund");
        return;
    }
	var obj = JSON.stringify(data);

    $.ajax({
        type: "POST",
        url: "SalesBord?tabid=updateCreditMemo",
        data: "data=" + obj,
        success: function (data) {
            showSuccessDialog();
        }
        ,
        error: function (data) {
            //return showerrordialog();
        }
    });
}
function showSuccessDialog() {
    event.preventDefault();
    $("#showSuccessDialog").dialog({
        resizable: false,
        height: 200,
        width: 350,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
                window.close();
                window.location.reload();
            }
        }
    });
    return false;
}
</script>
<script type="text/javascript">
    var itemsdb = [];

    <c:forEach var="item" items="${creditMemoDto.items}">
        itemsdb.push({
            invId: "${fn:escapeXml(item.invId)}",
            code: "${fn:escapeXml(item.itemCode)}",
            name: "${fn:escapeXml(item.item)}",
            price: ${item.price},
            qty: ${item.quantity},
            amount: ${item.total},
            exchange: "${fn:escapeXml(item.exchangeRefund)}",
            memo: "${fn:escapeXml(item.memo)}"
        });
    </c:forEach>

    function checkExiting(selectedId){
        var itemsdb = [];
        <c:forEach var="item" items="${creditMemoDto.items}">
            itemsdb.push({
                invId: "${fn:escapeXml(item.invId)}",
                code: "${fn:escapeXml(item.itemCode)}",
                name: "${fn:escapeXml(item.item)}",
                price: ${item.price},
                qty: ${item.quantity},
                amount: ${item.total},
                exchange: "${fn:escapeXml(item.exchangeRefund)}",
                memo: "${fn:escapeXml(item.memo)}"
            });
        </c:forEach> 

            var selectedItemAdded = itemsdb.find(function(item) {
                return item.invId === selectedId;
            });
        return selectedItemAdded;
    }
    window.onload = function () {
    document.getElementById("orderNum").value = ${creditMemoDto.orderNo};
    onChangeInvoiceNumber();
    itemsdb.forEach(function(item) {
        items.push(item);
        addItemToTable(item);
    });
console.log(items);

};
</script>






</body>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.CreditMemo.updateCreditMemo"/></p>
</div>
</html>