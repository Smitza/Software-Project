<%@ page import="daos.GameDao" %>
<%@ page import="business.Game" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

<%
    GameDao gameDao = new GameDao("xtra");
    List<Game> games = gameDao.getAllGames();
    if(!games.isEmpty()){

%>
    <table>
        <%
            for(Game g: games){
        %>
        <tr>
            <td><%=g.getName()%></td>
            <td><%=g.getPublisher()%></td>
            <td><%=g.getPlatform()%></td>
            <td><%=g.getGameRating()%></td>
        </tr>
        <%
            }
        %>
    </table>
<%
    } else {
%>
 <p>No games found</p>
<%    }
    %>


<jsp:include page="footer.jsp"/>