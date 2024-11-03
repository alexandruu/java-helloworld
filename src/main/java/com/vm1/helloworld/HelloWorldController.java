package com.vm1.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloWorldController {

    @GetMapping("/")
    @ResponseBody
    public String hello() {
        return "<html><body><h1>Hello World!</h1></body></html>";
    }
}
