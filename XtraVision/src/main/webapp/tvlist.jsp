<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Tv" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> tvProducts = productDao.getTvShowProducts();
    if (!tvProducts.isEmpty()) {
%>

<div class="row row-cols-1 row-cols-md-4 g-4 p-3" style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">
    <%
        for (Product product : tvProducts) {
            if (product instanceof Tv) {
                Tv tv = (Tv) product;
    %>
    <div class="col">
        <div class="card h-100">
            <img src="https://placehold.co/600x400" class="card-img-top" alt="<%=tv.getName()%> TV Image" style="height: 400px">
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
<p>No TV Shows found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
