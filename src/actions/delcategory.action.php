<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once("../includes/category.class.php");

page_protect();

 

$user_id = ($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]) ;


$category = new Category();
$category->text=$_POST["categoryName"];
$category->id=$_POST["categoryId"];

$defaultId=$_POST["defaultId"];

$category->user_id=$user_id;
$category->type="article";

if(empty($category->text))
{
	echo "category name cann't null";
}
else if($category->delete_category_by_id($user_id,$category->id,$defaultId))
{
	echo "<script>parent.delCallBack();</script>";
}
else
{
	echo "delete category failed.<br>";
}
?>