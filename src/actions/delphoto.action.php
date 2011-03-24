<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once("../includes/category.class.php");
require_once("../includes/photo.class.php");

page_protect();

 
$user_id =  $_SESSION["user_id"] ;
$user_name = $_SESSION["user_name"]  ;

$photo_id=$_POST["photo_id"];

 
$photo = new Photo();
 
if($photo->delPhoto($photo_id,$user_id))
{
	echo json_encode(array("status" =>"success"));
}
else
{
	echo json_encode(array("status" =>"fail"));
}
?> 
