package com.payroll.publicuseraccess.payrollcalculator.service;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.*;
import com.payroll.publicuseraccess.payrollcalculator.model.newyork.NewYorkTaxRate;
import com.payroll.publicuseraccess.payrollcalculator.model.newyork.TableADeduction;
import com.payroll.publicuseraccess.payrollcalculator.repository.ExemptionAllowanceRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.FederalTaxRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.StandardDeductionRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.StateTaxRateRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.newyork.NewYorkTaxRateRepository;
import com.payroll.publicuseraccess.payrollcalculator.repository.newyork.TableADeductionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@Service
public class TaxRateAdminService {

    @Autowired
    private StandardDeductionRepository standardDeductionRepository;

    @Autowired
    private StateTaxRateRepository stateTaxRateRepository;

    @Autowired
    private TableADeductionRepository tableADeductionRepository;

    @Autowired
    private NewYorkTaxRateRepository newYorkTaxRateRepository;

    @Autowired
    private FederalTaxRepository federalTaxRepository;

    @Autowired
    private ExemptionAllowanceRepository exemptionAllowanceRepository;

    public List<StateTaxRate> getStateTaxRates() {
        return stateTaxRateRepository.findAll();
    }

    public List<FederalTaxRate> getFederalTaxRates() {
        return federalTaxRepository.findAll();
    }

    public List<StandardDeduction> getStandardDeductions() {
        return standardDeductionRepository.findAll();
    }

    public StateTaxRate createOrUpdateStateTaxRate(StateTaxRate stateTaxRate) {
        return stateTaxRateRepository.save(stateTaxRate);
    }
    public void deleteStateTaxRate(Long id) {
        stateTaxRateRepository.deleteById(id);
    }

    public FederalTaxRate createFederalTaxRate(FederalTaxRate federalTaxRate) {
        return federalTaxRepository.save(federalTaxRate);
    }
    public void deleteFederalTaxRate(Long id) {
        federalTaxRepository.deleteById(id);
    }

    public StandardDeduction createStandardDeduction(StandardDeduction standardDeduction) {
        return standardDeductionRepository.save(standardDeduction);
    }

    public void deleteStandardDeduction(Long id) {
        standardDeductionRepository.deleteById(id);
    }

    public List<StateTaxRate> getFilteredStateTaxRates(String state, int year, PaymentFrequency paymentFrequency) {
        List<StateTaxRate> list = stateTaxRateRepository.findByPaymentFrequencyAndStateNameAndYear(
           paymentFrequency,state,year);
        return list;
    }

    public List<StateTaxRate> createOrUpdateStateTaxRateList(List<StateTaxRate> stateTaxRate) {
        return stateTaxRateRepository.saveAll(stateTaxRate);
    }

    public String insertTaxRatesInBulk(MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            return "Uploaded file is empty.";
        }

        List<StateTaxRate> stateTaxRates = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            String line;
            boolean firstLine = true;
            
            while ((line = br.readLine()) != null) {
                if (firstLine) {
                    firstLine = false;
                    continue;
                }

                String[] values = line.split(",");

                StateTaxRate taxRate = new StateTaxRate();
                taxRate.setStateName(values[0].trim());
                taxRate.setPaymentFrequency(PaymentFrequency.valueOf(values[1].trim().toUpperCase()));
                taxRate.setFilingStatus(FilingStatus.valueOf(values[2].trim().toUpperCase()));
                taxRate.setOver(Double.parseDouble(values[3].trim()));
                taxRate.setNotOver(Double.parseDouble(values[4].trim()));
                taxRate.setTaxRate(Double.parseDouble(values[5].trim()));
                taxRate.setPlus(Double.parseDouble(values[6].trim()));
                taxRate.setYear(Integer.parseInt(values[7].trim()));

                stateTaxRates.add(taxRate);
                System.out.println("Tax Rate:  ==> " + taxRate);
            }
        } catch (Exception e) {
            throw new Exception("Error parsing CSV: " + e.getMessage());
        }

        stateTaxRateRepository.saveAll(stateTaxRates);
        return "Successfully inserted " + stateTaxRates.size() + " tax records.";
    }

    public void deleteStateTaxRates() {
        stateTaxRateRepository.deleteAll();
    }

    public FederalTaxRate updateFederalTaxRate(FederalTaxRate federalTaxRate) {
        return federalTaxRepository.save(federalTaxRate);
    }

    public List<FederalTaxRate> getFilteredFederalTaxRates(int year) {
        return federalTaxRepository.findByTaxYear(year);
    }

    public String processFederalRateBulkUpload(MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            return "Uploaded file is empty.";
        }

        List<FederalTaxRate> federalTaxRates = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            String line;
            boolean firstLine = true;

            while ((line = br.readLine()) != null) {
                if (firstLine) {
                    firstLine = false;
                    continue;
                }

                String[] values = line.split(",");

                FederalTaxRate taxRate = new FederalTaxRate();

                taxRate.setTaxYear(Integer.parseInt(values[0].trim()));
                taxRate.setFilingStatus(values[1].trim().toUpperCase());
                taxRate.setAtLeast(Double.parseDouble(values[2].trim()));
                taxRate.setLessThan(Double.parseDouble(values[3].trim()));
                taxRate.setTaxRate(Double.parseDouble(values[4].trim()));
                taxRate.setW4Form(values[5].trim().toUpperCase());
                taxRate.setTentativeAmountToWithhold(Double.parseDouble(values[6].trim()));
                taxRate.setAdjustedAnnualWage(Double.parseDouble(values[7].trim()));

                federalTaxRates.add(taxRate);
            }
        } catch (Exception e) {
            throw new Exception("Error parsing CSV: " + e.getMessage());
        }

        federalTaxRepository.saveAll(federalTaxRates);
        return "Successfully inserted federal tax records.";
    }

    public List<FederalTaxRate> createOrUpdateFederalTaxRateList(List<FederalTaxRate> federalTaxRates) {
        return federalTaxRepository.saveAll(federalTaxRates);
    }

    public void deleteFederalTaxRates() {
        federalTaxRepository.deleteAll();
    }

    public List<TableADeduction> saveTableADeductionList(List<TableADeduction> tableADeductions) {
        return tableADeductionRepository.saveAll(tableADeductions);
    }

    public List<NewYorkTaxRate> saveNewYorkRatesList(List<NewYorkTaxRate> newYorkTaxRates) {
        return newYorkTaxRateRepository.saveAll(newYorkTaxRates);
    }

    public List<StandardDeduction> saveStandardDeductions(List<StandardDeduction> standardDeductions) {
        return standardDeductionRepository.saveAll(standardDeductions);
    }

    public List<ExemptionAllowance> getExemptionAllowances(String stateName, Integer year) {
        return exemptionAllowanceRepository.findByStateNameAndYear(stateName, year);
    }

    public List<StandardDeduction> getStandardDeductions(PaymentFrequency paymentFrequency, String stateName, int year) {
        return standardDeductionRepository.findByPaymentFrequencyAndStateNameAndYear(paymentFrequency,stateName,year);
    }

    public List<TableADeduction> getTableADeductions(PaymentFrequency paymentFrequency, int year) {
        return tableADeductionRepository.findByPaymentFrequencyAndYear(paymentFrequency.frequencyNumber, year);
    }
}
