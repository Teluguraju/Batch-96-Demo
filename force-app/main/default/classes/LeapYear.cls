public class LeapYear {
    public Boolean isLeapYear(Integer year) {
        Boolean isTrue = false;
        if ( math.mod(year,400) == 0 || math.mod(year,4) == 0)
            isTrue = true;
        return isTrue;
    }
}