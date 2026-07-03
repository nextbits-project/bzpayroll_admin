<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tax Rate Admin Portal</title>
    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/tax-rate-admin-dashboard.css">
</head>

<body>

<div class="d-flex">
    <div data-bs-spy="scroll" id="sidebar" class="sidebar">
      <div class="sidebar-header">
        <h3 class="text-white p-3">Tax Dashboard</h3>
        <hr style="width: 250px; color: white; margin-left: -15px; margin-top: 0;">
      </div>
        <ul class="nav flex-column">
            <li class="nav-item">
              <a href="#" id="federal-tax-tab"  class="nav-link federal-tax" data-tax="federal" style="padding-left: 5px;color:white;text-decoration: none;">Federal Tax</a></li>
            <hr class="text-white">
            <li class="nav-item">
              <a href="#" style="padding-left:5px;color: white;text-decoration: none" onclick="loadState('All States')">All States</a></li>
            <hr class="text-white">
            <div id="state-list"></div>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 h1">Admin Dashboard</span>
                <button class="btn btn-primary" style="margin-left: 64%; width: 100px;padding:5px" data-bs-toggle="modal" data-bs-target="#bulkUploadModal">Bulk Upload</button>
                <button class="btn btn-primary" style="width: 120px;padding:5px" id="duplicate-tax-btn">Copy Tax Rates</button>

            </div>
        </nav>

        <!-- Filters -->
        <div id="state-tax-container">
            <div class="container-fluid d-flex" style="margin-top:30px;margin-left:40px" >
                <h4>State Tax Rates : </h4>
                <h5 id="stateName" style="margin-top:4px;margin-left:10px">  </h5>
            </div>
        <div class="filters d-flex">
            <select style="height: 5%;width: 10%; margin-top: 10px; margin-left:55px" id="select-year" class="form-select">
              <option value="2023">2023</option>
                <option value="2024" selected>2024</option>
                <option value="2025">2025</option>
                <option value="2026">2026</option>
                <option value="2027">2027</option>
                <option value="2028" >2028</option>
            </select>
            <div class="d-flex" style="margin-top: 15px;margin-left: 0px;">
              <div class="form-check form-check-inline me-5">
                  <input name="paymentFrequency" class="form-check-input" type="radio" name="radio-group" id="DAILY" value="DAILY" checked>
                  <label class="form-check-label" for="DAILY">DAILY</label>
              </div>
              <div class="form-check form-check-inline me-5">
                  <input  name="paymentFrequency" class="form-check-input" type="radio" name="radio-group" id="WEEKLY" value="WEEKLY">
                  <label class="form-check-label" for="WEEKLY">WEEKLY</label>
              </div>
              <div class="form-check form-check-inline me-5">
                  <input name="paymentFrequency" class="form-check-input" type="radio" name="radio-group" id="BI_WEEKLY" value="BI_WEEKLY">
                  <label class="form-check-label" for="BI_WEEKLY">BI_WEEKLY</label>
              </div>
              <div class="form-check form-check-inline me-5">
                  <input name="paymentFrequency" class="form-check-input" type="radio" name="radio-group" id="MONTHLY" value="MONTHLY">
                  <label class="form-check-label" for="MONTHLY">MONTHLY</label>
              </div>
              <div class="form-check form-check-inline me-5">
                  <input name="paymentFrequency" class="form-check-input" type="radio" name="radio-group" id="SEMI_MONTHLY" value="SEMI_MONTHLY">
                  <label class="form-check-label" for="SEMI_MONTHLY">SEMI_MONTHLY</label>
              </div>
              <div class="form-check form-check-inline me-5">
                  <input name="paymentFrequency" class="form-check-input" type="radio" name="radio-group" id="ANNUALLY" value="ANNUALLY">
                  <label class="form-check-label" for="ANNUALLY">ANNUALLY</label>
              </div>
          </div>
        </div>

                <div class="content p-4 m-4">
                    <div class="card">
                        <div class="card-header d-md-flex justify-content-md-end"">
                <h5>Single</h5>
                <button style=" margin-left:40%;padding:5px" class="btn btn-primary btn-add-tax"
                            data-filing-status="SINGLE_OR_MARRIED_FILING_SEPARATELY" data-bs-toggle="modal"
                            data-bs-target="#addFederalTaxRate">
                            <i class="bi bi-plus-circle"></i> Add New Rate
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="singleTable" data-search="true"
                                    data-show-columns="true" data-show-multi-sort="true"
                                    data-sort-priority='[{"sortName": "atLeast","sortOrder":"desc"},{"sortName":"lessThan","sortOrder":"desc"}]'>
                                    <thead>
                                        <tr>
                                            <th data-field="id" data-sortable="true">Id</th>
                                            <th data-field="atLeast" data-sortable="true">At Least</th>
                                            <th data-field="lessThan" data-sortable="true">Less Than</th>
                                            <th data-field="estimatedAmount" data-sortable="true">Estimated Amount</th>
                                            <th data-field="rate" data-sortable="true">Rate</th>
                                            <th data-field="columnE" data-sortable="true">Column E</th>
                                            <th data-field="action" data-sortable="true">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="single-table-body">
                                        <tr>
                                            <td>1</td>
                                            <td>$0</td>
                                            <td>$20,000</td>
                                            <td>$10,000</td>
                                            <td>15%</td>
                                            <td>$1,500</td>
                                            <td><button class="btn btn-warning btn-update"
                                                    style="height: 30px;padding-top: 1px;">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content p-4 m-4">
                    <div class="card">
                        <div class="card-header d-md-flex justify-content-md-end"">
                  <h5>Married</h5>
                  <button style=" margin-left:40%;padding:5px" class="btn btn-primary btn-add-tax"
                            data-filing-status="MARRIED_FILING_JOINTLY" data-bs-toggle="modal"
                            data-bs-target="#addFederalTaxRate">
                            <i class="bi bi-plus-circle"></i> Add New Rate
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover" id="marriedTable">
                                    <thead>
                                        <tr>
                                            <th data-field="id" data-sortable="true">Id</th>
                                            <th data-field="atLeast" data-sortable="true">At Least</th>
                                            <th data-field="lessThan" data-sortable="true">Less Than</th>
                                            <th data-field="estimatedAmount" data-sortable="true">Estimated Amount</th>
                                            <th data-field="rate" data-sortable="true">Rate</th>
                                            <th data-field="columnE" data-sortable="true">Column E</th>
                                            <th data-field="action" data-sortable="true">Action</th>

                                    </thead>
                                    <tbody id="married-table-body">
                                        <tr>
                                            <td>1</td>
                                            <td>$0</td>
                                            <td>$20,000</td>
                                            <td>$10,000</td>
                                            <td>15%</td>
                                            <td>$1,500</td>
                                            <td><button class="btn btn-warning btn-update"
                                                    style="height: 30px;padding-top: 1px;">Update</button></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>$10000</td>
                                            <td>$25,000</td>
                                            <td>$5,000</td>
                                            <td>20%</td>
                                            <td>$2000</td>
                                            <td><button class="btn btn-warning btn-update"
                                                    style="height: 30px;padding-top: 1px;">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content p-4 m-4">
                    <div class="card">
                        <div class="card-header d-md-flex justify-content-md-end">
                            <h5>Head of Household</h5>
                            <button style="margin-left:40%;padding:5px" class="btn btn-primary btn-add-tax"
                                data-filing-status="HEAD_OF_HOUSEHOLD" data-bs-toggle="modal"
                                data-bs-target="#addFederalTaxRate">
                                <i class="bi bi-plus-circle"></i> Add New Rate
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-hover" id="headOfHouseholdTable">
                                    <thead>
                                        <tr>
                                            <th data-field="id" data-sortable="true">Id</th>
                                            <th data-field="atLeast" data-sortable="true">At Least</th>
                                            <th data-field="lessThan" data-sortable="true">Less Than</th>
                                            <th data-field="estimatedAmount" data-sortable="true">Estimated Amount</th>
                                            <th data-field="rate" data-sortable="true">Rate</th>
                                            <th data-field="columnE" data-sortable="true">Column E</th>
                                            <th data-field="action" data-sortable="true">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="head-household-table-body">
                                        <tr>
                                            <td>1</td>
                                            <td>$0</td>
                                            <td>$20,000</td>
                                            <td>$10,000</td>
                                            <td>15%</td>
                                            <td>$1,500</td>
                                            <td><button class="btn btn-warning btn-update"  style="height: 30px;padding-top: 1px;">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content p-4 m-4 " id="californiaExemptions" style="display:none;">
                <div class="card">
                    <div class="card-header d-md-flex justify-content-md-end">
                        <h5>Exemptions Allowances</h5>
                        <button style="margin-left:40%;padding:5px" class="btn btn-primary btn-add-tax"
                            data-filing-status="HEAD_OF_HOUSEHOLD" data-bs-toggle="modal"
                            data-bs-target="#addFederalTaxRate">
                            <i class="bi bi-plus-circle"></i> Add New
                        </button>
                    </div>
                    <div class="card-body"">
        <div class=" table-responsive">
                        <table class="table table-hover" id="exemptionAllowanceTable">
                            <thead>
                                <tr>
                                    <th data-field="id" data-sortable="true">Id</th>
                                    <th data-field="allowance_at_least" data-sortable="true">Allowance</th>
                                    <th data-field="daily" data-sortable="true">Daily</th>
                                    <th data-field="weekly" data-sortable="true">Weekly</th>
                                    <th data-field="bi_weekly" data-sortable="true">Bi_Weekly</th>
                                    <th data-field="monthly" data-sortable="true">Monthly</th>
                                    <th data-field="semi_monthly" data-sortable="true">Semi_Monthly</th>
                                    <th data-field="quarterly" data-sortable="true">Quarterly</th>
                                    <th data-field="annual" data-sortable="true">Annual</th>
                                    <th data-field="semi_annual" data-sortable="true">Semi_Annual</th>

                                    <th data-field="action" data-sortable="true">Action</th>
                                </tr>
                            </thead>
                            <tbody id="exemption-allowance-table-body">
                                <tr>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="content p-4 m-4 " id="californiaDeductions" style="display:none;">
            <div class="card">
                <div class="card-header d-md-flex justify-content-md-end">
                    <h5>Standard Deductions</h5>
                    <button style="margin-left:40%;padding:5px" class="btn btn-primary btn-add-tax"
                        data-filing-status="HEAD_OF_HOUSEHOLD" data-bs-toggle="modal"
                        data-bs-target="#addFederalTaxRate">
                        <i class="bi bi-plus-circle"></i> Add New
                    </button>
                </div>
                <div class="card-body"">
                 <div class=" table-responsive">
                    <table class="table table-hover" id="standardDeductionTable">
                        <thead>
                            <tr>
                                <th data-field="id" data-sortable="true">Id</th>
                                <th data-field="single_or_multi_income" data-sortable="true">Single_or_multi_income</th>
                                <th data-field="married_0_1_allowance" data-sortable="true">Married_0_1_allowance</th>
                                <th data-field="married_2_more_allowance" data-sortable="true">Married_2_more_allowance
                                </th>
                                <th data-field="unmarried_head_of_household" data-sortable="true">
                                    Unmarried_head_of_household</th>

                                <th data-field="action" data-sortable="true">Action</th>
                            </tr>
                        </thead>
                        <tbody id="standard-deduction-table-body">
                            <tr>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="content p-4 m-4 " id="newYorkTable" style="display:none;">
        <div class="card">
            <div class="card-header d-md-flex justify-content-md-end">
                <h5>Table A Deduction</h5>
                <button style="margin-left:40%;padding:5px" class="btn btn-primary btn-add-tax"
                    data-filing-status="HEAD_OF_HOUSEHOLD" data-bs-toggle="modal" data-bs-target="#addFederalTaxRate">
                    <i class="bi bi-plus-circle"></i> Add New
                </button>
            </div>
            <div class="card-body"">
                            <div class=" table-responsive">
                <table class="table table-hover" id="tableADeduction">
                    <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">Id</th>
                            <th data-field="deduction_amount" data-sortable="true">Deduction Amount</th>
                            <th data-field="filing_status" data-sortable="true">Filing Status</th>
                            <th data-field="incrementer" data-sortable="true">Incrementer</th>

                            <th data-field="action" data-sortable="true">Action</th>
                        </tr>
                    </thead>
                    <tbody id="table-a-deduction-body">
                        <tr>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>

        <div id="federal-tax-container" style="display:none;">
            <div class="container-fluid d-flex" style="margin-top:30px;margin-left:40px" >
                <h4>Federal Tax Rates</h4>
                <select style="height: 5%;width: 10%; margin-top: 0px; margin-left: 65%;" id="select-federal-year" class="form-select">
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025" selected>2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028" >2028</option>
                </select>
            </div>


