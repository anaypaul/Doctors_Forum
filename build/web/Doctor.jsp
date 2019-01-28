<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Doctor</title>
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

#t1 {
        border-width:1px;
        border-style: solid;
	border-color: #663300;
        display: inline-block;
        height: 300px;
        overflow-y: scroll;
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
</style>
</head>

<body>
    <c:if test="${empty sessionScope.name}">
        <% response.sendRedirect("loginHome");%>
    </c:if>
    <c:if test="${sessionScope.type eq 'user'}">
        <% response.sendRedirect("userHome");%>
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
                <form action="docNewMsgData" method="post">
                    Send To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="sendto" size="1">
                        <c:forEach var="data1" items="${requestScope.rs.rows}">
                             <option value="${data1.sender}">${data1.sender}</option>
                    </c:forEach>
                </select><br/><br/>
                Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='subject'/><br/><br/>
                
          <label>Message</label>&nbsp;&nbsp;<textarea  rows="4" cols="30" name="problem"></textarea><br/><br/>
          <input type="submit" value="Send"/>      
               </form>
        </center>
    </c:if>

    <c:if test="${v1 eq 'account'}">
        <center>
            <h1>Personal Details</h1><br><hr><br>
            <form action="docAccountData" method="post">
                 First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fname" value="${data2.firstname}"/><br><br/>
                     Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="lname" value="${data2.lastname}"/><br><br/>
                Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="age"/><br><br>
                Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Male"/>Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Female"/>Female&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br/><br/>Specialization &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <select name="specialization">
                   <option value="general">General</option>
                   <option value="cardiologist">Cardiologist</option>
                   <option value="dentist">Dentist</option>
                   <option value="dermatologist">Dermatologist</option>
                   <option value="gynaecologist">Gynaecologist</option>
                   <option value="neurologist">Neurologist</option>
                   <option value="orthopaedist">Orthopaedist</option>
                   <option value="pediatrician">Pediatrician</option>
                   <option value="radiologist">Radiologist</option>
                   <option value="surgeon">Surgeon</option>
               </select><br/><br/>
                <input type="submit" value="Save"/>
            </form>
                        <br><hr>
        </center>
    </c:if>
    <c:if test="${v1 eq 'inbox'}">
        <center>
            <h1>Inbox</h1><hr><br/>
        <table id='t1'>
            <tr id='t2'>
                <th id='t4'>From</th>
                <th id='t4'>Subject</th>
                <th id='t4'>Category</th>
            </tr>
            
            <c:forEach var="data2" items="${requestScope.rs.rows}">
                <tr id='t2'>
                <td id='t4'>${data2.sender}</td>
                <td id='t4'>${data2.subject}</td>
                <td id='t4'>${data2.category}</td>
                </tr>
            </c:forEach>
        </table>
        </center>
    </c:if>
    
    <c:if test="${v1 eq 'update'}">
        <c:forEach var="data3" items="${requestScope.rs.rows}">
        <center>
            <h1>Update Details</h1><br><hr><br>
            <form action="docUpdateData" method="post">
                Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" readonly name="user" value="${sessionScope.name}"/><br><br>
                First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="fname" value="${data3.firstname}"/><br><br/>
                Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="lname" value="${data3.lastname}"/><br><br/>
                Age&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="age" value="${data3.age}"/><br><br>
                Gender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:if test="${data3.gender eq 'Male'}">
                    <input type="radio" name="gender" value="Male" checked="checked"/>Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Female" />Female<br /><br/></c:if>
                <c:if test="${data3.gender eq 'Female'}">
                    <input type="radio" name="gender" value="Male" />Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" value="Female" checked="checked"/>Female<br /><br/></c:if>
                Specialization &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="specialization">
                <c:if test="${data3.speciality eq 'general'}">
                    <option value="general"  selected="selected">General</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'general')}">
                    <option value="general">General</option>
                </c:if>
                <c:if test="${data3.speciality eq 'cardiologist'}">
                    <option value="cardiologist"  selected="selected">Cardiologist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'cardiologist')}">
                    <option value="cardiologist">Cardiologist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'dentist'}">
                    <option value="dentist"  selected="selected">Dentist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'dentist')}">
                    <option value="dentist">Dentist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'dermatologist'}">
                    <option value="dermatologist"  selected="selected">Dermatologist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'dermatologist')}">
                    <option value="dermatologist">Dermatologist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'gynaecologist'}">
                    <option value="gynaecologist"  selected="selected">Gynaecologist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'gynaecologist')}">
                    <option value="gynaecologist">Gynaecologist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'neurologist'}">
                    <option value="neurologist"  selected="selected">Neurologist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'neurologist')}">
                    <option value="neurologist">Neurologist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'orthopaedist'}">
                    <option value="orthopaedist"  selected="selected">Orthopaedist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'orthopaedist')}">
                    <option value="orthopaedist">Orthopaedist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'pediatrician'}">
                    <option value="pediatrician"  selected="selected">pediatrician</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'pediatrician')}">
                    <option value="pediatrician">Pediatrician</option>
                </c:if>
                <c:if test="${data3.speciality eq 'radiologist'}">
                    <option value="radiologist"  selected="selected">Radiologist</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'radiologist')}">
                    <option value="radiologist">Radiologist</option>
                </c:if>
                <c:if test="${data3.speciality eq 'surgeon'}">
                    <option value="surgeon"  selected="selected">Surgeon</option>
                </c:if>
                <c:if test="${!(data3.speciality eq 'surgeon')}">
                    <option value="surgeon">Surgeon</option>
                </c:if> 
          </select><br/><br/>
                <input type="submit" value="Save"/>
            </form>
                        <br><hr>
                                </center></c:forEach>
        
    </c:if>
    <c:if test="${v1 eq 'home'}"><center>
            <br><font size='5' color ='black'>${requestScope.msg1}</font>
    </center></c:if>
        <center><br/><br><font size='5' color ='black'>${requestScope.msg}</font></center>
</div>
<div id="Layer4"><center><a href="doctorHome">Home</a></center></div>
<div id="Layer5"><center><a href="doctorNewMsg">Create Message</a></center></div>
<div id="Layer6"><center><a href="doctorInbox">Inbox</a></center></div>
<div id="Layer7"><center><a href="doctorAccount">Account</a></center></div>
<div id="Layer8"><center><a href="doctorUpdate">Update Account</a></center></div>
<div id="Layer9"><center><a href="logout">Log Out</a></center></div>
</body>
</html>

