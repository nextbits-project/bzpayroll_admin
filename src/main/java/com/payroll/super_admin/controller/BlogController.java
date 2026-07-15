package com.payroll.super_admin.controller;

import com.payroll.super_admin.dto.BlogDto;
import com.payroll.super_admin.entity.BcaBlogCategories;
import com.payroll.super_admin.entity.BcaBlogs;
import com.payroll.super_admin.entity.Customer;
import com.payroll.super_admin.service.BlogService;
import com.payroll.super_admin.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Year;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/blogs")
public class BlogController {

    @Autowired
    BlogService blogService;
    @Autowired
    CategoryService categoryService;

    @GetMapping
    public String listBlogs(Model model) {
        model.addAttribute("blogList", blogService.getAllBlog());
        return "th/blogs/blogs";
    }

    @GetMapping("/add")
    public String addBlogs(Model model) {
        model.addAttribute("categoryList", categoryService.getAllCategory());
        return "th/blogs/addBlog";
    }

    @PostMapping
    public String saveBlog(@ModelAttribute("blog") BlogDto blogDto,
                               BindingResult result,
                                @RequestParam("image") MultipartFile image,
                               RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/blogs/blogs";
        }
        try {
            blogService.createBlog(blogDto, image);
            redirectAttributes.addFlashAttribute("success", "Blog created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/blogs";
    }
    @GetMapping("/{id}")
    public String updateBlogs(Model model, @PathVariable String id) {
        BcaBlogs blog = blogService.getBlogById(id);
        model.addAttribute("blog", blog);
        model.addAttribute("categoryList", categoryService.getAllCategory());
        return "th/blogs/updateBlog";
    }

    @PostMapping("/update/{id}")
    public String updateBlog(@PathVariable String id,
                             @ModelAttribute("blog") BlogDto blogDto,
                             @RequestParam("image") MultipartFile image,
                             BindingResult result,
                             RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "th/blogs/blogs";
        }
        try {
            blogService.updateBlog(blogDto, image);
            redirectAttributes.addFlashAttribute("success", "Blog created successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/blogs";
    }
}
