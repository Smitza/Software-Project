<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Tv" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />


<%
    ProductDao productDao = new ProductDao("xtra");
    List<Tv> searchResults = (List<Tv>) session.getAttribute("tvProducts");
    request.setAttribute("tvProducts", searchResults);
    if (searchResults != null && !searchResults.isEmpty()) {
%>

<div class="row row-cols-1 row-cols-md-4 g-4 p-3" style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">
    <%
        for (Product product : searchResults) {
            if (product instanceof Tv) {
                Tv tv = (Tv) product;
    %>
    <div class="col">
        <div class="card h-100 text-white" style="background-color: rgba(0, 0, 0, 0.6)">
            <img src="images/ProductImages/<%=tv.getName()%>tvimg.png" class="card-img-top" alt="<%=tv.getName()%> TV Image" style="height: 400px">
            <div class="card-body">
                <h5 class="card-title"><%= tv.getName() %></h5>
                <p class="card-text"><%= tv.getDescription() %></p>
                <% if(tv.getPrice() != 0.0){ %>
                <h3 class="card-text">To buy: &#x20AC; <%=tv.getPrice()%></h3>
                <h3 class="card-text">Gold Price: &#x20AC; <%=Math.round((tv.getPrice() / 100) * 40)%></h3>
                <h3 class="card-text">Silver Price: &#x20AC; <%=Math.round((tv.getPrice() / 100) * 60)%></h3>
                <% } else { %>
                <h3 class="card-text">Free</h3>
                <% } %>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>Genre:</strong> <%= tv.getGenre() %></li>
                    <li class="list-group-item"><strong>Studio:</strong> <%= tv.getStudio() %></li>
                    <li class="list-group-item"><strong>Release Date:</strong> <%= tv.getReleaseDate() %></li>
                    <li class="list-group-item"><strong>Showrunner:</strong> <%= tv.getShowrunner() %></li>
                    <li class="list-group-item"><strong>Format:</strong> <%= tv.getFormat() %></li>
                    <li class="list-group-item"><strong>Seasons:</strong> <%= tv.getNumberOfSeasons() %></li>
                    <li class="list-group-item"><strong>Episodes:</strong> <%= tv.getNumberOfEpisodes() %></li>
                    <li class="list-group-item"><strong>Runtime:</strong> <%= tv.getRuntime() %></li>
                    <li class="list-group-item"><strong>TV Rating:</strong> <%= tv.getTvRating() %></li>
                </ul>
                <%-- Check if the user is an admin --%>
                <% if (session.getAttribute("loggedInUser") != null &&  ((User) session.getAttribute("loggedInUser")).isAdmin() == 1) { %>
                <div class="mt-3">
                    <form action="edittv.jsp" method="get">
                        <input type="hidden" name="productId" value="<%= tv.getProductId() %>">
                        <button type="submit" class="btn btn-primary">Edit</button>
                    </form>
                    <form action="controller" method="post">
                        <input type="hidden" name="action" value="deleteProduct">
                        <input type="hidden" name="productId" value="<%= tv.getProductId() %>">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
                <% } %>
                <div class="mt-3">
                    <form action="controller" method="post">
                        <input type="hidden" name="action" value="addproductcart">
                        <input type="hidden" name="productId" value="<%= tv.getProductId() %>">
                        <% if(session.getAttribute("loggedInUser") != null) { %>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary">Add to cart</button>
                        </div>
                    </form>
                <% } %>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>

<% } else { %>
<p>No Tv-Shows found that match your criteria.</p>
<% } %>

<a href="tvlist.jsp">Search Again</a>
<jsp:include page="footer.jsp" />
