<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Assembly Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        input[type="text"], input[type="number"], select {
            padding: 5px;
            font-size: 14px;
            width: 100%;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .input-row {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .input-row input, .input-row select {
            flex: 1;
        }
    </style>
    <script>
        function addRow() {
    // Get input values
    const itemCode = document.getElementById("itemCode").value;
    const itemName = document.getElementById("itemName").value;
    const purchasePrice = document.getElementById("purchasePrice").value;
    const quantity = document.getElementById("quantity").value;
    const status = document.getElementById("status").value;

    // Validate input
    if (!itemCode || !itemName || !purchasePrice || !quantity) {
        alert("Please fill in all fields.");
        return;
    }

    // Create a new row
    const table = document.getElementById("assemblyTable").querySelector("tbody");
    const row = table.insertRow();

    // Add cells and set values dynamically
    const checkboxCell = row.insertCell(0);
    const itemCodeCell = row.insertCell(1);
    const itemNameCell = row.insertCell(2);
    const purchasePriceCell = row.insertCell(3);
    const quantityCell = row.insertCell(4);
    const statusCell = row.insertCell(5);

    // Add checkbox
    const checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkboxCell.appendChild(checkbox);

    // Set text values for cells
    itemCodeCell.textContent = itemCode;
    itemNameCell.textContent = itemName;
    purchasePriceCell.textContent = purchasePrice;

    // Add input field for quantity
    const quantityInput = document.createElement("input");
    quantityInput.type = "number";
    quantityInput.value = quantity;
    quantityInput.min = "1";
    quantityCell.appendChild(quantityInput);

    // Add dropdown for status
    const statusDropdown = document.createElement("select");
    const activeOption = document.createElement("option");
    const inactiveOption = document.createElement("option");

    activeOption.value = "Active";
    activeOption.textContent = "Active";
    inactiveOption.value = "Inactive";
    inactiveOption.textContent = "Inactive";

    if (status === "Active") {
        activeOption.selected = true;
    } else {
        inactiveOption.selected = true;
    }

    statusDropdown.appendChild(activeOption);
    statusDropdown.appendChild(inactiveOption);
    statusCell.appendChild(statusDropdown);

    // Clear input fields
    document.getElementById("itemCode").value = "";
    document.getElementById("itemName").value = "";
    document.getElementById("purchasePrice").value = "";
    document.getElementById("quantity").value = "1";
    document.getElementById("status").value = "Active";
}


        function submitSelection() {
            const selectedItems = [];
            const rows = document.querySelectorAll("#assemblyTable tbody tr");

            rows.forEach((row) => {
                const checkbox = row.querySelector("input[type='checkbox']");
                const quantity = row.querySelector("input[type='number']").value;
                const status = row.querySelector("select").value;

                if (checkbox.checked) {
                    const itemCode = row.cells[1].innerText;
                    const itemName = row.cells[2].innerText;
                    const purchasePrice = row.cells[3].innerText;

                    selectedItems.push({
                        itemCode,
                        itemName,
                        purchasePrice,
                        quantity,
                        status
                    });
                }
            });

            if (selectedItems.length > 0) {
                console.log("Selected Items:", selectedItems);
                alert("Selected items submitted! Check the console for details.");
            } else {
                alert("No items selected.");
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Assembly Products</h1>

        <!-- Input Fields -->
        <div class="input-row">
            <input type="text" id="itemCode" placeholder="Item Code">
            <input type="text" id="itemName" placeholder="Item Name">
            <input type="text" id="purchasePrice" placeholder="Purchase Price">
            <input type="number" id="quantity" placeholder="Quantity" value="1" min="1">
            <select id="status">
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
            </select>
        </div>
        <button onclick="addRow()">Add Item</button>

        <!-- Table -->
        <table id="assemblyTable">
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Item Code</th>
                    <th>Item Name</th>
                    <th>Purchase Price</th>
                    <th>Quantity</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic rows will be added here -->
            </tbody>
        </table>

        <div class="actions">
            <button onclick="submitSelection()">Submit</button>
        </div>
    </div>
</body>
</html>
