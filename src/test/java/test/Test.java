package test;

import com.social.pojo.Changes;
import com.social.service.ChangesService;
import com.social.serviceImpl.ChangesServiceImpl;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    @org.junit.Test
    public void test() {
        double v = Math.random() * 100;
        System.out.println((int) v + new SimpleDateFormat("yyyyMMddHH").format(new Date()) + "banner.sql");
    }

    public static void main(String[] args) {
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring-scheduled.xml");

    }
}
