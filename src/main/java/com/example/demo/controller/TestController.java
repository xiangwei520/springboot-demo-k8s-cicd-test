package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * TestController class
 * 通过jenkins+k8实现CICD的测试demo
 *
 * @author xiangwei
 * @date 2022年5月23日23:19:42
 */
@RestController
public class TestController {

    @Value("${application.version:null}")
    String version;

    @RequestMapping("/myDemo")
    public String myDemo(){
        return "当前springboot-demo版本为:"+ version;
    }
}
