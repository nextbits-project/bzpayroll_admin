package com.payroll.publicuseraccess.payrollcalculator.service;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.Connecticut.*;
import com.payroll.publicuseraccess.payrollcalculator.model.*;
import com.payroll.publicuseraccess.payrollcalculator.model.Louisiana.LouisianaTaxCreditBracket;
import com.payroll.publicuseraccess.payrollcalculator.model.Maine.MaineStandardDeduction;
import com.payroll.publicuseraccess.payrollcalculator.model.NewJersey.NewJerseyTaxRates;
import com.payroll.publicuseraccess.payrollcalculator.model.Oregon.OregonFederalDeduction;
import com.payroll.publicuseraccess.payrollcalculator.model.Oregon.OregonTaxRates;
import com.payroll.publicuseraccess.payrollcalculator.model.Wisconsin.WisconsinStandardDeduction;
import com.payroll.publicuseraccess.payrollcalculator.model.newyork.NewYorkTaxRate;
import com.payroll.publicuseraccess.payrollcalculator.model.newyork.TableADeduction;
import com.payroll.publicuseraccess.payrollcalculator.repository.Connecticut.*;
import com.payroll.publicuseraccess.payrollcalculator.repository.*;
import com.payroll.publicuseraccess.payrollcalculator.repository.Louisiana.LouisianaTaxCreditRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.Maine.MaineStandardDeductionRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.NewJersey.NewJerseyRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.Oregon.OregonFederalDeductionRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.Oregon.OregonStateTaxRatesRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.Wisconsin.WisconsinStandardDeductionRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.newyork.NewYorkTaxRateRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.newyork.TableADeductionRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class PayrollCalculatorService {
    private static final Logger log = LoggerFactory.getLogger(PayrollCalculatorService.class);
    @Autowired
    private FederalTaxRepository federalTaxRepository;
    @Autowired
    private ExemptionAllowanceRepository exemptionAllowanceRepository;
    @Autowired
    private EstimatedDeductionRepository estimatedDeductionRepository;
    @Autowired
    private LowIncomeExemptionRepository lowIncomeExemptionRepository;
    @Autowired
    private StandardDeductionRepository standardDeductionRepository;
    @Autowired
    private StateTaxRateRepository stateTaxRateRepository;

    @Autowired
    private StateFlatTaxRateRepository stateFlatTaxRateRepository;

    @Autowired
    private TableADeductionRepository tableADeductionRepository;

    @Autowired
    private NewYorkTaxRateRepository newYorkTaxRateRepository;

    @Autowired
    private TableAExemptionsRepository tableAExemptionsRepository;

    @Autowired
    private TableBTaxRatesRepository tableBTaxRatesRepository;

    @Autowired
    private TableCPhaseOutRepository tableCPhaseOutRepository;

    @Autowired
    private TableDTaxRecaptureRepository tableDTaxRecaptureRepository;

    @Autowired
    private TableEPersonalTaxCreditRepository tableEPersonalTaxCreditRepository;

    @Autowired
    private MaineStandardDeductionRepository maineStandardDeductionRepository;

    @Autowired
    private WisconsinStandardDeductionRepository wisconsinStandardDeductionRepository;

    @Autowired
    private OregonFederalDeductionRepository oregonFederalDeductionRepository;

    @Autowired
    private OregonStateTaxRatesRepository oregonTaxRatesRepository;

    @Autowired
    private NewJerseyRepository newJerseyRepository;

    @Autowired
    private LouisianaTaxCreditRepository louisianaTaxCreditRepository;
    
    public FederalTaxRate getFederalTax(FilingStatus filingStatus, boolean useW4, int taxYear, double annualWage){

        List<FederalTaxRate> byTaxYearAndFilingStatus = federalTaxRepository.findAll().stream().filter((item)->item.getFilingStatus().equals(filingStatus.name()) && item
                .getTaxYear() == taxYear && "NO".equals(item.getW4Form())).collect(Collectors.toList());

        log.info("LOG: {}",byTaxYearAndFilingStatus);

        Stream<FederalTaxRate> result= byTaxYearAndFilingStatus.parallelStream().filter((k)->annualWage >= k.getAtLeast() && (annualWage < k.getLessThan() || k.getLessThan() == -1));

        return result.findAny().orElse(null);
    }

    public StateTaxRate getStateTaxRate(PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year, double wage){
        List<StateTaxRate> byPaymentFrequencyAndFilingStatusAndStateNameAndYear = stateTaxRateRepository.findByPaymentFrequencyAndFilingStatusAndStateNameAndYear(paymentFrequency,filingStatus, stateName,year);
//        List<StateTaxsRate> byPaymentFrequencyAndFilingStatusAndStateNameAndYear = stateTaxRateRepository.findAll().parallelStream()
//                .filter(item->item.getPaymentFrequency().ordinal() ==  paymentFrequency.ordinal()&&
//                        item.getYear() == year && item.getFilingStatus().ordinal() == filingStatus.ordinal()
//                ).collect(Collectors.toList());
        Stream<StateTaxRate> result = byPaymentFrequencyAndFilingStatusAndStateNameAndYear.parallelStream().filter((k)->k.getOver() < wage && (k.getNotOver() >= wage || k.getNotOver() == -1));

        return  result.findAny().orElse(null);
    }

    /***
     *
     * @param paymentFrequency
     * @param filingStatus
     * @param nAllowance
     * @param wage
     * @param stateName
     * @param year
     * @return LowIncomeExemption non null if it's not taxable return null if taxable
     */
    public LowIncomeExemption getLowIncomeExemption(PaymentFrequency paymentFrequency, FilingStatus filingStatus, int nAllowance, double wage, String stateName, int year){
        List<LowIncomeExemption> byPaymentFrequencyAndStateNameAndYear = lowIncomeExemptionRepository.findByPaymentFrequencyAndStateNameAndYear(paymentFrequency, stateName, year);
        Stream<LowIncomeExemption> lowIncomeExemptionStream = byPaymentFrequencyAndStateNameAndYear.parallelStream().filter((k) -> getValueOfLowIncomeFilingStatus(k, nAllowance, filingStatus) >= wage);
        return lowIncomeExemptionStream.findAny().orElse(null);
    }

    protected static double getValueOfLowIncomeFilingStatus(LowIncomeExemption lowIncomeExemption, int nAllowance, FilingStatus filingStatus){
        switch (filingStatus){
            case SINGLE_OR_MARRIED_FILING_SEPARATELY:
                return lowIncomeExemption.getSingleOrMultiIncome();
            case MARRIED_FILING_JOINTLY:
                return (nAllowance < 2)?lowIncomeExemption.getMarriedZeroOrOne():lowIncomeExemption.getMarriedTwoOrMore();
            case HEAD_OF_HOUSEHOLD:
                return lowIncomeExemption.getUnmarriedHeadOfHouseHold();
            default:
                return 0;
        }
    }


    public StandardDeduction getStandardDeduction(PaymentFrequency paymentFrequency, FilingStatus filingStatus, int nAllowance, String stateName, int year){
        return standardDeductionRepository
                .findByPaymentFrequencyAndStateNameAndYear(paymentFrequency, stateName, year)
                .stream()
                .findFirst()
                .orElse(null);
    }

    public static double getValueOfStandardDeduction(StandardDeduction standardDeduction,int nAllowance,FilingStatus filingStatus){
        if (standardDeduction == null) {
            throw new IllegalStateException("Standard deduction data is missing for filing status " + filingStatus + ".");
        }
        switch (filingStatus){
            case SINGLE_OR_MARRIED_FILING_SEPARATELY:
                return standardDeduction.getSingleOrMultiIncome();
            case MARRIED_FILING_JOINTLY:
                return (nAllowance < 2)?standardDeduction.getMarriedZeroOrOne():standardDeduction.getMarriedTwoOrMore();
            case HEAD_OF_HOUSEHOLD:
                return standardDeduction.getUnmarriedHeadOfHouseHold();
            default:
                return 0;
        }
    }

    public EstimatedDeduction getEstimatedDeduction(PaymentFrequency paymentFrequency, String stateName, int year) {
        return estimatedDeductionRepository
                .findByPaymentFrequencyAndStateNameAndYear(paymentFrequency, stateName, year)
                .stream()
                .findFirst()
                .orElse(null);
    }

    public static double getEstimatedDeductionValue(EstimatedDeduction estimatedDeduction, FilingStatus filingStatus) {
        if (estimatedDeduction == null) return 0;
        switch (filingStatus) {
            case MARRIED_FILING_JOINTLY:
                return estimatedDeduction.getMarriedZeroOrOne();
            case HEAD_OF_HOUSEHOLD:
                return estimatedDeduction.getUnmarriedHeadOfHouseHold();
            default:
                return estimatedDeduction.getSingleOrMultiIncome();
        }
    }

    public ExemptionAllowance getExemptionAllowance(String stateName, int year,int nAllowance){
        List<ExemptionAllowance> byStateNameAndYear = exemptionAllowanceRepository.findByStateNameAndYear(stateName, year);
        Stream<ExemptionAllowance> exemptionAllowanceStream = byStateNameAndYear.parallelStream().filter((k) -> k.getNAtLeastAllowance() == nAllowance);
        return exemptionAllowanceStream.findAny().orElse(null);
    }

    public static double getExemptionValue(ExemptionAllowance exemptionAllowance, PaymentFrequency paymentFrequency){
        switch (paymentFrequency){
            case DAILY:
                return exemptionAllowance.getDaily();
            case WEEKLY:
                return exemptionAllowance.getWeekly();
            case MONTHLY:
                return exemptionAllowance.getMonthly();
            case SEMI_MONTHLY:
                return exemptionAllowance.getSemiMonthly();
            case ANNUALLY:
                return exemptionAllowance.getAnnual();
            case QUARTERLY:
                return exemptionAllowance.getQuarterly();
            case BI_WEEKLY:
                return  exemptionAllowance.getBiWeekly();
            case SEMI_ANNUALLY:
                return  exemptionAllowance.getSemiAnnually();
            default:
                return 0;
        }
    }


    public double calculateNewYorkTax(
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            double wage,
            int nAllowances,
            int year) {

        double netWage = 0;

        // Step 1:  calculation of net wages for exemptions <= 10.

        if (nAllowances <= 10) {
            TableADeduction tableADeduction = tableADeductionRepository
                    .findByFilingStatusAndPaymentFrequencyAndYear( filingStatus.name(), paymentFrequency.frequencyNumber,year)
                    .orElseThrow(() -> new RuntimeException(
                            "Deduction Amount not found for exemptions from Table A: " + nAllowances));

            // Subtract pre-computed deduction from wage
            netWage = wage - tableADeduction.getBaseDeductionAmount()-(tableADeduction.getIncrementer()*nAllowances);
        }
        // Step 2: Calculate tax from Table II-X based on payment frequency
        return calculateTaxFromFrequencyTable(paymentFrequency, filingStatus, netWage, year);
    }

    /**
     * Tax Calculation from the corresponding Table II-X based on payment frequency
     * and tax brackets
     */
    private double calculateTaxFromFrequencyTable(
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            double netWage,
            int year) {
        double finalTax = 0;

        if (netWage <= 0) {
            return 0;
        }

        NewYorkTaxRate taxRate = newYorkTaxRateRepository
                .findByFilingStatusAndYearAndPaymentFrequency(filingStatus.name(), year, paymentFrequency.frequencyNumber)
                .stream()
                .filter(rate -> netWage >= rate.getAtLeast() &&
                        (netWage < rate.getNotOver() || rate.getNotOver() == -1))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("No applicable tax rate found for taxable income: " + netWage));

        finalTax = ((netWage - taxRate.getColumn3()) * taxRate.getColumn4()) + taxRate.getColumn5();
        System.out.println("New york tax rate: " + taxRate + "\n finalTax" + finalTax);
        return finalTax;
    }

    public double calculateArizonaWithholdingFixTaxRate(double annualGrossWage, double withholdingRate, PaymentFrequency paymentFrequency) {
        double taxableWage = annualGrossWage / paymentFrequency.frequencyNumber;

        double withholdingTax =  taxableWage * (withholdingRate/100);

        return Math.round(withholdingTax * 100.0) / 100.0;
    }

    //for illinois, exemption amount is personal exemption
    public double calculateIllinoisWithholding(double wage,
                                               PaymentFrequency paymentFrequency,
                                               int basicAllowances,
                                               int additionalAllowances,
                                               int year,
                                               String stateName) {

        StateFlatTaxRate taxRate = stateFlatTaxRateRepository.findByStateNameAndYear(stateName,year).get();
        double rate = taxRate.getTaxRate();
        double personalExemptions = taxRate.getExemptionAmount();

        double finalWithholding = (rate / 100) * (wage - (basicAllowances * personalExemptions + additionalAllowances * 1000)/paymentFrequency.frequencyNumber);
        return finalWithholding;
    }
    
    public double calculateFlatTaxRateWithhodling(double wage, double taxRate) {

        double withholdingTax = wage * (taxRate / 100);

        return Math.round(withholdingTax * 100.0) / 100.0;
    }

    //for georgia, exemption amount is dependent allowance.
    public double calculateGeorgiaWithholding(double annualGrossWage, PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year, int nAllowances) {
        StandardDeduction standardDeduction = getStandardDeduction(paymentFrequency, filingStatus, nAllowances, stateName, year);

        double valueOfStandardDeduction = PayrollCalculatorService.getValueOfStandardDeduction(standardDeduction, nAllowances, filingStatus);
        StateFlatTaxRate taxRate = stateFlatTaxRateRepository.findByStateNameAndYear(stateName, year).get();

        double taxableIncome = annualGrossWage - valueOfStandardDeduction - (nAllowances * taxRate.getExemptionAmount()); //Dependent Allowance
        taxableIncome = Math.max(taxableIncome, 0);
        
        double withholdingAmount = (taxableIncome * (taxRate.getTaxRate() / 100)) / paymentFrequency.frequencyNumber;
        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateIdahoWithholding(double annualGrossWage, PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year, int nAllowances) {
        StateTaxRate stateTaxRate = getStateTaxRate(paymentFrequency, filingStatus, stateName, year, annualGrossWage);
        StateFlatTaxRate taxRateForExemption = stateFlatTaxRateRepository.findByStateNameAndYear(stateName, year).get();

        double taxableIncome = annualGrossWage - (nAllowances * taxRateForExemption.getExemptionAmount()); //Dependent Allowance
        taxableIncome = Math.max(0, taxableIncome - stateTaxRate.getOver());
        
        double withholdingAmount = (taxableIncome * (stateTaxRate.getTaxRate() / 100)) / paymentFrequency.frequencyNumber;
        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    //for alabama, dependents are nAllowances only.
    public double calculateAlabamaWithholding(double annualGrossWage, PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year, int dependents) {
        //Step 2: Deduction Calculation
        //StandardDeduction,PersonalExemptions and DependentAllowance are constant since 2007 that's why it is hardcoded
        double standardDeduction = getAlabamaStandardDeduction(filingStatus.toString(), annualGrossWage);
        double personalExemption = getAlabamaPersonalExemption(filingStatus.toString());
        double dependentAllowance = getAlabamaDependentAllowance(annualGrossWage, dependents);

        // Step 3: Sum deductions
        double totalDeductions = standardDeduction + personalExemption + dependentAllowance;

        // Step 4: Calculate taxable income
        double taxableIncome = Math.max(0, annualGrossWage - totalDeductions);

        // Step 5: Fetching tax rate
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY, filingStatus, stateName, year, taxableIncome);
        double finalYearlyWithholding = (stateTaxRate != null)
                ? ((stateTaxRate.getTaxRate() / 100) * (taxableIncome - stateTaxRate.getOver())) + stateTaxRate.getPlus()
                : 0;

        // Step 6: Divide by payroll periods for weekly withholding
        double withholdingAmount = finalYearlyWithholding / paymentFrequency.frequencyNumber;
        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    private static double getAlabamaStandardDeduction(String filingStatus, double annualWages) {
        switch (filingStatus) {
            case "SINGLE_OR_MARRIED_FILING_SEPARATELY":
            case "0":
                if (annualWages <= 25999) return 3000;
                if (annualWages >= 35500) return 2500;
                return 3000 - 25 * Math.ceil((annualWages - 25999) / 500);

//            case "MARRIED_FILING_SEPARATELY":
//                if (annualWages <= 12999) return 4250;
//                if (annualWages >= 17750) return 2500;
//                return 4250 - 88 * Math.ceil((annualWages - 12999) / 250);

            case "MARRIED_FILING_JOINTLY":
                if (annualWages <= 25999) return 8500;
                if (annualWages >= 35500) return 5000;
                return 8500 - 175 * Math.ceil((annualWages - 25999) / 500);

            case "HEAD_OF_HOUSEHOLD":
                if (annualWages <= 25999) return 5200;
                if (annualWages >= 35500) return 2500;
                return 5200 - 135 * Math.ceil((annualWages - 25999) / 500);

            default:
                return 0;
        }
    }


    private static double getAlabamaPersonalExemption(String filingStatus) {
        switch (filingStatus.toString()) {
            case "MARRIED_FILING_JOINTLY":
            case "HEAD_OF_HOUSEHOLD":
                return 3000;
            case "S":
                return 1500;
            default:
                return 0;
        }
    }

    private static double getAlabamaDependentAllowance(double annualWages, int dependents) {
        if (dependents <= 0) return 0;
        return dependents * (annualWages <= 50000 ? 1000 : (annualWages <= 100000 ? 500 : 300));
    }

    public double calculateArkansasWithholding(double annualWages,String stateName,PaymentFrequency paymentFrequency,FilingStatus filingStatus,int year,int nAllowance) {

        StandardDeduction standardDeduction = getStandardDeduction(paymentFrequency, filingStatus, nAllowance, stateName, year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,nAllowance,filingStatus);

        ExemptionAllowance exemptionAllowance = exemptionAllowanceRepository.findByStateNameAndYear(stateName,year).stream().findFirst().orElse(null);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);

        double netTaxableIncome = Math.max(0, annualWages - deductionAmount);

        double midrangeIncome = Math.round(netTaxableIncome / 50.0) * 50.0;

        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,midrangeIncome);
        double annualGrossTax = ((midrangeIncome * stateTaxRate.getTaxRate()/100) - stateTaxRate.getPlus() - (nAllowance * exemptionAmount)) / paymentFrequency.frequencyNumber;

        return Math.round(annualGrossTax * 100.0) / 100.0;
    }

    
    //For Indiana, NAllowance is dependentExemptions. BasicAllowances is personalExemptions. AdditionalAllowances is adoptedChildExemptions.
    public double calculateIndianaWithholding(double totalAnnualWage,String stateName,PaymentFrequency paymentFrequency, FilingStatus filingStatus,int year,int dependentExemptions,int personalExemptions, int adoptedChildDependent) {
      //personalExemptions,dependentExemptions are constant since it is introduced for state tax withholding(2001)
      //adopted child Exemptions are inserted in database
        StateFlatTaxRate stateFlatTaxRate = stateFlatTaxRateRepository.findByStateNameAndYear(stateName,year).get();
        double totalDeduction = (personalExemptions * 1000) + (dependentExemptions * 1500) + (adoptedChildDependent * stateFlatTaxRate.getExemptionAmount());
        double taxableIncome = totalAnnualWage - totalDeduction;
        double withholdingAmount = ((taxableIncome * stateFlatTaxRate.getTaxRate())/100)/paymentFrequency.frequencyNumber;

      return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateKentuckyWithholding(double annualWage, String stateName, PaymentFrequency paymentFrequency,int year) {

        StateFlatTaxRate stateFlatTaxRate = stateFlatTaxRateRepository.findByStateNameAndYear(stateName,year).get();

        StandardDeduction standardDeduction = getStandardDeduction(paymentFrequency,FilingStatus.SINGLE_OR_MARRIED_FILING_SEPARATELY,0,stateName,year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,0,FilingStatus.SINGLE_OR_MARRIED_FILING_SEPARATELY);
        double taxableIncome = annualWage - deductionAmount;

        double withholdingAmount = ((taxableIncome * stateFlatTaxRate.getTaxRate())/100)/paymentFrequency.frequencyNumber;

        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateMichiganWithholding(double annualGrossWage, PaymentFrequency paymentFrequency, String stateName, int year, int nAllowances) {
        StateFlatTaxRate taxRateForExemption = stateFlatTaxRateRepository.findByStateNameAndYear(stateName, year).get();
        double taxableIncome = annualGrossWage - (nAllowances * taxRateForExemption.getExemptionAmount());
        double withholdingAmount = (taxableIncome * (taxRateForExemption.getTaxRate() / 100)) / paymentFrequency.frequencyNumber;
        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateMississippiWithholding(double annualGrossWage, FilingStatus filingStatus, PaymentFrequency paymentFrequency, String stateName, int year) {
        //exemption is constant since it is introduced.
        double SINGLE_EXEMPTION = 6000;
        double MARRIED_EXEMPTION = 12000;
        double HEAD_OF_HOUSE_EXEMPTION = 9500;

        StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY, filingStatus, 0, stateName, year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction, 0, filingStatus);

        double personalExemptions;

        switch (filingStatus) {
            case SINGLE_OR_MARRIED_FILING_SEPARATELY :
                personalExemptions = SINGLE_EXEMPTION;
                break;
            case MARRIED_FILING_JOINTLY :
                personalExemptions = MARRIED_EXEMPTION;
                break;
            case HEAD_OF_HOUSEHOLD :
                personalExemptions = HEAD_OF_HOUSE_EXEMPTION;
                break;
            default:
                personalExemptions = 0;
        }

        double taxableIncome = Math.max(annualGrossWage - deductionAmount - personalExemptions,0.0);
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableIncome);
        double withholdingAmount = (((taxableIncome - stateTaxRate.getOver())* stateTaxRate.getTaxRate()) / 100) / paymentFrequency.frequencyNumber;

        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateCarolinaWithholding(double totalAnnualWage,FilingStatus filingStatus,PaymentFrequency paymentFrequency,String stateName,int year, int nAllowances) {

        StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,filingStatus,0,stateName,year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,nAllowances,filingStatus);

        StateFlatTaxRate stateFlatTax = stateFlatTaxRateRepository.findByStateNameAndYear(stateName,year).get();
        double taxableIncome = Math.max(0,totalAnnualWage - deductionAmount - nAllowances*stateFlatTax.getExemptionAmount());

        double withholdingAmount = (taxableIncome * stateFlatTax.getTaxRate()/100) /paymentFrequency.frequencyNumber ;
        return Math.round(withholdingAmount);
    }

    public double calculateLouisianaWithholding(double totalAnnualWage,PaymentFrequency paymentFrequency, FilingStatus filingStatus,String stateName, int year) {
        StateFlatTaxRate stateFlatTaxRate = stateFlatTaxRateRepository.findByStateNameAndYear(stateName,year).get();

        double deductionAmount = filingStatus != null
                ? getValueOfStandardDeduction(getStandardDeduction(PaymentFrequency.ANNUALLY, filingStatus, 0, stateName, year), 0, filingStatus)
                : 0.0;
        double taxableIncome = Math.max(0, totalAnnualWage - deductionAmount);

        double withholdingAmount = (taxableIncome * stateFlatTaxRate.getTaxRate()/100) / paymentFrequency.frequencyNumber;

        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateUtahWithholding(double totalAnnualWage,PaymentFrequency paymentFrequency, FilingStatus stateFilingStatus, String stateName, int year) {

        StateFlatTaxRate stateFlatTaxRate = stateFlatTaxRateRepository.findByStateNameAndYear(stateName, year).get();
        double annualGrossTax = totalAnnualWage * stateFlatTaxRate.getTaxRate()/100;

        //Step 2. substract deductions
        StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,stateFilingStatus,0,stateName,year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,0,stateFilingStatus);

        double exemptionAmount = stateFlatTaxRate.getExemptionAmount();

        if(stateFilingStatus.equals(FilingStatus.MARRIED_FILING_JOINTLY)) {
            exemptionAmount = exemptionAmount * 2;
        }
        //Step 3. annual withholding allowance calculation
        double annualWithholdingAllowance = Math.max(0,exemptionAmount - ((totalAnnualWage - deductionAmount) * 1.3/100));
        double withholdingAmount = (annualGrossTax - annualWithholdingAllowance)/paymentFrequency.frequencyNumber;
        return Math.round(withholdingAmount * 100.0) / 100.0;
    }

    public double calculateNorthDakotaWithholding(double totalAnnualWage,PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year, int nAllowance) {
        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
        double taxableIncome  = totalAnnualWage - (nAllowance * exemptionAmount);

        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableIncome);
        taxableIncome = taxableIncome - stateTaxRate.getOver();

        double withholdingAmount = ((stateTaxRate.getTaxRate() * taxableIncome/100) + stateTaxRate.getPlus());
        return Math.round(withholdingAmount/ paymentFrequency.frequencyNumber);
    }

    public double calculateConnecticutWithholdingCalculation(double totalAnnualWage, String withholdingCode,PaymentFrequency paymentFrequency, int year ) {
        if(withholdingCode.equals("NO_FORM")) {
            return Math.round(((totalAnnualWage * 0.0699) / paymentFrequency.frequencyNumber) * 100.0) / 100.0;
        }

        // Step 1: Determine Personal Exemption (Table A)
        TableAExemptions tableAExemptions = tableAExemptionsRepository.findByWithholdingCodeAndYear(withholdingCode, year)
                .stream().filter((k) -> totalAnnualWage >= k.getOver() && (totalAnnualWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double personalExemption = tableAExemptions.getExemptionAmount();

        // Step 2: Calculate Annual Wage after Exemption
        double annualWageAfterExemption = totalAnnualWage - personalExemption;

        // Step 3: Determine Tax Rate (Table B)
        TableBTaxRates tableBTaxRates = tableBTaxRatesRepository.findByWithholdingCodeAndYear(withholdingCode, year)
                .stream().filter((k) -> annualWageAfterExemption >= k.getOver() && (annualWageAfterExemption < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double baseTax = tableBTaxRates.getPlus();
        double rate = tableBTaxRates.getTaxRate();
        double taxableExcess = annualWageAfterExemption - tableBTaxRates.getOver();
        double finalWithholding = baseTax + (taxableExcess * rate/100);

        // Step 4: Phase-Out Add Back (Table C)
        TableCPhaseOutAddBack phaseOut = tableCPhaseOutRepository.findByWithholdingCodeAndYear(withholdingCode, year)
                .stream().filter((k) -> totalAnnualWage >= k.getOver() && (totalAnnualWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double phaseOutAmount = phaseOut.getPhaseOutAmount();
        finalWithholding += phaseOutAmount;

        // Step 5: Tax Recapture (Table D)
        TableDTaxRecapture tableDTaxRecapture = tableDTaxRecaptureRepository.findByWithholdingCodeAndYear(withholdingCode, year)
                .stream().filter((k) -> totalAnnualWage >= k.getOver() && (totalAnnualWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double recaptureAmount = tableDTaxRecapture.getRecaptureAmount();
        finalWithholding += recaptureAmount;

        // Step 6: Personal Tax Credit (Table E)
        TableEPersonalTaxCredit tableEPersonalTaxCredit = tableEPersonalTaxCreditRepository.findByWithholdingCodeAndYear(withholdingCode, year)
                .stream().filter((k) -> totalAnnualWage >= k.getOver() && (totalAnnualWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double personalTaxCredit = tableEPersonalTaxCredit.getCreditAmount();

        finalWithholding = finalWithholding * (1.0 - personalTaxCredit);
        return Math.round(finalWithholding / paymentFrequency.frequencyNumber*100)/100;
    }

    public double calculateDelawareWithholding(double totalAnnualWage, PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year, int nAllowance) {

        StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,filingStatus,nAllowance,stateName,2025);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,nAllowance,filingStatus);

        double taxableIncome = totalAnnualWage - deductionAmount;
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,2025,taxableIncome);

        double finalWithholding = ((taxableIncome-stateTaxRate.getOver())  * stateTaxRate.getTaxRate()/100) + stateTaxRate.getPlus();
        finalWithholding = finalWithholding - (nAllowance * 110);

        return  finalWithholding / paymentFrequency.frequencyNumber;
    }
    public double calculateHawaiiWithholding(
            double totalAnnualWage,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            String stateName,
            int year,
            int nAllowance) {
        //exemption amount - 1144, is constant since last some years
        //lumpsum - 1650 is introduced in 2025
        double lumpSumAmount = 0;
        if(year == 2025) {
            lumpSumAmount = 1650;
        }
        double taxableIncome = totalAnnualWage - (nAllowance * 1144) - lumpSumAmount;
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableIncome);

        double finalWithholding = stateTaxRate.getPlus() + ((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate() / 100);
        return finalWithholding/paymentFrequency.frequencyNumber;
    }

    public double calculateIowaWithholding(
            double totalAnnualWage,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            String stateName,
            int year,
            int nAllowance,
            double totalAllowanceAmount) {

        double deductionAmount;

        // 2024 Logic: Different deductions based on allowance amount
        if (year == 2024) {
            deductionAmount = (totalAllowanceAmount < 80) ? 14600 : 29200;
        } else if (year == 2025) {
            deductionAmount = getValueOfStandardDeduction(
                    getStandardDeduction(PaymentFrequency.ANNUALLY, filingStatus, 0, stateName, year),
                    0,
                    filingStatus);
        } else {
            throw new IllegalArgumentException("Year not supported: " + year);
        }
        
        // Step 2: Calculate taxable income (t1)
        double t1 = Math.max(0, totalAnnualWage - deductionAmount);

        // Step 3: Calculate preliminary withholding amount (t2)
        double t2;
        if (year == 2024) {
            StateTaxRate stateTaxRate = getStateTaxRate(
                    PaymentFrequency.ANNUALLY,
                    filingStatus,
                    stateName,
                    year,
                    t1
            );
            t2 = (stateTaxRate.getPlus() + ((t1 - stateTaxRate.getOver()) * stateTaxRate.getTaxRate() / 100));
        } else {
            t2 = t1 * 0.038;
        }

        // Step 4: Adjust for withholding allowances
        double t3 = Math.max(0, t2 - totalAllowanceAmount );
        double finalWithholdingAmount = Math.round(t3/ paymentFrequency.frequencyNumber * 100.0) / 100.0;
        return finalWithholdingAmount;
    }

    public double calculateMaineWithholding(double totalAnnualWage, FilingStatus filingStatus, PaymentFrequency paymentFrequency, String stateName, int nAllowance, int year) {
        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);

        MaineStandardDeduction maineStandardDeduction = maineStandardDeductionRepository.findByFilingStatusAndYear(filingStatus,year).stream().filter((k) -> totalAnnualWage >= k.getOver() && (totalAnnualWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double deductionAmount;
        if (totalAnnualWage <= maineStandardDeduction.getOver()) {
            deductionAmount = maineStandardDeduction.getDeductionAmount();
        } else if (maineStandardDeduction.getNotOver() != null && totalAnnualWage < maineStandardDeduction.getNotOver()) {
            double adjustmentAmount = maineStandardDeduction.getNotOver() - maineStandardDeduction.getOver();
            deductionAmount = Math.round(((maineStandardDeduction.getNotOver() - totalAnnualWage) / adjustmentAmount) * maineStandardDeduction.getDeductionAmount());
        } else {
            deductionAmount = 0.0;
        }
        double taxableIncome = Math.max(0,totalAnnualWage - (exemptionAmount * nAllowance) - deductionAmount);

        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,totalAnnualWage);
        double finalWithholding = stateTaxRate.getPlus() + ((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100);
        return Math.round(finalWithholding / paymentFrequency.frequencyNumber);
    }

    public double calculateKansasWithholding( double totalAnnualWage,FilingStatus filingStatus, PaymentFrequency paymentFrequency, String stateName, int nAllowance, int year) {
        LowIncomeExemption lowIncomeExemption = lowIncomeExemptionRepository.findByPaymentFrequencyAndStateNameAndYear(PaymentFrequency.ANNUALLY,stateName,year)
                .stream().findFirst().orElse(null);

        double personalAllowance = (nAllowance > 0) ? getValueOfLowIncomeFilingStatus(lowIncomeExemption, nAllowance, filingStatus) : 0;
        double taxableWages = totalAnnualWage - personalAllowance;
        double additionalDependent = Math.max(0,(filingStatus == FilingStatus.SINGLE_OR_MARRIED_FILING_SEPARATELY) ? (nAllowance - 1) : (nAllowance-2));

        ExemptionAllowance exemptionAllowance =  getExemptionAllowance(stateName,year,1);
        double dependentAllowance = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
        taxableWages = taxableWages - (additionalDependent * dependentAllowance);

        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableWages);
        double finalWithholding = stateTaxRate.getPlus() + (taxableWages - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100;

        return Math.round(finalWithholding / paymentFrequency.frequencyNumber);
    }

    public double calculateMinnesotaAndNebraskaAndOhioAndOklahomaAndRhodeIslandAndVermontWithholding(
            double totalAnnualWage,
            FilingStatus filingStatus,
            PaymentFrequency paymentFrequency,
            String stateName,
            int nAllowance,
            int year) {
        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
        double taxableWage = Math.max(0,totalAnnualWage - (nAllowance * exemptionAmount));
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableWage);
        double finalWithholding = (stateTaxRate.getPlus() + ((taxableWage - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100))/paymentFrequency.frequencyNumber;
        return Math.round(finalWithholding * 100.0) / 100.0;
    }

    public double calculateMissouriWithholding(
            double totalAnnualWage,
            FilingStatus filingStatus,
            PaymentFrequency paymentFrequency,
            String stateName,
            int year) {

        StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,filingStatus,1,stateName,year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,1,filingStatus);
        double taxableIncome = Math.max(0,totalAnnualWage - deductionAmount);
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,FilingStatus.SINGLE_OR_MARRIED_FILING_SEPARATELY,stateName,year,taxableIncome);
        double finalWithholding = ((taxableIncome-stateTaxRate.getOver())  * stateTaxRate.getTaxRate()/100) + stateTaxRate.getPlus();
        return Math.round(finalWithholding/ paymentFrequency.frequencyNumber);
    }

    public double calculateMontanaAndNewMexicoWithholding(
            double totalAnnualWage,
            FilingStatus filingStatus,
            PaymentFrequency paymentFrequency,
            String stateName,
            int year) {

        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,totalAnnualWage);
        double finalWithholding = (((totalAnnualWage-stateTaxRate.getOver())  * stateTaxRate.getTaxRate()/100) + stateTaxRate.getPlus())/paymentFrequency.frequencyNumber;
        return Math.round(finalWithholding * 100.0) / 100.0;
    }

    public double calculateSouthCarolinaWithholding(
            double totalAnnualWage,
            FilingStatus filingStatus,
            PaymentFrequency paymentFrequency,
            String stateName,
            int nAllowance,
            int year) {
        double deductionAmount = 0;
        if(nAllowance > 0) {
            StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,filingStatus,1,stateName,year);
            deductionAmount =  Math.min(totalAnnualWage*0.1, getValueOfStandardDeduction(standardDeduction,1,filingStatus));
        }

        double taxableIncome = Math.max(0,totalAnnualWage - deductionAmount);

        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);

        double taxableWage = Math.max(0,taxableIncome - (nAllowance * exemptionAmount));
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableWage);
        double finalWithholding = (stateTaxRate.getPlus() + ((taxableWage - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100))/paymentFrequency.frequencyNumber;
        return Math.round(finalWithholding * 100.0) / 100.0;
    }

    // dependentExemptions = NAllowances, personalExemptions = basicAllowances
    public double calculateVirgniaWithholding(
            double totalAnnualWage,
            String stateName,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int dependentExemptions,
            int personalExemptions) {

        StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,filingStatus,1,stateName,year);
        double deductionAmount = getValueOfStandardDeduction(standardDeduction,1,filingStatus);
        double taxableIncome =  totalAnnualWage - deductionAmount - (dependentExemptions * 800) - (personalExemptions * 930);
        taxableIncome = Math.max(0,taxableIncome);
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableIncome);
        double finalWithholding = (stateTaxRate.getPlus() + ((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100))/paymentFrequency.frequencyNumber;
        return Math.round(finalWithholding * 100.0) / 100.0;
    }

    public double calculateWestVirgniaAndWashintonDCWithholding(
            double totalAnnualWage,
            String stateName,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int nAllowances) {
        double taxableIncome;
        if(stateName.equals("Washington DC")) {
            ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
            double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
            taxableIncome = Math.max(0,totalAnnualWage - (nAllowances * exemptionAmount));
        } else {
            taxableIncome = Math.max(0, totalAnnualWage  - (nAllowances*2000));
        }
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableIncome);

        double finalWithholding = (stateTaxRate.getPlus() + ((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100))/paymentFrequency.frequencyNumber;
        return Math.round(finalWithholding);
    }

    public double calculateWisconsinWithholding(
            double totalAnnualWage,
            String stateName,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int nAllowances) {

        WisconsinStandardDeduction standardDeduction =
                wisconsinStandardDeductionRepository.findByFilingStatusAndYear(filingStatus, year).stream().filter((k) -> totalAnnualWage >= k.getOver() && (totalAnnualWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double deductionAmount = 0.0;

        if (totalAnnualWage <= standardDeduction.getOver()) {
            deductionAmount = standardDeduction.getDeductionAmount();
        } else if (standardDeduction.getNotOver() != null && totalAnnualWage < standardDeduction.getNotOver()) {
            deductionAmount = standardDeduction.getDeductionAmount() -
                    (((totalAnnualWage - standardDeduction.getOver()) * standardDeduction.getPercentage())/100);
        } else {
            deductionAmount = 0.0;
        }
        double taxableIncome = Math.max(0, totalAnnualWage - deductionAmount - (nAllowances * 400));
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,taxableIncome);
        double finalWithholding = (stateTaxRate.getPlus() + ((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()/100))/paymentFrequency.frequencyNumber;
        return Math.round(finalWithholding * 100.0) / 100.0;
    }

    public double calculateOregonWithholding(
            double totalAnnualWage,
            double federalTax,
            String stateName,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int nAllowances) {

              
    StandardDeduction standardDeduction = getStandardDeduction(PaymentFrequency.ANNUALLY,filingStatus,1,stateName,year);

    double deductionAmount = (nAllowances >=3) ? getValueOfStandardDeduction(standardDeduction,nAllowances,FilingStatus.MARRIED_FILING_JOINTLY)
            : getValueOfStandardDeduction(standardDeduction,nAllowances,filingStatus);


    List<OregonFederalDeduction> federalDeductions = oregonFederalDeductionRepository.findByFilingStatusAndYear(filingStatus, year);

    OregonFederalDeduction oregonFederalDeduction = federalDeductions.stream()
        .filter(deduction -> totalAnnualWage >= deduction.getOver() && totalAnnualWage < deduction.getNotOver())
        .findFirst()
        .orElse(null);

        double deductibleFederalTax = Math.min(federalTax, oregonFederalDeduction.getMaximumDeductionAmount());

        double baseIncome = totalAnnualWage - deductibleFederalTax - deductionAmount;
        List<OregonTaxRates> taxBrackets =
                oregonTaxRatesRepository.findByFilingStatusAndYear(filingStatus, year);

        List<OregonTaxRates> eligibleTaxBrackets = taxBrackets.stream()
                .filter(rate -> totalAnnualWage >= rate.getMinimumWageThreshold() && totalAnnualWage <rate.getMaximumWageThreshold())
                .collect(Collectors.toList());

        OregonTaxRates taxBracket = eligibleTaxBrackets.stream()
                .filter(rate -> baseIncome >= rate.getOver() && baseIncome < rate.getNotOver())
                .findFirst()
                .orElseThrow(() -> new RuntimeException("No tax bracket found for given income and filing status"));


        double excessIncome = baseIncome - taxBracket.getOver();
        double taxOnExcess = excessIncome * taxBracket.getTaxRate()/100;
        double totalTax = taxBracket.getPlus() + taxOnExcess;
        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
        double netWithholdingTax = Math.max(0, totalTax - (exemptionAmount*nAllowances));
        return Math.round(netWithholdingTax / paymentFrequency.frequencyNumber);
    }

    public double calculateNewJerseyWithholding(double totalAnnualWage, String rateCode,PaymentFrequency paymentFrequency, int year, int nAllowances) {
        double taxableWage = Math.max(0,totalAnnualWage - (nAllowances * 1000));
        NewJerseyTaxRates newJerseyTaxRates = newJerseyRepository.findByRateCodeAndYear(rateCode, year)
                .stream().filter((k) -> taxableWage >= k.getOver() && (taxableWage < k.getNotOver() || k.getNotOver() == -1)).findAny().orElse(null);

        double finalWithholding = (newJerseyTaxRates.getPlus() + ((taxableWage - newJerseyTaxRates.getOver()) * newJerseyTaxRates.getTaxRate()/100))/paymentFrequency.frequencyNumber;

        return finalWithholding;
    }

    public double calculateMassachusettsWithholding(
            double totalAnnualWage,
            String stateName,
            double medicare,
            double ficaTax,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int nAllowance,
            boolean headOfHousehold,
            boolean personalBlindness,
            boolean spouseBlindness) {

        double allowableFICADeduction = Math.min((ficaTax + medicare), 2000);
        double taxableIncome = totalAnnualWage - allowableFICADeduction;
        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);

        double exemptionAmount =  getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
        taxableIncome -= (exemptionAmount * nAllowance);

        taxableIncome = Math.max(0, taxableIncome);


        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,FilingStatus.SINGLE_OR_MARRIED_FILING_SEPARATELY,stateName,year,totalAnnualWage);
        double annualTax = stateTaxRate.getPlus() + (((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()) / 100);

        if (headOfHousehold) {
            annualTax -= 120;
        }
        if (personalBlindness) {
            annualTax -= 110;
        }
        if (spouseBlindness) {
            annualTax -= 110;
        }

        double finalWithholding = annualTax / paymentFrequency.frequencyNumber;

        return Math.max(0, finalWithholding);
    }

    public double calculateMarylandWithholding(
            double totalAnnualWage,
            String stateName,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int nAllowance) {
        double standardDeduction = Math.min(Math.max(totalAnnualWage * 0.15, 1850), 2700);
        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName,year,1);
        double exemptionAmount = getExemptionValue(exemptionAllowance,PaymentFrequency.ANNUALLY);
        double taxableIncome = Math.max(totalAnnualWage - standardDeduction - (exemptionAmount * nAllowance), 0);
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY,filingStatus,stateName,year,totalAnnualWage);
        double annualTax = stateTaxRate.getPlus() + (((taxableIncome - stateTaxRate.getOver()) * stateTaxRate.getTaxRate()) / 100);
        double finalWithholding = annualTax / paymentFrequency.frequencyNumber;

        return Math.round(finalWithholding * 100.0) / 100.0;
    }
    public double calculateLouisianaProgressiveTaxWithholding(
            double totalAnnualWage,
            String stateName,
            PaymentFrequency paymentFrequency,
            FilingStatus filingStatus,
            int year,
            int nAllowance,
            int additionalDependent) {

        FilingStatus taxRateFilingStatus = filingStatus; 

        if (nAllowance <= 1) {
            taxRateFilingStatus = FilingStatus.SINGLE_OR_MARRIED_FILING_SEPARATELY;
        }
        StateTaxRate stateTaxRate = getStateTaxRate(PaymentFrequency.ANNUALLY, taxRateFilingStatus, stateName, year, totalAnnualWage);
        double annualTax = stateTaxRate.getPlus() + ((totalAnnualWage - stateTaxRate.getOver()) * stateTaxRate.getTaxRate() / 100.0);

        ExemptionAllowance exemptionAllowance = getExemptionAllowance(stateName, year, 1);
        double exemptionAmount = (nAllowance > 0) ? getExemptionValue(exemptionAllowance, PaymentFrequency.ANNUALLY) * nAllowance : 0;

        double totalExemptionAmount = exemptionAmount + (additionalDependent * 1000);

        LouisianaTaxCreditBracket dependentCreditBracket = louisianaTaxCreditRepository.findByFilingStatusAndYear(filingStatus, year)
                .stream()
                .filter(k -> totalExemptionAmount >= k.getOver() &&
                        (totalExemptionAmount < k.getNotOver() || k.getNotOver() == -1))
                .findAny()
                .orElse(null);

        double dependentCreditAmount = 0;
        if (dependentCreditBracket != null) {
            dependentCreditAmount = dependentCreditBracket.getPlus() +
                    ((totalExemptionAmount - dependentCreditBracket.getOver()) * dependentCreditBracket.getTaxRate() / 100);
        }

        annualTax = Math.max(annualTax - dependentCreditAmount, 0);

        double finalWithholding = annualTax / paymentFrequency.frequencyNumber;

        return Math.round(finalWithholding * 100.0) / 100.0;
    }
}
