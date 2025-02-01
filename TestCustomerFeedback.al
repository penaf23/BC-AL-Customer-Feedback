page 50111 "Customer Feedback"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Customer Feedback';

    actions
    {
        area(Processing)
        {
            action("Calculate Average Rating")
            {
                Caption = 'Calculate Average Rating';
                ApplicationArea = All;

                trigger OnAction()
                var
                    FeedbackManager: Codeunit "CustomerFeedbackMgmt";
                    AvgRating: Decimal;
                begin
                    AvgRating := FeedbackManager.CalculateAverageRating('01121212'); // Replace with a real Customer No.
                    Message('Average Rating for Customer %1: %2', '01121212', AvgRating);
                end;
            }
        }
    }
}
