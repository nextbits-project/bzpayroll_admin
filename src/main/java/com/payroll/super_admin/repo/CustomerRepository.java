package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Optional<Customer> findByEmail(String email);
    List<Customer> findByLastNameContainingIgnoreCase(String lastName);
    List<Customer> findByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
    boolean existsByEmail(String email);
    List<Customer> findByActiveTrue();
    List<Customer> findByActiveFalse();
    List<Customer> findByMembership(Customer.MembershipLevel membership);
    List<Customer> findByBusinessType(Customer.BusinessType businessType);

    List<Customer> findByFirstNameContainingOrLastNameContainingOrEmailContaining(String firstName, String lastName, String email);
}