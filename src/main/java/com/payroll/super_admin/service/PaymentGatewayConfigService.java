package com.payroll.super_admin.service;

import com.payroll.super_admin.entity.PaymentGatewayConfig;
import com.payroll.super_admin.repo.PaymentGatewayConfigRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PaymentGatewayConfigService {

    @Autowired
    private PaymentGatewayConfigRepository repository;

    public PaymentGatewayConfig getConfig() {
        return repository.findAll()
                .stream()
                .findFirst()
                .orElseGet(() -> {
                    PaymentGatewayConfig defaultConfig = new PaymentGatewayConfig();
                    defaultConfig.setPaypalStatus("inactive");
                    defaultConfig.setStripeStatus("inactive");
                    return repository.save(defaultConfig);
                });
    }

    public PaymentGatewayConfig saveOrUpdate(PaymentGatewayConfig config) {
        return repository.save(config);
    }
}

