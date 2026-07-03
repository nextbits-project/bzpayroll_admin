package com.payroll.model;
import jakarta.persistence.*;

@Entity
@Table(name = "bca_user")
public class BcaUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "LoginID")
    private String loginId;

    @Column(name = "Password")
    private String password;

    @Column(name = "Email_Address")
    private String emailAddress;

    @Column(name = "Active")
    private Integer active;

    // Optional fields you might want to include
    @Column(name = "Firstname")
    private String firstName;

    @Column(name = "Lastname")
    private String lastName;

    // Getters and Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getLoginId() { return loginId; }
    public void setLoginId(String loginId) { this.loginId = loginId; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmailAddress() { return emailAddress; }
    public void setEmailAddress(String emailAddress) { this.emailAddress = emailAddress; }

    public Integer getActive() { return active; }
    public void setActive(Integer active) { this.active = active; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
}

