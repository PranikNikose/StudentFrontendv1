<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<style>
    /* Reset some default styles */
    body, h1, ul, li {
        margin: 0;
        padding: 0;
    }

    /* Header container */
    header {
        background-color: #1E90FF; /* Dodger Blue */
        color: white;
        padding: 15px 30px;
        font-family: Arial, sans-serif;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    /* Logo / Title */
    header h1 {
        display: inline-block;
        font-size: 24px;
    }

    /* Navigation bar */
    nav {
        display: inline-block;
        float: right;
    }

    nav ul {
        list-style: none;
    }

    nav ul li {
        display: inline-block;
        margin-left: 20px;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        padding: 5px 10px;
        transition: background-color 0.3s, color 0.3s;
        border-radius: 5px;
    }

    nav ul li a:hover {
        background-color: white;
        color: #1E90FF;
    }
</style>
</head>
<body>
    <header>
        <h1>Student Data Management System</h1>
        <nav>
            <ul>
                <li><a href="home">Home</a></li>
                <li><a href="registration">Student Register</a></li>
                <li><a href="viewStudents">View Students</a></li>
                <!-- <li><a href="userRegistration">User Registration</a></li>
                <li><a href="viewUsers">View User</a></li> -->
            </ul>
        </nav>
    </header>
</body>
</html>
