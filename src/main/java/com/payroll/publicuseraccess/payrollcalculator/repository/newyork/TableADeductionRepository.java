package com.payroll.publicuseraccess.payrollcalculator.repository.newyork;

import com.payroll.publicuseraccess.payrollcalculator.model.newyork.TableADeduction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TableADeductionRepository extends JpaRepository<TableADeduction, Long> {

    // This method will fetch data from Table A -
    // deduction according to values passed as parameters.

    Optional<TableADeduction> findByFilingStatusAndPaymentFrequencyAndYear(String filingStatus, Integer paymentFrequency, Integer year);

    List<TableADeduction> findByPaymentFrequencyAndYear(Integer paymentFrequency, Integer year);
}
