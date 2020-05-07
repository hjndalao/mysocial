package com.social.job;

import com.social.pojo.RegistrationOfCases;
import com.social.pojo.Ultimate;
import com.social.service.RegistraionOfCasesService;
import com.social.service.UltimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class ScheduledStatus {
    @Autowired
    private RegistraionOfCasesService registraionOfCases;
    @Autowired
    private UltimateService ultimate;

    //基于注解配置的定时任务
    //每天中午12点触发 0 0 12 * * ?
    @Scheduled(cron = "0/50 * * * * ?")
    public void scheduled() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        System.out.println("开始调度, 当前时间:" + simpleDateFormat.format(new Date()));
        //查所有
        List<RegistrationOfCases> registrationOfCases = registraionOfCases.selectAll();
        List<Ultimate> ultimates = ultimate.selectAll();
        //遍历
        for (RegistrationOfCases registrationOfCase : registrationOfCases) {
            Integer warningTime = registrationOfCase.getWarningTime();
            if (warningTime == null) warningTime = 1;
            registrationOfCase.setWarningTime(++warningTime);
            if (registrationOfCase.getApprovalStatus() == 0 & registrationOfCase.getTypeStatus() == 4 & warningTime <= 8) {
                registraionOfCases.updateByPrimaryKeySelective(registrationOfCase);
            } else {
                continue;
            }
        }
        //遍历
        for (Ultimate ultimatess : ultimates) {
            Integer warningTime = ultimatess.getWarningTime();
            if (warningTime == null) warningTime = 1;
            ultimatess.setWarningTime(++warningTime);
            if (ultimatess.getApprovalStatus() == 1 & ultimatess.getTypeStatus() == 5 & warningTime <= 6) {
                ultimate.updateByPrimaryKeySelective(ultimatess);
            } else if (ultimatess.getApprovalStatus() == 1 & ultimatess.getTypeStatus() == 6 & warningTime <= 6) {
                ultimate.updateByPrimaryKeySelective(ultimatess);
            } else if (ultimatess.getApprovalStatus() == 1 & ultimatess.getTypeStatus() == 7 & (warningTime <= 31 || warningTime <= 6)) {
                Integer time = ultimatess.getWarningTime();
                ultimatess.setWarningTime(++time);
                if (time <= 31) {
                    ultimate.updateByPrimaryKeySelective(ultimatess);
                }
            } else if (ultimatess.getApprovalStatus() == 1 & ultimatess.getTypeStatus() == 8 & warningTime <= 6) {
                ultimate.updateByPrimaryKeySelective(ultimatess);
            } else if (ultimatess.getApprovalStatus() == 1 & ultimatess.getTypeStatus() == 9 & (warningTime <= 11 || warningTime <= 6)) {
                ultimate.updateByPrimaryKeySelective(ultimatess);
            } else if (ultimatess.getApprovalStatus() == 1 & ultimatess.getTypeStatus() == 10 & warningTime <= 261) {
                ultimate.updateByPrimaryKeySelective(ultimatess);
            } else {
                continue;
            }
        }
    }
}
