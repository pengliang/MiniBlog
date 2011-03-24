<?php
require_once("../common/common.php");
require_once("../includes/category.class.php");
require_once("../common/members_only.php");

page_protect();

$user_id=$_SESSION['user_id'];
$user_name=$_SESSION['user_name'];

$category = new Category();
$category->text=$_POST["albumname"];
$category->desc=$_POST["albumdesc"];
$category->type="image";
$category->user_id=$user_id;
$albumId= $_POST["albumId"];
if($category->update_category_by_id($albumId))
{
	$albumName=htmlentities($category->text,ENT_QUOTES,"UTF-8");
	$albumDesc=htmlentities($category->desc,ENT_QUOTES,"UTF-8");
	$album= array("albumId" => "$albumId", "albumName" => $albumName,"albumDesc" => $albumDesc);
	echo json_encode(array("status"=>"success","album"=>$album));

}
else
{
	echo json_encode(array("status"=>"fail"));
}


?>