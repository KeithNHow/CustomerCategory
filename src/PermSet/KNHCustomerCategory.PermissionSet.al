/// <summary>
/// Unknown "KNH CustomerCategory" (ID 50300).
/// </summary>
permissionset 50300 "KNHCustomerCategory"
{
    Assignable = true;
    Caption = 'Customer Category', MaxLength = 30;
    Permissions = table "KNHCustomerCategory" = X,
        tabledata "KNHCustomerCategory" = RMID,
        table "KNHFreeGift" = X,
        tabledata "KNHFreeGift" = RMID,
        table "KNHExtensionSetup" = X,
        tabledata "KNHExtensionSetup" = RMID,
        codeunit "KNHEventPublishers" = X,
        codeunit "KNHCustomerCategoryMgmt" = X,
        codeunit "KNHFreeGiftsMgmt" = X,
        page "KNHFreeGiftList" = X,
        page "KNHCustomerCategoryList" = X,
        page "KNHExtensionSetup" = X,
        page "KNHCustomerCategoryCard" = X,
        report "KNHCustomerCategoryList" = X,
        report "KNHExcelTestReport" = X,
        report "KNHItemLedgerEntryAnalysis" = X,
        codeunit "KNHEventSubscriptions" = X,
        query "KNHCustomerOverview" = X;
}