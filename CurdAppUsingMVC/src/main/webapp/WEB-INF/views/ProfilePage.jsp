<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Profile Page</title>
  <style>
        .form-container {
            max-width: 600px;
            margin: 20px auto;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
    <div class="container">
        <h1 class="my-4">Profile Page</h1>

        <div class="form-container">
            <form action="updateprofile" method="post">
             	<div class="form-group">
                    <input type="hidden" name="id" class="form-control" value="${userData.getId()}" />
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" class="form-control" value="${userData.getName()}" />
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" class="form-control" value="${userData.getAddress()}" />
                </div>
                <div class="form-group">
                    <label for="contact">Contact</label>
                    <input type="text" id="contact" name="contact" class="form-control" value="${userData.getContact()}" />
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" value="${userData.getEmail()}" />
                </div>
                <button type="submit" class="btn btn-primary mt-2">Update Profile</button>
            </form>
        </div>

        <div class="form-container mt-4">
            <h2>Change Password</h2>
            <form action="" method="post">
                <div class="form-group">
                    <label for="oldPassword">Old Password</label>
                    <input type="password" id="oldPassword" name="oldPassword" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary mt-2">Change Password</button>
            </form>
        </div>
        
        <div class="form-container mt-4">
            <form action="logout" method="get">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </div>
</body>
</html>
