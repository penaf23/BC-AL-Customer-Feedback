page 50110 "Customer Feedback List"
{
    PageType = List;
    SourceTable = "Customer Feedback";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Customer Feedback';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Feedback ID"; Rec."Feedback ID")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = All;
                }
                field("Rating"; Rec."Rating")
                {
                    ApplicationArea = All;
                }
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
                    actionResult := PromptPage.RunModal();
                    if actionResult = Action::OK then begin
                        typedCustomerNo := PromptPage.GetCustomerNo();
                        if typedCustomerNo <> '' then
                            Rec.SetRange("Customer No.", typedCustomerNo);
                    end;
                end;
            }

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
                    if PromptPage.RunModal() = Action::OK then begin
                        // Retrieve the rating as an Integer
                        typedRating := PromptPage.GetRating();

                        // Apply the filter
                        Rec.SetRange("Rating", typedRating);
                    end;
                end;
            }
        }
    }
}