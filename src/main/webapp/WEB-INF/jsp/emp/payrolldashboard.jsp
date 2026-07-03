<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@include file="/WEB-INF/jsp/include/headlogo.jsp" %>
    <%@include file="/WEB-INF/jsp/include/header.jsp" %>
    <%@include file="/WEB-INF/jsp/include/menu.jsp" %>
    <title><spring:message code="BzComposer.Dashboard" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .dashboard-shell {
            width: 100%;
            max-width: 1240px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        .dashboard-header {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 14px 18px;
            margin: 30px 0 20px;
        }

        .dashboard-heading {
            font-size: 1.2em;
            font-weight: normal;
            color: #838383;
            border-bottom: 1px dotted #333;
            padding: 0 0 .3em 0;
        }

        .dashboard-range-group {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            align-items: center;
        }

        .dashboard-range-label {
            font-size: 1.2em;
            font-weight: normal;
            color: #838383;
            border-bottom: 1px dotted #333;
            padding: 0 0 .3em 0;
        }

        .dashrange-btn {
            border: 1px solid #05A9C5;
            background: #fff;
            color: #05A9C5;
            font-size: 13px;
            padding: 7px 14px;
            min-width: 82px;
        }

        .dashrange-btn.active,
        .dashrange-btn:hover {
            background: #05A9C5;
            color: #fff;
        }

        .metric-row,
        .graph-row {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            margin-bottom: 18px;
            justify-content: center;
        }

        .metric-card {
            flex: 1 1 calc(25% - 14px);
            min-width: 220px;
            min-height: 96px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 12px 16px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
        }

        .metric-card-title {
            font-size: 13px;
            color: #666;
            margin-bottom: 8px;
        }

        .metric-card-value {
            font-size: 24px;
            line-height: 1.1;
            font-weight: bold;
            color: #05A9C5;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin: 24px 0 14px;
            border-bottom: 2px solid #05A9C5;
            padding-bottom: 9px;
        }

        .graph-container {
            flex: 1 1 calc(50% - 14px);
            min-width: 360px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 16px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
        }

        .graph-title {
            font-size: 17px;
            font-weight: bold;
            color: #333;
            margin-bottom: 16px;
            border-bottom: 2px solid #05A9C5;
            padding-bottom: 10px;
        }

        .graph-canvas-wrap {
            height: 280px;
        }

        @media screen and (max-width: 768px) {
            #cos {
                padding: 10px;
            }

            .metric-card,
            .graph-container {
                min-width: 100%;
                flex-basis: 100%;
            }

            .dashboard-header {
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
<div id="ddcolortabsline">&nbsp;</div>
<div id="cos" class="dashboard-shell">
    <div class="statusquo ok">
        <div id="hoja">
            <div id="blanquito">
                <div id="padding">
                    <div class="dashboard-header">
                        <span class="dashboard-heading"><spring:message code="BzComposer.Dashboard" /></span>
                        <span class="dashboard-range-label"><spring:message code="BzComposer.salesorderboard.daterange" /></span>
                        <div class="dashboard-range-group">
                            <button type="button" class="dashrange-btn" data-value="ALL" onclick="filterRangeOptions('ALL')">ALL</button>
                            <button type="button" class="dashrange-btn" data-value="1M" onclick="filterRangeOptions('1M')">1 month</button>
                            <button type="button" class="dashrange-btn" data-value="3M" onclick="filterRangeOptions('3M')">3 months</button>
                            <button type="button" class="dashrange-btn" data-value="6M" onclick="filterRangeOptions('6M')">6 months</button>
                            <button type="button" class="dashrange-btn" data-value="1Y" onclick="filterRangeOptions('1Y')">1 year</button>
                        </div>
                        <input type="hidden" id="dashrangeName" value="${dashboardRange}">
                    </div>

                    <div class="metric-row">
                        <div class="metric-card">
                            <div class="metric-card-title">New Employees</div>
                            <div class="metric-card-value">${newEmployees}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Active Employees</div>
                            <div class="metric-card-value">${activeEmployees}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Total Employees</div>
                            <div class="metric-card-value">${totalEmployees}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Messages</div>
                            <div class="metric-card-value">${messagesCount}</div>
                        </div>
                    </div>

                    <div class="metric-row">
                        <div class="metric-card">
                            <div class="metric-card-title">Payroll Records</div>
                            <div class="metric-card-value">${payrollRecords}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Inactive Employees</div>
                            <div class="metric-card-value">${inactiveEmployees}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Range Gross Payroll</div>
                            <div class="metric-card-value">
                                $<fmt:formatNumber value="${rangeGrossPayroll}" minFractionDigits="2" maxFractionDigits="2" />
                            </div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Total Gross Payroll</div>
                            <div class="metric-card-value">
                                $<fmt:formatNumber value="${totalGrossPayroll}" minFractionDigits="2" maxFractionDigits="2" />
                            </div>
                        </div>
                    </div>

                    <div class="section-title">Paid Memberships</div>
                    <div class="metric-row">
                        <div class="metric-card">
                            <div class="metric-card-title">Free</div>
                            <div class="metric-card-value">${freeMembers}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Standard</div>
                            <div class="metric-card-value">${standardMembers}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Silver</div>
                            <div class="metric-card-value">${silverMembers}</div>
                        </div>
                        <div class="metric-card">
                            <div class="metric-card-title">Gold</div>
                            <div class="metric-card-value">${goldMembers}</div>
                        </div>
                    </div>

                    <div class="graph-row">
                        <div class="graph-container">
                            <div class="graph-title">Monthly Payroll Overview</div>
                            <div class="graph-canvas-wrap">
                                <canvas id="monthlyPayrollChart"></canvas>
                            </div>
                        </div>
                        <div class="graph-container">
                            <div class="graph-title">Monthly Employee Overview</div>
                            <div class="graph-canvas-wrap">
                                <canvas id="monthlyEmployeeChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
<script>
    function filterRangeOptions(range) {
        document.getElementById("dashrangeName").value = range;
        window.location = "${pageContext.request.contextPath}/payroll-dashboard?dashrangeName=" + range;
    }

    document.addEventListener("DOMContentLoaded", function () {
        var selectedRange = document.getElementById("dashrangeName").value || "ALL";
        document.querySelectorAll(".dashrange-btn").forEach(function (button) {
            button.classList.toggle("active", button.getAttribute("data-value") === selectedRange);
        });

        var payrollLabels = JSON.parse('<c:out value="${monthlyPayrollLabels}" escapeXml="false"/>');
        var payrollData = JSON.parse('<c:out value="${monthlyPayrollData}" escapeXml="false"/>');
        var employeeLabels = JSON.parse('<c:out value="${monthlyEmployeeLabels}" escapeXml="false"/>');
        var employeeData = JSON.parse('<c:out value="${monthlyEmployeeData}" escapeXml="false"/>');

        var payrollCanvas = document.getElementById("monthlyPayrollChart");
        if (payrollCanvas) {
            new Chart(payrollCanvas, {
                type: "line",
                data: {
                    labels: payrollLabels,
                    datasets: [{
                        label: "Gross Payroll",
                        data: payrollData,
                        borderColor: "#05A9C5",
                        backgroundColor: "rgba(5, 169, 197, 0.12)",
                        borderWidth: 2,
                        fill: true,
                        tension: 0.35
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: true, position: "top" }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function (value) {
                                    return "$" + value;
                                }
                            }
                        }
                    }
                }
            });
        }

        var employeeCanvas = document.getElementById("monthlyEmployeeChart");
        if (employeeCanvas) {
            new Chart(employeeCanvas, {
                type: "bar",
                data: {
                    labels: employeeLabels,
                    datasets: [{
                        label: "Employees Added",
                        data: employeeData,
                        backgroundColor: "#05A9C5",
                        borderColor: "#05A9C5",
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: true, position: "top" }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });
        }
    });
</script>
</body>
</html>