<!--            Federal Tax Rate table for single filer -->
            <div class="content p-4 m-4" >
                <div class="card mb-4">
                    <div class="card-header d-flex">
                        <h5 style="margin-left:39%">Single Filer</h5>
                        <button style="margin-left:38%;padding:5px" class="btn btn-primary btn-add-federal-tax" data-filing-status="SINGLE_OR_MARRIED_FILING_SEPARATELY" data-bs-toggle="modal"  data-bs-target="#addFederalTaxModal">
                            <i class="bi bi-plus-circle"></i> Add New Rate
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="singleFederalTable" data-search="true" data-show-columns="true" data-show-multi-sort="true"
                                   data-sort-priority='[{"sortName": "atLeast","sortOrder":"desc"},{"sortName":"lessThan","sortOrder":"desc"}]'>
                                <thead>
                                <tr >
                                    <th class="col px-md-2" data-field="id" data-sortable="true">Id</th>
                                    <th class="col px-md-2" data-field="atLeast" data-sortable="true">At Least</th>
                                    <th  class="col px-md-2" data-field="lessThan" data-sortable="true">Less Than</th>
                                    <th  class="col px-md-2" data-field="tentativeAmountToWithhold" data-sortable="true">Tentative Amount To Withhold</th>
                                    <th  class="col px-md-2" data-field="w4Form" data-sortable="true">W4 Form</th>
                                    <th  class="col px-md-5" data-field="rate" data-sortable="true">Rate</th>
                                    <th  class="col px-md-5" data-field="year" data-sortable="true">Year</th>
                                    <th  class="col px-md-3" data-field="action" data-sortable="true">Action</th>
                                </tr>
                                </thead>
                                <tbody id="single-table-federal-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
              </div>
