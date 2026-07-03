let stateTaxRates = [];
let selectedState = "California";
let selectedYear = "2024";
let selectedFrequency = "ANNUALLY";
let federalTaxRates = [];
let selectedFederalYear = "2025";
let deleteFederalTaxId = null;
const states = [
    "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware",
    "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
    "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi",
    "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico",
    "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
    "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
    "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
];

const stateTaxContainer = document.getElementById("state-tax-container");
const federalTaxContainer = document.getElementById("federal-tax-container");
const sidebarNav = document.getElementById("state-list");
const federalTaxTab = document.getElementById("federal-tax-tab");
const yearSelection = document.getElementById("select-year");
const paymentFrequencyRadios = document.querySelectorAll("input[name='paymentFrequency']");
const federalYearSelection = document.getElementById("select-federal-year");
const standardDeductionTable = document.getElementById('standard-deduction-table-body');
const exemptionAllowanceTable = document.getElementById('exemption-allowance-table-body');
const tableADeductions = document.getElementById("table-a-deduction-body");
let isCaliforniaSelected = false;
let isFederalSelected = false;

//Sidebar code

document.addEventListener("DOMContentLoaded", function () {
    states.forEach(state => {
        const li = document.createElement("li");
        li.classList.add("nav-item");
        li.innerHTML = `<a href="#" class="nav-link state-select">${state}</a>`;
        sidebarNav.appendChild(li);
    });

    highlightSelectedItem();
    yearSelection.value = selectedYear;
    document.getElementById(selectedFrequency.toUpperCase()).checked = true;

    if (selectedState === "California") {
        showStateTaxTable();
    } else {
        loadFilteredData();
    }
});

function highlightSelectedItem() {
    document.querySelectorAll(".state-select").forEach(el => {
        el.classList.toggle("active", el.textContent.trim() === selectedState);
    });
    document.getElementById("stateName").innerHTML = " " + selectedState;
    federalTaxTab.classList.toggle("active", selectedState === null);
}

document.addEventListener("click", function (event) {
    if (event.target.classList.contains("state-select")) {
        selectedState = event.target.textContent.trim();
        highlightSelectedItem();
        showStateTaxTable();
    }
});

federalTaxTab.addEventListener("click", function () {
    selectedState = null;
    highlightSelectedItem();
    showFederalTaxTable();
});

//year selection for states
yearSelection.addEventListener("change", function () {
    selectedYear = this.value;
    console.log("Selected Year:", selectedYear);
    if (selectedState) {
        loadFilteredData();
    } else {
        loadFederalTaxRates();
    }
});
//payment frequency selection for states
paymentFrequencyRadios.forEach(radio => {
    radio.addEventListener("change", function () {
        selectedFrequency = this.value;
        console.log("Selected Frequency:", selectedFrequency);
        if (selectedState) {
            loadFilteredData();
        }
    });
});

function showStateTaxTable() {
    isFederalSelected = false;
    isCaliforniaSelected = selectedState === "California";

    stateTaxContainer.style.display = "block";
    federalTaxContainer.style.display = "none";
    yearSelection.style.display = "block";
    paymentFrequencyRadios.forEach(radio => (radio.parentElement.style.display = "block"));

    document.getElementById("californiaExemptions").style.display = isCaliforniaSelected ? "block" : "none";
    document.getElementById("californiaDeductions").style.display = isCaliforniaSelected ? "block" : "none";
    document.getElementById("newYorkTable").style.display = selectedState === "New York" ? "block" : "none";

    loadFilteredData();
}

function showFederalTaxTable() {
    isFederalSelected = true;
    isCaliforniaSelected = false;

    stateTaxContainer.style.display = "none";
    federalTaxContainer.style.display = "block";

    document.getElementById("californiaExemptions").style.display = "none";
    document.getElementById("californiaDeductions").style.display = "none";
    document.getElementById("newYorkTable").style.display = "none";
    loadFederalTaxRates();
}

