package co.edu.unal.sam.aspect.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String getIndexPage() {
        return "admin/UserManagement";
    }

}
