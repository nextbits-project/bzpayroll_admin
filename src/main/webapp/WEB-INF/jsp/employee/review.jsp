<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
        <%@include file="/WEB-INF/jsp/include/header.jsp"%>
        <%@include file="/WEB-INF/jsp/include/menu.jsp"%>
    <title>Employee Reviews</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .main-container {
            padding: 20px;
            margin-top: 20px;
        }
        .page-title {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            color: #505050;
        }
        .page-title i {
            color: #ff7f32;
            margin-right: 10px;
            font-size: 24px;
        }
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 30px;
        }
        table.dataTable thead th {
            background-color: #f8f9fa;
            color: #505050;
            font-weight: 500;
            padding: 15px 10px;
            border-bottom: 1px solid #e9ecef;
        }
        table.dataTable tbody td {
            padding: 12px 10px;
            vertical-align: middle;
        }
        .rating-stars {
            color: #ff7f32;
        }
        .action-buttons .btn {
            margin-right: 5px;
            border-radius: 4px;
        }
        .filter-section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        .filter-group {
            flex: 1;
            min-width: 220px;
            margin-right: 15px;
            margin-bottom: 15px;
        }
        .filter-group:last-child {
            margin-right: 0;
        }
        .filter-actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .filter-actions .btn {
            margin-left: 10px;
        }
        .badge {
            padding: 6px 10px;
            font-weight: 500;
            border-radius: 4px;
        }
        .badge-success {
            background-color: #28a745;
        }
        .badge-warning {
            background-color: #ffc107;
            color: #212529;
        }
        .badge-info {
            background-color: #17a2b8;
        }
        .no-data-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 300px;
            text-align: center;
        }
        .no-data-icon {
            font-size: 64px;
            color: #d1d1d1;
            margin-bottom: 20px;
        }
        .no-data-text {
            font-size: 18px;
            color: #777;
        }
        .dataTables_wrapper .dataTables_length,
        .dataTables_wrapper .dataTables_filter {
            margin-bottom: 20px;
        }
        .modal-content {
            border-radius: 8px;
            border: none;
        }
        .modal-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }
        .form-control {
            border-radius: 4px;
            border: 1px solid #ced4da;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 127, 50, 0.25);
            border-color: #ff7f32;
        }
    </style>

