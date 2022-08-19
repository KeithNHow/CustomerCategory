/// <summary>
/// TableExtension Customer Ext (ID 50300) extends Record Customer
/// </summary>
tableextension 50300 "KNH Customer" extends Customer
{
    fields
    {
        field(50100; "Customer Category Code"; Code[20])
        {
            TableRelation = "KNH Customer Category".Code;
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
        }
        field(50000; "Credit Rating"; Text[30])
        {
            Caption = 'Credit Rating';
            DataClassification = CustomerContent;
        }
    }
}