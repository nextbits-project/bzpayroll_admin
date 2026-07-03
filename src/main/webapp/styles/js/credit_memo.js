function addLineItem() {
    let table = document.getElementById("lineItemsBody");

    let row = table.insertRow();
    row.innerHTML = `
        <td><input type="text" name="invoice[]"></td>
        <td><input type="text" name="itemCode[]"></td>
        <td><input type="number" name="quantity[]" oninput="calculateLineTotal(this)"></td>
        <td><input type="text" name="description[]"></td>
        <td><input type="number" step="0.01" name="unitPrice[]" oninput="calculateLineTotal(this)"></td>
        <td><input type="text" name="lineTotal[]" readonly></td>
        <td><button type="button" onclick="removeLineItem(this)">Remove</button></td>
    `;
}

function calculateLineTotal(element) {
    let row = element.parentElement.parentElement;
    let quantity = row.querySelector('input[name="quantity[]"]').value;
    let unitPrice = row.querySelector('input[name="unitPrice[]"]').value;
    let lineTotalField = row.querySelector('input[name="lineTotal[]"]');

    let lineTotal = (quantity * unitPrice) || 0;
    lineTotalField.value = lineTotal.toFixed(2);

    updateTotalAmount();
}

function removeLineItem(button) {
    let row = button.parentElement.parentElement;
    row.remove();
    updateTotalAmount();
}

function updateTotalAmount() {
    let total = 0;
    document.querySelectorAll('input[name="lineTotal[]"]').forEach(input => {
        total += parseFloat(input.value) || 0;
    });
    document.getElementById("totalAmount").innerText = total.toFixed(2);
}
