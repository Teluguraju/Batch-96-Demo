public class SavingsAccount extends BankAccount{
    public override Integer deposit(Integer amt)
    {
        system.debug('ovveride class execution');
        balance+=amt+1;//balance=balance+amt;
        return balance;
    }
}