async function loadFilteredData() {
    try {
        console.log("Selected Payment frequency == ", selectedFrequency);
        const apiUrl = `/api/filtered-state-tax-rate?state=${selectedState}&year=${selectedYear}&paymentFrequency=${selectedFrequency}`;
        if(selectedState === "California") {
            await fetchCaliforniaData();
        }
        if(selectedState === "New York") {
            await fetchTableADeductions();
        }
        console.log("Fetching:", apiUrl);
        const response = await fetch(apiUrl);

        if (!response.ok) throw new Error(`Error: ${response.status}`);
        stateTaxRates = await response.json();

        console.log("Fetched Data:", stateTaxRates);

        populateTable("single-table-body", stateTaxRates.filter(tax => tax.filingStatus === "SINGLE_OR_MARRIED_FILING_SEPARATELY"));
        populateTable("married-table-body", stateTaxRates.filter(tax => tax.filingStatus === "MARRIED_FILING_JOINTLY"));
        populateTable("head-household-table-body", stateTaxRates.filter(tax => tax.filingStatus === "HEAD_OF_HOUSEHOLD"));
        attachDeleteListeners();

    } catch (error) {
        console.error("Error fetching tax data:", error);
    }
}
function populateTable(tableId, data) {
    const tableBody = document.getElementById(tableId);
    tableBody.innerHTML = "";

    data.forEach(tax => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${tax.id}</td>
            <td  data-id="${tax.id}" data-field="over">$${tax.over}</td>
            <td  data-id="${tax.id}" data-field="notOver">$${tax.notOver}</td>
            <td  data-id="${tax.id}" data-field="estimatedAmount">$${tax.plus}</td>
            <td  data-id="${tax.id}" data-field="taxRate">${tax.taxRate.toFixed(2)}</td>
            <td  data-id="${tax.id}" data-field="columnE">$0</td>
            <td>
                <button class="btn btn-sm btn-warning btn-update" data-id="${tax.id}">Update</button>
             <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteTaxModal">
                    <i class="bi bi-trash"></i>
                    </button>
            </td>
        `;
        tableBody.appendChild(row);
    });

    attachUpdateListeners();
}

async function fetchCaliforniaData() {
    console.log("Fetching California data on page load:", selectedYear, selectedFrequency);
    try {
        const [standardResponse, exemptionResponse] = await Promise.all([
            fetch(`api/filtered-standard-deductions?state=California&year=${selectedYear}&paymentFrequency=${selectedFrequency}`),
            fetch(`api/filtered-exemption-allowance?state=California&year=${selectedYear}`)
        ]);

        const standardDeductions = await standardResponse.json();
        const exemptionAllowances = await exemptionResponse.json();
        console.log("Standard Deductions:", standardDeductions);
        console.log("Exemption Allowances:", exemptionAllowances);

        populateCaliforniaTables(exemptionAllowances, standardDeductions);
    } catch (error) {
        console.error('Error fetching California data:', error);
    }
}


function populateCaliforniaTables(exemptionAllowances,standardDeductions){
  standardDeductionTable.innerHTML = '';

  standardDeductions.forEach(item => {
    const row = `<tr>
      <td>${item.id}</td>
      <td>${item.singleOrMultiIncome}</td>
      <td>${item.marriedZeroOrOne}</td>
      <td>${item.marriedTwoOrMore}</td>
      <td>${item.unmarriedHeadOfHouseHold}</td>
      <td>
        <button class="btn btn-sm btn-warning btn-update" data-id="${item.id}">Update</button>
        <button class="btn btn-sm btn-danger" data-bs-toggle="modal">
                  <i class="bi bi-trash"></i>
                          </button>
                  </td>
    </tr>`;
    standardDeductionTable.innerHTML += row;
  });
  exemptionAllowanceTable.innerHTML = '';
    exemptionAllowances.forEach(item => {
      const row = `<tr>
        <td>${item.id}</td>
        <td>${item.natLeastAllowance}</td>
        <td>${item.daily}</td>
        <td>${item.weekly}</td>
        <td>${item.biWeekly}</td>
        <td>${item.monthly}</td>
        <td>${item.semiMonthly}</td>
        <td>${item.quarterly}</td>
        <td>${item.annual}</td>
        <td>${item.semiAnnually}</td>
        <td>
          <button class="btn btn-sm btn-warning btn-update" data-id="${item.id}">Update</button>
          <button class="btn btn-sm btn-danger" data-bs-toggle="modal" >
                    <i class="bi bi-trash"></i>
                            </button>
                    </td>
      </tr>`;
      exemptionAllowanceTable.innerHTML += row;
    });
}

function fetchTableADeductions() {
    fetch(`/api/table-a-deduction?year=${selectedYear}&paymentFrequency=${selectedFrequency}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to fetch deduction data');
            }
            return response.json();
        })
        .then(data => {
            populateTableADeductions(data);
        })
        .catch(error => {
            console.error('Error fetching table A deductions:', error);
        });
}

