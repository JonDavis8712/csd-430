<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- This import is required to use the Map class in the code below --%>
<%@ page import="java.util.Map" %>

<%-- CSD 430 MODULES 5/6 --%>
<jsp:useBean id="movieBean" class="com.jondavis.movies.MovieBean" scope="page" />

<!DOCTYPE html>
<html>
<head>
    <title>Jon's Movie Database Viewer</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; }
        h1, h2 { color: #333; }
        table { border-collapse: collapse; width: 80%; margin-top: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; text-align: left; padding: 12px; }
        thead { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>

    <h1>Movie Database Explorer</h1>
    <p>This page connects to a MySQL database using a JavaBean. Select a movie from the list to see its details.</p>

    <form action="movies.jsp" method="get">
        <select name="selectedMovieId" onchange="this.form.submit()">
            <option value="">-- Select a Movie --</option>
            <%
                Map<Integer, String> movies = movieBean.getAllMovieTitles();
                for (Map.Entry<Integer, String> entry : movies.entrySet()) {
                    out.println("<option value='" + entry.getKey() + "'>" + entry.getValue() + "</option>");
                }
            %>
        </select>
        <noscript><input type="submit" value="Get Details"></noscript>
    </form>

    <%
        String selectedMovieIdStr = request.getParameter("selectedMovieId");
        if (selectedMovieIdStr != null && !selectedMovieIdStr.isEmpty()) {
            try {
                int selectedMovieId = Integer.parseInt(selectedMovieIdStr);
                String[] movieData = movieBean.getMovieById(selectedMovieId);

                if (movieData != null) {
    %>
                    <h2>Movie Details</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Movie ID</th>
                                <th>Title</th>
                                <th>Director</th>
                                <th>Release Year</th>
                                <th>Genre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= movieData[0] %></td>
                                <td><%= movieData[1] %></td>
                                <td><%= movieData[2] %></td>
                                <td><%= movieData[3] %></td>
                                <td><%= movieData[4] %></td>
                            </tr>
                        </tbody>
                    </table>
    <%
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Error: Invalid movie ID.</p>");
            }
        }
    %>

</body>
</html>