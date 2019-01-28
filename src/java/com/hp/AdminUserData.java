package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

public class AdminUserData extends ActionSupport implements ServletRequestAware, ModelDriven{
    HttpServletRequest request;
    AdUser a = new AdUser();
    @Override
    public String execute() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            PreparedStatement pst = con.prepareStatement("delete from email where sno = ?");
            pst.setString(1,a.sno);
            pst.executeUpdate();
            request.setAttribute("msg", "Message Deleted");
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
        return a;
    }
}