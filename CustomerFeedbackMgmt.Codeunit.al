codeunit 50110 "CustomerFeedbackMgmt"
{
    // Define a procedure to calculate the average rating for a specific customer
    procedure CalculateAverageRating(CustomerNo: Code[20]): Decimal
    var
        CustomerFeedback: Record "Customer Feedback";
        TotalRating: Integer;
        FeedbackCount: Integer;
        AverageRating: Decimal;
    begin
        // Initialize variables
        TotalRating := 0;
        FeedbackCount := 0;
        AverageRating := 0;

        // Filter feedback entries for the specified customer
        CustomerFeedback.SetRange("Customer No.", CustomerNo);

        // Check if there are any feedback records for the customer
        if CustomerFeedback.FindSet() then begin
            repeat
                // Add the rating of the current feedback record to the total
                TotalRating += CustomerFeedback.Rating;

                // Increment the feedback count
                FeedbackCount += 1;
            until CustomerFeedback.Next() = 0;

            // Calculate the average rating if there is at least one feedback entry
            if FeedbackCount > 0 then
                AverageRating := TotalRating / FeedbackCount;
        end;

        // Return -1 if no feedback exists for the customer
        if FeedbackCount = 0 then
            exit(-1);

        // Round the average rating to two decimal places (e.g., 4.27)
        AverageRating := Round(AverageRating, 0.01);
        exit(AverageRating);
    end;

    // Define a procedure to calculate the average rating for all customers
    procedure CalculateAverageRatingForAllCustomers(var CustomerAverageRating: Dictionary of [Code[20], Decimal])
    var
        CustomerFeedback: Record "Customer Feedback";
        Customer: Record Customer;
        TotalRating: Integer;
        FeedbackCount: Integer;
        AverageRating: Decimal;
    begin
        // Loop through all customers
        if Customer.FindSet() then begin
            repeat
                // Initialize variables for each customer
                TotalRating := 0;
                FeedbackCount := 0;
                AverageRating := 0;

                // Filter feedback entries for the current customer
                CustomerFeedback.SetRange("Customer No.", Customer."No.");

                // Calculate the total rating and feedback count for the current customer
                if CustomerFeedback.FindSet() then begin
                    repeat
                        TotalRating += CustomerFeedback.Rating;
                        FeedbackCount += 1;
                    until CustomerFeedback.Next() = 0;

                    // Calculate the average rating if there is at least one feedback entry
                    if FeedbackCount > 0 then
                        AverageRating := TotalRating / FeedbackCount;
                end;

                // Round the average rating to two decimal places (e.g., 4.27)
                AverageRating := Round(AverageRating, 0.01);

                // Add the customer and their average rating to the dictionary
                CustomerAverageRating.Add(Customer."No.", AverageRating);
            until Customer.Next() = 0;
        end;
    end;

    // Define a procedure to validate the Customer No.
    local procedure ValidateCustomerNo(CustomerNo: Code[20])
    var
        Customer: Record Customer;
    begin
        // Check if the customer exists
        if not Customer.Get(CustomerNo) then
            Error('Customer No. %1 does not exist.', CustomerNo);
    end;
}
