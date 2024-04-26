<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Tv" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> tvProducts = productDao.getTvShowProducts();
    if (!tvProducts.isEmpty()) {
%>

<div style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">
    <div class="container p-3 align-content-center text-center">
        <form action="controller" method="get">
            <input style="width:900px; border-radius: 10px; outline: none;" type="text" name="searchQuery" placeholder="Search Tv-Shows..." required>
            <span class="input-group-btn">
                <button class="btn btn-green mx-1" style="background-color: buttonface;" type="submit"><i class="fa fa-search"></i></button>
            </span>
            <input type="hidden" name="action" value="searchTvs">
        </form>
    </div>
    <div class="row row-cols-4 p-3">
        <%
            for (Product product : tvProducts) {
                if (product instanceof Tv) {
                    Tv tv = (Tv) product;
        %>
        <div class="col">
            <div class="product-card card text-black m-2" style="border-radius: 15px; border-color: #b8b8b8;">
                <img class="img-fluid card-img-top p-3" src="images/ProductImages/<%=tv.getName()%>tvimg.png"  alt="<%=tv.getName()%> Tv Image" style="background-color: white; border-radius: 20px">
                <div class="card-body p-4">
                    <div class="text-center mt-1">
                        <h4 class="card-title"><%= tv.getName() %></h4>
                        <% if(tv.getPrice() != 0.0){ %>
                        <h2 class="text-primary mb-1 pb-3">&#x20AC; <%=tv.getPrice()%></h2>
                        <% } else { %>
                        <h5 class="text-primary mb-1 pb-3">Free</h5>
                        <% } %>
                    </div>

                    <div class="d-flex flex-column mb-4">
                        <span><%= tv.getDescription() %></span>
                    </div>

                    <div class="d-flex flex-column mb-4">
                        <ul class="list-unstyled mb-0 text-center">
                            <li aria-hidden="true">—</li>
                            <li><strong>Genre:</strong> <%= tv.getGenre() %></li>
                            <li><strong>Studio:</strong> <%= tv.getStudio() %></li>
                            <li><strong>Release Date:</strong> <%= tv.getReleaseDate() %></li>
                            <li><strong>Showrunner:</strong> <%= tv.getShowrunner() %></li>
                            <li><strong>Format:</strong> <%= tv.getFormat() %></li>
                            <li><strong>Seasons:</strong> <%= tv.getNumberOfSeasons() %></li>
                            <li><strong>Episodes:</strong> <%= tv.getNumberOfEpisodes() %></li>
                            <li><strong>Runtime per Episode:</strong> <%= tv.getRuntime() %></li>
                            <li aria-hidden="true">—</li>
                            <img src="images/TvRatings/<%= tv.getTvRating()%>.png" style="height: 75px">
                        </ul>
                    </div>
                    <%-- Check if the user is an admin --%>
                    <% if (session.getAttribute("loggedInUser") != null &&((User) session.getAttribute("loggedInUser")).isAdmin() == 1) { %>
                    <div class=" flex-row text-center">
                        <form action="editTv.jsp" method="get">
                            <input type="hidden" name="productId" value="<%= tv.getProductId() %>">
                            <button type="button" class="btn btn-primary flex-fill me-1">Edit</button>
                        </form>
                        <form action="controller" method="post">
                            <input type="hidden" name="action" value="deleteProduct">
                            <input type="hidden" name="productId" value="<%= tv.getProductId() %>">
                            <button type="submit" class="btn btn-danger flex-fill ms-1">Delete</button>
                        </form>
                    </div>
                    <% } %>
                    <form action="controller" method="post">
                        <input type="hidden" name="action" value="addproductcart">
                        <input type="hidden" name="productId" value="<%= tv.getProductId() %>">
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
<p>No Tv-Shows found</p>
<%
    }
%>