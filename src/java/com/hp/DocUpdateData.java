package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;

public class DocUpdateData extends ActionSupport implements ServletRequestAware, ModelDriven{
    HttpServletRequest request;
    DocUpdate u = new DocUpdate();
    @Override
    public String execute() {
        try {
            HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            
            PreparedStatement pst = con.prepareStatement("update doctordata set firstname = ?, lastname = ?, age = ?, gender = ?, speciality = ? where name = ?");
            pst.setString(1,u.fname);
            pst.setString(2,u.lname); 
            pst.setString(3,u.age);
            pst.setString(4,u.gender);
            pst.setString(5,u.specialization);
            pst.setString(6, (String) hs.getAttribute("name"));
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