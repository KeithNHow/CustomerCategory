/// <summary>
/// Codeunit Customer Management (ID 50120)
/// </summary>
codeunit 50120 "KNH Customer Category Mgmt"
{
    trigger OnRun();
    begin
    end;

    /// <summary>
    /// Set default category for a Customer
    /// </summary>
    /// <param name="CustomerCode"></param>
    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record "KNH Customer Category";
    begin
        Customer.Get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindSet() then begin
            Repeat
                Customer."Customer Category Code" := CustomerCategory.Code;
                Customer.Modify();
            Until Customer.Next() = 0;
        end;
    end;

    /// <summary>
    /// Set default category for all Customers
    /// </summary>
    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record "KNH Customer Category";
    begin
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            if Customer.FindSet(true, true) then
                repeat
                    Customer."Customer Category Code" := CustomerCategory.Code;
                    Customer.Modify();
                until Customer.Next() = 0;
        end;
    end;

    /// <summary>
    /// Creates a default Customer Category
    /// </summary>
    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record "KNH Customer Category";
    begin
        CustomerCategory.Code := 'DEFAULT';
        CustomerCategory.Description := 'Default Customer Category';
        CustomerCategory.Default := true;
        if CustomerCategory.Insert then;
    end;

    /// <summary>
    /// Returns the number of Customers without an assigned Customer Category
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("Customer Category Code", '');
        exit(Customer.Count());
    end;
}