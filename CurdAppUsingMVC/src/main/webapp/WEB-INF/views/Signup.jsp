<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href='<c:url value="resources/css/signup.css"></c:url>'>
<script>
    // Function to validate the registration form
    function validateForm() {
        var name = document.forms["registrationForm"]["name"].value;
        var email = document.forms["registrationForm"]["email"].value;
        var contact = document.forms["registrationForm"]["contact"].value;
        var address = document.forms["registrationForm"]["address"].value;
        var password = document.forms["registrationForm"]["password"].value;
        var confirmPassword = document.forms["registrationForm"]["pass"].value;
        
        // Regular expressions for validation
        var nameRegex = /^[a-zA-Z\s]+$/;
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var phoneRegex = /^\d{10}$/; // Assuming 10-digit phone number
        
        if (!nameRegex.test(name)) {
            alert("Please enter a valid name. Only letters and spaces are allowed.");
            return false;
        }
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }
        if (!phoneRegex.test(contact)) {
            alert("Please enter a valid phone number. It should be 10 digits.");
            return false;
        }
        if (address.trim() === "") {
            alert("Address cannot be empty.");
            return false;
        }
        if (password.length < 6) { // Example password length validation
            alert("Password must be at least 6 characters long.");
            return false;
        }
        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
	<div class="container">
		<div class="title">Registration</div>
		<div class="content">
			<form name="registrationForm" action="custdata" method="get" onsubmit="return validateForm()">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Full Name</span>
						<input type="text" name="name" value="" placeholder="Enter your name" required>
					</div>
					<div class="input-box">
						<span class="details">Email</span>
						<input type="text" name="email" value="" placeholder="Enter your email" required>
					</div>
					<div class="input-box">
						<span class="details">Phone Number</span>
						<input type="text" name="contact" value="" placeholder="Enter your number" required>
					</div>
					<div class="input-box">
						<span class="details">Address</span>
						<input type="text" name="address" value="" placeholder="Enter your Address" required>
					</div>
					<div class="input-box">
						<span class="details">Password</span>
						<input type="password" name="password" value="" placeholder="Enter your Password" required>
					</div>
					<div class="input-box">
						<span class="details">Confirm Password</span>
						<input type="password" name="pass" value="" placeholder="ReEnter Password" required>
					</div>
				</div>
				<div class="button">
					<input type="submit" name="submit" value="Register">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
