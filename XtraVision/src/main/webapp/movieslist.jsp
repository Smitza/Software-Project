<%@ page import="business.Product" %>
<%@ page import="daos.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Movie" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    ProductDao productDao = new ProductDao("xtra");
    List<Product> MovieProducts = productDao.getMovieProducts();
    if (!MovieProducts.isEmpty()) {
%>
<table>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Genre</th>
        <th>Studio</th>
        <th>Release Date</th>
        <th>Price</th>
        <th>Director</th>
        <th>Format</th>
        <th>Runtime</th>
        <th>Rating</th>
    </tr>
    <%
        for (Product product : MovieProducts) {
            if (product instanceof Movie) {
                Movie m = (Movie) product;
    %>
    <tr>
        <td><%= m.getName() %></td>
        <td><%= m.getDescription() %></td>
        <td><%= m.getGenre() %></td>
        <td><%= m.getStudio() %></td>
        <td><%= m.getReleaseDate() %></td>
        <td><%= m.getPrice() %></td>
        <td><%= m.getDirector() %></td>
        <td><%= m.getFormat()%></td>
        <td><%= m.getRuntime()%></td>
        <td><%= m.getMovieRating()%></td>
    </tr>
    <%
            }
        }
    %>
</table>
<%
} else {
%>
<p>No Movies found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
