let rateCounter = 0;

const dateInput = document.getElementById("date");
dateInput.valueAsDate = new Date();

// Function to calculate gross pay dynamically
//function calculateGrossPay() {
//  let totalGrossPay = 0;
//
//  document.querySelectorAll('.rate-container').forEach(rateContainer => {
//    const amountInput = rateContainer.querySelector('#amount-input');
//    const hoursInput = rateContainer.querySelector('#hours-input');
//    const amount = parseFloat(amountInput.value) || 0;
//    const hours = parseFloat(hoursInput.value) || 0;
//
//    totalGrossPay += amount * hours;
//  });
//
//  const grossPayInput = document.getElementById('gross-pay');
//  grossPayInput.value = totalGrossPay.toFixed(2);
//}

// Onclick event for adding rate
//document.getElementById('add-rate-btn').addEventListener('click', function () {
//  rateCounter++; // Increment counter for unique IDs
//  const rateId = `rate-id-${rateCounter}`;
//
//  // Create a new rate container
//  const rateContainer = document.createElement('div');
//  rateContainer.className = 'rate-container';
//  rateContainer.id = rateId;
//
//  // Add inner HTML for the rate container
//  rateContainer.innerHTML = `
//    <button type="button" class="btn btn-danger rate-remove" title="Remove Rate">
//      <span class="bi bi-x-lg"></span>
//    </button>
//
//    <div class="mb-3 row g-3">
//      <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Amount</label>
//      <div class="col-8">
//        <input type="number" id="amount-input" class="form-control" placeholder="Enter amount" value="0">
//      </div>
//    </div>
//    <div class="mb-3 row g-3">
//      <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Hours</label>
//      <div class="col-8">
//        <input type="number" id="hours-input" class="form-control" placeholder="Enter hours" value="0">
//      </div>
//    </div>
//  `;
//
//  document.getElementById('rates-section').appendChild(rateContainer);
//
//  // Add event listeners for dynamic calculation
//  rateContainer.querySelector('#amount-input').addEventListener('input', calculateGrossPay);
//  rateContainer.querySelector('#hours-input').addEventListener('input', calculateGrossPay);
//
//  // Remove Rate on click event
//  rateContainer.querySelector('.rate-remove').addEventListener('click', function () {
//    rateContainer.remove();
//    calculateGrossPay();
//  });
//});
//
//const totalGrossPay = calculateGrossPay();

document.getElementById("use-2020-w4").addEventListener("change", function () {
  const use2020W4 = this.value === "true";


  const federalNewFields = document.querySelectorAll(".federal-new");
  const federalOldFields = document.querySelectorAll(".federal-old");


  federalNewFields.forEach((field) => {
    field.style.display = use2020W4 ? "block" : "none";
  });

  federalOldFields.forEach((field) => {
    field.style.display = use2020W4 ? "none" : "block";
  });
});

document.getElementById("use-2020-w4").dispatchEvent(new Event("change"));

