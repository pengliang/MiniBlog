<?php
require_once("../common/common.php");
require_once("../common/members_only.php");
require_once("../includes/category.class.php");

page_protect();

session_start();

$user_id = ($_SESSION["user_id"]);
$user_name = ($_SESSION["user_name"]) ;


$category = new Category();
$category->text=$_POST["categoryName"];
$category->user_id=$user_id;
$category->type="article";

if(empty($category->text))
{
	echo "category name cann't null";
}
else if($category->text == 'articleroot')
{
	echo "articleroot 为保留字 ，不能添加。";
}
else if($category->add_category())
{
	if($category_id=$category->find_category($user_id,$category->text,$category->type))
	{
		 
 		$text=htmlentities($category->text, ENT_QUOTES,'UTF-8');
 		//mb_convert_encoding ($text,'HTML-ENTITIES','UTF-8');
 	 	echo "<script>parent.addCallBack('$category_id','$text');</script>";
	}
}
else
{
	echo "add category failed.<br>";
}
?>