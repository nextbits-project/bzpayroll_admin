package com.payroll.super_admin.repo;


import com.payroll.super_admin.entity.PaymentGatewayConfig;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentGatewayConfigRepository extends JpaRepository<PaymentGatewayConfig, Long> {
}

