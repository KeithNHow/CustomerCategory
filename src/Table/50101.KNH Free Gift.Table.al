/// <summary>
/// Table Free Gift (ID 50101)
/// </summary>
table 50101 "KNH Free Gift"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "KNH Free Gift List";
    LookupPageId = "KNH Free Gift List";
    Caption = 'Free Gifts';
    fields
    {
        field(1; CustomerCategoryCode; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "KNH Customer Category";
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
                Publisher: Codeunit "KNH Event Publishers";
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