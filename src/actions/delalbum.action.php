<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once("../includes/category.class.php");

page_protect();

 

$user_id = ($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]) ;

$category = new Category();

$category->id=$_POST["album_id"];
$album_num=$_POST["album_number"];
$category->user_id=$user_id;

$category->type="image";

 
if($category->delete_album_and_images($user_id,$category->id,$album_num))
{
	 echo json_encode(array("status" =>"success"));
}
else
{
	echo json_encode(array("status" =>"fail"));
}

 
?> 
