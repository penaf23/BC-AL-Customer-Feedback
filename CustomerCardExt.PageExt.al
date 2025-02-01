pageextension 50110 CustomerCardExt extends "Customer Card"
{
    actions
    {
        addlast(processing)
        {
            action(OpenCustomerFeedback)
            {
                ApplicationArea = All;
                Caption = 'View Customer Feedback';
                Image = View; // Adds an icon to the action

                trigger OnAction()
                var
                    FeedbackPage: Page "Customer Feedback List";
                    CustomerFilter: Record "Customer Feedback";
                begin
                    // Set filter to only show feedback for the selected customer
                    CustomerFilter.SetRange("Customer No.", Rec."No.");
                    FeedbackPage.SetTableView(CustomerFilter);
                    FeedbackPage.RunModal();
                end;
            }
        }
    }
}
