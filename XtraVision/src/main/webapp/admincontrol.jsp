<%@ page import="business.User" %>
<%@ page import="daos.Dao" %>
<%@ page import="daos.UserDao" %>
<%@ page import="daos.UserDaoInterface" %>
<%@ page import="java.util.List" %>
<jsp:include page="head.jsp"/>
<style>body{
    background: linear-gradient(#fa0303, #ff960e 100%, #fff);
}</style>
<div class="container rounded"  style="background-image: url('images/adminbg.jpg'); background-size: cover; background-attachment: fixed; ">
<div class="row row-cols-1 row-cols-md-2 g-4 mt-3 mb-3 pb-3 ">
    <%
        User u  = (User) session.getAttribute("loggedInUser");
        if(u.isAdmin() == 1){
            UserDao userDao = new UserDao("xtra");
            List<User> userList = userDao.getAllUsers();

            if (userList.isEmpty()) {
                response.sendRedirect("index.jsp");
            } else {
                // Display each user's details in a card format
                for (User user : userList) {
                    // Skip displaying the currently logged-in user
                    if (user.getId() == u.getId()) {
                        continue;
                    }
    %>
<div class ="col">
<div class="card shadow-sm">
    <div class="card-body">
        <h5 class="card-title"><%= user.getUserName() %></h5>
        <p class="card-text">Email: <%= user.getEmail() %></p>
        <p class="card-text">Phone: <%= user.getPhone() %></p>
        <p class="card-text">Name: <%= user.getName() %></p>

        <% if (user.isAdmin() == 1) { %>
        <p class="card-text">User is already an admin.</p>
        <form action="controller" method="post">
            <input type="hidden" name="action" value="removeadmin">
            <input type="hidden" name="userId" value="<%= user.getId() %>">
            <button type="submit" class="btn btn-danger">Remove Admin Status</button>
        </form>
        <% } else { %>
        <form action="controller" method="post">
            <input type="hidden" name="action" value="upgradeuser">
            <input type="hidden" name="userId" value="<%= user.getId() %>">
            <button type="submit" class="btn btn-primary">Upgrade to Admin</button>
        </form>
        <% } %>
    </div>
    </div>
</div>
<%
            }
        }
    }
%>
</div>
    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        Add New Product
                    </div>
                    <div class="card-body">
                        <form action="controller" method="post" id="productForm">
                            <input type="hidden" name="action" value="addProduct">
                            <div class="mb-3">
                                <label for="productType" class="form-label">Product Type</label>
                                <select class="form-select" name="productType" id="productType" onchange="changeForm()" required>
                                    <option value="Game" selected>Game</option>
                                    <option value="Movie">Movie</option>
                                    <option value="Tv">TV Show</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="genre" class="form-label">Genre</label>
                                <input type="text" class="form-control" id="genre" name="genre" required>
                            </div>
                            <div class="mb-3">
                                <label for="studio" class="form-label">Studio</label>
                                <input type="text" class="form-control" id="studio" name="studio" required>
                            </div>
                            <div class="mb-3">
                                <label for="releaseDate" class="form-label">Release Date</label>
                                <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input type="number" class="form-control" id="price" name="price" required>
                            </div>
                            <div id="gameFields" style="display: block;">
                                <div class="mb-3">
                                    <label for="publisher" class="form-label">Publisher</label>
                                    <input type="text" class="form-control" id="publisher" name="publisher">
                                </div>
                                <div class="mb-3">
                                    <label for="platform" class="form-label">Platform</label>
                                    <input type="text" class="form-control" id="platform" name="platform">
                                </div>
                                <div class="mb-3">
                                    <label for="gameRating" class="form-label">Game Rating</label>
                                    <input type="text" class="form-control" id="gameRating" name="gameRating">
                                </div>
                            </div>
                            <div id="movieFields" style="display: none;">
                                <div class="mb-3">
                                    <label for="director" class="form-label">Director</label>
                                    <input type="text" class="form-control" id="director" name="director">
                                </div>
                                <div class="mb-3">
                                    <label for="movieFormat" class="form-label">Format</label>
                                    <input type="text" class="form-control" id="movieFormat" name="movieFormat">
                                </div>
                                <div class="mb-3">
                                    <label for="movieRuntime" class="form-label">Runtime</label>
                                    <input type="text" class="form-control" id="movieRuntime" name="movieRuntime">
                                </div>
                                <div class="mb-3">
                                    <label for="movieRating" class="form-label">Movie Rating</label>
                                    <input type="text" class="form-control" id="movieRating" name="movieRating">
                                </div>
                            </div>
                            <div id="tvShowFields" style="display: none;">
                                <div class="mb-3">
                                    <label for="showrunner" class="form-label">Showrunner</label>
                                    <input type="text" class="form-control" id="showrunner" name="showrunner">
                                </div>
                                <div class="mb-3">
                                    <label for="noOfSeasons" class="form-label">Number of Seasons</label>
                                    <input type="number" class="form-control" id="noOfSeasons" name="noOfSeasons">
                                </div>
                                <div class="mb-3">
                                    <label for="noOfEpisodes" class="form-label">Number of Episodes</label>
                                    <input type="number" class="form-control" id="noOfEpisodes" name="noOfEpisodes">
                                </div>
                                <div class="mb-3">
                                    <label for="tvFormat" class="form-label">Number of Episodes</label>
                                    <input type="text" class="form-control" id="tvFormat" name="tvFormat">
                                </div>
                                <div class="mb-3">
                                    <label for="tvRuntime" class="form-label">Number of Episodes</label>
                                    <input type="text" class="form-control" id="tvRuntime" name="tvRuntime">
                                </div>
                                <div class="mb-3">
                                    <label for="tvRating" class="form-label">TV Rating</label>
                                    <input type="text" class="form-control" id="tvRating" name="tvRating">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Product</button>
                        </form>
                    </div>
                </div>*
            </div>
        </div>
    </div>

    <script>
        function changeForm() {
            var productType = document.getElementById("productType").value;
            if (productType === "Game") {
                document.getElementById("gameFields").style.display = "block";
                document.getElementById("movieFields").style.display = "none";
                document.getElementById("tvShowFields").style.display = "none";
            } else if (productType === "Movie") {
                document.getElementById("gameFields").style.display = "none";
                document.getElementById("movieFields").style.display = "block";
                document.getElementById("tvShowFields").style.display = "none";
            } else if (productType === "Tv") {
                document.getElementById("gameFields").style.display = "none";
                document.getElementById("movieFields").style.display = "none";
                document.getElementById("tvShowFields").style.display = "block";
            } else {
                document.getElementById("gameFields").style.display = "none";
                document.getElementById("movieFields").style.display = "none";
                document.getElementById("tvShowFields").style.display = "none";
            }
        }
    </script>
</div>



<jsp:include page="footer.jsp"/>
