package com.social.job;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class ScheduledStatus {

    //基于注解配置的定时任务
    //每10秒执行一次 0/10 * * * * ?
    //每天中午12点触发 0 0 12 * * ?
    @Scheduled(cron = "0/10 * * * * ?")
    public void scheduled() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
        System.out.println("AnnotationJob 开始调度，当前时间：" + simpleDateFormat.format(new Date()));
    }
}
