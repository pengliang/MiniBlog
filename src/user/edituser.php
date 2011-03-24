<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR."user.class.php");

page_protect();
$user_name=$_SESSION["user_name"];
$user_id=$_SESSION["user_id"];

$user=new User($user_name,$user_id);

if($result=$user->find_user_by("id",$user_id))
{
	if($row=mysql_fetch_array($result))
	{
		$smarty->assign("user_name",$row["user_name"]);
		$smarty->assign("email",$row["email"]);
		$smarty->assign("gender",$row["gender"]);
		$smarty->assign("address",$row["address"]);
		$smarty->assign("realname",$row["realname"]);
		$smarty->assign("birthday",$row["birthday"]);
		$smarty->display("edituser.tpl");
	}
	else
	{
		
	}
}

?>

