/// <summary>
/// Table KNH Free Gift (ID 50301)
/// </summary>
table 50301 "KNHFreeGift"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "KNHFreeGiftList";
    LookupPageId = "KNHFreeGiftList";
    Caption = 'Free Gifts';
    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "KNHCustomerCategory";
            Caption = 'Customer Category Code';
        }
        field(2; ItemNo; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Item No.';
        }
        field(3; MinimumOrderQuantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum Order Quantity';

            trigger OnValidate()

            var
                Publisher: Codeunit "KNHEventPublishers";
            begin
                Publisher.MinOrderQty(MinimumOrderQuantity);
            end;
        }

        field(4; GiftQuantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gift Quantity';
        }
    }

    keys
    {
        key(PK; CustomerCategoryCode, ItemNo)
        {
            Clustered = true;
        }
    }
}