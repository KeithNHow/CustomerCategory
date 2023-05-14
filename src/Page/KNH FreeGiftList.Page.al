/// <summary>
/// Page KNH Free Gift List (ID 50301)
/// </summary>
page 50301 "KNH FreeGiftList"
{
    PageType = List;
    SourceTable = "KNH FreeGift";
    UsageCategory = Lists;
    ApplicationArea = Basic, Suite;
    Caption = 'Free Gift List';
    AboutTitle = 'Free Gifts';
    AboutText = 'This is functionality for giving your customer a free gift.';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; Rec.CustomerCategoryCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Category Code';
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Item No.';
                }
                field(MinimumOrderQuantity; Rec.MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'Minimum Order Quantity';
                }
                field(GiftQuantity; Rec.GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                    ToolTip = 'Gift Quantity';
                }
            }
        }
    }
}
