<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');

page_protect();
session_start();

$user_id = $_SESSION["user_id"];
$user_name = $_SESSION["user_name"];
$id=$_GET["id"];
$smarty->assign('user_name', $user_name);

$category = new Category();

if($user_id)
{

	$default_id = $id;

	if($categorylist= $category->find_category_lists($user_id,"article"))
	{
		 
		for($i=0;$i<count($categorylist);$i++)
		{
			$categorylists[$categorylist[$i]["id"]]=$categorylist[$i]["text"];
		}
		$smarty->assign('category_options', $categorylists);
		$smarty->assign('category_id',$default_id);
		$smarty->display('addarticle.tpl');
	}

	else
	{
		echo "获取文章列表失败！";
	}
}
else
{
	echo "<script>alert('请先注册');</script>";
}

?>