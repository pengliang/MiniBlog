<?php 
//@reviewed by zj_du
//@email: duzhenjia@hotmail.com	
//@skype:duzhenjia
//@Time: 2009.08.01
//@changed:2009.08.03 by sd-liang@teammersion.com
include("../common/common.php");
require_once "../includes/category.class.php";
include("../common/members_only.php");

page_protect();
 
$userName = $_SESSION["user_name"];
$user_id=$_SESSION['user_id'];

 $smarty->assign('user_name', $user_name);
 
$category = new Category();

if($user_id)
{
	if($albums_list= $category->find_category_lists($user_id,"image"))
	{
		$smarty->assign('albums_list',$albums_list);
 		$smarty->assign('count',count($albums_list));
		$smarty->display('listalbum.tpl');
	}
	else
	{
		echo "获取相册列表失败！";
	}
}
else
{
	echo "<script>alert('请先注册');</script>";
}
  
?>