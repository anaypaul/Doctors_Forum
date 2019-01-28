package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;

public class UserUpdateData extends ActionSupport implements ServletRequestAware, ModelDriven{
    HttpServletRequest request;
    Update u = new Update();
    @Override
    public String execute() {
        try {
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            
            PreparedStatement pst = con.prepareStatement("update userdata set age = ?, gender = ?, bloodgroup = ?, medhistory = ? where name = ?");
            pst.setString(1,u.age);
            pst.setString(2,u.gender);
            pst.setString(3,u.bloodGroup); 
            pst.setString(4,u.medhistory);
            pst.setString(5, (String) hs.getAttribute("name"));
            pst.executeUpdate();
            request.setAttribute("msg", "Profile Updated");
        }  
       catch(Exception e) {
            request.setAttribute("msg", "Sql Error. Try Again.");
        }
        return "success";
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public Object getModel() {
        return u;
    }
}