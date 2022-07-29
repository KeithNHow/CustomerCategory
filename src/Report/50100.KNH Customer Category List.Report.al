/// <summary>
/// Report CustomerCategoryList (ID 50100)
/// </summary>
report 50100 "KNH Customer Category List"
{
    //DefaultLayout = Word
    RDLCLayout = './src/report/layouts\50100.CustomerCategoryList.rdlc';
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Customer Category List';

    dataset
    {
        dataitem(CustomerCategory; "KNH Customer Category")
        {
            column(Code; Code)
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
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}