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

textarea.form-control {
	resize: vertical;
}
</style>
</head>
<body>

	<jsp:include page="AdminPage.jsp"></jsp:include>
	<div class="container mt-5 form-container">
		<h2 class="text-center mb-4">Add Product</h2>
		<form action="addproduct" method="get" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="vendor">Vendor</label>
						<div class="input-group">
							<select id="vendor" name="vendor" class="form-control form-control-sm">
								<option value="">Select Vendor</option>
								<c:forEach var="vendor" items="${vendordata}">
									<option value="${vendor.getId()}">${vendor.getVendorname()}</option>
								</c:forEach>
							</select>
							<div class="input-group-append">
								<a href="add_vendor" class="btn btn-outline-secondary btn-sm">
									<img src="<c:url value='/resources/images/plus.png' />" alt="Add Vendor">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="category">Category</label>
						<div class="input-group">
							<select id="category" name="category" class="form-control form-control-sm">
								<option value="">Select Category</option>
								<c:forEach var="category" items="${categorydata}">
									<option value="${category.getId()}">${category.getCategoryname()}</option>
								</c:forEach>
							</select>
							<div class="input-group-append">
								<a href="add_category" class="btn btn-outline-secondary btn-sm">
									<img src="<c:url value='/resources/images/plus.png' />" alt="Add Category">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="product">Sub Category</label>
						<div class="input-group">
							<select id="product" name="product" class="form-control form-control-sm">
								<option value="0">Select Product</option>
								<c:forEach var="product" items="${subcatdata}">
									<option value="${product.getId()}">${product.getName()}</option>
								</c:forEach>
							</select>
							<div class="input-group-append">
								<a href="subcategory" class="btn btn-outline-secondary btn-sm">
									<img src="<c:url value='/resources/images/plus.png' />" alt="Add Product">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="price">Price</label>
						<input type="text" id="price" name="price" class="form-control form-control-sm" placeholder="Enter your Price" required>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="quantity">Quantity</label>
						<input type="text" id="quantity" name="quantity" class="form-control form-control-sm" placeholder="Enter your Quantity" required>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="date">MF Date</label>
						<input type="date" id="date" name="date" class="form-control form-control-sm" required>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="form-group">
						<label for="image">Product Image URL</label>
						<input type="text" id="image" name="prourl" value="" class="form-control form-control-sm">
					</div>
				</div>
				<div class="col-md-12 mb-3">
					<div class="form-group">
						<label for="description">Description</label>
						<textarea id="description" name="description" class="form-control form-control-sm" rows="4" placeholder="Enter product description" required></textarea>
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary btn-sm">Add Product</button>
			<div class="mt-3">
				<span>${msg}</span>
			</div>
		</form>
	</div>
</body>
</html>
