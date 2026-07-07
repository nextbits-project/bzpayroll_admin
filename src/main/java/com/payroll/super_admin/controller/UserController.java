
package com.payroll.super_admin.controller;

import com.payroll.super_admin.entity.BcaUser;
import com.payroll.super_admin.repo.BcaUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private BcaUserRepository userRepository;

//    @Autowired
//    private BCryptPasswordEncoder passwordEncoder;

    @GetMapping
    public String listUsers(
            Model model,
            @RequestParam(value = "active", required = false) Boolean active) {
        List<BcaUser> users = (active == null) ?
                userRepository.findAll() :
                userRepository.findByActive(active);
        model.addAttribute("users", users);
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd MMM yyyy"));
        return "th/users/users";
    }

    @GetMapping("/view/{id}")
    public String viewUser(@PathVariable Integer id, Model model) {

        model.addAttribute("cityName", null);
        model.addAttribute("stateName", null).addAttribute("countryName", null);
        //        System.out.println("selectedUser: " + userAddressDetail);

        BcaUser user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        model.addAttribute("selectedUser", user);
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("dd MMM yyyy"));
        return "fragments/user_fragments/view-user-modal :: modalContent";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("newUser", new BcaUser());
        return "fragments/user_fragments/add-user-modal :: modalContent";
    }

    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addUser(
            @ModelAttribute("newUser") BcaUser user,
            BindingResult result) {
        Map<String, Object> response = new HashMap<>();

        if (result.hasErrors()) {
            response.put("success", false);
            response.put("message", getErrorMessages(result));
            return ResponseEntity.badRequest().body(response);
        }

        // Check for duplicate email
        if (userRepository.findByEmailAddress(user.getEmailAddress()).isPresent()) {
            response.put("success", false);
            response.put("message", "Email address is already in use.");
            return ResponseEntity.badRequest().body(response);
        }

        try {
            // Hash the password before saving
            user.setPassword(user.getPassword());
            userRepository.save(user);
            response.put("success", true);
            response.put("message", "User added successfully.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Failed to add user: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        BcaUser user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        model.addAttribute("selectedUser", user);
        return "fragments/user_fragments/edit-user-modal :: modalContent";
    }

    @PostMapping("/edit/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateUser(
            @PathVariable Integer id,
            @ModelAttribute("selectedUser") BcaUser user,
            BindingResult result) {
        Map<String, Object> response = new HashMap<>();

        if (result.hasErrors()) {
            response.put("success", false);
            response.put("message", getErrorMessages(result));
            return ResponseEntity.badRequest().body(response);
        }

        // Check for duplicate email (excluding current user)
        Optional<BcaUser> existingUser = userRepository.findByEmailAddress(user.getEmailAddress());
        if (existingUser.isPresent() && !existingUser.get().getId().equals(id)) {
            response.put("success", false);
            response.put("message", "Email address is already in use.");
            return ResponseEntity.badRequest().body(response);
        }

        try {
            user.setId(id);
            // Preserve existing password if not updated
            BcaUser existing = userRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
            if (user.getPassword() == null || user.getPassword().isEmpty()) {
                user.setPassword(existing.getPassword());
            } else {
                user.setPassword(user.getPassword());
            }
            userRepository.save(user);
            response.put("success", true);
            response.put("message", "User updated successfully.");
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            response.put("success", false);
            response.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Failed to update user: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable Integer id) {
        Map<String, Object> response = new HashMap<>();

        try {
            BcaUser user = userRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
            userRepository.deleteById(id);
            response.put("success", true);
            response.put("message", "User deleted successfully.");
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            response.put("success", false);
            response.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Failed to delete user: " + e.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    private String getErrorMessages(BindingResult result) {
        return result.getFieldErrors().stream()
                .map(FieldError::getDefaultMessage)
                .collect(Collectors.joining("; "));
    }
}
