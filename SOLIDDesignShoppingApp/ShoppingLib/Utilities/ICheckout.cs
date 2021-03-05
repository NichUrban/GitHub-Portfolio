namespace ShoppingLib
{
    public interface ICheckout
    {
        ICart Cart { get; }

        string DisplayCheckOutMessage();
    }
}