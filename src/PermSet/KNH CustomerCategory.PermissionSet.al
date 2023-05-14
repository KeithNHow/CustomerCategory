/// <summary>
/// Unknown "KNH CustomerCategory" (ID 50300).
/// </summary>
permissionset 50300 "KNH CustomerCategory"
{
    Assignable = true;
    Caption = 'Customer Category', MaxLength = 30;
    Permissions = table "KNH CustomerCategory" = X,
        tabledata "KNH CustomerCategory" = RMID,
        table "KNH FreeGift" = X,
        tabledata "KNH FreeGift" = RMID,
        table "KNH ExtensionSetup" = X,
        tabledata "KNH ExtensionSetup" = RMID,
        codeunit "KNH EventPublishers" = X,
        codeunit "KNH CustomerCategoryMgmt" = X,
        codeunit "KNH FreeGiftsMgmt" = X,
        page "KNH FreeGiftList" = X,
        page "KNH CustomerCategoryList" = X,
        page "KNH ExtensionSetup" = X,
        page "KNH CustomerCategoryCard" = X,
        report "KNH CustomerCategoryList" = X,
        report "KNH ExcelTestReport" = X,
        report "KNH ItemLedgerEntryAnalysis" = X,
        codeunit "KNH EventSubscriptions" = X,
        query "KNH CustomerOverview" = X;
}