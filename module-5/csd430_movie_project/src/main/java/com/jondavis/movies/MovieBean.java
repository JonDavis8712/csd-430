package com.jondavis.movies;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * JavaBean to interact with the CSD430 movie database.
 * This class handles all database connections and queries for creating and reading data.
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
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * NEW METHOD: Adds a new movie record to the database.
     * The movie_id is not needed as it is an auto-incrementing primary key.
     * @param title The title of the movie.
     * @param director The director of the movie.
     * @param releaseYear The year the movie was released.
     * @param genre The genre of the movie.
     */
    public void addMovie(String title, String director, int releaseYear, String genre) {
        // The SQL query for inserting a new record. The '?' are placeholders.
        String sql = "INSERT INTO Jon_movies_data (title, director, release_year, genre) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Set the values for the placeholders in the SQL query
            pstmt.setString(1, title);
            pstmt.setString(2, director);
            pstmt.setInt(3, releaseYear);
            pstmt.setString(4, genre);

            // Execute the query to insert the data
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Print errors to the server console for debugging
        }
    }

    /**
     * NEW METHOD: Retrieves all movie records from the database.
     * @return A List of String arrays, where each inner array represents a full movie record.
     */
    public List<String[]> getAllMovies() {
        List<String[]> allMovies = new ArrayList<>();
        String sql = "SELECT * FROM Jon_movies_data ORDER BY movie_id DESC";

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
    
}