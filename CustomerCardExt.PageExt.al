// Define a page extension for the "Customer Card" page
pageextension 50110 CustomerCardExt extends "Customer Card"
{
    // Add actions to the page
    actions
    {
        // Add the new action to the end of the "Processing" action group
        addlast(processing)
        {
            // Define a new action called "OpenCustomerFeedback"
            action(OpenCustomerFeedback)
            {
                // Specify that this action is available in all application areas
                ApplicationArea = All;

                // Set the caption (label) for the action that will appear in the UI
                Caption = 'View Customer Feedback';

                // Assign an icon to the action for better visual representation
                Image = View;

                // Define what happens when the action is triggered
                trigger OnAction()
                var
                    // Declare a variable for the "Customer Feedback List" page
                    FeedbackPage: Page "Customer Feedback List";

                    // Declare a variable for the "Customer Feedback" record to apply filters
                    CustomerFilter: Record "Customer Feedback";
                begin
                    // Set a filter on the "Customer Feedback" table to only show records
                    // where the "Customer No." matches the current customer's number
                    CustomerFilter.SetRange("Customer No.", Rec."No.");

                    // Apply the filter to the "Customer Feedback List" page
                    FeedbackPage.SetTableView(CustomerFilter);

                    // Open the "Customer Feedback List" page in a modal dialog
                    FeedbackPage.RunModal();
                end;
            }
        }
    }
}