<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GadgetGalaxy</title>
</head>
<body>
   <jsp:include page="home.jsp"></jsp:include>
    <!-- Slider -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<c:url value="/resources/images/cropped.jpg" />" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="<c:url value="/resources/images/cropped (1).jpg" />" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="<c:url value="/resources/images/cropped (2).jpg" />" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Cards -->
    <div id="cardCarousel" class="carousel slide my-5" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <img src="<c:url value="/resources/images/phone.jpeg" />" class="card-img-top" alt="Fan">
                                <div class="card-body">
                                    <h5 class="card-title">Phone & Accessories</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="productlist?cname=mobile computing" class="btn btn-primary">Shop More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="<c:url value="/resources/images/Tv.webp" />" class="card-img-top" alt="TV">
                                <div class="card-body">
                                    <h5 class="card-title">TV & Laptop</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="productlist?cname=laptop & computer" class="btn btn-primary">Shop More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="<c:url value="/resources/images/refrigerator.jpg" />" class="card-img-top" alt="Phone">
                                <div class="card-body">
                                    <h5 class="card-title">Home Appliances</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="productlist?cname=Home Appliances" class="btn btn-primary">Shop More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Add more carousel items here if needed -->
           
        </div>
    </div>
    

    <!-- Footer -->
    <footer class="bg-light text-center text-lg-start">
        <div class="container p-4">
            <div class="row">
                <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                    <h5 class="text-uppercase">Footer Content</h5>
                    <p>
                    	Make Your Life Easy With Electronics 
                    </p>
                </div>
                <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                    <h5 class="text-uppercase">Query Form</h5>
                    <form>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Query</label>
                            <textarea class="form-control" id="exampleInputPassword1"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="text-center p-3">
            <a href="#" class="text-dark me-4"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="text-dark me-4"><i class="fab fa-twitter"></i></a>
            <a href="#" class="text-dark me-4"><i class="fab fa-google"></i></a>
            <a href="#" class="text-dark me-4"><i class="fab fa-instagram"></i></a>
            <a href="#" class="text-dark me-4"><i class="fab fa-linkedin"></i></a>
            <a href="#" class="text-dark me-4"><i class="fab fa-github"></i></a>
        </div>
    </footer>
</body>
</html>
