/// <summary>
/// Page ExtensionSetupPKT (ID 50123)
/// </summary>
page 50123 "KNH Extension Setup"
{
    Caption = 'Extension Setup';
    PageType = Card;
    SourceTable = "KNH Extension Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field';
                    ApplicationArea = All;
                }
                field("Minimum Accepted Vendor Rate"; Rec."Minimum Accepted Vendor Rate")
                {
                    ToolTip = 'Specifies the value of the Minimum Accepted Vendor Rate field';
                    ApplicationArea = All;
                }
                field("Gift Tolerance Qty"; Rec."Gift Tolerance Qty")
                {
                    ToolTip = 'Specifies the value of the Gift Tolerance Qty field';
                    ApplicationArea = All;
                }
            }
        }
    }
}
