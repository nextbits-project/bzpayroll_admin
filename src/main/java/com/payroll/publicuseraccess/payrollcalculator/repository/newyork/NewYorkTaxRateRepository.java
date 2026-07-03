package com.payroll.publicuseraccess.payrollcalculator.repository.newyork;

import com.payroll.publicuseraccess.payrollcalculator.model.newyork.NewYorkTaxRate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewYorkTaxRateRepository extends JpaRepository<NewYorkTaxRate, Long> {
    List<NewYorkTaxRate> findByFilingStatusAndYearAndPaymentFrequency(String filingStatus, Integer year, Integer paymentFrequency);
}
