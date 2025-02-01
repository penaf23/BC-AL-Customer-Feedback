BC-AL-Customer-Feedback
AL Extension: Customer Feedback for Business Central Project Requirements Objective Develop a basic AL extension for Microsoft Dynamics 365 Business Central (BC) that customizes the system to meet a simple business requirement.

Scenario A fictional company, Contoso Ltd, needs a small extension to enhance their customer management module. The goal is to add a new table, a page, and a small business logic customization.

Detailed Requirements 📌 Table Creation Create a new table named Customer Feedback with the following fields:

Feedback ID (Primary Key, Integer, AutoIncrement = Yes) Customer No. (Code[20], Related to Customer Table) Feedback Date (Date) Rating (Integer, range 1–5) Comments (Text[250]) 📌 Page Creation Create a list page for the Customer Feedback table. The page should allow users to:

View existing feedback entries. Add new feedback entries. Edit or delete existing feedback entries. Include an action to filter feedback by Customer No. and/or Rating. 📌 Business Logic Customization Add a validation trigger on the Rating field to ensure it only accepts values
between 1 and 5. Display an error message if the value is outside this range. Add a codeunit that calculates the average rating for a specific customer. Include a procedure that takes the Customer No. as input and returns the average rating. 📌 UI Integration Add an action 
to the Customer Card page that opens the Customer Feedback list filtered by the selected customer. 🚀 Tech Stack AL Language Business Central VS Code AL Language Extension 💡 Notes This project is a simple AL extension designed for learning and demonstration purposes.
Feel free to contribute, enhance, or customize it based on your needs! 🎯