function populateTableADeductions(data) {
    const tableBody = document.getElementById('table-a-deduction-body');
    tableBody.innerHTML = '';

    data.forEach(item => {
        const row = `
            <tr>
                <td>${item.id}</td>
                <td>${item.baseDeductionAmount}</td>
                <td>${item.filingStatus}</td>
                <td>${item.incrementer}</td>
                <td>
                    <button class="btn btn-sm btn-warning">Update</button>
                    <button class="btn btn-sm btn-danger">Delete</button>
                </td>
            </tr>
        `;
        tableBody.innerHTML += row;
    });
}

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".btn-add-tax").forEach(button => {
        button.addEventListener("click", function () {
            const modal = new bootstrap.Modal(document.getElementById("newStateTaxModel"));
            document.getElementById("addTaxForm").reset();
            const filingStatus = this.getAttribute("data-filing-status");
            document.getElementById("add-tax-state").value = selectedState;
            document.getElementById("add-tax-year").value = selectedYear;
            document.getElementById("add-payment-frequency").value = selectedFrequency;
            document.getElementById("add-filing-status").value = filingStatus;
            modal.show();
        });
    });

    document.getElementById("addTaxForm").addEventListener("submit", async function (event) {
        event.preventDefault();

        const formData = new FormData(this);

        const requestBody = {
            stateName: document.getElementById("add-tax-state").value,
            paymentFrequency: document.getElementById("add-payment-frequency").value,
            over: parseFloat(formData.get("over")) || 0.0,
            notOver: parseFloat(formData.get("notOver")) || 0.0,
            taxRate: parseFloat(formData.get("stateTaxRate")) || 0.0,
            filingStatus: document.getElementById("add-filing-status").value,
            year: document.getElementById("add-tax-year").value,
        };

        console.log("Submitting New Tax Rate:", requestBody);

        try {
            const response = await fetch("/api/state-tax-rate", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(requestBody),
            });

            if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);

            const data = await response.json();
            alert(`New Tax Rate added for ${data.stateName}!`);

            bootstrap.Modal.getInstance(document.getElementById("newStateTaxModel")).hide();

            loadFilteredData();

        } catch (error) {
            console.error("Error:", error);
            alert("Failed to add tax rate.");
        }
    });
});


function attachUpdateListeners() {
    document.querySelectorAll(".btn-update").forEach(button => {
        button.removeEventListener("click", openEditModal);
        button.addEventListener("click", openEditModal);
    });
}

//this function is show prefilled data on update click
function openEditModal(event) {
    const taxId = event.target.dataset.id;
    const stateTaxRate = stateTaxRates.find(t => t.id.toString() === taxId);

    if (!stateTaxRate) {
        console.error("Error: No tax rate found for ID", taxId);
        return;
    }

    console.log("Opening Edit Modal for Tax ID:", stateTaxRate);

    document.getElementById("edit-tax-id").value = stateTaxRate.id;
    document.getElementById("edit-over").value = stateTaxRate.over;
    document.getElementById("edit-notOver").value = stateTaxRate.notOver;
    document.getElementById("edit-filing-status").value = stateTaxRate.filingStatus;

    document.getElementById("edit-taxRate").value = stateTaxRate.taxRate;
    document.getElementById("edit-state-name").value = stateTaxRate.stateName;
    document.getElementById("edit-year").value = stateTaxRate.year.toString();
    document.getElementById("edit-payment-frequency").value = stateTaxRate.paymentFrequency;

    const editModal = new bootstrap.Modal(document.getElementById("editTaxModal"));
    editModal.show();
}

