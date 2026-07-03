// Wait for the DOM to load
document.addEventListener("DOMContentLoaded", async () => {
    await loadEmployees();
});

let employeeList = [];
let employeeId;
let selectedEmployee;

async function loadEmployees() {
    try {
        const response = await fetch(`/api/employee-list`);
        employeeList = await response.json();
        renderEmployeeList();
    } catch (error) {
        console.error('Error loading employees', error);
    }
}

function renderEmployeeList() {
    const employeeTableBody = document.getElementById('employeeTableBody');
       employeeTableBody.innerHTML = '';
       employeeList.forEach(employee => {
           console.log("Fetched employee -> ",employee);
           const row = document.createElement('tr');
           row.innerHTML = `<td class="list-group-item list-group-item-action">${employee.fname} ${employee.lname}</td>`;
           row.dataset.id = employee.employeeID;
           row.addEventListener("click", () => displayEmployeeForms(employee));
           employeeTableBody.appendChild(row);
       });
}

function displayEmployeeForms(employee) {
    employeeId = employee.employeeID;
    selectedEmployee = employee;

    const w2Form = document.getElementById('w2Form');
    const form1099 = document.getElementById('form1099');

    fillForm(w2Form, employee.w2Form || {}, employee);
    fillForm(form1099, employee.form1099 || {}, employee);

    document.querySelectorAll('tr').forEach(row => row.classList.remove('selected'));
    document.querySelector(`tr[data-id="${employee.employeeID}"]`).classList.add('selected');
}

function fillForm(form, formData, employeeData = {}) {
    console.log("Employee in fill form ", employeeData);
    selectedEmployee = employeeData;
    const defaultValues = {
        employeeName: (employeeData.fname + " "+ employeeData.lname)|| '',
        ssn: employeeData.ssn || '',
        recipientName: (employeeData.fname + " "+ employeeData.lname)|| '',
        recipientAddress: (employeeData.address1 +", " + employeeData.address2 + ", " + employeeData.city + ", " + employeeData.state)  || ''
    };
    console.log("default value name => ", defaultValues, + " recipie");
    const combinedData = { ...defaultValues, ...formData };

    for (const key in combinedData) {
        const input = form.querySelector(`[name="${key}"]`);
        if (input) {
            input.value = combinedData[key];
        }
    }
}

// Handle form submission with disable and re-enable logic
w2Form.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(w2Form, 'w2');
});

form1099.addEventListener('submit', function (event) {
    event.preventDefault();
    submitForm(form1099, 'form1099');
});

async function submitForm(form, formType) {
    const submitButton = form.querySelector('button[type="submit"]');
    submitButton.innerText = "Updating...";
    submitButton.disabled = true;

    if (!selectedEmployee || !selectedEmployee.employeeID) {
        alert('No employee selected');
        resetButton(submitButton, formType);
        return;
    }

    const formData = new FormData(form);
    const jsonData = Object.fromEntries(formData.entries());

    if (formType === 'w2') {
        selectedEmployee.w2Form = jsonData;
    } else if (formType === 'form1099') {
        selectedEmployee.form1099 = jsonData;
    }

    const requestBody = {
        employeeId: selectedEmployee.employeeID,
        w2Form: selectedEmployee.w2Form || {},
        form1099: selectedEmployee.form1099 || {}
    };

    try {
        const response = await fetch(`/api/employee/${selectedEmployee.employeeID}/updateForms`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(requestBody)
        });

        const updatedData = await response.json();

        selectedEmployee = { ...selectedEmployee, ...updatedData, employeeID: selectedEmployee.employeeID };

        requestAnimationFrame(() => {
            const updatedDefaultValues = {
                employeeName: (updatedData.fname + " " + updatedData.lname) || '',
                ssn: updatedData.ssn || '',
                recipientName: (updatedData.fname + " " + updatedData.lname) || '',
                recipientAddress: (updatedData.address1 + ", " + updatedData.address2 + ", " + updatedData.city + ", " + updatedData.state) || ''
            };

            if (formType === 'w2') {
                fillForm(form, { ...selectedEmployee.w2Form, ...updatedDefaultValues });
            } else if (formType === 'form1099') {
                fillForm(form, { ...selectedEmployee.form1099, ...updatedDefaultValues });
            }
        });

    } catch (error) {
        console.error('Error updating form:', error);
        alert("Error in updating data");
    } finally {
        resetButton(submitButton, formType);
    }
}

function resetButton(button, formType) {
    button.disabled = false;
    button.innerText = formType === 'w2' ? "Submit W-2 Form" : "Submit 1099 Form";
}
