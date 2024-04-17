<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Game" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> gameProducts = productDao.getGameProducts();
    if (!gameProducts.isEmpty()) {
%>

<div class="row row-cols-1 row-cols-md-4 g-4  p-3" style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">
    <%
        for (Product product : gameProducts) {
            if (product instanceof Game) {
                Game game = (Game) product;
    %>
    <div class="col">
        <div class="card h-100 text-white" style="background-color: rgba(0, 0, 0, 0.6)">
            <img src="images/ProductImages/<%=game.getName()%>gameimg.png" class="card-img-top" alt="<%=game.getName()%> Game Image" style="height: 400px">
            <div class="card-body">
                <h5 class="card-title"><%= game.getName() %></h5>
                <p class="card-text"><%= game.getDescription() %></p>
                <% if(game.getPrice() != 0.0){ %>
                <h3 class="card-text">To buy: &#x20AC; <%=game.getPrice()%></h3>
                <h3 class="card-text">Gold Price: &#x20AC; <%=Math.round((game.getPrice() / 100) * 40)%></h3>
                <h3 class="card-text">Silver Price: &#x20AC; <%=Math.round((game.getPrice() / 100) * 60)%></h3>
                <% } else { %>
                <h3 class="card-text">Free</h3>
                <% } %>
                <ul class="list-group list-group-flush rounded-3">
                    <li class="list-group-item"><strong>Genre:</strong> <%= game.getGenre() %></li>
                    <li class="list-group-item"><strong>Studio:</strong> <%= game.getStudio() %></li>
                    <li class="list-group-item"><strong>Release Date:</strong> <%= game.getReleaseDate() %></li>
                    <li class="list-group-item"><strong>Publisher:</strong> <%= game.getPublisher() %></li>
                    <li class="list-group-item"><strong>Platform:</strong> <%= game.getPlatform() %></li>
                    <li class="list-group-item"><img src="images/GameRatings/<%= game.getGameRating()%>.png" style="height: 50px"></li>
                </ul>
                <%-- Check if the user is an admin --%>
                <% if (((User) session.getAttribute("loggedInUser")).isAdmin() == 1) { %>
                <div class="mt-3">
                    <form action="editgame.jsp" method="get">
                        <input type="hidden" name="productId" value="<%= game.getProductId() %>">
                        <button type="submit" class="btn btn-primary">Edit</button>
                    </form>
                    <form action="controller" method="post">
                        <input type="hidden" name="action" value="deleteProduct">
                        <input type="hidden" name="productId" value="<%= game.getProductId() %>">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
                <% } %>
                <form action="controller" method="post">
                    <input type="hidden" name="action" value="addproductcart">
                    <input type="hidden" name="productId" value="<%= game.getProductId() %>">
                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary">Add to cart</button>
                    </div>
                </form>
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
<p>No Games found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
