<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login</title>

<style type="text/css">
#Layer1 {
        background: blanchedalmond;
	position:relative;
	left:500px;
	top:150px;
	width:350px;
	height:250px;
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
    <s:div id="Layer1"><center>
      <h3 align="center">Login</h3>
        <s:form method="post" action="login">
            <s:textfield name="user" label="Username"/><br />
            <s:password name="pass" label="Password"/><br />
            <s:submit value="Log In" align="center"/>
        </s:form>
            <s:form method="post" action="register"><br>
            <s:submit value="Register"/>
        </s:form>
        </center></s:div>
        <div id="Layer2"><center><br><font size='5' color ='black'>${requestScope.msg}</font></center></div>
</body>
</html>
