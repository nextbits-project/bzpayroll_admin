package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.BcaSmsTemplate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BcaSmsTemplateRepository extends JpaRepository<BcaSmsTemplate, Integer> {
	List<BcaSmsTemplate> findByActive(Integer isActive);
	BcaSmsTemplate findByTemplateIdAndActive(int templateId, Integer isActive);
	List<BcaSmsTemplate> findByCategoryId(Long categoryId);
}