let deductionCount = 0;

  document.getElementById("add-401k").addEventListener("click", () => addDeductionBlock("401k"));
  document.getElementById("add-hsa").addEventListener("click", () => addDeductionBlock("hsa"));
  document.getElementById("add-custom").addEventListener("click", () => addDeductionBlock("custom"));

  function addDeductionBlock(type) {
    deductionCount++;

    // Create a new deduction block
    const deductionBlock = document.createElement("div");
    deductionBlock.classList.add("deduction-block");
    deductionBlock.id = `deduction-id-${deductionCount}`;

    deductionBlock.innerHTML = `
      <button type="button" class="btn btn-danger deduction-remove" title="Remove Deduction" onclick="removeDeductionBlock(${deductionCount})">
        <span class="bi bi-x-lg" aria-hidden="true"></span>
      </button>
      <input type="hidden" name="voluntaryDeductions[${deductionCount}][benefitType]" value="${type}">
      <div class="mb-3 row g-3">
        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Deduction Name</label>
        <div class="col-sm-8">
          <input name="voluntaryDeductions[${deductionCount}][deductionName]" class="form-control" placeholder="Enter deduction name">
        </div>
      </div>
      <div class="mb-3 row g-3">
        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Deduction Amount</label>
        <div class="col-sm-8">
          <div class="row g-3">
            <div class="col-sm-5">
              <input name="voluntaryDeductions[${deductionCount}][deductionAmount]" class="form-control" placeholder="Enter deduction amount">
            </div>
            <div class="col-sm-7">
              <select name="voluntaryDeductions[${deductionCount}][deductionMethodType]" class="form-select">
                <option value="PERCENT_OF_GROSS">% of Gross Pay</option>
                <option value="PERCENT_OF_NET">% of Net Pay</option>
                <option value="FIXED_AMOUNT">$ Fixed Amount</option>
                <option value="HOURLY_RATE">$ Hourly Rate</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="mb-3 row g-3">
        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">YTD Amount</label>
        <div class="col-sm-8">
          <input name="voluntaryDeductions[${deductionCount}][ytdAmount]" class="form-control" placeholder="Enter YTD amount">
        </div>
      </div>
      <div class="mb-3 row g-3">
        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Exempt from</label>
        <div class="col-sm-8">
          <select name="voluntaryDeductions[${deductionCount}][exemptFederal]" class="form-select">
            <option value="true">Yes</option>
            <option value="false" selected>No</option>
          </select> Fed
          <select name="voluntaryDeductions[${deductionCount}][exemptFica]" class="form-select">
            <option value="true">Yes</option>
            <option value="false" selected>No</option>
          </select> FICA
          <select name="voluntaryDeductions[${deductionCount}][exemptState]" class="form-select">
            <option value="true">Yes</option>
            <option value="false" selected>No</option>
          </select> State
          <select name="voluntaryDeductions[${deductionCount}][exemptLocal]" class="form-select">
            <option value="true">Yes</option>
            <option value="false" selected>No</option>
          </select> Local
        </div>
      </div>
    `;

    document.getElementById("voluntary-deduction-container").appendChild(deductionBlock);
  }


  function removeDeductionBlock(id) {
    const deductionBlock = document.getElementById(`deduction-id-${id}`);
    if (deductionBlock) {
      deductionBlock.remove();
    }
  }


//Hide or show Print Info report based on condition
 function hideDiv(elem) {
      const printInfo = document.getElementById("print-info");
      if (elem.value === "No") {
        printInfo.style.display = "none";
      } else {
        printInfo.style.display = "block";
      }
    }
