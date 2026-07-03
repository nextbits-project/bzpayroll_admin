<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <title><spring:message code="BzComposer.creatermatitle" /></title>
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
                                <spring:message code="BzComposer.invoiceboard.createRMA" />
                            </span>
                        </div>


                        <div class="container-fluid border" style="padding: 14px !important;">
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
                                    <label class="form-label">Customer:</label>
                                    <select class="form-select" id="cvID">
                                        <option>Select Customer</option>
                                        <c:forEach items="${CustDetails}" var="objList" varStatus="loop">
                                            <option value="${objList.clientVendorID}">${objList.companyName} ( ${objList.lastName}, ${objList.firstName})</option>
                                        </c:forEach>
                                    </select>
                                    <!-- CustDetails -->
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Invoice Number:</label>
                                    <select class="form-select" id="orderNum" onchange="onChangeInvoiceNumber()">
                                        <option value="0">Select Invoice</option>
                                        <c:forEach items="${SalesBoardDetails}" var="objList" varStatus="loop">
                                            <option value="${objList.orderNum}">${objList.orderNumStr}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Bill/Ship -->
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Bill to:</h6>
                                    <textarea class="form-control mb-2"
                                        id="billto" rows="4"
                                        oninput="EditBillingAddressPage();"
                                        placeholder="Enter billing address"></textarea>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Ship to:</h6>
                                    <textarea class="form-control mb-2"
                                        id="shipto" rows="4"
                                        oninput="EditShippingAddressPage();"
                                        placeholder="Enter shipping address"></textarea>
                                </div>
                            </div>

                            <!-- Reason/Terms -->
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="form-label">Terms:</label>
                                    <input type="text" class="form-control" id="terms">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Reason for Credit:</label>
                                    <input type="text" class="form-control" id="creditReason">
                                </div>
                            </div>

                            <!-- Item Input Form -->
                            <div class="table-responsive mt-4">
                                <table class="table table-bordered align-middle text-center">
                                    <thead class="table-light">
                                        <tr>
                                            <th style="width: 120px;">Item Code</th>
                                            <th style="width: 300px;">Item Name</th>
                                            <th style="width: 70px;">Unit Price</th>
                                            <th style="width: 60px;">Qty</th>
                                            <th style="width: 80px;">Amount</th>
                                            <th style="width: 120px;">Exchange/Refund</th>
                                            <th style="width: 100px;">Memo</th>
                                            <th style="width: 90px;">Action</th>
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
                                                <input type="hidden" id="cartId"/>
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
                                            <th style="width: 120px;">Item Code</th>
                                            <th style="width: 300px;">Item Name</th>
                                            <th style="width: 70px;">Unit Price</th>
                                            <th style="width: 60px;">Qty</th>
                                            <th style="width: 80px;">Amount</th>
                                            <th style="width: 120px;">Exchange/Refund</th>
                                            <th style="width: 100px;">Memo</th>
                                            <th style="width: 90px;">Delete</th>
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
                                <button class="btn btn-primary" onclick="onSave()">Save Credit Memo</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" path="isBillToAddressChange" id="isBillToAddressChange" value="" />
    <input type="hidden" path="isShipToAddressChange" id="isShipToAddressChange" value="" />
    <input type="hidden" path="isNextTimeAppear" id="isNextTimeAppear" value="" />
    <input type="hidden" path="billToAddress" id="billToAddress" value="" />
    <input type="hidden" path="billToCity" id="billToCity" value="" />
    <input type="hidden" path="shipToAddress" id="shipToAddress" value="" />
    <input type="hidden" path="shipToCity" id="shipToCity" value="" />
