<?php
include("../common/members_only.php");
include("../common/common.php");
require_once(INCLUDES_DIR . 'category.class.php');

page_protect();
session_start();

$user_id = $_SESSION["user_id"];
$user_name = $_SESSION["user_name"];

$smarty->assign('user_name', $user_name);

$category = new Category();

if($user_id)
{
	$default_id = $categorylist.length-1 ;
	
	$categorylists[0]="请选择相册";
	$categorylists[1]="---------";
	
	if($categorylist= $category->find_category_lists($user_id,"image"))
	{
		 
		for($i=0;$i<count($categorylist);$i++)
		{
			$categorylists[$categorylist[$i]["id"]]=$categorylist[$i]["text"];	 
		}
		$smarty->assign('category_options', $categorylists);
		$smarty->assign('default_id',$default_id);
		$smarty->display('listlocation.tpl');
	}
}
else
{
	echo "<script>alert('请先注册');</script>";
}

?>