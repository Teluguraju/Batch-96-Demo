public abstract class AbsDemo {
    protected Integer balance =5000;

    public virtual Integer deposit(Integer amt)
    {
        balance+=amt;//balance=balance+amt;
        return balance;
    }
    public Integer withdraw(Integer amt)
    {
       try{
            if(amt>balance)
            {
                //CustomException ce =new CustomException(); ,system.debug(ce.getMessage());//
                throw new CustomException('Insuficient funds ! Try again');
                
            }
            balance-=amt;//balance=balance-amt;
       }
       catch(Exception e)
       {
            System.debug('CustomExeception :'+e.getMessage());
       }
       return balance;
       
    }

    public abstract void showResult();
}