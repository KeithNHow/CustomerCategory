/// <summary>
/// Table Customer Category (ID 50300)
/// </summary>
table 50300 "KNH Customer Category"
{
    DrillDownPageId = "KNH Customer Category List";
    LookupPageId = "KNH Customer Category List";
    Caption = 'Customer Category';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate();
            begin
            end;
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
        field(4; EnableNewsletter; Enum "KNH News Letter Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Enable Newsletter';
        }
        field(5; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blocked';
        }
        field(7; TotalSalesAmount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Sales Amount';
        }
        field(10; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where("Customer Category Code" = field(Code)));
            Caption = 'Total customers for category';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
        key(K2; Description)
        {
        }
    }

    /// <summary>
    /// GetSalesAmount.
    /// </summary>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetSalesAmount(): Decimal
    var
    begin
        //exit(CustomerCategoryMgt.GetSalesAmount(Rec.Code));
    end;
}