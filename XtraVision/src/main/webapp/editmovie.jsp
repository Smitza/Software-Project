<%@ page import="business.Movie" %>
<%@ page import="daos.ProductDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    // Get the movieId from the request parameter
    int movieId = Integer.parseInt(request.getParameter("movieId"));

    // Retrieve the movie from the database using the ProductDao
    ProductDao productDao = new ProductDao("xtra");
    Movie movie = (Movie) productDao.getProductById(movieId);
%>

<div class="container mt-5">
    <h1>Edit Movie</h1>
    <form action="controller" method="post">
        <input type="hidden" name="action" value="editmovie">
        <input type="hidden" name="movieId" value="<%= movie.getProductId() %>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= movie.getName() %>">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3"><%= movie.getDescription() %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
</div>

<jsp:include page="footer.jsp" />
