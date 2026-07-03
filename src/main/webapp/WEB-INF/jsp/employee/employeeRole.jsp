<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page isELIgnored="false"%>
<%--<%@ page errorPage="/WEB-INF/jsp/include/sessionExpired.jsp"%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
    	<%@include file="/WEB-INF/jsp/include/header.jsp"%>
    	<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    <title>Employee Roles</title>
   <link href="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui-tab.css" rel="stylesheet" media="screen" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
   <script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
    <!-- Ensure jQuery is loaded -->

    <style>
        :root {
            --primary-color: #007bff;
            --sidebar-width: 200px;
            --sidebar-collapsed-width: 60px;
            --transition-speed: 0.3s;
            --text-color: #333;
            --background-color: #f8f9fa;
            --card-bg: #ffffff;
            --border-radius: 8px;
            --box-shadow: 0 2px 5px rgba(0,0,0,0.08);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        /* Page content styles */
        .page-title {
            font-size: 1.8rem;
            font-weight: 500;
            color: #333;
            margin: 0;
        }

        .card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            background-color: #fff;
        }

        /* Form Styling */
        .form-label {
            font-weight: 500;
            color: #555;
            margin-bottom: 0.5rem;
        }

        .form-control {
            border-radius: 4px;
            border: 1px solid #ddd;
            padding: 0.75rem 1rem;
            height: auto;
            font-size: 1rem;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.15);
            border-color: var(--primary-color);
        }

        .form-control::placeholder {
            color: #aaa;
            font-size: 0.95rem;
        }

        .form-check-input {
            width: 1.25rem;
            height: 1.25rem;
            margin-top: 0.15rem;
        }

        .form-check-label {
            font-size: 1rem;
            padding-left: 0.25rem;
        }

        /* Utility Classes */
        .me-2 {
            margin-right: 0.5rem;
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        .mb-4 {
            margin-bottom: 1.5rem;
        }

        .p-4 {
            padding: 1.5rem;
        }

        .d-flex {
            display: flex;
        }

        .justify-content-between {
            justify-content: space-between;
        }

        .justify-content-end {
            justify-content: flex-end;
        }

        .align-items-center {
            align-items: center;
        }

        /* Dashboard Container */
        .dashboard-container {
            display: flex;
            padding: 0;
            position: relative;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            display:none;
            width: 200px;
            background-color: #fff;
            border-right: 1px solid #e0e0e0;
            min-height: calc(100vh - 55px);
            padding: 15px 0;
            transition: width 0.3s ease;
            position: relative;
            z-index: 10;
        }

        .sidebar.collapsed {
            width: 60px;
            display:none;
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            padding: 0 15px 15px;
            border-bottom: 1px solid #f0f0f0;
            position: relative;
            height: 50px;
        }

        .sidebar-brand {
            color: #05A9C5;
            font-weight: 600;
            font-size: 18px;
            margin-right: auto;
            white-space: nowrap;
            overflow: hidden;
            transition: opacity 0.3s ease, width 0.3s ease;
        }

        .sidebar-logo {
            width: 30px;
            height: 30px;
            background-color: #05A9C5;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            margin-right: 10px;
            flex-shrink: 0;
            transition: margin 0.3s ease;
        }

        .sidebar.collapsed .sidebar-brand {
            opacity: 0;
            width: 0;
            display: none;
        }

        .sidebar.collapsed .sidebar-header {
            justify-content: center;
            padding: 0 0 15px 0;
        }

        .sidebar.collapsed .sidebar-logo {
            margin-right: 0;
        }

        .sidebar-toggle {
            color: #888;
            cursor: pointer;
            font-size: 14px;
            z-index: 20;
            display: inline-block;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            border-radius: 4px;
            background-color: #f5f5f5;
            transition: background-color 0.3s;
            position: relative;
            border: none;
            outline: none;
            padding: 0;
            margin: 0;
            -webkit-appearance: none;
            appearance: none;
        }

        .sidebar-toggle:hover {
            background-color: #e0e0e0;
            color: #333;
        }

        .sidebar-toggle i {
            transition: transform 0.3s ease;
        }

        .sidebar.collapsed .sidebar-toggle i {
            transform: rotate(180deg);
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 15px 0 0 0;
            overflow: hidden;
        }

        .sidebar-item {
            padding: 10px 15px;
            display: flex;
            align-items: center;
            color: #555;
            text-decoration: none;
            transition: background-color 0.3s, padding 0.3s ease;
            white-space: nowrap;
            border-left: 3px solid transparent;
        }

        .sidebar-item.active {
            background-color: #e6f2ff;
            color: #0d6efd;
            border-left: 3px solid #0d6efd;
        }

        .sidebar-item:hover {
            background-color: #f5f5f5;
        }

        .sidebar-item span {
            display: inline-block;
            transition: opacity 0.3s ease, margin 0.3s ease, visibility 0.3s ease;
            margin-left: 10px;
        }

        .sidebar.collapsed .sidebar-item {
            padding: 10px 0;
            justify-content: center;
            text-align: center;
        }

        .sidebar.collapsed .sidebar-item span {
            opacity: 0;
            width: 0;
            margin-left: 0;
            display: none;
            visibility: hidden;
        }

        .sidebar.collapsed .sidebar-item.active {
            border-left: 0;
            border-right: 3px solid #0d6efd;
        }

        .sidebar-icon {
            width: 20px;
            text-align: center;
            font-size: 16px;
            transition: margin 0.3s ease;
            flex-shrink: 0;
        }

        .sidebar.collapsed .sidebar-icon {
            margin-right: 0;
            margin-left: 0;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
            transition: margin-left 0.3s ease, width 0.3s ease;
            width: calc(100% - 200px);
            box-sizing: border-box;
        }

        .main-content.expanded {
            width: calc(100% - 60px);
            margin-left: 60px;
        }

        /* Overlay for mobile */
        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .sidebar-overlay.active {
            opacity: 1;
            display: block;
        }

        /* Hide table (as per previous requirements) */
        .table {
            display: none;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .sidebar {
                position: fixed;
                left: 0;
                top: 0;
                height: 100vh;
                width: 60px;
                z-index: 1000;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                transform: translateX(0);
                transition: transform 0.3s ease, width 0.3s ease;
            }

            .sidebar.expanded {
                width: 200px;
                transform: translateX(0);
            }

            .main-content {
                width: 100%;
                margin-left: 60px;
                padding: 15px;
                transition: margin-left 0.3s ease;
            }

            .sidebar-brand {
                opacity: 0;
                width: 0;
            }

            .sidebar-item span {
                opacity: 0;
                visibility: hidden;
                width: 0;
            }
        }

        /* Fix for Safari and iOS devices */
        @supports (-webkit-touch-callout: none) {
            .sidebar, .main-content {
                transition: none;
            }
        }
         .btn:hover {
                  background-color: gray;
                  color: #fff;
                }
               .btn {
                  color: #fff;
                }
#selectAllRoles:hover {
  background-color: #0d6efd; /* darker blue */
  color: #fff;
}

    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">BZ</div>
                <span class="sidebar-brand">BZpayroll</span>
                <button type="button" class="sidebar-toggle" id="sidebarToggle" onclick="toggleSidebar()"><i class="fas fa-chevron-left"></i></button>
            </div>
            <ul class="sidebar-menu">
                <li><a href="/dashboard?tabid=Dashboard" class="sidebar-item">
                    <i class="fas fa-tachometer-alt sidebar-icon"></i>
                    <span>Dashboard</span>
                </a></li>
                <li><a href="#" class="sidebar-item active">
                    <i class="fas fa-users sidebar-icon"></i>
                    <span>Employee Role</span>
                </a></li>
                <li><a href="/dashboard/employeelist" class="sidebar-item">
                    <i class="fas fa-list sidebar-icon"></i>
                    <span>Employee List</span>
                </a></li>
                <li><a href="#" class="sidebar-item">
                    <i class="fas fa-clipboard sidebar-icon"></i>
                    <span>Employee Board</span>
                </a></li>
                <li><a href="/dashboard/employee/new" class="sidebar-item">
                    <i class="fas fa-user-plus sidebar-icon"></i>
                    <span>New Employee</span>
                </a></li>
                <li><a href="/dashboard/employee/w2Form" class="sidebar-item">
                    <i class="fas fa-file-alt sidebar-icon"></i>
                    <span>W2 Form</span>
                </a></li>
                <li><a href="/dashboard/employee/form1099" class="sidebar-item">
                    <i class="fas fa-file sidebar-icon"></i>
                    <span>1099 Form</span>
                </a></li>
                <li><a href="#" class="sidebar-item">
                    <i class="fas fa-star sidebar-icon"></i>
                    <span>Reviews</span>
                </a></li>
            </ul>
        </div>

        <div class="sidebar-overlay" id="sidebarOverlay"></div>

        <div class="main-content">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="page-title" style="color:#00CED1">Employee Role</h1>

            </div>

            <div class="card mb-4">
                <div class="card-body p-4">
                    <form id="roleForm">
                        <input type="hidden" id="roleId" name="roleId">

                        <div class="mb-4">
                            <label for="roleName" class="form-label">Role name</label>
                            <input type="text" class="form-control" id="roleName" name="roleName" placeholder="Role Name">
                        </div>

                        <div class="mb-4">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <label class="form-label mb-0">Roles: <small class="text-muted">(Select all that apply)</small></label>
                                <button type="button" class="btn btn-info btn-sm ms-2 d-flex align-items-center px-3 py-2 shadow-sm" id="selectAllRoles">
                                  <i class="fas fa-check-square me-2"></i>
                                  Select All
                                </button>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-4 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input role-checkbox" type="checkbox" id="roleGeneralEmployee" name="roles" value="General Employee">
                                        <label class="form-check-label" for="roleGeneralEmployee">
                                            General Employee
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input role-checkbox" type="checkbox" id="roleTechnician" name="roles" value="Technician">
                                        <label class="form-check-label" for="roleTechnician">
                                            Technician
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input role-checkbox" type="checkbox" id="roleServiceMan" name="roles" value="Service Man">
                                        <label class="form-check-label" for="roleServiceMan">
                                            Service Man
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input role-checkbox" type="checkbox" id="roleDriver" name="roles" value="Driver">
                                        <label class="form-check-label" for="roleDriver">
                                            Driver
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input role-checkbox" type="checkbox" id="roleManager" name="roles" value="Manager">
                                        <label class="form-check-label" for="roleManager">
                                            Manager
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
<!-- Unified Flex Row with space between -->
<div class="d-flex justify-content-between align-items-center mt-4">

  <!-- Left-aligned Button Group -->
  <div>
    <button type="button" class="btn btn-info" id="submitBtn">New</button>
    <button type="button" class="btn btn-info" id="submitBtn">Edit</button>
    <button type="button" class="btn btn-info" id="submitBtn">Delete</button>
  </div>

  <!-- Right-aligned Form Buttons -->
  <div>
    <button type="button" class="btn btn-info" id="resetBtn">Reset</button>
    <button type="button" class="btn btn-info" id="submitBtn">Submit</button>
  </div>

