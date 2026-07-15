package com.payroll.super_admin.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "payment_gateway_config")
public class PaymentGatewayConfig {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // PayPal settings
    @Column(name = "paypal_status")
    private String paypalStatus;

    @Column(name = "paypal_client_id")
    private String paypalClientId;

    @Column(name = "paypal_secret")
    private String paypalSecret;

    // Stripe settings
    @Column(name = "stripe_status")
    private String stripeStatus;

    @Column(name = "stripe_publishable_key")
    private String publishedKey;

    @Column(name = "stripe_api_key")
    private String apiKey;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPaypalStatus() {
        return paypalStatus;
    }

    public void setPaypalStatus(String paypalStatus) {
        this.paypalStatus = paypalStatus;
    }

    public String getPaypalClientId() {
        return paypalClientId;
    }

    public void setPaypalClientId(String paypalClientId) {
        this.paypalClientId = paypalClientId;
    }

    public String getPaypalSecret() {
        return paypalSecret;
    }

    public void setPaypalSecret(String paypalSecret) {
        this.paypalSecret = paypalSecret;
    }

    public String getStripeStatus() {
        return stripeStatus;
    }

    public void setStripeStatus(String stripeStatus) {
        this.stripeStatus = stripeStatus;
    }

    public String getPublishedKey() {
        return publishedKey;
    }

    public void setPublishedKey(String publishedKey) {
        this.publishedKey = publishedKey;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }
}

