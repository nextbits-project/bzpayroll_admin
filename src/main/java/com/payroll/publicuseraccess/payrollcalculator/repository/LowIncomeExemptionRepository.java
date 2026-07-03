package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.LowIncomeExemption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LowIncomeExemptionRepository extends JpaRepository<LowIncomeExemption,Long> {
    List<LowIncomeExemption> findByPaymentFrequencyAndStateNameAndYear(PaymentFrequency paymentFrequency, String stateName, Integer year);
}
