package com.vm1.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Controller
public class HelloWorldController {

    @GetMapping("/")
    @ResponseBody
    public String hello() {
      String hostname = getHostname();
      
      return "<html><body><h1>Hello World! " + hostname + "</h1></body></html>";
    }
    
    private static String getHostname() {
      String hostname = null;
      
      try {
        // Get the hostname of the current machine
        hostname = InetAddress.getLocalHost().getHostName();
        hostname = "Hostname of the machine is: " + hostname;
      } catch (UnknownHostException e) {
        hostname = "Hostname could not be determined.";
      }
      
      return hostname;
    }
}
