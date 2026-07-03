<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee List</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <!-- Bootstrap CSS CDN -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h2>Employee List</h2>

    <!-- Left: Show entries -->
     <div style="text-align: left; grid-column: span 6;">
         <div class="dataTables_length" id="custTable_length">
             <label>
                 Show
                 <select name="custTable_length" aria-controls="custTable" id="entryCountSelect">
                     <option value="10">10</option>
                     <option value="25">25</option>
                     <option value="50">50</option>
                     <option value="100">100</option>
                 </select>
                  entries
             </label>
         </div>
     </div>

<table border="1" id="employeeTable">
    <thead>
    <tr>
    <th colspan="2">
                          Search
                      </th>
                      <th colspan="5" style="padding: 5px;">
                          <input type="text" id="myInput" style="width: 150px; padding: 4px;">
                      </th>
                      </tr>
                      <tr>
    <th>SN.</th>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>City</th>
        <th>Phone</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>
<div style="float: left;">
  <span id="pageNumberInfo"></span>
 </div>
<div id="paginationControls">
    <button id="prevPage">Previous</button>
    <span id="pageInfo"></span>
    <button id="nextPage">Next</button>
</div>
<br>

<div style="overflow: auto;height: 15vh; width:100px;">
<table border="1" cellpadding="10" id="myTable">
  <tr><td>Radha1</td></tr>
  <tr><td>Radha2</td></tr>
  <tr><td>Radha3</td></tr>
  <tr><td>Radha4</td></tr>
  <tr><td>Radha5</td></tr>
  <tr><td>Radha6</td></tr>
  <tr><td>Radha7</td></tr>
  <tr><td>Radha8</td></tr>
  <tr><td>Radha9</td></tr>
  <tr><td>Radha10</td></tr>
</table>
</div>
<br>
<input type text id="selectedCell"/>
<script>
  $(document).ready(function(){
    $('#myTable td').click(function(){
      var cellText = $(this).text();     // Get text from clicked cell
      $('#selectedCell').val(cellText);  // Set it to the input field
    });
  });
</script>
<script>

let totalPages=0;
let currentPage=0;
let tempSize=0;

    function loadEmployees(status = '', page = 0, size = 10) {
    offset=page;
    limit=size;
        $.ajax({
            url: `/api/fetchEmployeeList?offset=\${page}&limit=\${size}`,
            method: 'GET',
            data: {
                status: status,
                page: page,
                size: size
            },
            success: function (response) {
            console.log(response.content+"pppppppppp");
                const employees = response.content;
                totalPages = response.totalPages;
                currentPage = response.number;
                tempSize=size;

                // Clear the tbody before appending new rows
                const tbody = $('#employeeTable tbody');
                tbody.empty();

                if (employees.length === 0) {
                    tbody.append('<tr><td colspan="6">No employees found.</td></tr>');
                } else {
                   $.each(employees, function (i, emp) {
                       $('#employeeTable tbody').append(`
                           <tr>
                           <td>
                                \${response.pageable.offset+i+1}
                                </td>
                               <td>\${emp.employeeID}</td>
                               <td>\${emp.firstName || ''}</td>
                               <td>\${emp.lastName || ''}</td>
                               <td>\${emp.city || ''}</td>
                               <td>\${emp.phone || ''}</td>
                               <td>\${emp.status || ''}</td>
                           </tr>
                       `);
                   });
                }
                $('#pageNumberInfo').text(`Showing \${response.pageable.offset + 1} to \${response.pageable.offset + response.numberOfElements} of \${response.totalElements} entries`);
                $('#pageInfo').text(`Page \${currentPage } of ${totalPages}`);
                $('#prevPage').prop('disabled', currentPage === 0);
                $('#nextPage').prop('disabled', currentPage >= totalPages - 1);
            },
            error: function () {
                alert('Failed to load employee data.');
            }
        });
    }

     $(document).ready(function () {
            // Initial load
            loadEmployees();

            // Handle select dropdown change (entries per page)
             $('#entryCountSelect').change(function () {
                     console.log("Selected value:", $(this).val()); // Debug
                    tempSize=$(this).val();
                   loadEmployees('', currentPage, $(this).val());
               });

            // Pagination buttons
            $('#prevPage').click(function () {
                if (currentPage > 0) {
                    currentPage--;
                    loadEmployees('', currentPage, tempSize);
                }
            });

            $('#nextPage').click(function () {
                if (currentPage < totalPages - 1) {
                    currentPage++;
                    console.log(limit+"pppppppppp"+currentPage);
                    loadEmployees('', currentPage, tempSize);
                }
            });
        });
</script>
<script>
		$(document).ready(function(){
			$("#myInput").on("keyup", function() {
				var value = $(this).val().toLowerCase();
				$("#employeeTable tbody tr").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});
		});
	</script>









	 <!-- Switch -->
      <div class="d-flex justify-content-between align-items-center px-3 py-2 mb-3" style="background-color: #f8f9fa; border-radius: 6px;">
        <label class="form-check-label mb-0" for="flexSwitchCheckDefault">View: Active / Inactive:</label>
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onchange="toggleTabs()">
        </div>
      </div>



      <!-- Tab Content -->
      <div class="tab-content" id="employeeTabsContent">
        <!-- Active Tab -->
        <div class="tab-pane fade show active" id="active" role="tabpanel">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead class="table-light">
                <tr>
                  <th>Name</th>
                  <th>F/P</th>
                  <th>S/H</th>
                  <th>R/C</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Jane Doe</td>
                  <td>Developer</td>
                  <td>IT</td>
                  <td>F</td>
                  <td>S</td>
                  <td>R</td>
                </tr>
                <tr>
                  <td>John Smith</td>
                  <td>Designer</td>
                  <td>Marketing</td>
                  <td>P</td>
                  <td>H</td>
                  <td>C</td>
                </tr>
                <!-- Add more rows as needed -->
              </tbody>
            </table>
          </div>
        </div>

        <!-- Inactive Tab -->
        <div class="tab-pane fade" id="inactive" role="tabpanel">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead class="table-light">
                <tr>
                  <th>Name</th>
                  <th>Position</th>
                  <th>Department</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Alice Brown</td>
                  <td>HR Manager</td>
                  <td>HR</td>
                </tr>
                <tr>
                  <td>Michael Green</td>
                  <td>Sales Rep</td>
                  <td>Sales</td>
                </tr>
                <!-- Add more rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
      </div>

     <script>
       function toggleTabs() {
         const isChecked = document.getElementById('flexSwitchCheckDefault').checked;

         const activeTab = document.getElementById('active');
         const inactiveTab = document.getElementById('inactive');

         if (isChecked) {
           // Show Inactive
           activeTab.classList.remove('show', 'active');
           inactiveTab.classList.add('show', 'active');
         } else {
           // Show Active
           inactiveTab.classList.remove('show', 'active');
           activeTab.classList.add('show', 'active');
         }
       }
     </script>





</body>
</html>
