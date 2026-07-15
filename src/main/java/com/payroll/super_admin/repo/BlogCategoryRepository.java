package com.payroll.super_admin.repo;
import com.payroll.super_admin.entity.BcaBlogCategories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

@Repository
public interface BlogCategoryRepository extends JpaRepository<BcaBlogCategories, Long> {

}