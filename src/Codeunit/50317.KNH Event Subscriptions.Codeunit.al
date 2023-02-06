/// <summary>
/// Codeunit Event Subscriptions (ID 50300)
/// </summary>
codeunit 50317 "KNH Event Subscriptions"
{
    EventSubscriberInstance = staticAutomatic;

    [EventSubscriber(ObjectType::codeunit, Codeunit::"Purch.-Post", 'OnBeforePostPurchaseDoc', '', false, false)]
    local procedure TestBreakpoint1()
    begin
        Message('Breakpoint 1 found');
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Purch.-Post", 'OnBeforePostLines', '', false, false)]
    local procedure TestBreakpoint2()
    begin
        Message('Breakpoint 2 found');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchase Batch Post Mgt.", 'OnAfterPreparePurchaseHeader', '', false, false)]
    local procedure TestBreakpoint3();
    begin
        Message('Breakpoint 3 found');
    end;


    /// <summary>
    /// CheckAddrLine called from publishers codeunit
    /// </summary>
    /// <param name="Line">Text[100].</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"KNH Event Publishers", 'OnAddrLineChanged', '', true, true)]
    local procedure CheckAddrLineOnAddrLineChanged(Line: Text[100])
    var
        newLabelMsg: Label 'Cannot use a plus sign (+) in the address [';
    begin
        if (strpos(Line, '+') > 0) then
            message(newLabelMsg + Line + ']');
    end;

    /// <summary>
    /// MinOrderQty called from publishers codeunit
    /// </summary>
    /// <param name="Qty">Decimal.</param>
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"KNH Event Publishers", 'MinOrderQty', '', true, true)]
    local procedure CustomerMinOrderQty(Qty: Decimal)
    var
        QtyMessageMsg: Label 'Sorry but a quantity of %1 is an insufficient quantity for a free gift.', Comment = '%1 = Quantity';
    begin
        if Qty < 5 then
            Message(QtyMessageMsg, Qty);
    end;
}
