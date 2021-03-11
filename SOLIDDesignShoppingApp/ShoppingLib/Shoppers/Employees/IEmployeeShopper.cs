namespace ShoppingLib
{
    public interface IEmployeeShopper : IDiscounts
    {
        int EmployeeIDNumber { get; set; }
    }
}