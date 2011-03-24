<?php
require_once("../common/common.php");
require_once("../includes/user.class.php");

/* begin authentication processing */
$user_name = mysql_real_escape_string($_POST["user_name"]);
$user_pwd = mysql_real_escape_string($_POST["user_pwd"]);

$query_str="select id, user_name from userinfo where user_name='$user_name' and user_pwd='$user_pwd'";
$results=mysql_query($query_str) or die(mysql_error());
$row_nums=mysql_num_rows($results);
// match row found more than 1 - the user is authenticated
if($row_nums>0){
	list($id,$user_name)=mysql_fetch_row($results);
	// set session and log user in
	session_start();
	$_SESSION["user_id"]=$id;
	$_SESSION["user_name"]=$user_name;
	header("Location: ../article/listarticle.php");
}else{
	$msg = urlencode("Invalid Login. Please try again with correct user name and password. ");
	header("Location: login.php?msg=$msg");
}
?>
