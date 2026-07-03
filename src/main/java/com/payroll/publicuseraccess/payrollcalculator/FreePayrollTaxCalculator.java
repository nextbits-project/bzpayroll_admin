package com.payroll.publicuseraccess.payrollcalculator;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.dto.TaxCalculationRequest;
import com.payroll.publicuseraccess.payrollcalculator.dto.TaxCalculationResponse;
import com.payroll.publicuseraccess.payrollcalculator.model.*;
import com.payroll.publicuseraccess.payrollcalculator.service.PayrollCalculatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FreePayrollTaxCalculator {

    @Autowired
    private PayrollCalculatorService payrollCalculatorService;

//    @Value("${arizona.standard.tax.rate}")
//    private double arizonaStandardTaxRate;

    @RequestMapping(value = "/tax_admin", method = RequestMethod.GET)
    public String taxAdmin(){
        return "forward:/WEB-INF/jsp/tax_admin.jsp";
    }

    @RequestMapping(value = "/free_payroll_tax_calculator", method = RequestMethod.GET)
    public String index() {
        return "forward:/WEB-INF/jsp/free_payroll_tax_calculator.jsp";
    }

    @RequestMapping(value = "/free_payroll_tax_calculator_calculate", method = RequestMethod.POST)
    public ResponseEntity<TaxCalculationResponse> calculateTax(@RequestBody TaxCalculationRequest taxCalculationRequest) {
        try {
            double wage = taxCalculationRequest.getGrossPay();
            double totalAnnualWage = wage * taxCalculationRequest.getPayType().getFrequency().frequencyNumber;


            double adjustedAnnualWage = getAdjustedAnnualWage(taxCalculationRequest, totalAnnualWage);


            FederalTaxRate federalTax = payrollCalculatorService.getFederalTax(taxCalculationRequest.getFederalInformation().getFilingStatus(),
                    taxCalculationRequest.isUseW4(),
                    taxCalculationRequest.getYear(),
                    adjustedAnnualWage);

            System.out.println("Federal Tax Rate:" + federalTax);

            if (federalTax == null) {
                return new ResponseEntity<>(
                        TaxCalculationResponse.builder().status("Tax Bracket Not Found!").build(),
                        HttpStatus.NOT_FOUND
                );
            }

            double b4 = getB4(taxCalculationRequest, adjustedAnnualWage, federalTax);

            TaxCalculationResponse taxCalculationResponse = new TaxCalculationResponse();

            switch (taxCalculationRequest.getState()) {
            case "New York":
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateNewYorkTax(
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        wage,
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getYear()));
                break;
            case "Arizona":
                if(taxCalculationRequest.getForm4aDetails().isNoArizonaTaxLiability()) {
                    taxCalculationResponse.setStateTax(0.0);
                    break;
                }
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateArizonaWithholdingFixTaxRate(
                        totalAnnualWage,
                        taxCalculationRequest.getForm4aDetails().getTaxPercentageRate(),
                        taxCalculationRequest.getPayType().getFrequency()));
                break;
            case "California":
                taxCalculationResponse.setStateTax(calculateCaliforniaTax(taxCalculationRequest, totalAnnualWage));
                break;
            case "Florida":
            case "Alaska":
            case "Nevada":
            case "South Dakota":
            case "Wyoming":
            case "Tennessee":
                taxCalculationResponse.setStateTax(0.0);
                break;
            case "Illinois":
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateIllinoisWithholding(
                        wage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getBasicAllowances(), taxCalculationRequest.getAdditionalAllowances(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getState()));
                break;
            case "Colorado" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateFlatTaxRateWithhodling(wage,4.4));
                break;
            case "Georgia" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateGeorgiaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Idaho" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateIdahoWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Pennsylvania" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateFlatTaxRateWithhodling(wage,3.07));
                break;
            case "Alabama" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateAlabamaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));

                break;
            case "Arkansas" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateArkansasWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Indiana" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateIndianaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getBasicAllowances(),
                        taxCalculationRequest.getAdditionalAllowances()));
                break;
            case "Louisiana" :
                if(taxCalculationRequest.getYear() < 2025) {
                    taxCalculationResponse.setStateTax(payrollCalculatorService.calculateLouisianaProgressiveTaxWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getAdditionalAllowances()));
                } else {
                    taxCalculationResponse.setStateTax(payrollCalculatorService.calculateLouisianaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getStateFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear()));
                }
                break;
            case "Kentucky":
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateKentuckyWithholding(totalAnnualWage,taxCalculationRequest.getState(),taxCalculationRequest.getPayType().getFrequency(),taxCalculationRequest.getYear()));
                break;
            case "Michigan" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMichiganWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Mississippi" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMississippiWithholding(
                        totalAnnualWage,taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear()));
                break;
            case "North Carolina" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateCarolinaWithholding(
                        totalAnnualWage,taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Utah" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateUtahWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getStateFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear()));
                break;
            case "North Dakota" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateNorthDakotaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(), 
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Connecticut" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateConnecticutWithholdingCalculation(
                        totalAnnualWage,
                        taxCalculationRequest.getWithholdingCode(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getYear()));
                break;
            case "Delaware" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateDelawareWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Hawaii" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateHawaiiWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Iowa" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateIowaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getTotalAllowanceAmount()));
                break;
            case "Maine":
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMaineWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getYear()));
                break;
            case "Kansas" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateKansasWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getYear()));
                break;
            case "Minnesota" :
            case "Nebraska":
            case "Ohio":
            case "Oklahoma":
            case "Rhode Island":
            case "Vermont" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMinnesotaAndNebraskaAndOhioAndOklahomaAndRhodeIslandAndVermontWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getYear()));
                break;
            case "Missouri" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMissouriWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getStateFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear()));
                break;
            case "Montana" :
            case "New Mexico":
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMontanaAndNewMexicoWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getStateFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getYear()));
                break;
            case "South Carolina" :
                System.out.println("tax request -> " + taxCalculationRequest);
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateSouthCarolinaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getYear()));
                break;
            case "Virginia" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateVirgniaWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.getBasicAllowances()));
                break;
            case "West Virginia" :
            case "Washington DC" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateWestVirgniaAndWashintonDCWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Wisconsin" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateWisconsinWithholding  (
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Oregon" :
                //b4 is calculated federal tax
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateOregonWithholding(
                        totalAnnualWage,
                        b4,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "New Jersey" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateNewJerseyWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getWithholdingCode(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            case "Massachusetts" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMassachusettsWithholding(
                        totalAnnualWage,
                        taxCalculationRequest.getState(),
                        (totalAnnualWage*1.45/100),
                        (totalAnnualWage*6.2/100),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances(),
                        taxCalculationRequest.isHeadOfHousehold(),
                        taxCalculationRequest.isPersonalBlindness(),
                        taxCalculationRequest.isSpouseBlindness()));
                break;
            case "Maryland" :
                taxCalculationResponse.setStateTax(payrollCalculatorService.calculateMarylandWithholding(
                    totalAnnualWage,
                        taxCalculationRequest.getState(),
                        taxCalculationRequest.getPayType().getFrequency(),
                        taxCalculationRequest.getFederalInformation().getFilingStatus(),
                        taxCalculationRequest.getYear(),
                        taxCalculationRequest.getNAllowances()));
                break;
            default:
                taxCalculationResponse.setStateTax(0.0); // Default case
        }

            taxCalculationResponse.setFederalTax(b4 < 0 ? 0 : b4);
            taxCalculationResponse.setFicaTax(wage * 6.2 / 100);
            taxCalculationResponse.setMedicareTax(wage * 1.45 / 100);
            taxCalculationResponse.setNetPay(wage - taxCalculationResponse.getFederalTax() - taxCalculationResponse.getMedicareTax()
                    - taxCalculationResponse.getFicaTax() - taxCalculationResponse.getStateTax());

            return ResponseEntity.ok(taxCalculationResponse);
        } catch (IllegalStateException ex) {
            return new ResponseEntity<>(
                    TaxCalculationResponse.builder().status(ex.getMessage()).build(),
                    HttpStatus.NOT_FOUND
            );
        }
    }

    private static double getB4(TaxCalculationRequest taxCalculationRequest, double adjustedAnnualWage, FederalTaxRate federalTax) {
//        2e = 2a - 2b
        double r1 = adjustedAnnualWage - federalTax.getAtLeast();

//        2f = 2e * 2d/100
        double r2 = r1 * federalTax.getTaxRate() / 100;

//        2g = 2c + 2f
        double r3 = federalTax.getTentativeAmountToWithhold() + r2;
//        h2 = 2g / pay_frequency
        double h2 = r3 / taxCalculationRequest.getPayType().getFrequency().frequencyNumber;

        double a3 = taxCalculationRequest.getFederalInformation().getTaxCreditInformation().getAmountW4FormStep3();

        double b3 = a3 / taxCalculationRequest.getPayType().getFrequency().frequencyNumber;

        double c3 = h2 - b3;

        double a4 = taxCalculationRequest.getFederalInformation().getAdditionalWithholding();

        return c3 + a4;
    }

    private static double calculateG1(TaxCalculationRequest taxCalculationRequest) {
        if (taxCalculationRequest.getW4Form().isOnlyHaveTwoJobs()) {
            return 0;
        }
        if (taxCalculationRequest.getW4Form().getPersonalInformation().getFilingStatus() == FilingStatus.MARRIED_FILING_JOINTLY) {
            return 12900;
        }

        return 8600;
    }

    private static double getAdjustedAnnualWage(TaxCalculationRequest taxCalculationRequest, double totalAnnualWage) {
        double adjusted_annual_wage;

        if (taxCalculationRequest.isUseW4()) {
            double e1 = totalAnnualWage + taxCalculationRequest.getW4Form().getAmountStep4a();

            System.out.println("E1:" + e1 + ", Step4a:" + taxCalculationRequest.getW4Form().getAmountStep4a());

            double g1 = calculateG1(taxCalculationRequest);

            System.out.println("G1:" + g1 + ", Step4b:" + taxCalculationRequest.getW4Form().getAmountStep4b());

            double h1 = taxCalculationRequest.getW4Form().getAmountStep4b() + g1;

            System.out.println("H1: " + h1);
            adjusted_annual_wage = e1 - h1;

        } else {
            double allowance = taxCalculationRequest.getFederalInformation().getFederalAllowance() * 4300;
            adjusted_annual_wage = totalAnnualWage - allowance;
        }


        adjusted_annual_wage = adjusted_annual_wage < 0 ? 0 : adjusted_annual_wage;

        System.out.println("Adjusted Annual Wage:" + adjusted_annual_wage);

        return adjusted_annual_wage;
    }


    private double calculateCaliforniaTax(TaxCalculationRequest taxCalculationRequest, double totalAnnualWage) {
        PaymentFrequency frequency = taxCalculationRequest.getPayType().getFrequency();
        FilingStatus filingStatus = taxCalculationRequest.getFederalInformation().getFilingStatus();
        String state = taxCalculationRequest.getState();
        int year = taxCalculationRequest.getYear();
        int nAllowances = taxCalculationRequest.getNAllowances();
        int additionalAllowances = taxCalculationRequest.getAdditionalAllowances();

        // Step 1 — Low Income Exemption check (Table 1)
        double wage = totalAnnualWage / frequency.frequencyNumber;
        LowIncomeExemption lowIncomeExemption = payrollCalculatorService.getLowIncomeExemption(
                frequency, filingStatus, nAllowances, wage, state, year);
        if (lowIncomeExemption != null) return 0;

        // Step 2 — Subtract estimated deduction for additional withholding allowances (Table 2)
        if (additionalAllowances > 0) {
            EstimatedDeduction estimatedDeduction = payrollCalculatorService.getEstimatedDeduction(frequency, state, year);
            double perAllowanceDeduction = PayrollCalculatorService.getEstimatedDeductionValue(estimatedDeduction, filingStatus);
            wage = wage - (perAllowanceDeduction * additionalAllowances);
        }

        // Step 3 — Subtract standard deduction (Table 3)
        StandardDeduction standardDeduction = payrollCalculatorService.getStandardDeduction(
                frequency, filingStatus, nAllowances, state, year);
        if (standardDeduction == null) {
            throw new IllegalStateException(
                    "Standard deduction data not found for " + state + ", " + year + ", " + frequency + ".");
        }
        double valueOfStandardDeduction = PayrollCalculatorService.getValueOfStandardDeduction(
                standardDeduction, nAllowances, filingStatus);
        double step3 = wage - valueOfStandardDeduction;

        // Step 4 — Compute tax using annual brackets (Table 5), then scale back to per-period
        // Annualize step3 income to look up in the annual rate table.
        double annualStep3 = step3 * frequency.frequencyNumber;
        StateTaxRate stateTaxRate = payrollCalculatorService.getStateTaxRate(
                PaymentFrequency.ANNUALLY, filingStatus, state, year, annualStep3);
        if (stateTaxRate == null) {
            throw new IllegalStateException(
                    "State tax rate bracket not found for " + state + ", " + year
                            + ", " + filingStatus + ", annual income=" + annualStep3 + ".");
        }
        double annualTax = stateTaxRate.getTaxRate() / 100 * (annualStep3 - stateTaxRate.getOver())
                + stateTaxRate.getPlus();
        double step4 = annualTax / frequency.frequencyNumber;

        // Step 5 — Subtract exemption allowance for REGULAR allowances only (Table 4).
        // Per the booklet: additional allowances for estimated deductions MUST NOT be used here.
        int regularAllowances = nAllowances - additionalAllowances;
        double allowanceValue;
        if (regularAllowances <= 10) {
            ExemptionAllowance exemptionAllowance = payrollCalculatorService.getExemptionAllowance(
                    state, year, regularAllowances);
            allowanceValue = PayrollCalculatorService.getExemptionValue(exemptionAllowance, frequency);
        } else {
            ExemptionAllowance exemptionAllowance = payrollCalculatorService.getExemptionAllowance(state, year, 1);
            double perValue = PayrollCalculatorService.getExemptionValue(exemptionAllowance, frequency);
            allowanceValue = perValue * regularAllowances;
        }

        return Math.max(0, step4 - allowanceValue);
    }
}
