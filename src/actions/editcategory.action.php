<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once("../includes/category.class.php");

page_protect();

session_start();

$user_id = ($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]) ;


$category = new Category();

$category->id=$_POST['categoryId'];
$category->text=$_POST['categoryName'];


$categoryOldName=$_POST["categoryName_o"];

$category->type="article";

if(empty($category->text))
{
	echo "category name cann't null";
}
else if(($category->text) == ($categoryOldName) )
{
	$text=($category->text);
	echo "<script>parent.ediCallBack('$text');</script>";
}
else if($category->update_category_by_id($category->id))
{
	$text=($category->text);
	echo "<script>parent.ediCallBack('$text');</script>";
}
else
{
	echo "<script>parent.alert('error:'+$category->id);</script>";
	echo "<script>parent.alert('error:'+'$category->text');</script>"; 
}
?>