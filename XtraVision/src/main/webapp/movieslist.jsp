<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Movie" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> movieProducts = productDao.getMovieProducts();
    if (!movieProducts.isEmpty()) {
%>

<div class="row row-cols-1 row-cols-md-4 g-4 p-3" style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">
    <%
        for (Product product : movieProducts) {
            if (product instanceof Movie) {
                Movie movie = (Movie) product;
    %>
    <div class="col">
        <div class="card h-100">
            <img src="https://placehold.co/600x400" class="card-img-top" alt="<%=movie.getName()%> Movie Image" style="height: 400px">
            <div class="card-body">
                <h5 class="card-title"><%= movie.getName() %></h5>
                <p class="card-text"><%= movie.getDescription() %></p>
                <% if(movie.getPrice() != 0.0){ %>
                <h3 class="card-text">To buy: &#x20AC; <%=movie.getPrice()%></h3>
                <h3 class="card-text">Gold Price: &#x20AC; <%=Math.round((movie.getPrice() / 100) * 40)%></h3>
                <h3 class="card-text">Silver Price: &#x20AC; <%=Math.round((movie.getPrice() / 100) * 60)%></h3>
                <% } else { %>
                <h3 class="card-text">Free</h3>
                <% } %>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>Genre:</strong> <%= movie.getGenre() %></li>
                    <li class="list-group-item"><strong>Studio:</strong> <%= movie.getStudio() %></li>
                    <li class="list-group-item"><strong>Release Date:</strong> <%= movie.getReleaseDate() %></li>
                    <li class="list-group-item"><strong>Director:</strong> <%= movie.getDirector() %></li>
                    <li class="list-group-item"><strong>Format:</strong> <%= movie.getFormat() %></li>
                    <li class="list-group-item"><strong>Runtime:</strong> <%= movie.getRuntime() %></li>
                    <li class="list-group-item"><strong>Movie Rating:</strong> <%= movie.getMovieRating() %></li>
                </ul>
                <div class="mt-3">
                    <a href="#" class="btn btn-primary">Buy</a>
                    <a href="#" class="btn btn-success">Rent</a>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>

<%
} else {
%>
<p>No Movies found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
