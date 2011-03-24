<?php

require_once("../common/common.php");
require_once("../common/members_only.php");
page_protect();

$user_id=$_SESSION["user_id"];
$realname=$_POST["realname"];
$email=$_POST["email"];
$address=$_POST["address"];

$query_str="update userinfo set realname='$realname',email='$email',address='$address' where id='$user_id'";

mysql_query($query_str) or die(mysql_error());

if(mysql_affected_rows()>0){
	header("Location: main.php");
}else{
	header("Location: ../templates/error.php");
}

?>
