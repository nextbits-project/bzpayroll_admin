package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.FAQ;
import com.payroll.super_admin.service.FAQService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/faq")
public class FAQAdminController {
    
    @Autowired
    private FAQService service;

    // Main admin page
    @GetMapping
    public String adminPage(Model model, @RequestParam(value = "edit", required = false) Long editId) {
        // Get all top-level items with their immediate children
        List<FAQ> topLevelItems = service.getTopLevelItems();
        model.addAttribute("faqContents", topLevelItems);

        // Get all items for dropdowns
        model.addAttribute("allContents", service.getAllItemsOrderedByDisplayOrder());
        
        // Setup edit or new content
        if (editId != null) {
            FAQ editContent = service.getContentById(editId);
            model.addAttribute("newContent", editContent != null ? editContent : new FAQ());
        } else {
            model.addAttribute("newContent", new FAQ());
        }
        
        model.addAttribute("folders", service.getAllFolders());
        return "th/faq";
    }

    // Save content
    @PostMapping("/save")
    public String saveContent(@ModelAttribute("newContent") FAQ newContent,
        BindingResult result, Model model) {
        String forward = "";
        if (result.hasErrors()) {
            model.addAttribute("faqContents", service.getTopLevelItems());
            model.addAttribute("folders", service.getAllFolders());
            forward = "th/faq";
        }
        try {
            service.save(newContent);
            return "redirect:/faq";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("faqContents", service.getTopLevelItems());
            model.addAttribute("folders", service.getAllFolders());
            forward = "th/faq";
        }

        return forward;
    }

    // Delete content
    @GetMapping("/delete/{id}")
    public String deleteContent(@PathVariable Long id, Model model) {
        try {
            service.delete(id);
            return "redirect:/faq";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("faqContents", service.getTopLevelItems());
            model.addAttribute("newContent", new FAQ());
            model.addAttribute("folders", service.getAllFolders());
            return "th/faq";
        }
    }

    // Update status via AJAX
    @PostMapping("/update-status")
    @ResponseBody
    public String updateStatus(@RequestParam Long id, @RequestParam boolean active) {
        try {
            service.updateActiveStatus(id, active);
            return "Status updated successfully";
        } catch (IllegalArgumentException e) {
            return "Error: " + e.getMessage();
        }
    }

    // Get content by contentId
    @GetMapping("/content/{contentId}")
    @ResponseBody
    public String getContent(@PathVariable String contentId) {
        FAQ content = service.getContent(contentId);
        return content != null ? content.getContent() : "Content not found";
    }

    // Get sidebar fragment
    @GetMapping("/sidebar")
    public String getSidebar(Model model) {
        model.addAttribute("faqContents", service.getAllActive());
        return "/about/fragments/sidebarFragment";
    }

    // Get content for edit
    @GetMapping("/get/{id}")
    @ResponseBody
    public FAQ getContentForEdit(@PathVariable Long id) {
        return service.getContentById(id);
    }

    // Delete multiple items
   @PostMapping("/delete-multiple")
@ResponseBody
public Map<String, Object> deleteMultiple(@RequestBody Map<String, List<Long>> requestBody) {
    Map<String, Object> response = new HashMap<>();
    
    try {
        List<Long> ids = requestBody.get("ids");
        
        // Validate IDs
        if (ids == null || ids.isEmpty()) {
            response.put("success", false);
            response.put("message", "No IDs provided for deletion");
            return response;
        }
        
        List<String> errors = new ArrayList<>();
        List<Long> successfullyDeleted = new ArrayList<>();
        
        for (Long id : ids) {
            try {
                // Additional validation if needed
                if (id == null) {
                    errors.add("Null ID provided");
                    continue;
                }
                
                service.delete(id);
                successfullyDeleted.add(id);
            } catch (Exception e) {
                errors.add("Error deleting item " + id + ": " + e.getMessage());
            }
        }
        
        if (!errors.isEmpty()) {
            response.put("success", false);
            response.put("message", "Completed with errors");
            response.put("deletedIds", successfullyDeleted);
            response.put("errors", errors);
            return response;
        }
        
        response.put("success", true);
        response.put("message", "Successfully deleted " + ids.size() + " items");
        return response;
        
    } catch (Exception e) {
        response.put("success", false);
        response.put("message", "Error processing request: " + e.getMessage());
        return response;
    }
}
    // Get children for a parent
    @GetMapping("/children/{parentId}")
    @ResponseBody
    public List<FAQ> getChildren(@PathVariable String parentId) {
        System.out.println("parentId****   : "+parentId);
        return service.getChildren(parentId);
    }
}
