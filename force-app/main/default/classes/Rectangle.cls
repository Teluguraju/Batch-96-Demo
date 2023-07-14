/*
    *Top-level type must have public or global visibility
    *Default access modifier Private
*/
public class Rectangle{
    //Variables
    @TestVisible Decimal length,breadth;
    
   // Default Constructor
   public Rectangle(){
       length=breadth=0;
   }
   //Parameter Construtor
   public Rectangle(Decimal length,Decimal breadth){
       system.debug('Inside Decimal construtor');
       this.length=length;
       this.breadth=breadth;
       
   }
   public Rectangle(Integer length,Integer breadth){
       system.debug('Inside Integer construtor');
       this.length=length;
       this.breadth=breadth;
       
   }
    //Methods
   public void showResult()
   {
       system.debug('length'+length);
       system.debug('breadth'+breadth);
   }
   public Decimal area()
   {
       Decimal result=length*breadth;
       return result;
   }
    public Decimal area(Decimal length,Decimal breadth)
   {
       return length*breadth;
   }
    public Decimal perimeter()
    {
        return 2*(length+breadth);
    }
    public Decimal perimeter(Decimal length,Decimal breadth)
    {
        return 2*(length+breadth);
    }
    
    /*
                    Rectangle rect1=new Rectangle();
                    rect1.showResult();
                    system.debug('Area'+rect1.area());//0
                    system.debug('Area with params '+rect1.area(10,20));//200
                    system.debug('perimeter :'+rect1.perimeter());//0
                    
                    Rectangle rect2=new Rectangle(1,2);
                    rect2.showResult();
                    system.debug('Area'+rect2.area());//2
                    system.debug('Area with params '+rect2.area(10.5,2));//21.0
                    system.debug('perimeter :'+rect2.perimeter());//6
                    
                    Rectangle rect3=new Rectangle(10,20);
                    rect3.showResult();
                    system.debug('Area'+rect3.area());//200
                    system.debug('Area with params '+rect3.area(2,2));//4
                    system.debug('perimeter :'+rect3.perimeter());//60 
 	*/
                       
}