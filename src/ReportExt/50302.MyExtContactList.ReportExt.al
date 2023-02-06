/// <summary>
/// ReportExt "MyExtContactList" (ID 50302) extends Record Contact - List.
/// </summary>
reportextension 50302 MyExtContactList extends "Contact - List"
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