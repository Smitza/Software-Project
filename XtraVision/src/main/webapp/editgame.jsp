<%@ page import="business.Game" %>
<%@ page import="daos.ProductDao" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="head.jsp" />

<%
    int gameId = Integer.parseInt(request.getParameter("gameId"));

    ProductDao productDao = new ProductDao("xtra");
    Game game = (Game) productDao.getProductById(gameId);
%>

<div class="container mt-5">
    <h1>Edit Game</h1>
    <form action="controller" method="post">
        <input type="hidden" name="action" value="editgame">
        <input type="hidden" name="gameId" value="<%= game.getProductId() %>">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= game.getName() %>">
        </div>
        <div class="mb-3">
            <label for="genre" class="form-label">Genre</label>
            <textarea class="form-control" id="genre" name="genre" rows="3"><%= game.getGenre() %></textarea>
        </div>
        <div class="mb-3">
            <label for="studio" class="form-label">Studio</label>
            <textarea class="form-control" id="studio" name="studio" rows="3"><%= game.getStudio() %></textarea>
        </div>
        <div class="mb-3">
            <label for="releasedate" class="form-label">Release Date</label>
            <textarea class="form-control" id="releasedate" name="releasedate" rows="3"><%= game.getReleaseDate() %></textarea>
        </div>
        <div class="mb-3">
            <label for="publisher" class="form-label">Publisher</label>
            <textarea class="form-control" id="publisher" name="publisher" rows="3"><%= game.getPublisher() %></textarea>
        </div>
        <div class="mb-3">
            <label for="platform" class="form-label">Platform</label>
            <textarea class="form-control" id="platform" name="platform" rows="3"><%= game.getPlatform() %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
</div>
<jsp:include page="footer.jsp" />
