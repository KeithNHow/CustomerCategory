/// <summary>
/// Page KNH Extension Setup (ID 50323)
/// </summary>
page 50323 "KNHExtensionSetup"
{
    Caption = 'Extension Setup';
    ApplicationArea = Basic, Suite;
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "KNHExtensionSetup";

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
