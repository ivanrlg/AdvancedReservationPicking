codeunit 50101 "Isolated Storage"
{
    var
        MySecrect: Label 'MySecrect';

    procedure Store(MySecrectText: Text)
    begin
        //Delete the old Secrect if it exists
        if IsolatedStorage.Contains(MySecrect, DataScope::Module) then
            IsolatedStorage.Delete(MySecrect, DataScope::Module);

        //Set new MySecrect
        IsolatedStorage.Set(MySecrect, MySecrectText, DataScope::Module);
    end;

    procedure Read() MySecrectText: Text
    begin
        //We check if an  Secrect exists for MySecrect
        if IsolatedStorage.Contains(MySecrect, DataScope::Module) then begin

            //If it exists, we retrieve it with the 'Get method' and store it in the MySecrect variable.
            IsolatedStorage.Get(MySecrect, DataScope::Module, MySecrectText);

            exit(MySecrectText);
        end;
    end;

    procedure Clear()
    begin
        if IsolatedStorage.Contains(MySecrect, DataScope::Module) then
            IsolatedStorage.Delete(MySecrect, DataScope::Module);
    end;
}
