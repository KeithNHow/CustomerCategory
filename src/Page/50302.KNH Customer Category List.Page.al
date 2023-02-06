/// <summary>
/// Page Customer Category List (ID 50302)
/// </summary>
page 50302 "KNH Customer Category List"
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
                    ToolTip = 'Code';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Code';
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = All;
                    ToolTip = 'Code';
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
                PromotedOnly = true;
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
    local procedure OnBeforeCreateDefaultCategoryAction(var KNHCustomerCategory: Record "KNH Customer Category")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterCreateDefaultCategoryAction(var KNHCustomerCategory: Record "KNH Customer Category")
    begin
    end;

}
