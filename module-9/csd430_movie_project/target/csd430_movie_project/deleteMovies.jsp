<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jondavis.movies.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Movie Records</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; background-color: #f4f7f6; color: #333; }
        .container { max-width: 900px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        h1 { color: #cc0000; text-align: center; margin-bottom: 20px; }
        h2 { color: #0056b3; margin-top: 30px; margin-bottom: 15px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .no-records { text-align: center; color: #555; margin-top: 20px; font-style: italic; }
        form { margin-top: 25px; padding: 20px; border: 1px solid #eee; border-radius: 5px; background-color: #f9f9f9; }
        select, input[type="submit"] { padding: 10px 15px; margin-right: 10px; border-radius: 5px; border: 1px solid #ccc; }
        input[type="submit"] { background-color: #dc3545; color: white; cursor: pointer; border: none; }
        input[type="submit"]:hover { background-color: #c82333; }
        .message { margin-top: 15px; padding: 10px; border-radius: 5px; font-weight: bold; }
        .success { background-color: #d4edda; color: #155724; border-color: #c3e6cb; }
        .error { background-color: #f8d7da; color: #721c24; border-color: #f5c6cb; }
        .back-link { display: block; text-align: center; margin-top: 30px; }
        a { text-decoration: none; color: #007bff; font-weight: bold; }
        a:hover { text-decoration: underline; color: #0056b3; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Delete Movie Records</h1>

        <%
            // Instantiate the JavaBean
            MovieBean movieBean = new MovieBean();

            String message = null;
            String messageType = null;

            // Check if a delete request was submitted
            String movieIdToDeleteParam = request.getParameter("movieIdToDelete");
            if (movieIdToDeleteParam != null && !movieIdToDeleteParam.isEmpty()) {
                try {
                    int movieId = Integer.parseInt(movieIdToDeleteParam);
                    boolean deleted = movieBean.deleteMovie(movieId);
                    if (deleted) {
                        message = "Movie with ID " + movieId + " deleted successfully!";
                        messageType = "success";
                    } else {
                        message = "Failed to delete movie with ID " + movieId + ". It might not exist.";
                        messageType = "error";
                    }
                } catch (NumberFormatException e) {
                    message = "Invalid Movie ID provided for deletion.";
                    messageType = "error";
                }
            }

            // Get all movies to display
            List<String[]> allMovies = movieBean.getAllMovies();
        %>

        <% if (message != null) { %>
            <div class="message <%= messageType %>">
                <%= message %>
            </div>
        <% } %>

        <h2>Current Movies in Database:</h2>
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
                <%
                    if (allMovies.isEmpty()) {
                %>
                        <tr>
                            <td colspan="5" class="no-records">No records found. The database is empty.</td>
                        </tr>
                <%
                    } else {
                        for (String[] movie : allMovies) {
                %>
                            <tr>
                                <td><%= movie[0] %></td>
                                <td><%= movie[1] %></td>
                                <td><%= movie[2] %></td>
                                <td><%= movie[3] %></td>
                                <td><%= movie[4] %></td>
                            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <% if (!allMovies.isEmpty()) { %>
            <form action="deleteMovies.jsp" method="post">
                <h2>Select a Movie to Delete:</h2>
                <select name="movieIdToDelete" required>
                    <option value="">-- Select Movie ID --</option>
                    <%
                        for (String[] movie : allMovies) {
                    %>
                            <option value="<%= movie[0] %>"><%= movie[0] %> - <%= movie[1] %></option>
                    <%
                        }
                    %>
                </select>
                <input type="submit" value="Delete Selected Movie">
            </form>
        <% } %>

        <div class="back-link">
            <p><a href="index.jsp">Back to Home</a></p>
        </div>
    </div>

</body>
</html>