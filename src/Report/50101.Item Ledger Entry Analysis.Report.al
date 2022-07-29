/// <summary>
/// Report Item Ledger Entry Analysis (ID 50001)
/// </summary>
report 50101 "Item Ledger Entry Analysis"
{
    ApplicationArea = All;
    Caption = 'Item Ledger Entry Analysis';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/rdlc/50101ItemLedgerEntryAnalysis.rdlc';
    UseRequestPage = true;

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(EntryType; "Entry Type")
            {
            }
            column(CustomerCategory; "Customer Category")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(IncludeLogo; IncludeLogo)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(IncludeLogo; IncludeLogo)
                    {
                        Caption = 'Include Company Logo';
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    labels
    {
        PageNo = 'Page';
        BCReportName = 'Item Ledger Entry Analysis';
    }

    trigger OnPreReport()
    begin
        if includeLogo then begin
            CompanyInfo.Get;  //Get Company Information record           
            CompanyInfo.CalcFields(Picture);  //Retrieve company logo
        end;
    end;

    var
        CompanyInfo: Record "Company Information";
        IncludeLogo: Boolean;

}
