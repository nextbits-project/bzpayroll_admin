
            const roleForm = document.getElementById('roleForm');
            const roleIdInput = document.getElementById('roleId');
            const roleNameInput = document.getElementById('roleName');
            const roleCheckboxes = document.querySelectorAll('.role-checkbox');
            const selectAllRoles = document.getElementById('selectAllRoles');
            const resetBtn = document.getElementById('resetBtn');
            const submitBtn = document.getElementById('submitBtn');


            const addNewRoleBtn = document.getElementById('addNewRole');

            // Add change event listeners to role checkboxes for updating Select All button
            roleCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', updateSelectAllState);
            });

            // Select All functionality for roles
            if (selectAllRoles) {
                selectAllRoles.addEventListener('click', function(e) {
                    e.preventDefault(); // Prevent form submission

                    // Check if all checkboxes are currently checked
                    const allChecked = [...roleCheckboxes].every(cb => cb.checked);

                    // Toggle all checkboxes based on current state
                    roleCheckboxes.forEach(checkbox => {
                        checkbox.checked = !allChecked;
                    });

                    updateSelectAllState();
                });
            }

            // Update Select All button text based on state
            function updateSelectAllState() {
                if (selectAllRoles) {
                    const allChecked = [...roleCheckboxes].every(cb => cb.checked);

                    if (allChecked) {
                        selectAllRoles.innerHTML = '<i class="fas fa-times-square me-1"></i> Deselect All';
                        selectAllRoles.classList.remove('btn-outline-primary');
                        selectAllRoles.classList.add('btn-outline-secondary');
                    } else {
                        selectAllRoles.innerHTML = '<i class="fas fa-check-square me-1"></i> Select All';
                        selectAllRoles.classList.remove('btn-outline-secondary');
                        selectAllRoles.classList.add('btn-outline-primary');
                    }
                }
            }

            // Reset form handler
            function resetForm() {
                roleForm.reset();
                roleIdInput.value = '';
                updateSelectAllState();
            }

            // Add event listeners
            resetBtn.addEventListener('click', resetForm);

            // Add New Role button functionality
            addNewRoleBtn.addEventListener('click', function() {
                resetForm();
                roleForm.scrollIntoView({ behavior: 'smooth' });
            });


            submitBtn.addEventListener("click",(e)=>{
                e.preventDefault();
                                // Form validation
                                if (!roleNameInput.value.trim()) {
                                    alert('Please enter a role name');
                                    return;
                                }

                                const selectedRoles = Array.from(roleCheckboxes)
                                    .filter(checkbox => checkbox.checked)
                                    .map(checkbox => checkbox.value);

                                if (selectedRoles.length === 0) {
                                    alert('Please select at least one role');
                                    return;
                                }

                                // For demo purposes, just show an alert with selected roles
                                alert(`Role "${roleNameInput.value}" saved successfully with roles: ${selectedRoles.join(', ')}`);

                                // In a real application, you would submit to server here
                                // this.submit();

                                  fetch("/api/employeeroles" , {
                                      method: "POST" ,
                                      headers: {
                                      "Content-Type": "application/json"
                                  },
                                  body : JSON.stringify ({
                                  name: roleNameInput.value,
                                  roles: selectedRoles
                                  })
                                  })
                                  .then(response => {
                                   if (!response.ok) {
                                   throw new Error("Failed to save data");
                                   }
                                   return response.json();
                            })


            })

            // Edit button functionality
            const editButtons = document.querySelectorAll('.btn-outline-primary');
            editButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const row = this.closest('tr');
                    const roleName = row.querySelector('td:nth-child(2)').textContent;
                    const modules = row.querySelector('td:nth-child(3)').textContent.split(', ');

                    // Populate form for editing
                    document.getElementById('roleId').value = row.querySelector('td:first-child').textContent;
                    document.getElementById('roleName').value = roleName;

                    // Map module names to role checkboxes (this is a simple example)
                    const moduleToRoleMap = {
                        'Employee': 'General Employee',
                        'Deliveryman': 'Driver',
                        'Service': 'Service Man',
                        'Technical': 'Technician',
                        'Management': 'Manager'
                    };

                    // Reset all role checkboxes
                    roleCheckboxes.forEach(checkbox => {
                        // Check for exact matches or partial matches in the modules
                        checkbox.checked = modules.some(module =>
                            module === checkbox.value ||
                            Object.entries(moduleToRoleMap).some(([key, val]) =>
                                module.includes(key) && val === checkbox.value
                            )
                        );
                    });

                    // Update select all state
                    updateSelectAllState();

                    // Scroll to form
                    document.getElementById('roleForm').scrollIntoView({ behavior: 'smooth' });
                });
            });

            // Initialize select all state
            updateSelectAllState();

            // Add role table functionality
            const searchInput = document.getElementById('searchInput');
            const searchBtn = document.getElementById('searchBtn');

            if (searchBtn) {
                searchBtn.addEventListener('click', function() {
                    const searchText = searchInput.value.toLowerCase();
                    const tableRows = document.querySelectorAll('tbody tr');

                    tableRows.forEach(row => {
                        const roleCell = row.querySelector('td:nth-child(2)');
                        const roleText = roleCell.textContent.toLowerCase();

                        if (roleText.includes(searchText)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });
            }

            // Export functionality (placeholder)
            const exportBtn = document.getElementById('exportBtn');
            if (exportBtn) {
                exportBtn.addEventListener('click', function() {
                    alert('Export functionality would be implemented here');
                });
            }

            // Delete button functionality
            const deleteButtons = document.querySelectorAll('.btn-outline-danger');
            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const row = this.closest('tr');
                    const roleName = row.querySelector('td:nth-child(2)').textContent;

                    if (confirm(`Are you sure you want to delete the role '${roleName}'?`)) {
                        // In a real application, you would send a delete request to the server
                        row.remove();
                    }
                });
            });



            document.addEventListener("DOMContentLoaded", function () {
                fetch("/api/employeeroles")
                    .then(response => response.json())
                    .then(data => {
                        console.log("data",data)
                        const tableBody = document.getElementById("employeeRoleTableBody");
                        tableBody.innerHTML = "";

                        data.forEach((role, index) => {
                            const row = document.createElement("tr");

                            row.innerHTML = `
                                <td>${index + 1}</td>
                                <td>${role.name}</td>
                                <td>${role.roles.join(", ")}</td>
                                <td>${formatDate(role.createdAt)}</td>

                                <td class="text-center">
                                       <button class="btn btn-sm btn-outline-primary me-1" title="Edit">
                                          <i class="fas fa-edit"></i>
                                             </button>
                                      <button class="btn btn-sm btn-outline-danger" title="Delete">
                                         <i class="fas fa-trash-alt"></i>
                                          </button>
                                </td>

                            `;
                            tableBody.appendChild(row);
                        });
                    })
                    .catch(err => console.error("Error loading roles:", err));
            });

            function formatDate(dateStr) {
                if (!dateStr) return "-";
                const date = new Date(dateStr);
                return date.toLocaleDateString("en-GB"); // format: dd-mm-yyyy
            }