<!--            Married federal table for married filer -->
            <div class="content p-4 m-4" >
                <div class="card">
                    <div class="card-header d-flex">
                        <h5 style="margin-left:38%">Married Filer</h5>
                        <button style="margin-left:38%;padding:5px" class="btn btn-primary btn-add-federal-tax" data-filing-status="MARRIED_FILING_JOINTLY" data-bs-toggle="modal"   data-bs-target="#addFederalTaxModal">
                            <i class="bi bi-plus-circle"></i> Add New Rate
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="marriedFederalTable" data-search="true" data-show-columns="true" data-show-multi-sort="true"
                                   data-sort-priority='[{"sortName": "atLeast","sortOrder":"desc"},{"sortName":"lessThan","sortOrder":"desc"}]'>
                                <thead>
                                <tr>
                                    <th class="col px-md-2" data-field="id" data-sortable="true">Id</th>
                                    <th class="col px-md-2" data-field="atLeast" data-sortable="true">At Least</th>
                                    <th  class="col px-md-2" data-field="lessThan" data-sortable="true">Less Than</th>
                                    <th  class="col px-md-2" data-field="tentativeAmountToWithhold" data-sortable="true">Tentative Amount To Withhold</th>
                                    <th  class="col px-md-2" data-field="w4Form" data-sortable="true">W4 Form</th>
                                    <th  class="col px-md-5" data-field="rate" data-sortable="true">Rate</th>
                                    <th  class="col px-md-5" data-field="year" data-sortable="true">Year</th>
                                    <th  class="col px-md-3" data-field="action" data-sortable="true">Action</th>
                                </tr>
                                </thead>
                                <tbody id="married-table-federal-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- head of household federal table for married filer -->
            <div class="content p-4 m-4" >
                <div class="card">
                    <div class="card-header d-flex">
                        <h5 style="margin-left:30%">Head of Household Filer</h5>
                        <button style="margin-left:36%;padding:5px" class="btn btn-primary btn-add-federal-tax" data-filing-status="HEAD_OF_HOUSEHOLD" data-bs-toggle="modal" data-bs-target="#addFederalTaxModal">
                            <i class="bi bi-plus-circle"></i> Add New Rate
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="headOfHouseFederalTable" data-search="true" data-show-columns="true" data-show-multi-sort="true"
                                   data-sort-priority='[{"sortName": "atLeast","sortOrder":"desc"},{"sortName":"lessThan","sortOrder":"desc"}]'>
                                <thead>
                                <tr>
                                    <th class="col px-md-2" data-field="id" data-sortable="true">Id</th>
                                    <th class="col px-md-2" data-field="atLeast" data-sortable="true">At Least</th>
                                    <th  class="col px-md-2" data-field="lessThan" data-sortable="true">Less Than</th>
                                    <th  class="col px-md-2" data-field="tentativeAmountToWithhold" data-sortable="true">Tentative Amount To Withhold</th>
                                    <th  class="col px-md-2" data-field="w4Form" data-sortable="true">W4 Form</th>
                                    <th  class="col px-md-5" data-field="rate" data-sortable="true">Rate</th>
                                    <th  class="col px-md-5" data-field="year" data-sortable="true">Year</th>
                                    <th  class="col px-md-3" data-field="action" data-sortable="true">Action</th>
                                </tr>
                                </thead>
                                <tbody id="head-of-house-table-federal-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


        </div>
      </div>
