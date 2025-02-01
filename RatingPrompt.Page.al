page 50102 "Rating Prompt"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    Caption = 'Enter Rating (1..5)';
    Editable = true;

    layout
    {
        area(Content)
        {
            field(RatingInput; RatingInput)
            {
                ApplicationArea = All;
                Caption = 'Rating (1..5)';
                ToolTip = 'Select a rating between 1 and 5.';
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
                    if RatingInput = RatingInput::None then
                        Error('Please select a rating between 1 and 5.');
                    Close;
                end;
            }
            action(Cancel)
            {
                Caption = 'Cancel';
                trigger OnAction()
                begin
                    Close;
                end;
            }
        }
    }

    // Public procedure to retrieve the selected rating
    procedure GetRating(): Integer
    begin
        case RatingInput of
            RatingInput::None:
                exit(0); // Default case
            RatingInput::"1":
                exit(1);
            RatingInput::"2":
                exit(2);
            RatingInput::"3":
                exit(3);
            RatingInput::"4":
                exit(4);
            RatingInput::"5":
                exit(5);
            else
                exit(0);
        end;
    end;

    var
        RatingInput: Enum "Rating Enum"; // Uses the updated Rating Enum
}
