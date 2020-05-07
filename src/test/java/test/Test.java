package test;

import com.social.pojo.CaseManagement;
import com.social.pojo.Changes;
import com.social.service.ChangesService;
import com.social.serviceImpl.CaseManagementServiceImpl;
import com.social.serviceImpl.ChangesServiceImpl;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    @org.junit.Test
    public void test() {
        ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("classpath:spring-mybatis.xml");
        CaseManagementServiceImpl c = (CaseManagementServiceImpl) classPathXmlApplicationContext.getBean("caseManagementServiceImpl");
        CaseManagement caseManagement = new CaseManagement();
        caseManagement.setId(45);
        caseManagement.setStatus(0);
        c.insertSelective(caseManagement);
    }
}
