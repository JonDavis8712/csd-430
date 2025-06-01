<!DOCTYPE html>
<html>
<head>
    <title>Module 2: The Lord of the Rings</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>My Favorite Book Series: "The Lord of the Rings" by J.R.R. Tolkien</h1>

    <p>This page dynamically displays information about one of my favorite book series, "The Lord of the Rings," using JSP Scriptlets to integrate Java code with HTML, and an external CSS file for styling. The data is presented in a structured table format.</p>

    <div class="data-container">
        <h2>Book Series Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Description</th>
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
                <%-- Java Scriptlet to define book series data --%>
                <%
                    // Record 1: Series Title
                    String seriesTitleField = "Series Title";
                    String seriesTitleDescription = "The official title of the book series.";
                    String seriesTitleValue = "The Lord of the Rings";

                    // Record 2: Author
                    String authorField = "Author";
                    String authorDescription = "The acclaimed author of the series.";
                    String authorValue = "J.R.R. Tolkien";

                    // Record 3: Genre
                    String genreField = "Genre";
                    String genreDescription = "The primary literary genre of the series.";
                    String genreValue = "High Fantasy, Epic Fantasy, Adventure";

                    // Record 4: Original Publication Years
                    String yearField = "Original Publication Years";
                    String yearDescription = "The years the volumes were originally published (1954-1955).";
                    String yearValue = "1954-1955";

                    // Record 5: Main Setting
                    String settingField = "Main Setting";
                    String settingDescription = "The fictional world where the story primarily takes place.";
                    String settingValue = "Middle-earth";

                    // Record 6: Number of Volumes
                    String volumesField = "Number of Volumes";
                    String volumesDescription = "The total number of main books in the trilogy.";
                    String volumesValue = "3 (The Fellowship of the Ring, The Two Towers, The Return of the King)";
                %>

                <%-- HTML table rows displaying data --%>
                <tr>
                    <td><%= seriesTitleField %></td>  
                    <td><%= seriesTitleDescription %></td>
                    <td><%= seriesTitleValue %></td>   
                </tr>
                <tr>
                    <td><%= authorField %></td>
                    <td><%= authorDescription %></td>
                    <td><%= authorValue %></td>
                </tr>
                <tr>
                    <td><%= genreField %></td>
                    <td><%= genreDescription %></td>
                    <td><%= genreValue %></td>
                </tr>
                <tr>
                    <td><%= yearField %></td>
                    <td><%= yearDescription %></td>
                    <td><%= yearValue %></td>
                </tr>
                <tr>
                    <td><%= settingField %></td>  
                    <td><%= settingDescription %></td> 
                    <td><%= settingValue %></td>   
                </tr>
                <tr>
                    <td><%= volumesField %></td>  
                    <td><%= volumesDescription %></td> 
                    <td><%= volumesValue %></td>   
                </tr>
            </tbody>
        </table>
    </div>

    <div class="data-container">
        <h2>Why I Enjoyed This Series</h2>
        <p>
            "The Lord of the Rings" is a monumental achievement in literature, a foundational work of high fantasy that has influenced countless authors and works across various media. Tolkien's meticulous world-building, rich mythology, and complex characters create an immersive experience. The epic struggle between good and evil, the themes of friendship, sacrifice, and the corrupting nature of power, resonate deeply. The journey of Frodo and Sam, coupled with the grand adventures of the Fellowship, makes for a truly unforgettable reading experience.
        </p>
    </div>

    <footer>
        <p>&copy; 2025 module 2 My Dynamic JSP Page</p>
    </footer>
</body>
</html>