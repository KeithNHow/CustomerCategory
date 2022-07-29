/// <summary>
/// Codeunit FreeGiftsMgmt (ID 50121)
/// </summary>
codeunit 50121 "KNH Free Gifts Mgmt"
{
    /// <summary>
    /// Event Subs - Add free gift code after validation of Quatity field in Sales Line table, and raise integration events before and after inserting Sles Line 
    /// </summary>
    /// <param name="Rec"></param>
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure AddFreeGift(var Rec: Record "Sales Line")
    var
        FreeGift: Record "KNH Free Gift";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        if (Rec.Type = Rec.Type::Item) and (Customer.Get(Rec."Sell-to Customer No.")) then begin
            if FreeGift.Get(Customer."Customer Category Code", Rec."No.") and
               (rec.Quantity > FreeGift.MinimumOrderQuantity)
            then begin
                OnBeforeFreeGiftSalesLineAdded(Rec); //call pub method
                SalesLine.init;
                SalesLine.TransferFields(Rec);
                SalesLine."Line No." := Rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                OnAfterFreeGiftSalesLineAdded(Rec, SalesLine); //call pub method
            end;
        end;
    end;

    /// <summary>
    /// Event Pub - Include Sender, Global Variable Access
    /// </summary>
    [IntegrationEvent(true, false)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    /// <summary>
    /// Event Pub - Include Sender, Global variable Access
    /// </summary>
    [IntegrationEvent(true, false)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line"; var SalesLineGift: Record "Sales Line")
    begin
    end;

    /// <summary>
    /// Event Subs - Modify Customer Cat. in ILE from Cust. where Entry Type = Sale in ILE
    /// </summary>
    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '', false, false)]
    local procedure ModifyCustomerCategory(var Rec: Record "Item Ledger Entry")
    var
        Customer: Record Customer;
    begin
        if Rec."Entry Type" = Rec."Entry Type"::Sale then begin
            if Customer.Get(Rec."Source No.") then begin
                Rec."Customer Category" := Customer."Customer Category Code";
                Rec.Modify();
            end;
        end;
    end;
}