function handleLouisianaFields() {
    const selectedState = document.getElementById("state-select").value;
    const checkDateInput = document.getElementById("date");
    const selectedYear = checkDateInput?.value ? new Date(checkDateInput.value).getFullYear() : new Date().getFullYear();
    const louisianaFlatFields = document.querySelector(".louisiana-fields");
    const louisianaProgressiveFields = document.querySelector(".louisiana-fields-progressive");

    if (selectedState === "Louisiana") {
        if (selectedYear >= 2025) {
            louisianaFlatFields.style.display = "block";
            louisianaProgressiveFields.style.display = "none";
        } else {
            louisianaFlatFields.style.display = "none";
            louisianaProgressiveFields.style.display = "block";
        }
    } else {
        louisianaFlatFields.style.display = "none";
        louisianaProgressiveFields.style.display = "none";
    }
}
//Hide State information based on states information
function hideStateInformation(elem) {
        const printInfo = document.getElementById("state-info");
        const stateInfoNotReq = document.getElementById("info-not-req");
        const localeInfo =   document.getElementById("locale-info");
        const localeInfoNotReq = document.getElementById("locale-info-not-req");
        const arizonaRateField = document.querySelector(".arizona-rate");
        const newyorkFields = document.querySelectorAll(".hide-newyork");
        const californiaFields = document.querySelectorAll(".california-fields");
        const statesForNoTaxRats = ["Florida","Nevada", "South Dakota", "Wyoming", "Tennessee","New Hampshire" ];
        const stateSpecificFields = document.querySelectorAll(".state-container");
        stateSpecificFields.forEach((container) => {
            container.style.display = "block";
            container.querySelectorAll("input, select").forEach((field) => {
            field.value = "";
        });
    });
    if (statesForNoTaxRats.includes(elem.value)) {
        printInfo.style.display = "none";
        localeInfo.style.display = "none";
        stateInfoNotReq.style.display = "block";
        localeInfoNotReq.style.display = "block";
      }
      else {
        printInfo.style.display = "block";
        localeInfo.style.display = "block";
        stateInfoNotReq.style.display = "none";
        localeInfoNotReq.style.display = "none";
      }
      if(elem.value === "Arizona") {
        arizonaRateField.style.display = "block";
        localeInfo.style.display = "none";
        localeInfoNotReq.style.display = "block";
      } else {
        arizonaRateField.style.display = "none";

      }
       if (elem.value === "New York") {
          newyorkFields.forEach((field) => {
            field.style.display = "block";
          });
        } else {
          newyorkFields.forEach((field) => {
            field.style.display = "none";
          });
        }
        if(elem.value === "Illinois") {
        document.querySelector(".illinois-fields").style.display = "block";
         arizonaRateField.style.display = "none";
        } else {
         document.querySelector(".illinois-fields").style.display = "none";
        }
         if (elem.value === "California") {
          californiaFields.forEach((field) => {
                    field.style.display = "block";
           });
                } else {
                  californiaFields.forEach((field) => {
                    field.style.display = "none";
                  });
                }
         if(elem.value === "Colorado") {
         document.querySelector(".colorado-fields").style.display = "block";
         }  else {
            document.querySelector(".colorado-fields").style.display = "none";
         }
         if(elem.value === "Alaska") {
            document.querySelector(".alaska-fields").style.display = "block";
         } else {
            document.querySelector(".alaska-fields").style.display = "none";
         }
         if(elem.value === "Texas") {
            document.querySelector(".texas-fields").style.display = "block";
         } else {
            document.querySelector(".texas-fields").style.display = "none";
         }
         if(elem.value === "Pennsylvania") {
            document.querySelector(".pennsylvania-fields").style.display = "block";
         } else {
            document.querySelector(".pennsylvania-fields").style.display = "none";
         }
         if ( elem.value === "Idaho" ||  elem.value === "Alabama" ||  elem.value === "Michigan"
            || elem.value === "Georgia" || elem.value === "North Carolina" || elem.value === "North Dakota"
            ||  elem.value === "Delaware" || elem.value === "Hawaii" || elem.value === "Iowa" || elem.value === "Maine"
            || elem.value === "Kansas" || elem.value === "Minnesota" || elem.value === "Nebraska" || elem.value === "New Jersey"
            || elem.value === "Ohio" || elem.value === "Oklahoma" || elem.value === "Rhode Island" || elem.value === "Massachusetts"
            || elem.value === "Maryland" || elem.value === "South Carolina" || elem.value === "Vermont" || elem.value === "Oregon"
            || elem.value === "Washington DC" || elem.value === "West Virginia" || elem.value === "Wisconsin")  {
               document.querySelector(".georgia-fields").style.display = "block";
         } else {
               document.querySelector(".georgia-fields").style.display = "none";
              }
         if(elem.value === "Arkansas") {
            document.querySelector(".texas-fields").style.display = "block";
            document.querySelector(".georgia-fields").style.display = "block";
         } else {
            document.querySelector(".texas-fields").style.display = "none";
         }
         if(elem.value === "Indiana") {
         document.querySelector(".indiana-fields").style.display = "block";
         } else {
         document.querySelector(".indiana-fields").style.display = "none";
         }
         if(elem.value === "Utah" || elem.value === "Missouri" || elem.value === "Montana" || elem.value === "New Mexico") {
            document.getElementById("noDeductionTab").style.display = "none";
            document.querySelector(".louisiana-fields").style.display = "block";
          } else {
            document.getElementById("noDeductionTab").style.display = "block";
            document.querySelector(".louisiana-fields").style.display = "none";
          }
         if(elem.value === "Louisiana") {
            handleLouisianaFields();
         }
         if(elem.value === "Connecticut") {
          document.querySelector(".connecticut-fields").style.display = "block";
         } else {
          document.querySelector(".connecticut-fields").style.display = "none";
         }
         if(elem.value === "Iowa") {
            document.querySelector(".iowa-fields").style.display = "block";
         } else {
           document.querySelector(".iowa-fields").style.display = "none";
         }
         if(elem.value === "Virginia") {
           document.querySelector(".virginia-fields").style.display = "block";
          } else {
           document.querySelector(".virginia-fields").style.display = "none";
         }
         if(elem.value === "New Jersey") {
           document.querySelector(".nj-fields").style.display = "block";
         } else {
           document.querySelector(".nj-fields").style.display = "none";
         }
         if(elem.value === "Massachusetts") {
           document.querySelector(".massachusetts-fields").style.display = "block";
         } else {
           document.querySelector(".massachusetts-fields").style.display = "none";
         }
         if(elem.value === "Maryland")  {
           document.querySelector(".maryland-fields").style.display = "block";
         } else {
            document.querySelector(".maryland-fields").style.display = "none";
         }
    }

