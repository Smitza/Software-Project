<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Tv" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> TvProducts = productDao.getTvShowProducts();
    if (!TvProducts.isEmpty()) {
%>
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Genre</th>
        <th>Studio</th>
        <th>Release Date</th>
        <th>Price</th>
        <th>Showrunner</th>
        <th>Format</th>
        <th>Seasons</th>
        <th>Episodes</th>
        <th>Runtime</th>
        <th>Rating</th>
    </tr>
    <%
        for (Product product : TvProducts) {
            if (product instanceof Tv) {
                Tv t = (Tv) product;
    %>
    <tr>
        <td><%= t.getName() %></td>
        <td><%= t.getDescription() %></td>
        <td><%= t.getGenre() %></td>
        <td><%= t.getStudio() %></td>
        <td><%= t.getReleaseDate() %></td>
        <td><%= t.getPrice() %></td>
        <td><%= t.getShowrunner() %></td>
        <td><%= t.getFormat()%></td>
        <td><%= t.getNumberOfSeasons()%></td>
        <td><%= t.getNumberOfEpisodes()%></td>
        <td><%= t.getRuntime()%></td>
        <td><%= t.getTvRating()%></td>
    </tr>
    <%
            }
        }
    %>
</table>
<%
} else {
%>
<p>No Tv Shows found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
