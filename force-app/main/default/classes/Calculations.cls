public class Calculations {
    /* 
        Calculations cal=new Calculations();
        system.System.debug('Addition  :'+cal.add(10,20));
        system.System.debug('Substraction  :'+cal.sub(100,20));
        system.System.debug('Multiplicstion  :'+cal.mul(10,20));
        system.System.debug('Division  :'+cal.div(40,20));
 		system.System.debug('Division  :'+cal.div(40,0));-->Exeception
    */

    
    public Integer add(Integer num1,Integer num2){
        return num1+num2;
    }
    public Integer sub(Integer num1,Integer num2){
        return num1-num2;
    }
    public Integer mul(Integer num1,Integer num2){
        return num1*num2;
    }
    public Integer div(Integer num1,Integer num2){
        try {
            return num1/num2;
            
        } catch (Exception e) {
            system.debug('Exeception :'+e.getMessage()+'in line number :'+e.getLineNumber());
            
        }
        return null;
        
    }
}