document.addEventListener("DOMContentLoaded", function () {
  const stateDropdown = document.getElementById("state-select");
  if (stateDropdown) {
    hideStateInformation(stateDropdown);
  }
});
document.getElementById("date").addEventListener("input", function () {
    hideStateInformation(document.getElementById("state-select"));
});
// Pay Type: Salaried / Hourly toggle
function calculateHourlyGrossPay() {
    const rate = parseFloat(document.getElementById("hourly-rate").value) || 0;
    const hours = parseFloat(document.getElementById("hours-per-period").value) || 0;
    document.getElementById("gross-pay").value = (rate * hours).toFixed(2);
}

document.getElementById("pay-type-select").addEventListener("change", function () {
    const isHourly = this.value === "HOURLY";
    const grossPayInput = document.getElementById("gross-pay");
    document.querySelector(".hourly-fields").style.display = isHourly ? "block" : "none";
    grossPayInput.readOnly = isHourly;
    grossPayInput.style.backgroundColor = isHourly ? "#e9ecef" : "";
    if (isHourly) calculateHourlyGrossPay();
    else { grossPayInput.value = "0.0"; }
});

document.getElementById("hourly-rate").addEventListener("input", function () {
    if (document.getElementById("pay-type-select").value === "HOURLY") calculateHourlyGrossPay();
});

document.getElementById("hours-per-period").addEventListener("input", function () {
    if (document.getElementById("pay-type-select").value === "HOURLY") calculateHourlyGrossPay();
});

