package com.payroll.super_admin.service;

import com.payroll.super_admin.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminUserService {

    @Autowired
    private UserRepository userRepository;

    public boolean authenticate(String username, String password) {
        return userRepository.findByUsername(username)
                .map(user -> user.getPassword().equals(password)) // Compare passwords (use BCrypt in production)
                .orElse(false);
    }

    public boolean isAdmin(String username) {
        return userRepository.findByUsername(username)
                .map(user -> "ADMIN".equalsIgnoreCase(user.getRole()))
                .orElse(false);
    }
}
