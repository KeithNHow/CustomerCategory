/// <summary>
/// Page "KNH Customer Card Extension" extends Customer Card.
/// </summary>
pageextension 50304 "KNHCustomerCard" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("KNH Customer Category"; Rec."KNH Customer Category Code")
            {
                ToolTip = 'Customer Category';
                ApplicationArea = All;
            }
        }
        modify(Address)
        {
            trigger OnBeforeValidate()
            begin
                KNHEventPublishers.OnAddrLineChanged(Rec.Address);
            end;
        }
        modify("Address 2")
        {
            trigger OnBeforeValidate()
            begin
                KNHEventPublishers.OnAddrLineChanged(Rec."Address 2");
            end;
        }
    }
    actions
    {
        addlast(Processing)
        {
            action("KNH KNHAssign default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category';
                ToolTip = 'Assigns the default category for the selected customer';

                trigger OnAction();
                var
                    CustMgmt: Codeunit "KNHCustomerCategoryMgmt";
                begin
                    CustMgmt.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
    }

    var
        KNHEventPublishers: Codeunit "KNHEventPublishers";

    trigger OnClosePage()
    begin
    end;
}