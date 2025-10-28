<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        padding: 20px;
    }
    .form-container {
        max-width: 700px;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
        color: #333;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"], input[type="email"], select {
        width: 100%;
        padding: 8px 10px;
        border-radius: 4px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    .inline-group {
        display: flex;
        gap: 10px;
    }
    .inline-group > div {
        flex: 1;
    }
    .checkbox-group {
        margin-bottom: 15px;
    }
    .checkbox-group input {
        margin-right: 5px;
    }
    .buttons {
        display: flex;
        gap: 10px;
    }
    button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }
    .btn-submit {
        background-color: orange;
        color: white;
    }
    .btn-cancel {
        background-color: white;
        border: 2px solid orange;
        color: orange;
    }
    .note {
        color: #d9534f;
        font-size: 14px;
        margin-top: 15px;
    }
</style>
</head>
<body>

<div>
	<h2>This is the Home Page</h2>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script>
$(document).ready(function() {
    $(".btn-submit").click(function(e) {
        e.preventDefault();

        let formData = new FormData();
        formData.append("fullName", $("#fullname").val());
        formData.append("gender", $("#gender").val());
        formData.append("email", $("#email").val());
        formData.append("contactNumber", $("input[placeholder='Please Enter Contact Number']").val());

        $.ajax({
            url: "http://localhost:8080/api/students/addStudents",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                alert(response);
             // Clear form fields
                $("#fullname").val('');
                $("#gender").val('Select Gender');
                $("#email").val('');
                $("input[placeholder='Please Enter Contact Number']").val('');
                $("#infoCorrect").prop('checked', false);
            },
            error: function(err) {
                console.error(err);
                alert("Something went wrong while submitting the form.");
            }
        });
    });
});
</script>

</body>
</html>
