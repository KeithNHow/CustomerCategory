/// <summary>
/// Table KNH Free Gift (ID 50301)
/// </summary>
table 50301 "KNH FreeGift"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "KNH FreeGiftList";
    LookupPageId = "KNH FreeGiftList";
    Caption = 'Free Gifts';
    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "KNH CustomerCategory";
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
                Publisher: Codeunit "KNH EventPublishers";
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