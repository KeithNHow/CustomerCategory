/// <summary>
/// PageExtension Customer List Extension (ID 50103) extends Record Customer List
/// </summary>
pageextension 50303 "KNH Customer List" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("Assign Default Category")
            {
                Image = ChangeCustomer;
                Promoted = True;
                PromotedCategory = Process;
                PromotedIsBig = True;
                ApplicationArea = All;
                Caption = 'Assign Default Category to all Customers';
                Tooltip = 'Assigns the Default Category to all Customers';

                trigger OnAction()
                var
                    CustManagement: Codeunit "KNH Customer Category Mgmt";
                begin
                    CustManagement.AssignDefaultCategory();
                end;
            }
        }
        addlast(Reports)
        {
            action("Customer Overview Query")
            {
                Image = Report2;
                Promoted = True;
                PromotedCategory = Report;
                PromotedIsBig = True;
                ApplicationArea = All;
                Caption = 'Customer - Query Overview';
                Tooltip = 'View list of records for customers and their ledger entries';
                RunObject = query "KNH Customer Overview";
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
                Filters = where("Customer Category Code" = filter(''));
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