</div>

            </div>




            <!-- Role Table Section -->
            <div class="card">
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="mb-0">Role Table <span class="badge bg-secondary rounded-pill ms-2">3</span></h4>
                        <div class="d-flex">
                            <div class="input-group me-2">
                                <input type="text" class="form-control" placeholder="Search by Name" id="searchInput">
                                <button class="btn btn-info" type="button" id="searchBtn">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                            <button class="btn btn-info" id="exportBtn">
                                <i class="fas fa-download me-1"></i> Export
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover"  style="display: table;">
                            <thead>
                                <tr>
                                    <th scope="col" class="text-center">SL</th>
                                    <th scope="col">Employee Role List</th>
                                    <th scope="col">Modules</th>
                                    <th scope="col">Created At</th>
                                    <th scope="col" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody id="employeeRoleTableBody" >
                                <tr>
                                    <td class="text-center index">1</td>
                                    <td id="BDM"></td>
                                    <td>/td>
                                    <td></td>
                                    <td class="text-center">
                                        <button class="btn btn-info" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-danger" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center">2</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-center">
                                        <button class="btn btn-info" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-danger" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center">3</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td class="text-center">
                                        <button class="btn btn-info" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-danger" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/js/login/newScript.js"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Simple sidebar toggle function
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.querySelector('.main-content');
            const toggleIcon = document.querySelector('#sidebarToggle i');
            const sidebarOverlay = document.getElementById('sidebarOverlay');

            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');

            // Add a slight delay to let the animation complete
            setTimeout(() => {
                const sidebarItems = document.querySelectorAll('.sidebar-item');
                sidebarItems.forEach(item => {
                    if (sidebar.classList.contains('collapsed')) {
                        item.setAttribute('title', item.querySelector('span').innerText);
                    } else {
                        item.removeAttribute('title');
                    }
                });
            }, 300);

            if (sidebar.classList.contains('collapsed')) {
                toggleIcon.classList.remove('fa-chevron-left');
                toggleIcon.classList.add('fa-chevron-right');
                localStorage.setItem('dashboardSidebarCollapsed', 'true');
            } else {
                toggleIcon.classList.remove('fa-chevron-right');
                toggleIcon.classList.add('fa-chevron-left');
                localStorage.setItem('dashboardSidebarCollapsed', 'false');
            }

            // For mobile
            if (window.innerWidth <= 768) {
                sidebar.classList.toggle('expanded');
                if (sidebarOverlay) {
                    sidebarOverlay.classList.toggle('active');
                }
            }
        }

        // Initialize sidebar state on page load
        window.onload = function() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.querySelector('.main-content');
            const toggleIcon = document.querySelector('#sidebarToggle i');
            const sidebarOverlay = document.getElementById('sidebarOverlay');

            // Apply saved state
            const sidebarCollapsed = localStorage.getItem('dashboardSidebarCollapsed') === 'true';
            if (sidebarCollapsed) {
                sidebar.classList.add('collapsed');
                mainContent.classList.add('expanded');
                toggleIcon.classList.remove('fa-chevron-left');
                toggleIcon.classList.add('fa-chevron-right');
            }

            // For mobile, add collapsed by default
            if (window.innerWidth <= 768) {
                sidebar.classList.add('collapsed');
                mainContent.classList.add('expanded');
            }

            // Set up overlay click
            if (sidebarOverlay) {
                sidebarOverlay.onclick = function() {
                    if (sidebar.classList.contains('expanded')) {
                        sidebar.classList.remove('expanded');
                        sidebarOverlay.classList.remove('active');
                    }
                };
            }
        };

        // Handle window resize
        window.addEventListener('resize', function() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.querySelector('.main-content');
            const toggleIcon = document.querySelector('#sidebarToggle i');

            if (window.innerWidth <= 768) {
                if (!sidebar.classList.contains('collapsed')) {
                    sidebar.classList.add('collapsed');
                    mainContent.classList.add('expanded');
                    toggleIcon.classList.remove('fa-chevron-left');
                    toggleIcon.classList.add('fa-chevron-right');
                }
            }
        });
    </script>



</body>
</html>