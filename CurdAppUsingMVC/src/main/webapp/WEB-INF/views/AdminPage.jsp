<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
}

.sidebar {
	width: 250px;
	background-color: #2c3e50;
	color: white;
	height: 100vh;
	padding-top: 20px;
	position: fixed;
}

.sidebar h2 {
	text-align: center;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	color: white;
	padding: 15px;
	text-decoration: none;
	margin: 5px 0;
}

.sidebar a:hover {
	background-color: #34495e;
}

.main-content {
	margin-left: 250px;
	padding: 20px;
	width: 100%;
}

.navbar {
	background-color: #ecf0f1;
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: fixed;
	width: calc(100% - 250px);
	top: 0;
	left: 250px;
	z-index: 1;
}

.navbar h1 {
	margin: 0;
}

.profile-icon {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #bdc3c7;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 30px;
}

.content {
	margin-top: 60px;
}

.box-container {
	display: flex;
	justify-content: space-around;
	margin-top: 20px;
}

.box {
	background-color: #ecf0f1;
	padding: 20px;
	border-radius: 5px;
	width: 30%;
	text-align: center;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.box h2 {
	margin: 0;
	font-size: 24px;
}

.box p {
	margin: 10px 0 0;
	font-size: 18px;
}
</style>
</head>
<body>
	<div class="sidebar">
		<a href="adminpage">DashBoard</a> 
		<a href="add_vendor">Add Vendor</a>
		<a href="viewvendor">View Vendor</a> 
		<a href="add_product">Add Product</a> 
		<a href="viewproduct">View Product</a>
	</div>
	<div class="main-content">
		<div class="navbar">
			<h1>Admin Dashboard</h1>
			<div class="profile-icon dropdown">
				<i class="bi bi-person"></i>
			</div>
		</div>
		<div class="content">
			<div class="box-container">
				<div class="box">
					<h2>Total Orders</h2>
					<p>1234</p>
				</div>
				<div class="box">
					<h2>Total Deliveries</h2>
					<p>567</p>
				</div>
				<div class="box">
					<h2>Income</h2>
					<p>$7890</p>
				</div>
			</div>
		</div>
</body>
</html>