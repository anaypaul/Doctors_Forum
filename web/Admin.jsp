<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Admin</title>
<style type="text/css">
body {
	background: #DCDDDF;
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
	position: relative;
        height: 650px;
}
#Layer1 {
        font: bold 14px cursive;
        background:#999999;
	position:relative;
	left:0px;
	top:0px;
	width:250px;
	height:600px;
	z-index:1;
        border-width:1px;
        border-style: solid;
	border-color: #663300;
}
#Layer2 {
	position:relative;
	left:260px;
	top:-600px;
	width:1000px;
	height:100px;
	z-index:2;
        border-width:1px;
        border-style: solid;
	border-color: #663300;
}
#Layer3 {
	position:relative;
	left:260px;
	top:-590px;
	width:1000px;
	height:480px;
	z-index:3;
        border-width:1px;
        border-style: solid;
	border-color: #663300;
}
#Layer4 {
	position:absolute;
	left:70px;
	top:120px;
	width:150px;
	height:50px;
	z-index:4;
}

#Layer5 {
	position:absolute;
	left:70px;
	top:180px;
	width:150px;
	height:50px;
	z-index:5;

}
#Layer6 {
	position:absolute;
	left:70px;
	top:240px;
	width:150px;
	height:50px;
	z-index:6;

}
#Layer7 {
	position:absolute;
	left:70px;
	top:300px;
	width:150px;
	height:50px;
	z-index:7;

}
#t1 {
        border-width:1px;
        border-style: solid;
	border-color: #663300;
        
}

#t2 {
     height: 50px;
}

#t3 {
        border-width:1px;
        border-style: solid;
	border-color: #663300;
        width:20px;
}
#t4 {
    
        border-width:1px;
        border-style: solid;
	border-color: #663300;
        width:250px;
}
</style>
</head>

<body>
    <c:if test="${empty sessionScope.name}">
         <% response.sendRedirect("loginHome");%>
    </c:if>
    <c:if test="${sessionScope.type eq 'user'}">
         <% response.sendRedirect("userHome");%>
    </c:if>
    <c:if test="${sessionScope.type eq 'doctor'}">
         <% response.sendRedirect("doctorHome");%>
    </c:if>
<div id="Layer1"></div>
<div id="Layer2">
    <h1><center>Welcome ${sessionScope.name}</center></h1>
</div>
<div id="Layer3">
    <c:if test="${empty requestScope.v2}">
        <c:set var="v1" value="home"/>
    </c:if>
    <c:if test="${!(empty requestScope.v2)}">
        <c:set var="v1" value="${requestScope.v2}"/>
    </c:if>
    <c:if test="${v1 eq 'doctor'}"><center>
        <table id='t1'>
            <tr id='t2'>
                <th id='t4'>Doctor</th>
                <th id='t4'>Status</th>
                <th id='t4'>Action</th>
            </tr>
            
            <c:forEach var="data" items="${requestScope.rs.rows}">
            <form action="adminDocData" method="post">
            <tr id='t2'>
                <td id='t4'><input type='text' name='user' readonly value='${data.name}'/></td>;
                <td id='t4'><input type='text' name='status' readonly value='${data.status}'/></td>
                
                <c:if test="${data.status eq 'pending'}">
                    <td id='t4'><input type='submit' name='submit' value='Verify'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type='submit' name='submit' value='Reject'/></td>
                </c:if>
                <c:if test="${data.status eq 'accepted'}">
                    <td id='t4'><input type='submit' name='submit' value='Reject'/></td>
                </c:if> 
                <c:if test="${data.status eq 'rejected'}">
                    <td><input type='submit' name = 'submit' value='Verify'/></td>
                </c:if> 
            </tr></form>
        </c:forEach>
                        </table>
        </center></c:if>

    <c:if test="${v1 eq 'user'}"><center>
       <table id='t1'>
            <tr id='t2'>
                <th id='t3'>S No</th>
                <th id='t4'>Sender</th>
                <th id='t4'>Receiver</th>
                <th id='t4'>Subject</th>
                <th id='t4'>Message</th>
                <th id='t4'>Action</th>
            </tr>
            
            <c:forEach var="data1" items="${requestScope.rs.rows}">
            <form action="adminUserData" method="post">
            <tr id='t2'>
                <td id='t3'><input type="text" value="${data1.sno}" readonly name="sno" size="3"/></td>
                <td id='t4'><font size="4px">${data1.sender}</font></td>
                <td id='t4'><font size="4px">${data1.receiver}</font></td>
                <td id='t4'><font size="4px">${data1.subject}</font></td>
                <td id='t4'><font size="4px">${data1.msg}</font></td>
                <td id='t4'><input type='submit' name = 'submit' value='Delete'/></td>
            </tr></form>
        </c:forEach>
                        </table>
        </center>
    </c:if>
    
    <c:if test="${v1 eq 'home'}"><center>
        <center><h1>Hey. You are in Home</h1></center>
    </c:if>
        <center><br/><br><font size='5' color ='black'>${requestScope.msg}</font></center>
</div>
<div id="Layer4"><center><a href="adminHome">Home</a></center></div>
<div id="Layer5"><center><a href="adminDoctor">Doctor</a></center></div>
<div id="Layer6"><center><a href="adminUser">User</a></center></div>
<div id="Layer7"><center><a href="logout">Log Out</a></center></div>
</body>
</html>

