<%--
    Jonathan Davis - CSD 430 Module 4 - 6/15/2025

    This JSP page demonstrates how to gather data from a JavaBean (Student.java)
    and display it in a nicely formatted HTML table.
    It adheres to the assignment requirements:
    - Uses scriptlets (<% ... %>) for holding Java code.
    - All HTML tags are outside of Java scriptlets.
    - Displays data in an HTML table format.
    - Includes field and record descriptions, title, and overall data description.
    - Uses the Student JavaBean which implements java.io.Serializable.
    - Displays data for multiple records (mimicking a list from a previous assignment).
    - Some comments left throughout the code for better understanding and what the CSS styling is used for.
    - TabninePro was used for code completion and syntax highlighting.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- Import the Student JavaBean and ArrayList class --%>
<%@ page import="com.example.Student" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Enrollment Data Dashboard</title>
<style>
    /* Some very basic CSS for a clean and readable display */
    body {
        font-family: 'Inter', Arial, sans-serif; /* Using Inter font as per guidelines */
        margin: 20px;
        background-color: #f0f2f5; /* Light grey background for some contrast */
        color: #333;
        line-height: 1.6;
        text-align: center; /* Center the main content */
    }
    h1 {
        color: #2c3e50; /* Dark blue-grey for main title */
        font-size: 2.5em;
        margin-bottom: 20px;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }
    .description {
        max-width: 800px;
        margin: 0 auto 40px auto;
        padding: 15px 25px;
        background-color: #e8f0fe; /* Light blue background for description */
        border-left: 5px solid #3498db; /* Blue left border */
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 2px 5px rgba(0,0,0,0.08);
        color: #2980b9;
        font-size: 1.1em;
        text-align: left;
    }
    table {
        width: 90%; /* Make table a bit wider */
        margin: 30px auto;
        border-collapse: separate; /* Use separate for rounded corners on cells */
        border-spacing: 0;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); /* More pronounced shadow */
        background-color: #ffffff;
        border-radius: 12px; /* Rounded corners for the whole table */
        overflow: hidden; /* Ensures child elements respect border-radius */
    }
    th, td {
        border: 1px solid #e0e0e0; /* Lighter border for cells */
        padding: 15px 20px;
        text-align: left;
        transition: background-color 0.3s ease; /* Smooth hover effect */
    }
    th {
        background-color: #34495e;
        color: white;
        font-weight: 600; 
        text-transform: uppercase;
        letter-spacing: 0.08em;
        padding: 18px 20px;
        position: sticky; 
        top: 0;
        z-index: 1; 
    }
    tr:nth-child(even) {
        background-color: #f9f9f9; 
    }
    tr:hover {
        background-color: #eaf2f8; 
    }
    td {
        border-radius: 4px; /* Slightly rounded corners for individual cells */
    }
    /* Specific styling for first/last cell for consistent rounded corners */
    tr:first-child th:first-child { border-top-left-radius: 12px; }
    tr:first-child th:last-child { border-top-right-radius: 12px; }
    tr:last-child td:first-child { border-bottom-left-radius: 12px; }
    tr:last-child td:last-child { border-bottom-right-radius: 12px; }

</style>
</head>
<body>

    <!-- Main Title of the Page -->
    <h1>University Student Enrollment Dashboard</h1>

    <!-- Overall Data Description -->
    <p class="description">
        This dashboard provides an overview of student enrollment details within the university system.
        Each entry represents a unique student's record, including their identifying information,
        the course they are registered for, their academic performance (grade), and the official enrollment date.
        The data presented below is dynamically populated using a Java JavaBean, ensuring structured and maintainable
        data handling.
    </p>

    <%
        // Scriptlet: Java code block to instantiate and populate data.
        // This simulates fetching data from a database or a previous assignment's output.

        // Create an ArrayList to hold multiple Student JavaBean instances.

        // Add sample student records to the list.
        // Each Student object is created using the parameterized constructor from the JavaBean.
        studentList.add(new Student("STU001", "Alice Wonderland", "Calculus I", "A", "2024-08-25"));
        studentList.add(new Student("STU002", "Bob The Builder", "Digital Logic Design", "B+", "2024-08-25"));
        studentList.add(new Student("STU003", "Charlie Chaplin", "Introduction to Marketing", "A-", "2024-09-01"));
        studentList.add(new Student("STU004", "Diana Ross", "Object-Oriented Programming", "B", "2024-09-01"));
        studentList.add(new Student("STU005", "Edward Scissorhands", "Art History 101", "C+", "2024-09-10"));
        studentList.add(new Student("STU006", "Fiona Apple", "Advanced Database Systems", "A", "2024-09-15"));
        studentList.add(new Student("STU007", "George Harrison", "Computer Networks", "B-", "2024-09-20"));
    %>

    <!-- HTML Table to Display Student Data -->
    <table>
        <thead>
            <tr>
                <!-- Table Headers (Field Descriptions) -->
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Course Enrolled</th>
                <th>Final Grade</th>
                <th>Enrollment Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Scriptlet: Loop through the ArrayList to display each student's data.
                // For each Student object in the 'studentList', a new table row (<tr>) is generated.
                for (Student student : studentList) {
            %>
                <tr>
                    <%--
                        Scriptlet Expressions (<%= ... %>) are used here to display the
                        values of the JavaBean properties by calling their respective getter methods.
                        All HTML <td> tags remain outside the Java scriptlets, fulfilling the requirement.
                    --%>
                    <td><%= student.getStudentId() %></td>
                    <td><%= student.getStudentName() %></td>
                    <td><%= student.getCourseName() %></td>
                    <td><%= student.getGrade() %></td>
                    <td><%= student.getEnrollmentDate() %></td>
                </tr>
            <%
                } // End of the Java for loop
            %>
        </tbody>
    </table>

    <%--
        Optional: A record-specific description could be added here if the table
        were displaying a single record, or if each row had a unique description.
        For a list/table format, the overall description above usually suffices.
    --%>
    <div style="margin-top: 50px; font-size: 0.9em; color: #777;">
        <p><i>Each row in the table above represents a single student record,
        detailing their academic journey for a particular course.</i></p>
    </div>

</body>
</html>
