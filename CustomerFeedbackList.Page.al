page 50110 "Customer Feedback List"
{
    // Set the page type to List to display multiple records in a tabular format
    PageType = List;

    // Specify the source table for this page
    SourceTable = "Customer Feedback";

    // Define the application area and usage category for better organization
    ApplicationArea = All;
    UsageCategory = Lists;

    // Set the caption for the page
    Caption = 'Customer Feedback';

    layout
    {
        area(Content)
        {
            // Use a repeater to display multiple records in a list format
            repeater(Group)
            {
                // Display the Feedback ID field
                field("Feedback ID"; Rec."Feedback ID")
                {
                    ApplicationArea = All;
                }

                // Display the Customer No. field
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                // Display the Feedback Date field
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = All;
                }

                // Display the Rating field
                field("Rating"; Rec."Rating")
                {
                    ApplicationArea = All;
                }

                // Display the Comments field
                field("Comments"; Rec."Comments")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // Action to filter feedback by Customer No.
            action("Filter by Customer No.")
            {
                ApplicationArea = All;
                Caption = 'Filter by Customer No.';
                ToolTip = 'Filter feedback by Customer No.';

                trigger OnAction()
                var
                    PromptPage: Page "Customer No. Prompt";
                    actionResult: Action;
                    typedCustomerNo: Code[20];
                begin
                    // Open the "Customer No. Prompt" page modally to get user input
                    actionResult := PromptPage.RunModal();

                    // Check if the user clicked OK
                    if actionResult = Action::OK then begin
                        // Retrieve the typed Customer No. from the prompt page
                        typedCustomerNo := PromptPage.GetCustomerNo();

                        // Apply the filter if the user entered a value
                        if typedCustomerNo <> '' then
                            Rec.SetRange("Customer No.", typedCustomerNo);
                    end;
                end;
            }

            // Action to filter feedback by Rating
            action("Filter by Rating")
            {
                ApplicationArea = All;
                Caption = 'Filter by Rating';
                ToolTip = 'Filter feedback by Rating';

                trigger OnAction()
                var
                    PromptPage: Page "Rating Prompt";
                    typedRating: Integer;
                begin
                    // Open the "Rating Prompt" page modally to get user input
                    if PromptPage.RunModal() = Action::OK then begin
                        // Retrieve the typed Rating from the prompt page
                        typedRating := PromptPage.GetRating();

                        // Validate the rating (must be between 1 and 5)
                        if (typedRating >= 1) and (typedRating <= 5) then
                            Rec.SetRange("Rating", typedRating)
                        else
                            Error('Rating must be between 1 and 5.'); // Show an error if the rating is invalid
                    end;
                end;
            }
        }
    }
}