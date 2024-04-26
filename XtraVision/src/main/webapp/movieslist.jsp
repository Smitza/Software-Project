<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Movie" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />


<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> movieProducts = productDao.getMovieProducts();
    if (!movieProducts.isEmpty()) {
%>

<div style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">
    <div class="container p-3 align-content-center text-center">
        <form action="controller" method="get">
            <input style="width:900px; border-radius: 10px; outline: none;" type="text" name="searchQuery" placeholder="Search movies..." required>
            <span class="input-group-btn">
                <button class="btn btn-green mx-1" style="background-color: buttonface;" type="submit"><i class="fa fa-search"></i></button>
            </span>
            <input type="hidden" name="action" value="searchMovies">
        </form>
    </div>
    <div class="row row-cols-4 p-3">
        <%
            for (Product product : movieProducts) {
                if (product instanceof Movie) {
                    Movie movie = (Movie) product;
        %>
        <div class="col">
            <div class="product-card card text-black m-2" style="border-radius: 15px; border-color: #b8b8b8;">
                <img class="img-fluid card-img-top p-3" src="images/ProductImages/<%=movie.getName()%>movieimg.png"  alt="<%=movie.getName()%> Movie Image" style="background-color: white; border-radius: 20px;">
                <div class="card-body p-4">
                    <div class="text-center mt-1">
                        <h4 class="card-title"><%= movie.getName() %></h4>
                        <% if(movie.getPrice() != 0.0){ %>
                        <h2 class="text-primary mb-1 pb-3">&#x20AC; <%=movie.getPrice()%></h2>
                        <% } else { %>
                        <h5 class="text-primary mb-1 pb-3">Free</h5>
                        <% } %>
                    </div>

                    <div class="d-flex flex-column mb-4">
                        <span><%= movie.getDescription() %></span>
                    </div>

                    <div class="d-flex flex-column mb-4">
                        <ul class="list-unstyled mb-0 text-center">
                            <li aria-hidden="true">—</li>
                            <li><strong>Genre:</strong> <%= movie.getGenre() %></li>
                            <li><strong>Studio:</strong> <%= movie.getStudio() %></li>
                            <li><strong>Release Date:</strong> <%= movie.getReleaseDate() %></li>
                            <li><strong>Director:</strong> <%= movie.getDirector() %></li>
                            <li><strong>Format:</strong> <%= movie.getFormat() %></li>
                            <li><strong>Runtime:</strong> <%= movie.getFormat() %></li>
                            <li aria-hidden="true">—</li>
                            <img src="images/MovieRatings/<%= movie.getMovieRating()%>.png" style="height: 75px">
                        </ul>
                    </div>
                    <%-- Check if the user is an admin --%>
                    <% if (session.getAttribute("loggedInUser") != null &&((User) session.getAttribute("loggedInUser")).isAdmin() == 1) { %>
                    <div class=" flex-row text-center">
                        <form action="editmovie.jsp" method="get">
                            <input type="hidden" name="productId" value="<%= movie.getProductId() %>">
                            <button type="button" class="btn btn-primary flex-fill me-1">Edit</button>
                        </form>
                        <form action="controller" method="post">
                            <input type="hidden" name="action" value="deleteProduct">
                            <input type="hidden" name="productId" value="<%= movie.getProductId() %>">
                            <button type="submit" class="btn btn-danger flex-fill ms-1">Delete</button>
                        </form>
                    </div>
                    <% } %>
                    <form action="controller" method="post">
                        <input type="hidden" name="action" value="addproductcart">
                        <input type="hidden" name="productId" value="<%= movie.getProductId() %>">
                        <% if(session.getAttribute("loggedInUser") != null) { %>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary me-1">Add to cart</button>
                        </div>
                    </form>
                    <% } %>
                </div>
            </div>
        </div>

        <%
                }
            }
        %>
    </div>
</div>
<%
} else {
%>

<p>No movies found</p>

<%
    }
%>

<jsp:include page="footer.jsp" />
