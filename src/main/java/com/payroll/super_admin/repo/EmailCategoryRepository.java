package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.EmailCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EmailCategoryRepository extends JpaRepository<EmailCategory, Long> {
    Optional<EmailCategory> findByCode(String code);

    boolean existsByCode(String code);

    // Optionally fetch with templates when needed:
    @Query("SELECT DISTINCT c FROM EmailCategory c LEFT JOIN FETCH c.templates")
    List<EmailCategory> findAllWithTemplates();

    @Query("SELECT c FROM EmailCategory c LEFT JOIN FETCH c.templates WHERE c.code = :code")
    Optional<EmailCategory> findByCodeWithTemplates(@Param("code") String code);
}


