package com.ueater.backstage.web;

import com.ueater.backstage.service.ISysAreaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 四月 24 2017 下午3:17
 */

@Slf4j
@RestController
public class HealthController {

    @Resource
    private ISysAreaService sysAreaService;

    @RequestMapping("/status")
    public String dbStatus() {
        try {
            Date dbDate = sysAreaService.queryNowTimeFromDB();
            if (Math.abs(dbDate.getTime() - System.currentTimeMillis()) > 10000) {
                return "WARN";
            }
        } catch (Exception e) {
            log.error("/status ERROR, exception:", e);
            return "ERROR";
        }
        return "OK";
    }
}
