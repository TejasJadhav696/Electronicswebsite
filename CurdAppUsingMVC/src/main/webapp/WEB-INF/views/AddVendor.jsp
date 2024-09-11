<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
</head>
<body>
        <jsp:include page="AdminPage.jsp"></jsp:include>
        
        <div class="row mt-5">
            <div class="col-md-8 offset-md-2">
                <!-- Form -->
                <form action="addvendor" method="get">
                    <div class="form-group">
                        <label for="vendorname">Vendor Name*</label>
                        <input type="text" id="vendorname" name="vendorname" class="form-control" placeholder="Enter Vendor Name*">
                    </div>
                    <div class="form-group">
                        <label for="iosno">ISO Number*</label>
                        <input type="text" id="iosno" name="iosno" class="form-control" placeholder="Enter ISO Number*">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                
                <!-- Message -->
                <div class="mt-3">
                    <span>${msg}</span>
                </div>
            </div>
        </div>
</div>
</body>
</html>
