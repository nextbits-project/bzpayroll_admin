package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.EstimatedDeduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EstimatedDeductionRepository extends JpaRepository<EstimatedDeduction,Long> {
    List<EstimatedDeduction> findByPaymentFrequencyAndStateNameAndYear(PaymentFrequency paymentFrequency, String stateName, Integer year);

}
