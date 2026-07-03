package com.payroll.config;

import java.io.IOException;
import java.util.Collections;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        http
                // Disable CSRF if not needed
                .csrf(csrf -> csrf.disable())

                // Session Management
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                )

                // Authorization Rules
                .authorizeHttpRequests(auth -> auth

                        // Static Resources
                        .requestMatchers(
                                "/css/**",
                                "/js/**",
                                "/images/**",
                                "/fonts/**",
                                "/assets/**",
                                "/webjars/**",
                                "/static/**",
                                "/resources/**"
                        ).permitAll()

                        // Public Pages
                        .requestMatchers(
                                "/",
                                "/admin_login",
                                "/register",
                                "/forgotPassword",
                                "/api/auth/login"
                        ).permitAll()

                        // Admin Only
                        .requestMatchers("/admin_dashboard")
                        .hasRole("ADMIN")

                        // All Other URLs Require Login
                        .anyRequest().authenticated()
                )

                // For invalid login
                .exceptionHandling(ex -> ex
                        .authenticationEntryPoint((request, response, authException) -> {
                            response.sendRedirect(
                                    "/admin_login?message=Please+login+to+continue"
                            );
                        })
                        .accessDeniedHandler((request, response, accessDeniedException) -> {
                            response.sendRedirect(
                                    "/admin_login?message=Access+Denied"
                            );
                        })
                )

                // Logout
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/admin_login?logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .permitAll()
                )

                // Custom Session Authentication Filter
                .addFilterBefore(
                        legacySessionFilter(),
                        UsernamePasswordAuthenticationFilter.class
                );

        return http.build();
    }

    @Bean
    public Filter legacySessionFilter() {

        return new Filter() {

            @Override
            public void doFilter(
                    ServletRequest request,
                    ServletResponse response,
                    FilterChain chain)
                    throws IOException, ServletException {

                HttpServletRequest httpRequest =
                        (HttpServletRequest) request;

                HttpSession session =
                        httpRequest.getSession(false);

                if (session != null
                        && session.getAttribute("CID") != null
                        && SecurityContextHolder.getContext()
                        .getAuthentication() == null) {

                    String username =
                            session.getAttribute("CID").toString();

                    String role =
                            session.getAttribute("ROLE") != null
                                    ? session.getAttribute("ROLE").toString()
                                    : "USER";

                    Authentication auth =
                            new PreAuthenticatedAuthenticationToken(
                                    username,
                                    null,
                                    Collections.singletonList(
                                            new SimpleGrantedAuthority(
                                                    "ROLE_" + role
                                            )
                                    )
                            );

                    SecurityContextHolder.getContext()
                            .setAuthentication(auth);
                }

                chain.doFilter(request, response);
            }
        };
    }
}