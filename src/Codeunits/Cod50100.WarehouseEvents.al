codeunit 50100 "Warehouse Events"
{
    var
        IsolatedStorage: Codeunit "Isolated Storage";

    // Event Subscriber for 'Create Pick' Codeunit
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", OnAfterCreateTempLineCheckReservation, '', true, true)]
    local procedure OnAfterCreateTempLineCheckReservation(
    LocationCode: Code[10];
    ItemNo: Code[20];
    VariantCode: Code[10];
    UnitofMeasureCode: Code[10];
    QtyPerUnitofMeasure: Decimal;
    var TotalQtytoPick: Decimal;
    var TotalQtytoPickBase: Decimal;
    SourceType: Integer;
    SourceSubType: Option;
    SourceNo: Code[20];
    SourceLineNo: Integer;
    SourceSubLineNo: Integer;
    var LastWhseItemTrkgLineNo: Integer;
    var TempWhseItemTrackingLine: Record "Whse. Item Tracking Line" temporary;
    var WhseShptLine: Record "Warehouse Shipment Line")
    var
        WarehouseAvailabilityMgt: Codeunit "Warehouse Availability Mgt.";
        LineReservedQty: Decimal;
        TempWarehouseActivityLine: Record "Warehouse Activity Line" temporary;
        IsCreatePickCustom: Text;
    begin
        // Read value from isolated storage to check if custom process should be triggered
        IsCreatePickCustom := IsolatedStorage.Read();
        if IsCreatePickCustom <> 'CreatePickCustom' then
            exit;// Exit if the custom process is not initiated

        // Calculate the reserved quantity for the line based on inventory
        LineReservedQty := WarehouseAvailabilityMgt.CalcLineReservedQtyOnInvt(
                           SourceType, SourceSubType, SourceNo, SourceLineNo, SourceSubLineNo, true, TempWarehouseActivityLine);

        // Set the total quantity to pick to the reserved quantity
        TotalQtytoPick := LineReservedQty;
        TotalQtytoPickBase := LineReservedQty;

        // Clear the value in isolated storage after use
        IsolatedStorage.Clear();
    end;
}