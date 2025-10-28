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

<div class="form-container">
    <h2>Student Registration</h2>
    
    <div class="form-group">
        <label for="fullname">Full Name *</label>
        <input type="text" id="fullname" placeholder="Please Enter Full Name">
    </div>
    
    <div class="inline-group">
        <div class="form-group">
            <label for="gender">Gender *</label>
            <select id="gender">
			    <option value="">Select Gender</option> <!-- value="" is crucial -->
			    <option value="Male">Male</option>
			    <option value="Female">Female</option>
			    <option value="Other">Other</option>
			</select>
        </div>
        
        <div class="form-group">
            <label for="email">Email ID *</label>
            <input type="email" id="email" placeholder="Please Enter Email Id">
        </div>
    </div>
    
    <div class="form-group">
        <label for="contact">Contact Number *</label>
        <div class="inline-group">
            <select>
                <option>+91</option>
                <option>+1</option>
                <option>+44</option>
            </select>
            <input type="text" placeholder="Please Enter Contact Number">
        </div>
    </div>
    
    <div class="checkbox-group">
        <input type="checkbox" id="infoCorrect">
        <label for="infoCorrect">I hereby confirm that the information provided above is true and correct to the best of my knowledge.*</label>
    </div>
    
    <div class="buttons">
        <button class="btn-submit">Submit</button>
        <button class="btn-cancel">Cancel</button>
    </div>
</div>
<script src="js/config.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script>
$(document).ready(function() {
    $(".btn-submit").click(function(e) {
        e.preventDefault();

        if ($("#fullname").val().trim() === "") {
            alert("Please enter Full Name");
            $("#fullname").focus();
            return false;  // stop form submission or AJAX call
        }
        
        if ($("#gender").val().trim() === "") {
            alert("Please Select Gender");
            $("#gender").focus();
            return false;  // stop form submission or AJAX call
        }
        
        if ($("#email").val().trim() === "") {
            alert("Please enter Email ID");
            $("#email").focus();
            return false;  // stop form submission or AJAX call
        }
        
        let student = {
        	    fullName: $("#fullname").val(),
        	    gender: $("#gender").val(),
        	    email: $("#email").val(),
        	    contactNumber: $("input[placeholder='Please Enter Contact Number']").val()
        	};

        	$.ajax({
        	    url: window.APP_CONFIG.API_BASE_URL + "/api/students/addStudents",
        	    type: "POST",
        	    data: JSON.stringify(student),
        	    contentType: "application/json",  // important
        	    success: function(response) {
        	        alert(response);
        	        // Clear form fields
        	        $("#fullname").val('');
        	        $("#gender").val('');
        	        $("#email").val('');
        	        $("input[placeholder='Please Enter Contact Number']").val('');
        	        $("#infoCorrect").prop('checked', false);
        	        window.location.href = "viewStudents";
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