document.getElementById("editTaxForm").addEventListener("submit", async function (event) {
    event.preventDefault();

    const taxId = document.getElementById("edit-tax-id").value;

    const updatedTaxRate = {
        id: taxId,
        stateName: document.getElementById("edit-state-name").value,
        year: parseInt(document.getElementById("edit-year").value),
        paymentFrequency: document.getElementById("edit-payment-frequency").value,
        filingStatus: document.getElementById("edit-filing-status").value,
        over: parseFloat(document.getElementById("edit-over").value),
        notOver: parseFloat(document.getElementById("edit-notOver").value),
        taxRate: parseFloat(document.getElementById("edit-taxRate").value),
    };

    console.log("Updating Tax Rate:", updatedTaxRate);

    try {
        const response = await fetch(`/api/state-tax-rate`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(updatedTaxRate),
        });

        if (!response.ok) throw new Error(`Failed to update tax rate. Status: ${response.status}`);

        alert("Tax rate updated successfully!");

        bootstrap.Modal.getInstance(document.getElementById("editTaxModal")).hide();
        loadFilteredData();

    } catch (error) {
        console.error("Error updating tax rate:", error);
        alert("Error updating tax rate.");
    }
});


//duplicate button functionality for state and federal
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("duplicate-tax-btn").addEventListener("click", function () {
        new bootstrap.Modal(document.getElementById("copyTaxRates")).show();
    });

    document.getElementById("copy-tax-rates").addEventListener("click", async function (event) {
        event.preventDefault();

        const newYear = document.getElementById("new-year").value.trim();
        if (!newYear) {
            alert("Please enter a valid year!");
            return;
        }

        try {
            const isFederalTaxActive = federalTaxContainer.style.display === "block";
            let apiUrl, postUrl, newData;

            if (isFederalTaxActive) {
                apiUrl = "/api/federal-tax-rate";
                postUrl = "/api/create-federal-tax-rate-list";

                const response = await fetch(apiUrl);
                console.log(response);
                if (!response.ok) throw new Error(`Error fetching federal tax data: ${response}`);

                const federalTaxData = await response.json();

                newData = federalTaxData.map(tax => ({
                    id: null,
                    taxYear: parseInt(newYear),
                    filingStatus: tax.filingStatus,
                    atLeast: tax.atLeast,
                    lessThan: tax.lessThan,
                    taxRate: tax.taxRate,
                    w4Form: tax.w4Form,
                    tentativeAmountToWithhold: tax.tentativeAmountToWithhold,
                    adjustedAnnualWage: tax.adjustedAnnualWage
                }));

            } else {
                apiUrl = "/api/state-tax-rate";
                postUrl = "/api/create-state-tax-rate-list";

                const response = await fetch(apiUrl);
                if (!response.ok) throw new Error(`Error fetching state tax data: ${response.status}`);

                const stateTaxData = await response.json();

                newData = stateTaxData.map(tax => ({
                    id: null,
                    stateName: tax.stateName,
                    paymentFrequency: tax.paymentFrequency,
                    filingStatus: tax.filingStatus,
                    over: tax.over,
                    notOver: tax.notOver,
                    taxRate: tax.taxRate,
                    year: parseInt(newYear)
                }));
            }

            console.log("Duplicating Tax Data for Year:", newYear, newData);

            const postResponse = await fetch(postUrl, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(newData),
            });

            if (!postResponse.ok) throw new Error(`Error saving data: ${postResponse.status}`);

            alert(`Tax rates copied successfully for year ${newYear}!`);
            bootstrap.Modal.getInstance(document.getElementById("copyTaxRates")).hide();

            if (isFederalTaxActive) {
                loadFederalTaxRates();
            } else {
                loadFilteredData();
            }

        } catch (error) {
            console.error("Error duplicating tax rates:", error);
            alert("Error duplicating tax rates!");
            bootstrap.Modal.getInstance(document.getElementById("copyTaxRates")).hide();
        }
    });
});

