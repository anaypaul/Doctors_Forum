package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

public class AdminDocData extends ActionSupport implements ServletRequestAware, ModelDriven{
    HttpServletRequest request;
    AdminDoc a = new AdminDoc();
    @Override
    public String execute() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            
            if(request.getParameter("submit").equalsIgnoreCase("Verify"))
            {
                PreparedStatement pst = con.prepareStatement("update request set status = 'accepted' where name = ?");
                pst.setString(1,a.user);
                pst.executeUpdate();
                request.setAttribute("msg", "Accepted");
            }
            else
            {
                PreparedStatement pst = con.prepareStatement("update request set status = 'rejected' where name = ?");
                pst.setString(1,a.user);
                pst.executeUpdate();
                request.setAttribute("msg", "Rejected");
            }
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