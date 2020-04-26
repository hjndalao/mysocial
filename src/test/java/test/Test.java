package test;

import com.social.pojo.RegistrationOfCases;
import com.social.service.RegistraionOfCasesService;
import com.social.serviceImpl.RegistraionOfCasesServiceImpl;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    @org.junit.Test
    public void test() {
       /* ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext(new String[]{"spring-mvc.xml","spring-mybatis.xml"});
        RegistraionOfCasesService registraionOfCasesService = (RegistraionOfCasesServiceImpl)classPathXmlApplicationContext.getBean("registraionOfCasesService");
        RegistrationOfCases registrationOfCases = new RegistrationOfCases();*/
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
        String format = sdf.format(date);
        String format1 = sdf2.format(date);
        System.out.println((Integer.valueOf(format1)));
    }
}
