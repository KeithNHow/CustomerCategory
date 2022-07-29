/// <summary>
/// Page Customer Category List (ID 50102)
/// </summary>
page 50102 "KNH Customer Category List"
{
    PageType = List;
    SourceTable = "KNH Customer Category";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Customer Category List';
    AdditionalSearchTerms = 'ranking, categorization';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = All;
                }
                field(TotalCustomersForCategory; Rec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Default Category")
            {
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Creates default category';
                Caption = 'Create default category';
                trigger OnAction();
                var
                    CustMgmt: Codeunit "KNH Customer Category Mgmt";
                begin

                    OnBeforeCreateDefaultCategoryAction(Rec); //Call Integration event
                    CustMgmt.CreateDefaultCategory();
                    OnAfterCreateDefaultCategoryAction(Rec); //Call Integration event
                end;
            }
        }
    }


    [IntegrationEvent(true, false)]
    local procedure OnBeforeCreateDefaultCategoryAction(var CustomerCategory: Record "KNH Customer Category")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterCreateDefaultCategoryAction(var CustomerCategory: Record "KNH Customer Category")
    begin
    end;

}