</div>


<!-- Update Tax Rate Modal -->
<div class="modal fade" id="editTaxModal" tabindex="-1" aria-labelledby="editTaxModalLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title">Edit Tax Rate</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <form id="editTaxForm">
                  <div class="mb-3">
                    <label class="form-label">Id</label>
                    <input type="text" class="form-control" id="edit-tax-id" readonly>
                </div>

                  <div class="mb-3">
                      <label class="form-label">State</label>
                      <input type="text" class="form-control" id="edit-state-name" readonly>
                  </div>

                  <div class="mb-3">
                      <label class="form-label">Year</label>
                      <select class="form-select" id="edit-year">
                          <option value="2023">2023</option>
                          <option value="2024">2024</option>
                          <option value="2025">2025</option>
                      </select>
                  </div>

                  <div class="mb-3">
                      <label class="form-label">Payment Frequency</label>
                      <input type="text" class="form-control" id="edit-payment-frequency" readonly>
                  </div>

                  <div class="mb-3">
                      <label class="form-label">Filing Status</label>
                      <input type="text" class="form-control" id="edit-filing-status" readonly>
                  </div>

                  <div class="mb-3">
                      <label class="form-label">At Least</label>
                      <input type="number" class="form-control" id="edit-over">
                  </div>

                  <div class="mb-3">
                      <label class="form-label">Less Than</label>
                      <input type="number" class="form-control" id="edit-notOver">
                  </div>

                  <div class="mb-3">
                      <label class="form-label">Tax Rate (%)</label>
                      <input type="number" class="form-control" id="edit-taxRate" step="0.1">
                  </div>

                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                  </div>
              </form>
          </div>
      </div>
  </div>
