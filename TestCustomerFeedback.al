// Define a new page with the ID 50111 and name "Customer Feedback"
page 50111 "Customer Feedback"
{
    // Set the page type to Card for displaying a single record
    PageType = Card;

    // Specify the application area for better organization
    ApplicationArea = All;

    // Set the caption for the page
    Caption = 'Customer Feedback';

    // Define actions available on the page
    actions
    {
        area(Processing)
        {
            // Action to calculate the average rating for a specific customer
            action("Calculate Average Rating")
            {
                Caption = 'Calculate Average Rating';
                ApplicationArea = All;

                // Define what happens when the action is triggered
                trigger OnAction()
                var
                    FeedbackManager: Codeunit "CustomerFeedbackMgmt"; // Declare a codeunit variable
                    AvgRating: Decimal; // Variable to store the calculated average rating
                begin
                    // Call the CalculateAverageRating function from the codeunit
                    // Replace '01121212' with a real Customer No. (e.g., Rec."No." if this page is tied to a customer record)
                    AvgRating := FeedbackManager.CalculateAverageRating('01121212');

                    // Display the result in a message
                    Message('Average Rating for Customer %1: %2', '01121212', AvgRating);
                end;
            }
        }
    }
}