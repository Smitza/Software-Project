<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Game" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> gameProducts = productDao.getGameProducts();
    if (!gameProducts.isEmpty()) {
%>
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Genre</th>
        <th>Studio</th>
        <th>Release Date</th>
        <th>Price</th>
        <th>Publisher</th>
        <th>Platform</th>
        <th>Game Rating</th>
    </tr>
    <%
        for (Product product : gameProducts) {
            if (product instanceof Game) {
                Game game = (Game) product;
    %>
    <tr>
        <td><%= game.getName() %></td>
        <td><%= game.getDescription() %></td>
        <td><%= game.getGenre() %></td>
        <td><%= game.getStudio() %></td>
        <td><%= game.getReleaseDate() %></td>
        <td><%= game.getPrice() %></td>
        <td><%= game.getPublisher() %></td>
        <td><%= game.getPlatform() %></td>
        <td><%= game.getGameRating() %></td>
    </tr>
    <%
            }
        }
    %>
</table>
<%
} else {
%>
<p>No Games found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
