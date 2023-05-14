/// <summary>
/// PageExtension KNH Customer List Extension (ID 50103) extends Record Customer List
/// </summary>
pageextension 50303 "KNH CustomerList" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("KNH KNHAssign Default Category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category to all Customers';
                Tooltip = 'Assigns the Default Category to all Customers';

                trigger OnAction()
                var
                    CustManagement: Codeunit "KNH CustomerCategoryMgmt";
                begin
                    CustManagement.AssignDefaultCategory();
                end;
            }
        }
        addlast(Reports)
        {
            action("KNH KNHCustomer Overview Query")
            {
                Image = Report2;
                Promoted = True;
                PromotedCategory = Report;
                PromotedIsBig = True;
                ApplicationArea = All;
                Caption = 'Customer - Query Overview';
                Tooltip = 'View list of records for customers and their ledger entries';
                RunObject = query "KNH CustomerOverview";
            }
        }
    }

    views
    {
        addlast
        {
            view(CustomersWithoutCategory)
            {
                Caption = 'Customers Without Category Assigned';
                Filters = where("KNH Customer Category Code" = filter(''));
            }
        }
    }
    /*
    trigger OnOpenPage();
    var
        VariantTest: Codeunit "KNH Variant Test";
    begin
        VariantTest.Test();
    end;
    */

    trigger OnOpenPage();
    var
        JsonObj: JsonObject;
    begin
        // Cust.FindFirst();
        // Message('%1', Json.Rec2Json(C));
        JsonObj.ReadFrom('{"No": "99999", "Name": "Yotube Demo","Invoice_Copies": "99999"}');
    end;
}