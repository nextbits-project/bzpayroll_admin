package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.HelpContent;
import com.payroll.super_admin.service.HelpContentService;
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
@RequestMapping("/help")
public class HelpContentAdminController {

    @Autowired
    private HelpContentService service;

    // Main admin page
    @GetMapping
    public String adminPage(Model model, @RequestParam(value = "edit", required = false) Long editId) {
        // Get all top-level items with their immediate children
        List<HelpContent> topLevelItems = service.getTopLevelItems();
        model.addAttribute("helpContents", topLevelItems);

        // Get all items for dropdowns
        model.addAttribute("allContents", service.getAllItemsOrderedByDisplayOrder());

        // Setup edit or new content
        if (editId != null) {
            HelpContent editContent = service.getContentById(editId);
            model.addAttribute("newContent", editContent != null ? editContent : new HelpContent());
        } else {
            model.addAttribute("newContent", new HelpContent());
        }

        model.addAttribute("folders", service.getAllFolders());
        return "th/help";
    }

    // Save content
    @PostMapping("/save")
    public String saveContent(@ModelAttribute("newContent") HelpContent newContent,
                              BindingResult result, Model model) {
        String forward = "";
        if (result.hasErrors()) {
            model.addAttribute("helpContents", service.getTopLevelItems());
            model.addAttribute("folders", service.getAllFolders());
            forward = "tredirect:/help";
        }
        try {
            service.save(newContent);
            return "redirect:/help";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("helpContents", service.getTopLevelItems());
            model.addAttribute("folders", service.getAllFolders());
            forward = "redirect:/help";
        }

        return forward;
    }

    // Delete content
    @GetMapping("/delete/{id}")
    public String deleteContent(@PathVariable Long id, Model model) {
        try {
            service.delete(id);
            return "redirect:/help";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("helpContents", service.getTopLevelItems());
            model.addAttribute("newContent", new HelpContent());
            model.addAttribute("folders", service.getAllFolders());
            return "th/help";
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
        HelpContent content = service.getContent(contentId);
        return content != null ? content.getContent() : "Content not found";
    }

    // Get sidebar fragment
    @GetMapping("/sidebar")
    public String getSidebar(Model model) {
        model.addAttribute("helpContents", service.getAllActive());
        return "/about/fragments/sidebarFragment";
    }

    // Get content for edit
    @GetMapping("/get/{id}")
    @ResponseBody
    public HelpContent getContentForEdit(@PathVariable Long id) {
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
    public List<HelpContent> getChildren(@PathVariable String parentId) {
        System.out.println("parentId****   : " + parentId);
        return service.getChildren(parentId);
    }
}
