package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

public class DoctorNewMsg extends ActionSupport implements ServletRequestAware{
    HttpServletRequest request;
    @Override
    public String execute() {
        try {
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            PreparedStatement pst = con.prepareStatement("select distinct sender from email where receiver  = ?");
            pst.setString(1, (String) hs.getAttribute("name"));
            ResultSet r = pst.executeQuery();
            Result rs = ResultSupport.toResult(r);
            request.setAttribute("rs", rs);
            request.setAttribute("v2", "newmsg");
        }    
        catch(Exception e) {
            System.out.println(e);
        }
        return "success";
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
}