// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.CustomerFeedback;

using Microsoft.Sales.Customer;

pageextension 50102 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('Laurinha: Finally i got it! Now i can start to work on the project');
    end;
}