<%@ page import="business.Movie" %>
<%@ page import="daos.MovieDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

    <%
    MovieDao MovieDao = new MovieDao("xtra");
    List<Movie> Movies = MovieDao.getAllMovies();
    if(!Movies.isEmpty()){

%>
<table>
    <%
        for(Movie m: Movies){
    %>
    <tr>
        <td><%=m.getName()%></td>
        <td><%=m.getDirector()%></td>
        <td><%=m.getFormat()%></td>
        <td><%=m.getRuntime()%></td>
        <td><%=m.getMovieRating()%></td>
    </tr>
    <%
        }
    %>
</table>
    <%
    } else {
%>
<p>No Movies found</p>
    <%    }
    %>


<jsp:include page="footer.jsp"/>