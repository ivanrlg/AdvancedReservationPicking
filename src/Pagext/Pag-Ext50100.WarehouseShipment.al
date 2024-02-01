pageextension 50100 "Warehouse Shipment" extends "Warehouse Shipment"
{
    actions
    {
        addafter("Create Pick")
        {
            action("CreatePickCustom")
            {
                ApplicationArea = Warehouse;
                Caption = 'Create Pick (Only Reserved)';
                Ellipsis = true;
                Image = GetSourceDoc;
                Promoted = true;
                Visible = true;

                trigger OnAction()
                var
                    IsolatedStorage: Codeunit "Isolated Storage";
                begin
                    IsolatedStorage.Store('CreatePickCustom');

                    CurrPage.Update(true);

                    Commit();
                    CurrPage.WhseShptLines.PAGE.PickCreate();
                end;
            }
        }
    }
}
