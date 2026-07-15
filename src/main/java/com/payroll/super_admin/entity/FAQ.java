package com.payroll.super_admin.entity;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "faq")
public class FAQ {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String contentId; // Unique identifier for content
    private String title;
    private String type; // 'file' or 'folder'

    @Column(columnDefinition = "TEXT")
    private String content; // HTML content for files

    private String parentId; // For hierarchical structure
    private int displayOrder; // For sorting

    @Column(nullable = false, columnDefinition = "boolean default true")
    private boolean active = true; // true=active, false=inactive

    @Transient
    private List<FAQ> children = new ArrayList<>(); // For hierarchical representation

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getContentId() { return contentId; }
    public void setContentId(String contentId) { this.contentId = contentId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getParentId() { return parentId; }
    public void setParentId(String parentId) { this.parentId = parentId; }
    public int getDisplayOrder() { return displayOrder; }
    public void setDisplayOrder(int displayOrder) { this.displayOrder = displayOrder; }
    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }
    public List<FAQ> getChildren() { return children; }
    public void setChildren(List<FAQ> children) { this.children = children; }
    public void addChild(FAQ child) { this.children.add(child); }
}
