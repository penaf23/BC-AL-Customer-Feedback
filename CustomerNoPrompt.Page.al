page 50101 "Customer No. Prompt"
{
    // Set the caption for the page
    Caption = 'Enter Customer No.';

    // Define the page type as Card (or StandardDialog in AL14 for modal dialogs)
    PageType = Card; // or StandardDialog in AL14

    // Specify the application area for better organization
    ApplicationArea = All;

    // Allow the page to be editable so the user can input data
    Editable = true;

    // Define the layout of the page
    layout
    {
        area(Content)
        {
            // Add a field for the user to input the customer number
            field(CustomerNoInput; CustomerNoInput)
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
                ToolTip = 'Enter any Customer No.'; // Tooltip to guide the user
            }
        }
    }

    // Define actions available on the page
    actions
    {
        area(Processing)
        {
            // Action for the OK button
            action(OK)
            {
                Caption = 'OK';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    // Validate the customer number if it is not blank
                    if CustomerNoInput <> '' then begin
                        if not Customer.Get(CustomerNoInput) then
                            Error('Customer No. %1 does not exist.', CustomerNoInput);
                    end;

                    Close; // Closes the page and returns Action::OK
                end;
            }

            // Action for the Cancel button
            action(Cancel)
            {
                Caption = 'Cancel';
                trigger OnAction()
                begin
                    Close; // Closes the page and returns Action::Cancel
                end;
            }
        }
    }

    // Public procedure to retrieve the value entered by the user
    procedure GetCustomerNo(): Code[20]
    begin
        exit(CustomerNoInput); // Returns the value stored in CustomerNoInput
    end;

    // Variable to store the user's input
    var
        CustomerNoInput: Code[20];
}