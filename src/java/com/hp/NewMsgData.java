package com.hp;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;

public class NewMsgData extends ActionSupport implements ServletRequestAware, ModelDriven{
    HttpServletRequest request;
    NewMsg n = new NewMsg();
    @Override
    public String execute() {
        try {
             HttpSession hs = request.getSession();
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","anay");
            
            PreparedStatement pst = con.prepareStatement("select max(sno) as max from email");
            ResultSet r = pst.executeQuery();
            String sno = null;
            while(r.next())
            {
                sno = r.getString(1);
            }
            if(sno == null)
            {
                sno = "0";
            }
            for(String temp:n.sendto)
            {
               int a = Integer.parseInt(sno);
               a = a+1;
               sno = String.valueOf(a);
               System.out.println(sno+" "+temp);
                
                pst = con.prepareStatement("insert into email values(?,?,?,?,?,?)");
                pst.setString(1,sno);
                pst.setString(2, (String) hs.getAttribute("name"));
                pst.setString(3,temp);
                pst.setString(4,n.subject);
                pst.setString(5,n.category);
                pst.setString(6,n.problem);
                pst.executeUpdate();
            }
            request.setAttribute("msg", "Message Sent");
            return "success";
        }    
        catch(Exception e) {
            System.out.println(e);
            request.setAttribute("msg", "Sql Error. Try Again.");
            return "success";
        }
    }

    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public Object getModel() {
        return n;
    }
}