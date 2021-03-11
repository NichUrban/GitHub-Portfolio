namespace ShoppingLib
{
    public interface IMemberShopper : IDiscounts
    {
        int MemberIDNumber { get; set; }
    }
}