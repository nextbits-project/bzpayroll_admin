package com.payroll.super_admin.service;

import com.payroll.super_admin.entity.FAQ;
import com.payroll.super_admin.repo.FAQRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FAQService {

    @Autowired
    private FAQRepository repository;

    // Get all items ordered by displayOrder
    public List<FAQ> getAllItemsOrderedByDisplayOrder() {
        return repository.findAllByOrderByDisplayOrderAsc();
    }

    // Get all folders
    public List<FAQ> getAllFolders() {
        return repository.findByTypeOrderByDisplayOrderAsc("folder");
    }

    // Get all active items
    public List<FAQ> getAllActiveItems() {
        return repository.findByActiveTrueOrderByDisplayOrderAsc();
    }

    // Get content by contentId
    public FAQ getContent(String contentId) {
        return repository.findByContentId(contentId).orElse(null);
    }

    // Get content by id
    public FAQ getContentById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // Save or update content
    public FAQ save(FAQ content) {
        if (content == null) {
            throw new IllegalArgumentException("Content cannot be null");
        }

        // Validate required fields
        if (content.getTitle() == null || content.getTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("Title is required");
        }

        // Generate contentId if not provided
        if (content.getContentId() == null || content.getContentId().isEmpty()) {
            content.setContentId(generateContentId(content.getTitle()));
        }

        // Validate contentId uniqueness
        Optional<FAQ> existing = repository.findByContentId(content.getContentId());
        if (existing.isPresent() && 
            (content.getId() == null || !existing.get().getId().equals(content.getId()))) {
            throw new IllegalArgumentException("Content ID must be unique");
        }

        // Validate displayOrder
        if (content.getDisplayOrder() < 0) {
            content.setDisplayOrder(1);
        }

        // Normalize parentId
        if (content.getParentId() != null && content.getParentId().isEmpty()) {
            content.setParentId(null);
        }

        // Validate content for files
        if ("file".equals(content.getType()) && 
            (content.getContent() == null || content.getContent().isEmpty())) {
            throw new IllegalArgumentException("Content is required for file type");
        }

        return repository.save(content);
    }

    // Generate URL-friendly contentId from title
    private String generateContentId(String title) {
        return title.toLowerCase()
            .replaceAll("[^a-z0-9]", "-")
            .replaceAll("-+", "-")
            .replaceAll("^-|-$", "");
    }

    // Delete content by id
    public void delete(Long id) {
        FAQ content = repository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Content not found"));
            
        if ("folder".equals(content.getType()) && repository.hasChildren(content.getContentId())) {
            throw new IllegalArgumentException("Cannot delete folder with children");
        }
        
        repository.deleteById(id);
    }

    // Update active status
    public void updateActiveStatus(Long id, boolean active) {
        FAQ content = repository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Content not found"));
        content.setActive(active);
        repository.save(content);
    }

    // Get top level items
    public List<FAQ> getTopLevelItems() {
        List<FAQ> items = repository.findTopLevelItems();
        items.forEach(item -> item.setChildren(repository.findByParentId(item.getContentId())));
        return items;
    }

    // Get children by parentId
    public List<FAQ> getChildren(String parentId) {
        return repository.findByParentId(parentId);
    }

    // Build complete hierarchy
    public List<FAQ> getCompleteHierarchy() {
        List<FAQ> topLevel = repository.findTopLevelItems();
        return buildHierarchy(topLevel);
    }
    public List<FAQ> getAllActive() {
        List<FAQ> topLevel = repository.findByActiveTrueOrderByDisplayOrderAsc();
        return buildHierarchy(topLevel);
    }

    private List<FAQ> buildHierarchy(List<FAQ> items) {
        for (FAQ item : items) {
            List<FAQ> children = repository.findByParentId(item.getContentId());
            if (!children.isEmpty()) {
                item.setChildren(buildHierarchy(children));
            }
        }
        return items;
    }
}
