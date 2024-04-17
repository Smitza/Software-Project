<%@ page import="business.Tv" %>
<%@ page import="daos.ProductDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    // Get the tvId from the request parameter
    int tvId = Integer.parseInt(request.getParameter("tvId"));

    // Retrieve the TV show from the database using the ProductDao
    ProductDao productDao = new ProductDao("xtra");
    Tv tv = (Tv) productDao.getProductById(tvId);
%>

<div class="container mt-5">
    <h1>Edit TV Show</h1>
    <form action="controller" method="post">
        <input type="hidden" name="action" value="edittv">
        <input type="hidden" name="tvId" value="<%= tv.getProductId()%>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= tv.getName() %>">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3"><%= tv.getDescription() %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
</div>

<jsp:include page="footer.jsp" />
