<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Database Home</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2em; background-color: #f4f7f6; color: #333; }
        h1 { color: #0056b3; text-align: center; margin-bottom: 30px; }
        .container { max-width: 800px; margin: 0 auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        ul { list-style: none; padding: 0; }
        li { margin-bottom: 15px; }
        a { text-decoration: none; color: #007bff; font-weight: bold; font-size: 1.1em; }
        a:hover { color: #0056b3; text-decoration: underline; }
        hr { border: 0; height: 1px; background: #ddd; margin: 30px 0; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to the Movie Database Management System</h1>
        <hr>
        <h2>Actions:</h2>
        <ul>
            <li><a href="movies.jsp">Add New Movie & View All Movies</a></li>
            <li><a href="selectRecordToUpdate.jsp">Update Existing Movie Record</a></li>
        </ul>
    </div>

</body>
</html>