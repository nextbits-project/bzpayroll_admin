package com.payroll.publicuseraccess.payrollcalculator.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class ExemptionInfo {
    private boolean federal;
    private boolean fica;
    private boolean medicare;

    }
