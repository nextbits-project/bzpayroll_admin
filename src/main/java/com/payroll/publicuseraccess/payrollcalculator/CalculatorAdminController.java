package com.payroll.publicuseraccess.payrollcalculator;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.ExemptionAllowance;
import com.payroll.publicuseraccess.payrollcalculator.model.FederalTaxRate;
import com.payroll.publicuseraccess.payrollcalculator.model.StandardDeduction;
import com.payroll.publicuseraccess.payrollcalculator.model.StateTaxRate;
import com.payroll.publicuseraccess.payrollcalculator.model.newyork.NewYorkTaxRate;
import com.payroll.publicuseraccess.payrollcalculator.model.newyork.TableADeduction;
import com.payroll.publicuseraccess.payrollcalculator.service.TaxRateAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping(value = "/api")
public class CalculatorAdminController {

    @Autowired
    private TaxRateAdminService taxRateAdminService;

    @GetMapping("/state-tax-rate")
    public List<StateTaxRate> getStateTaxRates() {
        return taxRateAdminService.getStateTaxRates();
    }

    @GetMapping("/federal-tax-rate")
    public List<FederalTaxRate> getFederalTaxRates() {
        return taxRateAdminService.getFederalTaxRates();
    }

    @GetMapping("/standard-deduction")
    public List<StandardDeduction> getStandardDeductions() {
        return taxRateAdminService.getStandardDeductions();
    }

    //
    // @GetMapping("/personal-exemption")
    // public List<PersonalExemption> getPersonalExemptions() {
    // return payrollCalculatorService.getPersonalExemptions();
    // }

    @PostMapping("/state-tax-rate")
    public StateTaxRate createStateTaxRate(@RequestBody StateTaxRate stateTaxRate) {
        return taxRateAdminService.createOrUpdateStateTaxRate(stateTaxRate);
    }
    @PostMapping("/create-state-tax-rate-list")
    public List<StateTaxRate> createStateTaxRateList(@RequestBody List<StateTaxRate> stateTaxRate) {
        return taxRateAdminService.createOrUpdateStateTaxRateList(stateTaxRate);
    }

    @PutMapping("/state-tax-rate")
    public StateTaxRate upateTaxRate(@RequestBody StateTaxRate stateTaxRate) {
        System.out.println("Updated State Tax Rate ==> " + stateTaxRate);
        return taxRateAdminService.createOrUpdateStateTaxRate(stateTaxRate);
    }

    @PostMapping("/federal-tax-rate")
    public FederalTaxRate createFederalTaxRate(@RequestBody FederalTaxRate federalTaxRate) {
        System.out.println("Federal Tax Rate ==> " + federalTaxRate);
        return taxRateAdminService.createFederalTaxRate(federalTaxRate);
    }

    @PostMapping("/standard-deduction")
    public StandardDeduction standardDeduction(@RequestBody StandardDeduction standardDeduction) {
        System.out.println("Standard Deduction  ==> " + standardDeduction);
        return taxRateAdminService.createStandardDeduction(standardDeduction);
    }

    @GetMapping("/filtered-state-tax-rate")
    public List<StateTaxRate> getFilteredStateTaxRates(
            @RequestParam String state,
            @RequestParam int year,
            @RequestParam PaymentFrequency paymentFrequency) {
        return taxRateAdminService.getFilteredStateTaxRates(state, year, paymentFrequency);
    }

    @DeleteMapping("/state-tax-rate/{id}")
    public void deleteStateTaxRate(@PathVariable("id") Long id) {
        System.out.println("Deleting state-tax-rate ==> " + id);
        taxRateAdminService.deleteStateTaxRate(id);
    }

    @DeleteMapping("/federal-tax-rate/{id}")
    public void deleteFederalTaxRates(@PathVariable("id") Long id) {
        taxRateAdminService.deleteFederalTaxRate(id);
    }

    @DeleteMapping("/standard-deduction/{id}")
    public void deleteStandardDeduction(@PathVariable("id") Long id) {
        taxRateAdminService.deleteStandardDeduction(id);
    }

    @PostMapping("/state-tax-rate/bulk-upload")
    public ResponseEntity<String> insertTaxRatesInBulk(@RequestParam("file") MultipartFile file) {
        System.out.println("Received File : " + file);
        try {
            String message = taxRateAdminService.insertTaxRatesInBulk(file);
            return ResponseEntity.ok(message);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error processing file: " + e.getMessage());
        }
    }

    @PutMapping("/federal-tax-rate")
    public FederalTaxRate updateFederalTax(@RequestBody FederalTaxRate federalTaxRate) {
        System.out.println("Federal Tax Rate ==> " + federalTaxRate);
        return taxRateAdminService.updateFederalTaxRate(federalTaxRate);
    }

    @GetMapping("/filtered-federal-tax-rate")
    public List<FederalTaxRate> getFilteredFederalTaxRates(@RequestParam int year) {
        return taxRateAdminService.getFilteredFederalTaxRates(year);
    }

    @PostMapping("/federal-tax-rate/bulk-upload")
    public ResponseEntity<String> createFederalRateList(@RequestParam("file") MultipartFile file) {
        System.out.println("Received File to create Federal Tax Rates : " + file);
        try {
            String message = taxRateAdminService.processFederalRateBulkUpload(file);
            return ResponseEntity.ok(message);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error processing file: " + e.getMessage());
        }
    }

    @PostMapping("/create-federal-tax-rate-list")
    public List<FederalTaxRate> createFederalTaxRateList(@RequestBody List<FederalTaxRate> federalTaxRate) {
        return taxRateAdminService.createOrUpdateFederalTaxRateList(federalTaxRate);
    }

    @DeleteMapping("/state-tax-rates")
    public void deleteStateTaxRateList() {
        taxRateAdminService.deleteStateTaxRates();
    }

    @DeleteMapping("/federal-tax-rates")
    public void deleteFederalTaxRateList() {
        taxRateAdminService.deleteFederalTaxRates();
    }
    
    @PostMapping("/new-york-rate-list")
    public List<NewYorkTaxRate> saveNewYorkRateList(@RequestBody List<NewYorkTaxRate> newYorkTaxRates) {
        return taxRateAdminService.saveNewYorkRatesList(newYorkTaxRates);
    }

    @PostMapping("/tableA-deduction-list")
    public List<TableADeduction> saveTableADeductionList(@RequestBody List<TableADeduction> tableADeductions) {
        return taxRateAdminService.saveTableADeductionList(tableADeductions);
    }

    @PostMapping("/standard-deduction-list")
    public List<StandardDeduction> saveStandardDeductions(@RequestBody List<StandardDeduction> standardDeductions) {
        return taxRateAdminService.saveStandardDeductions(standardDeductions);
    }

    @GetMapping("/filtered-standard-deductions")
    public List<StandardDeduction> getFilteredStandardDeductions(
            @RequestParam String state,
            @RequestParam int year,
            @RequestParam PaymentFrequency paymentFrequency) {
        return taxRateAdminService.getStandardDeductions(paymentFrequency,state,year);
    }

    @GetMapping("/filtered-exemption-allowance")
    public List<ExemptionAllowance> getFilteredStandardDeductions(
            @RequestParam String state,
            @RequestParam int year) {
        return taxRateAdminService.getExemptionAllowances(state,year);
    }

    @GetMapping("/table-a-deduction")
    public  List<TableADeduction> getTableADeduction(
            @RequestParam int year,
            @RequestParam PaymentFrequency paymentFrequency) {
        return taxRateAdminService.getTableADeductions(paymentFrequency,year);
    }
}
