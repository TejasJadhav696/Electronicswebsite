<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>
<style>
.form-container {
	max-width: 600px;
	margin: auto;
	padding: 20px;
}

.form-group {
	margin-bottom: 1rem;
}

.input-group-append img {
	width: 16px;
}

.btn-sm {
	font-size: 0.875rem;
	padding: 0.25rem 0.5rem;
}

.form-control-sm {
	font-size: 0.875rem;
	padding: 0.25rem 0.5rem;
}
</style>
</head>
<body>

	<jsp:include page="AdminPage.jsp"></jsp:include>
	<div class="container mt-5 form-container">
		<h2 class="text-center mb-4">Add Product</h2>
		<form action="updateproduct" method="get" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<input type="hidden" name="vendor"
							class="form-control form-control-sm" value="${updpro.getVendor()}" >

					</div>
				</div>


				<div class="col-md-6 mb-3">
					<div class="form-group">
						<input type="hidden" name="category"
							class="form-control form-control-sm" value="${updpro.getCategory()}" >
					</div>
				</div>

				<div class="col-md-6 mb-3">
					<div class="form-group">
						<input type="hidden" name="product"
							class="form-control form-control-sm" value="${updpro.getProduct()}" >
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="price">Price</label> <input type="text" id="price"
							name="price" class="form-control form-control-sm" value="${updpro.getPrice()}"
							placeholder="Enter your Price" >
					</div>
				</div>



				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="quantity">Quantity</label> <input type="text"
							id="quantity" name="quantity" class="form-control form-control-sm"
							placeholder="Enter your Quantity" value="${updpro.getQuantity()}" >
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="date">MF Date</label> <input type="date" id="date"
							name="date" class="form-control form-control-sm" value="${updpro.getDate()}" >
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-sm">Update
				Product</button>
			<div class="mt-3">
				<span>${msg}</span>
			</div>
		</form>
	</div>
	</div>
</body>
</html>
