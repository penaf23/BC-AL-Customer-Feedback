pageextension 50112 "Customer Card Ext" extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            // Add a new action to calculate the average rating
            action("Calculate Average Rating")
            {
                Caption = 'Calculate Average Rating';
                ApplicationArea = All;
                Image = Calculate;

                // Define what happens when the action is triggered
                trigger OnAction()
                var
                    FeedbackManager: Codeunit "CustomerFeedbackMgmt"; // Declare the codeunit
                    AvgRating: Decimal; // Variable to store the calculated average rating
                begin
                    // Call the CalculateAverageRating function for the current customer
                    AvgRating := FeedbackManager.CalculateAverageRating(Rec."No.");

                    // Display the result in a message
                    if AvgRating = -1 then
                        Message('No Feedback Registered for Customer %1', Rec."No.")
                    else
                        Message('Average Rating for Customer %1: %2', Rec."No.", AvgRating);

                end;
            }
        }
    }
}