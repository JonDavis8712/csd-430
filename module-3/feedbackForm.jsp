<!-- 
 Jonathan Davis - CSD 430 Module 3 - 6/8/2025

 This code creates a user-friendly "Feedback Form". 
 It gathers essential information such as the user's name and email, allows them to rate their meal using radio buttons, select service 
 quality from a dropdown menu, and provide additional comments in a textarea. It is is configured to submit the collected data to a JSP file named 
 displayFeedback.jsp for processing and display.
 -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Feedback Form</title>
    <style>
        /* Basic CSS for readability - you can expand this */
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        .container { background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-width: 600px; margin: auto; }
        h1 { color: #333; text-align: center; margin-bottom: 25px; }
        p { margin-bottom: 20px; line-height: 1.6; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
        input[type="text"], input[type="email"], textarea, select {
            width: calc(100% - 22px); /* Account for padding and border */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        textarea { resize: vertical; min-height: 100px; }
        .rating-group label { display: inline-block; margin-right: 15px; font-weight: normal; }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            margin-top: 20px;
        }
        input[type="submit"]:hover { background-color: #218838; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Feedback Form</h1>
        <p>
            We value your opinion! Please take a few moments to provide feedback on your recent experience with us. Your input helps us improve our service and quality.
        </p>

        <form action="displayFeedback.jsp" method="post">
            <div class="form-group">
                <label for="userName">Your Name:</label>
                <input type="text" id="userName" name="userName" placeholder="e.g., John Doe" required>
                <small>Please enter your full name.</small>
            </div>

            <div class="form-group">
                <label for="userEmail">Email Address:</label>
                <input type="email" id="userEmail" name="userEmail" placeholder="e.g., example@domain.com" required>
                <small>We'll use this to send you a thank you, optionally.</small>
            </div>

            <div class="form-group">
                <label>Overall Meal Rating:</label><br>
                <div class="rating-group">
                    <input type="radio" id="rating5" name="mealRating" value="5" required><label for="rating5">5 Stars (Excellent)</label>
                    <input type="radio" id="rating4" name="mealRating" value="4"><label for="rating4">4 Stars (Very Good)</label>
                    <input type="radio" id="rating3" name="mealRating" value="3"><label for="rating3">3 Stars (Good)</label>
                    <input type="radio" id="rating2" name="mealRating" value="2"><label for="rating2">2 Stars (Fair)</label>
                    <input type="radio" id="rating1" name="mealRating" value="1"><label for="rating1">1 Star (Poor)</label>
                </div>
                <small>How would you rate your meal experience?</small>
            </div>

            <div class="form-group">
                <label for="serviceQuality">Service Quality:</label>
                <select id="serviceQuality" name="serviceQuality" required>
                    <option value="">-- Please Select --</option>
                    <option value="Excellent">Excellent</option>
                    <option value="Good">Good</option>
                    <option value="Average">Average</option>
                    <option value="Poor">Poor</option>
                    <option value="Unacceptable">Unacceptable</option>
                </select>
                <small>Your feedback on our staff's service.</small>
            </div>

            <div class="form-group">
                <label for="comments">Comments & Suggestions:</label>
                <textarea id="comments" name="comments" rows="5" placeholder="e.g., The pasta was delicious, but the wait time was long."></textarea>
                <small>Feel free to share any additional thoughts or suggestions.</small>
            </div>

            <input type="submit" value="Submit Feedback">
        </form>
    </div>
</body>
</html>