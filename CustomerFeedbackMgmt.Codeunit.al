// Define a new codeunit with the ID 50110 and name "CustomerFeedbackMgmt"
codeunit 50110 "CustomerFeedbackMgmt"
{
    // Define a procedure to calculate the average rating for a specific customer
    procedure CalculateAverageRating(CustomerNo: Code[20]): Decimal
    var
        // Declare variables for the feedback record and calculations
        CustomerFeedback: Record "Customer Feedback"; // Record variable to access feedback data
        TotalRating: Integer; // Variable to store the sum of all ratings
        FeedbackCount: Integer; // Variable to store the number of feedback entries
        AverageRating: Decimal; // Variable to store the calculated average rating
    begin
        // Initialize variables to zero
        TotalRating := 0;
        FeedbackCount := 0;

        // Filter feedback entries for the specified customer
        CustomerFeedback.SetRange("Customer No.", CustomerNo);

        // Check if there are any feedback records for the customer
        if CustomerFeedback.FindSet() then begin
            // Loop through all feedback records for the customer
            repeat
                // Add the rating of the current feedback record to the total
                TotalRating += CustomerFeedback.Rating;

                // Increment the feedback count
                FeedbackCount += 1;
            until CustomerFeedback.Next() = 0; // Move to the next record until no more records are found

            // Calculate the average rating if there is at least one feedback entry
            if FeedbackCount > 0 then
                AverageRating := TotalRating / FeedbackCount;
        end;

        // Return the average rating (0 if no feedback exists for the customer)
        exit(AverageRating);
    end;
}