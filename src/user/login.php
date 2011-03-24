<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MiniBlog </title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body> 
<?php include("../templates/header.html"); ?>
<div id="content" align="center">
  <div id="loginPan" >
    <h2>members <span>login</span></h2>
    <form action="result.php?action=login" method="post">
      <label>UserName</label><input name="user_name" type="text" id="email" />
      <label>Password</label><input name="user_pwd" type="password" id="pass" />
      <input name="Input" type="submit" class="button" value="Login" />
    </form>
    <ul>
      <li class="nonregister">Not a member &nbsp;?</li>
      <li class="register"><a href="register.php">Resister now</a> </li>
    </ul>
  </div>
  <div id="loginBottomPan">&nbsp;</div>
</div>
<?php include("../templates/footer.html"); ?>
</body>
</html>
