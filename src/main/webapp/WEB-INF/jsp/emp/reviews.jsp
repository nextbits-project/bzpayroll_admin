<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title>BzPayroll - Employee Reviews</title>

<script src="${pageContext.request.contextPath}/tableStyle/tab/jquery-ui.js"></script>
<link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>
.dataTables_length {
    font-size: 14px;
}

.dataTables_filter {
    font-size: 14px;
}

.dataTables_info {
    font-size: 14px;
}

.dataTables_paginate {
    font-size: 14px;
}

table.sortable thead {
    background-color: #eee;
    color: #666666;
    font-weight: bold;
    cursor: default;
}

table.tabla-listados {
    width: 100%;
    border: 1px solid rgb(207, 207, 207);
    margin: 0;
}

table.tabla-listados tbody tr.odd td {
    background: #e1e5e9;
}

table.tabla-listados thead tr th {
    font-size: 14px;
}

table.tabla-listados tbody tr td {
    font-size: 12px;
}

table th {
    font-size: 14px !important;
}

.reviews-toolbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    width: 100%;
    margin: 5px 0 12px;
}

.reviews-toolbar-left,
.reviews-toolbar-right {
    display: flex;
    align-items: center;
    gap: 10px;
}

.reviews-list-column {
    width: 28%;
    min-width: 320px;
    vertical-align: top;
}

.reviews-detail-column {
    width: 72%;
    vertical-align: top;
}

.ui-tabs .ui-tabs-nav {
    border: none !important;
    display: flex;
    justify-content: center;
    gap: 5px;
    padding: 0;
    margin: 0 auto;
    width: 100%;
}

.ui-tabs .ui-tabs-nav li {
    flex: 1;
    max-width: 200px;
    text-align: center;
    border: 1px solid #ccc !important;
}

.ui-tabs .ui-tabs-nav li.ui-tabs-active {
    background: white !important;
    border-bottom: 1px solid white !important;
    box-shadow: none !important;
}

.ui-tabs .ui-tabs-nav li.ui-tabs-active a {
    background: white !important;
    color: black !important;
    outline: none !important;
    box-shadow: none !important;
}

#formCustomization {
    margin-right: 5px;
}

.employee-row {
    border-bottom: 1px solid #ccc;
    cursor: pointer;
}

.employee-row.active-row td {
    background-color: #808080;
    color: white;
    font-weight: bold;
}

.reviews-form-table td {
    padding: 5px 6px;
    vertical-align: top;
    font-size: 13px;
}

.reviews-form-table textarea,
.reviews-form-table select,
.reviews-form-table input[type="text"],
.reviews-form-table input[type="date"],
.reviews-form-table input[type="number"] {
    width: 100%;
}

.review-history-table {
    width: 100%;
    border-collapse: collapse;
}

.review-history-table th,
.review-history-table td {
    border: 1px solid #d0d0d0;
    padding: 8px;
    font-size: 12px;
    vertical-align: top;
}

.review-history-table th {
    background: #f1f1f1;
    text-align: left;
}

.rating-star {
    color: #d4a017;
    font-size: 14px;
}

.text-muted-small {
    color: #666;
    font-size: 11px;
}

.status-badge {
    display: inline-block;
    padding: 2px 8px;
    border-radius: 10px;
    font-size: 11px;
    color: #fff;
}

.status-scheduled {
    background: #17a2b8;
}

.status-pending {
    background: #f0ad4e;
}

.status-completed {
    background: #5cb85c;
}

.empty-review-block {
    padding: 25px 10px;
    text-align: center;
    color: #666;
    font-size: 13px;
}

.hidden-row {
    display: none;
}
</style>

