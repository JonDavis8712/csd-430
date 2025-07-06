<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<%-- This line creates an instance of our MovieBean so we can use it on this page --%>
<jsp:useBean id="movieBean" class="com.jondavis.movies.MovieBean" scope="page" />

<%
    // --- Form Processing Logic ---
    // This Java code runs every time the page loads.
    // It checks if the page was loaded via a POST request, which means the form was submitted.
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        
        // Retrieve the data submitted from the HTML form fields
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        String genre = request.getParameter("genre");
        
        // Convert the release year from a String to an Integer
        int releaseYear = 0;
        try {
            releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
        } catch (NumberFormatException e) {
            // Handle cases where the year is not a valid number
            e.printStackTrace();
        }

        // Basic validation: Only add the movie if the title is not empty and the year is valid
        if (title != null && !title.trim().isEmpty() && releaseYear > 0) {
            // Use the JavaBean to add the new movie to the database
            movieBean.addMovie(title, director, releaseYear, genre);
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Movie Database Management</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; color: #333; }
        h1, h2 { color: #0056b3; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; text-align: left; padding: 12px; }
        thead { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f8f9fa; }
        form { background-color: #f8f9fa; padding: 20px; border-radius: 8px; border: 1px solid #ddd; margin-bottom: 30px; }
        input[type="text"], input[type="number"] { width: 300px; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px; }
        input[type="submit"] { background-color: #28a745; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        input[type="submit"]:hover { background-color: #218838; }
    </style>
</head>
<body>

    <h1>Add a New Movie</h1>
    <p>Fill out the form below to add a new movie record to the database. The Movie ID will be generated automatically.</p>

    <!-- This is the HTML form for adding a new movie. It submits data back to this same page using the POST method. -->
    <form action="movies.jsp" method="post">
        Title: <br>
        <input type="text" name="title" required><br>
        Director: <br>
        <input type="text" name="director"><br>
        Release Year: <br>
        <input type="number" name="releaseYear" min="1888" max="2099" required><br>
        Genre: <br>
        <input type="text" name="genre"><br><br>
        <input type="submit" value="Add Movie">
    </form>

    <hr>

    <h2>Complete Movie Collection</h2>
    <p>This table displays all records currently held in the database.</p>
    
    <!-- This table will display all movies from the database -->
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
                // Use the JavaBean to get all movie records
                List<String[]> allMovies = movieBean.getAllMovies();
                // Loop through the list of movies
                for (String[] movieData : allMovies) {
            %>
                    <!-- For each movie, create a new table row and fill the cells with data -->
                    <tr>
                        <td><%= movieData[0] %></td>
                        <td><%= movieData[1] %></td>
                        <td><%= movieData[2] %></td>
                        <td><%= movieData[3] %></td>
                        <td><%= movieData[4] %></td>
                    </tr>
            <%
                } // End of the for loop
            %>
        </tbody>
    </table>

</body>
</html>