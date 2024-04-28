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
<script>
    // Check if the browser supports the Web Speech API
    if ('SpeechRecognition' in window || 'webkitSpeechRecognition' in window) {
        // Initialize SpeechRecognition object
        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        const recognition = new SpeechRecognition();

        // Define the searchGames function to trigger the search process
        function searchGames(query) {
            // Redirect to the controller with the search query
            window.location.href = 'controller?action=searchGames&searchQuery=' + encodeURIComponent(query);
        }

        // Add event handler for when speech recognition is started
        recognition.onstart = function() {
            console.log('Speech recognition started');
        };

        // Add event handler for when speech recognition results are available
        recognition.onresult = function(event) {
            const transcript = event.results[0][0].transcript.trim();
            console.log('Speech recognition result:', transcript);
            searchGames(transcript); // Trigger search process with the recognized query
        };

        // Add event handler for speech recognition errors
        recognition.onerror = function(event) {
            console.error('Speech recognition error:', event.error);
        };

        // Function to start speech recognition
        function startSpeechRecognition() {
            recognition.start();
        }
    } else {
        // Speech recognition not supported, display a message or fallback option
        console.error('Speech recognition not supported in this browser');
    }
</script>
<div style="background-image: url('images/gamebg.png'); background-size: cover; background-attachment: fixed">

    <div class="container p-3 align-content-center text-center">
        <form action="controller" method="get">
            <input style="width:900px; border-radius: 10px; outline: none;" type="text" name="searchQuery" placeholder="Search games..." required>
            <span class="input-group-btn">
                <button class="btn btn-green mx-1" style="background-color: buttonface;" type="submit"><i class="fa fa-search"></i></button>
            </span>
            <input type="hidden" name="action" value="searchGames">
        </form>
    </div>
    <div class="row row-cols-4 p-3">
    <%
        for (Product product : gameProducts) {
            if (product instanceof Game) {
                Game game = (Game) product;
    %>
    <div class="col">
        <div class="product-card card text-black m-2" style="border-radius: 15px; border-color: #b8b8b8;">
            <img class="img-fluid card-img-top p-3" src="images/ProductImages/<%=game.getName()%>gameimg.png"  alt="<%=game.getName()%> Game Image" style="background-color: white; border-radius: 20px">
            <div class="card-body p-4">
                <div class="text-center mt-1">
                    <h4 class="card-title"><%= game.getName() %></h4>
                    <% if(game.getPrice() != 0.0){ %>
                    <h2 class="text-primary mb-1 pb-3">&#x20AC; <%=game.getPrice()%></h2>
                    <% } else { %>
                    <h5 class="text-primary mb-1 pb-3">Free</h5>
                    <% } %>
                </div>

                <div class="d-flex flex-column mb-4">
                    <span><%= game.getDescription() %></span>
                </div>

                <div class="d-flex flex-column mb-4">
                    <ul class="list-unstyled mb-0 text-center">
                        <li aria-hidden="true">—</li>
                        <li><strong>Genre:</strong> <%= game.getGenre() %></li>
                        <li><strong>Studio:</strong> <%= game.getStudio() %></li>
                        <li><strong>Release Date:</strong> <%= game.getReleaseDate() %></li>
                        <li><strong>Publisher:</strong> <%= game.getPublisher() %></li>
                        <li><strong>Platform:</strong> <%= game.getPlatform() %></li>
                        <li aria-hidden="true">—</li>
                        <img src="images/GameRatings/<%= game.getGameRating()%>.png" style="height: 75px">
                    </ul>
                </div>
                <%-- Check if the user is an admin --%>
                <% if (session.getAttribute("loggedInUser") != null &&((User) session.getAttribute("loggedInUser")).isAdmin() == 1) { %>
                <div class=" flex-row text-center">
                    <form action="editgame.jsp" method="get">
                        <input type="hidden" name="productId" value="<%= game.getProductId() %>">
                        <button type="button" class="btn btn-primary flex-fill me-1">Edit</button>
                    </form>
                    <form action="controller" method="post">
                        <input type="hidden" name="action" value="deleteProduct">
                        <input type="hidden" name="productId" value="<%= game.getProductId() %>">
                        <button type="submit" class="btn btn-danger flex-fill ms-1">Delete</button>
                    </form>
                </div>
                <% } %>
                <form action="controller" method="post">
                    <input type="hidden" name="action" value="addproductcart">
                    <input type="hidden" name="productId" value="<%= game.getProductId() %>">
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
<p>No Games found</p>
<%
    }
%>

<jsp:include page="footer.jsp" />
