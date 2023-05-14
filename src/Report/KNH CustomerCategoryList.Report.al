/// <summary>
/// Report CustomerCategoryList (ID 50300)
/// </summary>
report 50300 "KNH CustomerCategoryList"
{
    //DefaultLayout = Word
    RDLCLayout = './src/report/layouts\KNHCustomerCategoryList.rdlc';
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Customer Category List';

    dataset
    {
        dataitem(CustomerCategory; "KNH CustomerCategory")
        {
            column("Code"; Code)
            {
            }
            column(Description; Description)
            {
            }
            column(TotalCustomersForCategory; TotalCustomersForCategory)
            {
            }
            column(FreeGiftsAvailable; FreeGiftsAvailable)
            {
            }

            trigger OnAfterGetRecord()
            var
            begin
                CalcFields(TotalCustomersForCategory)
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
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
}