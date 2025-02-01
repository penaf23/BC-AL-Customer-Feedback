page 50102 "Rating Prompt"
{
    Caption = 'Enter Rating (1..5)';
    PageType = StandardDialog; // Use StandardDialog for modal prompts
    ApplicationArea = All;
    Editable = true;

    layout
    {
        area(Content)
        {
            field(RatingInput; RatingInput)
            {
                ApplicationArea = All;
                Caption = 'Rating (1..5)';
                ToolTip = 'Enter a rating between 1 and 5.';

                trigger OnValidate()
                begin
                    if not (RatingInput in [1 .. 5]) then
                        Error('Rating must be between 1 and 5.');
                end;
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
                    if not (RatingInput in [1 .. 5]) then
                        Error('Rating must be between 1 and 5.');
                    Close; // Returns Action::OK
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

    procedure GetRating(): Integer
    begin
        exit(RatingInput);
    end;

    var
        RatingInput: Integer;
}