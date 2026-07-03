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
<%@include file="/WEB-INF/jsp/include/menuAdmin.jsp"%>
<title><spring:message code="BzComposer.Dashboard" /></title>
<style>
/* Existing styles */
table.tabla-listados { width: 100%; border: 1px solid rgb(207, 207, 207); margin: 0px 0px 0px 0px; }
table.tabla-listados tbody tr.odd td { background: #e1e5e9; }
table.tabla-listados thead tr th { font-size: 14px; }
table.tabla-listados tbody tr td { font-size: 12px; }

/* New responsive styles */
@media screen and (max-width: 768px) {
    /* Stack columns vertically */
    table.section-border tr {
        display: block;
    }
    
    table.section-border td {
        display: block;
        width: 100% !important;
        padding-right: 0 !important;
        padding-left: 0 !important;
    }
    
    /* Adjust scrollable divs */
    table.section-border td > div {
        margin: 10px 0 !important;
    }
    
    /* Sticky headers */
    .tabla-listados thead {
        position: sticky;
        top: 0;
        z-index: 10;
    }
    
    /* Font adjustments */
    body {
        font-size: 14px;
    }
    
    /* Header adjustments */
    td > div[style*="background-color: #05A9C5"] {
        font-size: 1em !important;
        padding: 8px 5px !important;
    }
    
    /* Collapsible sections */
    .dashboard-section {
        margin-bottom: 15px;
    }
    
    .section-header {
        cursor: pointer;
        position: relative;
        padding-right: 30px;
    }
    
    .section-header:after {
        content: '+';
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1.2em;
    }
    
    .section-header.collapsed:after {
        content: '-';
    }
    
    .section-content {
        transition: max-height 0.3s ease;
        overflow: hidden;
    }
    
    .section-content.collapsed {
        max-height: 0 !important;
    }
}

@media screen and (max-width: 480px) {
    /* Hide less important columns */
    .tabla-listados td:nth-child(4),
    .tabla-listados th:nth-child(4),
    .tabla-listados td:nth-child(5),
    .tabla-listados th:nth-child(5) {
        display: none;
    }
    
    /* Font adjustments */
    body {
        font-size: 12px;
    }
    
    /* Touch-friendly elements */
    .tabla-listados th, 
    .tabla-listados td {
        padding: 8px 4px;
    }
    
    /* Section headers */
    td > div[style*="background-color: #05A9C5"] {
        padding: 10px 5px !important;
    }
}

/* General responsive improvements */
.tabla-listados {
    width: 100%;
    max-width: 100%;
    overflow-x: auto;
    display: block;
}

#cos, #hoja, #blanquito, #padding {
    max-width: 100%;
    overflow-x: hidden;
}

/* Horizontal scrolling for tables */
.table-scroll-container {
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
    margin-bottom: 15px;
    border: 1px solid #ccc;
}

/* Touch-friendly elements */
.tabla-listados th, 
.tabla-listados td {
    padding: 10px 8px;
    min-width: 80px;
}

/* Responsive table cell text */
.tabla-listados td {
    word-break: break-word;
}

