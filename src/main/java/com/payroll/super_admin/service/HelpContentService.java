package com.payroll.super_admin.service;

import com.payroll.super_admin.entity.HelpContent;
import com.payroll.super_admin.repo.HelpContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HelpContentService {

    @Autowired
    private HelpContentRepository repository;

    // Get all items ordered by displayOrder
    public List<HelpContent> getAllItemsOrderedByDisplayOrder() {
        return repository.findAllByOrderByDisplayOrderAsc();
    }

    // Get all folders
    public List<HelpContent> getAllFolders() {
        return repository.findByTypeOrderByDisplayOrderAsc("folder");
    }

    // Get all active items
    public List<HelpContent> getAllActiveItems() {
        return repository.findByActiveTrueOrderByDisplayOrderAsc();
    }

    // Get content by contentId
    public HelpContent getContent(String contentId) {
        return repository.findByContentId(contentId).orElse(null);
    }

    // Get content by id
    public HelpContent getContentById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // Save or update content
    public HelpContent save(HelpContent content) {
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
        Optional<HelpContent> existing = repository.findByContentId(content.getContentId());
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
        HelpContent content = repository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Content not found"));
            
        if ("folder".equals(content.getType()) && repository.hasChildren(content.getContentId())) {
            throw new IllegalArgumentException("Cannot delete folder with children");
        }
        
        repository.deleteById(id);
    }

    // Update active status
    public void updateActiveStatus(Long id, boolean active) {
        HelpContent content = repository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Content not found"));
        content.setActive(active);
        repository.save(content);
    }

    // Get top level items
    public List<HelpContent> getTopLevelItems() {
        List<HelpContent> items = repository.findTopLevelItems();
        items.forEach(item -> item.setChildren(repository.findByParentId(item.getContentId())));
        return items;
    }

    // Get children by parentId
    public List<HelpContent> getChildren(String parentId) {
        return repository.findByParentId(parentId);
    }

    // Build complete hierarchy
    public List<HelpContent> getCompleteHierarchy() {
        List<HelpContent> topLevel = repository.findTopLevelItems();
        return buildHierarchy(topLevel);
    }
    public List<HelpContent> getAllActive() {
        List<HelpContent> topLevel = repository.findByActiveTrueOrderByDisplayOrderAsc();
        return buildHierarchy(topLevel);
    }

    private List<HelpContent> buildHierarchy(List<HelpContent> items) {
        for (HelpContent item : items) {
            List<HelpContent> children = repository.findByParentId(item.getContentId());
            if (!children.isEmpty()) {
                item.setChildren(buildHierarchy(children));
            }
        }
        return items;
    }
}
