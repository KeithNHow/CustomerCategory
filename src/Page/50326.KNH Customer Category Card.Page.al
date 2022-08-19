/// <summary>
/// Page CustomerCategoryCardPKT (ID 50326)
/// </summary>
page 50326 "KNH Customer Category Card"
{

    Caption = 'Customer Category Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "KNH Customer Category";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the No. field';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
                field(Default; Rec.Default)
                {
                    ToolTip = 'Specifies the value of the Default field';
                    ApplicationArea = All;
                }
                field(EnableNewsletter; Rec.EnableNewsletter)
                {
                    ToolTip = 'Specifies the value of the Enable Newsletter field';
                    ApplicationArea = All;
                }
                field(FreeGiftsAvailable; Rec.FreeGiftsAvailable)
                {
                    ToolTip = 'Specifies the value of the Free Gifts Available field';
                    ApplicationArea = All;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field(TotalCustomersForCategory; Rec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(TotalSalesAmount; Rec.TotalSalesAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales Order Amount';
                    Editable = false;
                    Style = Strong;
                }
            }
        }
    }
    var
        TotalSalesAmount: Decimal;

    trigger OnAfterGetRecord()
    begin
        Rec.TotalSalesAmount := Rec.GetSalesAmount();
    end;
}
