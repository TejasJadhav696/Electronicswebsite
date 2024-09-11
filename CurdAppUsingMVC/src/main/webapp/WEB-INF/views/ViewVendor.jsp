<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Management</title>
    <script type="text/javascript" src="<c:url value='/resources/js/Vendor.js' />"></script>
</head>
<body>
        <jsp:include page="AdminPage.jsp"></jsp:include>

        <div class="mb-4 mt-5">
            <input type="text" class="form-control" placeholder="Search Here" onkeyup="searchVendor(this.value)">
        </div>

        <div id="grid" class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>ISO Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int id = 0;
                    %>
                    <c:forEach var="model" items="${data}">
                        <tr>
                            <td><%=++id%></td>
                            <td>${model.getVendorname()}</td>
                            <td>${model.getIosno()}</td>
                            <td>
                                <a href="update?n=${model.getVendorname()}&iso=${model.getIosno()}&id=${model.getId()}" class="btn btn-warning btn-sm">Update</a>
                                <a href="delete?id=${model.getId()}" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
</div>
</body>
</html>
