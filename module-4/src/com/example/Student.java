/* 
 Jonathan Davis - CSD 430 Module 4 - 6/15/2025

 This code creates a user-friendly "Feedback Form". 
 It gathers essential information such as the user's name and email, allows them to rate their meal using radio buttons, select service 
 quality from a dropdown menu, and provide additional comments in a textarea. It is is configured to submit the collected data to a JSP file named 
 displayFeedback.jsp for processing and display.
 */

// Student.java
package com.example; // A recommended package structure for web applications

import java.io.Serializable; // This is required for JavaBeans to be serializable

public class Student implements Serializable {

    // Unique identifier for serialization, recommended for Serializable classes
    private static final long serialVersionUID = 1L;

    // --- Private Fields (Properties) ---
    // Minimum of 5 fields as per assignment requirements
    private String studentId;        // Unique identifier for the student
    private String studentName;      // Full name of the student
    private String courseName;       // Name of the course the student is enrolled in
    private String grade;            // Grade obtained by the student in the course
    private String enrollmentDate;   // Date of enrollment for the course (as a String for simplicity)

    // --- Constructor(s) ---

    /**
     * No-argument constructor.
     * This is a mandatory requirement for JavaBeans, allowing frameworks (like JSP)
     * to instantiate the bean using its default constructor before setting properties.
     */
    public Student() {
        // Default initialization, if any, can go here.
        // For this example, if you have fields that will be null/default until setters are called.
    }

    /**
     * Parameterized constructor.
     * This constructor provides a convenient way to create Student objects with initial data.
     * While not strictly required by JavaBean spec, it's often useful for populating data.
     *
     * @param studentId 
     * @param studentName 
     * @param courseName 
     * @param grade 
     * @param enrollmentDate The date of enrollment (YYYY-MM-DD format).
     */
    public Student(String studentId, String studentName, String courseName, String grade, String enrollmentDate) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.courseName = courseName;
        this.grade = grade;
        this.enrollmentDate = enrollmentDate;
    }

    // These methods should allow external code to retrieve the values of the private fields.

    /**
     * Retrieves the student's ID.
     * @return The student's ID.
     */
    public String getStudentId() {
        return studentId;
    }

    /**
     * Retrieves the student's name.
     * @return The student's name.
     */
    public String getStudentName() {
        return studentName;
    }

    /**
     * Retrieves the course name.
     * @return The name of the course.
     */
    public String getCourseName() {
        return courseName;
    }

    /**
     * Retrieves the student's grade.
     * @return The grade obtained.
     */
    public String getGrade() {
        return grade;
    }

    /**
     * Retrieves the enrollment date.
     * @return The enrollment date as a String.
     */
    public String getEnrollmentDate() {
        return enrollmentDate;
    }

    // --- Setter Methods (Mutators) ---
    // These methods should allow external code to modify the values of the private fields.

    /**
     * Sets the student's ID.
     * @param studentId The new student ID.
     */
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    /**
     * Sets the student's name.
     * @param studentName The new student name.
     */
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    /**
     * course name.
     * @param courseName The new course name.
     */
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    /**
     * This sets the student's grade.
     * @param grade The new grade.
     */
    public void setGrade(String grade) {
        this.grade = grade;
    }

    /**
     * And this sets the enrollment date.
     * @param enrollmentDate The new enrollment date as a String.
     */
    public void setEnrollmentDate(String enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }
}