</div>

<!-- Fetch New Year from user to replicate data -->
<div class="modal fade" id="copyTaxRates" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title">Replicate Tax Rates for Another Year</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <form id="replicateTaxForm">
                  <div class="mb-3">
                    <label class="form-label">Enter Year</label>
                    <input type="number" class="form-control" id="new-year">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-primary" id="copy-tax-rates">Copy Data</button>
              </div>
          </form>
          </div>
          </div>
          </div></div>

<!-- Add New Tax Rate Modal -->
<div class="modal fade" id="newStateTaxModel" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Tax Rate</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="addTaxForm">
                    <div class="mb-3">
                        <label class="form-label">State Name</label>
                        <input id="add-tax-state" type="text" name="stateName" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tax Bracket</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" name="over" class="form-control" placeholder="From" required>
                            <span class="input-group-text">-</span>
                            <input type="number" name="notOver" class="form-control" placeholder="To" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Payment Frequency</label>
                        <input id="add-payment-frequency" type="text" name="paymentFrequency" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Filing Status</label>
                        <input id="add-filing-status" type="text" name="filingStatus" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Year</label>
                        <input id="add-tax-year" type="text" name="selectedYear" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tax Rate (%)</label>
                        <input type="number" name="stateTaxRate" class="form-control" min="0" max="100" step="0.1" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="addTaxForm" class="btn btn-primary">Add Tax Rate</button>
            </div>
        </div>
    </div>
