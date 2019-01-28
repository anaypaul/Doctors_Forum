<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>

<style type="text/css">
#Layer1 {
        background: blanchedalmond;
	position:relative;
	left:500px;
	top:150px;
	width:350px;
	height:300px;
	z-index:1;
        border-width:1px;
        border-style: solid;
	border-color: #663300;
}
#Layer2 {
    position:relative;
    top:150px;
}
</style>
</head>

<body>
	
    <div id="Layer1"><center>
            <h3 align="center">Registration</h3>
        <s:form action="registerData" method="post">
            <s:textfield name="name" label="Username"/>
            <s:password name="pass" label="Password"/>
            <s:password name="pass1" label="Confirm Password"/>
            Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <select name="type">
            <option value="user">User</option>
            <option value="doctor">Doctor</option>
          </select><br/><br/>
          <s:submit value="Register" align="center"/></s:form>
          </center></div>
    <div id="Layer2"><center><br><font size='5' color ='black'>${requestScope.msg}</font></center></div>
</body>

</html>
