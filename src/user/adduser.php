<?php include "../common/common.php";?>

<form name="adduser" method="post" action="result.php?action=adduser">
	<b>Username:</b> 
	<input type="text" name="user_name">
	<br>  <br>
	<b>Password :</b>
	<input type="password" name="user_pwd">
	<br>  <br>
	<b>Confirm Password :</b>
	<input type="password" name="user_pwd_conf">
	<br>  <br>
	<input type="submit" name="button" value="Register" > 
	<input type="reset" name="button2" value="Reset">
</form>