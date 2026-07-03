package com.payroll.publicuseraccess.payrollcalculator.repository;

import com.payroll.publicuseraccess.payrollcalculator.dto.PaymentFrequency;
import com.payroll.publicuseraccess.payrollcalculator.model.StandardDeduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StandardDeductionRepository extends JpaRepository<StandardDeduction,Long> {
    List<StandardDeduction> findByPaymentFrequencyAndStateNameAndYear(PaymentFrequency paymentFrequency, String stateName, int year);
}
