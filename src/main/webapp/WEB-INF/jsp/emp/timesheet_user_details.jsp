<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Details</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ffffff;
            padding: 30px 40px;
        }

        .title-bar {
            font-size: 20px;
            margin-bottom: 30px;
            font-weight: normal;
            color: #444;
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 120px;
            row-gap: 25px;
            font-size: 15px;
        }

        .label {
            color: #999;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .value {
            font-size: 17px;
            color: #222;
        }

        .input-box {
            font-size: 16px;
            padding: 6px;
            margin-top: 5px;
            width: 200px;
        }
    </style>
</head>

<body>

    <div class="title-bar">June</div>

    <div class="grid">
        <div>
            <div class="label">Name</div>
            <div class="value">June Lee</div>
        </div>

        <div>
            <div class="label">Nickname</div>
            <div class="value">June</div>
        </div>

        <div>
            <div class="label">Role</div>
            <div class="value">Admin</div>
        </div>

        <div>
            <div class="label">Passcode</div>
            <div class="value">4288</div>
        </div>
    </div>

    <div style="margin-top:40px;"></div>

    <div class="label">Date</div>
    <input type="text" id="date" class="input-box" readonly>

    <div class="label">Start Time (Press F10)</div>
    <input type="text" id="startTime" class="input-box" readonly>

    <div class="label">End Time (Press ESC)</div>
    <input type="text" id="endTime" class="input-box" readonly>

    <!-- Save API Script -->
    <script>
        function saveTimesheet() {
            const date = document.getElementById("date").value;
            const startTime = document.getElementById("startTime").value;
            const endTime = document.getElementById("endTime").value;

            const params = "date=" + date + "&startTime=" + startTime + "&endTime=" + endTime;

            fetch("/api/save-timesheet-user-details?" + params, {
                method: "POST"
            })
            .then(response => response.text())
            .then(message => {
                alert(message);
                // After successful save → clear fields
                document.getElementById("date").value = "";
                document.getElementById("startTime").value = "";
                document.getElementById("endTime").value = "";
            });
        }
    </script>

    <!-- Key Event Script -->
    <script>
        function getFormattedDateTime() {
            const now = new Date();

            return {
                date: now.toISOString().split("T")[0],         // yyyy-MM-dd
                time: now.toTimeString().substring(0, 5)       // HH:mm
            };
        }

        document.addEventListener("keydown", function(event) {

            // F10 = 121
            if (event.which === 121) {
                    event.preventDefault(); // stop browser default F10 behavior

                    // Ask for passcode
                    const passcode = prompt("Enter passcode:");

                    // Check passcode (change as per your requirement)
                    const correctPasscode = "1234";

                    if (passcode === correctPasscode) {

                        const now = getFormattedDateTime();
                        document.getElementById("date").value = now.date;
                        document.getElementById("startTime").value = now.time;

                        // If you want auto-save, uncomment:
                        // saveTimesheet();

                    } else {
                        alert("Invalid passcode!");
                    }
                }

            // ESC = 27
             if (event.which === 27) {
                    event.preventDefault();

                    const passcode = prompt("Enter passcode:");
                    const correctPasscode = "1234";

                    if (passcode === correctPasscode) {

                        const now = getFormattedDateTime();
                        document.getElementById("endTime").value = now.time;

                        saveTimesheet(); // Save immediately

                    } else {
                        alert("Invalid passcode!");
                    }
                }
        });
    </script>

</body>
</html>