<script>
$(document).ready(function () {
    $("#tabs").tabs({ active: ${selectedEmployeeInactive ? 1 : 0} });

    $("#employeeSearch").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#activeEmployeeBody tr, #inactiveEmployeeBody tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    if (window.selectedEmployeeId) {
        filterReviewHistoryByEmployee(window.selectedEmployeeId);
        syncSelectedEmployeeInputs(window.selectedEmployeeId);
    }
});
</script>
</head>
<body onload="initialize();">
    <div id="ddcolortabsline">&nbsp;</div>
    <div id="cos">
        <div class="statusquo ok">
            <div id="hoja">
                <div id="blanquito">
                    <div id="padding">
                        <div>
                            <span
                                style="font-size: 1.1em; font-weight: normal; color: #838383; margin: 30px 0px 15px 0px; border-bottom: 1px dotted #333; padding: 0 0 .3em 0;">
                                Employee Reviews
                            </span>
                            <br>
                        </div>

                        <form id="reviewEntryForm" action="${pageContext.request.contextPath}/employee-reviews/save" method="post">
                            <input type="hidden" name="id" value="${reviewForm.id}" />
                            <input type="hidden" id="selectedEmployeeTracker" value="${selectedEmployeeId}" />

                            <table style="width: 100%;">
                                <tr>
                                    <td style="font-size: 14px;">
                                        <table class="tabla-listados" cellspacing="0" style="margin-top: 0; margin-left: 20px;">
                                            <tr>
                                                <td colspan="2" style="border:0;">
                                                    <div class="reviews-toolbar">
                                                        <div class="reviews-toolbar-left">
                                                            <label for="employeeSearch">
                                                                <spring:message code="BzComposer.searchbuttontext" />
                                                            </label>
                                                            <input type="text" id="employeeSearch">
                                                        </div>
                                                        <div class="reviews-toolbar-right">
                                                            <input type="submit" class="formbutton" style="padding: 7 15px;" value="Save" />
                                                            <input type="button" class="formbutton" style="padding: 7 15px;" value="New" onclick="window.location='${pageContext.request.contextPath}/employee-reviews?newReview=true'">
                                                            <c:if test="${not empty reviewForm.id}">
                                                                <input type="button" class="formbutton" style="padding: 7 15px;" value="Delete" onclick="document.getElementById('deleteReviewForm').submit();">
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="reviews-list-column">
                                                    <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>

                                                    <div id="formCustomization">
                                                        <div id="tabs">
                                                            <ul>
                                                                <li><a href="#active" style="font-size:18px;">Active</a></li>
                                                                <li><a href="#inactive" style="font-size:18px;">Inactive</a></li>
                                                            </ul>

                                                            <div style="height: 690px; overflow-y: auto;">
                                                                <div id="active">
                                                                    <div class="table-responsive">
                                                                        <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th><hr style="border:1px solid black; margin:0;"></th>
                                                                                </tr>
                                                                            </tbody>
                                                                            <tbody id="activeEmployeeBody">
                                                                                <c:forEach var="employee" items="${employees}">
                                                                                    <tr class="employee-row ${selectedEmployeeId == employee.id ? 'active-row' : ''}"
                                                                                        data-employee-id="${employee.id}"
                                                                                        onclick="selectEmployeeRow(this, '${employee.id}')">
                                                                                        <td style="padding: 10px;">
                                                                                            ${empty employee.firstName ? '' : employee.firstName}
                                                                                            ${empty employee.lastName ? '' : employee.lastName}
                                                                                            ${empty employee.ssn ? '' : employee.ssn}
                                                                                            <br />
                                                                                            ${empty employee.payPeriod ? '' : employee.payPeriod}
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <div id="inactive">
                                                                    <div class="table-responsive">
                                                                        <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th><hr style="border:1px solid black; margin:0;"></th>
                                                                                </tr>
                                                                            </tbody>
                                                                            <tbody id="inactiveEmployeeBody">
                                                                                <c:forEach var="employee" items="${inactiveEmployees}">
                                                                                    <tr class="employee-row ${selectedEmployeeId == employee.id ? 'active-row' : ''}"
                                                                                        data-employee-id="${employee.id}"
                                                                                        onclick="selectEmployeeRow(this, '${employee.id}')">
                                                                                        <td style="padding: 10px;">
                                                                                            ${empty employee.firstName ? '' : employee.firstName}
                                                                                            ${empty employee.lastName ? '' : employee.lastName}
                                                                                            ${empty employee.ssn ? '' : employee.ssn}
                                                                                            <br />
                                                                                            ${empty employee.payPeriod ? '' : employee.payPeriod}
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>

                                                <td class="reviews-detail-column" style="font-size: 14px; margin: 0; padding: 0; vertical-align: top;">
                                                    <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                        <tr>
                                                            <td colspan="8">
                                                                <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                                    <thead>
                                                                        <tr id="css1">
                                                                            <th colspan="8">Review Information</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="8">
                                                                <c:if test="${status == true && not empty message}">
                                                                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                        ${message}
                                                                    </div>
                                                                </c:if>
                                                                <c:if test="${status == false && not empty message}">
                                                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                        ${message}
                                                                    </div>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="8">
                                                                <table class="reviews-form-table" style="width: 100%;">
                                                                    <tr>
                                                                        <td style="width: 12%;">Review ID:</td>
                                                                        <td style="width: 14%;"><input type="text" value="${reviewForm.id}" readonly /></td>
                                                                        <td style="width: 14%;">Employee:</td>
                                                                        <td style="width: 20%;">
                                                                            <select name="employeeId" required>
                                                                                <option value="">Select Employee</option>
                                                                                <c:forEach items="${employees}" var="employee">
                                                                                <option value="${employee.id}" ${reviewForm.employeeId == employee.id ? 'selected="selected"' : ''}>
                                                                                    ${employee.firstName} ${employee.lastName}
                                                                                </option>
                                                                            </c:forEach>
                                                                            <c:forEach items="${inactiveEmployees}" var="employee">
                                                                                <option value="${employee.id}" ${reviewForm.employeeId == employee.id ? 'selected="selected"' : ''}>
                                                                                    ${employee.firstName} ${employee.lastName} (Inactive)
                                                                                </option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </td>
                                                                        <td style="width: 14%;">Reviewer:</td>
                                                                        <td style="width: 26%;">
                                                                            <select name="reviewerId" required>
                                                                                <option value="">Select Reviewer</option>
                                                                                <c:forEach items="${reviewers}" var="reviewer">
                                                                                    <option value="${reviewer.id}" ${reviewForm.reviewerId == reviewer.id ? 'selected="selected"' : ''}>
                                                                                        ${reviewer.firstName} ${reviewer.lastName}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Review Date:</td>
                                                                        <td><input type="date" name="reviewDate" value="${reviewForm.reviewDate}" required /></td>
                                                                        <td>Period Start:</td>
                                                                        <td><input type="date" name="periodStart" value="${reviewForm.periodStart}" required /></td>
                                                                        <td>Period End:</td>
                                                                        <td><input type="date" name="periodEnd" value="${reviewForm.periodEnd}" required /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Status:</td>
                                                                        <td>
                                                                            <select name="status" required>
                                                                                <option value="scheduled" ${reviewForm.status == 'scheduled' ? 'selected="selected"' : ''}>Scheduled</option>
                                                                                <option value="pending" ${reviewForm.status == 'pending' ? 'selected="selected"' : ''}>Pending</option>
                                                                                <option value="completed" ${reviewForm.status == 'completed' ? 'selected="selected"' : ''}>Completed</option>
                                                                            </select>
                                                                        </td>
                                                                        <td>Rating:</td>
                                                                        <td>
                                                                            <select name="rating" required>
                                                                                <option value="">Select Rating</option>
                                                                                <option value="5" ${reviewForm.rating == 5 ? 'selected="selected"' : ''}>5 - Outstanding</option>
                                                                                <option value="4" ${reviewForm.rating == 4 ? 'selected="selected"' : ''}>4 - Exceeds Expectations</option>
                                                                                <option value="3" ${reviewForm.rating == 3 ? 'selected="selected"' : ''}>3 - Meets Expectations</option>
                                                                                <option value="2" ${reviewForm.rating == 2 ? 'selected="selected"' : ''}>2 - Needs Improvement</option>
                                                                                <option value="1" ${reviewForm.rating == 1 ? 'selected="selected"' : ''}>1 - Unsatisfactory</option>
                                                                            </select>
                                                                        </td>
                                                                        <td colspan="2">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Review:</td>
                                                                        <td colspan="5">
                                                                            <textarea name="performanceComments" rows="4" required>${reviewForm.performanceComments}</textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Goals:</td>
                                                                        <td colspan="5">
                                                                            <textarea name="goals" rows="3">${reviewForm.goals}</textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Development:</td>
                                                                        <td colspan="5">
                                                                            <textarea name="development" rows="3">${reviewForm.development}</textarea>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="8">
                                                                <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                                    <thead>
                                                                        <tr id="css1">
                                                                            <th colspan="8">Filter Reviews</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="8">
                                                                <table class="reviews-form-table" style="width: 100%;">
                                                                    <tr>
                                                                        <td style="width: 12%;">Employee:</td>
                                                                        <td style="width: 20%;">
                                                                            <select id="filterEmployeeId">
                                                                                <option value="">All Employees</option>
                                                                                <c:forEach items="${employees}" var="employee">
                                                                                    <option value="${employee.id}" ${selectedEmployeeId == employee.id ? 'selected="selected"' : ''}>
                                                                                        ${employee.firstName} ${employee.lastName}
                                                                                    </option>
                                                                                </c:forEach>
                                                                                <c:forEach items="${inactiveEmployees}" var="employee">
                                                                                    <option value="${employee.id}" ${selectedEmployeeId == employee.id ? 'selected="selected"' : ''}>
                                                                                        ${employee.firstName} ${employee.lastName} (Inactive)
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        <td style="width: 14%;">Review Period:</td>
                                                                        <td style="width: 18%;">
                                                                            <select id="filterReviewPeriod">
                                                                                <option value="">All Periods</option>
                                                                                <option value="last30" ${selectedReviewPeriod == 'last30' ? 'selected="selected"' : ''}>Last 30 Days</option>
                                                                                <option value="last90" ${selectedReviewPeriod == 'last90' ? 'selected="selected"' : ''}>Last 90 Days</option>
                                                                                <option value="last180" ${selectedReviewPeriod == 'last180' ? 'selected="selected"' : ''}>Last 6 Months</option>
                                                                                <option value="lastYear" ${selectedReviewPeriod == 'lastYear' ? 'selected="selected"' : ''}>Last Year</option>
                                                                            </select>
                                                                        </td>
                                                                        <td style="width: 12%;">Status:</td>
                                                                        <td style="width: 24%;">
                                                                            <select id="filterStatus">
                                                                                <option value="">All Statuses</option>
                                                                                <option value="scheduled" ${selectedStatus == 'scheduled' ? 'selected="selected"' : ''}>Scheduled</option>
                                                                                <option value="pending" ${selectedStatus == 'pending' ? 'selected="selected"' : ''}>Pending</option>
                                                                                <option value="completed" ${selectedStatus == 'completed' ? 'selected="selected"' : ''}>Completed</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Rating:</td>
                                                                        <td>
                                                                            <select id="filterRating">
                                                                                <option value="">All Ratings</option>
                                                                                <c:forEach begin="1" end="5" var="starRating">
                                                                                    <option value="${starRating}" ${selectedRating == starRating ? 'selected="selected"' : ''}>${starRating} Star${starRating > 1 ? 's' : ''}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td>
                                                                        <td colspan="4">
                                                                            <input type="button" class="formbutton" style="padding: 7 15px;" value="Apply Filters" onclick="applyReviewFilters()">
                                                                            <input type="button" class="formbutton" style="padding: 7 15px;" value="Reset" onclick="resetReviewFilters()">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                        <c:if test="${showReviewDetails}">
                                                            <tr>
                                                                <td colspan="8">
                                                                    <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                                        <thead>
                                                                            <tr id="css1">
                                                                                <th colspan="8">Selected Review Details</th>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="8">
                                                                    <table class="reviews-form-table" style="width: 100%;">
                                                                        <tr>
                                                                            <td style="width: 14%;">Employee:</td>
                                                                            <td style="width: 36%;">${detailReview.employee.firstName} ${detailReview.employee.lastName}</td>
                                                                            <td style="width: 14%;">Reviewer:</td>
                                                                            <td style="width: 36%;">${detailReview.reviewer.firstName} ${detailReview.reviewer.lastName}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Review Date:</td>
                                                                            <td>${detailReview.reviewDate}</td>
                                                                            <td>Status:</td>
                                                                            <td><span class="status-badge status-${detailReview.status}">${detailReview.status}</span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Period:</td>
                                                                            <td>${detailReview.periodStart} to ${detailReview.periodEnd}</td>
                                                                            <td>Rating:</td>
                                                                            <td>${detailReview.rating} / 5</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Review:</td>
                                                                            <td colspan="3">${detailReview.performanceComments}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Goals:</td>
                                                                            <td colspan="3">${empty detailReview.goals ? '-' : detailReview.goals}</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Development:</td>
                                                                            <td colspan="3">${empty detailReview.developmentPlan ? '-' : detailReview.developmentPlan}</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </c:if>

                                                        <tr>
                                                            <td colspan="8">
                                                                <table cellspacing="0" style="border: 0; width: 100%;" class="section-border">
                                                                    <thead>
                                                                        <tr id="css1">
                                                                            <th colspan="8">Review History</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="8">
                                                                <c:choose>
                                                                    <c:when test="${empty reviews}">
                                                                        <div class="empty-review-block">No Data Found</div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <table class="review-history-table">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th style="width: 5%;">SL</th>
                                                                                    <th style="width: 17%;">Employee</th>
                                                                                    <th style="width: 17%;">Customer/Reviewer</th>
                                                                                    <th style="width: 27%;">Review</th>
                                                                                    <th style="width: 10%;">Rating</th>
                                                                                    <th style="width: 10%;">Status</th>
                                                                                    <th style="width: 14%;">Actions</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <c:forEach items="${reviews}" var="review" varStatus="loop">
                                                                                    <tr class="review-history-row" data-employee-id="${review.employee.id}">
                                                                                        <td>${loop.index + 1}</td>
                                                                                        <td>
                                                                                            ${review.employee.firstName} ${review.employee.lastName}
                                                                                            <div class="text-muted-small">${review.reviewDate}</div>
                                                                                        </td>
                                                                                        <td>${review.reviewer.firstName} ${review.reviewer.lastName}</td>
                                                                                        <td>
                                                                                            ${review.performanceComments}
                                                                                            <div class="text-muted-small">${review.periodStart} to ${review.periodEnd}</div>
                                                                                        </td>
                                                                                        <td>
                                                                                            <c:forEach begin="1" end="5" var="starIndex">
                                                                                                <span class="rating-star">${starIndex <= review.rating ? '&#9733;' : '&#9734;'}</span>
                                                                                            </c:forEach>
                                                                                        </td>
                                                                                        <td><span class="status-badge status-${review.status}">${review.status}</span></td>
                                                                                        <td>
                                                                                            <a href="${pageContext.request.contextPath}/employee-reviews?viewId=${review.id}">View</a>
                                                                                            |
                                                                                            <a href="${pageContext.request.contextPath}/employee-reviews?editId=${review.id}">Edit</a>
                                                                                            |
                                                                                            <a href="#" onclick="deleteReviewById('${review.id}'); return false;">Delete</a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                        <div id="reviewHistoryEmpty" class="empty-review-block" style="display:none;">No Data Found</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </form>

                        <c:if test="${not empty reviewForm.id}">
                            <form id="deleteReviewForm" method="post" action="${pageContext.request.contextPath}/employee-reviews/delete/${reviewForm.id}"></form>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
