<?php
include("../common/members_only.php");
include("../common/common.php");
page_protect();
session_start();
require_once(INCLUDES_DIR.'user.class.php');
$user_id=$_SESSION["user_id"];
$query_str="select user_name, user_pwd, gender, email from userinfo where id='$user_id'";
$results=mysql_query($query_str) or die(mysql_error());
$row_nums=mysql_num_rows($results);
if($row_nums>0){
	list($user_name,$user_pwd, $gender,$email)=mysql_fetch_row($results);
}else{
	echo "main.php error";
}
$smarty->assign("user_name",$user_name);
$smarty->assign("gender",$gender);
$smarty->assign("email",$email);
$smarty->display("myaccount.tpl");
?>

