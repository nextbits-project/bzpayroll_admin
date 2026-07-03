package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.UserAdmin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserAdmin, Long> {
    Optional<UserAdmin> findByUsername(String username);
}