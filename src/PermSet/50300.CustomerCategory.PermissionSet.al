/// <summary>
/// Unknown "CustomerCategory" (ID 50300).
/// </summary>
permissionset 50300 CustomerCategory
{
    Assignable = true;
    Caption = 'Customer Category', MaxLength = 30;
    Permissions =
        table "KNH Customer Category" = X,
        tabledata "KNH Customer Category" = RMID,
        table "KNH Free Gift" = X,
        tabledata "KNH Free Gift" = RMID,
        table "KNH Extension Setup" = X,
        tabledata "KNH Extension Setup" = RMID,
        codeunit "KNH Event Publishers" = X,
        codeunit "KNH Customer Category Mgmt" = X,
        codeunit "KNH Free Gifts Mgmt" = X,
        page "KNH Free Gift List" = X,
        page "KNH Customer Category List" = X,
        page "KNH Extension Setup" = X,
        page "KNH Customer Category Card" = X,
        query "KNH Customer Overview" = X,
        report "KNH Customer Category List" = X,
        report "Item Ledger Entry Analysis" = X;
}
