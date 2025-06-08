<!-- 
 Jonathan Davis - CSD 430 Module 3 - 6/8/2025

This JSP file will receive the submitted form data and display it in an HTML table using Scriptlets.
Purpose: To present the collected feedback data to the user.
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Submitted Restaurant Feedback</title>
    <style>
        /* Basic CSS for readability */
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        .container { background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 800px; margin: auto; }
        h1 { color: #333; text-align: center; margin-bottom: 25px; }
        p { margin-bottom: 20px; line-height: 1.6; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #e2e2e2; color: #333; }
        td { background-color: #f9f9f9; }
        .highlight { font-weight: bold; color: #007bff; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Submitted Restaurant Feedback</h1>
        <!-- Overall Data Description -->
        <p>Thank you for submitting your feedback! Here's a summary of the information we received:</p>

        <!-- HTML Table to Display Data -->
        <table>
            <!-- Table Header -->
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
                <%-- Scriptlets for holding Java code --%>
                <%
                    // Retrieve parameters from the request object
                    // All HTML tags will be outside of Java Scriptlets

                    // Get user-provided data
                    String userName = request.getParameter("userName");
                    String userEmail = request.getParameter("userEmail");
                    String mealRating = request.getParameter("mealRating"); // Value will be "1", "2", "3", "4", "5"
                    String serviceQuality = request.getParameter("serviceQuality");
                    String comments = request.getParameter("comments");

                    // Handle cases where optional fields might be null or empty, though here all are required except comments
                    // For radio buttons or select, they will always have a value if required
                    // For textarea, it might be an empty string if nothing was typed
                    if (comments == null || comments.trim().isEmpty()) {
                        comments = "[No comments provided]";
                    }
                %>
                <!-- Display Data in HTML Table Rows -->
                <tr>
                    <th>Your Name:</th>
                    <td><span class="highlight"><%= userName %></span></td>
                </tr>
                <tr>
                    <th>Email Address:</th>
                    <td><%= userEmail %></td>
                </tr>
                <tr>
                    <th>Meal Rating:</th>
                    <td>
                        <%
                           // Display a more user-friendly rating description
                           String ratingDescription;
                           // Fix: Added null check for mealRating before the switch statement
                           if (mealRating == null) {
                               ratingDescription = "Not provided or invalid"; // Default for null or missing rating
                           } else {
                               switch (mealRating) {
                                   case "5": ratingDescription = "5 Stars (Excellent)"; break;
                                   case "4": ratingDescription = "4 Stars (Very Good)"; break;
                                   case "3": ratingDescription = "3 Stars (Good)"; break;
                                   case "2": ratingDescription = "2 Stars (Fair)"; break;
                                   case "1": ratingDescription = "1 Star (Poor)"; break;
                                   default: ratingDescription = "Invalid Rating Value"; // Fallback for unexpected values
                               }
                           }
                        %>
                        <%= ratingDescription %>
                    </td>
                </tr>
                <tr>
                    <th>Service Quality:</th>
                    <td><%= serviceQuality %></td>
                </tr>
                <tr>
                    <th>Comments:</th>
                    <td><%= comments %></td>
                </tr>
            </tbody>
        </table>

        <!-- Record Description -->
        <p style="margin-top: 30px;">
            This table summarizes the feedback you submitted. We appreciate your time and insights!
        </p>
    </div>
</body>
</html>