/* Section headers */
.section-title {
    font-size: 1.2em;
    font-weight: normal;
    color: #838383;
    margin: 30px 0px 15px 0px;
    border-bottom: 1px dotted #333;
    padding: 0 0 .3em 0;
}
</style>
</head>
<body>
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos">
<div class="statusquo ok">
<div id="hoja">
<div id="blanquito">
<div id="padding">
    <div>
        <span class="section-title">
            <spring:message code="BzComposer.Dashboard" />
        </span>
    </div>
    
    <!-- Visitors & Customers Section -->
    <div class="dashboard-section">
        <table cellspacing="0" style="width: 100%;overflow-y:scroll;border:0;" class="section-border">
            <tr>
                <td style="font-size:1.2em;color:#fff;padding-right: 6px; width: 50%;">
                    <div class="section-header" onclick="toggleSection('visitors-section')" style="width: 100%;background-color: #05A9C5;padding: 5px;"> Visitors </div>
                </td>
                <td style="font-size:1.2em;color:#fff;width: 50%;font-size:1.2em;color:#fff;width: 50%;padding-left: 6px;">
                    <div class="section-header" onclick="toggleSection('customers-section')" style="width: 100%;background-color: #05A9C5;padding: 5px;"> Customers </div>
                </td>
            </tr>
            <tr>
                <td style="border:0;vertical-align: top;">
                    <div id="visitors-section" class="section-content" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
                        <div class="table-scroll-container">
                            <table class="tabla-listados" cellspacing="0" style="margin:0; border:0;text-decoration: none;">
                                <thead>
                                    <tr style="background-color: #05A9C5;">
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
                <td style="border:0;vertical-align: top;">
                    <div id="customers-section" class="section-content" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 0 0 6px;">
                        <div class="table-scroll-container">
                            <table class="tabla-listados" cellspacing="0" style="margin:0; border:0;text-decoration: none;">
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
        <table cellspacing="0" style="width: 100%;overflow-y:scroll;border:0;" class="section-border">
            <tr>
                <td style="font-size:1.2em;color:#fff;padding-right: 6px;">
                    <div class="section-header" onclick="toggleSection('business-reg-section')" style="width: 100%;background-color: #05A9C5;padding: 5px;"> Business Registrations </div>
                </td>
                <td style="font-size:1.2em;color:#fff;padding-left: 6px;">
                    <div class="section-header" onclick="toggleSection('business-info-section')" style="width: 100%;background-color: #05A9C5;padding: 5px;"> Business Info Changed </div>
                </td>
            </tr>
            <tr>
                <td style="border:0;vertical-align: top;">
                    <div id="business-reg-section" class="section-content" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
                        <div class="table-scroll-container">
                            <table class="tabla-listados" cellspacing="0" style="margin:0; border:0;text-decoration: none;">
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
                <td style="border:0;vertical-align: top;">
                    <div id="business-info-section" class="section-content" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 0 0 6px;">
                        <div class="table-scroll-container">
                            <table class="tabla-listados" cellspacing="0" style="margin:0; border:0;text-decoration: none;">
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
        <table cellspacing="0" style="width: 100%;overflow-y:scroll;border:0;" class="section-border">
            <tr>
                <td style="font-size:1.2em;color:#fff;padding-right: 6px;">
                    <div class="section-header" onclick="toggleSection('payments-section')" style="width: 100%;background-color: #05A9C5;padding: 5px;"> Payments </div>
                </td>
                <td style="font-size:1.2em;color:#fff;padding-left:6px">
                    <div class="section-header" onclick="toggleSection('messages-section')" style="width: 100%;background-color: #05A9C5;padding: 5px;"> Messages </div>
                </td>
            </tr>
            <tr>
                <td style="border:0;vertical-align: top;">
                    <div id="payments-section" class="section-content" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 6px 0 0;">
                        <div class="table-scroll-container">
                            <table class="tabla-listados" cellspacing="0" style="overflow-x:auto;overflow-y:auto;margin:0; border:0;text-decoration: none;">
                                <thead>
                                    <tr>
                                        <th style="font-size:12px;"> <spring:message code="bca.Category" /></th>
                                        <th style="font-size:12px;"> <spring:message code="Bizcomposer.itemCode" /></th>
                                        <th style="font-size:12px;"> <spring:message code="BzComposer.item.itemtype" /></th>
                                        <th style="font-size:12px;"> <spring:message code="BzComposer.Item.ItemTitle" /></th>
                                        <th style="font-size:12px;"> <spring:message code="Bizcomposer.qty" /></th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
                <td style="border:0;vertical-align: top;">
                    <div id="messages-section" class="section-content" style="height:200px;overflow-y: scroll;border:1px solid #ccc;margin: 0 0 0 6px;">
                        <div class="table-scroll-container">
                            <table class="tabla-listados" cellspacing="0" style="overflow-x:auto;overflow-y:auto;margin:0; border:0;text-decoration: none;">
                                <thead>
                                    <tr>
                                        <th style="font-size:12px;"> <spring:message code="Bizcomposer.itemCode" /></th>
                                        <th style="font-size:12px;"> <spring:message code="BzComposer.item.itemtype" /></th>
                                        <th style="font-size:12px;"> <spring:message code="BzComposer.Item.ItemTitle" /></th>
                                        <th style="font-size:12px;"> <spring:message code="Bizcomposer.qty" /></th>
                                    </tr>
                                </thead>
                                <tbody>

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
</div>

<script>
// Toggle collapsible sections
function toggleSection(sectionId) {
    const section = document.getElementById(sectionId);
    const header = document.querySelector(`[onclick="toggleSection('${sectionId}')]`);
    
    if (section && header) {
        section.classList.toggle('collapsed');
        header.classList.toggle('collapsed');
        
        if (section.classList.contains('collapsed')) {
            section.style.maxHeight = '0';
        } else {
            section.style.maxHeight = section.scrollHeight + 'px';
        }
    }
}

// Initialize sections for mobile
function initResponsiveSections() {
    if (window.innerWidth <= 768) {
        // Collapse all sections by default on mobile
        const sections = document.querySelectorAll('.section-content');
        const headers = document.querySelectorAll('.section-header');
        
        sections.forEach(section => {
            section.classList.add('collapsed');
            section.style.maxHeight = '0';
        });
        
        headers.forEach(header => {
            header.classList.add('collapsed');
        });
    }
}

// Initialize on load and window resize
window.addEventListener('load', initResponsiveSections);
window.addEventListener('resize', initResponsiveSections);
</script>
</body>
<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
</html>