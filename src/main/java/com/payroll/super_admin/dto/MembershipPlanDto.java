package com.payroll.super_admin.dto;

import lombok.Data;

@Data
public class MembershipPlanDto {
    private String id;
    private String planName;
    private String amount;
    private String billingInterval;
    private String description;
    private Integer employeeLimit;
}
