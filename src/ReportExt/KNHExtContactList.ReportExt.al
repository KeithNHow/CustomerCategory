/// <summary>
/// ReportExt "KNHExtContactList" (ID 50302) extends Record Contact - List.
/// </summary>
reportextension 50302 KNHExtContactList extends "Contact - List"
{
    rendering
    {
        layout(LayoutExcel)
        {
            Type = Excel;
            LayoutFile = 'MyExcelContactList.xlsx';
        }
    }
}