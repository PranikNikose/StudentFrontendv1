<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Registered Students</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        padding: 20px;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: orange;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .refresh-btn {
        display: block;
        margin: auto;
        background-color: orange;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }
    .refresh-btn:hover {
        background-color: #e69500;
    }
</style>
</head>
<body>

<h2>Registered Students List</h2>
<table id="studentsTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Contact Number</th>
        </tr>
    </thead>
    <tbody>
        <!-- Student rows will be added dynamically here -->
    </tbody>
</table>
<script src="js/config.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
$(document).ready(function() {
	
    function loadStudents() {
        $.ajax({
        	url: window.APP_CONFIG.API_BASE_URL + "/api/students/getStudents",
            type: "GET",
            success: function(data) {
                const tbody = $("#studentsTable tbody");
                tbody.empty(); // clear old rows

                if (data.length === 0) {
                    tbody.append("<tr><td colspan='5' style='text-align:center;'>No records found</td></tr>");
                    return;
                }

                data.forEach(function(s) {
                    tbody.append(
                        "<tr>" +
                            "<td>" + (s.id || '') + "</td>" +
                            "<td>" + (s.fullName || '') + "</td>" +
                            "<td>" + (s.gender || '') + "</td>" +
                            "<td>" + (s.email || '') + "</td>" +
                            "<td>" + (s.contactNumber || '') + "</td>" +
                        "</tr>"
                    );
                });
            },
            error: function(err) {
                console.error(err);
                alert("Error loading student data.");
            }
        });
    }

    // Load data initially
    loadStudents();

    // Refresh on button click
    $(".refresh-btn").click(loadStudents);
});
</script>

</body>
</html>
