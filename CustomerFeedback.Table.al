// Define a new table with the ID 50110 and name "Customer Feedback"
table 50110 "Customer Feedback"
{
    // Specify the data classification for compliance and security purposes
    DataClassification = CustomerContent;

    // Set the caption for the table, which will be displayed in the UI
    Caption = 'Customer Feedback';

    // Define the fields (columns) in the table
    fields
    {
        // Field 1: Unique identifier for each feedback entry
        field(1; "Feedback ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Feedback ID';
            AutoIncrement = true; // Automatically generate a unique ID for each new record
        }

        // Field 2: Stores the customer number associated with the feedback
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer."No."; // Establishes a relationship with the Customer table
        }

        // Field 3: Stores the date when the feedback was provided
        field(3; "Feedback Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Feedback Date';
        }

        // Field 4: Stores the rating provided by the customer (1 to 5)
        field(4; "Rating"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Rating';
            MinValue = 1; // Minimum allowed value for the rating
            MaxValue = 5; // Maximum allowed value for the rating

            // Validate the rating to ensure it is within the allowed range
            trigger OnValidate()
            begin
                if ("Rating" < 1) or ("Rating" > 5) then
                    Error('Rating must be between 1 and 5.'); // Throw an error if the rating is invalid
            end;
        }

        // Field 5: Stores additional comments provided by the customer
        field(5; "Comments"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Comments';
        }
    }

    // Define the primary key for the table
    keys
    {
        key(PK; "Feedback ID")
        {
            Clustered = true; // The primary key is clustered for better performance
        }
    }
}