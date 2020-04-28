package test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    @org.junit.Test
    public void test() {
        double v = Math.random() * 100;
        System.out.println((int) v + new SimpleDateFormat("yyyyMMddHH").format(new Date()) + "banner.sql");
    }
}
