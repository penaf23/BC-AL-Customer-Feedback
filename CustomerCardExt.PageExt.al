pageextension 50112 "Customer Card Ext" extends "Customer Card"
{
    actions
    {
        addlast(Processing)
        {
            action("Calculate Average Rating") // This is already present in your code
            {
                Caption = 'Calculate Average Rating';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    FeedbackManager: Codeunit "CustomerFeedbackMgmt";
                    AvgRating: Decimal;
                begin
                    AvgRating := FeedbackManager.CalculateAverageRating(Rec."No.");

                    if AvgRating = -1 then
                        Message('No Feedback Registered for Customer %1', Rec."No.")
                    else
                        Message('Average Rating for Customer %1: %2', Rec."No.", AvgRating);
                end;
            }

            // ✅ This is the required UI integration
            action("View Customer Feedback")
            {
                Caption = 'View Customer Feedback';
                ApplicationArea = All;
                Image = View;

                trigger OnAction()
                var
                    FeedbackPage: Page "Customer Feedback List";
                    CustomerFilter: Record "Customer Feedback";
                begin
                    // Filter the feedback list by the selected customer
                    CustomerFilter.SetRange("Customer No.", Rec."No.");
                    FeedbackPage.SetTableView(CustomerFilter);
                    FeedbackPage.RunModal();
                end;
            }
        }
    }
}
