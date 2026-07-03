<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Assembly</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 60%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .form-group {
            display: flex;
            margin-bottom: 15px;
        }
        .form-group label {
            flex: 1;
            margin-right: 10px;
        }
        .form-group input,
        .form-group select {
            flex: 2;
            padding: 5px;
            font-size: 14px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table th, table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
            font-size: 14px;
        }
        table th {
            background-color: #f0f0f0;
        }
        table td input, table td select {
            width: 90%;
            padding: 5px;
            font-size: 13px;
            box-sizing: border-box;
        }
        table td input[readonly] {
            background-color: #e9e9e9;
            cursor: not-allowed;
        }
        .footer {
            margin-top: 20px;
        }
        .footer .form-group {
            margin-bottom: 10px;
        }
        .buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        button {
            padding: 8px 15px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        
        .buttons-top {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .buttons-top button {
            padding: 8px 15px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .buttons-top button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
    	<div class="buttons-top">
            <button onclick="switchToNewItem()">New Item</button>
            <button onclick="switchToTemplate()">Template</button>
        </div>
        <h2>New Item</h2>
        <form>
            <div class="form-group">
                <label for="type">Type</label>
                <select id="type" name="type">
                    <option value="assembled_pc">Assembled PC I5</option>
                    <option value="assembled_notebook">Assembled Notebook I5</option>
                    <option value="gift_pack">Assembled Christmas Gift Pack</option>
                </select>
            </div>
            <div class="form-group">
                <label for="itemName">Item Name/Number</label>
                <input type="text" id="itemName" name="itemName">
            </div>
            <div class="form-group">
                <label for="cogsAccount">COGS Account</label>
                <select id="cogsAccount" name="cogsAccount">
                    <option value="50000">50000 - Cost of Goods Sold</option>
                    <option value="other_account">Other Account</option>
                </select>
            </div>
            <div class="form-group">
                <label for="salesPrice">Sales Price</label>
                <input type="number" id="salesPrice" name="salesPrice" step="0.01">
            </div>
            <div class="form-group">
                <label for="incomeAccount">Income Account</label>
                <select id="incomeAccount" name="incomeAccount">
                    <option value="40200">40200 - Product Sales</option>
                    <option value="other_income">Other Income</option>
                </select>
            </div>

            <h3>Bill of Materials</h3>
            <table>
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Description</th>
                        <th>Type</th>
                        <th>Cost</th>
                        <th>Qty</th>
                        <th>U/M</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody id="billOfMaterials">
                    <tr>
                        <td><input type="text" name="item[]"></td>
                        <td><input type="text" name="description[]"></td>
                        <td><select name="type[]"><option value="inv_part">Inv Part</option></select></td>
                        <td><input type="number" name="cost[]" step="0.01"></td>
                        <td><input type="number" name="qty[]" step="1"></td>
                        <td><input type="text" name="uom[]"></td>
                        <td><input type="number" name="total[]" readonly></td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6" style="text-align: right;"><b>Total Bill of Materials Cost:</b></td>
                        <td><input type="number" id="totalCost" name="totalCost" readonly></td>
                    </tr>
                </tfoot>
            </table>
            <button type="button" onclick="addRow()">Add Item</button>

            <div class="footer">
    <h3>Inventory Information</h3>
    <div class="form-group" style="display: flex; flex-wrap: wrap; gap: 15px;">
        <div style="flex: 1;">
            <label for="assetAccount">Asset Account</label>
            <select id="assetAccount" name="assetAccount" style="width: 100%;">
                <option value="12000">12000 - Inventory Asset</option>
                <option value="other_asset">Other Asset</option>
            </select>
        </div>
        <div style="flex: 0.5;">
            <label for="buildPoint">Build Point</label>
            <input type="number" id="buildPoint" name="buildPoint" step="1" style="width: 100%;">
        </div>
        <div style="flex: 0.5;">
            <label for="onHand">On Hand</label>
            <input type="number" id="onHand" name="onHand" step="1" style="width: 100%;">
        </div>
        <div style="flex: 0.5;">
            <label for="totalValue">Total Value</label>
            <input type="number" id="totalValue" name="totalValue" readonly style="width: 100%;">
        </div>
        <div style="flex: 0.5;">
            <label for="asOf">As of</label>
            <input type="date" id="asOf" name="asOf" style="width: 100%;">
        </div>
    </div>
</div>

            <div class="buttons">
                <button type="submit">OK</button>
                <button type="button">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        function addRow() {
            const table = document.getElementById('billOfMaterials');
            const newRow = document.createElement('tr');
            newRow.innerHTML = `
                <td><input type="text" name="item[]"></td>
                <td><input type="text" name="description[]"></td>
                <td><select name="type[]"><option value="inv_part">Inv Part</option></select></td>
                <td><input type="number" name="cost[]" step="0.01"></td>
                <td><input type="number" name="qty[]" step="1"></td>
                <td><input type="text" name="uom[]"></td>
                <td><input type="number" name="total[]" readonly></td>
            `;
            table.appendChild(newRow);
        }
        
        function switchToNewItem() {
            document.getElementById("newItemSection").style.display = "block";
            document.getElementById("templateSection").style.display = "none";
        }

        function switchToTemplate() {
            document.getElementById("newItemSection").style.display = "none";
            document.getElementById("templateSection").style.display = "block";
        }

        document.getElementById("type").addEventListener("change", function() {
            const templateSelection = document.getElementById("templateSelection");
            templateSelection.style.display = this.value === "template" ? "block" : "none";
        });
    </script>
</body>
</html>
