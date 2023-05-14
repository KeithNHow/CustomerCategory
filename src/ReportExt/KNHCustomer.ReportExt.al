/// <summary>
/// Report Ext. KNH Customer (ID 50300) extends Report Customer - Top 10 List.
/// </summary>
reportextension 50300 "KNHCustomer" extends "Customer - Top 10 List"
{
    dataset
    {
        add(Integer)
        {
            // add existing field from base table to dataset
            column(KNHfromBaseTable; Customer.GLN) { }
            // add field from table extending Customer
            column(KNHfromBaseTableExt; Customer."KNH Credit Rating") { }
        }
    }

    requestpage
    {
        layout
        {
            addafter(Show)
            {
                // add field from table extension to request page
                field(KNHfromBaseTableExt; Customer."KNH Credit Rating") { }
            }
        }
    }

    trigger OnPreReport()
    begin
        // add code to run before the report is run, will be run after the original report's equivalent trigger
    end;

    trigger OnPostReport()
    begin
        // add code to run after the report is run, will be run after the original report's equivalent trigger
    end;
}
