@isTest
public class RectangleTest {
    static testMethod void rectUnitTest()
    {
            Rectangle rect1=new Rectangle();
            rect1.showResult();
            system.assertEquals(0, rect1.length);
            system.assertEquals(0, rect1.breadth);
        
            system.assertEquals(0, rect1.area());
            system.assertEquals(200, rect1.area(10,20));
            system.assertEquals(0, rect1.perimeter());
        
        
            //system.debug('Area'+rect1.area());//0
            //system.debug('Area with params '+rect1.area(10,20));//200
            //system.debug('perimeter :'+rect1.perimeter());//0
        
        Rectangle rect2=new Rectangle(10.5,20);
        rect2.showResult();
            system.assertEquals(10.5, rect2.length);
            system.assertEquals(20, rect2.breadth);
        
            system.assertEquals(210, rect2.area());
            system.assertEquals(210, rect2.area(10.5,20));
            system.assertEquals(61, rect2.perimeter());
        
            //system.debug('Area'+rect2.area());//2
            //system.debug('Area with params '+rect2.area(10.5,2));//21.0
            //system.debug('perimeter :'+rect2.perimeter());//6
        
        Rectangle rect3=new Rectangle(10,20);
        rect3.showResult();
        
            system.assertEquals(10, rect3.length);
            system.assertEquals(20, rect3.breadth);
        
            system.assertEquals(200, rect3.area());
            system.assertEquals(4, rect2.area(2,2));
            system.assertEquals(60, rect3.perimeter());
        
            //system.debug('Area'+rect3.area());//200
            //system.debug('Area with params '+rect3.area(2,2));//4
            //system.debug('perimeter :'+rect3.perimeter());//60
    }
    
    @isTest
    static void rectUnitTest2(){
        
    }

}