/// <summary>
/// Page "Customer Card Extension" extends Customer Card.
/// </summary>
pageextension 50304 "KNH Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Category"; Rec."Customer Category Code")
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
            action("Assign default category")
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
                    CustMgmt: Codeunit "KNH Customer Category Mgmt";
                begin
                    CustMgmt.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
    }

    var
        KNHEventPublishers: Codeunit "KNH Event Publishers";

    trigger OnClosePage()
    begin
    end;
}