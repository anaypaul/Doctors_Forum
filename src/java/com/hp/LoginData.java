
package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;


public class LoginData extends ActionSupport implements ModelDriven, ServletRequestAware{
    Login log = new Login();
    HttpServletRequest request;
   
    public Login getLog() {
        return log;
    }

    public void setLog(Login log) {
        this.log = log;
    }
    
    @Override
    public String execute(){
        try {
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            PreparedStatement pst = con.prepareStatement("select type from login where username  = ? and password = ?");
            pst.setString(1,log.user);
            pst.setString(2,log.pass);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                if(rs.getString(1).equalsIgnoreCase("Admin"))
                {
                    hs.setAttribute("name", log.user);
                    hs.setAttribute("type", rs.getString(1));
                    return "admin";
                }
                if(rs.getString(1).equalsIgnoreCase("Doctor"))
                {
                    hs.setAttribute("name", log.user);
                    hs.setAttribute("type", rs.getString(1));
                    return "doctor";
                }
                if(rs.getString(1).equalsIgnoreCase("User"))
                {
                    hs.setAttribute("name", log.user);
                    hs.setAttribute("type", rs.getString(1));
                    return "user";
                }
            }
            else
            {
                request.setAttribute("msg", "Invalid Username Or Password");
                return "error";
            }
             
        } catch (ClassNotFoundException ex) {
            
        } catch (SQLException ex) {
            
        }
        return "error";
    }
    
    public Object getModel() {
        return log;
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request=hsr;
    }
    
    @Override
    public void validate() {
        if(log.getUser().equals(""))
            addFieldError("user", "Username is required");
         if(log.getPass().equals(""))
            addFieldError("pass", "Password is required");   
    }
}

