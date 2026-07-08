package com.payroll.super_admin.repo;
import com.payroll.super_admin.entity.BcaBlogCategories;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogCategoryRepository extends JpaRepository<BcaBlogCategories, Long> {

}