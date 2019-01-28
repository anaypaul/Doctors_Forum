
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


public class RegisterData extends ActionSupport implements ModelDriven, ServletRequestAware{
    Register reg = new Register();
    HttpServletRequest request;
   
    @Override
    public String execute(){
        try {
            if(!(reg.pass.equals(reg.pass1)))
            {
                request.setAttribute("msg","Passwords do not match.");
                return "error";
            }
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            PreparedStatement pst = con.prepareStatement("insert into login values(?,?,?)");
            pst.setString(1,reg.name);
            pst.setString(2,reg.pass);
            pst.setString(3,reg.type);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                request.setAttribute("msg", "Successfully Registered");
                return "success";
            }
             
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        request.setAttribute("msg", "Username Already Exists");
        return "error";
    }
    
    public Object getModel() {
        return reg;
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request=hsr;
    }
    
    @Override
    public void validate() {
        if(reg.getName().equals(""))
            addFieldError("name", "Username is required");
         if(reg.getPass().equals(""))
            addFieldError("pass", "Password is required");
         if(reg.getPass1().equals(""))
            addFieldError("pass1", "Password is required");
    }
}

