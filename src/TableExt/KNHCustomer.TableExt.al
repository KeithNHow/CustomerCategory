/// <summary>
/// TableExtension KNH Customer (ID 50300) extends Record Customer
/// </summary>
tableextension 50300 "KNHCustomer" extends Customer
{
    fields
    {
        field(50100; "KNH Customer Category Code"; Code[20])
        {
            TableRelation = "KNHCustomerCategory".Code;
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
        }
        field(50000; "KNH Credit Rating"; Text[30])
        {
            Caption = 'Credit Rating';
            DataClassification = CustomerContent;
        }
    }
}