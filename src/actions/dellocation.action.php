<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once("../includes/category.class.php");
require_once("../includes/location.class.php");

page_protect();

 
$user_id = ($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]) ;


$location = new Location();
 
$location->id=$_POST["id"];

if($location->delete_location($user_id,$location->id))
{
	echo json_encode(array('status' => 'success'));
}
else
{
	echo json_encode(array('status' => 'error'));
}
?>