codeunit 50100 "Auto Reserve Management"
{
    // Main procedure to auto-reserve all sales order lines for a given Sales Header.
    procedure AutoReserveSalesOrderLines(SalesHeader: Record "Sales Header"): Text
    var
        SalesLine: Record "Sales Line";
    begin
        // Filter Sales Lines based on the provided Sales Header
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        // Iterate through each Sales Line and reserve if applicable
        if SalesLine.FindSet() then
            repeat
                if ShouldReserveSalesLine(SalesLine) then
                    ReserveSalesLine(SalesLine);
            until SalesLine.Next() = 0;

        // Display a completion message if GUI is allowed
        ShowCompletionMessage();

        // Return a success message with the Sales Order number
        exit(StrSubstNo('The Sales Order %1 has been auto-reserved.', SalesHeader."No."));
    end;

    // Function to determine if a Sales Line should be reserved
    procedure ShouldReserveSalesLine(SalesLine: Record "Sales Line"): Boolean
    begin
        // Only reserve items with optional reservation setting
        exit((SalesLine.Type = SalesLine.Type::Item) and (SalesLine.Reserve = SalesLine.Reserve::Optional));
    end;

    // Procedure to reserve a specific Sales Line
    procedure ReserveSalesLine(SalesLine: Record "Sales Line")
    var
        ReservMgt: Codeunit "Reservation Management";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        MaxQtyToReserve: Decimal;
        MaxQtyToReserveBase: Decimal;
        RemainingQtyToReserve: Decimal;
        RemainingQtyToReserveBase: Decimal;
    begin
        // Calculate the maximum quantity to reserve for the sales line
        SalesLineReserve.ReservQuantity(SalesLine, MaxQtyToReserve, MaxQtyToReserveBase);

        // Update remaining quantities to reserve if the calculated base quantity is valid
        if (MaxQtyToReserveBase <> 0) and (Abs(MaxQtyToReserveBase) < Abs(RemainingQtyToReserveBase)) then begin
            RemainingQtyToReserve := MaxQtyToReserve;
            RemainingQtyToReserveBase := MaxQtyToReserveBase;
        end;

        // Set the reservation source using the current sales line
        ReservMgt.SetReservSource(SalesLine);

        // Perform the auto-reservation specifically for Item Ledger Entries
        // The '1' in the first parameter ensures that only the item ledger entry is targeted for reservation
        ReservMgt.AutoReserveOneLine(1, MaxQtyToReserve, MaxQtyToReserveBase, '', SalesLine."Shipment Date");
    end;


    // Function to display a completion message if GUI is allowed
    procedure ShowCompletionMessage()
    begin
        // Display a message to the user indicating the reservation is complete
        if GuiAllowed then
            Message('Auto-reservation completed.');
    end;
}
