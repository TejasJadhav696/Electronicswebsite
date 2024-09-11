<%@page import="org.techhub.CurdAppUsingMVC.model.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
<style>
    .card-img-top {
        height: 150px;
        object-fit: cover;
    }

    .card-title {
        font-size: 16px;
        font-weight: bold;
    }

    .btn {
        font-size: 14px;
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
        padding-top: 20px;
    }

    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 15px;
        border: 1px solid #888;
        width: 50%;
        max-width: 500px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 24px;
        font-weight: bold;
    }

    .close:hover, .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-img {
        width: 100%;
        height: auto;
        max-height: 200px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-group input, .form-group textarea {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
</style>
</head>
<body>
    <jsp:include page="home.jsp"></jsp:include>
    <div class="container mt-3">
        <div class="row">
            <%
            List<ProductModel> list = (List<ProductModel>) request.getAttribute("productlist");
            for (ProductModel model : list) {
                VendorModel venmodel = model.getVendormodel();
                SubCatModel submodel = model.getModel();
            %>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <img src="<%=model.getProurl()%>" class="card-img-top" alt="Product Image">
                    <div class="card-body text-center">
                        <h5 class="card-title"><%=submodel.getName()%></h5>
                        <p>Price: Rs <%=model.getPrice()%></p>
                        <div class="d-flex flex-column">
                            <button class="btn btn-danger mb-1" onclick="openModal('<%=submodel.getId()%>', '<%=submodel.getName()%>', '<%=model.getDescription()%>', '<%=model.getProurl()%>', '<%=model.getPrice()%>')">Buy Now</button>
                            <button class="btn btn-success mb-1">Add to Cart</button>
                            <button class="btn btn-primary">View More</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>

    <div id="productModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            
            <img id="modalImg" class="modal-img" src="" alt="Product Image">
            <h2 id="modalTitle"></h2>
            <p id="modalDescription"></p>
            <p id="modalPrice"></p>
            <form id="purchaseForm">
                <div class="form-group">
                    <label for="quantityInput">Quantity:</label>
                    <input id="quantityInput" type="number" min="1" value="1">
                </div>
                <div class="form-group">
                    <label for="addressInput">Shipping Address:</label>
                    <textarea id="addressInput" rows="4" placeholder="Enter your shipping address apartment no, road no, city, State, pin code"></textarea>
                </div>
                <button type="button" id="buyNowButton" class="btn btn-danger">Buy Now</button>
                <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            window.openModal = function(id, name, description, img, price) {
                document.getElementById('modalTitle').innerText = name;
                document.getElementById('modalDescription').innerText = description;
                document.getElementById('modalImg').src = img;
                document.getElementById('modalPrice').innerText = "Price: Rs" + price;
                document.getElementById('buyNowButton').setAttribute('data-product-id', id);
                document.getElementById('productModal').style.display = "block";
            }

            window.closeModal = function() {
                document.getElementById('productModal').style.display = "none";
                swal("error!","You cancelled the order","error");
            }

            window.onclick = function(event) {
                if (event.target === document.getElementById('productModal')) {
                    closeModal();
                }
            }
        });
    </script>
</body>
</html>