//upload state and federal tax rates in bulk by uploading file.
document.getElementById("bulkUploadForm").addEventListener("submit", async function (event) {
    event.preventDefault();
    

    const fileInput = document.getElementById("dataFile").files[0];

    if (!fileInput) {
        alert("Please select a file!");
        return;
    }

    const formData = new FormData();
    formData.append("file", fileInput);

    console.log("FIle data ", formData.get("file"));
    const isFederalTaxActive = federalTaxContainer.style.display === "block";
    const apiUrl = isFederalTaxActive
        ? "/api/federal-tax-rate/bulk-upload"
        : "/api/state-tax-rate/bulk-upload";

    try {
        const response = await fetch(apiUrl, {
            method: "POST",
            body: formData
        });

        if (!response.ok) throw new Error(`Upload failed. Status: ${response.status}`);

        const result = await response.text();
        alert(result);
        const modalInstance = bootstrap.Modal.getInstance(document.getElementById("bulkUploadModal"));
        if (modalInstance) {
            modalInstance.hide();
        }

        document.body.classList.remove("modal-open");
        document.querySelectorAll(".modal-backdrop").forEach(backdrop => backdrop.remove());
        if (isFederalTaxActive) {
            loadFederalTaxRates();
        } else {
            loadFilteredData();
        }
    } catch (error) {
        console.error("Error uploading file:", error);
        alert("Error uploading file: ",error.message);
        bootstrap.Modal.getInstance(document.getElementById("bulkUploadModal")).hide();
    } finally {
        uploadButton.disabled = false;
        uploadButton.innerText = "Upload";
    }
});

//state delete tax rate listener
function attachDeleteListeners() {
    document.querySelectorAll(".btn-danger[data-bs-target='#deleteTaxModal']").forEach(button => {
        button.removeEventListener("click", setDeleteId);
        button.addEventListener("click", setDeleteId);
    });
}
//to set delete id for delete API for state tax rates
function setDeleteId(event) {
    const row = event.target.closest("tr");
    if (row) {
        deleteTaxId = row.children[0].textContent.trim();
        console.log("Selected Tax ID for Deletion:", deleteTaxId);
    }
}
//Delete State rate event listeners
document.addEventListener("DOMContentLoaded", function () {
    document.querySelector(".confirm-delete").addEventListener("click", async function () {
        if (!deleteTaxId) {
            alert("Error: No tax rate selected for deletion.");
            return;
        }

        console.log("Deleting Tax ID:", deleteTaxId);

        try {
            const response = await fetch(`/api/state-tax-rate/${deleteTaxId}`, {
                method: "DELETE",
                headers: { "Content-Type": "application/json" },
            });

            if (!response.ok) {
                throw new Error(`Failed to delete tax rate. Status: ${response.status}`);
            }

            alert("Tax rate deleted successfully!");

            const modalElement = document.getElementById("deleteTaxModal");
            const modalInstance = bootstrap.Modal.getInstance(modalElement);
            modalInstance.hide();
            loadFilteredData();


        } catch (error) {
            console.error("Error deleting tax rate:", error);
            alert("Error deleting tax rate.");
        }
    });
});

federalYearSelection.addEventListener("change", function () {
    selectedFederalYear = this.value;
    console.log("Selected Federal Year:", selectedFederalYear);
    loadFederalTaxRates();
});

document.addEventListener("DOMContentLoaded", function () {
    federalYearSelection.value = selectedFederalYear;
    loadFederalTaxRates();
});
//Load Federal Rates
async function loadFederalTaxRates() {
    try {
        const response = await fetch(`/api/filtered-federal-tax-rate?year=${selectedFederalYear}`);

        if (!response.ok) throw new Error(`Error: ${response.status}`);

        federalTaxRates = await response.json();
        console.log("Fetched Federal Tax Data:", federalTaxRates);

        populateFederalTable("single-table-federal-body", federalTaxRates.filter(tax => tax.filingStatus === "SINGLE_OR_MARRIED_FILING_SEPARATELY"));
        populateFederalTable("married-table-federal-body", federalTaxRates.filter(tax => tax.filingStatus === "MARRIED_FILING_JOINTLY"));
        populateFederalTable("head-of-house-table-federal-body", federalTaxRates.filter(tax => tax.filingStatus === "HEAD_OF_HOUSEHOLD"));
        attachFederalUpdateListeners();
        attachFederalDeleteListeners();

    } catch (error) {
        console.error("Error fetching federal tax rates:", error);
    }
}

