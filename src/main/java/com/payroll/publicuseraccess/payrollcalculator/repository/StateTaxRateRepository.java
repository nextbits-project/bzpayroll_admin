package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.FilingStatus;
import com.payroll.publicuseraccess.payrollcalculator.model.StateTaxRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StateTaxRateRepository extends JpaRepository<StateTaxRate, Long> {
    List<StateTaxRate> findByPaymentFrequencyAndStateNameAndYear(PaymentFrequency paymentFrequency, String stateName, int year);
    List<StateTaxRate> findByPaymentFrequencyAndFilingStatusAndStateNameAndYear(PaymentFrequency paymentFrequency, FilingStatus filingStatus, String stateName, int year);
}
