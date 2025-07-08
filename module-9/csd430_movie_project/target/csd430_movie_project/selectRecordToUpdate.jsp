<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jondavis.movies.MovieBean" %>

<%-- Create an instance of our MovieBean --%>
<jsp:useBean id="movieBean" class="com.jondavis.movies.MovieBean" scope="page" />

<%
    // Retrieve all movies to populate the dropdown
    List<String[]> allMovies = movieBean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Movie Record - Select ID</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; background-color: #f4f7f6; color: #333; }
        h1 { color: #0056b3; text-align: center; margin-bottom: 30px; }
        .container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        form { margin-top: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; margin-bottom: 20px; font-size: 1em; }
        input[type="submit"] { background-color: #ff9800; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 1.1em; }
        input[type="submit"]:hover { background-color: #e68900; }
        .back-link { display: block; text-align: center; margin-top: 20px; }
        .back-link a { text-decoration: none; color: #007bff; font-weight: bold; }
        .back-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Select Movie to Update</h1>

        <form action="displayUpdateForm.jsp" method="get">
            <label for="movieId">Choose a Movie ID to update:</label>
            <select name="movieId" id="movieId" required>
                <option value="">-- Select a Movie ID --</option>
                <%
                    // Loop through all movies and populate the dropdown
                    if (allMovies != null && !allMovies.isEmpty()) {
                        for (String[] movieData : allMovies) {
                            String movieId = movieData[0]; // Movie ID is the first element
                            String movieTitle = movieData[1]; // Optionally display title for better user experience
                %>
                            <option value="<%= movieId %>"><%= movieId %> - <%= movieTitle %></option>
                <%
                        }
                    } else {
                %>
                        <option value="">No movies found in database</option>
                <%
                    }
                %>
            </select>
            <input type="submit" value="Update Selected Movie">
        </form>

        <div class="back-link">
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>

</body>
</html>