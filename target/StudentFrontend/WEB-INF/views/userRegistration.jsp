<%@ taglib prefix="s" uri="/struts-tags" %>
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

<style>
    /* Unique Struts 2 form styling */
    .s2-form-container {
        max-width: 700px;
        margin: 30px auto;
        background: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.1);
    }

    .s2-form-container h2 {
        text-align: center;
        color: #222;
        margin-bottom: 20px;
    }

    .s2-form-row {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .s2-form-row label {
        flex: 0 0 150px; /* label width */
        font-weight: bold;
    }

    .s2-textfield {
        flex: 1;
        padding: 8px 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size: 14px;
    }

    .s2-buttons {
        display: flex;
        gap: 10px;
        justify-content: flex-start;
        margin-top: 15px;
    }

    .s2-btn-submit {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        background-color: #28a745;
        color: white;
    }

    .s2-btn-cancel {
        padding: 10px 20px;
        border: 2px solid #28a745;
        border-radius: 5px;
        background-color: white;
        color: #28a745;
        cursor: pointer;
        font-weight: bold;
    }
    
.error {
    color: red;
    font-size: 0.875em;
    display: block;
    margin-top: 4px;
}
.s2-textfield.invalid {
    border: 1px solid red;
}
</style>
</head>
<body>

<div class="s2-form-container">
    <h2>User Registration</h2>      
        
        <s:form id="userForm" action="UserAction" method="post">
		    <div class="s2-form-row">
		        <s:textfield name="firstName" id="firstName" label="First Name" placeholder="Enter First Name" cssClass="s2-textfield"/>
		        <s:fielderror fieldName="firstName" cssClass="error" id="firstNameError"/>
		    </div>
		
		    <div class="s2-form-row">
		        <s:textfield name="lastName" id="lastName" label="Last Name" placeholder="Enter Last Name" cssClass="s2-textfield"/>
		        <s:fielderror fieldName="lastName" cssClass="error" id="lastNameError"/>
		    </div>
		
		    <div class="s2-form-row">
		        <s:textfield name="email" id="email" label="Email" placeholder="Enter Email" cssClass="s2-textfield"/>
		        <s:fielderror fieldName="email" cssClass="error" id="emailError"/>
		    </div>
		
		    <div class="s2-form-row">
		        <s:textfield name="mobile" id="mobile" label="Mobile" placeholder="Enter Mobile Number" cssClass="s2-textfield"/>
		        <s:fielderror fieldName="mobile" cssClass="error" id="mobileError"/>
		    </div>
		
		    <div class="s2-buttons">
		        <s:submit value="Submit" cssClass="s2-btn-submit"/>
		        <s:reset value="Cancel" cssClass="s2-btn-cancel"/>
		    </div>
		</s:form>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
$(document).ready(function() {
    $("#userForm").on("submit", function(event) {
        let isValid = true;

        function validateField(id, pattern = null, message = "This field is required") {
            const field = $("#" + id);
            const error = $("#" + id + "Error");
            let value = field.val().trim();

            if (!value) {
                error.text(message);
                field.addClass("invalid");
                isValid = false;
                return;
            }

            if (pattern && !pattern.test(value)) {
                error.text(message);
                field.addClass("invalid");
                isValid = false;
                return;
            }

            error.text("");
            field.removeClass("invalid");
        }

        validateField("firstName", null, "First Name is required");
        validateField("lastName", null, "Last Name is required");
        validateField("email", /^[^\s@]+@[^\s@]+\.[^\s@]+$/, "Invalid email address");
        validateField("mobile", /^[0-9]{10}$/, "Enter a valid 10-digit mobile number");

        if (!isValid) event.preventDefault();
    });

    $(".s2-textfield").on("input", function() {
        $(this).removeClass("invalid");
        $("#" + this.id + "Error").text("");
    });
});
</script>

</body>
</html>
