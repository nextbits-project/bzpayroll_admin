<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
    <%@include file="/WEB-INF/jsp/include/header.jsp"%>
    <%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    <title>Employee Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <!-- Ensure jQuery is loaded -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --primary-blue: #4285f4;
            --primary-green: #34a853;
            --primary-yellow: #fbbc05;
            --primary-cyan: #46bdc6;
            --primary-red: #ea4335;
            --text-color: #333;
            --background-color: #f8f9fa;
            --card-bg: #ffffff;
            --border-radius: 8px;
            --box-shadow: 0 2px 5px rgba(0,0,0,0.08);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .dashboard-container {
            display: flex;
            padding: 0;
            position: relative;
            min-height: 100vh;
        }

        .sidebar {
            display : none;
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
            display :none;
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

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .page-title {
            font-size: 24px;
            font-weight: normal;
            color: #333;
            margin: 0;
        }

        .period-selector {
            display: flex;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
        }

        .period-selector button {
            background: white;
            border: none;
            padding: 6px 12px;
            font-size: 13px;
            color: #666;
            cursor: pointer;
        }

        .period-selector button.active {
            background-color: #f0f0f0;
        }

        .stats-cards {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .stat-card {
            flex: 1;
            background: white;
            border-radius: var(--border-radius);
            padding: 20px;
            position: relative;
            overflow: hidden;
            box-shadow: var(--box-shadow);
            min-width: 200px;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 4px;
        }

        .blue-card::before { background-color: var(--primary-blue); }
        .green-card::before { background-color: var(--primary-green); }
        .yellow-card::before { background-color: var(--primary-yellow); }
        .cyan-card::before { background-color: var(--primary-cyan); }

        .stat-title {
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            color: #0d6efd;
            margin-bottom: 10px;
        }

        .stat-title.blue { color: var(--primary-blue); }
        .stat-title.green { color: var(--primary-green); }
        .stat-title.yellow { color: var(--primary-yellow); }
        .stat-title.cyan { color: var(--primary-cyan); }

        .stat-value {
            font-size: 24px;
            font-weight: 600;
            margin: 0;
        }

        .stat-icon {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 24px;
            color: #ddd;
        }

        .content-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .chart-card, .activity-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 20px;
            box-shadow: var(--box-shadow);
            min-width: 0;
        }

        .chart-card {
            flex: 2;
            min-width: 300px;
        }

        .activity-card {
            flex: 1;
            min-width: 250px;
        }

        .card-title {
            color: #0d6efd;
            font-size: 16px;
            margin-top: 0;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .activity-item {
            padding: 15px 0;
            border-bottom: 1px solid #f3f4f6;
        }

        .activity-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .activity-item h4 {
            margin: 0;
            font-size: 14px;
            font-weight: 600;
        }

        .activity-item p {
            margin: 5px 0 0 0;
            color: #666;
            font-size: 14px;
        }

        .activity-time {
            float: right;
            color: #999;
            font-size: 12px;
        }

        #employeeChart {
            height: 250px !important;
        }

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

        .sidebar.expanded {
            width: 200px;
        }

        .sidebar.expanded .sidebar-brand {
            opacity: 1;
            width: auto;
        }

        .sidebar.expanded .sidebar-item span {
            opacity: 1;
            width: auto;
            margin-left: 10px;
            display: inline-block;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .stats-cards {
                flex-direction: column;
            }

            .stat-card {
                width: 100%;
                margin-bottom: 15px;
            }

            .content-row {
                flex-direction: column;
            }

            .chart-card, .activity-card {
                width: 100%;
                min-width: 100%;
            }

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

            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .period-selector {
                width: 100%;
                display: flex;
                justify-content: space-between;
            }

            .period-selector button {
                flex: 1;
                text-align: center;
            }
        }

        /* Fix for Safari and iOS devices */
        @supports (-webkit-touch-callout: none) {
            .sidebar, .main-content {
                transition: none;
            }
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
                <li><a href="/dashboard?tabid=Dashboard" class="sidebar-item active">
                    <i class="fas fa-tachometer-alt sidebar-icon"></i>
                    <span>Dashboard</span>
                </a></li>

                <li><a href="/dashboard/employee/employeeRole" class="sidebar-item">
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
                <li><a href="emloyee/reviews" class="sidebar-item">
                    <i class="fas fa-star sidebar-icon"></i>
                    <span>Reviews</span>
                </a></li>
            </ul>
        </div>

        <div class="sidebar-overlay" id="sidebarOverlay"></div>

        <div class="main-content">
            <div class="dashboard-header">
                <h1 class="page-title">Employee Dashboard</h1>
                <div class="period-selector">
                    <button class="active">Daily</button>
                    <button>Weekly</button>
                    <button>Monthly</button>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="stats-cards">
                <div class="stat-card blue-card">
                    <p class="stat-title blue">TOTAL EMPLOYEES</p>
                    <h2 class="stat-value">25</h2>
                    <span class="stat-icon"><i class="fas fa-users"></i></span>
                </div>
                <div class="stat-card green-card">
                    <p class="stat-title green">ACTIVE EMPLOYEES</p>
                    <h2 class="stat-value">21</h2>
                    <span class="stat-icon"><i class="fas fa-user-check"></i></span>
                </div>
                <div class="stat-card yellow-card">
                    <p class="stat-title yellow">NEW EMPLOYEES</p>
                    <h2 class="stat-value">3</h2>
                    <span class="stat-icon"><i class="fas fa-user-plus"></i></span>
                </div>
                <div class="stat-card cyan-card">
                    <p class="stat-title cyan">PENDING REVIEWS</p>
                    <h2 class="stat-value">8</h2>
                    <span class="stat-icon"><i class="fas fa-clipboard-check"></i></span>
                </div>
            </div>

            <!-- Content Area -->
            <div class="content-row">
                <!-- Chart -->
                <div class="chart-card">
                    <h3 class="card-title">Employee Overview</h3>
                    <canvas id="employeeChart"></canvas>
                </div>

                <!-- Activity Feed -->
                <div class="activity-card">
                    <h3 class="card-title">Recent Activities</h3>
                    <div class="activity-item">
                        <span class="activity-time">3 days ago</span>
                        <h4>New employee added</h4>
                        <p>John Smith was added as a Service Man</p>
                    </div>
                    <div class="activity-item">
                        <span class="activity-time">1 week ago</span>
                        <h4>Employee role updated</h4>
                        <p>Sarah Johnson was promoted to Technician</p>
                    </div>
                    <div class="activity-item">
                        <span class="activity-time">2 weeks ago</span>
                        <h4>New review submitted</h4>
                        <p>Michael Brown received a new review</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Dashboard Scripts -->
    <script>
        // Initialize Employee Chart
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('employeeChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['General Employee', 'Service Man', 'Technician', 'Driver', 'Manager'],
                    datasets: [{
                        data: [10, 5, 4, 3, 3],
                        backgroundColor: [
                            '#4285f4',
                            '#34a853',
                            '#46bdc6',
                            '#fbbc05',
                            '#ea4335'
                        ],
                        borderWidth: 0,
                        borderRadius: 4,
                        maxBarThickness: 40
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                color: '#f0f0f0'
                            },
                            ticks: {
                                stepSize: 5
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        });

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




    <script>

    </script>

</body>
</html>
