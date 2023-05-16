/// <summary>
/// Query KNH CustomerBalance (ID 50301).
/// </summary>
query 50301 "KNHCustomerOverviewAPI"
{
    APIGroup = 'keithCorp'; //Sets the group of the API endpoint the query is exposed in.
    APIPublisher = 'keithHow'; //Sets the publisher of the API endpoint the page is exposed in. 
    APIVersion = 'v1.0'; //Sets the version(s) of the API endpoint the query is exposed in. 
    Caption = 'Customer Balance';
    EntityName = 'customer'; //Sets the singular entity name for exposed page in the API endpoint.
    EntitySetName = 'customers';
    QueryType = API;

    elements
    {
        dataitem(customer; Customer)
        {
            column(no; "No.")
            {
                Caption = 'No.';
            }
            column(name; Name)
            {
                Caption = 'Name';
            }
            dataitem(CustLedgEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");
                column(documentType; "Document Type")
                {
                }
                column(documentNo; "Document No.")
                {
                }
                column(documentDate; "Document Date")
                {
                }
                column(postingDate; "Posting Date")
                {
                }
                column(currCode; "Currency Code")
                {
                }
                column(amount; Amount)
                {
                }
                column(amountLCY; "Amount (LCY)")
                {
                }
                column(open; Open)
                {
                }
                column(remainingAmt; "Remaining Amount")
                {
                }
                column(remainingAmtLCY_; "Remaining Amt. (LCY)")
                {
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
