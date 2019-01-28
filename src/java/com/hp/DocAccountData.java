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

public class DocAccountData extends ActionSupport implements ServletRequestAware, ModelDriven{
    HttpServletRequest request;
    DocAccount a = new DocAccount();
    @Override
    public String execute() {
        try {
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            
            PreparedStatement pst = con.prepareStatement("select * from doctordata where name = ?");
            pst.setString(1, (String) hs.getAttribute("name"));
            ResultSet r = pst.executeQuery();
            int flag  = 0;
            while(r.next())
            {
               flag = 1;
            }
            if(flag == 0)
            {
                
                pst = con.prepareStatement("insert into doctordata values(?,?,?,?,?,?)");
                pst.setString(1, (String) hs.getAttribute("name"));
                pst.setString(2,a.fname);
                pst.setString(3,a.lname);
                pst.setString(4,a.age);
                pst.setString(5,a.gender);
                pst.setString(6,a.specialization);
                pst.executeUpdate();
                
                pst = con.prepareStatement("insert into request values(?,'pending')");
                pst.setString(1, (String) hs.getAttribute("name"));       
                pst.executeUpdate(); 
                request.setAttribute("msg", "Profile Created. Verification Request Sent to Admin.");
              } 
            else
            {
                request.setAttribute("msg", "Profile  Already Created. Go To Update");
            }
       }
       catch(ClassNotFoundException e) {
           System.out.printf("Exception is "+e);
            request.setAttribute("msg", "Sql Error. Try Again.");
        } catch (SQLException e) {
            System.out.printf("Exception is "+e);
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