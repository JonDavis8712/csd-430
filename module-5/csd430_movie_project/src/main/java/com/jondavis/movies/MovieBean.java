package com.jondavis.movies;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Jonathan Davis
 * CSD430 Module 5/6
 * within This code you will find the MovieBean class that interacts with the MySQL database.
 * The MovieBean class includes methods to retrieve movie titles and data, as well as to insert new movies into the database.
 * This class is designed to be used within a web application, and it requires a MySQL database to function.
 * 
 */
public class MovieBean {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String DB_USER = "JonDavis";
    private static final String DB_PASSWORD = "pass";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * Retrieves all movie IDs and titles to populate the dropdown menu.
     */
    public Map<Integer, String> getAllMovieTitles() {
        Map<Integer, String> movies = new HashMap<>();
        String sql = "SELECT movie_id, title FROM Jon_movies_data ORDER BY title ASC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                // This line is now correct, using .put() for a Map
                movies.put(rs.getInt("movie_id"), rs.getString("title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    /**
     * Retrieves all data for a specific movie by its ID.
     */
    public String[] getMovieById(int movieId) {
        String[] movieData = null;
        String sql = "SELECT * FROM Jon_movies_data WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    movieData = new String[5];
                    movieData[0] = rs.getString("movie_id");
                    movieData[1] = rs.getString("title");
                    movieData[2] = rs.getString("director");
                    movieData[3] = rs.getString("release_year");
                    movieData[4] = rs.getString("genre");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieData;
    }
}