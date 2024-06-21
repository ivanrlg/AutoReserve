pageextension 50100 "Sales Orders" extends "Sales Order"
{
    actions
    {
        addafter("Pla&nning")
        {
            action(AutoReserveAction)
            {
                ApplicationArea = All;
                Caption = 'Auto Reserve';
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    Reservation: Codeunit "Auto Reserve Management";
                begin
                    Reservation.AutoReserveSalesOrderLines(Rec);
                end;
            }
        }
    }
}
