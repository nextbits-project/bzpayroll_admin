<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <style>

        table {
            border-collapse: collapse;
            width: 20%;
        }
        th ,td{
            border: 1px solid #aaa;
            text-align: left;
        }
    </style>
</head>
<body>

<h2>Employee List</h2>

<form id="employeeForm">
    <table id="employeeTable">
        <thead>
        <tr>
            <th>EmployeeList Name</th>
        </tr>
        </thead>
        <tbody>
        <!-- JavaScript will populate rows here -->

        </tbody>
    </table>
</form>

<script>
    fetch('/api/getemployeeList')
        .then(async (response) => {
            if (!response.ok) {
                throw new Error("Failed to fetch employee data: " + response.status);
            }
            const listOfEmployee = await response.json()

            const tableBody = document.querySelector("#employeeTable tbody");

            listOfEmployee.forEach((item)=>{
               console.log(item.firstName,item.lastName)

               const row = document.createElement("tr");

              const fullNameCell = document.createElement("td");
              const fullName = item.firstName +"  "+ item.lastName;
              fullNameCell.textContent = fullName;

              row.appendChild(fullNameCell);
               tableBody.appendChild(row);



            });
        });
</script>

</body>
</html>
