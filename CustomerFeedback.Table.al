table 50110 "Customer Feedback"
{
    DataClassification = CustomerContent;
    Caption = 'Customer Feedback';

    fields
    {
        field(1; "Feedback ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Feedback ID';
            AutoIncrement = true;
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(3; "Feedback Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Feedback Date';
        }
        field(4; "Rating"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Rating';
            MinValue = 1;
            MaxValue = 5;
            trigger OnValidate()
            begin
                if ("Rating" < 1) or ("Rating" > 5) then
                    Error('Rating must be between 1 and 5.');
            end;
        }
        field(5; "Comments"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Comments';
        }
    }

    keys
    {
        key(PK; "Feedback ID")
        {
            Clustered = true;
        }
    }
}