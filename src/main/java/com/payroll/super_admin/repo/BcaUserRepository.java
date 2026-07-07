package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.BcaCompany;
import com.payroll.super_admin.entity.BcaUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BcaUserRepository extends JpaRepository<BcaUser, Integer> {
    List<BcaUser> findByActive(Boolean active);
    Optional<BcaUser> findByEmailAddress(String emailAddress);
	
	
}
