/// <summary>
/// PageExtension KNH (ID 50301)
/// </summary>
pageextension 50301 "KNH Item" extends "Item List"
{

    actions
    {
        addlast(reporting)
        {
            action("ILE Analysis")
            {
                Image = Report2;
                Promoted = True;
                PromotedCategory = Report;
                PromotedIsBig = True;
                ApplicationArea = All;
                Caption = 'Item Ledger Entry Analysis';
                Tooltip = 'View list of records for items and their ledger entries';
                RunObject = report "Item Ledger Entry Analysis";
            }
        }
    }
}
