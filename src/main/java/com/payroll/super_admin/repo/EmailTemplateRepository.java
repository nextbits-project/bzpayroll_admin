package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.EmailTemplate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmailTemplateRepository extends JpaRepository<EmailTemplate, Long> {
     // load templates of a category (returns full templates; service maps to DTO)
    List<EmailTemplate> findByCategoryCode(String categoryCode);
    
    List<EmailTemplate> findByCategoryId(Long categoryId);
    // find by subject snippet (if needed)
    List<EmailTemplate> findBySubjectContainingIgnoreCase(String subject);
}
