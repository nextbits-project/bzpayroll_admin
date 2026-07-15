package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.FAQ;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface FAQRepository extends JpaRepository<FAQ, Long> {
    
    // Find top-level items (no parent)
    @Query("SELECT f FROM FAQ f WHERE f.parentId IS NULL OR f.parentId = '' ORDER BY f.displayOrder")
    List<FAQ> findTopLevelItems();
    
    // Find children by parentId
    @Query("SELECT f FROM FAQ f WHERE f.parentId = :parentId ORDER BY f.displayOrder")
    List<FAQ> findByParentId(String parentId);
    
    // Check if a content has children
    @Query("SELECT COUNT(f) > 0 FROM FAQ f WHERE f.parentId = :contentId")
    boolean hasChildren(String contentId);
    
    // Find all items ordered by displayOrder
    List<FAQ> findAllByOrderByDisplayOrderAsc();
    
    // Find all folders
    List<FAQ> findByTypeOrderByDisplayOrderAsc(String type);
    
    // Find all active items
    List<FAQ> findByActiveTrueOrderByDisplayOrderAsc();
    
    // Find by contentId
    Optional<FAQ> findByContentId(String contentId);
}