window.selectedEmployeeId = "${selectedEmployeeId}";

function applyReviewFilters() {
    var params = [];
    var employeeId = document.getElementById('filterEmployeeId').value;
    var reviewPeriod = document.getElementById('filterReviewPeriod').value;
    var rating = document.getElementById('filterRating').value;
    var status = document.getElementById('filterStatus').value;

    if (employeeId) {
        params.push('employeeId=' + encodeURIComponent(employeeId));
    }
    if (reviewPeriod) {
        params.push('reviewPeriod=' + encodeURIComponent(reviewPeriod));
    }
    if (rating) {
        params.push('rating=' + encodeURIComponent(rating));
    }
    if (status) {
        params.push('status=' + encodeURIComponent(status));
    }

    var url = '${pageContext.request.contextPath}/employee-reviews';
    if (params.length > 0) {
        url += '?' + params.join('&');
    }
    window.location = url;
}

function deleteReviewById(id) {
    if (!confirm('Delete this review?')) {
        return;
    }
    var form = document.createElement('form');
    form.method = 'post';
    form.action = '${pageContext.request.contextPath}/employee-reviews/delete/' + id;
    document.body.appendChild(form);
    form.submit();
}

function selectEmployeeRow(row, employeeId) {
    window.selectedEmployeeId = employeeId;
    document.getElementById('selectedEmployeeTracker').value = employeeId;

    var rows = document.querySelectorAll('.employee-row');
    for (var i = 0; i < rows.length; i++) {
        rows[i].classList.remove('active-row');
    }
    row.classList.add('active-row');

    syncSelectedEmployeeInputs(employeeId);
    filterReviewHistoryByEmployee(employeeId);
}

