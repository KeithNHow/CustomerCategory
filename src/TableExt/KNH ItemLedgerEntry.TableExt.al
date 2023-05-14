/// <summary>
/// TableExtension KNH Item Ledger Entry Ext (ID 50301) extends Record Item Ledger Entry
/// </summary>
tableextension 50301 "KNH ItemLedgerEntry" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "KNH Customer Category"; Code[20])
        {
            TableRelation = "KNH CustomerCategory".Code;
        }
    }
    keys
    {
        key(FK; "KNH Customer Category")
        {

        }
    }
}
