/// <summary>
/// Codeunit KNH Free Gifts Mgmt (ID 50321)
/// </summary>
codeunit 50321 "KNHFreeGiftsMgmt"
{
    /// <summary>
    /// Event Subs - Add free gift code after validation of Quatity field in Sales Line table, and raise integration events before and after inserting Sles Line 
    /// </summary>
    /// <param name="Rec"></param>
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure AddFreeGift(var Rec: Record "Sales Line")
    var
        FreeGift: Record "KNHFreeGift";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        if (Rec.Type = Rec.Type::Item) and (Customer.Get(Rec."Sell-to Customer No.")) then
            if FreeGift.Get(Customer."KNH Customer Category Code", Rec."No.") and
               (rec.Quantity > FreeGift.MinimumOrderQuantity)
            then begin
                OnBeforeFreeGiftSalesLineAdded(Rec); //call pub method
                SalesLine.Init();
                SalesLine.TransferFields(Rec);
                SalesLine."Line No." := Rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                OnAfterFreeGiftSalesLineAdded(Rec, SalesLine); //call pub method
            end;
    end;

    /// <summary>
    /// Event Pub - Include Sender, Global Variable Access
    /// </summary>
    [IntegrationEvent(true, false)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var SalesLine: Record "Sales Line")
    begin
    end;

    /// <summary>
    /// Event Pub - Include Sender, Global variable Access
    /// </summary>
    [IntegrationEvent(true, false)]
    local procedure OnAfterFreeGiftSalesLineAdded(var SalesLine: Record "Sales Line"; var SalesLineGift: Record "Sales Line")
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
        if Rec."Entry Type" = Rec."Entry Type"::Sale then
            if Customer.Get(Rec."Source No.") then begin
                Rec."KNH Customer Category" := Customer."KNH Customer Category Code";
                Rec.Modify();
            end;
    end;
}