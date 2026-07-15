package com.payroll.super_admin.repo;

import com.payroll.super_admin.entity.HelpContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface HelpContentRepository extends JpaRepository<HelpContent, Long> {
    
    // Find top-level items (no parent)
    @Query("SELECT h FROM HelpContent h WHERE h.parentId IS NULL OR h.parentId = '' ORDER BY h.displayOrder")
    List<HelpContent> findTopLevelItems();
    
    // Find children by parentId
    @Query("SELECT h FROM HelpContent h WHERE h.parentId = :parentId ORDER BY h.displayOrder")
    List<HelpContent> findByParentId(String parentId);
    
    // Check if a content has children
    @Query("SELECT COUNT(h) > 0 FROM HelpContent h WHERE h.parentId = :contentId")
    boolean hasChildren(String contentId);
    
    // Find all items ordered by displayOrder
    List<HelpContent> findAllByOrderByDisplayOrderAsc();
    
    // Find all folders
    List<HelpContent> findByTypeOrderByDisplayOrderAsc(String type);
    
    // Find all active items
    List<HelpContent> findByActiveTrueOrderByDisplayOrderAsc();
    
    // Find by contentId
    Optional<HelpContent> findByContentId(String contentId);
}
