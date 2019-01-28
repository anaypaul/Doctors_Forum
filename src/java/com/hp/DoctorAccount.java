package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

public class DoctorAccount extends ActionSupport implements ServletRequestAware{
    HttpServletRequest request;
    @Override
    public String execute() {
            request.setAttribute("v2", "account");
            return "success";
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
}