/// <summary>
/// TableExtension Item Ledger Entry Ext (ID 50301) extends Record Item Ledger Entry
/// </summary>
tableextension 50301 "KNH Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Customer Category"; Code[20])
        {
            TableRelation = "KNH Customer Category".Code;
        }
    }
    keys
    {
        key(FK; "Customer Category")
        {

        }
    }
}