function syncSelectedEmployeeInputs(employeeId) {
    var formEmployee = document.querySelector('select[name="employeeId"]');
    var filterEmployee = document.getElementById('filterEmployeeId');

    if (formEmployee) {
        formEmployee.value = employeeId;
    }
    if (filterEmployee) {
        filterEmployee.value = employeeId;
    }
}

function filterReviewHistoryByEmployee(employeeId) {
    var rows = document.querySelectorAll('.review-history-row');
    var visibleCount = 0;

    for (var i = 0; i < rows.length; i++) {
        var rowEmployeeId = rows[i].getAttribute('data-employee-id');
        var shouldShow = !employeeId || rowEmployeeId === employeeId;
        rows[i].style.display = shouldShow ? '' : 'none';
        if (shouldShow) {
            visibleCount++;
        }
    }

    var emptyBlock = document.getElementById('reviewHistoryEmpty');
    if (emptyBlock) {
        emptyBlock.style.display = visibleCount === 0 ? 'block' : 'none';
    }
}

function resetReviewFilters() {
    window.selectedEmployeeId = '';
    document.getElementById('selectedEmployeeTracker').value = '';
    document.getElementById('filterEmployeeId').value = '';
    document.getElementById('filterReviewPeriod').value = '';
    document.getElementById('filterRating').value = '';
    document.getElementById('filterStatus').value = '';

    var rows = document.querySelectorAll('.employee-row');
    for (var i = 0; i < rows.length; i++) {
        rows[i].classList.remove('active-row');
    }

    filterReviewHistoryByEmployee('');
}
</script>
</body>
</html>
