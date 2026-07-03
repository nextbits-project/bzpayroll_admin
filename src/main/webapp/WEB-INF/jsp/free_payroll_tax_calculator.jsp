<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>Payroll Calculator</title>
    <link href="css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


</head>

<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Free Payroll Calculator</h3>
        </div>
        <div class="card-body">
            <form data-gtm-form-interact-id="0">
                <div class="mb-4 d-flex flex-column align-items-end">
                    <button class="btn btn-primary calculate" id="calculate-btn" type="submit">Calculate Tax</button>
                    <div class="form-text text-end">Run the calculation any time to refresh the payroll results below.</div>
                </div>
                <div class="ds-container"><span class="calc-heading text-muted">Date And State</span>
                    <hr class="heading-rule">
                    <div class="mb-3 row g-3">
                        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Check
                            Date</label>
                        <div class="col-6 col-sm-9">
                            <input class="form-control hasDatepicker" data-field-regex="" id="date"
                                   name="checkDate" type="date">
                        </div>
                    </div>
                    <div class="mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">State</label>
                        <div class="col-6 col-sm-9">
                            <select id="state-select" class="form-select form-control" data-gtm-form-interact-field-id="0" name="state"
                                    onchange="hideStateInformation(this)">
                                <option value="Arizona">Arizona</option>
                                <option value="Alaska">Alaska</option>
                                <option value="Alabama">Alabama</option>
                                <option value="Arkansas">Arkansas</option>
                                <option value="California" selected>California</option>
                                <option value="Colorado">Colorado</option>
                                <option value="Connecticut">Connecticut</option>
                                <option value="Delaware">Delaware</option>
                                <option value="Florida">Florida</option>
                                <option value="Georgia">Georgia</option>
                                <option value="Hawaii">Hawaii</option>
                                <option value="Idaho">Idaho</option>
                                <option value="Illinois">Illinois</option>
                                <option value="Indiana">Indiana</option>
                                <option value="Iowa">Iowa</option>
                                <option value="Kansas">Kansas</option>
                                <option value="Kentucky">Kentucky </option>
                                <option value="Louisiana">Louisiana </option>
                                <option value="Maine">Maine</option>
                                <option value="Maryland">Maryland</option>
                                <option value="Massachusetts">Massachusetts</option>
                                <option value="Michigan">Michigan</option>
                                <option value="Minnesota">Minnesota</option>
                                <option value="Mississippi">Mississippi </option>
                                <option value="Missouri">Missouri</option>
                                <option value="Montana">Montana</option>
                                <option value="Nebraska">Nebraska</option>
                                <option value="New York">New York</option>
                                <option value="New Hampshire">New Hampshire</option>
                                <option value="New Mexico">New Mexico</option>
                                <option value="New Jersey">New Jersey</option>
                                <option value="Nevada">Nevada</option>
                                <option value="North Carolina">North Carolina</option>
                                <option value="North Dakota">North Dakota</option>
                                <option value="Ohio">Ohio</option>
                                <option value="Oklahoma">Oklahoma</option>
                                <option value="Oregon">Oregon</option>
                                <option value="Pennsylvania">Pennsylvania</option>
                                <option value="Rhode Island">Rhode Island</option>
                                <option value="South Carolina">South Carolina</option>
                                <option value="South Dakota">South Dakota</option>
                                <option value="Tennessee">Tennessee</option>
                                <option value="Texas">Texas</option>
                                <option value="Utah">Utah</option>
                                <option value="Vermont">Vermont</option>
                                <option value="Virginia">Virginia</option>
                                <option value="Washington DC">Washington DC</option>
                                <option value="West Virginia">West Virginia</option>
                                <option value="Wisconsin">Wisconsin</option>
                                <option value="Wyoming">Wyoming</option>
                            </select></div>
                    </div>
                </div>
                <div class="general-container"><span class="calc-heading text-muted">General Information</span>
                    <hr class="heading-rule">
                    <div class="mb-3 row g-3">
                        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Pay Type</label>
                        <div class="col-6 col-sm-9">
                            <select class="form-select form-control" id="pay-type-select" name="payTypeMode">
                                <option value="SALARIED" selected>Salaried</option>
                                <option value="HOURLY">Hourly</option>
                            </select>
                        </div>
                    </div>
                    <div class="hourly-fields" style="display:none">
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Hourly Rate</label>
                            <div class="col-6 col-sm-9">
                                <input class="form-control" id="hourly-rate" type="number" step="0.01" min="0" placeholder="0.00" value="0">
                            </div>
                        </div>
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Hours Per Period</label>
                            <div class="col-6 col-sm-9">
                                <input class="form-control" id="hours-per-period" type="number" step="0.5" min="0" placeholder="0" value="0">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Gross
                        Pay</label>
                        <div class="col-6 col-sm-9"><input class="form-control" data-field-helptext="Enter the gross amount, or amount before taxes or deductions, for this calculation.
