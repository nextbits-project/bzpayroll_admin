<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Header Top: Logo + Search + Login/Register -->
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom py-3">
    <div class="container d-flex flex-wrap align-items-center justify-content-between">
        <div class="d-flex flex-grow-1 justify-content-center d-lg-block">
            <a class="navbar-brand fw-bold" href="/">
                <img src="/images/bzpayroll-logo.jpg" alt="BZPayroll Logo" class="img-fluid" style="max-height: 50px;">
            </a>
        </div>



        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#topLinksMenu"
                aria-controls="topLinksMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="topLinksMenu">
            <ul class="navbar-nav ms-auto top-links">

                <li th:if="${session.user != null}" class="nav-item d-flex">
                    <span class="user-name" th:text="${session.user.username}">Username | Company: NextBits | </span>
                    <a href="/login" class="form-button" style="margin-left:5px; font-weight: bold;">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bottom Nav -->
<div class="bg-white border-bottom py-2">
    <div class="container d-flex flex-wrap justify-content-center bottom-nav align-items-center gap-3">
        <a href="/">Home</a>
        <a href="/about">About Us</a>
        <div class="dropdown">
            <a class="dropdown-toggle" href="#" id="bzcomposerDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                BzPayroll
            </a>
            <ul class="dropdown-menu" aria-labelledby="bzcomposerDropdown" style="min-width: 320px;">
                <li><a class="dropdown-item" href="#">Full-featured Accounting System</a></li>
                <li><a class="dropdown-item" href="#">Order Management System with POS support</a></li>
                <li><a class="dropdown-item" href="#">Warehouse Integration System</a></li>
                <li><a class="dropdown-item" href="#">Accounting System with AR & AP</a></li>
                <li><a class="dropdown-item" href="#">Billing System with emails support</a></li>
                <li><a class="dropdown-item" href="#">eCommerce System</a></li>
            </ul>
        </div>
        <a href="/free-payroll">Free Payroll</a>
        <a href="/services">Our Service</a>
    </div>
</div>



