/// <summary>
/// Codeunit Acora "Publishers" (ID 50315).
/// </summary>
codeunit 50315 "KNH Event Publishers"
{
    /// <summary>
    /// OnAddrLineChanged called from Customer Card page, calls integration event in event subs codeunit
    /// </summary>
    /// <param name="Line">Text[100].</param>
    [IntegrationEvent(false, false)]
    procedure OnAddrLineChanged(Line: Text[100])
    begin

    end;

    /// <summary>
    /// MinOrderQty called from free gift table, calls integration event in event subs codeunit
    /// </summary>
    /// <param name="Qty">Decimal.</param>
    [IntegrationEvent(false, false)]
    procedure MinOrderQty(Qty: Decimal)
    begin

    end;
}