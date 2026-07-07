package com.payroll.super_admin.entity;

import jakarta.persistence.*;


@Entity
@Table(name = "bca_user") // change to your actual table name
public class BcaUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "membershipLevel")
    private String membershipLevel;
    @Column(name = "prefix")
    private String prefix;
    @Column(name = "firstname")
    private String firstName;
    @Column(name = "lastname")
    private String lastName;
    @Column(name = "Email_Address",unique = true)
    private String emailAddress;
    @Column(name = "phone")
    private String phone;
    @Column(name = "position")
    private String position;
    @Column(name = "city")
    private String city;
    @Column(name = "State")
    private String state;
    @Column(name = "Country")
    private String country;
    @Column(name = "password")
    private String password;
    @Column(name = "company")
    private String company;
    @Column(name = "status")
    private String status;
    @Column(name = "stripeCustomerId")
    private String stripeCustomerId;
    @Column(name = "stripeSubscriptionId")
    private String stripeSubscriptionId;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CompanyID")
    private BcaCompany bcaCompany;
    @Column(name = "Active")
    private Boolean active;
     // Constructor

    public BcaUser() {
    }

    public BcaUser(Integer id, String membershipLevel, String prefix, String firstName, String lastName, String emailAddress, String position, String city, String state, String country, String password, String company) {
        this.id = id;
        this.membershipLevel = membershipLevel;
        this.prefix = prefix;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress = emailAddress;
        this.position = position;
        this.city = city;
        this.state = state;
        this.country = country;
        this.password = password;
        this.company = company;
    }

    // Getter and Setter

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMembershipLevel() {
        return membershipLevel;
    }

    public void setMembershipLevel(String membershipLevel) {
        this.membershipLevel = membershipLevel;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStripeCustomerId() {
        return stripeCustomerId;
    }

    public void setStripeCustomerId(String stripeCustomerId) {
        this.stripeCustomerId = stripeCustomerId;
    }

    public String getStripeSubscriptionId() {
        return stripeSubscriptionId;
    }

    public void setStripeSubscriptionId(String stripeSubscriptionId) {
        this.stripeSubscriptionId = stripeSubscriptionId;
    }

    public BcaCompany getBcaCompany() {
        return bcaCompany;
    }

    public void setBcaCompany(BcaCompany bcaCompany) {
        this.bcaCompany = bcaCompany;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}