function populateFederalTable(tableId, data) {
    const tableBody = document.getElementById(tableId);
    tableBody.innerHTML = "";

    data.forEach(tax => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td class="col px-md-2">${tax.id}</td>
            <td class="col px-md-2">$${tax.atLeast}</td>
            <td class="col px-md-2">$${tax.lessThan ?? "N/A"}</td>
            <td class="col px-md-5">$${tax.tentativeAmountToWithhold}</td>
            <td class="col px-md-2">${tax.w4Form}</td>
            <td class="col px-md-5">${tax.taxRate}%</td>
            <td class="col px-md-5">${tax.taxYear}</td>
            <td class="col px-md-3">
                 <button class="btn btn-sm btn-warning btn-update-federal" data-id="${tax.id}">Update</button>
                 <button class="btn btn-sm btn-danger btn-delete-federal" data-id="${tax.id}" data-bs-toggle="modal" data-bs-target="#deleteFederalTaxModal">
                    <i class="bi bi-trash"></i>
                 </button>
             </td>
        `;
        tableBody.appendChild(row);
    });
}
// Button handling to add federal tax
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".btn-add-federal-tax").forEach(button => {
        button.addEventListener("click", function () {
            const modal = new bootstrap.Modal(document.getElementById("addFederalTaxModal"));
            document.getElementById("addFederalTaxForm").reset();
            document.getElementById("add-federal-filing-status").value = this.getAttribute("data-filing-status");
            document.getElementById("add-federal-tax-year").value = selectedFederalYear;
            modal.show();
        });
    });
});

document.getElementById("addFederalTaxForm").addEventListener("submit", async function (event) {
    event.preventDefault();

    const requestBody = {
        taxYear: parseInt(document.getElementById("add-federal-tax-year").value),
        filingStatus: document.getElementById("add-federal-filing-status").value,
        atLeast: parseFloat(document.getElementById("federalOver").value),
        lessThan: parseFloat(document.getElementById("federalNotOver").value) || null,
        taxRate: parseFloat(document.getElementById("federalTaxRate").value),
        tentativeAmountToWithhold: parseFloat(document.getElementById("tentativeAmountToWithhold").value),
        w4Form: document.getElementById("add-w4Form").value,
        adjustedAnnualWage: 0
    };

    console.log("Submitting New Federal Tax Rate:", requestBody);

    try {
        const response = await fetch("/api/federal-tax-rate", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(requestBody),
        });

        if (!response.ok) throw new Error(`Error saving data: ${response.status}`);

        alert("Federal Tax Rate added successfully!");


        const modalInstance = bootstrap.Modal.getInstance(document.getElementById("addFederalTaxModal"));
        if (modalInstance) modalInstance.hide();
        document.body.classList.remove("modal-open");
        document.querySelectorAll(".modal-backdrop").forEach(backdrop => backdrop.remove());
        await loadFederalTaxRates();

    } catch (error) {
        console.error("Error adding federal tax rate:", error);
        alert("Error adding federal tax rate!");
    }
});


document.addEventListener("DOMContentLoaded", function () {
    const addFederalTaxModal = document.getElementById("addFederalTaxModal");
    addFederalTaxModal.addEventListener("hidden.bs.modal", function () {
        document.body.classList.remove("modal-open");
        document.querySelectorAll(".modal-backdrop").forEach(backdrop => backdrop.remove());
    });
});

document.getElementById("addFederalTaxForm").addEventListener("reset", function () {
    document.querySelectorAll(".modal-backdrop").forEach(backdrop => backdrop.remove());
    document.body.classList.remove("modal-open");

});

// Attach update event listeners after fetching data
function attachFederalUpdateListeners() {
    document.querySelectorAll(".btn-update-federal").forEach(button => {
        button.removeEventListener("click", openEditFederalModal);
        button.addEventListener("click", openEditFederalModal);
    });
}

// Open Edit Modal and Populate Fields in federal
function openEditFederalModal(event) {
    const taxId = event.target.dataset.id;
    const federalTaxRate = federalTaxRates.find(t => t.id.toString() === taxId);

    if (!federalTaxRate) {
        console.error("Error: No tax rate found for ID", taxId);
        return;
    }

    console.log("Opening Edit Modal for Federal Tax ID:", federalTaxRate);

    document.getElementById("edit-federal-tax-id").value = federalTaxRate.id;
    document.getElementById("edit-federal-tax-year").value = selectedFederalYear;
    document.getElementById("edit-federal-filing-status").value = federalTaxRate.filingStatus;
    document.getElementById("edit-federal-over").value = federalTaxRate.atLeast;
    document.getElementById("edit-federal-notOver").value = federalTaxRate.lessThan || "";
    document.getElementById("edit-federal-taxRate").value = federalTaxRate.taxRate;
    document.getElementById("edit-tentativeAmountToWithhold").value = federalTaxRate.tentativeAmountToWithhold;
    document.getElementById("edit-w4Form").value = federalTaxRate.w4Form;


    const editModal = new bootstrap.Modal(document.getElementById("editFederalTaxModal"));
    editModal.show();
}

// Handle Update Federal Form Submission
document.getElementById("editFederalTaxForm").addEventListener("submit", async function (event) {
    event.preventDefault();

    const updatedTaxRate = {
        id: document.getElementById("edit-federal-tax-id").value,
        taxYear: parseInt(document.getElementById("edit-federal-tax-year").value),
        filingStatus: document.getElementById("edit-federal-filing-status").value,
        atLeast: parseFloat(document.getElementById("edit-federal-over").value),
        lessThan: parseFloat(document.getElementById("edit-federal-notOver").value) || null,
        taxRate: parseFloat(document.getElementById("edit-federal-taxRate").value),
        tentativeAmountToWithhold: parseFloat(document.getElementById("edit-tentativeAmountToWithhold").value),
        w4Form: document.getElementById("edit-w4Form").value,
        adjustedAnnualWage: 0
    };

    console.log("Updating Federal Tax Rate:", updatedTaxRate);

    try {
        const response = await fetch(`/api/federal-tax-rate`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(updatedTaxRate),
        });

        if (!response.ok) throw new Error(`Failed to update tax rate. Status: ${response.status}`);

        alert("Federal Tax Rate updated successfully!");

        await loadFederalTaxRates();

        const modalInstance = bootstrap.Modal.getInstance(document.getElementById("editFederalTaxModal"));
        if (modalInstance) modalInstance.hide();
        document.body.classList.remove("modal-open");
        document.querySelectorAll(".modal-backdrop").forEach(backdrop => backdrop.remove());

    } catch (error) {
        console.error("Error updating tax rate:", error);
        alert("Error updating tax rate.");
    }
});

function attachFederalDeleteListeners() {
    document.querySelectorAll(".btn-danger[data-bs-target='#deleteFederalTaxModal']").forEach(button => {
        button.removeEventListener("click", setFederalDeleteId);
        button.addEventListener("click", setFederalDeleteId);
    });
}
//to set delete id for delete API for state tax rates
function setFederalDeleteId(event) {
    const row = event.target.closest("tr");
    if (row) {
        deleteFederalTaxId = row.children[0].textContent.trim();
        console.log("Selected Tax ID for Deletion:", deleteFederalTaxId);
    }
}

// Handle Confirm Delete On Click Event
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("confirm-delete-federal").addEventListener("click", async function () {
        if (!deleteFederalTaxId) {
            alert("Error: No tax rate selected for deletion.");
            return;
        }

        try {
            const response = await fetch(`/api/federal-tax-rate/${deleteFederalTaxId}`, {
                method: "DELETE",
                headers: { "Content-Type": "application/json" },
            });

            if (!response.ok) {
                throw new Error(`Failed to delete tax rate. Status: ${response.status}`);
            }

            alert("Federal Tax Rate deleted successfully!");

            await loadFederalTaxRates();

            const modalInstance = bootstrap.Modal.getInstance(document.getElementById("deleteFederalTaxModal"));
            if (modalInstance) modalInstance.hide();
            document.body.classList.remove("modal-open");
            document.querySelectorAll(".modal-backdrop").forEach(backdrop => backdrop.remove());

        } catch (error) {
            console.error("Error deleting tax rate:", error);
            alert("Error deleting tax rate.");
        }
    });
});