This is the amount of income before taxes and deductions are withheld.
Also select whether this is an annual amount or if it is paid per pay period" data-field-type="DOLLAR"
                                                           id="gross-pay" name="grossPay" placeholder=""
                                                           value="0.0"></div>
                    </div>
                    <div class="mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Gross Pay
                        Method</label>
                        <div class="col-6 col-sm-9"><select class="form-select form-control" name="grossPayType">
                            <option value="ANNUALLY">Annually</option>
                            <option selected="selected" value="PAY_PER_PERIOD">Pay Per Period</option>
                        </select></div>
                    </div>
                    <div class="mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Gross Pay
                        YTD</label>
                        <div class="col-6 col-sm-9"><input class="form-control" data-field-type="DOLLAR"
                                                           name="grossPayYTD" placeholder="" value="0"></div>
                    </div>
                    <div class="mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Pay
                        Frequency</label>
                        <div class="col-6 col-sm-9"><select class="form-select form-control" data-gtm-form-interact-field-id="3"
                                                            name="payFrequency">
                            <option selected="selected" value="DAILY">Daily</option>
                            <option value="WEEKLY">Weekly</option>
                            <option value="BI_WEEKLY">Bi-weekly</option>
                            <option value="SEMI_MONTHLY">Semi-monthly</option>
                            <option value="MONTHLY">Monthly</option>
                            <%-- <option value="QUARTERLY">Quarterly</option>  --%>
                            <option value="SEMI_ANNUALLY">Semi-Annually</option>
                            <option value="ANNUALLY">Annual</option>
                        </select></div>
                    </div>
                    <div class="mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Exempt
                        from</label>
                        <div class="col-sm-9">
                            <div class="row g-3">
                                <div class="col-sm-12 col-lg-4">
                                    <div class="row g-3">
                                        <div class="boolean-label col-3 col-sm-4 text-end">Federal</div>
                                        <div class="boolean-list-container col-3 col-sm-4">
                                            <select class="form-select form-control boolean-list"
                                                    data-gtm-form-interact-field-id="4"
                                                    name="exemptFederal">
                                                <option value="true">Yes</option>
                                                <option selected="selected" value="false">No</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-lg-4">
                                    <div class="row g-3">
                                        <div class="boolean-label col-3 col-sm-4 text-end">Social Security Tax</div>
                                        <div class="boolean-list-container col-3 col-sm-4"><select
                                                class="form-select form-control boolean-list"
                                                name="exemptFica">
                                            <option value="true">Yes</option>
                                            <option selected="selected" value="false">No</option>
                                        </select></div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-lg-4">
                                    <div class="row g-3">
                                        <div class="boolean-label col-3 col-sm-4 text-end">Medicare</div>
                                        <div class="boolean-list-container col-3 col-sm-4"><select
                                                class="form-select form-control boolean-list"
                                                data-field-helptext="In some cases, public employees are exempt from Federal, Social Security and/or Medicare taxes.  Check one or both of these boxes to not withhold Social Security and/or Medicare"
                                                name="exemptMedicare">
                                            <option value="true">Yes</option>
                                            <option selected="selected" value="false">No</option>
                                        </select></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="federal-container">
                    <span class="calc-heading text-muted">Federal Information</span>
                    <hr class="heading-rule">

                    <!-- Use 2020 W4 Field -->
                    <div class="mb-3 row g-3 federal">
                        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Use 2020 W4</label>
                        <div class="col-6 col-sm-9">
                            <select class="form-select form-control" id="use-2020-w4" name="w42020">
                                <option value="true">Yes</option>
                                <option selected value="false">No</option>
                            </select>
                        </div>
                    </div>

                    <!-- Fields for 2020 W4 -->
                    <div class="federal-new">
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Federal Filing Status</label>
                            <div class="col-6 col-sm-9">
                                <select class="form-select form-control" name="federalFilingStatus2020">
                                    <option value="SINGLE_OR_MARRIED_FILING_SEPARATELY">Single or Married Filing Separately</option>
                                    <option value="MARRIED_FILING_JOINTLY">Married Filing Jointly or Qualifying Widow(er)</option>
                                    <option value="HEAD_OF_HOUSEHOLD">Head of Household</option>
                                    <option value="NONRESIDENT_ALIEN">Nonresident Alien</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Step 2: Two Jobs</label>
                            <div class="col-6 col-sm-9">
                                <select class="form-select form-control" name="twoJobs2020">
                                    <option value="true">Yes</option>
                                    <option selected value="false">No</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Step 3: Dependents Amount</label>
                            <div class="col-6 col-sm-9">
                                <input class="form-control" name="dependents2020" type="number" value="0">
                            </div>
                        </div>
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Step 4a: Other Income</label>
                            <div class="col-6 col-sm-9">
                                <input class="form-control" name="otherIncome2020" type="number" value="0">
                            </div>
                        </div>
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Step 4b: Deductions</label>
                            <div class="col-6 col-sm-9">
                                <input class="form-control" name="deductions2020" type="number" value="0">
                            </div>
                        </div>
                    </div>

                    <div class="federal-old">
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Federal Filing Status</label>
                            <div class="col-6 col-sm-9">
                                <select class="form-select form-control" name="federalFilingStatusType">
                                    <option value="SINGLE_OR_MARRIED_FILING_SEPARATELY">Single</option>
                                    <option value="MARRIED_FILING_JOINTLY">Married</option>
                                    <option value="SINGLE_OR_MARRIED_FILING_SEPARATELY">Married Use Single Rate</option>
                                    <%-- <option value="NONRESIDENT_ALIEN">Nonresident Alien</option> --%>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end"># of Federal Allowances</label>
                            <div class="col-6 col-sm-9">
                                <input class="form-control" name="federalAllowances" type="number" value="0">
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 row g-3">
                        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional Federal Withholding</label>
                        <div class="col-6 col-sm-9">
                            <input class="form-control" name="additionalFederalWithholding" type="number" value="0">
                        </div>
                    </div>
                    <div class="mb-3 row g-3">
                        <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Round Federal Withholding</label>
                        <div class="col-6 col-sm-9">
                            <select class="form-select form-control" name="roundFederalWithholding">
                                <option value="true">Yes</option>
                                <option selected value="false">No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="state-container"><span class="calc-heading text-muted">State Information</span>
                    <hr class="heading-rule">
                    <span id="info-not-req">No State Information Required</span>
                    <div id="state-info" style="display:block">

                        <div  class= "arizona-rate" style="display:none">
                            <div class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">State elected
                                    Percentage Rate</label>
                                <div class="col-6 col-sm-9">
                                    <select class="form-select form-control" data-field-helptext="Elect state percentage rate"
                                            name="taxPercentageRate">
                                        <option value="0">Zero</option>
                                        <option value="0.5">0.5</option>
                                        <option value="1.0">1.0</option>
                                        <option value="1.5">1.5</option>
                                        <option value="2.0" selected>2.0</option>
                                        <option value="2.5">2.5</option>
                                        <option value="3.0">3.0</option>
                                        <option value="3.5">3.5</option>
                                    </select></div>
                            </div>
                        </div>
                        <div class="hide-newyork" style="display:none">
                            <div class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">New York
                                    SDI</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                    data-field-helptext="New York SDI"
                                                                    name="stateValues[0][36-000-0000-SDI-000]">
                                    <option selected="selected" value="true">Yes</option>
                                    <option value="false">No</option>
                                </select></div>
                            </div>

                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total
                                Allowances</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                                                   data-field-helptext="The total number of allowances for STATE tax."
                                                                   id="nyAllowances"
                                                                   data-field-type="INTEGER"
                                                                   name="totalAllowances" placeholder="" value="0"></div>
                            </div>
                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional
                                Withholding - NYC</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                                                   data-field-helptext="Additional withholding for NYC."
                                                                   data-field-regex="^([0-9]+([.][0-9]{0,2})?)$"
                                                                   data-field-type="DOLLAR"
                                                                   name="stateValues[2][ADDITIONALWH-NYC]"
                                                                   placeholder="" value="0.00"></div>
                            </div>
                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional
                                Withholding - Yonkers</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                                                   data-field-helptext="Additional withholding for Yonkers."
                                                                   data-field-regex="^([0-9]+([.][0-9]{0,2})?)$"
                                                                   data-field-type="DOLLAR"
                                                                   name="stateValues[4][ADDITIONALWH-YONKERS]"
                                                                   placeholder="" value="0.00"></div>
                            </div>
                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total Allowances - NYC</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                                                   data-field-helptext="The total number of allowances - NYC."
                                                                   data-field-regex="^([0-9]+)$"
                                                                   data-field-type="INTEGER"
                                                                   name="stateValues[5][TOTALALLOWANCESNYC]"
                                                                   placeholder="" value="0"></div>
                            </div>
                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Filing
                                Status</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                    data-field-helptext="'S'-single, 'M'-married, or 'MH'-married but w/h at higher single rate."
                                                                    name="stateValues[6][FILINGSTATUS]">
                                    <option selected="selected" value="S">Single</option>
                                    <option value="M">Married</option>
                                    <option value="MH">Married but use single rate</option>
                                </select></div>
                            </div>

                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">New York Paid
                                Family Leave Insurance</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                    data-field-helptext="New York Paid Family Leave Insurance"
                                                                    name="stateValues[8][36-000-0000-FLI-000]">
                                    <option selected="selected" value="true">Yes</option>
                                    <option value="false">No</option>
                                </select></div>
                            </div>
                        </div>
                        <div class="california-fields" style="display:none">


                            <div class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">California
                                    SDI</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control" data-field-helptext="California SDI"
                                        name="californiaSDI">
                                        <option selected="selected" value="true">Yes</option>
                                        <option value="false">No</option>
                                    </select></div>
                            </div>
                            <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total
                                    Allowances</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                        data-field-helptext="The total number of allowances for STATE tax." data-field-regex="^([0-9]+)$"
                                        data-field-type="INTEGER" id="caAllowances" name="totalAllowances">
                                        </div>
                            </div>
                            <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional State
                                    Withholding</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                        data-field-helptext="Additional state withholding" data-field-regex="^([0-9]+([.][0-9]{0,2})?)$"
                                        data-field-type="DOLLAR" name="caAdditionalStateWithholding" ></div>
                            </div>
                            <%-- <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional
                                                                Allowances</label>
                                       <div class="col-6 col-sm-9"><input class="form-control"
                                                                    data-field-helptext="The total number of allowances for STATE tax." data-field-regex="^([0-9]+)$"
                                                                    data-field-type="INTEGER" name="additionalAllowances"></div>
                            </div>     --%>
                          <%--  <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Filing
                                    Status</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control"
                                        name="filingStatus">
                                        <option selected="selected" value="SINGLE_OR_MARRIED_FILING_SEPARATELY">Single</option>
                                        <option value="MARRIED_FILING_JOINTLY">Married</option>
                                        <option value="SINGLE_OR_MARRIED_FILING_SEPARATELY">Married but use single rate</option>
                                    </select></div>
                            </div>   --%>
                        </div>
                        <div class="illinois-fields" style="display:none">
                            <div id="basic-allowance" class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Basic Allowances</label>
                                <div class="col-6 col-sm-9">
                                    <input class="form-control"
                                           data-field-helptext="add basic Allowances"
                                           id = "ilAllowances"
                                           name="basicAllowances"
                                           placeholder="" value="0">
                                </div>
                            </div>
                            <div id="additional-allowance" class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional Allowances</label>
                                <div class="col-6 col-sm-9">
                                    <input class="form-control"
                                           data-field-helptext="additional Allowances"
                                           name="additionalAllowances"
                                           placeholder="" value="0">
                                </div>
                            </div>
                        </div>


                        <div class="colorado-fields" style="display:none">

                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Annual Withholding
                                Allowances</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                                                   data-field-helptext="The total number of allowances for STATE tax."
                                                                   id="coloradoAllowances"
                                                                   data-field-type="INTEGER"
                                                                   name="totalAllowances"></div>
                            </div>

                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Colorado Paid Family and Medical Leave - Employee</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                    data-field-helptext="New York Paid Family Leave Insurance"
                                                                    name="coloradoFamilyLeave">
                                    <option selected="selected" value="true">Yes</option>
                                    <option value="false">No</option>
                                </select></div>
                            </div>

                        </div>
                        <div class="alaska-fields" style="display:none">

                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Alaska SUI</label>
                                <div class="col-6 col-sm-9">
                                    <select class="form-control"
                                          data-field-regex="^([0-9]+)$"
                                          name="alaskaSUI">
                                    <option value="true">Yes</option>
                                    <option value="false" selected="selected">No</option>  </select>
                                </div>
                             </div>
                        </div>

                        <div class="texas-fields" style="display:none">

                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Texarkana Resident</label>
                                <div class="col-6 col-sm-9">
                                    <select class="form-control"
                                          data-field-regex="^([0-9]+)$"
                                          name="TexarkanaResident" placeholder="" value="0">
                                    <option value="true">Yes</option>
                                    <option value="false" selected="selected">No</option> </select>
                                </div>
                             </div>
                        </div>

                        <div class="pennsylvania-fields" style="display:none">

                          <div class="mb-3 row g-3">
                              <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Pennsylvania
                                  SUI</label>
                              <div class="col-6 col-sm-9"><select class="form-select form-control" data-field-helptext="California SDI"
                                      name="PennsylvaniaSUI">
                                      <option selected="selected" value="true">Yes</option>
                                      <option value="false">No</option>
                                  </select></div>
                          </div>
                        </div>

                        <div class="georgia-fields" style="display:none" id="georgia">
                           <%-- for Alabama, this is dependets --%>
                            <div class="mb-3 row g-3"><label
                                    class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total
                                Allowances</label>
                                <div class="col-6 col-sm-9"><input class="form-control"
                                                                   data-field-helptext="The total number of allowances for STATE tax."
                                                                   id="dependentAllowances"
                                                                   data-field-type="INTEGER"
                                                                   name="totalAllowances"></div>
                                                                   </div>
                         </div>

                        <div class="indiana-fields" style="display:none">

                             <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">First-time Claimed Additional Dependent Exemptions</label>
                                 <div class="col-6 col-sm-9"><input class="form-control"
                                                                    data-field-type="INTEGER"
                                                                    name="firstTimeDependentExemptions"></div>
                             </div>
                             <div class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Adoption
                                  Exemptions</label>
                                  <div class="col-6 col-sm-9"><input class="form-control"
                                                                     id="adoptedChildDependent"
                                                                     data-field-type="INTEGER"
                                                                     name="adoptedChildDependent"></div>
                             </div>
                             <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Dependent
                                  Exemptions</label>
                                  <div class="col-6 col-sm-9"><input class="form-control"
                                                                     id="indianaDependentExemptions"
                                                                     data-field-type="INTEGER"
                                                                     name="indianaDependentExemptions"></div>
                             </div>

                             <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Personal
                                  Exemptions</label>
                                  <div class="col-6 col-sm-9"><input class="form-control"
                                                                     id="indianaPersonalExemptions"
                                                                     data-field-type="INTEGER"
                                                                     name="indianaPersonalExemptions"></div>
                              </div>
                         </div>
                         <div class="louisiana-fields" style="display:none">
                            <div class="mb-3 row g-3">
                              <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Filing Status for Deduction</label>
                              <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                  data-field-helptext="Exempt from state"
                                                                  name="stateDeductionFilingStatus">
                                  <option id = "noDeductionTab">No Deduction</option>
                                  <option value="SINGLE_OR_MARRIED_FILING_SEPARATELY">Single or Married Filing Separately</option>
                                  <option value="MARRIED_FILING_JOINTLY">Married Filing Jointly</option>
                                  <option value="HEAD_OF_HOUSEHOLD">Head of household</option>
                              </select></div>
                              </div>
                          </div>
                           <div class="louisiana-fields-progressive" style="display:none">
                              <div class="mb-3 row g-3">
                                <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total Allowance</label>
                                <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                    name="louisianaTotalAllowances">
                                    <option value="0">Zero</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                </select></div>
                                </div>
                                <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total Dependent</label>
                                       <div class="col-6 col-sm-9"><input class="form-control"
                                                             name="totalDependents"></div>
                                   </div>
                            </div>
                         <div class="mb-3 row g-3">
                             <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Exempt State</label>
                             <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                 name="stateExemption">
                                 <option value="true">Yes</option>
                                 <option selected="selected" value="false">No</option>
                             </select></div>
                         </div>
                         <div class="mb-3 row g-3"><label
                                 class="col-form-label col-6 col-sm-3 text-start text-sm-end">Additional
                             State Withholding</label>
                             <div class="col-6 col-sm-9"><input class="form-control"
                                                                data-field-helptext="Amount of additional state withholding"
                                                                data-field-regex="^([0-9]+([.][0-9]{0,2})?)$"
                                                                data-field-type="DOLLAR"
                                                                name="stateValues[7][additionalStateWithholding]"
                                                                placeholder="" value="0"></div>
                         </div>

                    <div class="connecticut-fields" style="display:none">
                        <div class="mb-3 row g-3">
                          <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Withholding code</label>
                          <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                              name="withholdingCode">
                              <option id = "NO_FORM" selected>NO_FORM</option>
                              <option value="A">A</option>
                              <option value="B">B</option>
                              <option value="C">C</option>
                              <option value="D">D</option>
                              <option value="F">F</option>
                          </select></div>
                          </div>
                      </div>
                         <div class="iowa-fields" style="display:none">
                           <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Total Allowance Amount</label>
                               <div class="col-6 col-sm-9"><input class="form-control"
                                                     name="totalAllowanceAmount"></div>
                           </div>
                         </div>
                </div>
                 <div class="virginia-fields" style="display:none">
                     <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Age and Blindness
                     Exemptions</label>
                          <div class="col-6 col-sm-9"><input class="form-control"
                                                             id="virginiaDependentExemptions"
                                                             data-field-type="INTEGER"
                                                             name="virginiaDependentExemptions"></div>
                     </div>

                     <div class="mb-3 row g-3"><label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Personal
                          Exemptions</label>
                          <div class="col-6 col-sm-9"><input class="form-control"
                                                             id="virginiaPersonalExemptions"
                                                             data-field-type="INTEGER"
                                                             name="virginiaPersonalExemptions"></div>
                      </div>
                     </div>
                      <div class="nj-fields" style="display:none">
                         <div class="mb-3 row g-3">
                           <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Rate code</label>
                           <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                               name="rateCode">
                               <option value="A" selected>Single - Code A</option>
                               <option value="B">Married/Civil Union Couple Joint - Code B</option>
                               <option value="C">Married/Civil Union Couple Separate - Code C</option>
                               <option value="D">Head of Household - Code D</option>
                               <option value="E">Surviving Spouse/Surviving Civil Union Partner - Code E</option>
                           </select></div>
                           </div>
                       </div>
                       <div class="massachusetts-fields" style="display:none">
                        <div class="mb-3 row g-3">
                          <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Personal Blindness</label>
                          <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                              name="personalBlindness">
                              <option value="true">Yes</option>
                              <option value="false" selected>No</option>
                          </select></div>
                          </div>
                           <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Spouse Blindness</label>
                            <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                name="spouseBlindness">
                                <option value="true">Yes</option>
                                <option value="false" selected>No</option>
                            </select></div>
                           </div>
                          <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Head Of Household</label>
                            <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                name="headOfHousehold">
                                <option value="true">Yes</option>
                                <option value="false" selected>No</option>
                            </select></div>
                          </div>
                      </div>
                      <div class="maryland-fields" style="display:none">
                       <div class="mb-3 row g-3">
                         <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Maryland State Tax Exemption for PA Residents</label>
                         <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                             name="paStateExemption"
                                                             id="paStateExemption">
                             <option value="true">Yes</option>
                             <option value="false">No</option>
                         </select></div>
                         </div>
                      </div>
                     </div>
                </div>

                <div class="locale-container"><span class="calc-heading text-muted">Locale Information</span>
                    <hr class="heading-rule">
                    <span id="locale-info-not-req">No Locale Information Required</span>
                    <div id="locale-info"  style="display:block">
                        <div class="mb-3 row g-3">
                            <label class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address Line 1</label>
                            <div class="col-sm-9"><input class="form-control" data-field-helptext="Enter your address"
                                                         data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                         data-field-type="TEXT" name="locale[address1]" placeholder=""
                                                         value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address Line
                            2</label>
                            <div class="col-sm-9"><input class="form-control" data-field-helptext="Enter your address"
                                                         data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                         data-field-type="TEXT" name="locale[address2]" placeholder=""
                                                         value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">City</label>
                            <div class="col-sm-2"><input class="form-control" data-field-helptext="Enter your address"
                                                         data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                         data-field-type="TEXT" name="locale[city]" placeholder=""
                                                         value=""></div>
                            <label class="col-form-label col-sm-1 text-sm-end">ZIP</label>
                            <div class="col-sm-2"><input class="form-control" data-field-helptext="Enter your address"
                                                         data-field-regex="^$|^([0-9]{5})$" data-field-type="ZIP"
                                                         name="locale[zip]" placeholder="" value=""></div>
                            <label class="col-form-label col-sm-1 text-sm-end">ZIP+4</label>
                            <div class="col-sm-2"><input class="form-control" data-field-helptext="Enter your address"
                                                         data-field-regex="^$|^([0-9]{4})$" data-field-type="ZIP4"
                                                         name="locale[zip4]" placeholder="" value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Resident</label>
                            <div class="col-sm-9"><select class="form-select form-control"
                                                          data-field-helptext="Are you a resident of this location"
                                                          name="locale[resident]">
                                <option selected="selected" value="true">Resident</option>
                                <option value="false">Nonresident</option>
                            </select></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Exempt</label>
                            <div class="col-sm-9"><select class="form-select form-control"
                                                          data-field-helptext="Select 'Yes' if you are exempt, 'No' if you are not exempt"
                                                          name="locale[exempt]">
                                <option value="true">Yes</option>
                                <option selected="selected" value="false">No</option>
                            </select></div>
                        </div>
                    </div>
                </div>
                <div class="deductions-container"><span class="calc-heading text-muted">Voluntary Deductions</span>
                    <hr class="heading-rule">
                    <div class="mb-3 row g-3 deduction-buttons"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Deductions</label>
                        <div class="col-sm-9">
                            <div class="btn-group deductions">
                                <button aria-label="401k" class="btn btn-light" id="add-401k" name="401k" title="401k"
                                        type="button"><span aria-hidden="true" class="bi bi-currency-dollar"></span> 401k
                                </button>
                                <button aria-label="HSA" class="btn btn-light" id="add-hsa" name="hsa" title="HSA"
                                        type="button"><span aria-hidden="true" class="bi bi-heart"></span> HSA
                                </button>
                                <button aria-label="Custom" class="btn btn-light" id="add-custom" name="_custom" title="Custom"
                                        type="button">
                                    <span aria-hidden="true" class="bi bi-gear-fill"></span> Custom
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="voluntary-deduction-container"></div>
                <div class="print-container">
                    <span class="calc-heading text-muted">Print a report</span>
                    <hr class="heading-rule">
                    <div class="div-print mb-3 row g-3"><label
                            class="col-form-label col-6 col-sm-3 text-start text-sm-end">Print
                        Report?</label>
                        <div class="col-6 col-sm-9">
                            <select class="form-select form-control" data-field-helptext="Select the report you want to generate"
                                    data-gtm-form-interact-field-id="5" name="printReport"
                                    onchange="hideDiv(this)">
                                <option value="all">Yes - All reports</option>
                                <!--                <option value="checktop">Yes - Check on top</option>-->
                                <!--                <option value="checkmiddle">Yes - Check in middle</option>-->
                                <!--                <option value="checkbottom">Yes - Check on bottom</option>-->
                                <!--                <option value="earnings">Yes - Earnings record</option>-->
                                <option selected="selected" value="No">No</option>
                            </select></div>
                    </div>
                    <div id="print-info">
                        <span class="calc-heading text-muted">Print Info</span>
                        <hr class="heading-rule">
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">ID
                            (employee #, file #)</label>
                            <div class="col-6 col-sm-9"><input class="form-control" data-field-helptext="The employee id"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[id]" placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Employee
                            Name</label>
                            <div class="col-6 col-sm-9"><input class="form-control" data-field-helptext="Enter the employee name"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[employeeName]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address
                            Line 1</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter the employee address"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[employeeAddressLine1]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address
                            Line 2</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter the employee address"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[employeeAddressLine2]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address
                            Line 3</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter the employee address"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[employeeAddressLine3]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Check
                            #</label>
                            <div class="col-6 col-sm-9"><input class="form-control" data-field-helptext="The check number"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[checkNumber]" placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Print # on
                            check</label>
                            <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                data-field-helptext="Print the check number on the check"
                                                                name="print[checkNumberOnCheck]">
                                <option value="true">Yes</option>
                                <option selected="selected" value="false">No</option>
                            </select></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Check
                            Date</label>
                            <div class="col-6 col-sm-9"><input class="form-control hasDatepicker"
                                                               data-field-helptext="The date of the check"
                                                               data-field-regex="" id="dp1735900357092"
                                                               name="print[checkDate]" type="text"></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Remarks</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter any remarks added to the check"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT"
                                                               name="print[remarks]"
                                                               placeholder="" value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Print
                            company on check</label>
                            <div class="col-6 col-sm-9"><select class="form-select form-control"
                                                                data-field-helptext="Print the company name on the check"
                                                                name="print[companyNameOnCheck]">
                                <option value="true">Yes</option>
                                <option selected="selected" value="false">No</option>
                            </select></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Company sName</label>
                            <div class="col-6 col-sm-9"><input class="form-control" data-field-helptext="Enter the company name"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[companyName]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address
                            Line 1</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter the company address"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[companyAddressLine1]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address
                            Line 2</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter the company address"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[companyAddressLine2]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                        <div class="mb-3 row g-3"><label
                                class="col-form-label col-6 col-sm-3 text-start text-sm-end">Address
                            Line 3</label>
                            <div class="col-6 col-sm-9"><input class="form-control"
                                                               data-field-helptext="Enter the company address"
                                                               data-field-regex="^[\w\s\.\'\,\-\_\$\/\%]*$"
                                                               data-field-type="TEXT" name="print[companyAddressLine3]"
                                                               placeholder=""
                                                               value=""></div>
                        </div>
                    </div>
                </div>
            </form>
            <div id="tax-result">

            </div>
        </div>
    </div>
</div>
<script src="js/script.js"></script>
</body>

</html>
