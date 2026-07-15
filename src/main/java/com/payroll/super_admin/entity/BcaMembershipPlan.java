package com.payroll.super_admin.entity;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "bca_membership_plans")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BcaMembershipPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String planName;

    @Column(unique = true)
    private String planCode;

    private String stripeProductId;

    private String stripePriceId;

    @Column(nullable = false)
    private BigDecimal amount;

    private String currency;

    private String billingInterval;

    private Integer employeeLimit;

    private Integer imageLimit;

    @Column(length = 2000)
    private String description;

    private Boolean active;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;
}
