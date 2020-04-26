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
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext(new String[]{"spring-mvc.xml","spring-mybatis.xml"});
        RegistraionOfCasesService registraionOfCasesService = (RegistraionOfCasesServiceImpl)classPathXmlApplicationContext.getBean("registraionOfCasesService");
        RegistrationOfCases registrationOfCases = new RegistrationOfCases();
        registrationOfCases.setUnitName("大佬");
    }
}
