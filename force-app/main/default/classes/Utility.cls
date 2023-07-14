public class Utility {
    public static Boolean isDupeExstInSet(Set<String> strSet,String str)
    {
        Boolean isTrue=False;
        for(String setVal:strSet){
            if(setVal.equalsIgnoreCase(str)){
                isTrue=True;
                break;
            }
        }
        return isTrue;
}
    

}