<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Registered Users</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #eef2f7; /* subtle blue background */
        padding: 20px;
    }
    h2 {
        text-align: center;
        color: #2c3e50; /* darker header color */
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        border-radius: 6px;
        overflow: hidden;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #27ae60; /* green header */
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .refresh-btn {
        display: block;
        margin: 20px auto;
        background-color: #27ae60; /* green button */
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: 0.2s;
    }
    .refresh-btn:hover {
        background-color: #1e8449;
    }
    /* Responsive table for small screens */
    @media (max-width: 600px) {
        table, th, td {
            font-size: 14px;
        }
        th, td {
            padding: 8px;
        }
    }
</style>
</head>
<body>

<h2>Registered Users List</h2>
<table id="usersTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Contact Number</th>
        </tr>
    </thead>
    <tbody>
	    <s:if test="users != null && !users.isEmpty()">
	        <s:iterator value="users">
	            <tr>
	                <td><s:property value="id" /></td>
	                <td><s:property value="firstName" /></td>
	                <td><s:property value="lastName" /></td>
	                <td><s:property value="email" /></td>
	                <td><s:property value="mobile" /></td>
	            </tr>
	        </s:iterator>
	    </s:if>
	    <s:else>
	        <tr>
	            <td colspan="5" style="text-align:center;">No records found</td>
	        </tr>
	    </s:else>
	</tbody>
</table>

<a href="viewUsers.action">
    <button class="refresh-btn" type="button">Refresh</button>
</a>

<!-- <button class="refresh-btn">Refresh</button> -->

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
    /* $(document).ready(function(){
        $(".refresh-btn").click(function(){
            $.ajax({
                url: 'UserAction_fetchUsers', // your action URL
                method: 'GET',
                success: function(data){
                    // Replace table body with new data
                    $("#usersTable tbody").html($(data).find("#usersTable tbody").html());
                },
                error: function(err){
                    alert("Error fetching users");
                }
            });
        });
    }); */
</script>


</body>
</html>
