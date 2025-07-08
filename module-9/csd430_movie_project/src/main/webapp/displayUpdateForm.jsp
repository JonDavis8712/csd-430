<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.jondavis.movies.MovieBean" %>

<%-- Create an instance of our MovieBean --%>
<jsp:useBean id="movieBean" class="com.jondavis.movies.MovieBean" scope="page" />

<%
    Map<String, String> movieData = null;
    String movieIdParam = request.getParameter("movieId");
    int movieId = -1; // Default invalid ID

    if (movieIdParam != null && !movieIdParam.trim().isEmpty()) {
        try {
            movieId = Integer.parseInt(movieIdParam);
            movieData = movieBean.getMovieById(movieId);
        } catch (NumberFormatException e) {
            // Handle error if movieId is not a valid number
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Movie Record</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; background-color: #f4f7f6; color: #333; }
        h1 { color: #0056b3; text-align: center; margin-bottom: 30px; }
        .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        form { margin-top: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input[type="text"], input[type="number"] { width: calc(100% - 22px); padding: 10px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; font-size: 1em; }
        .non-editable { background-color: #e0e0e0; cursor: not-allowed; }
        input[type="submit"] { background-color: #007bff; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 1.1em; }
        input[type="submit"]:hover { background-color: #0056b3; }
        .error-message { color: red; font-weight: bold; text-align: center; margin-bottom: 20px; }
        .back-link { display: block; text-align: center; margin-top: 20px; }
        .back-link a { text-decoration: none; color: #ff9800; font-weight: bold; }
        .back-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Edit Movie Details</h1>

        <% if (movieData != null) { %>
            <form action="processUpdate.jsp" method="post">
                <p><strong>Movie ID:</strong> <span class="non-editable"><%= movieData.get("movie_id") %></span></p>
                <input type="hidden" name="movie_id" value="<%= movieData.get("movie_id") %>">

                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<%= movieData.get("title") != null ? movieData.get("title") : "" %>" required><br>

                <label for="director">Director:</label>
                <input type="text" id="director" name="director" value="<%= movieData.get("director") != null ? movieData.get("director") : "" %>"><br>

                <label for="releaseYear">Release Year:</label>
                <input type="number" id="releaseYear" name="release_year" min="1888" max="2099" value="<%= movieData.get("release_year") != null ? movieData.get("release_year") : "" %>" required><br>

                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="genre" value="<%= movieData.get("genre") != null ? movieData.get("genre") : "" %>"><br><br>

                <input type="submit" value="Update Movie Record">
            </form>
        <% } else { %>
            <p class="error-message">Movie record not found or invalid ID provided.</p>
        <% } %>

        <div class="back-link">
            <a href="selectRecordToUpdate.jsp">Back to Select Movie</a>
        </div>
    </div>

</body>
</html>