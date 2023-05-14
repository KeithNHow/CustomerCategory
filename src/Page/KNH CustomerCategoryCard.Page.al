/// <summary>
/// Page CustomerCategoryCardPKT (ID 50326)
/// </summary>
page 50326 "KNH CustomerCategoryCard"
{

    Caption = 'Customer Category Card';
    PageType = Card;
    UsageCategory = Lists;
    ApplicationArea = Basic, Suite;
    RefreshOnActivate = true;
    SourceTable = "KNH CustomerCategory";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
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
                    Tooltip = 'Blocked';
                }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field(TotalCustomersForCategory; Rec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Statistics';
                }
                field(TotalSalesAmount; Rec.TotalSalesAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales Order Amount';
                    ToolTip = 'Total Sales Order Amount';
                    Editable = false;
                    Style = Strong;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.TotalSalesAmount := Rec.GetSalesAmount();
    end;
}
