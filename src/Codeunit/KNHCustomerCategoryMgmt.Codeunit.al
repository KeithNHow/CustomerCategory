/// <summary>
/// Codeunit KNH Customer Management (ID 50320)
/// </summary>
codeunit 50320 "KNHCustomerCategoryMgmt"
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
        KNHCustomerCategory: Record "KNHCustomerCategory";
    begin
        Customer.Get(CustomerCode);
        KNHCustomerCategory.SetRange(Default, true);
        if KNHCustomerCategory.FindSet() then
            repeat
                Customer."KNH Customer Category Code" := KNHCustomerCategory.Code;
                Customer.Modify();
            until KNHCustomerCategory.Next() = 0;
    end;

    /// <summary>
    /// Set default category for all Customers
    /// </summary>
    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        KNHCustomerCategory: Record "KNHCustomerCategory";
    begin
        KNHCustomerCategory.SetRange(Default, true);
        if KNHCustomerCategory.FindFirst() then
            if Customer.FindSet(true) then
                repeat
                    Customer."KNH Customer Category Code" := KNHCustomerCategory.Code;
                    Customer.Modify();
                until Customer.Next() = 0;
    end;

    /// <summary>
    /// Creates a default Customer Category
    /// </summary>
    procedure CreateDefaultCategory()
    var
        KNHCustomerCategory: Record "KNHCustomerCategory";
    begin
        KNHCustomerCategory.Code := 'DEFAULT';
        KNHCustomerCategory.Description := 'Default Customer Category';
        KNHCustomerCategory.Default := true;
        if KNHCustomerCategory.Insert() then;
    end;

    /// <summary>
    /// Returns the number of Customers without an assigned Customer Category
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("KNH Customer Category Code", '');
        exit(Customer.Count());
    end;
}