</div>

<!-- To import csv file for data import-->

<div class="modal fade" id="bulkUploadModal" tabindex="-1" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fw-bold">Import Tax Rates From File (CSV)</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="bulkUploadForm" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label fw-bold" >Select CSV File</label>
                        <input type="file" class="form-control" id="dataFile" accept=".csv">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Upload</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteTaxModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Tax Rate</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this rate? This action cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger confirm-delete">Delete</button>
            </div>
        </div>
    </div>
</div>
<!--Add federal tax rate form -->
<div class="modal fade" id="addFederalTaxModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Tax Rate</h5>
                <button type="button" class="btn btn-secondary btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addFederalTaxForm">

                    <div class="mb-3">
                        <label class="form-label">Filing Status</label>
                        <input id="add-federal-filing-status" type="text" name="filingStatus" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">W4 Form</label>
                        <select style="width:100px" id="add-w4Form" class="form-select">
                            <option value="YES">YES</option>
                            <option value="NO" selected>NO</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tax Bracket</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" id="federalOver" name="over" class="form-control" placeholder="From" required>
                            <span class="input-group-text">-</span>
                            <input type="number" id="federalNotOver" name="notOver" class="form-control" placeholder="To" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tentative Amount To Withhold</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" id="tentativeAmountToWithhold" name="tentativeAmountToWithhold" class="form-control"
                                required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Year</label>
                        <input id="add-federal-tax-year" type="text" name="selectedFederalYear" class="form-control" readonly>

                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tax Rate (%)</label>
                        <input type="number" id="federalTaxRate" name="federalTaxRate" class="form-control" min="0" max="100" step="0.1" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="addFederalTaxForm" class="btn btn-primary">Add New Rate</button>
            </div>
        </div>
    </div>
</div>

<!-- Update Federal Tax Rate Modal -->
<div class="modal fade" id="editFederalTaxModal" tabindex="-1" aria-labelledby="editFederalTaxModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Federal Tax Rate</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editFederalTaxForm">
                    <div class="mb-3">
                        <label class="form-label">Id</label>
                        <input type="text" class="form-control" id="edit-federal-tax-id" readonly>
                    </div>

                        <div class="mb-3">
                            <label class="form-label">Year</label>
                            <input type="text" class="form-control" id="edit-federal-tax-year" readonly>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Filing Status</label>
                        <input type="text" class="form-control" id="edit-federal-filing-status" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tax Bracket</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" id="edit-federal-over" name="atLeast" class="form-control" placeholder="At Least" required>
                            <span class="input-group-text">-</span>
                            <input type="number" id="edit-federal-notOver" name="notOver" class="form-control" placeholder="Less Than"
                                required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Tentative Amount To Withhold</label>
                        <div class="input-group">
                            <span class="input-group-text">$</span>
                            <input type="number" id="edit-tentativeAmountToWithhold" name="tentativeAmountToWithhold" class="form-control"  step="0.1"
                                required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">W4 Form</label>
                        <select style="width:100px" id="edit-w4Form" class="form-select">
                            <option value="YES">YES</option>
                            <option value="NO" selected>NO</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tax Rate (%)</label>
                        <input type="number" class="form-control" id="edit-federal-taxRate" step="0.1">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary" id="btn-federal-update-save">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Federal Delete Confirmation Modal -->
<div class="modal fade" id="deleteFederalTaxModal" tabindex="-1" aria-labelledby="deleteFederalTaxModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm Deletion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this federal tax rate? This action cannot be undone.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirm-delete-federal">Delete</button>
            </div>
        </div>
    </div>
</div>

<!-- JS Libraries -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
</script>
<script src="js/tax-rate-admin-dashboard.js"></script>

</body>
</html>