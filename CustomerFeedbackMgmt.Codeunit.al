codeunit 50110 "CustomerFeedbackMgmt"
{
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

        // Filter feedback entries for the specified customer
        CustomerFeedback.SetRange("Customer No.", CustomerNo);
        if CustomerFeedback.FindSet() then begin
            repeat
                TotalRating += CustomerFeedback.Rating;
                FeedbackCount += 1;
            until CustomerFeedback.Next() = 0;

            // Calculate the average rating
            if FeedbackCount > 0 then
                AverageRating := TotalRating / FeedbackCount;
        end;

        // Return the average rating (0 if no feedback exists)
        exit(AverageRating);
    end;
}