<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Untitled Document</title>
<style type="text/css">
#Layer1 {
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
        font: bold 14px cursive;
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
#Layer8 {
	position:absolute;
	left:70px;
	top:360px;
	width:150px;
	height:50px;
	z-index:8;
}

#Layer9 {
	position:absolute;
	left:70px;
	top:420px;
	width:150px;
	height:50px;
	z-index:9;
}
#ID1 {
    max-height: 50px;
}
#ID2 {
   position: relative;
   top: -25px;
}
#t1 {
        border-width:1px;
        border-style: solid;
	border-color: #663300;
        display: inline-block;
    height: 300px;
    overflow-y: scroll;
}

table {
    
}

#t2 {
     height: 50px;
}

#t4 {
    
        border-width:1px;
        border-style: solid;
	border-color: #663300;
        width:250px;
}
body {
	background: #DCDDDF;
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
        height: 650px;
	position: relative;
}
</style>
</head>

<body>
     <c:if test="${empty sessionScope.name}">
         <% response.sendRedirect("loginHome");%>
     </c:if>
     <c:if test="${sessionScope.type eq 'doctor'}">
        <% response.sendRedirect("doctorHome");%>
    </c:if>
    <c:if test="${sessionScope.type eq 'admin'}">
        <% response.sendRedirect("adminHome");%>
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
    <c:if test="${v1 eq 'newmsg'}">
        <center>
            <h1>Compose Message</h1><br><hr><br>
                <form action="newMsg" method="post">
                    Send To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="ID1" name="sendto" size="1" multiple="multiple">
                        <c:forEach var="data1" items="${requestScope.rs.rows}">
                             <option value="${data1.name}">${data1.name}</option>
                    </c:forEach>
                </select><br/><br/>
                Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='subject'/><br/><br/>
                Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="category">
            <option value="general">General</option>
            <option value="cardiologist">Cardiologist</option>
            <option value="dentist">Dentist</option>
            <option value="dermatologist">Dermatologist</option>
            <option value="gynaecologist">Gynaecologist</option>
            <option value="neurologist">Neurologist</option>
            <option value="orthopaedist">Orthopaedist</option>
            <option value="pediatricain">Pediatrician</option>
            <option value="radiologist">Radiologist</option>
            <option value="surgeon">Surgeon</option>
          </select><br/><br/>
          <label id="ID2">Problem Description</label>&nbsp;&nbsp;<textarea  rows="4" cols="30" name="problem"></textarea><br/><br/>
          <input type="submit" value="Send"/>      
               </form>
        </center>
    </c:if>
    <c:if test="${v1 eq 'inbox'}">
        <center>
            <h1>Inbox</h1><hr><br/>
        <table id='t1'>
            <tr id='t2'>
                <th id='t4'>From</th>
                <th id='t4'>Subject</th>
            </tr>
            <c:forEach var="data2" items="${requestScope.rs.rows}">
                <tr id='t2'>
                <td id='t4'>${data2.sender}</td>
                <td id='t4'>${data2.subject}</td>
                </tr>
            </c:forEach>
            
        </table>
        </center>
    </c:if>
    <c:if test="${v1 eq 'account'}">
        <center>
            <h1>Personal Details</h1><br><hr><br>
            <form action="userAccountData" method="post">
                Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="age"/><br><br>
                Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Male" />Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Female" />Female<br /><br/>
                Blood Group&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="bloodGroup">
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
          </select><br/><br/>
                Medical History&nbsp;&nbsp;<textarea name="medhistory"></textarea><br/><br/>
                <input type="submit" value="Save"/>
            </form>
                        <br><hr>
        </center>
    </c:if>
    <c:if test="${v1 eq 'update'}">
        <c:forEach var="data" items="${requestScope.rs.rows}">
        <center>
            <h1>Update Details</h1><br><hr><br>
            <form action="userUpdateData" method="post">
                Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly name="user" value="${sessionScope.name}"/><br><br>
                Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="age" value="${data.age}"/><br><br>
                Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:if test="${data.gender eq 'Male'}">
                    <input type="radio" name="gender" value="Male" checked="checked"/>Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Female" />Female<br /><br/></c:if>
                <c:if test="${data.gender eq 'Female'}">
                    <input type="radio" name="gender" value="Male" />Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Female" checked="checked"/>Female<br /><br/></c:if>
                Blood Group &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="bloodGroup">
                <c:if test="${data.bloodgroup eq 'A+'}">
                    <option value="A+"  selected="selected">A+</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'A+')}">
                    <option value="A+">A+</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'A-'}">
                    <option value="A-" selected="selected">A-</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'A-')}">
                    <option value="A-">A-</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'B+'}">
                    <option value="B+" selected="selected">B+</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'B+')}">
                    <option value="B+">B+</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'B-'}">
                    <option value="B-" selected="selected">B-</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'B-')}">
                    <option value="B-">B-</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'AB+'}">
                    <option value="AB+" selected="selected">AB+</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'AB+')}">
                    <option value="AB+">AB+</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'AB-'}">
                    <option value="AB-" selected="selected">AB-</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'AB-')}">
                    <option value="A+">A+</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'O+'}">
                    <option value="O+" selected="selected">O+</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'O+')}">
                    <option value="O+">O+</option>
                </c:if>
                <c:if test="${data.bloodgroup eq 'O-'}">
                    <option value="O-" selected="selected">O-</option>
                </c:if>
                <c:if test="${!(data.bloodgroup eq 'O-')}">
                    <option value="O-">O-</option>
                </c:if>
          </select><br/><br/>
                Medical History&nbsp;&nbsp;<textarea name="medhistory">${data.medhistory}</textarea><br/><br/>
                <input type="submit" value="Save"/>
            </form>
                        <br><hr>
                                </center></c:forEach>
    </c:if>
    <c:if test="${v1 eq 'home'}">
        <center><h1>Hey. You are in Home</h1></center>
    </c:if>        
        <center><br/><br><font size='5' color ='black'>${requestScope.msg}</font></center>
</div>
<div id="Layer4"><center><a href="userHome">Home</a></center></div>
<div id="Layer5"><center><a href="userNewMsg">Create Message</a></center></div>
<div id="Layer6"><center><a href="userInbox">Inbox</a></center></div>
<div id="Layer7"><center><a href="userAccount">Account</a></center></div>
<div id="Layer8"><center><a href="userUpdate">Update Account</a></center></div>
<div id="Layer9"><center><a href="logout">Log Out</a></center></div>
</body>
</html>
