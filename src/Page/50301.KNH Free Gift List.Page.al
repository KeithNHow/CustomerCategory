/// <summary>
/// Page Free Gift List (ID 50301)
/// </summary>
page 50301 "KNH Free Gift List"
{
    PageType = List;
    SourceTable = "KNH Free Gift";
    UsageCategory = Lists;
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
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                }
                field(MinimumOrderQuantity; Rec.MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(GiftQuantity; Rec.GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
            }
        }
    }
}
