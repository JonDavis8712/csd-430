<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="com.jondavis.movies.MovieBean" %>

<%-- Create an instance of our MovieBean --%>
<jsp:useBean id="movieBean" class="com.jondavis.movies.MovieBean" scope="page" />

<%
    boolean updateSuccess = false;
    Map<String, String> updatedMovieData = null; // To hold the data after update

    // Ensure this page is accessed via POST
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            // Retrieve all parameters from the form
            int movieId = Integer.parseInt(request.getParameter("movie_id"));
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            int releaseYear = Integer.parseInt(request.getParameter("release_year"));
            String genre = request.getParameter("genre");

            // Perform the update using the JavaBean
            updateSuccess = movieBean.updateMovie(movieId, title, director, releaseYear, genre);

            // If update was successful, retrieve the updated record to display
            if (updateSuccess) {
                updatedMovieData = movieBean.getMovieById(movieId);
            }

        } catch (NumberFormatException e) {
            // Handle invalid number formats for ID or year
            e.printStackTrace();
            // You might want to set an error message to display on the page
        } catch (Exception e) {
            // Catch any other exceptions during processing
            e.printStackTrace();
        }
    } else {
        // If accessed directly or by GET, redirect or show an error
        response.sendRedirect("index.jsp"); // Or display a message
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Update Result</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; background-color: #f4f7f6; color: #333; }
        h1 { color: #0056b3; text-align: center; margin-bottom: 30px; }
        .container { max-width: 800px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .success-message { color: #28a745; font-weight: bold; text-align: center; margin-bottom: 20px; font-size: 1.2em; }
        .error-message { color: red; font-weight: bold; text-align: center; margin-bottom: 20px; font-size: 1.2em; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        th, td { border: 1px solid #ddd; text-align: left; padding: 12px; }
        thead { background-color: #007bff; color: white; }
        tr:nth-child(even) { background-color: #f8f9fa; }
        .back-link { display: block; text-align: center; margin-top: 30px; }
        .back-link a { text-decoration: none; color: #007bff; font-weight: bold; font-size: 1.1em; }
        .back-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Movie Update Result</h1>

        <% if (updateSuccess && updatedMovieData != null) { %>
            <p class="success-message">Movie record successfully updated!</p>

            <h2>Updated Record Details:</h2>
            <table>
                <thead>
                    <tr>
                        <%
                            // Display table headers (field names)
                            if (updatedMovieData != null) {
                                for (String fieldName : updatedMovieData.keySet()) {
                        %>
                                    <th><%= fieldName.replace("_", " ") %></th> <%-- Replace underscores for better display --%>
                        <%
                                }
                            }
                        %>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            // Display updated record data
                            if (updatedMovieData != null) {
                                for (String value : updatedMovieData.values()) {
                        %>
                                    <td><%= value %></td>
                        <%
                                }
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        <% } else { %>
            <p class="error-message">Failed to update movie record. Please try again.</p>
            <% if (movieIdParam == null || movieIdParam.trim().isEmpty()) { %>
                 <p class="error-message">No movie ID provided.</p>
            <% } %>
        <% } %>

        <div class="back-link">
            <a href="selectRecordToUpdate.jsp">Update Another Movie</a> | <a href="index.jsp">Back to Home</a>
        </div>
    </div>

</body>
</html>