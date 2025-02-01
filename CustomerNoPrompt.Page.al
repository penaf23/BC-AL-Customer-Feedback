page 50101 "Customer No. Prompt"
{
    Caption = 'Enter Customer No.';
    PageType = Card; // or StandardDialog in AL14
    ApplicationArea = All;
    Editable = true;

    layout
    {
        area(Content)
        {
            field(CustomerNoInput; CustomerNoInput)
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
                ToolTip = 'Enter any Customer No.';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OK)
            {
                Caption = 'OK';
                trigger OnAction()
                begin
                    Close; // Returns Action::OK when closing
                end;
            }
            action(Cancel)
            {
                Caption = 'Cancel';
                trigger OnAction()
                begin
                    Close; // Returns Action::Cancel
                end;
            }
        }
    }

    // Public procedure that returns the typed value
    procedure GetCustomerNo(): Code[20]
    begin
        exit(CustomerNoInput);
    end;

    // Variable to store the user's input
    var
        CustomerNoInput: Code[20];
}