</head>
<body>
    <div class="container-fluid main-container">
        <!-- Page Title -->
        <div class="page-title">
            <i class="fas fa-star"></i>
            <h3>Employee Performance Reviews</h3>
        </div>

        <!-- Filter Section -->
        <div class="row">
            <div class="col-12">
                <div class="filter-section">
                    <div class="filter-group">
                        <label for="employeeFilter">Employee</label>
                        <select class="form-control" id="employeeFilter">
                            <option value="">All Employees</option>
                            <c:forEach items="${employees}" var="emp">
                                <option value="${emp.id}">${emp.firstName} ${emp.lastName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="dateRangeFilter">Review Period</label>
                        <select class="form-control" id="dateRangeFilter">
                            <option value="">All Periods</option>
                            <option value="last30">Last 30 Days</option>
                            <option value="last90">Last 90 Days</option>
                            <option value="last180">Last 6 Months</option>
                            <option value="lastYear">Last Year</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="ratingFilter">Rating</label>
                        <select class="form-control" id="ratingFilter">
                            <option value="">All Ratings</option>
                            <option value="5">5 Stars</option>
                            <option value="4">4 Stars</option>
                            <option value="3">3 Stars</option>
                            <option value="2">2 Stars</option>
                            <option value="1">1 Star</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="statusFilter">Status</label>
                        <select class="form-control" id="statusFilter">
                            <option value="">All Statuses</option>
                            <option value="completed">Completed</option>
                            <option value="pending">Pending</option>
                            <option value="scheduled">Scheduled</option>
                        </select>
                    </div>
                </div>

                <div class="filter-actions">
                    <button type="button" class="btn btn-outline-secondary" id="resetFilters">
                        <i class="fas fa-undo mr-1"></i> Reset
                    </button>
                    <button type="button" class="btn btn-primary" id="applyFilters">
                        <i class="fas fa-filter mr-1"></i> Apply Filters
                    </button>
                    <button type="button" class="btn btn-success" id="newReviewBtn" data-toggle="modal" data-target="#newReviewModal">
                        <i class="fas fa-plus mr-1"></i> New Review
                    </button>
                </div>
            </div>
        </div>

        <!-- Reviews Table -->
        <div class="row">
            <div class="col-12">
                <div class="table-container">
                    <table id="reviewsTable" class="table table-hover w-100">
                        <thead>
                            <tr>
                                <th width="5%">SL</th>
                                <th width="20%">Employee</th>
                                <th width="20%">Customer/Reviewer</th>
                                <th width="30%">Review</th>
                                <th width="15%">Rating</th>
                                <th width="10%">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty reviews}">
                                <!-- No Data Found Display -->
                                <tr>
                                    <td colspan="6">
                                        <div class="no-data-container">
                                            <div class="no-data-icon">
                                                <i class="fas fa-folder-open"></i>
                                            </div>
                                            <div class="no-data-text">
                                                No Data Found
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>

                            <c:forEach items="${reviews}" var="review" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>
                                        <div>${review.employee.firstName} ${review.employee.lastName}</div>
                                        <small class="text-muted">
                                            <fmt:formatDate value="${review.reviewDate}" pattern="MM/dd/yyyy" />
                                        </small>
                                    </td>
                                    <td>
                                        <div>${review.reviewer.firstName} ${review.reviewer.lastName}</div>
                                        <small class="text-muted">
                                            <span class="badge ${review.status == 'completed' ? 'badge-success' : (review.status == 'pending' ? 'badge-warning' : 'badge-info')}">
                                                ${review.status}
                                            </span>
                                        </small>
                                    </td>
                                    <td>
                                        <div class="text-truncate" style="max-width: 300px;" title="${review.performanceComments}">
                                            ${review.performanceComments}
                                        </div>
                                        <small class="text-muted">
                                            Period: ${review.periodStart} - ${review.periodEnd}
                                        </small>
                                    </td>
                                    <td>
                                        <div class="rating-stars">
                                            <c:forEach begin="1" end="5" var="star">
                                                <i class="fas fa-star ${star <= review.rating ? '' : 'text-muted'}"></i>
                                            </c:forEach>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <button class="btn btn-sm btn-info view-review" data-id="${review.id}" title="View">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-primary edit-review" data-id="${review.id}" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger delete-review" data-id="${review.id}" title="Delete">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- New Review Modal -->
    <div class="modal fade" id="newReviewModal" tabindex="-1" role="dialog" aria-labelledby="newReviewModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="newReviewModalLabel">New Employee Review</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="reviewForm">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="employee">Employee</label>
                                <select class="form-control" id="employee" name="employeeId" required>
                                    <option value="">Select Employee</option>
                                    <c:forEach items="${employees}" var="emp">
                                        <option value="${emp.id}">${emp.firstName} ${emp.lastName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="reviewer">Reviewer</label>
                                <select class="form-control" id="reviewer" name="reviewerId" required>
                                    <option value="">Select Reviewer</option>
                                    <c:forEach items="${managers}" var="manager">
                                        <option value="${manager.id}">${manager.firstName} ${manager.lastName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="reviewDate">Review Date</label>
                                <input type="date" class="form-control" id="reviewDate" name="reviewDate" required>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="periodStart">Period Start</label>
                                <input type="date" class="form-control" id="periodStart" name="periodStart" required>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="periodEnd">Period End</label>
                                <input type="date" class="form-control" id="periodEnd" name="periodEnd" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="rating">Overall Performance Rating</label>
                            <select class="form-control" id="rating" name="rating" required>
                                <option value="">Select Rating</option>
                                <option value="5">5 - Outstanding</option>
                                <option value="4">4 - Exceeds Expectations</option>
                                <option value="3">3 - Meets Expectations</option>
                                <option value="2">2 - Needs Improvement</option>
                                <option value="1">1 - Unsatisfactory</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="performanceComments">Performance Comments</label>
                            <textarea class="form-control" id="performanceComments" name="performanceComments" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="goals">Goals and Objectives</label>
                            <textarea class="form-control" id="goals" name="goals" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="development">Development Plan</label>
                            <textarea class="form-control" id="development" name="development" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" required>
                                <option value="scheduled">Scheduled</option>
                                <option value="pending">Pending</option>
                                <option value="completed">Completed</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="saveReview">Save Review</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Initialize DataTable
            $('#reviewsTable').DataTable({
                "order": [[0, "asc"]], // Sort by serial number asc
                "pageLength": 10,
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "language": {
                    "emptyTable": '<div class="no-data-container"><div class="no-data-icon"><i class="fas fa-folder-open"></i></div><div class="no-data-text">No Data Found</div></div>'
                }
            });

            // Apply filters button click
            $('#applyFilters').click(function() {
                // Add filter logic here - in a real implementation
                // this would filter the table based on selected values
                alert('Filter functionality would be implemented here');
            });

            // Reset filters button click
            $('#resetFilters').click(function() {
                $('#employeeFilter').val('');
                $('#dateRangeFilter').val('');
                $('#ratingFilter').val('');
                $('#statusFilter').val('');
            });

            // Save Review button click
            $('#saveReview').click(function() {
                // Validate and save the form data
                if ($('#reviewForm')[0].checkValidity()) {
                    // In a real implementation, this would submit the form data to the server
                    alert('Review saved successfully!');
                    $('#newReviewModal').modal('hide');
                    // Optionally refresh the table or add the new row
                } else {
                    $('#reviewForm')[0].reportValidity();
                }
            });

            // View Review button click
            $('.view-review').click(function() {
                const reviewId = $(this).data('id');
                // In a real implementation, this would fetch the review details
                // and display them in a modal or navigate to a details page
                alert('View review with ID: ' + reviewId);
            });

            // Edit Review button click
            $('.edit-review').click(function() {
                const reviewId = $(this).data('id');
                // In a real implementation, this would fetch the review details
                // and populate the edit form
                alert('Edit review with ID: ' + reviewId);
            });

            // Delete Review button click
            $('.delete-review').click(function() {
                const reviewId = $(this).data('id');
                if (confirm('Are you sure you want to delete this review?')) {
                    // In a real implementation, this would send a delete request to the server
                    alert('Review with ID: ' + reviewId + ' deleted');
                    // Optionally remove the row from the table
                }
            });
        });
    </script>
</body>
</html>