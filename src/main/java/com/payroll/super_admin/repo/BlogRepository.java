package com.payroll.super_admin.repo;
import com.payroll.super_admin.entity.BcaBlogs;
import com.payroll.super_admin.entity.BlogStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BlogRepository extends JpaRepository<BcaBlogs, Long> {

    Optional<BcaBlogs> findBySlug(String slug);

    List<BcaBlogs> findByStatus(BlogStatus status);

    List<BcaBlogs> findByCategoryId(Long categoryId);

}