/*
** On click event for withholding calculation
** Passing data to REST API and Fetching Response
*/
document.getElementById("calculate-btn").addEventListener("click", async function (e) {
      e.preventDefault();
      //regular allowances = nAllowances
      const form = document.querySelector("form");
      const formData = new FormData(form);
      let selectedDate = new Date(formData.get("checkDate")).getTime();
      if (isNaN(selectedDate)) {
        alert("Please select date!");
        return;
      }
      const firstName = formData.get("firstName") || "";
      const middleName = formData.get("middleName") || "";
      const lastName = formData.get("lastName") || "";
      const address = formData.get("address") || "";
      const cityOrTown = formData.get("cityOrTown") || "";
      const state = formData.get("state") || "";
      const zipCode = formData.get("zipCode") || "";
      const checkDateInput = document.getElementById("date");
      const selectedYear = checkDateInput?.value ? new Date(checkDateInput.value).getFullYear() : new Date().getFullYear();
      // Request body
      let requestBody =  "";

      requestBody = {
          checkDate: new Date(formData.get("checkDate")).getTime(),
          state: formData.get("state"),
          payType: {
              method: formData.get("grossPayType"),
              frequency: formData.get("payFrequency"),
          },
          incomeInfo: [],
          useW4: formData.get("w42020") === "true",
          w4Form: {
              personalInformation: {
                  firstName,
                  middleName,
                  lastName,
                  address,
                  cityOrTown,
                  state,
                  zipCode,
                  filingStatus: formData.get("federalFilingStatusType2020"),
              },
              amountStep4a: parseFloat(formData.get("otherIncome2020")) || 0,
              amountStep4b: parseFloat(formData.get("deductions2020")) || 0,
              onlyHaveTwoJobs: formData.get("twoJobs2020") === "true",
          },
          federalInformation: {
              filingStatus: formData.get("federalFilingStatusType"),
              federalAllowance: parseInt(formData.get("federalAllowances")) || 0,
              additionalWithholding: parseFloat(formData.get("additionalFederalWithholding")) || 0,
              roundWithholding: formData.get("roundFederalWithholding") === "true",
              taxCreditInformation: {
                  amountW4FormStep3: parseFloat(formData.get("dependents2020")) || 0,
              },
          },
          form4aDetails: {
              taxPercentageRate: parseFloat(formData.get("taxPercentageRate")) || 2.0,
              noArizonaTaxLiability: formData.get("stateExemption") === "true",

          },
          exemptionInfo: {
              federal: formData.get("exemptFederal") === "true",
              fica: formData.get("exemptFica") === "true",
              medicare: formData.get("exemptMedicare") === "true",
          },
          nAllowances:  document.getElementById("dependentAllowances").value || document.getElementById("caAllowances").value
                        || document.getElementById("nyAllowances").value ||  document.getElementById("ilAllowances").value
                        || document.getElementById("coloradoAllowances").value  || 0 ,
          basicAllowances: parseInt(formData.get("basicAllowances")) || 0,
          additionalAllowances: parseInt(formData.get("additionalAllowances")) || 0,
          year: new Date(formData.get("checkDate")).getFullYear(),
      };
      const personalExemptions = parseInt(formData.get("personalExemptions")) || 0;
      const adoptedChildDependent = parseInt(formData.get("adoptedChildDependent")) || 0 ;
      const dependentExemptions = (parseInt(formData.get("firstTimeDependentExemptions")) + parseInt(formData.get("indianaDependentExemptions")) )|| 0;
      const virginiaPersonalExemptions = parseInt(formData.get("virginiaPersonalExemptions")) || 0;
      const virginiaDependentExemptions = parseInt(formData.get("virginiaDependentExemptions")) || 0;
      const requiredFields = {
          "Connecticut": ["withholdingCode"],
          "New Jersey": ["rateCode"],
          "Utah": ["stateDeductionFilingStatus"],
          "Missouri": ["stateDeductionFilingStatus"],
          "Montana": ["stateDeductionFilingStatus"],
          "New Mexico": ["stateDeductionFilingStatus"]
      };
        if (state === "Louisiana" && selectedYear >= 2025) {
            requiredFields["Louisiana"] = ["stateDeductionFilingStatus"];
        }
           if (requiredFields[state]) {
             for (const field of requiredFields[state]) {
                 if (!formData.get(field)) {
                     alert(`Please select ${field} for ${state}.`);
                     return;
                 }
             }
           }
              
      if(state === "Indiana") {
        requestBody.nAllowances = dependentExemptions;
        requestBody.basicAllowances =  personalExemptions;
        requestBody.additionalAllowances = adoptedChildDependent;
      }
      if ((state === "Louisiana" || state === "Utah" || state === "Missouri" || state === "Montana" || state === "New Mexico")&& formData.get("stateDeductionFilingStatus") !== "No Deduction") {
          requestBody.stateFilingStatus = formData.get("stateDeductionFilingStatus");
      }
      if(state === "Louisiana") {
          requestBody.additionalAllowances = parseInt(formData.get("totalDependents")) || 0;
          requestBody.nAllowances = parseInt(formData.get("louisianaTotalAllowances")) || 0;
      }
      if(state === "Connecticut") {
        requestBody.withholdingCode = formData.get("withholdingCode") || "NO_FORM";
      }
      if(state === "Iowa") {
        requestBody.totalAllowanceAmount = parseFloat(formData.get("totalAllowanceAmount")) || 0.0;
      }
       if(state === "Virginia") {
          requestBody.nAllowances = virginiaDependentExemptions;
          requestBody.basicAllowances =  virginiaPersonalExemptions;
       }
       if(state === "New Jersey") {
         requestBody.withholdingCode = formData.get("rateCode") || "A";
       }

       if(state === "Massachusetts") {
         requestBody.headOfHousehold = formData.get("headOfHousehold");
         requestBody.personalBlindness = formData.get("personalBlindness");
         requestBody.spouseBlindness = formData.get("spouseBlindness");
       }
      const incomeInfo = [];
      const grossPay = parseInt(formData.get("grossPay")) || 0.0;
//      const rateElements = document.querySelectorAll(".rate-container");
//
//      rateElements.forEach((rateElement) => {
//          const payRateInput = rateElement.querySelector("input#amount-input");
//          const hoursInput = rateElement.querySelector("input#hours-input");
//
//          if (payRateInput && hoursInput) {
//              const rate = parseFloat(payRateInput.value) || 0;
//              const hr = parseFloat(hoursInput.value) || 0;
//              incomeInfo.push({ rate, hr });
//          }
//      });



      requestBody.grossPay =  grossPay;

      console.log("Request Body:", requestBody);

      try {
          // Send API request
          const response = await fetch("/free_payroll_tax_calculator_calculate", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(requestBody),
          });

          const data = await response.json();

          if (!response.ok) {
              throw new Error(data.status || "Error in tax calculation");
          }
                  console.log("Response : ", data);
                        let state = document.getElementById("state-select").value;
                        let paExemption = document.getElementById("paStateExemption").value;
                        if (state === "Maryland" && paExemption === "true") {
                            data.stateTax = 0.0;
                        }
                  const resultMessage = data.status && data.status !== "Success"
                      ? data.status
                      : "Calculation completed successfully.";
                  const isHourly = document.getElementById("pay-type-select").value === "HOURLY";
                  const hourlyRate = parseFloat(document.getElementById("hourly-rate").value) || 0;
                  const hoursWorked = parseFloat(document.getElementById("hours-per-period").value) || 0;
                  const hourlyBreakdown = isHourly
                      ? `<label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Hourly Rate: </label> $${hourlyRate.toFixed(2)} &times; ${hoursWorked} hrs<br>`
                      : "";
                  document.getElementById('tax-result').innerHTML = `
                  <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">Result</h3>
                      </div>
                      <div class="card-body">
                  <div class="alert alert-success" role="alert">
                  ${resultMessage}
                  </div>
                  ${hourlyBreakdown}
                  <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">
                   Gross Pay: </label>  ${document.getElementById('gross-pay').value}
                   <br>
                  <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">
                  Federal Tax: </label>  ${data.federalTax.toFixed(2)}\n
                  <br>
                  <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">
                   FICA : </label>  ${data.ficaTax.toFixed(2)}
                   <br>
                   <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">
                   Medicare : </label>  ${data.medicareTax.toFixed(2)}
                   <br>
                  <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">
                  State Tax:</label>  ${data.stateTax.toFixed(2)}
                  <br>
                  <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">
                      Net Pay: </label>  ${data.netPay.toFixed(2)}
                  <br>
                      </div>
                  </div>`;

              } catch (error) {
                  console.error("Tax Calculation Failed:", error);
                  document.getElementById('tax-result').innerHTML = `
                  <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">Result</h3>
                      </div>
                      <div class="card-body">
                          <div class="alert alert-danger" role="alert">
                              ${error.message || "Tax calculation failed."}
                          </div>
                      </div>
                  </div>`;
              }
});
