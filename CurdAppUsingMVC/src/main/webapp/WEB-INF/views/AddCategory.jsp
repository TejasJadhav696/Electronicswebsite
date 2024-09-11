<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="AdminPage.jsp"></jsp:include>
        
        <div class="row mt-5">
            <div class="col-md-8 offset-md-2">
                <!-- Form -->
                <form action="addcategory" method="get">
                    <div class="form-group">
                        <label for="vendorname">Category Name*</label>
                        <input type="text" id="categoryname" name="categoryname" class="form-control" placeholder="Enter Category Name*">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                
                <div class="mt-3">
                    <span>${msg}</span>
                </div>
            </div>
        </div>
</div>
</body>
</html>