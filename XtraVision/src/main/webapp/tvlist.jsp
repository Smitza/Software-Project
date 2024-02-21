<%@ page import="daos.TvDao" %>
<%@ page import="business.Tv" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

    <%
    TvDao TvDao = new TvDao("xtra");
    List<Tv> Tvs = TvDao();
    if(!Tvs.isEmpty()){

%>
<table>
    <%
        for(Tv g: Tvs){
    %>
    <tr>
        <td><%=g.getName()%></td>
        <td><%=g.getShowrunner()%></td>
        <td><%=g.getFormat()%></td>
        <td><%=g.getNumberOfSeasons()%></td>
        <td><%=g.getNumberOfEpisodes()%></td>
        <td><%=g.getRuntime()%></td>
        <td><%=g.getTvRating()%></td>
    </tr>
    <%
        }
    %>
</table>
    <%
    } else {
%>
<p>No Tvs found</p>
    <%    }
    %>


<jsp:include page="footer.jsp"/>