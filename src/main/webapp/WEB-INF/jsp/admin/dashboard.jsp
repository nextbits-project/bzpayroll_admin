<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@ include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@ include file="/WEB-INF/jsp/include/menuAdmin.jsp" %>
    <title><spring:message code="BzComposer.Dashboard" /></title>
    <style>
        /* Reset and base styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f5f5f5;
        }

        /* Table styles */
        .tabla-listados {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #cfcfcf;
            background: #fff;
        }

        .tabla-listados th {
            background-color: #05A9C5;
            color: #fff;
            font-size: 14px;
            padding: 10px 8px;
            text-align: left;
        }

        .tabla-listados td {
            font-size: 12px;
            padding: 10px 8px;
            border-bottom: 1px solid #cfcfcf;
            word-break: break-word;
        }

        .tabla-listados tbody tr:nth-child(odd) {
            background: #e1e5e9;
        }

        /* Section styles */
        .section-border {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        .section-border td {
            vertical-align: top;
            padding: 0 6px 10px;
        }

        .section-header {
            background-color: #05A9C5;
            color: #fff;
            font-size: 1.2em;
            padding: 10px;
            cursor: pointer;
            position: relative;
            user-select: none;
            width: 100%;
        }

        .section-header:after {
            content: '+';
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2em;
        }

        .section-header.collapsed:after {
            content: '-';
        }

        .section-content {
            max-height: 200px;
            overflow-y: auto;
            border: 1px solid #ccc;
            transition: max-height 0.3s ease;
        }

        .section-content.collapsed {
            max-height: 0;
            overflow: hidden;
        }

        .table-scroll-container {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            width: 100%;
        }

        /* Dashboard section */
        .dashboard-section {
            margin-bottom: 20px;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .section-title {
            font-size: 1.4em;
            color: #333;
            margin: 20px 0 15px;
            border-bottom: 1px dotted #333;
            padding-bottom: 8px;
        }

        /* Container styles */
        #cos, #hoja, #blanquito, #padding {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px;
        }

        #ddcolortabsline {
            height: 4px;
            background: #05A9C5;
        }

        /* Responsive styles */
        @media screen and (max-width: 768px) {
            .section-border {
                display: block;
            }

            .section-border tr, .section-border td {
                display: block;
                width: 100%;
            }

            .section-border td {
                padding: 0 10px 10px;
            }

            .section-content {
                margin: 0 !important;
            }

            .tabla-listados th, .tabla-listados td {
                min-width: 100px;
            }

            .section-header {
                font-size: 1.1em;
                padding: 8px 10px;
            }
        }

        @media screen and (max-width: 480px) {
            .tabla-listados th:nth-child(n+4),
            .tabla-listados td:nth-child(n+4) {
                display: none;
            }

            .tabla-listados th, .tabla-listados td {
                padding: 8px 4px;
                font-size: 11px;
            }

            .section-title {
                font-size: 1.2em;
            }

            #cos, #hoja, #blanquito, #padding {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<div id="ddcolortabsline"></div>
<div id="cos">
    <div id="hoja">
        <div id="blanquito">
            <div id="padding">
                <div class="section-title">
                    <spring:message code="BzComposer.Dashboard" />
                </div>

                <!-- Visitors & Customers Section -->
                <div class="dashboard-section">
                    <table class="section-border">
                        <tr>
                            <td>
                                <div class="section-header" onclick="toggleSection('visitors-section')">Visitors</div>
                                <div id="visitors-section" class="section-content">
                                    <div class="table-scroll-container">
                                        <table class="tabla-listados">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Business Information</th>
                                                    <th>Address</th>
                                                    <th>Date</th>
                                                    <th>Message</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td><td>ABC</td><td>123 Washington, 123456, USA</td><td>10-25-20</td><td>Test</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td><td>ABC</td><td>123 Washington, 123456, USA</td><td>10-25-20</td><td>Test</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td><td>ABC</td><td>123 Washington, 123456, USA</td><td>10-25-20</td><td>Test</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="section-header" onclick="toggleSection('customers-section')">Customers</div>
                                <div id="customers-section" class="section-content">
                                    <div class="table-scroll-container">
                                        <table class="tabla-listados">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Company</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td><td>Dale Fine</td><td>Western Graphics</td><td>abc@gmail.com</td><td>+1234567890</td><td>09-16-2021</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td><td>Dale Fine</td><td>Western Graphics</td><td>abc@gmail.com</td><td>+1234567890</td><td>09-16-2021</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td><td>Dale Fine</td><td>Western Graphics</td><td>abc@gmail.com</td><td>+1234567890</td><td>09-16-2021</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- Business Registrations & Info Changed Section -->
                <div class="dashboard-section">
                    <table class="section-border">
                        <tr>
                            <td>
                                <div class="section-header" onclick="toggleSection('business-reg-section')">Business Registrations</div>
                                <div id="business-reg-section" class="section-content">
                                    <div class="table-scroll-container">
                                        <table class="tabla-listados">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Business Information</th>
                                                    <th>Address</th>
                                                    <th>Date</th>
                                                    <th>Message</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td><td>ABC</td><td>123 Washington, 123456, USA</td><td>10-25-20</td><td>Test</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td><td>ABC</td><td>123 Washington, 123456, USA</td><td>10-25-20</td><td>Test</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td><td>ABC</td><td>123 Washington, 123456, USA</td><td>10-25-20</td><td>Test</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="section-header" onclick="toggleSection('business-info-section')">Business Info Changed</div>
                                <div id="business-info-section" class="section-content">
                                    <div class="table-scroll-container">
                                        <table class="tabla-listados">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Company</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td><td>Maria Wedge</td><td>CDI Distributor</td><td>abc@gmail.com</td><td>+1234567890</td><td>09-16-2021</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td><td>Maria Wedge</td><td>CDI Distributor</td><td>abc@gmail.com</td><td>+1234567890</td><td>09-16-2021</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td><td>Maria Wedge</td><td>CDI Distributor</td><td>abc@gmail.com</td><td>+1234567890</td><td>09-16-2021</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- Payments & Messages Section -->
                <div class="dashboard-section">
                    <table class="section-border">
                        <tr>
                            <td>
                                <div class="section-header" onclick="toggleSection('payments-section')">Payments</div>
                                <div id="payments-section" class="section-content">
                                    <div class="table-scroll-container">
                                        <table class="tabla-listados">
                                            <thead>
                                                <tr>
                                                    <th><spring:message code="bca.Category" /></th>
                                                    <th><spring:message code="Bizcomposer.itemCode" /></th>
                                                    <th><spring:message code="BzComposer.item.itemtype" /></th>
                                                    <th><spring:message code="BzComposer.Item.ItemTitle" /></th>
                                                    <th><spring:message code="Bizcomposer.qty" /></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Service</td><td>ITEM001</td><td>Subscription</td><td>Monthly Plan</td><td>5</td>
                                                </tr>
                                                <tr>
                                                    <td>Product</td><td>ITEM002</td><td>One-time</td><td>Premium Package</td><td>2</td>
                                                </tr>
                                                <tr>
                                                    <td>Service</td><td>ITEM003</td><td>Subscription</td><td>Annual Plan</td><td>1</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="section-header" onclick="toggleSection('messages-section')">Messages</div>
                                <div id="messages-section" class="section-content">
                                    <div class="table-scroll-container">
                                        <table class="tabla-listados">
                                            <thead>
                                                <tr>
                                                    <th><spring:message code="Bizcomposer.itemCode" /></th>
                                                    <th><spring:message code="BzComposer.item.itemtype" /></th>
                                                    <th><spring:message code="BzComposer.Item.ItemTitle" /></th>
                                                    <th><spring:message code="Bizcomposer.qty" /></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>MSG001</td><td>Notification</td><td>Update Alert</td><td>3</td>
                                                </tr>
                                                <tr>
                                                    <td>MSG002</td><td>Alert</td><td>System Notice</td><td>5</td>
                                                </tr>
                                                <tr>
                                                    <td>MSG003</td><td>Notification</td><td>Reminder</td><td>2</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleSection(sectionId) {
        const section = document.getElementById(sectionId);
        const header = document.querySelector(`[onclick="toggleSection('${sectionId}')"]`);
        
        if (section && header) {
            const isCollapsed = section.classList.toggle('collapsed');
            header.classList.toggle('collapsed');
            section.style.maxHeight = isCollapsed ? '0' : (section.scrollHeight + 'px');
        }
    }

    function initResponsiveSections() {
        const sections = document.querySelectorAll('.section-content');
        const headers = document.querySelectorAll('.section-header');
        
        if (window.innerWidth <= 768) {
            sections.forEach(section => {
                section.classList.add('collapsed');
                section.style.maxHeight = '0';
            });
            headers.forEach(header => header.classList.add('collapsed'));
        } else {
            sections.forEach(section => {
                section.classList.remove('collapsed');
                section.style.maxHeight = '200px';
            });
            headers.forEach(header => header.classList.remove('collapsed'));
        }
    }

    window.addEventListener('load', initResponsiveSections);
    window.addEventListener('resize', initResponsiveSections);
</script>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</html>