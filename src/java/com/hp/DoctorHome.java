package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;

public class DoctorHome extends ActionSupport implements ServletRequestAware{
    HttpServletRequest request;
    @Override
    public String execute() throws SQLException {
        try {
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            PreparedStatement pst = con.prepareStatement("select * from doctordata where name = ?");
            pst.setString(1, (String) hs.getAttribute("name"));
            ResultSet rs = pst.executeQuery();
            int flag = 0;
            while(rs.next())
            {
                flag = 1;
            }
            if(flag == 0)
            {
                request.setAttribute("msg1", "Please Update Account");
            }
            else
            {
                pst = con.prepareStatement("select status from request where name = ?");
                pst.setString(1, (String) hs.getAttribute("name"));
                rs = pst.executeQuery();
                while(rs.next())
                {
                    if(rs.getString(1).equalsIgnoreCase("pending"))
                        request.setAttribute("msg1", "Verification is in process.");
                    else if(rs.getString(1).equalsIgnoreCase("accepted"))
                        request.setAttribute("msg1", "Your account is verified.");
                    else
                        request.setAttribute("msg1", "Your account is blocked.");
                }
                
            }
            
            request.setAttribute("v2", "home");
        }
        catch (ClassNotFoundException ex) {
        }
        return "success";
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }
}