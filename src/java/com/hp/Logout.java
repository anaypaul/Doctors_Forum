package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;

public class Logout extends ActionSupport implements ServletRequestAware{
    HttpServletRequest request;
    @Override
    public String execute() {
        HttpSession hs = request.getSession();
        hs.removeAttribute("name");
        hs.invalidate();
        request.setAttribute("msg", "Successfully Logged Out");
        return "success";
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
}