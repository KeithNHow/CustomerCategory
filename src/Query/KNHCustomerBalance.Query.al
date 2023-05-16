/// <summary>
/// Query KNH CustomerBalance (ID 50301).
/// </summary>
query 50301 "KNHCustomerBalance"
{
    APIGroup = 'keithCorp';
    APIPublisher = 'keithHow';
    APIVersion = 'v1.0';
    EntityName = 'customer';
    EntitySetName = 'customerBalance';
    QueryType = API;

    elements
    {
        dataitem(customer; Customer)
        {
            column(no; "No.")
            {
            }
            column(name; Name)
            {
            }
            dataitem(CustLedgEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = FILTER(Invoice | "Credit Memo");
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
