<%@page import="org.techhub.CurdAppUsingMVC.model.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/Vendor.js' />"></script>
</head>
<body>
	<jsp:include page="AdminPage.jsp"></jsp:include>

	<div class="mb-4 mt-5">
		<input type="text" class="form-control" placeholder="Search Here"
			id="searchInput">
	</div>

	<div class="table-responsive mt-5">
		<table class="table table-striped table-bordered" id="myTable">
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Vendor</th>
					<th>Category</th>
					<th>Sub Category</th>
					<th>Price</th>
					<th>Quntity</th>
					<th>Mag Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				int id = 0;
				List<ProductModel> list = (List<ProductModel>) request.getAttribute("productdata");
				for (ProductModel promodel : list) {
					VendorModel venmodel = promodel.getVendormodel();
					CategoryModel catmodel = promodel.getCatmodel();
					SubCatModel submodel = promodel.getModel();
				%>
				<tr>
					<td><%=++id%></td>
					<td><%=venmodel.getVendorname()%></td>
					<td><%=catmodel.getCategoryname()%></td>
					<td><%=submodel.getName()%></td>
					<td><%=promodel.getPrice()%></td>
					<td><%=promodel.getQuantity()%></td>
					<td><%=promodel.getDate()%></td>
					<td><a
						href="updproduct?vid=<%=venmodel.getId()%>&cid=<%=catmodel.getId()%>&pid=<%=submodel.getId()%>&pp=<%=promodel.getPrice()%>&pq=<%=promodel.getQuantity()%>&pd=<%=promodel.getDate()%>"
						class="btn btn-warning btn-sm">Update</a> <a
						href="delproduct?vid=<%=venmodel.getId()%>&cid=<%=catmodel.getId()%>&pid=<%=submodel.getId()%>"
						class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
        $('#searchInput').on('keyup', function() {
            var value = $(this).val().toLowerCase();
            $('#myTable tbody tr').filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
    });
	</script>
</body>
</html>