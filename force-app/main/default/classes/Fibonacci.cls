public class Fibonacci {
    public String getnerateFibbonaci(Integer num) {
        String fibobonaciSeries = 'Fibonacci Series: ';
        Integer f1 = 0, f2 = 1, nextNum = 0;
        for(Integer i=0;i<num;i++) {
                nextNum = f1 + f2;
                f1 = f2;
                f2 = nextNum;
                fibobonaciSeries += ', '+String.valueOf(nextNum);
        }
        return fibobonaciSeries;
    }
}