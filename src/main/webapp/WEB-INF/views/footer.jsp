<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Footer</title>
<style>
    html, body {
        height: 100%;
        margin: 0;
        display: flex;
        flex-direction: column;
    }

    footer {
        background-color: #1E90FF;
        color: white;
        text-align: center;
        padding: 15px 20px;
        font-family: Arial, sans-serif;
        font-size: 14px;
        box-shadow: 0 -2px 5px rgba(0,0,0,0.2);
        margin-top: auto; /* pushes footer to bottom */
    }

    footer a {
        color: white;
        text-decoration: none;
        font-weight: bold;
    }

    footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<footer>
    © 2025 <a href="#">Student Data Management System</a>
</footer>

</body>
</html>
