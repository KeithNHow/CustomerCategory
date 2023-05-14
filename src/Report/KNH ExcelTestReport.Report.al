/// <summary>
/// Report Excel Test Report (ID 50302).
/// </summary>
report 50302 "KNH ExcelTestReport"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Excel Test Report';
    UsageCategory = ReportsAndAnalysis;
    ExcelLayout = 'Customer Excel Test.xlsx';
    DefaultLayout = Excel;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Cust; "No.")
            {
            }
            column(Name_Cust; Name)
            {
            }
            column(Address_Cust; Address)
            {
            }
            column(City_Cust; City)
            {
            }
            column(PostCode_Cust; "Post Code")
            {
            }
            column(PhoneNo_Cust; "Phone No.")
            {
            }
            column(Salesperson_Code_Cust; "Salesperson Code")
            {
            }
            column(Balance_Cust; Balance)
            {
            }
            column(SalesLCY_Cust; "Sales (LCY)")
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                column(Customer_No_CL; "Customer No.")
                {
                }
                column(Customer_Name_CL; "Customer Name")
                {
                }
                column(Posting_Date_CL; "Posting Date")
                {
                }
                column(Document_Date_CL; "Document Date")
                {
                }
                column(Document_Type_CL; "Document Type")
                {
                }
            }
        }
    }
}
