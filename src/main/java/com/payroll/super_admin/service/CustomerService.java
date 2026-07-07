package com.payroll.super_admin.service;

import com.payroll.super_admin.entity.Customer;
import com.payroll.super_admin.exceptions.CustomerNotFoundException;
import com.payroll.super_admin.exceptions.DuplicateEmailException;
import com.payroll.super_admin.repo.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class CustomerService {

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    // Basic CRUD operations
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    public Customer getCustomerById(Long id) {
        return customerRepository.findById(id)
                .orElseThrow(() -> new CustomerNotFoundException("Customer not found with id: " + id));
    }

    @Transactional
    public Customer createCustomer(Customer customer) {
        validateCustomerEmail(customer.getEmail());
        return customerRepository.save(customer);
    }

    @Transactional
    public Customer updateCustomer(Long id, Customer customerDetails) {
        Customer existingCustomer = getCustomerById(id);

        if (!existingCustomer.getEmail().equals(customerDetails.getEmail())) {
            validateCustomerEmail(customerDetails.getEmail());
        }

        existingCustomer.setFirstName(customerDetails.getFirstName());
        existingCustomer.setLastName(customerDetails.getLastName());
        existingCustomer.setEmail(customerDetails.getEmail());
        existingCustomer.setPhone(customerDetails.getPhone());
        existingCustomer.setAddress(customerDetails.getAddress());
        existingCustomer.setMembership(customerDetails.getMembership());
        existingCustomer.setBusinessType(customerDetails.getBusinessType());
        existingCustomer.setActive(customerDetails.isActive());

        return customerRepository.save(existingCustomer);
    }

    @Transactional
    public void deleteCustomer(Long id) {
        if (!customerRepository.existsById(id)) {
            throw new CustomerNotFoundException("Customer not found with id: " + id);
        }
        customerRepository.deleteById(id);
    }

    // Status management
    @Transactional
    public Customer toggleCustomerStatus(Long id) {
        Customer customer = getCustomerById(id);
        customer.setActive(!customer.isActive());
        return customerRepository.save(customer);
    }

    // Filter methods
    public List<Customer> getActiveCustomers() {
        return customerRepository.findByActiveTrue();
    }

    public List<Customer> getInactiveCustomers() {
        return customerRepository.findByActiveFalse();
    }

    public List<Customer> getCustomersByMembership(Customer.MembershipLevel membership) {
        return customerRepository.findByMembership(membership);
    }

    public List<Customer> getCustomersByBusinessType(Customer.BusinessType businessType) {
        return customerRepository.findByBusinessType(businessType);
    }

    // Search methods
    public List<Customer> searchCustomers(String searchTerm) {
        return customerRepository.findByFirstNameContainingOrLastNameContainingOrEmailContaining(searchTerm, searchTerm, searchTerm);
    }

    // Validation
    private void validateCustomerEmail(String email) {
        if (customerRepository.existsByEmail(email)) {
            throw new DuplicateEmailException("Email already exists: " + email);
        }
    }

    // Additional business logic
    public double calculateMonthlyRevenue() {
        return customerRepository.findAll().stream()
                .mapToDouble(c -> {
                    switch (c.getMembership()) {
                        case STANDARD: return 19.95;
                        case STANDARD_PLUS: return 49.95;
                        case SILVER: return 39.95;
                        case SILVER_PLUS: return 69.95;
                        case GOLD: return 69.95;
                        case GOLD_PLUS: return 99.95;
                        default: return 0;
                    }
                })
                .sum();
    }
}