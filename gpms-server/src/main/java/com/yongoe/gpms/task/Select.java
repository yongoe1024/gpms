package com.yongoe.gpms.task;

import com.yongoe.gpms.controller.BaotaUtils;
import jakarta.annotation.Resource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * 定时任务
 *
 * @author yongoe
 * @since 2023/12/3
 */
@Service
@EnableScheduling
public class Select {
    @Resource
    private BaotaUtils baotaUtils;

    /**
     * 每分钟执行一次
     */
    @Scheduled(cron = "0 * * * * *")
    public void task1() {
        baotaUtils.getDockerList();
        System.out.println("1分钟执行一次");
    }

}
