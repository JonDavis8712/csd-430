<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My First JSP Page</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        h1 { color: #333; }
        .java-output { color: #007bff; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Welcome to My JSP super awesome hello world page!</h1>

    <%
        // This is Java code embedded within the JSP
        String message = "Hello from Java!";
        java.util.Date now = new java.util.Date();
    %>

    <p class="java-output">
        <%= message %>
    </p>
    <p>
        The current server time is: <span class="java-output"><%= now %></span>
    </p>

    <%
        // Another example of Java code, maybe for a loop
        out.println("<p>Counting to 3:</p><ul>");
        for (int i = 1; i <= 3; i++) {
            out.println("<li>Item " + i + "</li>");
        }
        out.println("</ul>");
    %>

    <p>This just a simple page, whats up yall!</p>
</body>
</html>