<script>
cartlist = [];
function onChangeInvoiceNumber(){
    orderNum = document.getElementById("orderNum").value;
    $.ajax({
        type: "POST",
        url:"SalesAjax?tabid=GetInvoiceDetails&order_no="+orderNum,
        success : function(data) {
            console.log(data);
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
        var selectedId = selectElement.value;

        var selectedItem = cartlist.find(function(item) {
            return item.inventoryID === selectedId;
        });

        var selectedItemAdded = items.find(function(item) {
            return item.invId === selectedId;
        });
        if(selectedItemAdded != undefined){
            alert("This item already added");
            document.getElementById("itemName").value = "0";
            return;
        }
        if (selectedItem) {
            document.getElementById("cartId").value = selectedItem.cartId || "";
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
const cartId = document.getElementById("cartId");
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

let items = [];
let rowCount = 0;

addItemBtn.addEventListener("click", () => {
    if (!itemCode.value || !itemName.value || !qty.value || !unitPrice.value) {
        alert("Please fill out all item fields.");
        return;
    }

    const newItem = {
        invId: invId.value,
        cartId: cartId.value,
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
    cartId.value = "";
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
    rowCount++;
    const row = document.createElement("tr");
    row.innerHTML =
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
            // Get the item code (or invId) from the row to identify it in the array
            const code = row.cells[0].textContent;

            // Remove item from the `items` array
            items = items.filter(function(item) {
                return item.code !== code;
            });

            // Remove row from DOM
            row.parentNode.removeChild(row);
            updateTotal();
        }
    }
});


// Update total amount
function updateTotal() {
    let total = 0;
    itemTableBody.querySelectorAll("tr").forEach(row => {
    const amt = parseFloat(row.cells[4].textContent) || 0;
    total += amt;
    });
    document.getElementById("totalAmount").textContent = total.toFixed(2);
}

function onSave(){
    var cdate = document.getElementById("date").value;
    var orderNum = document.getElementById("orderNum").value;
    var cvID = document.getElementById("cvID").value;
    var billto = document.getElementById("billto").value;
    var shipto = document.getElementById("shipto").value;
    var creditReason = document.getElementById("creditReason").value;
    var terms = document.getElementById("terms").value;

    var shipToAddress = document.getElementById('shipToAddress').value;
    var shipToCity = document.getElementById('shipToCity').value;
    var isShipToAddressChange = document.getElementById('isShipToAddressChange').value;

    var billToAddress = document.getElementById('billToAddress').value;
    var billToCity = document.getElementById('billToCity').value;
    var isBillToAddressChange = document.getElementById('isBillToAddressChange').value;
    

    var data ={
        "cdate": cdate,
        "orderNum": orderNum,
        "cvID": cvID,
        "billTo": billto,
        "shipTo": shipto,
        "creditReason": creditReason,
        "terms": terms,
        "items": items,
        "isShipToAddressChange": isShipToAddressChange,
        "shipToAddress": shipToAddress,
        "shipToCity": shipToCity,
        "isBillToAddressChange": isBillToAddressChange,
        "billToAddress": billToAddress,
        "billToCity": billToCity

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
        url: "RMABoard?tabid=CreateNewRMA&orderNumber="+orderNum,
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




function EditBillingAddressPage(form) {
    orderNum = document.getElementById("orderNum").value;
    if(orderNum == 0){
        document.getElementById('billto').value = "";
        showValidationDialog();
        return;
    }
    document.getElementById('isBillToAddressChange').value = "true";
    var billTo = document.getElementById('billto').value;
    var lines = billTo.split('\n').map(line => line.trim()).filter(line => line !== '');
     var addressDB = '';
     var cityDB = '';
     if (lines.length > 0) {
         cityDB = lines[lines.length - 1];
         if (lines.length > 1) {
             addressDB = lines.slice(0, -1).join('\n');
         }
     }
     document.getElementById('billToAddress').value = addressDB;
     document.getElementById('billToCity').value = cityDB;
     console.log('Address (for DB):', addressDB);
     console.log('City (for DB):', cityDB);
}
function EditShippingAddressPage(form) {
    orderNum = document.getElementById("orderNum").value;
    if(orderNum == 0){
        document.getElementById('shipto').value = "";
        showValidationDialog();
        return;
    }
    document.getElementById('isShipToAddressChange').value = "true";
    var shipTo = document.getElementById('shipto').value;
    var lines = shipTo.split('\n').map(line => line.trim()).filter(line => line !== '');
     var addressDB = '';
     var cityDB = '';
     if (lines.length > 0) {
         cityDB = lines[lines.length - 1];
         if (lines.length > 1) {
             addressDB = lines.slice(0, -1).join('\n');
         }
     }
     document.getElementById('shipToAddress').value = addressDB;
     document.getElementById('shipToCity').value = cityDB;
     console.log('Address (for DB):', addressDB);
     console.log('City (for DB):', cityDB);
}

function showValidationDialog(){
	event.preventDefault();
	$("#showValidationDialog").dialog({
    	resizable: false,
        height: 200,
        width: 300,
        modal: true,
        buttons: {
            "<spring:message code='BzComposer.global.ok'/>": function () {
                $(this).dialog("close");
            }
        }
    });
    return false;
}
</script>
</body>
<div id="showSuccessDialog" style="display:none;">
    <p><spring:message code="BzComposer.CreditMemo.RMASaved"/></p>
</div>
<div id="showValidationDialog" style="display: none;">
	<p>
		<spring:message code="BzComposer.Estimaion.cName.Validation" />
	</p>
</div>
</html>
