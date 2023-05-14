/// <summary>
/// Table KNH Packet Extension Setup (ID 50300)
/// </summary>
table 50325 "KNH ExtensionSetup"
{
    Caption = 'PacketExtensionSetup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Minimum Accepted Vendor Rate"; Decimal)
        {
            Caption = 'Minimum Accepted Vendor Rate';
            DataClassification = CustomerContent;
        }
        field(3; "Gift Tolerance Qty"; Decimal)
        {
            Caption = 'Gift Tolerance Qty';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}
