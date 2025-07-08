package com.jondavis.movies;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Jonathan Davis
 * CSD430 Module 8
 * This code contains the MovieBean class that interacts with the MySQL database.
 * The MovieBean class includes methods to retrieve movie titles and data, insert new movies,
 * retrieve a single movie for update, and update existing movie records in the database.
 * This class is designed to be used within a web application, and it requires a MySQL database to function.
 * for this week's module, a form was added to update, fetch records.
 */
public class MovieBean {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String DB_USER = "JonDavis";
    private static final String DB_PASSWORD = "pass";

    /**
     * Establishes a connection to the database.
     */
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.", e); // Re-throw as SQLException
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * Adds a new movie record to the database.
     * The movie_id is not needed as it is an auto-incrementing primary key.
     * @param title The title of the movie.
     * @param director The director of the movie.
     * @param releaseYear The year the movie was released.
     * @param genre The genre of the movie.
     */
    public void addMovie(String title, String director, int releaseYear, String genre) {
        String sql = "INSERT INTO Jon_movies_data (title, director, release_year, genre) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.setString(2, director);
            pstmt.setInt(3, releaseYear);
            pstmt.setString(4, genre);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Retrieves all movie records from the database.
     * @return A List of String arrays, where each inner array represents a full movie record.
     * The order of fields is: movie_id, title, director, release_year, genre.
     */
    public List<String[]> getAllMovies() {
        List<String[]> allMovies = new ArrayList<>();
        String sql = "SELECT movie_id, title, director, release_year, genre FROM Jon_movies_data ORDER BY movie_id ASC"; // Changed to ASC for dropdown order

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String[] movieData = new String[5];
                movieData[0] = rs.getString("movie_id");
                movieData[1] = rs.getString("title");
                movieData[2] = rs.getString("director");
                movieData[3] = rs.getString("release_year");
                movieData[4] = rs.getString("genre");
                allMovies.add(movieData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allMovies;
    }

    /**
     * NEW METHOD HERE: Retrieves a single movie record by its primary key (movie_id).
     * @param movieId The ID of the movie to retrieve.
     * @return A Map where keys are column names (e.g., "movie_id", "title") and values are the corresponding data.
     * Returns null if no movie found with the given ID.
     */
    public Map<String, String> getMovieById(int movieId) {
        Map<String, String> movieData = null;
        String sql = "SELECT movie_id, title, director, release_year, genre FROM Jon_movies_data WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    movieData = new LinkedHashMap<>(); // Use LinkedHashMap to preserve column order
                    ResultSetMetaData rsmd = rs.getMetaData();
                    int columnCount = rsmd.getColumnCount();
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = rsmd.getColumnLabel(i); // Use getColumnLabel for alias-friendly names
                        movieData.put(columnName, rs.getString(i));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieData;
    }

    /**
     * SECOND NEW METHOD: Updates an existing movie record in the database.
     * @param movieId The ID of the movie to update (key field).
     * @param title The new title of the movie.
     * @param director The new director of the movie.
     * @param releaseYear The new year the movie was released.
     * @param genre The new genre of the movie.
     * @return true if the update was successful, false otherwise.
     */
    public boolean updateMovie(int movieId, String title, String director, int releaseYear, String genre) {
        String sql = "UPDATE Jon_movies_data SET title = ?, director = ?, release_year = ?, genre = ? WHERE movie_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, title);
            pstmt.setString(2, director);
            pstmt.setInt(3, releaseYear);
            pstmt.setString(4, genre);
            pstmt.setInt(5, movieId); // Set the movie_id for the WHERE clause

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was updated

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
/**
     * NEW METHOD FOR DELETION: Deletes a movie record from the database by its primary key (movie_id).
     * @param movieId The ID of the movie to delete.
     * @return true if the deletion was successful, false otherwise.
     */
    public boolean deleteMovie(int movieId) {
        String sql = "DELETE FROM Jon_movies_data WHERE movie_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was deleted

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}